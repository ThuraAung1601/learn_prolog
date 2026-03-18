edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).
edge(f, g).

path(N, N).
path(N1, N2) :- edge(N1, X), path(X, N2), !.

% -------------

on(B1, B2).
on(B2, B3).
on(B3, B4).

% above is transitive closure of on
above(B, B).
above(BX, BY) :- on(BX, BZ), above(BZ, BY).

% -------------