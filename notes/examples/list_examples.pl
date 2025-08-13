% Pair: [Head | Tail]
% List: [] or [Head | TailIsAList]

pair([H|T], H, T).

first([H|_T], H).

ispair([_H|_T]).

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