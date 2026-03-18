% john is father of joe
father(john, joe). 
father(joe, mary).
father(joe, tim).
father(james, jenny).

mother(mary, ang).

male(john). 
male(joe).
male(tim).

female(mary).
female(ang).
female(jenny).

married_couple(tim, jenny).

% X is parent of Y
parent(X, Y) :- father(X, Y) ; mother(X, Y).

% X is son of Y
son(X, Y) :- parent(Y, X), male(X).

% X is daughter of Y
daughter(X, Y) :- parent(Y, X), female(X).

% X is grandparent of Y
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% X is sister/brother/siblings of Y.
sister(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, female(X).
brother(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, male(X).
siblings(X, Y) :- sister(X, Y) ; brother(X, Y).

% X is uncle of Y.
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

% X is niece of Y.
niece(X, Y) :- parent(Z, X), siblings(Z, Y), female(X).

% X is mother in law of Y
spouse(X, Y) :- married_couple(X,Y).
spouse(Y, X) :- married_couple(Y, X).
mother_in_law(X, Y) :- mother(X, Z), married_couple(Z, Y).

% X is son in law of Y
son_in_law(X, Y) :- spouse(X, Z), parent(Z, Y), male(X).

