reverse([], []).
reverse([H|T], R) :-
    reverse(T, RT),
    append(RT, [H], R).

append2([], L, L).
append2([H|T], L2, [H|L]) :-
    append2(T, L2, L).

list_max([H], H).
list_max([H|T], Max) :-
    list_max(T, MaxT), 
    (H > MaxT -> Max is H; Max is MaxT).

maximum([], [], []).
maximum(L1, L2, Max) :-
   list_max(L1, M1),
   list_max(L2, M2),
   (M1 > M2 -> Max is M1; Max is M2).

% Find the last element of a list.
last_element(List, Last) :- reverse(List, [Last|_]).

% Find the Kth element of a list.
kth_element([H|_], 1, H).
kth_element([_|T], K, Result) :- 
    K > 0,
    K1 is K - 1,
    kth_element(T, K1, Result).

% Find the number of elements of a list.
len_list([], 0).
len_list([_H|T], Len) :-
    len_list(T, L1),
    Len is L1 + 1.

% Find out whether a list is a palindrome.
palindrome(L) :-
    reverse(L, L).

% Flatten a nested list structure.
% % my_flatten([a, [b, [c, d], e]], X).
is_list([]).
is_list([_|T]) :- is_list(T).

my_flatten([], []).
my_flatten([H|T], [H|L]) :-
    \+ is_list(H),
    my_flatten(T, L).
my_flatten([H|T], L) :-
    is_list(H),
    my_flatten(H, Hflatten),
    my_flatten(T, Tflatten),
    append(Hflatten, Tflatten, L).

% Eliminate consecutive duplicates of list elements.
consecutive_duplicates([], []).
consecutive_duplicates([H], [H]).
consecutive_duplicates([H,H|T], L) :-
    consecutive_duplicates([H|T], L).
consecutive_duplicates([H1,H2|T], [H1|L]) :-
    H1 \= H2, % =\= only for numbers for atoms use \=
    consecutive_duplicates([H2|T], L).

% ---------------------------
% % duplicate a single element N times
duplicate_elem(_, 0, []).
duplicate_elem(Elem, N, [Elem|Rest]) :-
    N > 0,
    N1 is N - 1,
    duplicate_elem(Elem, N1, Rest).

% dupli(List, N, Result)
dupli([], _, []).
dupli([H|T], N, L) :-
    duplicate_elem(H, N, Duplicated),
    dupli(T, N, Rest),
    append(Duplicated, Rest, L).

% % Drop every Nth element from a list
drop(L, N, R) :- drop(L, N, 1, R).
drop([], _, _, []).
drop([_|T], N, N, R) :-
    drop(T, N, 1, R).       % skip Nth element
drop([H|T], N, C, [H|R]) :-
    C \= N,
    C1 is C + 1,
    drop(T, N, C1, R).

% % Split a list into two parts
split(L, 0, [], L).            % first part length 0
split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).

% % Extract a slice from a list**
slice(L, I, K, Slice) :-
    I1 is I - 1,
    length(Prefix, I1),
    append(Prefix, Rest, L),
    Len is K - I + 1,
    length(Slice, Len),
    append(Slice, _, Rest).

% % Rotate a list N places to the left**
rotate(L, N, R) :-
    length(L, Len),
    (N >= 0 -> N1 = N ; N1 is Len + N),
    split(L, N1, Left, Right),
    append(Right, Left, R).

% % Remove the Kth element from a list
remove_at(Elem, [Elem|T], 1, T).
remove_at(Elem, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    remove_at(Elem, T, K1, R).

% % Insert an element at a given position into a list
insert_at(Elem, L, 1, [Elem|L]).
insert_at(Elem, [H|T], Pos, [H|R]) :-
    Pos > 1,
    Pos1 is Pos - 1,
    insert_at(Elem, T, Pos1, R).

% -----------------

% % Pack consecutive duplicates of list elements into sublists.
% Base case: empty list
pack([], []).
% Main case: split the list into a run of duplicates and the rest
pack([H|T], [Run|PackedTail]) :-
    take_same(H, [H|T], Run, Rest),
    pack(Rest, PackedTail).
% Helper predicate: take consecutive duplicates
take_same(H, [H|T], [H|Run], Rest) :-
    take_same(H, T, Run, Rest).
take_same(H, [X|T], [], [X|T]) :-
    H \= X.
take_same(_, [], [], []).

% % Runlength encoding
% Base case: empty list
run_length_encode([], []).
% Encode using pack
run_length_encode(List, RLE) :-
    pack(List, Packed),
    encode_packed(Packed, RLE).
% Convert packed sublists into [Count, Element] format
encode_packed([], []).
encode_packed([[H|T]|PackedTail], [[Len,H]|RLE]) :-
    length([H|T], Len),
    encode_packed(PackedTail, RLE).

% % Group the elements of a set into disjoint subsets.
% choose(N, List, Sublist, Rest)
% picks N elements from List as Sublist, leaving Rest
choose(0, L, [], L).
choose(N, [H|T], [H|Sub], Rest) :-
    N > 0,
    N1 is N - 1,
    choose(N1, T, Sub, Rest).
choose(N, [H|T], Sub, [H|Rest]) :-
    N > 0,
    choose(N, T, Sub, Rest).
% group3(List, G1, G2, G3)
group3(List, G1, G2, G3) :-
    choose(2, List, G1, R1),
    choose(3, R1, G2, G2Rest),
    choose(4, G2Rest, G3, []).
