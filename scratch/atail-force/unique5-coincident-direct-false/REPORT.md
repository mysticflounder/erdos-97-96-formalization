# Exact-five coincident-blocker direct-`False` audit

Date: 2026-07-22

Status: **NO DIRECT `False`; KERNEL-CHECKED REDUCTION TO AN
EXACT-FIVE JOINT THREE-CENTER DELETION, WITH THE FRESH-BLOCKER CAP SPLIT
AND THE SAME-PAIR ON-CAP ROUTE DECIDED.**

This lane owns only
`scratch/atail-force/unique5-coincident-direct-false/`.  It does not edit
production Lean, generated files, plan documents, or other scratch lanes.

## Starting surface

The input is the checked leaf

```lean
R : OriginalUniqueFiveCoincidentBlockerResidual F
```

from `OriginalUniqueResidualDispatch.lean`.  It retains the complete
exact-five first-apex radius class, first-apex singleton-deletion robustness,
the fixed total critical-shell system `H`, the strict-cap pair `q,w`, their
common actual blocker, mutual membership in the common exact critical
support, blocker localization, and the no-third-carrier-bisector theorem.
It also retains `minimal`, `noM44`, and the double-deletion blocking facts.

The source distinctions are essential:

- `SelectedClass D.A S.oppApex1 radius` is the **complete ambient
  five-point first-apex class**;
- each `H.selectedAt source ...` support is an **exact selected four-point
  critical support** fixed by the global critical system; and
- the `B₂` rows in each `CommonDeletionTwoCenterPacket` are **selected
  four-point rows after deleting one source**.

No equality between those three kinds of objects is assumed.

## Kernel-checked reduction

`CoincidentBlockerContinuation.lean` proves the following chain.

### 1. Exact common support and cap intersection

Equal actual blockers force the two complete critical supports at `q,w` to
agree:

```lean
OriginalUniqueFiveCoincidentBlockerResidual.supports_eq
```

The common support meets the first opposite closed cap in exactly `{q,w}`:

```lean
OriginalUniqueFiveCoincidentBlockerResidual
  .commonShell_inter_firstCap_eq_pair
```

The proof uses the existing ordered-cap two-hit theorem.  Thus the other two
members of the common exact support are outside that cap.

### 2. Fresh complete-class source and common deletion

The complete exact-five first-apex class has at least three strict-cap
members.  Since the common selected support has only `q,w` in that cap, there
is a fresh complete-class point outside the common support.  Therefore its
deletion preserves K4 at both the robust first apex and the common blocker:

```lean
nonempty_coincidentBlockerFreshCommonDeletion
  (R : OriginalUniqueFiveCoincidentBlockerResidual F) :
  Nonempty (CoincidentBlockerFreshCommonDeletion R)
```

### 3. Source-exact mutual-omission cycle

The fresh point's actual critical row cannot contain both `q,w`: its actual
blocker would be a third carrier point bisecting `q,w`, contrary to
`R.no_third_carrier_bisector`.  Choosing an omitted one gives two opposite
omission edges, each stored as a concrete common-deletion packet:

```lean
nonempty_coincidentBlockerMutualOmissionCycle
  (R : OriginalUniqueFiveCoincidentBlockerResidual F)
  (L : CoincidentBlockerFreshCommonDeletion R) :
  Nonempty (CoincidentBlockerMutualOmissionCycle R L)
```

This is the exact leaf-specific form of a retained-matching source-return
cycle.

### 4. Exact five forces a joint three-center deletion

Every actual critical support meets the complete first-apex radius class in
at most two points:

```lean
criticalShell_inter_firstClass_card_le_two
```

This is a Euclidean two-circle result, proved by extending any hypothetical
three-point intersection to a selected four-subpacket of the complete class.
It does not replace the complete class by that subpacket.

The two supports in the mutual-omission cycle therefore cover at most four
members of the exact-five class.  A fifth source lies in neither support.
Deleting it preserves K4 at:

