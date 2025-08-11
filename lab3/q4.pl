% merge(Uns1, Uns2, MergedSorted)
merge(Uns1, Uns2, Merged) :-
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