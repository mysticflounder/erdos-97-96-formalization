# P97 strict-Kalmanson n=10 recovery and exact-computation checkpoint

**Local date:** 2026-09-03  
**Scope:** loopless centered four-row systems on a fixed cyclically ordered 10-set  
**Status:** recovered and independently replayed exact exhaustive computation  
**Not claimed:** Lean proof, Euclidean coordinate theorem, or closure of P97

## 1. Provenance correction

An earlier channel message announced an exact n=10 UNSAT master with a 9,280-clause bank and SHA-256

```text
dffbade583eb1576055157ef8dbd8c2a703c399816b5179ded2d20a8ed97d8f7
```

but did not deposit a run root, manifest, replay command, or bank file in the repository or nthdegree. The subsequent repository audit was therefore correct to classify that announcement as unsupported.

The missing material was later recovered from this ChatGPT session's local runtime, principally under `work/strict-kalmanson-wave4`. This checkpoint does not treat those recovered bytes as self-authenticating. It independently:

1. regenerates the 8,400 Berge and 840 shared-pair clauses from source;
2. reconstructs the 40 complementary-arc clauses from the two recovered canonical cores and their explicitly stored dihedral images;
3. checks byte identity with the recovered original bank;
4. validates every clause family's mathematical semantics;
5. reruns two structural masters;
6. converts the bank to a second, simpler exact-cardinality CSP representation;
7. reruns an independent bitset CSP, including an all-126-row-0 search with no symmetry reduction;
8. checks SAT controls for every proper sub-bank used in the final step.

The corrected record is therefore:

> The original announcement was not durably supported when made. The n=10 result has now been recovered, reconstructed, and independently replayed in this bundle.

## 2. Exact finite statement checked

Let the labels be `0,…,9` in cyclic order. For each center `c`, choose a support

\[
S_c\subseteq\{0,\ldots,9\}\setminus\{c\},\qquad |S_c|=4.
\]

Interpret `x∈S_c` as the positive equality-row statement that the four selected support points are all at one common distance from `c`.

The computation proves by exhaustive finite search that **no** family `(S_c)_{c=0}^9` avoids all of the following source-valid strict-Kalmanson no-goods:

1. the complete four-orbit three-row Berge bank;
2. shared-pair nonalternation collapses;
3. the `r=2` and `r=3` complementary-arc equality chains, up to dihedral relabeling.

Consequently there is no symmetric strict-Kalmanson distance function on ten cyclically ordered labels that has an equal-distance class of cardinality at least four at every center. Given any class of cardinality greater than four, selecting an arbitrary four-subset gives the row system above, so the result is an **at-least-four** obstruction, not merely an exact-four obstruction.

## 3. The 9,280-clause bank

The bank is a monotone family of forbidden positive row-membership patterns. A clause records a set of required atoms `(center, support-point)` and forbids all of them from being simultaneously true.

### 3.1 Complete Berge bank — 8,400 clauses

The three-row Berge-triangle order classifier checks all 720 linear arrangements of the six roles. Modulo the incidence triangle's `S₃` symmetry and boundary dihedral symmetry, there are 13 order orbits:

- four strict-Kalmanson-infeasible orbits;
- nine exact rational strict-Kalmanson-plus-strict-triangle relaxation survivors.

The four bad orbits have positive balanced certificates of sizes `2,2,2,3`. Transport over all injections into ten cyclic labels and grouping by row center produces exactly 8,400 unique no-goods.

This is a complete bank only for the four impossible Berge order orbits. It is not a claim that every abstract Berge triangle is impossible; the nine feasible order orbits are explicit negative controls against that false generalization.

### 3.2 Shared-pair nonalternation — 840 clauses

For every cyclic quadruple and every relevant assignment of two row centers and a shared support pair, one strict Kalmanson comparison would have identical quotient edges on the two sides. Complete enumeration produces 840 unique clauses.

### 3.3 Complementary-arc chains — 40 clauses

There are two canonical n=10 patterns, `r=2` and `r=3`. Each has a dihedral orbit of size 20, producing 40 unique clauses.

For general cyclic labels and `2≤r≤n−2`, the pattern is:

```text
row(1)   contains {0,r+1}
row(0)   contains {r,n−1}
row(n−1) contains {n−2,0}
row(k)   contains {k−1,k+1}  for r+1≤k≤n−2.
```

The row equalities and edge symmetry give

\[
d(0,r)=d(0,n-1)=d(n-1,n-2)=\cdots=d(r+1,r)=d(r,r+1)
\]

and the row at `1` gives

\[
d(0,1)=d(1,r+1).
\]

The complementary strict Kalmanson inequality for `0<1<r<r+1`,

\[
d(0,1)+d(r,r+1)<d(0,r)+d(1,r+1),
\]

therefore becomes a strict inequality of a quantity with itself.

The complete bank has:

```text
8,400 + 840 + 40 = 9,280 clauses
```

and exact SHA-256:

```text
dffbade583eb1576055157ef8dbd8c2a703c399816b5179ded2d20a8ed97d8f7
```

## 4. Independent exact searches

### 4.1 Structural masters

Two C++ implementations using different internal representations returned the same exact result and search counts:

```text
status                EXACT_MASTER_UNSAT
states                57,228
transitions           4,744,373
no-good prunes        4,687,211
row-0 dihedral cases  66
```