1. the physical first apex;
2. the original common blocker; and
3. the fresh source's distinct actual blocker.

The two blocker survivals are packaged separately:

```lean
nonempty_coincidentBlockerJointDeletion
  (R : OriginalUniqueFiveCoincidentBlockerResidual F)
  (L : CoincidentBlockerFreshCommonDeletion R)
  (C : CoincidentBlockerMutualOmissionCycle R L) :
  Nonempty (CoincidentBlockerJointDeletion R L C)
```

This is the exact-five specialization of the production retained-matching
source-return split: its exact-four partition arm is impossible here, so the
joint-deletion arm is unconditional.

### 5. Exact cap placement and the on-cap same-pair exclusion

The fresh source's actual blocker is a carrier point distinct from the first
physical apex.  The cap partition therefore gives the exhaustive split

```lean
freshBlocker_mem_firstCap_or_otherCapInterior
```

whose conclusions are:

1. the blocker lies on the first opposite closed cap; or
2. it lies in the strict surplus-cap interior; or
3. it lies in the strict second-opposite-cap interior.

This is a source-level location theorem for the actual blocker, not a
classification of an anonymously selected row.

On the first-cap arm, the most obvious `SameCapCollisionPairCore` composition
is not merely unavailable: it is impossible.  The pointwise theorem

```lean
freshShell_omits_commonOutsidePair_of_freshBlocker_mem_firstCap
```

says that any distinct pair outside the first cap and co-radial from the
common blocker cannot have both members in the fresh actual critical shell.
It is a direct application of `outsidePair_unique_capCenter` to the two
distinct on-cap blocker centers.  Thus the common support's two known
off-cap points cannot be recycled as the fresh blocker's same-cap collision
pair.

## Why this still does not prove `False`

No checked current consumer accepts only the joint three-center deletion.
The focused follow-up audit included `CriticalFiberClosingCore`, retained
collision consumers, the U5/general-n bank, and the available Kalmanson
terminals.  The nearest routes were audited explicitly.

### Same-cap/outside-pair terminal

The common critical support contributes a known two-point pair outside the
first cap, and its common blocker is inside that cap.  One might try to apply

```lean
CapSelectedRowCounting.outsidePair_unique_capCenter
```

with the fresh blocker as the second center by proving both:

1. the fresh blocker lies in the same first cap; and
2. the **same two outside points** also lie in the fresh critical support.

The first condition is one branch of the new exhaustive cap split.  On that
branch the second condition is refuted by
`freshShell_omits_commonOutsidePair_of_freshBlocker_mem_firstCap`.  This
specializes the earlier `LocalizedCollisionOnCapOutsidePairSeparation` audit
to the exact current leaf.  Therefore a common-outside-pair producer is not
the missing theorem; it asks for a configuration the cap-order theorem
already excludes.  The on-cap arm needs a genuine
capacity/Kalmanson/global-geometry consumer using different positive
incidences.  The two off-cap arms now have exact strict-cap locations, but
still need a cross-cap row coupling.

### Retained-matching source-return route

The cycle constructed here has the exact source-return shape.  Exact five
improves that route to `CoincidentBlockerJointDeletion`, but the existing
source-return U5 bank audit records the next boundary:

- the joint source's actual q-critical row meets a chosen dangerous triple
  in at most one point, so
  `U5QCriticalTripleClass.two_triple_points_incompatibility` cannot fire;
- `u5_common_bisector_triple_incompatibility` would require one q-deleted
  blocker row to contain the first apex and all three dangerous points; that
  support containment is not supplied; and
- the one-critical/two-deleted consumers require named center identities and
  cross-row support incidences not forced by the joint-deletion packet.

Accordingly, the remaining theorem must be a direct geometric consumer that
uses information absent from the marginal cycle calculation.  In
particular, a credible proof should visibly use `R.noM44`, MEC/cap boundary
geometry, or another full-parent coupling; the reductions above do not use
`minimal`, `noM44`, or the double-deletion blocking facts.

