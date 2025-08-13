/* facts */

/* males */
male(john).
male(oliver).
male(ali).
male(james).
male(jack).
male(harry).

/* females */
female(helen).
female(sophie).
female(mary).
female(sue).

/* relations */
parent(john, mary). /* john is parent of mary */
parent(john, sue).
parent(oliver, james).
parent(ali, jack).
parent(james, harry).
parent(helen, mary).
parent(helen, sue).
parent(sophie, james).
parent(mary, jack).
parent(sue, harry).

/* ------------------- */
/* rules */

father(X , Y) :-
    male(X), parent(X, Y).

mother(X, Y) :-
    female(X), parent(X, Y).

grandfather(X, Y) :-
    father(X, Z), parent(Z, Y).

grandmother(X, Y) :-
    mother(X, Z), parent(Z, Y).

/* or logical is ; and logical is , */
grandparent(X, Y) :-
    grandfather(X, Y); grandmother(X, Y).

grandparent(X, Y) :-
    grandfather(X, Y).
grandparent(X, Y) :-
    grandmother(X, Y).

sibling(X, Y) :-
    parent(Z, X), parent(Z, Y), X \= Y.

sister(X, Y) :-
    sibling(X, Y), female(X).

brother(X, Y) :-
    sibling(X, Y), male(X).    

uncle(X, Y) :-
    parent(Z, Y), brother(X, Z).

aunt(X, Y) :-
    parent(Z, Y), sister(X, Z).