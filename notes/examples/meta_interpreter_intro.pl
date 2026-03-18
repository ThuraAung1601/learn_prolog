mammal(dog).
mammal(cat).

% clause(mammal(dog), B).
% => B=true.

% simple meta-interpreter
% prove(H) :- clause(H, B), B=true.

animal(X):- mammal(X).
lifeform(X) :- animal(X).

% meta-interpreter for deduction
prove(true) :- !.
prove(H) :- clause(H, B), prove(B),
            write(H), write(" <== "), writeln(B).