:- dynamic step/1.

drawTree(S, []) :- S =< 0, !.

drawTree(S, L) :-
    S > 0,
    S1 is S // 2,
    drawTree(S1, L1),
    drawTree(S1, L2),
    % create the step list for this node
    append([[fd,S],[lt,45]|L1], [[rt,90]|L2], Part),
    append(Part, [[lt,45],[backward,S]], L),
    % assert each step as step/1
    forall(member(X, L), assertz(step(X))).