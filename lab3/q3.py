from pyswip import Prolog

pl = Prolog()
pl.consult("q3.pl")

for sol in pl.query("split([1, 2, 3, 4, 5], 3, L1, L2)"):
    print(sol["L1"], end=" "); print(sol["L2"])

for sol in pl.query("split([1, 2, 3, 4, 5], 1, L1, L2)"):
    print(sol["L1"], end=" "); print(sol["L2"])

for sol in pl.query("split([4, 4, 4, 4, 8, 4, 4, 4, 4], 5, L1, L2)"):
    print(sol["L1"], end=" "); print(sol["L2"])

for sol in pl.query("split([5, 5, 5, 5, 5, 6], 6, L1, L2)"):
    print(sol["L1"], end=" "); print(sol["L2"])

for sol in pl.query("split([1, 2, 3, 4, 5, 6, 7], 8, L1, L2)"):
    print(sol["L1"], end=" "); print(sol["L2"])