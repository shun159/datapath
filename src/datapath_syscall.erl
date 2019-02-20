-module(datapath_syscall).

-include("../include/datapath_syscall.hrl").

-export([get_enum_name/2,
         get_enum_value/2,
         binary_to_flags/2,
         strip_string/1,
         pad_to/2]).

get_enum_name(Enum, Value) ->
    %% TODO: Check if it's not larger than max
    case Value of
        _ when is_integer(Value) ->
            try
                to_atom(Enum, Value)
            catch
                throw:bad_enum ->
                    Value
            end;
        _ ->
            {error, invalid_enum}
    end.

get_enum_value(Enum, Atom) when is_atom(Atom) ->
    try
        to_int(Enum, Atom)
    catch
        throw:bad_enum ->
            Atom
    end;
get_enum_value(_, Int) when is_integer(Int) ->
    Int.

binary_to_flags(Type, Binary) ->
    BitSize = bit_size(Binary),
    <<Integer:BitSize>> = Binary,
    binary_to_flags(Type, Integer, BitSize - 1, []).

binary_to_flags(Type, Integer, Bit, Flags) when Bit >= 0 ->
    case 0 /= (Integer band (1 bsl Bit)) of
        true ->
            Flag = to_atom(Type, Bit),
            binary_to_flags(Type, Integer, Bit - 1, [Flag | Flags]);

        false ->
            binary_to_flags(Type, Integer, Bit - 1, Flags)
    end;
binary_to_flags(_, _, _, Flags) ->
    Flags.

strip_string(Binary) ->
    strip_string(Binary, size(Binary) - 1).

strip_string(Binary, Byte) when Byte >= 0 ->
    case binary:at(Binary, Byte) of
        0 -> strip_string(Binary, Byte - 1);
        _ -> binary:part(Binary, 0, Byte + 1)
    end;
strip_string(_, _) ->
    <<>>.

pad_to(Width, Binary) ->
    case pad_length(Width, size(Binary)) of
        0 -> Binary;
        N -> <<Binary/binary, 0:(N*8)>>
    end.

pad_length(Width, Length) ->
    (Width - Length rem Width) rem Width.
