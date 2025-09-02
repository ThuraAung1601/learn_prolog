is_int(0).
is_int(X) :- is_int(Y), X is Y+1.

% is_int(0) :- !.
% is_int(N). ==> only N=0 print out because cut prevents recursion.
% is_int(2). ==> it will get error. only Y = 0 is commited because of cut -> cannot go to Y = 1.