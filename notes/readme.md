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
- Normal way: x + y * z
- How understand: +(x, *(y,z))
- () ^ * / + -

#### Equality and Unification
- mostly use "is" for numbers (e.g R is 5 + 1.)
- = is unification: trying to make X and Y equal. 
```
X = Y % unify X with Y
```
- If X is an uninstantiated variable, and if Y is instantiated to any term, then X and Y are equal.
- X will become instantiated to whatever Y is.
```
% X is uninstantiated element and Y is
% X = Y
% X will become instantiated to whatever Y is.
% X to be instantiated to the structure rides
rides(student, bicycle) = X

% Two structures are equal if they have the same functor and number of components,
% and all corresponding components are equal.
rides(student, bicycle) = rides(student, X)
```
- **Corefer**: If two variables share, then whenever one of them becomes instantiated to some term, the other one automatically is instantiated to the same term.

```
sum_of_two(N1, N2, Sum) :- Sum = N1 + N2.
```

#### Arithmetic
###### Arithmetic Operators
- X + Y
- X - Y
- X * Y
- X / Y
- X // Y % integer division
- X mod Y % remainder of X divided by Y
  
###### Logical Operators
```
- X =:= Y (true if X == Y)
- X =\= Y (true if X != Y)
- X < Y
- X > Y
- X =< Y
- X >= Y
```

```
/*
Example:
X was a prince during year Y if :
  X reigned between years A and B, and
  Y is between A and B, inclusive. */
prince(X, Y) :-
  reigns(X, A, B),
  Y >= A,
  Y =< B.
```

```
even_or_not(Num, Result) :-
    0 is Num mod 2,
    Result = even. % cannot use is because even is not a number.

even_or_not(Num, Result) :-
    1 is Num mod 2,
    Result = odd.
```

```
even_or_not(Num, even) :-
    0 is Num mod 2.

even_or_not(Num, odd) :-
    1 is Num mod 2.
```

```
even_or_not(Num, Result) :-
    0 is Num mod 2 -> Result is even;
    Result is odd.
```

##### Summary of Satisfying Goals

- Prolog backtrack
- Forward Chaining: Start with existing facts and clauses and work forward, trying to derive the goal.
- - If the number of facts is not very small and the number of rules is not large, backward chaining will be faster
- Backward Chaining: Start with the goal and work backwards, attempting to decompose it into set of true clauses.
- - Prolog uses Backward Chaining.
<br>
- Two search
- - DFS: Find a complete sequence of propositions for the first subgoal before working on the others (what Prolog uses)
  - BFS: Works on all subgoals in parallel.
- Prolog uses DFS. DFS uses stack.
- Please see at Figure 2.1-6

```
% is mary sister of john
female(mary), parent(mary, M, F), parent(john, M, F).

% to be a sister mary has to be a female % subgoal 1
% find who are Mother M and Father F of mary % subgoal 2
% find who are Mother M and Father F of john and are the unify (equal ?) % subgoal 3
% if one subgoal fail go back to the previous one (Fig 2.1-6)
```

### Chapter 3: Using Data Structures
Recursion: Backward movement, return.

#### Structures and Trees
- Each functor is a node and components are brances.

```
>> parents(charles, elizabeth, phillip).
  parent - phillip
    |   \
charles   elizabeth
```

#### Lists
- List: ordered sequence of elements
- Ordered means that the order of the elements in the sequence matters.
- Elements may be any terms - constant, variable, and structures.
- List can be expressed as special kind of tree. (Page 50)

```
.(a, [])
a is head, [] is tail
. - []
|
a
```

```
[a, V1, b, [X, Y]
. - . - . - . - []
|   |   |   |
a   V1  b   . - . - []
            |   |
            X   Y
```
- List are manipulated by splitting them up into a head and a tail.
- Please see Table 3.1
```
% Pair: [Head | Tail]
% List: [] or [Head | TailIsAList]

pairparts([H|T], H, T). % pair or not

>> pairparts([1, 2], X, Y). % X = 1, Y = [2].
>> pairparts([1, 2, 3], X, Y). % X = 1, Y = [2, 3].
>> pairparts(X, a, b). % X = [a|b].
```

```
first/2 - find the first thing in a list
first([H|T], H).

>> first([1, 2, 3], X). % X = 1.
>> first([[1, 2], [2, 3]], X). % X = [1, 2].
```

```
% check is that the list
% base_case is input is []
islist([]).
% if not a list we will not have tail
% take tail of input list at every recurrence to the end 
% end of every list is []
islist([_H|T]) :- islist(T).

% check there are at least two element in a list
at_least_two_in_list([_, _ |_T]).

% give me the first two element
at_least_two_in_list([H1, H2|_T], X, Y) :- X = H1, Y = H2.
% at_least_two_in_list([H1, H2|_T], H1, H2).

% third element in the list
third_element_in_list([_, _, H|_T], H).

% first/3 first two elements in the list
first_two_element([E1, E2|_T], E1, E2).

% first/2 
first_two_element([E1, E2|_T], [E1, E2]).
```

