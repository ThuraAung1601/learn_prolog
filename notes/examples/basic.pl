% KB
% facts
likes(mary, food).
likes(mary, coffee).
likes(john, tea). % john likes tea
likes(john, coffee). % john also likes coffee
likes(john, mary).
likes(mary, john).
likes(hla_hla_than, wine).

female(mary).
female(hla_hla_than).
female(sue).
male(john).

thief(john).

% john likes woman who likes wine
% someone_likes/2
someone_likes(john, Woman) :-
    female(Woman), 
    likes(Woman, wine).

% a person is a thief and will steal thing that he likes
will_steal(Person, Thing) :-
    thief(Person),
    likes(Person, Thing).

% ------------------------

% john own the book
owns(john, book).
% what books
owns(john, book(wuthering_heights, bronte)).
owns(john, book(sherlock_holems, arthur)).

author(mary, bronte).
author(hla_hla_than, bronte).

% fact: john owns wuthering_heights written by hla_hla_than bronte
owns2(john, book(wuthering_heights, author(hla_hla_than, bronte))).
owns2(john, book(height, author(mary, bronte))).

% even or odd
even_or_not(Num, Result) :-
    0 is Num mod 2 -> Result = even;
    Result = odd.