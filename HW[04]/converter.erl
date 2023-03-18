-module(converter).
-record(conv_info, {type, amount, commission}).

-export([rec_to_rub/1, map_to_rub/1]).

rec_to_rub(#conv_info{type = usd, amount = Amount, commission = Commission})  when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 75.5,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
rec_to_rub(#conv_info{type = euro, amount = Amount, commission = Commission}) when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 80,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
rec_to_rub(#conv_info{type = lari, amount = Amount, commission = Commission}) when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 29,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
rec_to_rub(#conv_info{type = peso, amount = Amount, commission = Commission}) when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 3,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
rec_to_rub(#conv_info{type = krone, amount = Amount, commission = Commission}) when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 10,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
rec_to_rub(_Error) ->
  io:format("Can't convert to Rub, ~p~n", [_Error]),
  {error, badarg}.


map_to_rub(#{type := usd, amount := Amount, commission := Commission})
  when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 75.5,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
map_to_rub(#{type := euro, amount := Amount, commission := Commission})
  when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 80,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
map_to_rub(#{type := lari, amount := Amount, commission := Commission})
  when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 29,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
map_to_rub(#{type := peso, amount := Amount, commission := Commission})
  when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 3,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
map_to_rub(#{type := krone, amount := Amount, commission := Commission})
  when is_integer(Amount), Amount > 0 ->
  ConvAmount = Amount * 10,
  CommissionResult = ConvAmount * Commission,
  {ok, ConvAmount - CommissionResult};
map_to_rub(_Error) ->
  io:format("Can't convert to Rub, ~p~n", [_Error]),
  {error, badarg}.

%Mult = fun(X, Y) ->X*Y end.