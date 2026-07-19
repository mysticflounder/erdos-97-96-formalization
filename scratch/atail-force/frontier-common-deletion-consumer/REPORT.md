# Frontier common-deletion consumer audit

Date: 2026-07-17

Status: **SOURCE-FAITHFUL FULL-PARENT NORMAL FORM KERNEL-CHECKED; NO DIRECT
`False`.  THE STORED SECOND-APEX ROW FORCES AN OFF-CONFINEMENT ESCAPE, AND
GLOBAL MINIMALITY REACHES THE EXISTING COLLISION/MINIMAL-CORE SPLIT.**

Owned lane:

```text
scratch/atail-force/frontier-common-deletion-consumer/
```

No production source, shared closure document, proof-blueprint state, or
sibling scratch lane was changed.

## Exact input

The new production theorem

```lean
CriticalPairFrontier.originalUnique_or_commonDeletion
```

splits a retained frontier `F` into:

```text
OriginalFrontierUniqueRadiusArm F
or
FrontierCommonDeletionResidual F.
```

The right-hand packet is substantially stronger than an anonymous
`CommonDeletionTwoCenterPacket`:

```lean
CommonDeletionTwoCenterPacket
  D H F.pair.q S.oppApex1 S.oppApex2.
```

Thus the deleted source is exactly the first frontier point, the two centers
are exactly the opposite Moser apices, and the frontier and packet use the
same concrete `CriticalShellSystem H`.

The production right-hand type still erases one fact from the constructor:
it is reached from the robust arm of `F.firstApexSplit`, so deletion of both
`F.pair.q,F.pair.w` preserves K4 at `S.oppApex1`.  The scratch full-parent
record retains that witness together with:

- `D.Minimal`;
- global no-`M44`;
- `9 < D.A.card`;
- the complete frontier; and
- the source-faithful common packet.

The theorem

```lean
criticalPairFrontier_originalUnique_or_fullParentRobustCommonDeletion
```

kernel-checks the strengthened parent split.

## Verdict on direct closure

No direct contradiction follows from the current row fields.

On the robust first-apex branch, the two local survival facts stored in the
common packet were already derivable before choosing its four-point rows:

- first-apex survival follows by enlarging the carrier from the retained
  double-deletion witness; and
- second-apex survival follows the same way from `F.secondApexDouble`.

The genuinely new data in the residual are therefore two arbitrary selected
q-deleted four-point rows.  Their exact apex labels permit sharp incidence
bounds, but those bounds force a support escape rather than a terminal pair.

## Kernel-checked row boundary

Write

```text
T = (D.A.filter (fun x => dist x S.oppApex1 = radius)) \
      S.surplusCap
Kq = (H.selectedAt F.pair.q F.pair.q_mem_A).support
B2 = R.packet.B2.
```

`FrontierCommonDeletionConsumer.lean` proves:

```lean
frontierCommonDeletionResidual_secondRow_inter_marginal_card_le_one :
  (B2 ∩ T).card <= 1
```

This is the direct specialization of the production
`firstApex_marginal_inter_secondClass_card_le_one`.  Two points in the
intersection would be distinct off-surplus points co-radial from both Moser
apices, so `oppCap2_escape_gen` already refutes them.  A two-hit in `T` is
contradiction-strength, not a producer target.

The same file proves:

```lean
frontierCommonDeletionResidual_secondRow_inter_qActualSupport_card_le_two :
  (B2 ∩ Kq).card <= 2
```

because the actual blocker of `F.pair.q` is distinct from the second apex.
Since `B2.card = 4`, the two upper bounds imply:

```lean
frontierCommonDeletionResidual_exists_secondRow_offConfinement_point :
  exists z,
    z in B2 and z notin Kq and z notin T
```

This proves that the old one-row confinement target

```text
B2 subset Kq union T
```

is false on the new source-faithful residual's stored row.  It must not be
listed as the next producer for this branch.

The stronger packaged output is:

```lean
FrontierSecondRowOffConfinementEscape R
```

with fields:

- `z in B2` and hence `z in D.A`;
- `z != F.pair.q` and `z != S.oppApex2`;
- `z notin Kq`;
- `z notin T`;
- deleting `z` preserves K4 at the actual blocker selected for
  `F.pair.q`; and
- the exact location split

  ```text
  z in S.surplusCap
  or
  dist z S.oppApex1 != radius.
  ```

The deletion survival is not an extra assumption.  It follows immediately
from
`cross_deletion_survives_iff_not_mem_selected_support`.

## Full-parent minimality consumer

The full parent record can also be sent directly to the existing production
global-minimality bridge using

```text
U = {F.pair.q, F.pair.w}.
```

The checked theorem

