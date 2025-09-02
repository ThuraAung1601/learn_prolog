isPrime(2) :- !.
isPrime(N) :-
    N > 2,
    \+ has_factor(N, 2).

has_factor(N, F) :-
    F * F =< N,
    (N mod F =:= 0 -> true          % divisor found → succeed
    ; F1 is F + 1, has_factor(N, F1)
    ).