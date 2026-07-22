# Unique-four cap-distribution terminal audit

Date: 2026-07-22

## Result

**NO IMMEDIATE DIRECT-`False` CONSUMER FOUND.**

The kernel-checked decomposition

```lean
Problem97.ATailUniqueFourClassCapDistributionScratch
  .exactFour_twoStrict_or_alignedInteriorFrontier
```

is a genuine source-level advance, but neither output currently supplies the
positive cross-row occurrence required by an existing Kalmanson, U5, third-
center, or critical-fiber terminal.  No Lean theorem is added in this lane:
the task required formalizing only a theorem that reaches an immediate
consumer, and adding another nonterminal adapter would hide the actual gap.

This is a signature audit, not a proof that no other geometric argument can
close the leaf.

## Source and bank preflight

The audit searched the indexed Lean corpus and the required registries before
considering a new local contradiction:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- `nthdegree docs search --lean` queries for exact-four cap distribution,
  `CriticalPairFrontier.secondApexDouble`, Kalmanson, continuation, and U5
  incidence consumers;
- a follow-up name/signature search for the new two-`K2`, five-role consumer
  and for weaker selected-row consumers.

The closest concrete declarations were then checked against the exact fields
of the two decomposition outputs.

## What the decomposition actually supplies

Let

```text
C = SelectedClass D.A S.oppApex1 radius.
```

The parent residual proves `C.card = 4`, uniqueness of the first-apex K4
radius, and that deleting any member of `C` destroys K4 at the first apex.

### Arm A: exact two strict hits

`ExactTwoStrictHitDistribution R` proves exactly

```text
|C ∩ strict(first opposite cap)| = 2,
|C ∩ left adjacent closed cap|  = 1,
|C ∩ right adjacent closed cap| = 1.
```

This is a complete cap-distribution theorem for the four class members.  It
does not produce a second row, a new actual blocker center, or any directed
membership between rows.

### Arm B: at least three strict hits

`AlignedInteriorFrontier R` late-selects distinct strict-cap members `q,w` of
`C` and returns:

- a reselected `CriticalPairFrontier` whose pair is definitionally `q,w`;
- the full `OriginalUniqueFourResidual` transported to that frontier;
- K4 at the second apex after deleting both `q,w`;
- `dist S.oppApex2 q ≠ dist S.oppApex2 w`.

The selection proof is important.  It first chooses a K4 radius class at the
second apex and then chooses `q,w` outside that class.  Thus the available
second-apex witness is an **omission row** for the aligned pair:

```text
q ∉ second-apex class,
w ∉ second-apex class.
```

It is not a row containing the aligned pair.  Also,

```lean
ATailCriticalPairFrontier
  .firstApex_marginal_inter_secondClass_card_le_one
```

proves that any fixed second-apex class meets the off-surplus first-apex
marginal in at most one point.  The aligned pair is deliberately on the
opposite side of the incidence needed by a shared-pair terminal.

Finally, `R.every_class_member_blocks` says deletion of either aligned member
destroys K4 at the first apex.  Hence `secondApexDouble` does not construct a
`FrontierCommonDeletionParentResidual`: it gives double-deletion survival at
only the second apex, while the first-apex exact-four class is deletion
critical.

## Exact consumer matching

### New two-`K2`, five-role consumer

The follow-up audit checked

```lean
Problem97.ExactTwoKalmansonCoreScratch
  .false_of_two_k2_three_selected_classes
```

from
`scratch/atail-force/unique4-exact-two-core-port/ExactTwoKalmansonCore.lean`.
Focused warnings-as-errors re-elaboration passed during this audit; its
printed axiom closure is exactly `propext`, `Classical.choice`, and
`Quot.sound`.
It consumes five boundary roles

```text
i0 < i1 < i2 < i3 < i10
```

and three selected rows with six memberships:

```text
Row0 centered at i0: i2, i10
Row1 centered at i1: i2, i3
Row2 centered at i2: i3, i10.
```

The two `Row0` memberships can be discharged from the live residual under the
source-faithful role map

```text
boundary i0  = S.oppApex1,
boundary i2  ∈ C,
boundary i10 ∈ C,
Row0          = the exact first-apex class C.
```

No current parent field supplies any of the other four memberships.  Global
K4 gives some selected row centered at `boundary i1` and some selected row
centered at `boundary i2`; it does not control either row's named support.
The fixed critical system does not repair this: its row selected *for* a
source is centered at that source's blocker, not generally at the source
itself, and source membership gives at most one incidence rather than either
required pair.

