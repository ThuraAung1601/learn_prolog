from pyswip import Prolog

pl = Prolog()

pl.consult("q2.pl")

for sol in pl.query("remove_very_three([0, 1, 2, 3, 4, 5], NewList)"):
    print(sol["NewList"])