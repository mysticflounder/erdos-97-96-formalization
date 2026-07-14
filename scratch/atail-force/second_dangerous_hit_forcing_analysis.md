# ATAIL second-dangerous-hit forcing analysis

Date: 2026-07-13

## Verdict

The arc-overtake consumer is complete, but its live forcing theorem is not a
routine consequence of the current library.

- **PROVEN / kernel-checked elsewhere:**
  `LiveArcOvertakeProducer.false_of_liveArcOvertakeFields` turns the dangerous
  `p`-row, one critical row through source `p`, the supplied `u` row, and the
  cyclic order `p,A,D,E,u,C` into `False`.
- **PROVEN from current live data:** the dangerous class is the exact
  four-point class

  ```text
  B = {q,t1,t2,t3}
  ```

  centered at `p`; `u` is outside this class; the supplied `u` row is an exact
  four-point class centered at a carrier point different from `p`; and its
  intersection with `B` has cardinality at most two.
- **NOT PROVEN:** a positive two-point intersection with `B`, localization of
  the `u`-row center in `B`, localization of a deletion blocker for `p` in
  `B`, a second dangerous point in that blocker row, or the required cyclic
  order.
- **DECISION:** no additional CEGAR round is a prerequisite.  The current
  post-arc round-19 shadow already avoids the consumer at the first positive
  incidence field, with the supplied `u` row meeting `B` in exactly one
  point.  More blind rounds can mine more consumers, but cannot prove the
  arbitrary-cardinality live forcing statement.

The producer should therefore be attacked as two genuine geometric lemmas:

1. an **aligned-incidence lemma** producing the two row clusters; and
2. an **arc-order lemma** putting the six selected labels in the overtaking
   order, or producing an already-consumed alternate.

The second lemma does not follow automatically from the first.

## Required theorem-bank preflight

Before this analysis, the required current registry and all three mined bank
inventories were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were also run for critical-shell blocker centers,
source membership, selected-class intersections, two-center shared pairs,
Moser caps, and cyclic-order consumers.  The relevant hits are the current
critical-shell exactness/uniqueness theorems, two-circle upper bounds, cap
intersection upper bounds, and already-used contradiction consumers.  No
bank theorem supplies a positive aligned second hit or the six-label order
from the current K-A-PAIR hypotheses.

## Routine reductions already available

Write

```text
B = {q,t1,t2,t3},
R = rows.uRow.selected.toCriticalFourShell.support,
d = rows.uRow.center.
```

The following reductions are already available without new geometry.

1. `dangerousBaseSelectedFourClass hfixed` gives a selected class centered at
   `p` whose support is exactly `B`; `hfixed` gives `|B|=4` and all four
   equal-radius equations.
2. `H.selected_off_circle` gives `u notin B` after the exact dangerous-radius
   identification.
3. The `CriticalRowPacket` fields give `d in D.A`, `d != u`, `u in R`,
   `|R|=4`, and exactness of `R` as the whole ambient radius filter.
4. `uRow_center_ne_p hlocalNoQFree rows H` gives `d != p`.
5. `SelectedFourClass.inter_card_le_two` then gives

   ```text
   |R intersect B| <= 2,
   ```

   and the checked finite-set adapter gives

   ```text
   2 <= |R minus B|.
   ```

   This is an upper bound on the desired intersection, not a lower bound.
   Producing two dangerous hits means proving the maximal possible equality
   `|R intersect B|=2`.
6. For any `Hsys : CriticalShellSystem D.A`, the row selected for source `p`
   has a carrier center `a != p`, exact support of cardinality four, and
   contains `p`.  Nothing current proves `a in B` or a positive intersection
   of that support with `B`.
7. `D.convex` and `hncol` give a `BoundaryIndexing D.A`, but they do not give
   the relative order of prescribed labels.

There is also an important interface boundary.  A
`CriticalRowPacket` retains an exact full shell but does not retain the
`CriticalShellSystem.no_qfree` proof.  The K-A-PAIR declaration receives the
five `rows` and `hcritical : Nonempty (CriticalShellSystem D.A)` independently.
Thus critical deletion for the particular supplied `u` row is not available
on that signature.  The outer Route-B wrapper constructs all five rows from
one `Hcritical`, so a producer placed before this information is forgotten can
use the stronger provenance equality

```text
rows = CriticalSourceRows.ofCriticalShellSystem Hcritical ... .
```

Restoring that equality is useful, but it does not itself give either a
dangerous hit or an order statement.

## Weakest exact terminal producer in the current vocabulary

The explicit finite-set equality in `LiveArcOvertakeFields` need not be an
extra hypothesis.  It follows from membership plus cyclic distinctness and
`|B|=4`.  Consequently the weakest useful raw producer can be stated as
follows (pseudocode; no new `sorry` declaration is proposed):

