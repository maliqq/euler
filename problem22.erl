-module(problem22).

-export([start/0]).

-define(ALPHA, lists:seq($A, $Z)).

score_str(Str) ->
  lists:foldl(fun(Chr, Sum) -> Sum + string:str(?ALPHA, [Chr]) end, 0, Str).

score(S) ->
  {Scores, _} = lists:mapfoldl(fun(Str, I) ->
    {score_str(Str) * I, I + 1}
  end, 1, S),

  lists:foldl(fun(Score, Sum) -> Sum + Score end, 0, Scores).

start() ->
  {ok, Binary} = file:read_file("22.txt"),
  
  L = lists:map(fun(Term) ->
    S = erlang:length(Term) - 2,
    <<"\"", String:S/binary, "\"">> = erlang:list_to_binary(Term),
    binary:bin_to_list(String)
  end, string:tokens(binary:bin_to_list(Binary), ",")),

  Sum = score(lists:sort(L)),
  
  io:format("~p~n", [Sum]).
