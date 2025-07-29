/* who is sister of mary and who are their parents. */
sister(X, mary), parent(P, X), parent(P, mary), !. 
/* ! stop backtracking meaning that only first answer will be given */

/* who has a parent */
parent(Parent, Child).

/* who is a child of somebody */
parent(Parent, Child).

/* who is sister of somebody */
sister(Who, Somebody).