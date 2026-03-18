same([],[]).
same([H1|T1],[H2|T2]) :-  H1=H2, same(T1, T2).

% ! is for effiency for this program
prove(true) :- !.
prove(A=B) :- !, A=B.
prove((A, B)) :- !, prove(A), prove(B).
prove(H) :- clause(H, Body), prove(Body),
            write(H), write(" <== "), writeln(Body).

% meta-interpreter that handles the cut

fruit(apple).
fruit(orange) :- !.
fruit(banana).

prove(true).
prove(!) :- !, (true ; throw(cut_exception)).
prove((A, B)) :- !, prove(A), prove(B).
prove(H) :- 
    catch((clause(H, B), prove(B)), cut_exception, fail),
    write(H), write(" <== "), writeln(B). 