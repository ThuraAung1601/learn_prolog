## Past Paper No. 8
**Given: SAT is φ satisfiable CNF formula**

**To prove: P = NP if and only if SAT ∈ P.**

Proof

**If P = NP then SAT ∈ P.**
- On input `⟨φ⟩` (a CNF formula): since `P = NP` every language in NP has a polynomial-time decider. 
- SAT is in NP, so under the assumption `P = NP` there exists a polynomial-time algorithm that decides SAT. 
- Therefore SAT ∈ P.

(Equivalently: `P = NP` ⇒ `NP ⊆ P` ⇒ SAT ∈ P.)

**If SAT ∈ P then P = NP.**
- On input `x` for an arbitrary language `L ∈ NP`:
- by NP-completeness of SAT there is a polynomial-time many-one reduction `f` with `x ∈ L ⇔ f(x) ∈ SAT`.
- Compute `φ = f(x)` in polynomial time, then run the polynomial-time SAT decision procedure (assumed SAT ∈ P).
- Return its answer.
- This yields a polynomial-time decider for `L`.
- Since `L` was an arbitrary NP language, `NP ⊆ P`.
- Because always `P ⊆ NP`, we get `P = NP`.

(Equivalently: SAT is NP-complete, so SAT ∈ P ⇒ every NP language reduces to a P language ⇒ NP ⊆ P ⇒ P = NP.)

---

## Assignment 4
**2.2 — `LPATH` is NP-complete**

Recall
`LPATH = { ⟨G,a,b,k⟩ | G (undirected) has a simple path from a to b of length ≥ k }`.

We must show (A) `LPATH ∈ NP` and (B) `LPATH` is NP-hard. 
Use the hint: `HAMPATH` is NP-complete.

**A. `LPATH ∈ NP`**

On input `⟨G,a,b,k⟩`:

1. Nondeterministically guess a sequence of nodes `v1, v2, ..., vm` such that `v1 = a`, `vm = b`, all `vi` are distinct, and `m ≥ k+1`.
2. Deterministically check: for each `i` from `1` to `m-1`, verify that edge `(vi, vi+1)` exists in `G`. Also check that all nodes in the sequence are distinct.
3. If all checks pass, ACCEPT; otherwise REJECT.

- Why this is polynomial: the guessed sequence has length ≤ number of nodes `n`, so writing and checking it takes polynomial time. 
- The machine accepts exactly when there is a simple path of length ≥ `k`. 
- Thus `LPATH ∈ NP`.

**B. `LPATH` is NP-hard (reduction from `HAMPATH`)**

- We show a polynomial-time reduction `f` from `HAMPATH` to `LPATH`.
- On input for `HAMPATH`: `⟨G,a,b⟩` where `G` has `n` nodes.
- Define `f(⟨G,a,b⟩) = ⟨G, a, b, n-1⟩`.
  
* Computing `n` and forming `⟨G,a,b,n-1⟩` is done in polynomial time (just count nodes).
* Correctness:

  * If `G` has a Hamiltonian path from `a` to `b`, that path visits all `n` nodes → its length is `n-1` → `⟨G,a,b,n-1⟩ ∈ LPATH`.
  * If `⟨G,a,b,n-1⟩ ∈ LPATH`, there is a simple path of length ≥ `n-1`. A simple path in a graph with `n` nodes can have length at most `n-1`, so it must have length exactly `n-1` and thus visit every node → that path is Hamiltonian → `⟨G,a,b⟩ ∈ HAMPATH`.

Therefore `HAMPATH ≤_p LPATH`. Since `HAMPATH` is NP-complete, `LPATH` is NP-hard. Combined with (A), `LPATH` is NP-complete.

---

**3. PUZZLE is NP-complete (shorter version)**

**A. PUZZLE ∈ NP**
On input ⟨c₁,…,cₖ⟩:

1. Nondeterministically choose, for each card cᵢ, whether to flip it.
2. Deterministically stack them and check every hole position — each must be covered by at least one card.
3. Accept if all holes are covered.

Verification takes polynomial time ⇒ PUZZLE ∈ NP.

**B. PUZZLE is NP-hard (by reduction from SAT)**
Let φ be a CNF formula with variables x₁,…,xₙ and clauses u₁,…,uₘ.
Construct puzzle ⟨c₀,c₁,…,cₙ⟩ as follows:

* Each card cᵢ has two sides (unflipped = xi = True, flipped = xi = False).
* For clause uⱼ, put a hole in cᵢ’s position (i,j) unless literal xi (or ¬xi) appears in uⱼ.
* Add one special card c₀ to block the unused column.

