% No. 2
likes(john, ai).
likes(tom, ipad).
likes(tom, prolog).
likes(mary, ai).
is_friend_of(X, Y) :-
    likes(X, Z),
    likes(Y, Z).
/* 
    ?- is_friend_of(A, B).
    A = B, B = john ;
    A = john,
    B = mary ;
    A = B, B = tom ;
    A = B, B = tom ;
    A = mary,
    B = john ;
    A = B, B = mary.
*/

% ---------------------------------

% No. 3
connect(b, a).
connect(b, d).
connect(d, c).
path(A, B) :- connect(A, B).
path(A, B) :- path(A, C), connect(C, B), !.

% ---------------------------------

% No. 4
is_expression([_Op, Op1, Op2]) :- number(Op1), number(Op2).
prefix2infix([], []).
prefix2infix([H1, H2|T], [H2, H1|L]) :-
    \+ number(H1),
    \+ is_expression(H2),
    prefix2infix(T, L).
prefix2infix([H1, H2|T], [H2L, H1|L]) :-
    \+ number(H1),
    is_expression(H2),
    prefix2infix(H2, H2L),
    prefix2infix(T, L).
prefix2infix([H1|T], [H1|L]) :-
    number(H1),
    prefix2infix(T, L).