The order is also part of the occurrence problem.  `D.convex` supplies a CCW
boundary enumeration, but the parent does not select `i1,i2,i3,i10` whose
incidence graph embeds in that order.  Once suitable points are known, cyclic
reanchoring/reflection is boundary bookkeeping; it does not create the four
missing memberships.

The cap-distribution arms add no edge of this graph:

- `ExactTwoStrictHitDistribution` locates the four members of `C` as
  `2+1+1` across the three caps, but supplies no row at either non-apex role.
- `AlignedInteriorFrontier` supplies two strict members of `C` and a
  second-apex deletion witness.  That witness is centered at the second
  apex, not at `i1` or `i2`, and its lifted class omits the aligned pair.
  It therefore supplies none of the four missing positive memberships.
- The base `OriginalUniqueFourResidual` supplies exactness and deletion
  criticality of `C`, not an order-compatible two-row chain outside `C`.

Thus the smallest source-faithful producer aimed specifically at the new
consumer should omit the already-derived `Row0` data and assert only the
order-compatible two-step occurrence:

```lean
-- CONJECTURED source occurrence; schematic interface
exists_ordered_twoStep_selectedClass_occurrence
    (R : OriginalUniqueFourResidual F) :
    ∃ boundary i0 i1 i2 i3 i10 Row1 Row2,
      BoundaryContract D.A boundary ∧
      i0 < i1 ∧ i1 < i2 ∧ i2 < i3 ∧ i3 < i10 ∧
      boundary i0 = S.oppApex1 ∧
      boundary i2 ∈ C ∧ boundary i10 ∈ C ∧
      Row1.center = boundary i1 ∧
      boundary i2 ∈ Row1.support ∧
      boundary i3 ∈ Row1.support ∧
      Row2.center = boundary i2 ∧
      boundary i3 ∈ Row2.support ∧
      boundary i10 ∈ Row2.support
```

This packages exactly the four unproved memberships and their required
embedding.  Restating all six memberships would duplicate facts already
proved by `R.class_card_eq_four` and the first-apex radius class.

The exact round-three finite witness explains why this pattern was not seen
by the older bank.  Its normalized roles use the first apex as `i0`, two
first-apex class members as `i2,i10`, and roles `i1,i3` outside that class.
Consequently the live class contributes exactly the two displayed `Row0`
memberships and no hidden third membership among these five roles.  This is
**EMPIRICAL WITHIN THAT FINITE PROJECTION**, not a source occurrence theorem.

### Two-row Kalmanson

```lean
Problem97.CapCrossingKalmansonBridge
  .false_of_two_selected_rows_shared_late_pair
```

needs two row centers followed in cyclic order by two distinct vertices that
belong to **both** selected rows.  The aligned data supplies the first-apex
row and existence of a second-apex row, but no two-point overlap.  The named
aligned pair `q,w` is excluded from the selected second-apex witness used to
construct the frontier.

This older consumer is still structurally closer than the new five-role
consumer.  Reanchor a boundary at the first apex and order three members
`c1 < c2 < c3` of the exact four-point class after it.  The first-apex row
already contains `c2,c3`.  A source occurrence of just

```text
some selected row centered at c1 contains c2 and c3
```

would provide the remaining two memberships and immediately feed
`false_of_two_selected_rows_shared_late_pair`.  This needs one additional
row and two positive hits, whereas the new two-`K2` consumer needs two
additional rows and four positive hits after the live `Row0` facts are used.

Moreover, if one tries to feed the new consumer by taking `i1,i2,i3,i10`
all from the exact first-apex class in boundary order, then `Row0` also
contains `i3`.  The first pair `i2,i3 ∈ Row1` already triggers the older
two-row terminal; `Row2` is redundant.  The new consumer is genuinely new
only on an occurrence using an off-class role, as in the finite round-three
pattern.

### Three-row Kalmanson

```lean
Problem97.CapCrossingKalmansonBridge
  .false_of_selected_rows_in_five_ccw_order
```

needs three selected rows and six named positive incidences.  The aligned arm
has two geometric row centers and no positive cross incidence between them.

The smallest ported four-role core,

```lean
Problem97.UniqueFourKalmansonCoresScratch
  .false_of_one_k1_three_cyclic_selected_rows
```

likewise needs three row centers and the triangular six-incidence packet

```text
row i1: i0,i2
row i2: i0,i1
row i3: i1,i2.
```

Neither distribution arm supplies that packet.

### General-n U5 bank