```lean
-- All current K-A-PAIR/live binders remain in scope.
theorem exists_alignedArcOvertakeRaw :
  exists (Hsys : CriticalShellSystem D.A)
    (boundary : BoundaryIndexing D.A)
    (A C D0 E : RealPlane),
      A in B and C in B and D0 in B and E in B and
      rows.uRow.center = D0 and
      A in R and E in R and
      Hsys.centerAt p hfixed.p_mem = A and
      C in (Hsys.selectedAt p hfixed.p_mem).toCriticalFourShell.support and
      CyclicSubsequence boundary p A D0 E u C
```

Here each point in the final `CyclicSubsequence` is packaged with its already
displayed carrier-membership proof.  This statement is slightly weaker than
directly producing `LiveArcOvertakeFields`:

- the cyclic subsequence makes `A,C,D0,E` distinct;
- their membership in the four-element set `B` then gives

  ```text
  {A,C,D0,E} = B;
  ```

- the remaining fields copy directly into `LiveArcOvertakeFields`; and
- `false_of_liveArcOvertakeFields` closes the branch.

On the stronger outer-wrapper surface, `Hsys` should be the retained
`Hcritical`, not a newly chosen unrelated system.  On the present pair
surface, existentially choosing a good `Hsys` is the weakest faithful form;
proving the fields for an arbitrary `Classical.choice hcritical` would be
strictly stronger and is obstructed by the checked dangerous-blocker override.

A closure-robust version may replace the last conjunction by a disjunction:

```text
aligned arc-overtake packet
or DangerousRowSameCapSecondCenter
or HasGlobalNestedPairProducer
or the already-consumed five-row pattern.
```

Every right-hand alternative must be one of the exact named consumer inputs;
an untyped phrase such as “some alternate” is not a closure theorem.

## The two independent missing stages

### Stage I: aligned incidence

Even before order is considered, the raw producer needs two separate
alignments.

1. **The `u`-row alignment:** `d in B` and two distinct points `A,E` in
   `R intersect B`.
2. **The `p`-critical alignment:** a critical row for source `p` centered at
   that same `A`, with another dangerous point `C` in its exact support.

The stronger common-system form

```text
centerAt p = centerAt C = A
```

automatically supplies `C`-membership, but it is stronger than the direct
support-membership field.  Blocker-fiber counting does not force this fixed
collision: the exact blocker abstractions admit injective fixed-point-free
cycles, and the dangerous-blocker override can send every dangerous source to
`p`.

The Stage-I boundary is now kernel-checked in
`stage1_aligned_incidence_boundary.lean`: its
`LiveArcOvertakeStageOneFields` structure is exactly the final live packet
with the cyclic field removed, it implies
`|uRow.support intersect B| = 2`, and adding the cyclic field reconstructs
`LiveArcOvertakeFields`.  The companion
`stage1_one_hit_incidence_countermodel.lean` makes the round-19 obstruction
kernel-exact at the finite-incidence level.  Even with one common system for
all five supplied rows, source membership, support cardinality four,
same-center rigidity, and pairwise overlap at most two, the p-critical row is
centered at `A` and contains `C` while the u-row is centered at `D` and meets
`B` only in `{A}`.  This is not a Euclidean/live counterexample; it proves
that common provenance and incidence alone cannot create the second hit.

The post-arc round-19 shadow isolates the first failure sharply.  In its live
labels,

```text
p-row  = {t2,t1,q,t3},
t2-row = {p,t1,6,7},
q-row  = {t2,u,6,8}.
```

Thus the dangerous and `p`-critical clusters remain, while the supplied
`u` row at center `q` has only the hit `t2`; the missing field is exactly a
second dangerous member such as `t3`.  This is exact finite-shadow evidence,
not a live counterexample.

### Stage II: cyclic overtaking order

The order `p,A,D,E,u,C` is independent of the row incidence.  It must be
proved from MEC/cap/global-order data or replaced by a consumed alternate.
Convex independence alone only supplies a boundary enumeration.

The following exact algebraic local model demonstrates the separation.  Put

```text
O = (0,0)
A = (1,0)
C = (1/2,sqrt(3)/2)
D = (12/13,5/13)
E = (119/169,120/169)
F = (12/13,(5-sqrt(26))/13)
G = (1-sqrt(2)/2,sqrt(2)/2)
H = (1-sqrt(3)/2,1/2)
I = ((24+sqrt(39)-sqrt(13))/26,
     (10-sqrt(39)-sqrt(13))/26).
```

Exact substitution gives three full four-point radius filters:

