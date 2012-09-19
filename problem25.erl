-module(problem25).

-export([start/0]).

fib_gen(Prev1, Prev2, Acc) ->
  Curr = Prev1 + Prev2,
  case erlang:length(erlang:integer_to_list(Curr)) of
    1000 -> Acc;
    _Else -> fib_gen(Prev2, Curr, Acc + 1)
  end.

start() ->
  io:format("~p~n", [fib_gen(1,1,3)]).