- Recursion in Prolog
- Basecase
- Recursive case

```
# factorial.py
def factorial(num):
  if num <= 1:
    return 1
  return factorial(num-1) * n
```

```
% factorial.pl
factorial(N, Fac) :-
  N =< 1 -> Fac is 1;
  N1 is N - 1,
  factorial(N1, F1),
  Fac is F1 * N.
```

```
% factorial.pl
factorial(0, 1).
factorial(1, 1).
factorial(N, Fac) :-
  N > 1,
  N1 is N - 1,
  factorial(N1, Fac1), % here Fac1 is factorial(num-1) AND n is N
  Fac is Fac1 * N.
```

#### Recursion Patterns
<ol>
  <li>List Manipulation</li>: Doing on the single list.
  <li>Searching</li>: Searching in the list.
  <li>Slicing</li>: Slicing the list till X.
</ol>


### Chapter 4: Backtracking and the "Cut"

unifying fact (or rule head) 
- ==> goal has been matched 
- ==> instantiate any previously uninstantiated variables that have been unified
- ==> satisfy subgoals introducded by the rule

No unifying fact (or rule head)
- ==> goal has not passed
- ==> re-satisfy the goal 
- ==> If original goal appears, then this will be goal on its left

```
likes(john, ai).
likes(tom, ipad).
likes(tom, prolog).
likes(mary, ai).
is_friend_of(X, Y) :-
    likes(X, Z),
    likes(Y, Z).
```

```
 ?- is_friend_of(A, B).
    A = B, B = john ;
    A = john,
    B = mary ;
    A = B, B = tom ;
    A = B, B = tom ;
    A = mary,
    B = john ;
    A = B, B = mary.
```

```
boy(george).
boy(kim).
boy(sheldon).

girl(hlahla).
girl(winwin).
girl(myamya).

possible_pair(X, Y) :- boy(X), girl(Y).
```

- satisfy goal boy(X) finding george 
- satisfy goal girl(Y) finding hlahla
- if we ask more -> ;
- backtrack and re-satisfy what did the last - girl

#### Cut
- Cut (!) tells which previous choices it need not consider again when it backtracks through the chain of satisfied goals.
- Cut benefits
- - Operate faster
- - Less memory space

```
connect(b, a).
connect(b, d).
connect(d, c).
path(A, B) :- connect(A, B).
path(A, B) :- path(A, C), connect(C, B), !.
```


```
facility(Pers, Fac) :-
  book_overdue(Pers, Book), 
  !,
  basic_facility(Fac).
facility(Pers, Fac) :- general_facility(Fac).

basic_facility(references).
basic_facility(enquiries).

additional_facility(borrowing).
additional_facility(inter_library_loan).

general_facility(X) :- basic_facility(X).
general_facility(X) :- additional_facility(X).
```

Please see figure 4.4 and 4.5.

#### Common uses of Cut
- Confirming the rule choice
- Cut-fail combination = NOT (\+)

- Terminating a "generate and test" => problem with many solution OR many goals (e.g.)

#### Green cut Red cut
- A cut which doesn't change the logical meaning of a program is called a green cut.
- Otherwise it is red cut

```
% red cut
% main meal
homemade(pizza). 
homemade(soup). 
homemade(fish).

% dessert
ripe(apple). 
ripe(orange). 
ripe(banana).

% meal has tasty dish and ripe fruit
meal(Main, Fruit) :- homemade(Main), !, ripe(Fruit).
```
- Only pizza - Main = pizza because it has cut in the middle so cannot backtrack for homemade(Main) so cannot search more homemade facts. Just the first one pizza.

```
% water/2 relates temperature to state
water(Temp, solid) :- Temp =< 0.
water(Temp, liquid) :- Temp > 0, Temp < 100.
water(Temp, gas) :- Temp >= 100.

% h2o/2 uses the cut to be more efficient
h2o(Temp, solid) :- Temp =< 0, !.
h2o(Temp, liquid) :- Temp > 0, Temp < 100, !.
h2o(Temp, gas) :- Temp >= 100. 
```

### Chapter 5: Negation

```
negation(G) :- call(G), !, fail.
negation(_).
```

- G is a goal and the G (e.g. yellow(X)) is true "call(G)' is succeed and
- the cut (!) in the middle is to prevent backtrack from fail
- Prolog code run each goal H :- G1, G2, G3 in that order left to right and once one goal from right is fail it backtrack to the head to find the goal that can satisfy.
- For example, if G2 is fail, it goes to H and find goal G1 and G2 that satisfy the head H and if succeed continue to G3 ......
- The cut in the middle means if "G" is true (i.e. call(G) is succeed), it should return fail. Once fail, it tried to backtrack, so we prevent using cut and keep that.
- negation is the same with built-in \+
  
```
% Sally likes all fruit except yellow
likes(sally, X) :- fruit(X), negation(yellow(X))
```

### Chapter 6: Meta-programming
- Prolog code to run prolog code

```
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
```