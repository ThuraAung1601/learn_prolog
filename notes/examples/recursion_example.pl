% factorial
factorial(Num, Fac) :-
  Num =< 1 -> Fac is 1;
  N1 is Num - 1,
  factorial(N1, F1),
  Fac is Num * F1.

% ---------------------------------------------

% successor of Num
num(0). % 0 is a number
num(succ(N)) :- num(N). % successor of a number is a number
% Concept: 0 is a number and successor of 0 is 1 therefore 1 is a number.

% ---------------------------------------------

% family
father(bob, alice). % bob is father of alice
mother(sue, james).
mother(sue, alice).
mother(ann, sue).

dad(X, Y) :- father(X, Y).

% one-line for parent
parent(X, Y) :- father(X, Y) ; mother(X, Y).

% another way for parent
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).

child(X, Y) :- parent(Y, X). 

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- ancestor(X, Z), ancestor(Z, Y).

% ---------------------------------------------

% bipartitle or not ?

% ---------------------------------------------

% List manipulation
% func([H|T], [H2|T2])

% [1, 2, 3] ==> [2, 4, 6]
double_list([], []).
double_list([H|T], [H2|T2]) :- 
  H2 is H * 2, 
  double_list(T, T2).

% [1, 2] ==> [1, 1, 2, 2]
duplicate_list([], []). 
duplicate_list([H|T], [H, H | T2]) :- duplicate_list(T, T2).

% ---------------------------------------------

% nextto/3 - 2 elements appear next to each other in a list
nextto([X, Y|_], X, Y).
nextto([_|T], X, Y) :- nextto(T, X, Y).

% sumlist/2 - sum of elements of a list
sumlist([], 0).
sumlist([H|T], Sum) :-
  Sum is H + SumT,
  sumlist(T, SumT).

% sumfirst_x/3 - sum the first three elements
% sumfirst_x(List, X, Sum)
sumfirst_x([], _, 0).
sumfirst_x(_, 0, 0).
sumfirst_x([H|T], X, Sum) :-
  X1 is X - 1,
  sumfirst_x(T, X1, SumT),
  Sum is H + SumT.

% remove other elements
remove_eo([], []).
remove_eo([X], [X]).
remove_eo([H, _|T], [H|T2]) :- remove_eo(T, T2).