A fresh final replay of the fast implementation reproduced these counts exactly.

### 4.2 Independent exact-cardinality CSP

The bank was separately translated to 90 Boolean membership variables, one for each ordered non-self pair `(c,p)`. Rather than encode cardinality through clauses, the independent solver's domain for each center is the complete list of all

\[
\binom 94=126
\]

four-subsets of the other labels. It recursively assigns one support per center and rejects a branch when a forbidden monotone clause has become completely true.

With the reflection reduction:

```text
status       UNSAT
nodes        55,629
row trials   4,640,330
row-0 cases  66
max depth    8
```

With **no symmetry reduction at all**:

```text
status       UNSAT
nodes        929,250
row trials   118,014,624
row-0 cases  126
max depth    9
```

The no-symmetry run removes dependence on the dihedral row-0 canonicalization used by the faster masters.

## 5. Incremental nonvacuity controls

The result is not caused by a malformed base encoding or by any one redundant clause family.

- Berge plus shared-pair bank, 9,240 clauses: **SAT**.
- Base plus the 20 `r=2` chain images: **SAT**.
- Base plus the 20 `r=3` chain images: **SAT**.
- Base plus both chain orbits, 9,280 clauses: **UNSAT**.

The exact witnesses replay against the banks. The base witness violates ten `r=2` clauses and no `r=3` clauses. A witness avoiding all `r=2` images violates ten `r=3` images. A witness avoiding all `r=3` images violates ten `r=2` images. Thus both complementary-arc orbits are load-bearing.

## 6. Lean status of the new motif

The cardinality-generic complementary-arc theorem is now committed as:

```text
commit e3d065804
```

Source:

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  ComplementaryArcSelectedRowEqualityChain.lean
```

Main FQN:

```text
Problem97.ComplementaryArcSelectedRowEqualityChain.
  false_of_complementaryArc_selectedRowEqualityChain
```

Fixed n=10 wrappers:

```text
false_of_complementaryArc_selectedRowEqualityChain_fin10_r2
false_of_complementaryArc_selectedRowEqualityChain_fin10_r3
```

Reported axiom closure for all three is exactly:

```text
[propext, Classical.choice, Quot.sound]
```

The finite 9,280-clause exhaustion is not yet a Lean theorem. The Lean contribution is the source-clean geometric validity of each complementary-arc clause.

## 7. Triangle inequalities cannot be the missing ingredient

The local agent's sharpening is correct and can be stated as a general lemma.

Let `d` be any symmetric off-diagonal distance assignment satisfying the selected-row equalities and all strict Kalmanson comparisons. For a constant `C`, define

\[
d_C(i,j)=
\begin{cases}
0,&i=j,\\
d(i,j)+C,&i\ne j.
\end{cases}
\]

Every row equality is preserved. Every strict Kalmanson inequality has two off-diagonal terms on each side, so the added `2C` cancels exactly.

Because the label set is finite, choose `C` larger than both

\[
\max_{i\ne j}(-d(i,j))
\]

and

\[
\max_{i,j,k\ \mathrm{distinct}}
  \bigl(d(i,k)-d(i,j)-d(j,k)\bigr).
\]

Then every off-diagonal `d_C(i,j)` is positive and every strict triangle inequality

\[
d_C(i,k)<d_C(i,j)+d_C(j,k)
\]

holds. Therefore:

> Any strict-Kalmanson row-system survivor can automatically be converted into a positive strict metric survivor by a uniform off-diagonal shift.

So strict triangle inequalities add no separating power to this abstract program. A future survivor would point specifically to planar Euclidean structure: squared-distance positive semidefiniteness, embedding dimension at most two, Cayley–Menger rank conditions, compatible convex order, and the circumcenter/blocker/minimality semantics used in the P97 reduction.

This shift lemma is a worthwhile small formalization target because it permanently removes triangle-inequality searches from the strict-Kalmanson lane.

## 8. Claim boundary

Established by this bundle:

- exact semantic reconstruction of the 9,280-clause n=10 bank;
- byte identity with the recovered original bank;
- exact exhaustive UNSAT from two structural masters;
- exact exhaustive UNSAT from an independent bitset CSP;
- exact exhaustive UNSAT without any symmetry reduction over row 0;
- independent SAT controls for all three proper bank stages;
- source-clean Lean validity of the two new complementary-arc motif orbits.

Not established:

- a proof-producing SAT certificate such as DRAT/LRAT for the whole CSP;
- a Lean reflection of the n=10 finite exhaustion;
- the all-center strict-Kalmanson conjecture for n≥11;
- a theorem that every arbitrary-cardinality row system contains one of these finite motifs;
- P97 itself.

The correct current mathematical status is:

> The all-center strict-Kalmanson obstruction is computationally closed at n=10 by a small static bank, with an independently replayed no-symmetry exhaustive search. The general arbitrary-n obstruction remains open.

## 9. Replay

Fast integrity and semantic verification:

```bash
python3 verify_bundle.py
```

Fresh compile and exact 66-case solver replay:

```bash
./run_exact_replay.sh
```

Fresh compile and additional all-126-case no-symmetry replay:

```bash
./run_exact_replay.sh --no-symmetry
```

The no-symmetry search is the strongest finite replay. The included completed record is `results/final-row-csp-nosym-replay.json`.
