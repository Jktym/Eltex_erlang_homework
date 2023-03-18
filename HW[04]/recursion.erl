-module(recursion).
-export([tail_fac/1, duplicate/1]).

tail_fac(N) -> tail_fac(1, N).
tail_fac(N, 0) -> N;
tail_fac(N, Acc) -> tail_fac(N*Acc, Acc - 1).


duplicate([]) -> [];
duplicate(List) ->
  [First | Rest] = List,
  _First = [First],
  List ++ _First,
  duplicate([Rest]),
  List.
