% ==============================
% FAMILY KNOWLEDGE BASE
% ==============================

parent(john, mary).
parent(john, david).
parent(mary, susan).
parent(mary, tom).
parent(david, anna).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

% ==============================
% META INTERPRETER
% ==============================

solve(true, true) :- !.

% built-ins
solve(G, node(G,[])) :-
    predicate_property(G, built_in),
    !,
    call(G).

% conjunction
solve((A,B), node((A,B), [TA,TB])) :-
    !,
    solve(A, TA),
    solve(B, TB).

% user rule
solve(G, node(G,[T])) :-
    clause(G,Body),
    solve(Body,T).