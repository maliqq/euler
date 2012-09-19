-module(problem14).

-export([start/0]).

sequence(1) -> [1];
sequence(N) ->
  if
    N rem 2 == 0 -> [N | sequence(N div 2)];
    true -> [N | sequence(N * 3 + 1)]
  end.

sequence(1, Count) -> Count;
sequence(N, Count) ->
  if
    N rem 2 == 0 -> sequence(N div 2, Acc + 1);
    true -> sequence(N * 3 + 1, Acc + 1)
  end.

-define(MAX, 1000000).

sequence() ->
  Result = lists:map(fun(N) ->
    {sequence(N, 0), N}
  end, lists:seq(1, ?MAX)),
  element(2, lists:last(lists:keysort(1, Result))).

start() ->
  io:format("~p~n", [sequence()]).
