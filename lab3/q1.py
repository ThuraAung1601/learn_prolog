from pyswip import Prolog

pl = Prolog()

# length N of the current list is 1 more than the length N1 of its tail T
pl.assertz("list_length([], 0)")
pl.assertz("""
           list_length([_H|T],N) :-
                list_length(T, N1),
                N is N1 + 1
""")

for sol in pl.query("list_length([1, 2, 3, 4], N)"):
    print(sol["N"])