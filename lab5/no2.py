from pyswip import Prolog

# Initialize Prolog
prolog = Prolog()

# Load facts
prolog.consult("no2.pl")

# Query Prolog
print("Animals in the knowledge base:")
for result in prolog.query("animal(Animal)"):
    print(f"Animal: {result['Animal']}")