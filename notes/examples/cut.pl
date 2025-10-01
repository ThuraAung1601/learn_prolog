% if empty no need to search
num_rep([], []) :- !.
% cut below stop searching if element is 0
num_rep([0| T], T1) :- !, num_rep(T, T1).
% cut below stops searching once it determines the head of list is even
num_rep([H|T], [H1|T1]) :- 
    0 is H mod 2, 
    !,
    H1 is H / 2,
    num_rep(T, T1).
num_rep([_H|T], [odd|T1]) :-
    num_rep(T, T1).

warm_blodded(cat).
warm_blodded(dog).
warm_blodded(chicken).
four_legs(dog).
four_legs(cat).
two_legs(chicken).

mamal0(bears).
mamal0(M) :- warm_blodded(M), four_legs(M).
mamal0(dolphin).

mamal1(bears).
mamal1(M) :- !, warm_blodded(M), four_legs(M).
% cut upper cut the back-tracking so dolphin not included
mamal1(dolphin).

mamal2(bears).
% only one warm_blodded will come out because it cut as soon as it found
mamal2(M) :- warm_blodded(M), !, four_legs(M).
mamal2(dolphin).

animal(_) :- !.
animal1(_).