Then φ is satisfiable ⇔ there exists a flip choice so that every row (clause) has at least one blocked hole ⇔ the puzzle is solvable.

The construction is polynomial-time, so SAT ≤ₚ PUZZLE.
Since SAT is NP-complete and PUZZLE ∈ NP, **PUZZLE is NP-complete.**

---

**3 — `PUZZLE` is NP-complete (longer)**

Recall `PUZZLE = { ⟨c1,...,ck⟩ | these cards can be placed (some flipped) so every hole position is covered }`. (Each card has two orientations; each card has two columns of hole positions.)

We must show (A) `PUZZLE ∈ NP` and (B) `PUZZLE` is NP-hard (we reduce from `SAT`).

**A. `PUZZLE ∈ NP`**

On input `⟨c1,...,ck⟩`:

1. Nondeterministically guess a bit string `b1...bk` where `bi = 1` means flip card `ci` and `bi = 0` means do not flip it.
2. Deterministically simulate stacking all cards with the chosen flips and check every hole position in the box:
  - for each hole position verify that at least one card in the stack (in its chosen orientation) does **not** have a hole there (i.e., it blocks that position).
4. If every hole position is blocked, ACCEPT; otherwise REJECT.

Why polynomial: the guess has length `k`. For each of polynomially many hole positions, checking the stack is polynomial; overall polynomial time. So `PUZZLE ∈ NP`.

**B. `PUZZLE` is NP-hard (reduction from `SAT`)**

We give a polynomial-time construction that maps any CNF formula `φ` to a puzzle `⟨c0, c1, ..., cn⟩` (cards), so `φ` satisfiable ⇔ puzzle solvable.

Let `φ` have `n` variables `x1,...,xn` and `m` clauses `u1,...,um`. Build `n+1` cards as follows:

* For each variable `xi` create card `ci` with `m` rows (one row per clause) and two columns `A` (left) and `B` (right). For each clause `uj`:

  * If clause `uj` **does not** contain the literal `xi` (positive), punch a hole at `(row j, column A)` of card `ci`. (So column A is *filled* only when the clause contains `xi`.)
  * If clause `uj` **does not** contain literal `¬xi`, punch a hole at `(row j, column B)` of card `ci`. (So column B is *filled* only when the clause contains `¬xi`.)
  * Equivalently: the presence of a filled (non-hole) spot in `(i, j, A)` means clause `uj` contains `xi`; a filled spot in `(i, j, B)` means clause `uj` contains `¬xi`.
* Add one special card `c0` whose left column `A` has holes in all `m` rows and right column `B` is full (or vice versa, depending on the box design). This `c0` will cover the opposite side when placed on top (it enforces that we only need to cover one chosen side per row).

(Constructing these cards is clearly polynomial-time from `φ`.)

**Intuition of the gadget**

* Choosing orientation of card `ci` corresponds to assigning a truth value to `xi`: say "not flipped" → `xi = True`, "flipped" → `xi = False`.
* For each clause row `j`, we require that at least one card blocks the left hole in that row. That happens exactly when the corresponding variable card `ci` provides a filled left spot (meaning clause `uj` contains a literal made true by our assignment). The top card `c0` blocks the other side so we only need every left hole blocked.

**Correctness**

* If `φ` is satisfiable with assignment `D`:

  * For each `i`, set flip state of `ci` so that `ci` blocks left in row `j` exactly when `D` makes some literal in clause `uj` true. Concretely, flip `ci` iff `D(xi) = False`. With this choice every clause row `j` has at least one variable `xi` whose orientation makes the left spot blocked (because some literal in `uj` is true), so every left position is blocked. Place `c0` appropriately to block remaining positions. So the puzzle is solvable.
* If the puzzle is solvable:

  * From the flip choices, define assignment `D` by `D(xi) = True` if `ci` not flipped, `False` if flipped. For each clause row `j`, since left hole is blocked by some card `ci`, that means in that orientation the card has a filled left spot, so the corresponding clause `uj` contains a literal true under `D`. Hence every clause is satisfied, so `φ` is satisfiable.

Thus `φ` satisfiable ⇔ constructed puzzle has a solution. This is a polynomial-time many-one reduction from `SAT` to `PUZZLE`. Since `SAT` is NP-complete, `PUZZLE` is NP-hard. Together with (A), `PUZZLE` is NP-complete.

---