```lean
fullParentRobustFrontierCommonDeletionResidual_globalMinimalDeletion
```

returns a fresh center and a nonempty minimal blocking set `V subset U`,
together with exactly one of:

1. two distinct members of `V` co-radial from the fresh center; or
2. `Nonempty (MinimalDeletionCore D.A V center)`.

This is the first existing bank-facing global consumer.  It uses
`D.Minimal` and the carrier lower bound.  It does not use the common-deletion
rows or no-`M44`, and it does not close either resulting arm.  The stronger
six-role/strict-cap refinements and installed-singleton continuation are
already checked in the sibling `global-minimal-deletion-core/` lane and
should not be reimplemented here.

## Theorem-bank preflight

Before deriving the row boundary, this lane checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean queries for a frontier-source q-deletion at both opposite
  apices, two q-deleted apex rows, a selected-row/marginal two-hit, and the
  two-large-cap metric obstruction.

The closest exact results were:

- `firstApex_marginal_inter_secondClass_card_le_one`;
- `oppCap2_escape_gen`;
- `SelectedFourClass.inter_card_le_two`;
- `cross_deletion_survives_iff_not_mem_selected_support`;
- the parent common-map equality/reciprocal-survival normal form;
- the source-indexed two-deletion survival cover; and
- `exists_fresh_sharedRadiusPair_or_minimalDeletionCore`.

The U5 two-hit kernels and `u1TwoLargeCapObstruction` still require positive
cross-row incidences absent from the packet.  No banked theorem consumes the
single off-confinement escape.  No banked theorem closes the fresh
collision/core split uniformly.

## Why the obvious targets are overstrong

### Two marginal hits in the second row

Already false by the checked `card <= 1` theorem.  Producing them is the
contradiction itself.

### One-row confinement

Already false for `B2`: the new escape theorem proves a literal point outside
`Kq union T`.

### A new common pair for the two apex rows

The packet only gives an upper intersection bound.  Its selected rows may be
disjoint.  Even two common points would still need the correct off-surplus
placement before the double-apex sink applies.

### Another anonymous selected-four extraction

The escape is produced by the sharp cardinality limits on two already exact
rows.  A further arbitrary extraction does not relate the escape back to the
frontier pair, cap order, or an actual critical row.

## Exact finite-metric boundary

`verify_finite_metric_boundary.py` adapts the pinned exact rational model
from `../paired-common-deletion-nonreturn-audit/`.  It enlarges one radius
class to six points and rechecks the complete exact metric.

The model simultaneously retains:

- global K4 at every represented center;
- a total source-exact deletion-critical map;
- a six-point first-apex radius class containing distinct off-surplus
  frontier points `q,w`;
- unequal second-apex radii for `q,w`;
- double-deletion survival at both apices;
- a source-faithful common-deletion packet for deleting `q` at exactly those
  two apices;
- zero overlap between its stored apex rows;
- zero marginal hits and zero q-actual-support hits in its second row; and
- four literal off-confinement escapes.

Replay result:

```text
status                 PASS_EXACT_FINITE_METRIC_INTERFACE_ONLY
carrier card           24
first class card        6
payload SHA-256         2594c9cbccf4d09243e9ea3ad5c605c130821358baf73a426e1978827d253577
source model SHA-256    b38e9cba4fd07f2623f3004954ebe2e73505854f5e935cb03dc442d03273a95e
```

This is not a counterexample to the Lean parent theorem.  It does not encode
Euclidean planar realization, convex/MEC cap geometry, `D.Minimal`, or global
no-`M44`.  It proves that the source tag, common rows, global K4, and total
critical-map marginals do not support a geometry-free direct `False`.

The complementary existing strict-convex/no-`M44` regression in
`nom44-support-localization/` retains the local frontier/MEC/cap geometry but
omits all-center K4 and a total critical system.  Together the two boundaries
locate the missing work in a theorem coupling those global and geometric
layers on the same escape/continuation, not in either layer separately.

## Correct next theorem boundary

The narrow row route should consume

```text
FrontierSecondRowOffConfinementEscape R
```

and close its two exact location arms:

1. `z in S.surplusCap`; or
2. `dist z S.oppApex1 != radius`.

Any successful consumer must use the actual deletion survival at the
q-blocker together with cap/MEC order or a named all-center critical-row
continuation.  Iterating escapes without a common order/progress invariant is
not a proof.

The broader parent route should consume the already checked fresh
collision/minimal-core/installed-singleton alternatives.  The common packet
does not simplify those alternatives.  No-`M44` must enter by a new global
cap-profile coupling; its current local cardinal consequence was spent before
this frontier.

