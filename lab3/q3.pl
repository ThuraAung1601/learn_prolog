% If list is empty, nothing to remove — no remainder.
split([], _, [], []).

% If N = 1: remove the first element, remainder is T
split([_Remove|T], 0, [], T).

% Otherwise keep head and recurse with N-1
split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).