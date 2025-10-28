merge(Uns1, Uns2, Merged) :-
    append(Uns1, Uns2, Combined),
    merge_sort(Combined, Merged).

split([], [], []).
split([H], [H], []).
split([H1,H2| T], [H1|T1], [H2|T2]) :-
    split(T, T1, T2).

merge_sort([] ,[]).
merge_sort([H], [H]).
merge_sort(List, Sorted) :-
    split(List, L1, L2),
    merge_sort(L1, L1S),
    merge_sort(L2, L2S),
    merged_sorting(L1S, L2S, Sorted).

merged_sorting([], L2, L2).
merged_sorting(L1, [], L1).
merged_sorting([H1|T1], [H2|T2], [H1|Sorted]) :-
    H1 >= H2,
    merged_sorting(T1, [H2|T2], Sorted).
merged_sorting([H1|T1], [H2|T2], [H2|Sorted]) :-
    H1 < H2,
    merged_sorting([H1|T1], T2, Sorted).

reverse([], []).
reverse([H], [H]).
reverse([H|T], Reverse) :- 
    reverse(T, RT),
    append(RT, [H], Reverse), !.

is_int(0).
is_int(X) :- is_int(Y), !, X is Y+1.

edge(a,b).
edge(a,c).
edge(b,c).
edge(b,d).
edge(c,d).
edge(c,e).
edge(e,d).

dfs(A, B, Visited, [B|Visited]) :-
    edge(A, B),
    !.

dfs(A, B, Visited, Path) :-
    edge(A, Next),
    \+ member(Next, Visited),
    dfs(Next, B, [Next|Visited], Path),
    !.

path(A, B, Path) :-
    dfs(A, B, [A], ReversePath),
    reverse(ReversePath, Path),
    !.

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, R) :-
    N > 1,
    N1 is N - 1, fib(N1, R1),
    N2 is N - 2, fib(N2, R2),
    R is R1 + R2, !.

% without cut
% fib(N,R) :- N =:= 0, R = 0.
% fib(N,R) :- N =:= 1, R = 1.
% fib(N,R) :-
%    N > 1,
%    N1 is N-1, fib(N1,R1),
%    N2 is N-2, fib(N2,R2),
%    R is R1+R2.

gcd(A, 0, A) :- !.
gcd(A, B, G) :-
    R is A mod B,
    gcd(B, R, G).

get_even([], []).
get_even([H|T], Even) :-
    0 is H mod 2,
    get_even(T, EvenT),
    append([H], EvenT, Even), !.
get_even([_H|T], Even) :-
    get_even(T, Even).

delete_all(_, [], []).

delete_all(A, [H|T], X) :-
    A =:= H,
    delete_all(A, T, X), !.
delete_all(A, [H|T], [H|X]) :-
    delete_all(A, T, X).

ispalindrome(L) :- reverse(L, L).