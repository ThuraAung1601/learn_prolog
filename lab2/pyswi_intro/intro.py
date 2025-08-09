from pyswip import Prolog

pl = Prolog()
pl.consult("/Users/thuraaung/Desktop/learn_prolog/lab2/pyswi_intro/lab1_q1.pl")

def main():
    # Query the Prolog database
    result = list(pl.query("parent(Parent, Child)."))

    # Print the results
    for item in result:
        print(item)

if __name__ == "__main__":
    main()