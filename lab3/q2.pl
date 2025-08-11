% User-facing predicate
remove_very_three(List, NewList) :-
    remove_very_three(List, 1, NewList).

% Base case
remove_very_three([], _, []).

% Case 1: Position divisible by 3 -> skip element
remove_very_three([_H|T], Pos, NewTail) :-
    Pos mod 3 =:= 0, % 0 is Pos mod 3
    Pos1 is Pos + 1,
    remove_very_three(T, Pos1, NewTail).

% Case 2: Position not divisible by 3 -> keep element
remove_very_three([H|T], Pos, [H|NewTail]) :-
    Pos mod 3 =\= 0,
    Pos1 is Pos + 1,
    remove_very_three(T, Pos1, NewTail).