```text
center O, radius^2 1:     {A,C,D,E}
center A, radius^2 1:     {O,C,G,H}
center D, radius^2 2/13:  {A,E,F,I}.
```

No other displayed carrier point lies on any of these three radii.  Deleting
`O` leaves only three points on the selected radius at `A`, and deleting `F`
leaves only three at `D`; direct inspection of the remaining exact squared
distances finds no other four-point class at either center.  Thus the model
has the local exact-filter and deletion-critical content used by the two
aligned rows:

```text
B = {A,C,D,E},
the p-source row is centered at A and contains O,C,
the u-row is centered at D and contains A,E,F.
```

All nine points are in strict convex position.  An exact radical sign check
gives the CCW hull order

```text
O,F,A,I,D,E,C,G,H.
```

Hence the six distinguished points occur as

```text
O,F,A,D,E,C,
```

not as `O,A,D,E,F,C` (nor its reflected target).  This is an exact algebraic
countermodel to deriving the cyclic clause from strict convexity plus the
three local exact rows and their aligned hits.  It is **not** a counterexample
to the live theorem: it has only nine points and does not supply global K4, a
global critical-shell system, the circumscribed MEC/cap packet, the two-large-
cap profile, or no-`M44`.  Its role is to show that any proof of Stage II must
visibly use such global data; it cannot be a routine reorder of Stage I.

## What the full live fields do and do not currently provide

### Exact filters and critical deletion

Exactness turns every selected critical support into the whole ambient radius
filter and makes equal-center supports rigid.  Critical deletion says the
source is indispensable to the selected center's K4 supply.  Neither property
gives a positive intersection with a different exact circle.  Two distinct
circles can meet the carrier in zero, one, or two common points; the current
library proves only the upper bound two.

On the pair signature, deletion criticality for the supplied `u` row is
additionally unavailable because its common-system provenance was erased.  A
proof intending to use this field should be stated at the outer common-system
surface or explicitly widen the pair interface.

### Cap positions and no-`M44`

The cap library gives:

- every carrier point lies in one or two indexed caps;
- a selected row whose center lies in a cap has at most two support points in
  that cap; and
- `hNoM44` plus the surplus cap produces a second cap of cardinality at least
  five.

These are marginal statements.  They do not align `p` with the `u`-row
center, do not identify points outside a cap with dangerous points, and do not
place the six labels in the overtaking order.  The exact `(4,5,6)` relaxed
Euclidean witness already shows that two independent complement bounds do not
produce the desired cross-intersection.

### MEC and nonobtuseness

The existing MEC straddling core consumes a specified row/order pattern and
then proves one of two points lies outside the MEC disk.  It does not select
the relevant row points.  To use MEC in the producer, one needs a new
classification of a failure of Stage I or Stage II into a named straddling or
nested-pair alternate.  No current theorem performs that classification.

## Concrete next theorem chain

The shortest honest proof program is now:

1. **Retain common provenance** at the outer live caller, or explicitly add
   the equality identifying `rows.uRow` with the selected row of one
   `CriticalShellSystem`.
2. Prove `aligned_second_dangerous_hit_or_alternate`: use the exact filters,
   critical deletion, all-center K4, cap sizes, and no-`M44` to produce the two
   Stage-I row clusters, or one exact existing alternate.
3. Prove `arc_overtake_order_or_alternate`: from those clusters plus the
   circumscribed MEC frame and cap-block order, produce
   `CyclicSubsequence boundary p A D E u C`, or one exact existing alternate.
4. Use the routine raw-to-`LiveArcOvertakeFields` adapter described above and
   invoke `false_of_liveArcOvertakeFields`.

The first new mathematical field encountered by the current finite shadow is

```text
2 <= |rows.uRow.support intersect B|.
```

But a live theorem containing only this lower bound is still insufficient: it
must align one hit with the `p`-critical center, supply the second point in that
critical row, localize the `u`-row center in `B`, and settle the independent
cyclic-order stage.  Therefore the raw terminal packet above, preferably with
named consumed alternatives, is the correct theorem boundary.

## Epistemic ledger

- **PROVEN / current Lean:** all routine reductions listed above and the final
  arc-overtake consumer.
- **EXACT ALGEBRAIC CHECK, not kernel-checked:** the nine-point local model and
  its three exact rows / strict convex hull order.
- **EMPIRICALLY VERIFIED, exact finite shadow only:** the post-arc round-19
  one-hit survivor.
- **CONJECTURED:** the complete live MEC/cap/full-filter/no-`M44` package forces
  the raw terminal packet or a named consumed alternate.
- **REFUTED as a routine implication:** cyclic overtaking order from aligned
  exact rows plus strict convexity alone.
