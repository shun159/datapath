-ifndef(OPENVSWITCH_H).
-define(OPENVSWITCH_H, 1).

-compile({parse_transform, eenum}).

%% From /usr/include/linux/openvswitch.h

-define(NLMSG_MIN_TYPE, 16#10).

%% Datapaths.
-define(OVS_DATAPATH_FAMILY,  "ovs_datapath").
-define(OVS_DATAPATH_MCGROUP, "ovs_datapath").

%% First OVS datapath version to support features
-define(OVS_DP_VER_FEATURES,  2)

%% Packet transfer.
-define(OVS_PACKET_FAMILY, "ovs_packet").

%% Virtual ports.
-define(OVS_VPORT_FAMILY,  "ovs_vport").
-define(OVS_VPORT_MCGROUP, "ovs_vport").

%% Flows
-define(OVS_FLOW_FAMILY,  "ovs_flow").
-define(OVS_FLOW_MCGROUP, "ovs_flow").

%% Meters
-define(OVS_METER_FAMILY,  "ovs_meter").
-define(OVS_METER_MCGROUP, "ovs_meter").

%% Conntrack Limit
-define(OVS_CT_LIMIT_FAMILY,  "ovs_ct_limit").
-define(OVS_CT_LIMIT_MCGROUP, "ovs_ct_limit").

%% reserved static generic netlink identifiers:

-define(GENL_ID_GENERATE,  0).
-define(GENL_ID_CTRL,      ?NLMSG_MIN_TYPE).
-define(GENL_ID_VFS_DQUOT, 16#11).
-define(GENL_ID_PMCRAID,   16#12).

-enum({genl_id,
       [{generate,  ?GENL_ID_GENERATE},
        {ctrl,      ?GENL_ID_CTRL},
        {vfs_dquot, ?GENL_ID_VFS_DQUOT},
        {pmcraid,   ?GENL_ID_PMCRAID}]
      }).

-define(CTRL_CMD_UNSPEC,       0).
-define(CTRL_CMD_NEWFAMILY,    1).
-define(CTRL_CMD_DELFAMILY,    2).
-define(CTRL_CMD_GETFAMILY,    3).
-define(CTRL_CMD_NEWOPS,       4).
-define(CTRL_CMD_DELOPS,       5).
-define(CTRL_CMD_GETOPS,       6).
-define(CTRL_CMD_NEWMCAST_GRP, 7).
-define(CTRL_CMD_DELMCAST_GRP, 8).

-enum({ctrl_cmd,
       [{unspec,       ?CTRL_CMD_UNSPEC},
        {newfamily,    ?CTRL_CMD_NEWFAMILY},
        {delfamily,    ?CTRL_CMD_DELFAMILY},
        {getfamily,    ?CTRL_CMD_GETFAMILY},
        {newops,       ?CTRL_CMD_NEWOPS},
        {delops,       ?CTRL_CMD_DELOPS},
        {getops,       ?CTRL_CMD_GETOPS},
        {newmcast_grp, ?CTRL_CMD_NEWMCAST_GRP},
        {delmcast_grp, ?CTRL_CMD_DELMCAST_GRP}]
      }).

-define(CTRL_ATTR_UNSPEC,        0).
-define(CTRL_ATTR_FAMILY_ID,     1).
-define(CTRL_ATTR_FAMILY_NAME,   2).
-define(CTRL_ATTR_VERSION,       3).
-define(CTRL_ATTR_HDRSIZE,       4).
-define(CTRL_ATTR_MAXATTR,       5).
-define(CTRL_ATTR_OPS,           6).
-define(CTRL_ATTR_MCAST_GROUPS,  7).

-enum({ctrl_attr,
       [{unspec,       ?CTRL_ATTR_UNSPEC},
        {family_id,    ?CTRL_ATTR_FAMILY_ID},
        {family_name,  ?CTRL_ATTR_FAMILY_NAME},
        {version,      ?CTRL_ATTR_VERSION},
        {hdrsize,      ?CTRL_ATTR_HDRSIZE},
        {maxattr,      ?CTRL_ATTR_MAXATTR},
        {opts,         ?CTRL_ATTR_OPS},
        {mcast_groups, ?CTRL_ATTR_MCAST_GROUPS}]
      }).

-define(CTRL_ATTR_MCAST_GRP_UNSPEC, 0).
-define(CTRL_ATTR_MCAST_GRP_NAME,   1).
-define(CTRL_ATTR_MCAST_GRP_ID,     2).

-enum({ctrl_attr_mcast_grp,
       [{unspec, ?CTRL_ATTR_MCAST_GRP_UNSPEC},
        {name,   ?CTRL_ATTR_MCAST_GRP_NAME},
        {id,     ?CTRL_ATTR_MCAST_GRP_ID}]
      }).

-define(OVS_DATAPATH_VERSION, 2).
-define(OVS_VPORT_VERSION,    1).
-define(OVS_FLOW_VERSION,     1).
-define(OVS_PACKET_VERSION,   1).
-define(OVS_METER_VERSION,    1).
-define(OVS_CT_LIMIT_VERSION, 1).

-define(OVS_DP_CMD_UNSPEC,  0).
-define(OVS_DP_CMD_NEW,     1).
-define(OVS_DP_CMD_DEL,     2).
-define(OVS_DP_CMD_GET,     3).
-define(OVS_DP_CMD_SET,     4).

-enum({ovs_datapath_cmd,
       [{unspec, ?OVS_DP_CMD_UNSPEC},
        {new,    ?OVS_DP_CMD_NEW},
        {del,    ?OVS_DP_CMD_DEL},
        {get,    ?OVS_DP_CMD_GET},
        {set,    ?OVS_DP_CMD_SET}]
      }).

-define(OVS_DP_ATTR_UNSPEC,         0).
-define(OVS_DP_ATTR_NAME,           1).
-define(OVS_DP_ATTR_UPCALL_PID,     2).
-define(OVS_DP_ATTR_STATS,          3).
-define(OVS_DP_ATTR_MEGAFLOW_STATS, 4).
-define(OVS_DP_ATTR_USER_FEATURES,  5).

-enum({ovs_datapath_attr,
       [{unspec,         ?OVS_DP_ATTR_UNSPEC},
        {name,           ?OVS_DP_ATTR_NAME},
        {upcall_pid,     ?OVS_DP_ATTR_UPCALL_PID},
        {stats,          ?OVS_DP_ATTR_STATS},
        {megaflow_stats, ?OVS_DP_ATTR_MEGAFLOW_STATS},
        {user_features,  ?OVS_DP_ATTR_USER_FEATURES}]
      }).

-define(OVS_DP_F_UNALIGNED,  1).
-define(OVS_DP_F_VPORT_PIDS, 2).

-enum({ovs_datapath_f,
       [{unaligned,  ?OVS_DP_F_UNALIGNED},
        {vport_pids, ?OVS_DP_F_VPORT_PIDS}]
      }).

-define(OVS_VPORT_CMD_UNSPEC, 0).
-define(OVS_VPORT_CMD_NEW,    1).
-define(OVS_VPORT_CMD_DEL,    2).
-define(OVS_VPORT_CMD_GET,    3).
-define(OVS_VPORT_CMD_SET,    4).

-enum({ovs_vport_cmd,
       [{unspec, ?OVS_VPORT_CMD_UNSPEC},
        {new,    ?OVS_VPORT_CMD_NEW},
        {del,    ?OVS_VPORT_CMD_DEL},
        {get,    ?OVS_VPORT_CMD_GET},
        {set,    ?OVS_VPORT_CMD_SET}]
      }).

-define(OVS_VPORT_ATTR_UNSPEC,  0).
-define(OVS_VPORT_ATTR_PORT_NO,  1).
-define(OVS_VPORT_ATTR_TYPE,  2).
-define(OVS_VPORT_ATTR_NAME,  3).
-define(OVS_VPORT_ATTR_OPTIONS,  4).
-define(OVS_VPORT_ATTR_UPCALL_PID,  5).
-define(OVS_VPORT_ATTR_STATS,  6).

-enum({ovs_vport_attr,
       [{unspec,     ?OVS_VPORT_ATTR_UNSPEC},
        {port_no,    ?OVS_VPORT_ATTR_PORT_NO},
        {type,       ?OVS_VPORT_ATTR_TYPE},
        {name,       ?OVS_VPORT_ATTR_NAME},
        {options,    ?OVS_VPORT_ATTR_OPTIONS},
        {upcall_pid, ?OVS_VPORT_ATTR_UPCALL_PID},
        {stats,      ?OVS_VPORT_ATTR_STATS}]
      }).

-define(OVS_VXLAN_EXT_UNSPEC, 0).
-define(OVS_VXLAN_EXT_GBP,    1).
-define(OVS_VXLAN_EXT_GPE,    8)

-enum({ovs_vxlan_ext,
       [{unspec, ?OVS_VXLAN_EXT_UNSPEC},
        {gbp,    ?OVS_VXLAN_EXT_GBP},
        {gpe,    ?OVS_VXLAN_EXT_GPE}]
      }).

-define(OVS_VPORT_TYPE_UNSPEC,   0).
-define(OVS_VPORT_TYPE_NETDEV,   1).
-define(OVS_VPORT_TYPE_INTERNAL, 2).
-define(OVS_VPORT_TYPE_GRE,      3).
-define(OVS_VPORT_TYPE_VXLAN,    4).
-define(OVS_VPORT_TYPE_GENEVE,   5).

-enum({ovs_vport_type,
       [{unspec,   ?OVS_VPORT_TYPE_UNSPEC},
        {netdev,   ?OVS_VPORT_TYPE_NETDEV},
        {internal, ?OVS_VPORT_TYPE_INTERNAL},
        {gre,      ?OVS_VPORT_TYPE_GRE},
        {vxlan,    ?OVS_VPORT_TYPE_VXLAN},
        {geneve,   ?OVS_VPORT_TYPE_GENEVE}]
      }).

-define(OVS_TUNNEL_ATTR_UNSPEC,     0).
-define(OVS_TUNNEL_ATTR_DST_PORT,   1).
-define(OVS_TUNNEL_ATTR_EXTENSION,  2).

-enum({ovs_tunnel_attr,
       [{unspec,    ?OVS_TUNNEL_ATTR_UNSPEC},
        {dst_port,  ?OVS_TUNNEL_ATTR_DST_PORT},
        {extension, ?OVS_TUNNEL_ATTR_EXTENSION}]
      }).

-define(OVS_FLOW_CMD_UNSPEC, 0).
-define(OVS_FLOW_CMD_NEW,    1).
-define(OVS_FLOW_CMD_DEL,    2).
-define(OVS_FLOW_CMD_GET,    3).
-define(OVS_FLOW_CMD_SET,    4).

-enum({ovs_flow_cmd,
       [{unspec, ?OVS_FLOW_CMD_UNSPEC},
        {new,    ?OVS_FLOW_CMD_NEW},
        {del,    ?OVS_FLOW_CMD_DEL},
        {get,    ?OVS_FLOW_CMD_GET},
        {set,    ?OVS_FLOW_CMD_SET}]
      }).

-define(OVS_FRAG_TYPE_NONE,  0).
-define(OVS_FRAG_TYPE_FIRST, 1).
-define(OVS_FRAG_TYPE_LATER, 2).

-enum({ovs_flag_type,
       [{none,  ?OVS_FRAG_TYPE_NONE},
        {first, ?OVS_FRAG_TYPE_FIRST},
        {later, ?OVS_FRAG_TYPE_LATER}]
      }).

-define(OVS_FLOW_ATTR_UNSPEC,    0).
-define(OVS_FLOW_ATTR_KEY,       1).
-define(OVS_FLOW_ATTR_ACTIONS,   2).
-define(OVS_FLOW_ATTR_STATS,     3).
-define(OVS_FLOW_ATTR_TCP_FLAGS, 4).
-define(OVS_FLOW_ATTR_USED,      5).
-define(OVS_FLOW_ATTR_CLEAR,     6).
-define(OVS_FLOW_ATTR_MASK,      7).

-enum({ovs_flow_attr,
       [{unspec,    ?OVS_FLOW_ATTR_UNSPEC},
        {key,       ?OVS_FLOW_ATTR_KEY},
        {actions,   ?OVS_FLOW_ATTR_ACTIONS},
        {stats,     ?OVS_FLOW_ATTR_STATS},
        {tcp_flags, ?OVS_FLOW_ATTR_TCP_FLAGS},
        {used,      ?OVS_FLOW_ATTR_USED},
        {clear,     ?OVS_FLOW_ATTR_CLEAR},
        {mask,      ?OVS_FLOW_ATTR_MASK}]
      }).

-define(OVS_NSH_KEY_ATTR_UNSPEC, 0).
-define(OVS_NSH_KEY_ATTR_BASE,   1).
-define(OVS_NSH_KEY_ATTR_MD1,    2).
-define(OVS_NSH_KEY_ATTR_MD2,    3).

-enum({ovs_nsh_key_attr,
       [{unspec, ?OVS_NSH_KEY_ATTR_UNSPEC},
        {base,   ?OVS_NSH_KEY_ATTR_BASE},
        {md1,    ?OVS_NSH_KEY_ATTR_MD1},
        {md2,    ?OVS_NSH_KEY_ATTR_MD2}]
      }).

-define(OVS_CS_F_NEW,         16#01).
-define(OVS_CS_F_ESTABLISHED, 16#02).
-define(OVS_CS_F_RELATED,     16#04).
-define(OVS_CS_F_REPLY_DIR,   16#08).
-define(OVS_CS_F_INVALID,     16#10).
-define(OVS_CS_F_TRACKED,     16#20).
-define(OVS_CS_F_SRC_NAT,     16#40).
-define(OVS_CS_F_DST_NAT,     16#80).
-define(OVS_CS_F_NAT_MASK, (?OVS_CS_F_SRC_NAT bor ?OVS_CS_F_DST_NAT)).

-define(OVS_KEY_ATTR_UNSPEC,             0).
-define(OVS_KEY_ATTR_ENCAP,              1).
-define(OVS_KEY_ATTR_PRIORITY,           2).
-define(OVS_KEY_ATTR_IN_PORT,            3).
-define(OVS_KEY_ATTR_ETHERNET,           4).
-define(OVS_KEY_ATTR_VLAN,               5).
-define(OVS_KEY_ATTR_ETHERTYPE,          6).
-define(OVS_KEY_ATTR_IPV4,               7).
-define(OVS_KEY_ATTR_IPV6,               8).
-define(OVS_KEY_ATTR_TCP,                9).
-define(OVS_KEY_ATTR_UDP,                10).
-define(OVS_KEY_ATTR_ICMP,               11).
-define(OVS_KEY_ATTR_ICMPV6,             12).
-define(OVS_KEY_ATTR_ARP,                13).
-define(OVS_KEY_ATTR_ND,                 14).
-define(OVS_KEY_ATTR_SKB_MARK,           15).
-define(OVS_KEY_ATTR_TUNNEL,             16).
-define(OVS_KEY_ATTR_SCTP,               17).
-define(OVS_KEY_ATTR_TCP_FLAGS,          18).
-define(OVS_KEY_ATTR_DP_HASH,            19).
-define(OVS_KEY_ATTR_RECIRC_ID,          20).
-define(OVS_KEY_ATTR_MPLS,               21).
-define(OVS_KEY_ATTR_CT_STATE,           22).
-define(OVS_KEY_ATTR_CT_ZONE,            23).
-define(OVS_KEY_ATTR_CT_MARK,            24).
-define(OVS_KEY_ATTR_CT_LABELS,          25).
-define(OVS_KEY_ATTR_CT_ORIG_TUPLE_IPV4, 26).
-define(OVS_KEY_ATTR_CT_ORIG_TUPLE_IPV6, 27).
-define(OVS_KEY_ATTR_NSH,                28).

-enum({ovs_key_attr,
       [{unspec,             ?OVS_KEY_ATTR_UNSPEC},
        {encap,              ?OVS_KEY_ATTR_ENCAP},
        {priority,           ?OVS_KEY_ATTR_PRIORITY},
        {in_port,            ?OVS_KEY_ATTR_IN_PORT},
        {ethernet,           ?OVS_KEY_ATTR_ETHERNET},
        {vlan,               ?OVS_KEY_ATTR_VLAN},
        {ethertype,          ?OVS_KEY_ATTR_ETHERTYPE},
        {ipv4,               ?OVS_KEY_ATTR_IPV4},
        {ipv6,               ?OVS_KEY_ATTR_IPV6},
        {tcp,                ?OVS_KEY_ATTR_TCP},
        {udp,                ?OVS_KEY_ATTR_UDP},
        {icmp,               ?OVS_KEY_ATTR_ICMP},
        {icmpv6,             ?OVS_KEY_ATTR_ICMPV6},
        {arp,                ?OVS_KEY_ATTR_ARP},
        {nd,                 ?OVS_KEY_ATTR_ND},
        {skb_mark,           ?OVS_KEY_ATTR_SKB_MARK},
        {tunnel,             ?OVS_KEY_ATTR_TUNNEL},
        {sctp,               ?OVS_KEY_ATTR_SCTP},
        {tcp_flags,          ?OVS_KEY_ATTR_TCP_FLAGS},
        {dp_hash,            ?OVS_KEY_ATTR_DP_HASH},
        {recirc_id,          ?OVS_KEY_ATTR_RECIRC_ID},
        {mpls,               ?OVS_KEY_ATTR_MPLS},
        {ct_state,           ?OVS_KEY_ATTR_CT_STATE},
        {ct_zone,            ?OVS_KEY_ATTR_CT_ZONE},
        {ct_mark,            ?OVS_KEY_ATTR_CT_MARK},
        {ct_labels,          ?OVS_KEY_ATTR_CT_LABELS},
        {ct_orig_tuple_ipv4, ?OVS_KEY_ATTR_CT_ORIG_TUPLE_IPV4},
        {ct_orig_tuple_ipv6, ?OVS_KEY_ATTR_CT_ORIG_TUPLE_IPV6}]
      }).

-define(OVS_CT_ATTR_UNSPEC,       0).
-define(OVS_CT_ATTR_COMMIT,       1).
-define(OVS_CT_ATTR_ZONE,         2).
-define(OVS_CT_ATTR_MARK,         3).
-define(OVS_CT_ATTR_LABELS,       4).
-define(OVS_CT_ATTR_HELPER,       5).
-define(OVS_CT_ATTR_NAT,          6).
-define(OVS_CT_ATTR_FORCE_COMMIT, 7).
-define(OVS_CT_ATTR_EVENTMASK,    8).

-enum({ovs_ct_attr,
       [{unspec,       ?OVS_CT_ATTR_UNSPEC},
        {commit,       ?OVS_CT_ATTR_COMMIT},
        {zone,         ?OVS_CT_ATTR_ZONE},
        {mark,         ?OVS_CT_ATTR_MARK},
        {lables,       ?OVS_CT_ATTR_LABELS},
        {helper,       ?OVS_CT_ATTR_HELPER},
        {nat,          ?OVS_CT_ATTR_NAT},
        {force_commit, ?OVS_CT_ATTR_FORCE_COMMIT},
        {event_mask,   ?OVS_CT_ATTR_EVENTMASK}]
      }).

-define(OVS_NAT_ATTR_UNSPEC,       0).
-define(OVS_NAT_ATTR_SRC,          1).
-define(OVS_NAT_ATTR_DST,          2).
-define(OVS_NAT_ATTR_IP_MIN,       3).
-define(OVS_NAT_ATTR_IP_MAX,       4).
-define(OVS_NAT_ATTR_PROTO_MIN,    5).
-define(OVS_NAT_ATTR_PROTO_MAX,    6).
-define(OVS_NAT_ATTR_PERSISTENT,   7).
-define(OVS_NAT_ATTR_PROTO_HASH,   8).
-define(OVS_NAT_ATTR_PROTO_RANDOM, 9).

-enum({ovs_nat_attr,
       [{unspec,       ?OVS_NAT_ATTR_UNSPEC},
        {src,          ?OVS_NAT_ATTR_SRC},
        {dst,          ?OVS_NAT_ATTR_DST},
        {ip_min,       ?OVS_NAT_ATTR_IP_MIN},
        {ip_max,       ?OVS_NAT_ATTR_IP_MAX},
        {proto_min,    ?OVS_NAT_ATTR_PROTO_MIN},
        {proto_max,    ?OVS_NAT_ATTR_PROTO_MAX},
        {persistent,   ?OVS_NAT_ATTR_PERSISTENT},
        {proto_hash,   ?OVS_NAT_ATTR_PROTO_HASH},
        {proto_random, ?OVS_NAT_ATTR_PROTO_RANDOM}]
      }).

-define(OVS_TUNNEL_KEY_ATTR_ID,            0).
-define(OVS_TUNNEL_KEY_ATTR_IPV4_SRC,      1).
-define(OVS_TUNNEL_KEY_ATTR_IPV4_DST,      2).
-define(OVS_TUNNEL_KEY_ATTR_TOS,           3).
-define(OVS_TUNNEL_KEY_ATTR_TTL,           4).
-define(OVS_TUNNEL_KEY_ATTR_DONT_FRAGMENT, 5).
-define(OVS_TUNNEL_KEY_ATTR_CSUM,          6).
-define(OVS_TUNNEL_KEY_ATTR_OAM,           7).
-define(OVS_TUNNEL_KEY_ATTR_GENEVE_OPTS,   8).
-define(OVS_TUNNEL_KEY_ATTR_TP_SRC,        9).
-define(OVS_TUNNEL_KEY_ATTR_TP_DST,       10).
-define(OVS_TUNNEL_KEY_ATTR_VXLAN_OPTS,   11).
-define(OVS_TUNNEL_KEY_ATTR_IPV6_SRC,     12).
-define(OVS_TUNNEL_KEY_ATTR_IPV6_DST,     13).

-enum({ovs_tunnel_key_attr,
       [{id,            ?OVS_TUNNEL_KEY_ATTR_ID},
        {ipv4_src,      ?OVS_TUNNEL_KEY_ATTR_IPV4_SRC},
        {ipv4_dst,      ?OVS_TUNNEL_KEY_ATTR_IPV4_DST},
        {tos,           ?OVS_TUNNEL_KEY_ATTR_TOS},
        {ttl,           ?OVS_TUNNEL_KEY_ATTR_TTL},
        {dont_fragment, ?OVS_TUNNEL_KEY_ATTR_DONT_FRAGMENT},
        {csum,          ?OVS_TUNNEL_KEY_ATTR_CSUM},
        {oam,           ?OVS_TUNNEL_KEY_ATTR_OAM},
        {geneve_opts,   ?OVS_TUNNEL_KEY_ATTR_GENEVE_OPTS},
        {tp_src,        ?OVS_TUNNEL_KEY_ATTR_TP_SRC},
        {tp_dst,        ?OVS_TUNNEL_KEY_ATTR_TP_DST},
        {vxlan_opts,    ?OVS_TUNNEL_KEY_ATTR_VXLAN_OPTS},
        {ipv6_src,      ?OVS_TUNNEL_KEY_ATTR_IPV6_SRC},
        {ipv6_dst,      ?OVS_TUNNEL_KEY_ATTR_IPV6_DST}]
      }).

-define(OVS_ACTION_ATTR_UNSPEC,      0).
-define(OVS_ACTION_ATTR_OUTPUT,      1).
-define(OVS_ACTION_ATTR_USERSPACE,   2).
-define(OVS_ACTION_ATTR_SET,         3).
-define(OVS_ACTION_ATTR_PUSH_VLAN,   4).
-define(OVS_ACTION_ATTR_POP_VLAN,    5).
-define(OVS_ACTION_ATTR_SAMPLE,      6).
-define(OVS_ACTION_ATTR_RECIRC,      7).
-define(OVS_ACTION_ATTR_HASH,        8).
-define(OVS_ACTION_ATTR_PUSH_MPLS,   9).
-define(OVS_ACTION_ATTR_POP_MPLS,    10).
-define(OVS_ACTION_ATTR_SET_MASKED,  11).
-define(OVS_ACTION_ATTR_CT,          12).
-define(OVS_ACTION_ATTR_TRUNC,       13).
-define(OVS_ACTION_ATTR_PUSH_ETH,    14).
-define(OVS_ACTION_ATTR_POP_ETH,     15).
-define(OVS_ACTION_ATTR_CT_CLEAR,    16).
-define(OVS_ACTION_ATTR_PUSH_NSH,    17).
-define(OVS_ACTION_ATTR_POP_NSH,     18).
-define(OVS_ACTION_ATTR_METER,       19).
-define(OVS_ACTION_ATTR_TUNNEL_PUSH, 20).
-define(OVS_ACTION_ATTR_TUNNEL_POP,  21).
-define(OVS_ACTION_ATTR_CLONE,       22).

-enum({ovs_action_attr,
       [{unspec,      ?OVS_ACTION_ATTR_UNSPEC},
        {output,      ?OVS_ACTION_ATTR_OUTPUT},
        {userspace,   ?OVS_ACTION_ATTR_USERSPACE},
        {set,         ?OVS_ACTION_ATTR_SET},
        {push_vlan,   ?OVS_ACTION_ATTR_PUSH_VLAN},
        {pop_vlan,    ?OVS_ACTION_ATTR_POP_VLAN},
        {sample,      ?OVS_ACTION_ATTR_SAMPLE},
        {recirc,      ?OVS_ACTION_ATTR_RECIRC},
        {hash,        ?OVS_ACTION_ATTR_HASH},
        {push_mpls,   ?OVS_ACTION_ATTR_PUSH_MPLS},
        {pop_mpls,    ?OVS_ACTION_ATTR_POP_MPLS},
        {set_masked,  ?OVS_ACTION_ATTR_SET_MASKED},
        {ct,          ?OVS_ACTION_ATTR_CT},
        {trunc,       ?OVS_ACTION_ATTR_TRUNC},
        {push_eth,    ?OVS_ACTION_ATTR_PUSH_ETH},
        {pop_eth,     ?OVS_ACTION_ATTR_POP_ETH},
        {ct_clear,    ?OVS_ACTION_ATTR_CT_CLEAR},
        {push_nsh,    ?OVS_ACTION_ATTR_PUSH_NSH},
        {pop_nsh,     ?OVS_ACTION_ATTR_POP_NSH},
        {meter,       ?OVS_ACTION_ATTR_METER},
        {tunnel_push, ?OVS_ACTION_ATTR_TUNNEL_PUSH},
        {tunnel_pop,  ?OVS_ACTION_ATTR_TUNNEL_POP},
        {clone,       ?OVS_ACTION_ATTR_CLONE}]
      }).

-define(OVS_USERSPACE_ATTR_UNSPEC,          0).
-define(OVS_USERSPACE_ATTR_PID,             1).
-define(OVS_USERSPACE_ATTR_USERDATA,        2).
-define(OVS_USERSPACE_ATTR_EGRESS_TUN_PORT, 3).
-define(OVS_USERSPACE_ATTR_EGRESS_ACTIONS,  4).

-enum({ovs_userspace_attr,
       [{unspec,          ?OVS_USERSPACE_ATTR_UNSPEC},
        {pid,             ?OVS_USERSPACE_ATTR_PID},
        {userdata,        ?OVS_USERSPACE_ATTR_USERDATA},
        {egress_tun_port, ?OVS_USERSPACE_ATTR_EGRESS_TUN_PORT},
        {egress_actions,  ?OVS_USERSPACE_ATTR_EGRESS_ACTIONS}]
      }).

-define(OVS_PACKET_CMD_UNSPEC,  0).
-define(OVS_PACKET_CMD_MISS,    1).
-define(OVS_PACKET_CMD_ACTION,  2).
-define(OVS_PACKET_CMD_EXECUTE, 3).

-enum({ovs_packet_cmd,
       [{unspec,  ?OVS_PACKET_CMD_UNSPEC},
        {miss,    ?OVS_PACKET_CMD_MISS},
        {action,  ?OVS_PACKET_CMD_ACTION},
        {execute, ?OVS_PACKET_CMD_EXECUTE}]
      }).

-define(OVS_PACKET_ATTR_UNSPEC,         0).
-define(OVS_PACKET_ATTR_PACKET,         1).
-define(OVS_PACKET_ATTR_KEY,            2).
-define(OVS_PACKET_ATTR_ACTIONS,        3).
-define(OVS_PACKET_ATTR_USERDATA,       4).
-define(OVS_PACKET_ATTR_EGRESS_TUN_KEY, 5).
-define(OVS_PACKET_ATTR_UNUSED1,        6).
-define(OVS_PACKET_ATTR_UNUSED2,        7).
-define(OVS_PACKET_ATTR_PROBE,          8).
-define(OVS_PACKET_ATTR_MRU,            9).
-define(OVS_PACKET_ATTR_LEN,           10).

-enum({ovs_packet_attr,
       [{unspec,         ?OVS_PACKET_ATTR_UNSPEC},
        {packet,         ?OVS_PACKET_ATTR_PACKET},
        {key,            ?OVS_PACKET_ATTR_KEY},
        {actions,        ?OVS_PACKET_ATTR_ACTIONS},
        {userdata,       ?OVS_PACKET_ATTR_USERDATA},
        {egress_tun_key, ?OVS_PACKET_ATTR_EGRESS_TUN_KEY},
        {unused1,        ?OVS_PACKET_ATTR_UNUSED1},
        {unused2,        ?OVS_PACKET_ATTR_UNUSED2},
        {probe,          ?OVS_PACKET_ATTR_PROBE},
        {mru,            ?OVS_PACKET_ATTR_MRU},
        {len,            ?OVS_PACKET_ATTR_LEN}]
      }).

-define(OVS_METER_CMD_UNSPEC,   0).
-define(OVS_METER_CMD_FEATURES, 1).
-define(OVS_METER_CMD_SET,      2).
-define(OVS_METER_CMD_DEL,      3).
-define(OVS_METER_CMD_GET,      4).

-enum({ovs_meter_cmd,
       [{unspec,   ?OVS_METER_CMD_UNSPEC},
        {features, ?OVS_METER_CMD_FEATURES},
        {set,      ?OVS_METER_CMD_SET},
        {del,      ?OVS_METER_CMD_DEL},
        {get,      ?OVS_METER_CMD_GET}]
      }).

-define(OVS_METER_ATTR_UNSPEC,     0).
-define(OVS_METER_ATTR_ID,         1).
-define(OVS_METER_ATTR_KBPS,       2).
-define(OVS_METER_ATTR_STATS,      3).
-define(OVS_METER_ATTR_BANDS,      4).
-define(OVS_METER_ATTR_USED,       5).
-define(OVS_METER_ATTR_CLEAR,      6).
-define(OVS_METER_ATTR_MAX_METERS, 7).
-define(OVS_METER_ATTR_MAX_BANDS,  8).
-define(OVS_METER_ATTR_PAD,        9).

-enum({ovs_meter_attr,
       [{unspec,    ?OVS_METER_ATTR_UNSPEC},
        {id,        ?OVS_METER_ATTR_ID},
        {kbps,      ?OVS_METER_ATTR_KBPS},
        {stats,     ?OVS_METER_ATTR_STATS},
        {bands,     ?OVS_METER_ATTR_BANDS},
        {used,      ?OVS_METER_ATTR_USED},
        {clear,     ?OVS_METER_ATTR_CLEAR},
        {maxmeters, ?OVS_METER_ATTR_MAX_METERS},
        {max_bands, ?OVS_METER_ATTR_MAX_BANDS},
        {pad,       ?OVS_METER_ATTR_PAD}]
      }).

-endif.
