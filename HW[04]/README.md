1) 1> c("converter.erl").
{ok,converter}
2> rr(converter).
[conv_info]
3> converter:rec_to_rub(#conv_info{type = usd, amount = 100, commission = 0.01}).
{ok,7474.5}
4> converter:rec_to_rub(#conv_info{type = peso, amount = 12, commission = 0.02}).
{ok,35.28}
5> converter:rec_to_rub(#conv_info{type = yene, amount = 30, commission = 0.02}).
Can't convert to Rub, {conv_info,yene,30,0.02}
{error,badarg}
6> converter:rec_to_rub(#conv_info{type = euro, amount = -15, commission = 0.02}).
Can't convert to Rub, {conv_info,euro,-15,0.02}
{error,badarg}

2)7> converter: map_to_rub(#{type => usd, amount => 100, commission => 0.01}).
{ok,7474.5}
8> converter: map_to_rub(#{type => peso, amount => 12, commission => 0.02}).
{ok,35.28}
9> converter: map_to_rub(#{type => yene, amount => 30, commission => 0.02}).
Can't convert to Rub, #{amount => 30,commission => 0.02,type => yene}
{error,badarg}
10> converter: map_to_rub(#{type => euro, amount => -15, commission => 0.02}).
Can't convert to Rub, #{amount => -15,commission => 0.02,type => euro}
{error,badarg}


3)1> c("recursion.erl").
{ok,recursion}
2> recursion:tail_fac(5).
120
3> recursion:tail_fac(0).
1
4> recursion:tail_duplicate([1,2,3,4,5,6]).
[1,1,2,2,3,3,4,4,5,5,6,6]
5> recursion:tail_duplicate([]).
[]

4)1> c("recursion.erl").
{ok,recursion}
2> Fac = fun recursion:tail_fac/1.
fun recursion:tail_fac/1
3> Fac(10).
3628800

5.1)
1> Mult = fun(X, Y) -> X * Y end.
#Fun<erl_eval.41.3316493>
2> Mult(10,20).
200

5.2)
1> ToRub = fun ({usd, Amount}) -> {ok, Amount * 75,5}; ({euro, Amount}) -> {ok, Amount * 80}; ({lari, Amount}) -> {ok, Amount * 29}; ({peso, Amount}) -> {ok, Amount * 3}; ({krone, Amount}) -> {ok, Amount * 10} end.
#Fun<erl_eval.42.3316493>
2> ToRub({usd, 100}).
{ok,7500,5}
3> ToRub({peso, 12}).
{ok,36}
4> ToRub({yene, 30}).
** exception error: no function clause matching 
                    erl_eval:'-inside-an-interpreted-fun-'({yene,30}) 
5> ToRub({euro, -15}).
{ok,-1200}
6> 

