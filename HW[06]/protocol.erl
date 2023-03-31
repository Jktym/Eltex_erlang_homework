-module(protocol).
-include("protocol.hrl").
-export([ipv4/1, do_ipv4/1]).


ipv4(<<Version:4, IHL: 4, ToS: 8, TotalLenght: 16, Identification: 16, Flags: 3, FragOffset: 13,
  TimeToLive: 8, Protocol: 8, Checksum: 16, SourceAddress: 32, DestinationAddress: 32,
  OptionsAndPadding:((IHL-5)*32)/bits, RemaningData/bytes>>) when Version =:=4 ->
  io:format("Recieved data ~p ~n", [RemaningData]),
  #ipv4{version = Version, ihl = IHL, tos = ToS, total_length = TotalLenght, identification = Identification,
    flags = Flags, fragOffset = FragOffset, timeToLive = TimeToLive, protocol = Protocol, checksum = Checksum,
    sourceAddress = SourceAddress, destinationAddress = DestinationAddress, optionsAndPadding = OptionsAndPadding,
    data = RemaningData}.

do_ipv4(Action) ->
  try Action()
    catch
      _: Reason ->
      io:format("Action field, reason ~p ~n", [Reason])
  end.