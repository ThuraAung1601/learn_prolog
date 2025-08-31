% merge sort
% split
% sort
% merge 

merge(Uns1, Uns2, Merged) :-
    append(Uns1, Uns2, Combined),
    % sort(Combined, Merged).
    merge_sort(Combined, Merged).

split([], [], []).
split([X], [X], []).
split([X,Y|T], [X|L1], [Y|L2]) :-
    split(T, L1, L2).

merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    split(List, L1, L2),
    merge_sort(L1, SortedL1),
    merge_sort(L2, SortedL2),
    merged_sorting(SortedL1, SortedL2, Sorted).

merged_sorting([], L2, L2).
merged_sorting(L1, [], L1).
merged_sorting([H1|T1], [H2|L2], [H1|L]) :-
    H1 < H2,
    merged_sorting(T1, [H2|L2], L).
merged_sorting([H1|T1], [H2|T2], [H2|L]) :-
    H1 >= H2,
    merged_sorting([H1|T1], T2, L).

% --------------------
is_member(H, [H|_]).
is_member(X, [_|T]) :- 
    is_member(X, T).

reverse([], []).
reverse([X], [X]).
reverse([H|T], R) :-
    reverse(T, RT),
    append(RT, [H], R).

append2([], L, L).
append2([H|T], L2, [H|L]) :-
    append2(T, L2, L).

list_max([H], H).
list_max([H|T], M) :-
    list_max(T, MT),
    (H >= MT -> M is H ; M is MT).

maximum(L1, L2, Max) :-
    list_max(L1, L1Max),
    list_max(L2, L2Max),
    (L1Max >= L2Max -> Max is L1Max ; Max is L2Max).

last_element(List, Last) :- reverse(List, [Last|_]).

kth_element([H|_], 1, H).
kth_element([_|T], K, Result) :-
    K > 0,
    K1 is K - 1,
    kth_element(T, K1, Result).

len_list([], 0).
len_list([_H], 1).
len_list([_|T], Length) :- 
    len_list(T, TL),
    Length is TL + 1.

palindrome(L) :- reverse(L, L).

is_list([]).
is_list([_|_]).

my_flatten([], []).
my_flatten([H|T], [H|L]) :-
    \+ is_list(H),
    my_flatten(T, L).
my_flatten([H|T], L) :-
    is_list(H),
    my_flatten(H, Hflatten),
    my_flatten(T, Tflatten),
    append(Hflatten, Tflatten, L).

remove_very_three(List, NewList) :-
    remove_very_three(List, 1, NewList).

remove_very_three([], _, []).
remove_very_three([_H|T], K, L) :-
    K mod 3 =:= 0,
    K1 is K + 1,
    remove_very_three(T, K1, L).
remove_very_three([H|T], K, [H|L]) :-
    K mod 3 =\= 0,
    K1 is K + 1,
    remove_very_three(T, K1, L).

split([], _, [], []).
split([H|T], 1, [H], T).
split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).