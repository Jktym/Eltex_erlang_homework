-module(person).
-export([filter/2, all/2, any/2, update/2, get_average_age/1]).


filter(Fun, Persons) ->
  lists:filter(Fun, Persons).
all(Fun, Persons) ->
  lists:all(Fun, Persons).
any(Fun, Persons) ->
  lists:any(Fun, Persons).
update(Fun, Persons) ->
  lists:map(Fun, Persons).
get_average_age({_AgeSum, PersonsCount}) when PersonsCount =:= 0 ->
  io:format("Error, list is empty"),
  {error, badarg};
get_average_age({AgeSum, PersonsCount})->
  {AgeSum, PersonsCount} = lists:foldl(fun() -> AgeSum/PersonsCount end, {0,0}).

%Persons = [#person{id = 1, name = "Bob", age = 23, gender = male},#person{id = 2, name = "Kate", age = 20, gender = female}, #person{id = 3, name = "jack", age = 34, gender = male}, #person{id = 4, name = "Nata", age = 54, gender = female}].