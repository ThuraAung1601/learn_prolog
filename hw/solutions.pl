% ------------- no1 ------------------
% remove_duplication(List1, List2)
is_member_of(X, [X|_]).
is_member_of(X, [_|T]) :- is_member_of(X, T).

remove_duplication([], []).
remove_duplication([H|T], R) :-
    is_member_of(H, T),
    remove_duplication(T, R).

remove_duplication([H|T], [H|R]) :-
    \+ is_member_of(H, T),
    remove_duplication(T, R).

% ------------- no2 ------------------
% appending RT infront of [H] gives R
% append([1, 2, 3], [0], R).
% R = [1, 2, 3, 0].

% reverse(List, Reversed)
reverse([], []).
reverse([X], [X]).
% reverse([H|T], [R|H]) :- reverse(T, R).
reverse([H|T], R) :- 
    reverse(T, RT),
    append(RT, [H], R).

% ------------- no3 ------------------
% can also use merge sort
merge([], [], []).
merge([X], [], [X]).
merge([], [X], [X]).
merge(L1, L2, Result) :-
    append(L1, L2, R),
    sort(R, Result).

% ------------- no4 ------------------
find_common([], _, []).
find_common([H1|T1], L2, [H1|Common]) :-
    is_member_of(H1, L2),
    find_common(T1, L2, Common).
find_common([H1|T1], L2, Common) :-
    \+ is_member_of(H1, L2),
    find_common(T1, L2, Common).

% ------------- no5 ------------------

find_max([], [], -inf).
find_max(L1, L2, Max) :- 
    merge(L1, L2, Merged),
    reverse(Merged, [Max|_]).