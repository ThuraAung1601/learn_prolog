edge(a,b).
edge(a,c).
edge(b,c).
edge(b,d).
edge(c,d).
edge(c,e).
edge(e,d).

path(A,B,Path) :-
    dfs(A,B,[A],Rev),           % Visited list grows in reverse
    reverse(Rev, Path).

% Try to extend first (so we may get longer paths before direct ones)
dfs(A,B,Visited,Path) :-
    edge(A,Next),
    \+ member(Next,Visited),
    dfs(Next,B,[Next|Visited],Path).

% Then accept a direct hop
dfs(A,B,Visited,[B|Visited]) :-
    edge(A,B).