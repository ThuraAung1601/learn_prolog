% is_member(X, List)
is_member(H, [H|_T]).
is_member(X, [_|T]) :-
    is_member(X, T).

remove_duplication([], []).
remove_duplication([X], [X]).
remove_duplication([H|T], L) :-
    is_member(H, T),
    remove_duplication(T, L).
remove_duplication([H|T], [H|L]) :-
    \+ is_member(H, T),
    remove_duplication(T, L).

% Union union(L1, L2, U)
union([], L, L).
union(L1, L2, U) :-
    append(L1, L2, L),
    remove_duplication(L, U).

% Intersection intersection(L1, L2, I) = find_common
intersection([], _, []).
intersection([H|T], L2, [H|I]) :-
    is_member(H, L2), 
    intersection(T, L2, I).
intersection([H|T], L2, I) :-
    \+ is_member(H, L2),
    intersection(T, L2, I).

% Difference
difference([], _, []).
difference([H|T], L2, [H|I]) :-
    \+ is_member(H, L2), 
    difference(T, L2, I).
difference([H|T], L2, I) :-
    is_member(H, L2),
    difference(T, L2, I).

% Symmetric Difference
sym_difference(L1, L2, L) :-
    difference(L1, L2, L12),
    difference(L2, L1, L21),
    union(L12, L21, L).