### Exact three-center consumer mismatch

`CoincidentBlockerJointDeletion` gives one deleted source whose deletion
leaves K4 witnesses at three distinct centers: the first physical apex, the
common blocker, and the fresh source's blocker.  This is existential
**survival** data.  It does not place a named pair in the three witness rows,
and it cannot be rewritten as an equality involving the deleted source.

That distinction blocks every current direct consumer located in the bank:

- `CriticalFiberClosingCore` and the retained same-cap consumers require a
  positive pair of common shell incidences, cap placement of both centers,
  and often cyclic order.  On the first-cap arm, reuse of the known common
  outside pair is now formally ruled out.
- `JointProfileElimination` requires the same prescribed pair to be
  equidistant from three distinct carrier centers.  Three surviving K4
  witnesses do not provide that pair.
- retained different-pair consumers require a cross-hit from one actual row
  into the other collision source plus compatible boundary order.  Neither
  field is present.
- U5/general-n terminals require named center identities or specified support
  memberships.  The joint packet supplies neither, and the source-return U5
  audit already proves the actual row can meet the dangerous triple in at
  most one point.
- the checked Kalmanson terminals require precise co-radial pairs in a named
  cyclic order; deletion survival alone supplies no such equalities.

Existing exact finite-metric audits also realize the analogous
three-center-survival/cycle marginals.  They are not Euclidean full-parent
countermodels, but they show that the missing step must use the retained
MEC/cap or global minimality data rather than a generic deletion packet.

## Exact remaining Lean contract

The file records the first honest consumer boundary as a direct-`False`
statement, not another occurrence producer:

```lean
def CoincidentBlockerJointDeletionClosingStatement
    (R : OriginalUniqueFiveCoincidentBlockerResidual F) : Prop :=
  ∀ (L : CoincidentBlockerFreshCommonDeletion R)
    (C : CoincidentBlockerMutualOmissionCycle R L),
      CoincidentBlockerJointDeletion R L C → False
```

and proves the wiring theorem

```lean
false_of_jointDeletionClosingStatement
    (R : OriginalUniqueFiveCoincidentBlockerResidual F)
    (hclose : CoincidentBlockerJointDeletionClosingStatement R) : False
```

Thus proving that contract closes the original coincident-blocker leaf
without any further producer assumption.  The recommended target is a proof
of this direct consumer using the retained MEC/cap geometry and `noM44`, not
another generic common-deletion or selected-row packet.

## Theorem-bank preflight

Before deriving the reduction, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for exact-five common blockers, cap-interior
  bisectors, common outside pairs, source-return cycles, and U5 row
  consumers.

The closest reusable theorems are the two-circle/cap-counting kernels used
above and the already-audited source-return U5 consumers.  No indexed theorem
closes `CoincidentBlockerJointDeletion` or the original residual.

## Countermodel boundary

The existing cycle regressions were replayed and still pass:

```text
successor_cycle_countermodel.py
  f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b

exact_five_paired_cycle_model.py
  db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

The first is exact only in its finite symmetric distance-equality/global-K4/
total-critical-shell abstraction.  The second is an exact rational finite
metric with source-faithful exact-five and paired-common-deletion data.
Neither is a Euclidean convex/MEC realization, and neither is asserted to
realize every field of `OriginalUniqueFiveCoincidentBlockerResidual`.  They
exclude a geometry-free generic cycle closer; they do not refute a future
consumer that genuinely uses the retained full geometry and `noM44`.

## Validation

From `lean/`:

```bash
env LEAN_PATH="../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer" \
  lake env lean -s 8192 -DwarningAsError=true \
  ../scratch/atail-force/unique5-coincident-direct-false/\
CoincidentBlockerContinuation.lean
```

The command exits zero.  Every printed declaration reports exactly:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or `unsafe` declaration.
