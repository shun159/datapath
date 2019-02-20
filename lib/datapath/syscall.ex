defmodule Datapath.Syscall do
  @moduledoc """
  enum and its utils
  """

  @type u32 :: 0..0xFFFFFFFF
  @type u64 :: 0..0xFFFFFFFFFFFFFFFF

  defdelegate get_enum_name(enum, value),
    to: :datapath_syscall

  defdelegate get_enum_value(enum, atom),
    to: :datapath_syscall

  defdelegate binary_to_flags(enum, binary),
    to: :datapath_syscall

  defdelegate strip_string(binary),
    to: :datapath_syscall

  defdelegate pad_to(width, binary),
    to: :datapath_syscall

  defmodule OvsHeader do
    @moduledoc false
    defstruct [:dp_if_index]
    @type t :: %OvsHeader{dp_if_index: :: u32()}
  end

  defmodule OvsDpStats do
    @moduledoc false

    defstruct(
      # Number of flow table matches
      n_hit: 0,
      # Number of flow table misses
      n_missed: 0,
      # Number of misses not sent to userspace
      n_lost: 0,
      # Number of flows present
      n_flows: 0
    )

    @type t :: %OvsDpStats{
            n_hit: :: u64(),
            n_missed: :: u64(),
            n_lost: :: u64(),
            n_flows: :: u64()
          }
  end

  defmodule OvsFlowStats do
    @moduledoc false

    defstruct(
      # Number of matched packets
      n_packets: 0,
      # Number of matched bytes
      n_bytes: 0
    )

    @type t :: %OvsFlowStats{
      n_packets: :: u64(),
      n_bytes: :: u64()
    }
  end

  defmodule OvsDpMegaflowStats do
    @moduledoc false

    defstruct(
      # Number of masks used for flow lookups
      n_mask_hit: 0,
      # Number of masks for the datapath
      n_masks: 0
    )

    @type t :: %OvsDpMegaflowStats{
      n_mask_hit: :: u64(),
      n_masks: :: u64()
    }
  end

  defmodule OvsVportStats do
    @moduledoc false

    defstruct(
      # total packets received
      rx_packets: 0,
      # total packets transmitted
      tx_packets: 0,
      # total bytes received
      rx_bytes: 0,
      # total bytes transmitted
      tx_bytes: 0,
      # bad packets received
      rx_errors: 0,
      # packet transmit problems
      tx_errors: 0,
      # no space in linux buffers
      rx_dropped: 0,
      # no space available in linux
      tx_dropped: 0
    )

    @type t :: %OvsVportStats{
      rx_packets: :: u64(),
      tx_packets: :: u64(),
      rx_bytes: :: u64(),
      tx_bytes: :: u64(),
      rx_errors: :: u64(),
      tx_errors: :: u64(),
      rx_dropped: :: u64(),
      tx_dropped: :: u64()
    }
  end
end
