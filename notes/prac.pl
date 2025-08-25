/* males */
male(john).
male(oliver).
male(ali).
male(james).
male(jack).
male(harry).

/* females */
female(helen).
female(sophie).
female(mary).
female(sue).

/* relations */
parent(john, mary). /* john is parent of mary */
parent(john, sue).
parent(oliver, james).
parent(ali, jack).
parent(james, harry).
parent(helen, mary).
parent(helen, sue).
parent(sophie, james).
parent(mary, jack).
parent(sue, harry).

father(X, Y) :- 
    male(X), parent(X, Y).

mother(X, Y) :-
    female(X), parent(X, Y).

grandfather(X, Y) :-
    father(X, Z), parent(Z, Y).

grandmother(X, Y) :-
    mother(X, Z), parent(Z, Y).

sibling(X, Y) :-
    parent(Z, X), parent(Z, Y).

sister(X, Y) :-
    female(X), sibling(X, Y).

brother(X, Y) :-
    male(X), sibling(X, Y).

uncle(X, Y) :-
    brother(X, Z), parent(Z, Y).

aunt(X, Y) :-
    sister(X, Z), parent(Z, Y).

person(thura, 179, 102).
person(john, 180, 75).
person(mary, 165, 50).

calculate_bmi(Name, BMI_Value) :- 
    person(Name, Height, Weight),
    Height_m is Height / 100,
    BMI_Value is Weight / (Height_m * Height_m).

bmi_meaning(BMI_Value, Meaning) :-
    BMI_Value < 18.5 -> Meaning = underweight;
    BMI_Value < 25.0 -> Meaning = normalweight;
    BMI_Value < 30.0 -> Meaning = overweight;
    Meaning = obese.

bmi_meaning2(BMI_Value, underweight) :- BMI_Value < 18.5.
bmi_meaning2(BMI_Value, normalweight) :- BMI_Value < 25.0.
bmi_meaning2(BMI_Value, overweight) :- BMI_Value < 30.0.
bmi_meaning2(_, obese).

point(pA, 0, 0).
point(pB, 10, 10).

distance(P1, P2, Dist) :-
    point(P1, X1, Y1), point(P2, X2, Y2),
    Dist is sqrt(((X2 - X1)*(X2 - X1)) + ((Y2 - Y1)*(Y2 - Y1))).

% -------------------------------

len_list([], 0).
len_list([_|T], Length) :-
    len_list(T, L1),
    Length is L1 + 1.

% -------------------------------

index_of([H|_T], H, 0).
index_of([_|T], Num, Index) :-
    index_of(T, Num, Index1),
    Index is Index1 + 1.

% -------------------------------

remove_very_three(List, NewList) :- 
    remove_very_three(List, 1, NewList).

remove_very_three([], _, []).
% skip
remove_very_three([_H|T], Pos, NewTail) :-
    Pos mod 3 =:= 0,
    Pos1 is Pos + 1,
    remove_very_three(T, Pos1, NewTail).

% not skip
remove_very_three([H|T], Pos, [H|NewTail]) :-
    Pos mod 3 =\= 0,
    Pos1 is Pos + 1,
    remove_very_three(T, Pos1, NewTail).

% -------------------------------

extract_even_num([], []).

extract_even_num([H|T], [H|Result]) :-
    H mod 2 =:= 0,
    extract_even_num(T, Result).

extract_even_num([H|T], Result) :-
    H mod 2 =\= 0,
    extract_even_num(T, Result).

% ----------------------

% extract_even_index(List, Result)

extract_even_index(List, Result) :-
    extract_even_index(List, 0, Result).

extract_even_index([], _, []).

% skip ===> pos not even -> skip
extract_even_index([_H|T], Pos, NewTail) :- 
    Pos mod 2 =\= 0,
    Pos1 is Pos + 1,
    extract_even_index(T, Pos1, NewTail).

% add
extract_even_index([H|T], Pos, [H|NewTail]) :-
    Pos mod 2 =:= 0,
    Pos1 is Pos + 1,
    extract_even_index(T, Pos1, NewTail).

% ---------------------
% [1, 2, 3, 4, 5], 3 ===> [1, 2] [3, 4, 5]
% [1, 2, 3, 4, 5], 5 ===> [1, 2, 3, 4] [5]
% [1, 2, 3, 4, 5], 6 ===> [1, 2, 3, 4] []

split_from_num([], _, [], []).
split_from_num([H|T], Num, [H|L1], L2) :-
    H =\= Num,
    split_from_num(T, Num, L1, L2).
split_from_num([H|T], Num, [], [H|T]) :-
    H =:= Num.

% ---------------------
index_of([H|_], H, 0).
index_of([_|T], Num, Index) :-
    Index = Index1 + 1,
    index_of(T, Num, Index1).