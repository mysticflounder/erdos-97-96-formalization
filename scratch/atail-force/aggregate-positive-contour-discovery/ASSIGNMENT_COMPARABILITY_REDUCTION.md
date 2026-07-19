# Assignment comparability reduction for coupled contours

Date: 2026-07-18

Status: **RIGOROUS REDUCTION AND EXACT SMALL REGRESSIONS; THE REQUIRED
PRODUCT-BOX WIDTH THEOREM IS OPEN.**

This note tests a possible strengthening of the one-signed interval-flux
route.  It does not establish generic coverage and closes no source `sorry`.
All finite claims below are replayed over integer cut counts by
[`test_assignment_comparability.py`](test_assignment_comparability.py).
The balance and flux identities themselves are also kernel-checked in
[`AssignmentComparability.lean`](AssignmentComparability.lean); its axiom
queries report only `propext`, `Classical.choice`, and `Quot.sound`.

## 1. Assignments give a distinguished class of balanced circulations

Let `V = Fin n` have its fixed cyclic order, and let every center `c` have a
four-element selected set `S(c)`.  An **assignment** is a choice

```text
f(c) in S(c)
```

at every center.  Define its target-multiplicity vector and outward crossing
profile by

```text
m_f(x) = #{c : f(c) = x},
O_I(f) = #{c in I : f(c) notin I}
```

for every nontrivial circular interval `I`, modulo complement.

If two assignments `f,g` have the same target-multiplicity vector, put

```text
u_{f,g}(c,x) =  1  if x = f(c),
               -1  if x = g(c),
                0  otherwise,
```

with the evident cancellation when `f(c)=g(c)`.  Then

```text
sum_x u_{f,g}(c,x) = 0
```

at every center, while

```text
sum_c u_{f,g}(c,x) = m_f(x) - m_g(x) = 0
```

at every target.  Thus `u_{f,g}` is a balanced incidence circulation.  Its
interval flux is exactly

```text
F_I(u_{f,g}) = O_I(f) - O_I(g).                      (1)
```

Consequently, a pair with the same multiplicities and

```text
O_I(f) <= O_I(g)  for every I,
O_I(f) <  O_I(g)  for at least one I
```

is already a nonzero one-signed contour.  Reversing `f,g` reverses the global
sign.  In order language, assignments of one fixed multiplicity form a poset
under coordinatewise comparison of their circular cut-crossing profiles.

Every assignment also has the same selected-row metric cost:

```text
sum_c d(c,f(c)) = sum_c r_c.
```

The equal-multiplicity condition removes the weak-sum lineality from a
Kalmanson comparison.  Formula `(1)` is the exact combinatorial reason that a
strict comparison between two such assignments contradicts the row
equalities.

## 2. What pigeonhole proves, and what it does not

There are exactly `4^n` assignments.  A target-multiplicity vector is a weak
composition of `n` into `n` parts, so there are at most

```text
choose(2*n - 1, n - 1) = (1/2) * choose(2*n,n) < 4^n
```

such vectors.  Pigeonhole therefore proves that two distinct assignments
have identical target multiplicities.

It does **not** prove that their crossing profiles are comparable.  A
multiplicity fiber can contain a large antichain, and the first collision
found can have flux of both signs.  The missing step is a width theorem for
the intersection of this circular crossing-profile poset with a four-choice
product box.  Ordinary counting of multiplicity vectors does not supply that
theorem.

## 3. The two-cycle obstruction becomes a product collision

The partial minimized schema-4 core contains two individually mixed two-row
swaps.
Write

```text
f1 = {0 -> 6, 7 -> 8},       g1 = {0 -> 8, 7 -> 6},
f2 = {6 -> 1, 8 -> 7},       g2 = {6 -> 7, 8 -> 1}.
```

Each pair has the same target multiplicities.  Nevertheless, both flux
differences `F(f1-g1)` and `F(f2-g2)` have minimum `-1` and maximum `1`.
Thus both assignment collisions are incomparable.

The four-row product box permits the opposite coupling

```text
f = f1 union g2
  = {0 -> 6, 7 -> 8, 6 -> 7, 8 -> 1},

g = g1 union f2
  = {0 -> 8, 7 -> 6, 6 -> 1, 8 -> 7}.
```

Now `m_f=m_g`, and direct evaluation gives

```text
F_I(f-g) = 1  for I = I(0,6) or I(0,7),
F_I(f-g) = 0  for every other basis interval.
```

Thus the known two-cycle obstruction does not refute the assignment route.
It refutes the shorter core-local argument "take any multiplicity collision":
the two mixed swaps must first be coupled with opposite orientations.  Since
schema 4 is only a partial minimized equality core, it does not decide whether
some additional assignment pair or favorable simple cycle must occur after
all four targets in every row are restored.

Notice that the two swaps are disjoint in the doubled center/target incidence
graph.  Their coupling is visible only after the left and right copies of an
underlying carrier label are identified in the circular cut profile.  A
purely incidence-graph-local uncrossing argument therefore misses exactly the
mechanism used by this certificate.

