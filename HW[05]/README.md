1)
1> c("person.erl").
{ok,person}
2> rr("person.hrl").
[person]
3> Persons = [#person{id = 1, name = "Bob", age = 23, gender = male},#person{id = 2, name = "Kate", age = 20, gender = female}, #person{id = 3, name = "jack", age = 34, gender = male}, #person{id = 4, name = "Nata", age = 54, gender = female}].
[#person{id = 1,name = "Bob",age = 23,gender = male},
 #person{id = 2,name = "Kate",age = 20,gender = female},
 #person{id = 3,name = "jack",age = 34,gender = male},
 #person{id = 4,name = "Nata",age = 54,gender = female}]
4> person:filter(fun(#person{age = Age}) -> Age >= 30 end, Persons).
[#person{id = 3,name = "jack",age = 34,gender = male},
 #person{id = 4,name = "Nata",age = 54,gender = female}]
5> person:filter(fun(#person{gender = Gender}) -> Gender =:= male end, Persons).
[#person{id = 1,name = "Bob",age = 23,gender = male},
 #person{id = 3,name = "jack",age = 34,gender = male}]
6> person:any(fun(#person{gender = Gender}) -> Gender =:= female end, Persons).
true
7> person:all(fun(#person{age = Age}) -> Age >= 20 end, Persons).
true
8> person:all(fun(#person{age = Age}) -> Age =< 30 end, Persons).
false
9> UpdateJackAge = fun(#person{name = "jack", age = Age} = Person) -> Person#person{age = Age + 1}; (Person) -> Person end.
#Fun<erl_eval.42.3316493>
15> person:update(UpdateJackAge, Persons).
[#person{id = 1,name = "Bob",age = 23,gender = male},
 #person{id = 2,name = "Kate",age = 20,gender = female},
 #person{id = 3,name = "jack",age = 35,gender = male},
 #person{id = 4,name = "Nata",age = 54,gender = female}]
16> UpdateFemaleAge = fun(#person{gender = female, age = Age} = Person) -> Person#person{age = Age - 1}; (Person) -> Person end.
#Fun<erl_eval.42.3316493>
17> person:update(UpdateFemaleAgeAge, Persons).
* 1:15: variable 'UpdateFemaleAgeAge' is unbound
18> person:update(UpdateFemaleAge, Persons).
[#person{id = 1,name = "Bob",age = 23,gender = male},
 #person{id = 2,name = "Kate",age = 19,gender = female},
 #person{id = 3,name = "jack",age = 34,gender = male},
 #person{id = 4,name = "Nata",age = 53,gender = female}]

2)
1>List = lists:seq(1,10).
[1,2,3,4,5,6,7,8,9,10]
2> [X || X <- List, X rem 3 == 0].
[3,6,9]
3> f(List).
ok
4> List = [1, "hello", 100, boo, "boo", 9].
[1,"hello",100,boo,"boo",9]
5> [X*X || X <- List, is_integer(X) ].
[1,10000,81]

3)
1> c("exceptions.erl").
{ok,exceptions}
2> exceptions:catch_all(fun() -> 1/0 end).
Action #Fun<erl_eval.43.3316493> failed, reason badarith
error
3> exceptions:catch_all(fun() -> throw(custom_exeptions) end).
Action #Fun<erl_eval.43.3316493> failed, reason custom_exeptions
throw
4> exceptions:catch_all(fun() -> exit(killed) end).
Action #Fun<erl_eval.43.3316493> failed, reason killed
exit
5> exceptions:catch_all(fun() -> erlang:error(runtime_exception) end).
Action #Fun<erl_eval.43.3316493> failed, reason runtime_exception
error
