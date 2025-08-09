from pyswip import Prolog

pl = Prolog() 

pl.assertz("male(john)")
pl.assertz("male(oliver)")
pl.assertz("male(ali)")
pl.assertz("male(james)")
pl.assertz("male(jack)")
pl.assertz("male(harry)")

pl.assertz("female(helen)")
pl.assertz("female(sophie)")
pl.assertz("female(mary)")
pl.assertz("female(sue)")

pl.assertz("parent(john, mary)")
pl.assertz("parent(john, sue)")
pl.assertz("parent(helen, mary)")
pl.assertz("parent(helen, sue)")
pl.assertz("parent(oliver, james)")
pl.assertz("parent(sophie, james)")
pl.assertz("parent(mary, jack)")
pl.assertz("parent(ali, jack)")
pl.assertz("parent(sue, harry)")
pl.assertz("parent(james, harry)")

pl.assertz("""sibling(X,Y) :- 
    dif(X, Y),
    parent(P, X),
    parent(P, Y)""")


for ans in pl.query("sibling(X, Y)"):
    print(ans["X"], "is sibling of", ans["Y"])