## 4. The W(3,3) contour is already one comparable pair

The compact card-forty seed-1 certificate uses

```text
f = {3 -> 34, 4 -> 25, 7 -> 12, 8 -> 37},
g = {3 -> 37, 4 -> 34, 7 -> 25, 8 -> 12}.
```

Both assignments use the target multiset `{12,25,34,37}`.  Their exact flux
profile satisfies

```text
F_I(f-g) in {0,1}
```

for every basis interval, and is `1` on exactly 64 intervals.  Hence the
high-girth W(3,3) contour is a single comparable assignment pair, despite
having no local shared-pair explanation.

## 5. Assignment pairs are stronger than general coupled circulations

The displayed equality support of minimized bank core 79 is

```text
S(2) = {1,4,8},
S(4) = {3,5,8,11},
S(5) = {4,11},
S(7) = {3,5}.
```

It has `3*4*2*2 = 48` assignments.  Exact exhaustive enumeration groups all
48 by target multiplicity and compares every profile within each group.
There is no distinct equal-multiplicity pair with a nonzero one-signed flux.

The bank nevertheless contains an independently replayed exact positive
contour on this core.  Its row expression at center `4` is

```text
(d(4,3)-d(4,11))
- (d(4,3)-d(4,5))
- (d(4,3)-d(4,8))
  = d(4,5)+d(4,8)-d(4,3)-d(4,11),
```

so its positive and negative row masses are both two.  It cannot be the
difference of one assignment on this displayed support.

This is not a counterexample to the proposed **full four-target product-box
theorem**: core 79 is a partial deletion-minimal equality support, not a full
four-target row at every carrier point.  It is, however, an exact warning
that the general circulation lemma is strictly more flexible than a
single-assignment-pair lemma.  A proof through assignments must prove the
stronger full-box statement; it cannot claim that every known positive
contour has that form.

## 6. Precise remaining theorem

The assignment route would close if one proved the following.

> **Circular product-box comparability theorem.**  Let `V` be a finite
> cyclically ordered set and let `S(c) subset V \ {c}` have cardinality four
> for every `c`.  After restricting to a sink strongly connected component,
> and assuming that every shared target pair alternates with its two centers,
> there exist distinct assignments `f,g in product_c S(c)` with `m_f=m_g`
> such that `O(f)` and `O(g)` are coordinatewise comparable and not equal.

Pair alternation is harmless in this statement: a nonalternating shared pair
already gives a comparable two-row swap.  Strong connectivity is also the
same sink-component reduction used by the circulation route.

Equivalently, for some multiplicity vector `m`, the fiber

```text
A_m = {f in product_c S(c) : m_f=m}
```

is not an antichain in the circular cut-crossing order.  Pigeonhole gives a
fiber of size at least

```text
ceil(4^n / choose(2*n-1,n-1)),
```

which is on the order of `sqrt(n)`, but no width bound strong enough to force
comparability has been proved.  Establishing such a product-box-specific
width or uncrossing theorem is the exact remaining burden of this route.

## 7. Exact first-feasible-card decision

The complete theorem surface has now been decided at its first feasible
cardinality.  Pair alternation alone excludes cards five through seven.  At
card eight, [`search_full_product_antichain.py`](search_full_product_antichain.py)
enumerates complete strongly connected pair-alternating four-target tables by
CEGAR.  Its exact inner query found 256 distinct comparable-assignment support
cuts across the first two tables; those cuts exhaust the outer surface.

The saved 56-variable, 1,238-clause CNF is `UNSAT`.  Its DRAT proof is
independently `VERIFIED`, and
[`verify_full_product_antichain.py`](verify_full_product_antichain.py) replays
all 256 assignment certificates directly from integer multiplicities and
circular interval profiles before reconstructing the CNF.  The canonical
artifacts are `full_product_antichain_n8.{json,cnf,drat}` and
`full_product_antichain_n8.replay.json`; the exact reproduction command is in
[`REPORT.md`](REPORT.md).

This settles only the finite card-eight instance.  It is positive evidence
for the circular product-box comparability theorem, not a generic proof and
not a Lean closure result.

## 8. Epistemic conclusion

- The assignment-to-flux reduction is **PROVED** by `(1)`.
- The multiplicity collision is **PROVED** by counting.
- The implication from collision to comparability is **FALSE**.
- Schema 4 and W(3,3) are **EXACTLY VERIFIED POSITIVE TESTS** for the stronger
  product-coupling mechanism.
- Core 79 is an **EXACTLY ENUMERATED LIMITATION** of single-assignment pairs on
  a partial bank support.
- The complete card-eight product box is **EXHAUSTIVELY UNSAT WITH A VERIFIED
  DRAT PROOF** after 256 exactly replayed comparable-pair cuts.
- The full circular product-box comparability theorem is **OPEN**.
