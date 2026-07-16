# Descent-history incidence audit

Date: 2026-07-14

Status: **AMBIENT LIFT REFUTED; EXACT HISTORY INVARIANT KERNEL-CHECKED;
CURRENT PRODUCTION CONSUMERS STILL NOT FORCED.**

## Result

`DescentHistoryIncidence.lean` proves the strongest unconditional statement
obtained by retaining the erased pairs of the first-apex descent:

```text
ambient selected class = terminal selected class
or
ambient selected class contains a complete erased co-radial pair.
```

Consequently, if `r` is the unique K4 radius on the terminal carrier, every
different ambient K4 radius contains a complete erased history pair.  This is
a genuine ambient statement, not a restatement of the terminal trichotomy.
The direct Lean check is green, and the three public conclusions print only

```text
propext, Classical.choice, Quot.sound
```

## Why the naive lift is false

`ambient_lift_countermodel.py --check` gives an exact two-step Euclidean
radius-class counterexample about the origin.  The ambient carrier has:

- six points at squared radius `25`; and
- four points at squared radius `13`.

The first erased pair is the pair at squared radius `13`, reducing that class
from four to two.  The second erased pair is at squared radius `25`, reducing
that class from six to four.  On the terminal carrier, radius `25` is the
unique K4 radius.  In the ambient carrier it has cardinality six, not four,
and radius `13` is another K4 radius.  Thus neither terminal exactness nor
terminal uniqueness lifts.

This is an exact Euclidean statement about selected radius classes.  It is
not a `CounterexampleData` construction and therefore does not refute a
future stronger theorem using more of the global geometry.

## Interaction with the ambient critical-shell system

The required bank preflight covered the sibling and legacy registries plus
the indexed Lean corpus.  The current `CriticalShellSystem D.A` interface
exports, for each source:

- source membership in its own exact four-row;
- the blocker center and its membership in the carrier; and
- failure of K4 at that center after deleting the source.

It does not relate the history pairing to the selected critical rows.  In
particular it supplies neither directed cross incidence for the two members
of a history pair nor a second critical row containing that pair.

The Python checker therefore also includes a separately labeled exact finite
model of this exported *incidence interface*.  It has 24 sources, six blocker
centers, exact four-rows containing their own sources, and deletion-critical
rows, while each of the three tested co-radial pairs has no cross incidence.
Rows at distinct blocker centers are disjoint.  This part is exact within the
finite incidence abstraction only; it is not claimed to be Euclidean or a
full `CounterexampleData` model.

## Consumer audit

The history theorem supplies one center (`S.oppApex1`) and a shared erased
pair.  The smallest banked sink, `FourPointClosureContract` / the
`SharedPairSeparationCore`, still needs a second distinct equality-closure
center for that same pair and the forbidden nonalternating boundary order.
No history or `CriticalShellSystem` field supplies that second-center
incidence.

Using a member's own active critical blocker does not solve this gap:

- a cross hit supplies pair equidistance at that blocker, but
  `signedArea_product_neg_of_cross_membership` puts the pair on opposite
  sides, excluding the required four-point order; and
- cross survival supplies unequal distances at that blocker.

The larger EqualityCore and hinge consumers demand still more closure edges.
Therefore this history refinement does not by itself close K-A-PAIR.  Its
durable contribution is the precise next invariant:

> Every ambient K4 radius hidden by the terminal descent contains a whole
> erased pair.  Closure now requires a theorem forcing one such history pair
> into an off-frontier second-center row (or forcing one of the larger banked
> closure networks).

That is the remaining producer field; rerunning row-only mining without a
history-to-critical-row constraint will not establish it.
