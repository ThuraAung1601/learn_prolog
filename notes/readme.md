## Programming in Prolog

### Chapter 1: Tutorial Introduction

#### Prolog
- Logical Computer Language
- Propositional and Predicate Logic
- Descriptive and Prescriptive
- Describing known facts and relationships about a problem
- Less Prescribe the sequence of steps taken by a computer to solve the problem

```
% this is comment.
/*
this is
multiline comment.
*/
```

#### Objects and Relationships
- Objects and Relationships
- John owns the book
- - John and book are objects; owns is the relationship
- Object: refers to things that we can represent using terms

```
% this is a fact or a predicate
own(john, book)
```

#### Programming
Prolog consists of
<ol>
  <li>specifying some facts about objects and their relationships</li> % facts
  <li>defining some rules about objects and their relationships</li> % rules
  <li>asking questions about objects and their relationships</li> % query
</ol>
- always put a full stop "." at the end of line in Prolog like ";" in other langugues 

#### Facts
Example facts
```
% john likes mary
likes(john, mary).
% gold is valuable
valuable(gold).
% jane owns gold
own(jane, gold).
% john is father of jane
father(john, jane).
% john gives the book to mary
gives(john, book, mary).
```
- arguments **always** use small letter only e.g john, mary, book, hla_hla_than.
- can use "_" cannot use space " ".
- Each time a name is used, the name refers to a particular individual object.
```
likes(john, mary). % this is a fact
% likes is called a predicate
% john and mary are called arguments
% name and number of argument are arbitrary
```
- Collection of facts = database (according to Textbook) = knowledge base KB (according to Dr. Visit)

#### Questions
```
?- owns(mary, book).
% this is asking whether mary owns the book or not
% going to check in the KB
% if found, yes. if not found, no.
```

#### Variables
- Starts with Capital Letter e.g X, Y, Parent, Book, etc.
- A variable, such as X, does not name a particular object in itself, but it can be used to stand for objects that we cannot name (e.g John)
```
% KB
% facts
likes(mary, food).
likes(mary, coffee).
likes(john, tea). % john likes tea
likes(john, coffee). % john also likes coffee
likes(john, mary).
likes(mary, john).
```
- In query, we can ask like this
```
% I want to know what john likes
?- likes(john, X).
X = tea; % if we want to know more things john likes, enter <TAB> key
X = coffee.
% search in KB and return what is X
```

#### Conjunctions
- Conjunctions are **AND** connection of two logical statement
```
% john likes mary and mary also likes john
likes(john, mary), likes(mary, john)
```
- We can also use in question
```
% I want to know thing that both mary and john likes
?- likes(mary, X), likes(john, X)
% first Prolog will search the first goal (i.e likes(mary, X)) in KB then try to satisfy the second goal
% because there could be more than one john likes
```
- This is conjunction of the goals (See Figures in Page 14)
- Prolog use backtracking

#### Rules
- It is a conditional fact
- Use ":-"
```
% john likes X if X likes wine
likes(john, X) :- likes(X, wine).
% john likes any female who likes wine
likes(john, X) :-
    female(X),
    likes(X, wine).
```
- Rule can have more than one variable even all arguments could be variable.
```
% Someone P may steal Something T
% % if P is a thief AND
% % if P likes T.
may_steal(P, T) :-
  thief(P), likes(P, T).
```
- Please see Lab. (1) for practice.

### Chapter 2: Closer Look

#### Syntax
- Prolog programs are built from **terms**.
- **Term** is a
- - Constant: specific objects or specific relationships. (1) atoms (2) numbers.
  - Variable: objects we are unable or unwilling to name at the time we write the program. starts with Capital letter or "_".
  - Structure: single object consisting of a collection of other objects
- Each term is a sequence of characters. (A-Z, a-z, 0-9, +-*/\~^<>:.?@#$&)

##### Constants 
- Constant: specific objects or specific relationships.
- Two types of constants => (1) atoms (2) numbers.
- Atoms
- - names (john, mary, book)
  - special symbols (:-, ?-)
  - Any character can be in "''" and atom.
  - 'george-smith' ATOM
  - geroge-smith NOT ATOM
  - 234george NOT ATOM
  - Void NOT ATOM (because Void starts with Capital letter)
  - _alpha NOT ATOM (starts with _ means annonymouse variable)

##### Variables 
- Variable: objects we are unable or unwilling to name at the time we write the program. starts with Capital letter or "_".
```
% who likes who
likes(X, Y).
% output will be
% X = mary, Y = john;
% X = mary, Y = coffee; ....

% someone likes john and we don't care someone
% we just want to check whether someone likes john or not
likes(_, john).

% does mary like anyone
likes(mary, _).

% if two _ in a rule or fact, those two _ are not the same.
likes(X, X). % X and X are the same.
likes(_, _). % _ and _ are not the same.
```

##### Structures
- Structures: compound terms
- Structures: single object consisting of a collection of other objects
- Consists two parts - (1) functor and (2) component
- - functor is the predicate and
  - components are the arguments
```
book(wuthering_heights, bronte)
% book is predicate ===> is a functor in structure context
% wuthering_heights and bronte are arguments ====> is components in structure context
```
  
```
% john own the book
owns(john, book)
% what books
owns(john, book(wuthering_heights, bronte))
owns(john, book(sherlock_holems, arthur))

% question
% I want to know does john own any book written by bronte sisters
?- owns(john, book(X, author(Y, bronte))
% we don't need to care book name X and fist name Y so
?- owns(john, book(_, author(_, bronte)) % _ are different
```

#### Characters
- Character is an item of data in its own right.
- printing and non-printing characters in Prolog
- non-printing characters - blank space, new line (enter)

#### Operators



















