% reverse(L, R)
reverse([], []).
reverse([H], [H]).
reverse([H|T], R) :-
    reverse(T, R1),
    append(R1, [H], R).
    
% extract even numbers
is_even(N) :- 0 is N mod 2, !.
extract_even([], []).
extract_even([H|T], [H|L1]) :-
    is_even(H),
    extract_even(T, L1), !.
extract_even([H|T], L1) :-
    \+ is_even(H),
    extract_even(T, L1), !.

% flatten the list 
is_list2([]).
is_list2([_H]).
is_list2([_H|T]) :-  is_list2(T), !.

flatten_list([], []).
flatten_list([H|T], Flat) :- 
    is_list2(H),
    flatten_list(H, HFlat),
    flatten_list(T, TFlat),
    append(HFlat, TFlat, Flat), !.
flatten_list([H|T], [H|TFlat]) :-
    \+ is_list(H),
    flatten_list(T, TFlat), !.
flatten(H, [H]).

list_difference([], _, []).
list_difference([H1|T1], L2, R) :-
    member(H1, L2),
    list_difference(T1, L2, R).
list_difference([H1|T1], L2, [H1|R]) :-
    \+ member(H1, L2),
    list_difference(T1, L2, R).
list_diff_both(L1, L2, R1, R2) :-
    list_difference(L1, L2, R1),
    list_difference(L2, L1, R2).

no_duplicates([], []).
no_duplicates([H|T], Result) :-
    member(H, T),
    no_duplicates(T, Result), !.
no_duplicates([H|T], [H|Result]) :-
    \+ member(H, T),
    no_duplicates(T, Result), !.

solve(true).
solve((A, B)) :- 
    solve(A), solve(B), !.
solve(A) :- clause(A, Body), solve(Body), !.

builtin(A) :-
    predicate_property(A, built_in).

solve(true, 0).
solve((A, B), Depth) :-
    solve(A, Depth1), solve(B, Depth2),
    Depth is Depth1 + Depth2.
solve(A, 0) :-
    builtin(A),
    call(A).
solve(A, Depth) :-
    clause(A, Body), solve(Body, Depth1),
    Depth is Depth1 + 1.

solve(Goal, Count) :- prove(Goal, 0, Count).
prove(true, Count, Count).
prove((A, B), Count0, Count) :-   
    prove(A, Count0, Count1),
    prove(B, Count1, Count).
prove(A, Count, Count) :-
    builtin(A), call(A).
prove(A, Count0, Count) :-
    clause(A, Body),
    Count1 is Count0 + 1,
    prove(Body, Count1, Count).

solve_tree(true, true).
solve_tree((A, B), (ProofA, ProofB)) :-
    solve_tree(A, ProofA),
    solve_tree(B, ProofB).
solve_tree(A, builtin(A)) :-
    A \= true,
    builtin(A),
    call(A).
solve_tree(A, (A :- Proof)) :-
    A \= true,
    \+ builtin(A),
    clause(A, Body),
    solve_tree(Body, Proof).

solve_tree2(true, leaf(true)).
solve_tree2((A, B), node(and, [PA, PB])) :-
    solve_tree(A, PA),
    solve_tree(B, PB).
solve_tree2(A, node(builtin, A)) :-
    A \= true,
    builtin(A),
    call(A).
solve_tree2(A, node(A, [P])) :-
    A \= true,
    \+ builtin(A),
    clause(A, Body),
    solve_tree(Body, P).

solve_list(true, []).
solve_list((A, B), List) :-
    solve_list(A, L1),
    solve_list(B, L2),
    append(L1, L2, List).
solve_list(A, [builtin(A)]) :-
    A \= true,
    builtin(A),
    call(A).
solve_list(A, [rule(A)|Rest]) :-
    A \= true,
    \+ builtin(A),
    clause(A, Body),
    solve_list(Body, Rest).

parent(john, mary).
parent(mary, anna).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).