1)
1> c("protocol.erl").
{ok,protocol}
2> rr("protocol.hrl").
[ipv4]
3> DataWrongFormat = <<4:4, 6:4, 0:8, 0:3>>.
<<70,0,0:3>>
4> protocol:do_ipv4(fun() -> protocol:ipv4(DataWrongFormat) end).
Action field, reason function_clauseok
5> DataWrongVer = <<6:4, 6:4, 0:8, 232:16, 0:16, 0:3, 0:13, 0:8, 0:8, 0:16, 0:32, 0:32, 0:32,
  "hello" >>.
<<102,0,0,232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,
  101,108,108,111>>
6> protocol:do_ipv4(fun() -> protocol:ipv4(DataWrongVer) end).
Action field, reason function_clauseok
7> Data1 = <<4:4, 6:4, 0:8, 232:16, 0:16, 0:3, 0:13, 0:8, 0:8, 0:16, 0:32, 0:32, 0:32, "hello" >>.
<<70,0,0,232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,
  101,108,108,111>>
8> protocol:do_ipv4(fun() -> protocol:ipv4(Data1) end).
Recieved data <<"hello">> 
#ipv4{version = 4,ihl = 6,tos = 0,total_length = 232,
      identification = 0,flags = 0,fragOffset = 0,timeToLive = 0,
      protocol = 0,checksum = 0,sourceAddress = 0,
      destinationAddress = 0,
      optionsAndPadding = <<0,0,0,0>>,
      data = <<"hello">>}
9> Data2 = <<4:4, 6:4, 0:8, 175:16, 0:16, 0:3, 0:13, 0:8, 0:8, 0:16, 0:32, 0:32, 0:32, "hello" >>.
<<70,0,0,175,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,104,
  101,108,108,111>>
10> protocol:do_ipv4(fun() -> protocol:ipv4(Data2) end).
Recieved data <<"hello">> 
#ipv4{version = 4,ihl = 6,tos = 0,total_length = 175,
      identification = 0,flags = 0,fragOffset = 0,timeToLive = 0,
      protocol = 0,checksum = 0,sourceAddress = 0,
      destinationAddress = 0,
      optionsAndPadding = <<0,0,0,0>>,
      data = <<"hello">>}
2)
14> spawn(protocol, do_ipv4, [(fun() -> protocol:ipv4(Data1) end)]).
Recieved data <<"hello">> 
<0.105.0>
15> self().
<0.103.0>
16> spawn(protocol, do_ipv4, [(fun() -> protocol:ipv4(DataWrongFormat) end)]).
Action field, reason function_clause<0.108.0>
17> self().
<0.103.0>
