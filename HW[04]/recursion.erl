-module(recursion).
-export([tail_fac/1, tail_duplicate/1]).

tail_fac(N) -> tail_fac(1, N).
tail_fac(N, 0) -> N;
tail_fac(N, Acc) -> tail_fac(N*Acc, Acc - 1).

%duplicate(List) -> List;
%duplicate([]) -> [];
%duplicate([First | Rest]) ->
%  First ++ duplicate(Rest).

tail_duplicate(List) -> tail_duplicate(List, List).
tail_duplicate(List,[]) -> lists:sort(List);
tail_duplicate(List, [First | Rest]) ->
  tail_duplicate(List ++ [First], Rest).

