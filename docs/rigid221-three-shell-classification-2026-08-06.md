# Rigid221 exact-17 three-shell classification

Date: 2026-08-06

## Scope

This audit classifies irreducible contradictions formed by exactly three
same-center distance equalities on four, five, or six cyclically ordered
vertices.  The ambient exact-arithmetic theory consists of positivity,
strict triangle inequalities, and both strict Kalmanson inequalities for
every ordered quadruple.  A classified triple uses every displayed vertex,
is infeasible in that theory, and every two-equality subpattern is feasible.

This is a cardinality-independent obstruction bank.  It is not a proof that
the live Rigid221 exact-17 hypotheses force one of the obstructions, and it is
not a complete classification of Euclidean realizability beyond this
three-equality linear fragment.

## Census

| vertices | literal contradictions | rotation orbits | dihedral orbits |
| ---: | ---: | ---: | ---: |
| 4 | 16 | 4 | 2 |
| 5 | 60 | 12 | 6 |
| 6 | 40 | 8 | 4 |
| **total** | **116** | **24** | **12** |

The classifier and exact JSON outputs are under
`scratch/rigid221-blockerv-exact17-20260806/`.  The analyzer reports no
rotation orbit absent from the Lean bank.

## Lean bank

`KalmansonThreeEqualitySchemas.lean` contains 40 explicit fixed-order
theorems.  Some are historical duplicates at the orbit level, but together
they meet all 24 orientation-preserving rotation classes.  The final seven
missing orientations added at this checkpoint are:

- `false_of_four_ccw_three_shell_equalities_013_023_312`;
- `false_of_four_ccw_three_shell_equalities_013_103_201`;
- `false_of_five_ccw_three_shell_equalities_012_413_423`;
- `false_of_five_ccw_three_shell_equalities_013_412_423`;
- `false_of_five_ccw_three_shell_equalities_014_024_312`;
- `false_of_five_ccw_three_shell_equalities_023_024_134`;
- `false_of_six_ccw_three_shell_equalities_035_215_413`.

Each is an ordinary `linarith` consequence of named strict Kalmanson
inequalities and has axiom closure exactly `propext`, `Classical.choice`, and
`Quot.sound`.

The theorem `false_of_cyclicShift_ccw` transports any checked schema across a
cyclic change of cut while preserving injectivity, the enumerated carrier,
and CCW convexity.  The concrete theorem
`false_of_four_ccw_three_shell_equalities_013_023_312_cyclicShift` consumes
that transport.  This is the formal soundness contract for expanding the 40
fixed-order representatives to all 116 literal rotations in the exact-17
miner.  Reflections are not inferred from this theorem; both chiral rotation
classes are present explicitly in the bank.

## Closure status

The result closes the finite theorem-bank coverage gap.  It does **not** close
exact-17 or the universal on-spine residual.  The next required producer is a
source theorem showing that every live exact-17 Rigid221 row assignment
contains one of these 116 motifs, or a different bounded obstruction already
accepted by the exact replay.  A SAT Boolean survivor after imposing the full
rotation closure would show that the three-shell family alone is insufficient
and identify the next missing global constraint.

## Exact-seventeen second-cap-nine exact-cover terminal

The exact-seventeen source-heavy branch has a terminal separate from the
three-shell bank. The carrier has 17 points and the second cap has the exact
nine-point set `C9 = {ℓ, r, u, v, c, δ, x_v, e, x_u}`. The four old exact rows
are centered at `v`, `x_v`, `δ`, and `c`, with cap slices

```text
R_v  ∩ C9 = {u, x_v}    R_xv ∩ C9 = {u, x_u}
R_δ  ∩ C9 = {v, x_v}    R_c  ∩ C9 = {v, δ}.
```

Lean selects these rows at the respective deletion sources `x_v`, `u`, `v`,
and `δ`; the displayed subscripts name their proved geometric centers rather
than their source-row object names.

The eight points outside `C9` split into four disjoint two-point portions, one
for each row.  This already determines the complete pairwise intersections:

```text
R_xv ∩ R_v = {u}     R_v ∩ R_δ = {x_v}     R_δ ∩ R_c = {v},
R_xv ∩ R_δ = ∅       R_xv ∩ R_c = ∅         R_v ∩ R_c = ∅.
```

Their union is the outside set together with `{u, x_u, v, x_v, δ}`.
Consequently `ℓ`, `r`, `c`, and `e` are exactly the four carrier points
omitted by all four old rows.  These are derived consequences of the exact cap
slices and outside multiplicity one, not additional source assumptions.  The
base finite encoding already entails them, so restating them does not create a
new CEGAR cut.

The cocircular-pentagon order theorem has retired the second formerly possible
named order.  The surviving source packet has, up to reversal, only

```text
ℓ < u < v < c < δ < x_v < e < x_u < r.
```

The eliminated order placed `e` between `δ` and `x_v`.  Its exclusion uses
the common physical circle and the fact that its carrier apex lies outside the
selected cap; it is not a consequence of the five displayed betweenness facts
alone.  The source constructor now returns only `source.model.order = 0`.

Upstream invariants also fix the physical five-class
`H = {u, x_u, v, x_v, δ}`, give `R_e ∩ H = {x_u, δ}`, and give a further
row `R_d` containing `c`, whose center is not one of the four old centers and
whose physical trace has cardinality at most one.  Different rows have their
own radii; no common radius across the four old rows is asserted.

There are two representation boundaries that subsequent theorem mining must
respect:

1. Source membership in an exact shell is not by itself the blocker property.
   The selected critical-shell system additionally carries `no_qfree`, which
   rules out every positive-radius class containing at least four remaining
   carrier points at the center after deletion of the source.  Without that
   clause, another radius could survive.
2. In the geometric branch the named rows at `e` and `d` come from exact
   critical shells.  The finite `SourceRealization`, however, exposes a
   selected four-support at every center and does not retain full-shell
   exactness as a field for arbitrary rows.  A finite omission may therefore
   be treated as an off-circle fact only where a separate exact-shell bridge
   supplies it.

The unused-outside-point arm is closed.  The exact-cover arm remains
**OPEN**, but the literal `sorry` currently on the spine is not a valid
certificate-shaped endpoint: it asks for UNSAT of
`extendedCocircularPentagonOrderCnf`, while that exact 7,198,853-clause root
has an independently replayed satisfying assignment.  It must not be filled
by an axiom or an UNSAT certificate.  Closure now requires either:

- a later source-valid refinement with a proved source adapter and an
  independently replayed UNSAT certificate, followed by rewiring the spine to
  that child; or
- a direct geometric contradiction under the full typed residual hypotheses.

The evolving authenticated root and model identities are recorded in
`computational-closure-plan-2026-07-28.md`, section 13.28.24 and its successors.
Cardinality, the four-pair partition, and the six derived row intersections
alone remain insufficient and must not be promoted as a closure argument.

## First obstruction beyond the three-shell bank

The first authenticated survivor of that completed bank is nevertheless
linearly impossible.  Its contradiction is supported on seven cyclically
ordered points `a < b < c < d < e < f < g` and five shell equalities:

```text
d(a,f) = d(a,b)    d(f,a) = d(f,d)    d(f,a) = d(f,g)
d(c,d) = d(c,g)    d(e,f) = d(e,b).
```

This is schema C in `KalmansonFourEqualitySchemas.lean`.  Both cyclic
orientations are proved without `sorryAx` or compiler trust.  More importantly
for source ingress, the same file now proves direct selected-row adapters: it
is enough that four full selected rows centered at `a`, `f`, `c`, and `e`
contain respectively `{f,b}`, `{a,d,g}`, `{d,g}`, and `{f,b}`.  No equality
closure or reconstruction in the miner is needed.

The production theorem-bank matcher recognizes both orientations and fails
closed unless both Lean adapters are present.  Its authenticated exact-17
regression uses the encoder's actual boundary order

```text
(0,6,8,11,10,9,12,7,2,15,16,3,4,5,1,13,14)
```