The prior exhaustive ingress audit found 93 normalized signed U5 schemas.
Only one uses three centers; its selected-row adapter is the tetrahedron
terminal.  Mapping three members `q,w,u` of `C` to that terminal leaves five
directed incidences to prove:

```text
w,u   in row(q),
q,u,O in row(w),
```

where `O = S.oppApex1`.  Global K4 supplies rows at `q` and `w`, but no named
members of those rows.  The cap distribution and the second-apex omission
row supply none of these five hits.

### Third-center common-pair terminal

```lean
Problem97.ATailThirdCenterCommonPair
  .false_of_thirdActualCenter_selectedRow_contains_frontierPair
```

requires, before its final third row, a directed membership of one frontier
member in the other's actual critical row and an actual blocker distinct
from the first apex.  The exact-four residual permits the first apex itself
as the deletion blocker for every class member and does not supply the
directed membership.  The second-apex omission row cannot fill either field.

### Critical-fiber and continuation terminals

```lean
Problem97.ATailCriticalFiberClosingCore.OrderedCrossRowCore.false
Problem97.ATailCriticalFiberClosingCore.SameCapCollisionPairCore.false
```

are typed over `FrontierCommonDeletionParentResidual`.  The exact-four arm is
the complementary first-apex-critical branch, so it cannot enter those
consumers.  Independently, their repeated-fiber/cross-membership and
same-cap second-center fields are absent.

The same type mismatch blocks the common-deletion continuation family:
`secondApexDouble` is not common two-apex deletion survival.

## First missing source-level occurrence

There is no justified single membership that turns either arm into an
existing terminal.  The smallest immediate-consumer target remains the
four-role, two-row occurrence:

```lean
-- CONJECTURED source occurrence; schematic interface
exists_ordered_classTriple_secondRow
    (R : OriginalUniqueFourResidual F) :
    ∃ boundary i0 i1 i2 i3 Row1,
      BoundaryContract D.A boundary ∧
      i0 < i1 ∧ i1 < i2 ∧ i2 < i3 ∧
      boundary i0 = S.oppApex1 ∧
      boundary i1 ∈ C ∧
      boundary i2 ∈ C ∧
      boundary i3 ∈ C ∧
      Row1.center = boundary i1 ∧
      boundary i2 ∈ Row1.support ∧
      boundary i3 ∈ Row1.support
```

The exact first-apex row supplies its two memberships automatically, so this
theorem reaches `false_of_two_selected_rows_shared_late_pair` directly.  It
is strictly smaller than the four-missing-membership occurrence needed for
`false_of_two_k2_three_selected_classes`.

Neither cap-distribution arm proves this row occurrence.  Exact-two cap
counts and aligned strict-pair selection locate candidate class points but do
not constrain the supports of rows centered at those points.  A proof must
therefore consume a genuinely global source lever: the complete radius
partitions, fixed critical-map provenance plus an occurrence argument,
global minimality/strong connectivity, MEC/no-`(m,4,4)` geometry, or a
checked whole-carrier coverage theorem.

## Finite-search cross-check

The independent exact-two CEGAR lane now records, in
`cegar-exact-two/manifest.json`:

- six completed rounds;
- SAT Boolean survivors for both fixed `n=11` profiles in every round;
- exact fixed-row LRA contradictions used to add ten Kalmanson schemas;
- one source-proved U5 refinement, schema 56;
- terminal status `ROUND_CAP_REACHED_UNRESOLVED`.

This is **EMPIRICAL WITHIN THE STATED FINITE PROJECTION**, not a model of
`OriginalUniqueFourResidual` and not a Euclidean counterexample.  It does
support the signature conclusion: the exact-two distribution does not
immediately instantiate the current bank.  The manifest explicitly omits
coordinates/nonlinear Euclidean realization, MEC support geometry, the full
`noM44` content, and full subset minimality.

## Recommendation

Do not add a continuation adapter for `secondApexDouble`, and do not target a
second-apex row containing the aligned pair.  The next proof/search object
should be an **occurrence theorem already packaged at an immediate terminal
boundary**:

- first choice: `exists_ordered_classTriple_secondRow`, the two-row
  shared-class-pair occurrence above;
- only if a global search naturally produces an off-class two-step chain:
  `exists_ordered_twoStep_selectedClass_occurrence`, feeding the new
  two-`K2` consumer;
- fallback: a complete three-center tetrahedron occurrence from the fixed
  critical system;
- geometric alternative: a new MEC support packet contradicting `noM44`.

Until one of those is derived, the unique-four decomposition is source-clean
and useful, but it does not close an on-spine `sorry`.