Thus the exact first missing field is a **source-exact geometric consumer of
the off-confinement escape or of the global minimal-deletion outcome**.  It
must produce an immediate banked incidence, a strict common cap-order progress
step, or `False`.  The plan should not return to marginal two-hit,
confinement, or arbitrary q-deleted-row mining.

## Surplus-arm refinement against the production normal form

The parent interface changed after the first scratch audit.  Production now
contains `ATail/FrontierCommonDeletionEscape.lean`, and
`FrontierCommonDeletionParentResidual` itself retains the originating
first-apex double deletion.  The live joint object is

```lean
FrontierCommonDeletionConsumerNormalForm R
```

not this lane's older parallel `FullParentRobust...` wrapper.  New work is
therefore isolated in `SurplusEscapeConsumer.lean` and consumes the production
types directly.

For the exact branch

```text
normal.escape.point in S.surplusCap
```

the endpoint one-hit theorem proves:

```text
B2 inter S.surplusCap = {normal.escape.point}
card (B2 \ S.surplusCap) = 3.
```

The distinct-center overlap bound also gives at least two points in

```text
B2 \ selectedAt(q).support.
```

Since the original escape is one of them, a distinct companion exists.  The
surplus one-hit theorem forces that companion outside the surplus cap.  The
kernel-checked theorem

```lean
nonempty_surplusEscapeCompanionOutcome
```

then returns exactly one of:

1. `FirstApexMarginalCompanion E`: one positive point of the first-apex
   off-surplus marginal also lies in `B2`, is omitted by `q`'s actual critical
   support, and its deletion survives at `q`'s actual blocker; or
2. a distinct production `FrontierSecondRowOffConfinementEscape` outside the
   surplus cap with first-apex radius unequal to the frontier radius.

This is a real reduction of the surplus arm.  A surplus escape cannot remain
an isolated cap-local case: it either produces the row's sole possible
first-apex marginal hit or transfers to the radius-mismatch arm.  It does not
produce the second marginal hit forbidden by the existing card-at-most-one
theorem.

The independent prescribed-deletion split at the physical second apex also
kernel-checks as

```lean
nonempty_surplusEscapePhysicalApexOutcome.
```

It returns either:

1. a `CommonDeletionTwoCenterPacket` deleting the actual escape at exactly
   `centerAt(q)` and `S.oppApex2`; or
2. `PhysicalSecondApexCriticalResidual D S` for that same source.

These are existing source-valid consumer interfaces.  They are not terminal:
the common-deletion arm enters the known successor/robustness loop, while the
critical arm reorients to the protected swapped unique-four frontier.  The
companion theorem is therefore the more informative next plan boundary.

The exact remaining surplus-branch consumer should be phrased as:

```text
FirstApexMarginalCompanion E -> False
```

or should jointly consume that one positive marginal hit with
`normal.directed`.  If that arm closes, every surplus escape transfers to the
already named off-surplus radius-mismatch branch.  Mining another anonymous
row, another confinement packet, or a second marginal hit is not aligned with
the checked surface.

## Validation

Lean, from `lean/`:

```bash
lake env lean -R .. \
  ../scratch/atail-force/frontier-common-deletion-consumer/\
FrontierCommonDeletionConsumer.lean

lake env lean -R .. \
  ../scratch/atail-force/frontier-common-deletion-consumer/\
SurplusEscapeConsumer.lean
```

Exact finite replay, from the repository root:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/frontier-common-deletion-consumer/\
verify_finite_metric_boundary.py
```

All three commands exit zero.  Every new Lean declaration reports exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, custom axiom, solver trust step, `native_decide`, or
unsafe declaration.  No full project build was run for this isolated scratch
lane.

## Epistemic ledger

- Full-parent robust/common split with origin retained: **PROVEN / KERNEL
  CHECKED**.
- Marginal hit bound, critical-row overlap bound, and off-confinement escape:
  **PROVEN / KERNEL CHECKED**.
- Source-exact deletion survival at the escape: **PROVEN / KERNEL CHECKED**.
- Production-normal-form surplus one-hit, exact three-point complement, and
  companion marginal-hit/radius-mismatch split: **PROVEN / KERNEL CHECKED**.
- Surplus-source common-deletion/physical-critical split: **PROVEN / KERNEL
  CHECKED; NONTERMINAL**.
- Global minimality collision/core reduction: **PROVEN / KERNEL CHECKED**.
- Finite regression: **EXACT WITHIN THE STATED FINITE-METRIC ABSTRACTION;
  NOT EUCLIDEAN AND NOT A FULL-PARENT COUNTERMODEL**.
- Direct `False` from `FrontierCommonDeletionResidual`: **OPEN**.
- Production `sorry` closed by this lane: **NONE**.
