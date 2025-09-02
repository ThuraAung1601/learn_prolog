:- dynamic step/1.

hanoi(N) :-
    retractall(step(_)),       % clear previous moves
    move(N, left, right, center).

move(1, From, To, _) :-
    assertz(step([From, To])).
move(N, From, To, Aux) :-
    N > 1,
    M is N - 1,
    move(M, From, Aux, To),
    assertz(step([From, To])),
    move(M, Aux, To, From).