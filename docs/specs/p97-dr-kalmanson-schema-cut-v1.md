# D–R Kalmanson three-equality cut

Status: diagnostic, source-backed, not promotion eligible.

## Purpose

The authenticated card-14 structural survivor for the `firstOppositeO1Six`
profile was produced without the cardinality-independent Kalmanson
three-equality contradictions already proved in
`KalmansonThreeEqualitySchemas.lean`.  This cut family replays those theorems
at the equality-pattern level before treating the survivor as evidence for a
new geometric obstruction.

This is not an arbitrary-cardinality closure.  Rejecting a fixed-card model
only diagnoses an omitted known consumer; the Lean target still needs a
source theorem that extracts one forbidden bounded pattern from every live
two-radius branch.

## Encoding

For every increasing subsequence of four, five, or six labels in the frozen
cyclic boundary order, instantiate every unique theorem suffix of the form

```text
false_of_{four,five,six}_ccw_three_shell_equalities_abc_def_ghi
```

from `Problem97.CapCrossingKalmansonBridge`.  An atom `abc` denotes

```text
dist(role[a], role[b]) = dist(role[a], role[c]),
```

represented by `same(role[a]; role[b], role[c])`.  The emitted clause is the
all-negative three-literal nogood for the theorem's three atoms.  The cyclic
shift alias of schema `013_023_312` is not emitted twice.

The inventory has 4 four-role, 17 five-role, and 19 six-role schemas.  At
cardinality `n`, the family therefore emits

```text
4 * C(n, 4) + 17 * C(n, 5) + 19 * C(n, 6)
```

clauses: 57,343 at card 13 and 95,095 at card 14.

## Admission boundary

Every clause maps to a kernel-checked theorem in
`lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean`.  These
theorems require the increasing boundary order and the three named distance
equalities; they do not impose a fixed ambient cardinality.

The family is opt-in and generic-mode only.  It changes neither the legacy
exact-12 encoding nor the default generic encoding.

## Validated replay

The retained authenticated `firstOppositeO1Six` card-14 assignment violates
the instantiated six-role schema `301_415_205` on ordered labels
`(1, 5, 0, 8, 9, 2)`.  A regression test reconstructs the three exact relation
variables from the encoder layout and checks both that the clause is emitted
and that the recorded assignment falsifies it.  This establishes that this
survivor resulted from omission of a known generic cut; it does not establish
UNSAT for the augmented card-14 CNF.

## Next source obligation

Because the authenticated survivor violates this family, the next producer
is not another fixed-card census.  It is a bounded-role extraction theorem
from the live D–R packet: select ordered boundary labels and prove either one
banked three-equality schema or a closed
`SelectedRowOrdinalComparison` transitive cycle.  The current source provides
one cross-incidence through
`nonempty_radiusAnchoredPhysicalRowCrossHit`; it does not yet provide the
additional ordered row incidences needed by those consumers.  The smallest
useful next experiment is to test whether two such cross-hits suffice to force
a banked schema or ordinal cycle before attempting that strengthening in
Lean.

A stronger candidate extraction, suggested by the Pro route review, stays in
the original ambient carrier and retains the eight sources in the two
disjoint second-apex four-classes, their actual blockers, and one selected row
at each distinct blocker.  This has boundedly many named roles without
claiming that an induced subset remains a counterexample.  Before encoding
it, the source audit must establish that none of the eight blockers is the
second apex and that each blocker row meets either apex class in at most two
points.  If those bridges hold, blocker-fiber types and cyclic-order cells can
be enumerated independently of `D.A.card`; a surviving cell would identify a
specific missing deletion/minimality antecedent, while universal
Kalmanson-infeasibility would supply the desired ambient occurrence theorem.
