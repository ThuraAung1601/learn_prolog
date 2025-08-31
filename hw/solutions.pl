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

% ------------- no3 merge sort ------------------
% merge2(Uns1, Uns2, MergedSorted)
merge2(Uns1, Uns2, Merged) :-
    append(Uns1, Uns2, Combined),  % Step 1: combine lists
    merge_sort(Combined, Merged).  % Step 2: sort the result

% merge_sort(List, SortedList)
merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    split(List, L1, L2),
    merge_sort(L1, SortedL1),
    merge_sort(L2, SortedL2),
    merge_sorted(SortedL1, SortedL2, Sorted).

% split(List, FirstHalf, SecondHalf)
split([], [], []).
split([X], [X], []).
split([X,Y|Rest], [X|Xs], [Y|Ys]) :-
    split(Rest, Xs, Ys).

% merge_sorted(Sorted1, Sorted2, Merged)
merge_sorted([], L, L).
merge_sorted(L, [], L).
merge_sorted([X|Xs], [Y|Ys], [X|Zs]) :-
    X =< Y,
    merge_sorted(Xs, [Y|Ys], Zs).
merge_sorted([X|Xs], [Y|Ys], [Y|Zs]) :-
    X > Y,
    merge_sorted([X|Xs], Ys, Zs).

% ------------- no4 ------------------
find_common([], _, []).
find_common([H1|T1], L2, [H1|Common]) :-
    is_member_of(H1, L2),
    find_common(T1, L2, Common).
find_common([H1|T1], L2, Common) :-
    \+ is_member_of(H1, L2),
    find_common(T1, L2, Common).

% ------------- no5 ------------------
list_max([H], H).
list_max([H|T], M) :-
    list_max(T, MT),
    (H >= MT -> M is H ; M is MT).

find_max(L1, L2, Max) :-
    list_max(L1, L1Max),
    list_max(L2, L2Max),
    (L1Max >= L2Max -> Max is L1Max ; Max is L2Max).