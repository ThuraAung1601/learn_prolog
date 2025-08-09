from pyswip import Prolog

pl = Prolog()

x1, y1, x2, y2 = map(float, input().split(";"))

pl.assertz(f"point(pointA, {x1}, {y1})")
pl.assertz(f"point(pointB, {x2}, {y2})")

# distance = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
pl.assertz("""
    find_distance(A, B, Dist) :-
           point(A, X1, Y1),
           point(B, X2, Y2),
           DiffX is X2 - X1, DiffY = Y2 - Y1,
           Dist is sqrt((DiffX * DiffX) + (DiffY * DiffY))
""")

for sol in pl.query("find_distance(pointA, pointB, Dist)"):
    print("{:.2f}".format(sol["Dist"]))