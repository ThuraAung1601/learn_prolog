from pyswip import Prolog

pl = Prolog()


pl.assertz("income(jim, 10000)")
pl.assertz("income(john, 100000)")

pl.assertz("spending(jim, 1000)")
pl.assertz("spending(john, 10000)")

pl.assertz("unmarried(jim)")
pl.assertz("married(john, 2)")

pl.assertz("donation(jim, 0)")
pl.assertz("donation(john, 100)")

pl.assertz("find_rate(0, 0)")
pl.assertz("""
    find_rate(Net, Rate) :-
        Net =<  300000 -> Rate is 10;
        Net =<  600000 -> Rate is 20;
        Net =< 1000000 -> Rate is 30;
        Net =< 2000000 -> Rate is 40;
        Rate is 50
""")

pl.assertz("""
    pay_tax(Person, Tax) :-
           married(Person, NOC),
           income(Person, Income),
           spending(Person, Spending),
           donation(Person, Donation),
           Net is Income - Spending - (NOC * 10000) - Donation,
           find_rate(Net, Rate),
           Tax is Net * Rate/100
""")

pl.assertz("""
    pay_tax(Person, Tax) :-
            unmarried(Person),
            income(Person, Income),
            spending(Person, Spending),
            donation(Person, Donation),
            Net is Income - Spending - Donation,
            find_rate(Net, Rate),
            Tax is Net * Rate/100
""")

for p in ["jim", "john"]:
    for sol in pl.query(f"pay_tax('{p}', Tax)"):
        print(f"{p}'s Tax is {sol["Tax"]}")