and finds the roles `(a,b,c,d,e,f,g) = (0,11,3,4,5,1,13)` in the old terminal
model.  The direct Boolean encoding adds 272,272 unique negative clauses over
all rotations, seven-point subsets, and both orientations.  Exactly one of
those clauses rejects that terminal assignment.  This is a new
cardinality-independent obstruction and a complete ingress path for the
motif, but it is still not exact-17 coverage or universal Rigid221 closure.

## Successor selected-row obstructions D, E, and F

The next authenticated exact-17 replay wave produced three further bounded
strict-Kalmanson contradictions.  They are expressed directly in terms of
four selected rows, so their Lean theorems consume the same data that the
Boolean encoder assigns rather than equality systems reconstructed only by
the miner:

```text
D: a:{e,b}, e:{a,c,f}, b:{e,f},   d:{e,b,c}
E: a:{f,d}, e:{b,c},   b:{a,c,d}, c:{f,b}
F: a:{f,c}, f:{a,g,c}, b:{f,e},   d:{b,e,g}
```

Schemas D and E use six cyclically ordered points; schema F uses seven.
`KalmansonFourEqualitySchemas.lean` proves both orientations of each metric
contradiction and both orientations of each direct selected-row consumer.
The selected-row consumers have axiom closure exactly `propext`,
`Classical.choice`, and `Quot.sound`.

The production matcher checks the displayed row incidences, fails closed if
the corresponding Lean consumers are absent, and has authenticated exact-17
regressions with roles

```text
D: (a,b,c,d,e,f)   = (0,2,3,4,1,14)
E: (a,b,c,d,e,f)   = (0,6,8,11,5,1)
F: (a,b,c,d,e,f,g) = (0,2,15,3,4,1,13).
```

The exact Boolean encoding contributes 148,512 clauses for each of D and E
and 272,272 clauses for F.  Together with schema C, the completed three-shell
rotation bank, and 1,610 authenticated learned patterns, the C--F CNF has 272
variables and 1,933,791 clauses.  Its SHA-256 digest is
`7b5c525ef0fa2422fd00aa752156e4530f266013b7cea658a98ff5816576bd0c`.

The preceding 16-worker wave classified 1,512 assignments: 1,451 were
rejected by the theorem bank, 58 were exactly linearly infeasible, and three
initial metric timeouts were resolved by fresh exact replay.  Thirteen workers
reached their iteration cap, so this census did not close exact-17.  Its 1,610
deduplicated learned patterns seed the successor wave.  Thus D--F enlarge the
cardinality-independent consumer bank and strengthen the exact-17 search, but
do not by themselves close an on-spine `sorry`.

## Successor selected-row obstruction G

The source-frozen C--F successor wave exposed a further six-point obstruction:

```text
G: a:{b,d}, b:{c,f}, c:{b,d}, e:{c,f}.
```

The four displayed rows contribute exactly four shell equalities.  Four strict
Kalmanson inequalities sum to an immediate contradiction after those
equalities are substituted.  `KalmansonFourEqualitySchemas.lean` proves both
cyclic orientations of the metric statement and direct selected-row consumers
for both orientations.  All four declarations have axiom closure exactly
`propext`, `Classical.choice`, and `Quot.sound`.

The production matcher recognizes G directly from selected-row membership and
fails closed unless both Lean consumers are present.  Its regression is the
authenticated exact-17 record from seed 1801, iteration 41, with reverse-order
roles

```text
(a,b,c,d,e,f) = (6,0,1,16,15,11).
```

An exact replay snapshot over the first 2,093 records of the still-running
C--F successor waves found 15 G occurrences.  Thirteen were previously sent
to exact linear arithmetic and two were already rejected by another theorem-
bank entry.  Static admission of G contributes 148,512 unique clauses at
exact-17.  This is measurable reuse and removes thirteen observed linear
queries, but it is not terminal exact-17 coverage and does not close an
on-spine `sorry` by itself.  The running waves remain authenticated to their
pre-G source hashes; G belongs in their versioned successor rather than being
inserted into the live source-frozen encoders.
