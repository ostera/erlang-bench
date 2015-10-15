-module(caesar_cipher).

-compile(export_all).

-include("bench.hrl").

-define(PART, "Veni, vidi, vici.").
-define(PART_COUNT, 10000).
-define(TRIALS, 1000).

bench_it() ->
  Str = lists:concat(lists:duplicate(?PART_COUNT, ?PART)),

  bench("cipher_recursive", fun() ->
        cipher_recursive(Str)
    end, ?TRIALS),

  bench("cipher_comprehension", fun() ->
        cipher_comprehension(Str)
    end, ?TRIALS).

cipher_recursive(Str) -> cipher_recursive(Str, []).

cipher_recursive([H|T], L) when H >= 97, H =< 122 ->
  cipher_recursive(T, [to_cipher(H)|L]);
cipher_recursive([H|T], L) ->
  cipher_recursive(T, [H|L]);
cipher_recursive([], L) -> lists:reverse(L).


cipher_comprehension(Str) -> [ to_cipher(C) || C <- Str ].

to_cipher(C) when C >= 97, C =< 122 ->
  C-32;
to_cipher(Char) ->
  Char.


