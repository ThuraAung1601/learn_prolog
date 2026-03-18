from pyswip import Prolog
from graphviz import Digraph
import os

# ===============================
# COLORS
# ===============================

RED = "\033[91m"
GREEN = "\033[92m"
RESET = "\033[0m"

# ===============================
# LOAD PROLOG
# ===============================

prolog = Prolog()

base_dir = os.path.dirname(os.path.abspath(__file__))
pl_file = os.path.join(base_dir, "meta.pl")

prolog.consult(pl_file)

# ===============================
# QUERY  (FIXED HERE)
# ===============================

query = list(prolog.query("solve(ancestor(john,X),Tree)"))

if not query:
    print("No solutions found.")
    exit()

# ===============================
# PRINT PROOF TREES
# ===============================

for r in query:

    x = r["X"]
    tree = str(r["Tree"])

    print("\nSolution:", x)
    print("\nProof Tree\n")

    if "susan" in str(x):
        print(RED + tree + RESET)
    else:
        print(GREEN + tree + RESET)

# ===============================
# GRAPHVIZ VISUALIZATION
# ===============================

dot = Digraph("AncestorTree")

dot.node("root", "ancestor(john,X)")

for i, r in enumerate(query):

    node = f"node{i}"
    label = f"X = {r['X']}"

    color = "red" if "susan" in str(r["X"]) else "green"

    dot.node(node, label, color=color)
    dot.edge("root", node)

output_path = os.path.join(base_dir, "ancestor_tree")
dot.render(output_path, view=True)

print("\nGraphviz tree saved as ancestor_tree.pdf")