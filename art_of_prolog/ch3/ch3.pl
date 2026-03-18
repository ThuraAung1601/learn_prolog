natural_num(1).
natural_num(1+X) :- natural_num(X).

member(H, [H|_]).
member(X, [_|T]) :- member(X, T).

reverse([], []).
reverse([H|T], L1) :- reverse(T, L2), append(L2, [H], L1).

reverse1(L1, L2) :- reverse1(L1, [], L2). % initi the accumulator
reverse1([H|T], Accu, L2) :- reverse1(T, [H|Accu], L2). % manipulate the accumulator
reverse1([], L2, L2). % the accumulated result will be saved in L2

% double(L, LL) 
double([], []).
double([H|T], [H, H| LL]) :- double(T, LL).

plus(X, Y, Z) :- Z is X + Y.
% sum(LofInt, Sum)
sum([], 0).
sum([H|T], Sum) :- sum(T, Sum1), Sum is H + Sum1.

% delete(List, X, ListWithNoX)
delete([], _, []).
delete([H|T], H, L) :- delete(T, H, L), !.
delete([H|T], X, [H|L]) :- X \= H, delete(T, X, L), !.

% selects
selects(X, [X|T], T).
selects(X, [H|T], [H|L]) :- selects(X, T, L), !.

insert(X, L1, L2) :- selects(X, L2, L1), !.
add_element(X, L1, [X|L1]).

permutation([], []).
permutation(L, [H|T]) :-
    select(H, L, R),
    permutation(R, T).

% add_one(X, L1, L2)
add_one(_, [], []).
add_one(X, [X|T], [Y|R]) :- 
    Y is X + 1,
    add_one(X, T, R).
add_one(X, [H|T], [H|R]) :-
    H \= X,
    add_one(X, T, R).

% substitute(X, Y, L1, L2)
substitute(_, _, [], []) :- !.
substitute(X, Y, [X|T], [Y|R]) :- substitute(X, Y, T, R), !.
substitute(X, Y, [H|T], [H|R]) :- H \= X, substitute(X, Y, T, R), !.

% remove Even
remove_even([], []) :- !.
remove_even([H1|T1], L2) :- 
    0 is H1 mod 2,
    remove_even(T1, L2), !.
remove_even([H1|T1], [H1|L2]) :-
    1 is H1 mod 2,
    remove_even(T1, L2), !.

% is member
is_member(_, []) :- !.
is_member(H, [H|_]) :- !.
is_member(X, [H|T]) :- X \= H, is_member(X, T).

% remove duplicate in a list
% remove x from the list
remove_x(_, [], []).
remove_x(X, [X|T], L) :- remove_x(X, T, L).
remove_x(X, [H|T], [H|L]) :- X \= H, remove_x(X, T, L).

no_doubles([], []) :- !.
no_doubles([H|T], [H|L]) :-
    is_member(H, T),
    remove_x(H, T, T1),
    no_doubles(T1, L), !.

% factorial
factorial(0, 1) :- !.
factorial(1, 1) :- !.
factorial(N, R) :-
    N1 is N - 1,
    factorial(N1, R1),
    R is N * R1, !.

factorial(0, 1) :- !.
factorial(1, 1) :- !.
factorial(N, R) :-
    N >= 2,
    N1 is N - 1,
    factorial(N1, R1),
    R is N * R1, !.

fibbo(0, 0) :- !.
fibbo(1, 1) :- !.
fibbo(N, Result) :-
    N1 is N - 1,
    N2 is N - 2,
    fibbo(N1, R1),
    fibbo(N2, R2),
    Result is R1 + R2, !.