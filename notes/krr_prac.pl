likes(john, mary).
likes(mary, bew).
likes(mary, hla).
likes(X, Y) :- 
    likes(X, Z), 
    likes(Z, Y).

love(X, X).
love(bew, mary).
love(john, X) :- love(X, mary).

owns(john, book).
owns(john, book(wiki, lily)).

% =:= ==
% =\= !=
% is 
% =< >=
% \+

even_or_not(Num, odd) :- \+(0 is Num mod 2), !.
% Without cut it will give both odd and even for 5
% even_or_not(Num, odd) :- \+(0 is Num mod 2).
even_or_not(5, even) :- !.
even_or_not(_, even).

% List
% [Head|[Tail]]

first([H|_T], H).

% first_two([1, 2, 3], X). => [1, 2]

first_two([H], [H]).
first_two([H1, H2|_T], [H1, H2]).

islist([]).
islist([_H|T]) :- islist(T).
% islist([_H|_T]).

at_least_two([_H1, _H2|_T]).

% give me first two element
at_least_two([H1, H2|_T], [H1, H2]).
at_least_two([H1, H2|_T], X, Y):- X = H1, Y = H2.

factorial(0, 1) :- !.
factorial(1, 1) :- !.
factorial(N, Fac) :-
    N > 1,
    N2 is N - 1,
    factorial(N2, Fac2),
    Fac is N * Fac2,
    !.

is_member(H, [H|_T]).
is_member(X, [_H|T]) :- is_member(X, T), !.


remove_duplication([], []).
remove_duplication([H|T], R) :-
    is_member(H, T),
    remove_duplication(T, R), !.
remove_duplication([H|T], [H|R]) :-
    \+ is_member(H, T),
    remove_duplication(T, R), !.

% reverse([1, 2, 3]) -> [3, 2, 1]
reverse([], []).
reverse([H|T], RL) :-
    reverse(T, RT),
    append(RT, [H], RL).

% append([1], [2, 3, 4], R).

find_common([], _, []).
find_common([H1|T1], L2, [H1|Common]) :-
    is_member(H1, L2), 
    find_common(T1, L2, Common).
find_common([H1|T1], L2, Common) :-
    \+ is_member(H1, L2),
    find_common(T1, L2, Common).

% ======= Past Paper =======

find_difference([], _, []).
find_difference([H1|T1], L2, Diff) :-
    is_member(H1, L2),
    find_difference(T1, L2, Diff).
find_difference([H1|T1], L2, [H1|Diff]) :-
    \+ is_member(H1, L2),
    find_difference(T1, L2, Diff).
    
symmetric_difference(L1, L2, SDiff_set) :-
    find_difference(L1, L2, Dif1),
    find_difference(L2, L1, Dif2),
    append(Dif1, Dif2, SDiff),
    remove_duplication(SDiff, SDiff_set).
