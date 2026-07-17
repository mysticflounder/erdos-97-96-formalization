# Robust collision cap/localization audit

Date: 2026-07-17

Status: **KERNEL-CHECKED CONDITIONAL LOCALIZATION. NONTERMINAL. REGRESSION-GATED.
NO PRODUCTION `sorry` IS CLOSED.**

## Question

Starting from the production theorem

```lean
FullyDeletionRobustAt.exists_distinct_sources_same_blocker
```

and the checked first-apex robust blocker normal form, how far can the two
anonymous collision sources and their common exact card-four shell be
localized using the full `FrontierCommonDeletionParentResidual` and
`SurplusCapPacket` geometry?

## Required theorem-bank preflight

Before proving a new local statement this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed Lean searches for fully deletion-robust blocker fibers,
common exact shells, cap localization, outside-pair uniqueness, perpendicular
bisectors, and cyclic separation. No bank theorem accepts an anonymous
equal-blocker fiber as a terminal packet. The relevant reusable theorems are
already in production:

- `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`; and
- `SurplusCOMPGBank.btw_sep`.

## Checked source reduction

`RobustCollisionCapLocalization.lean` reconstructs the required part of
`FirstApexRobustGlobalBlockerNormalForm` directly from the production
`R.firstApexFullyDeletionRobust` theorem and
`FullyDeletionRobustAt.exists_distinct_sources_same_blocker`. The resulting
`RobustBlockerCollision H` retains:

- distinct carrier sources `source₁`, `source₂`;
- one common blocker, different from the first apex and from `source₂`;
- one common exact shell of cardinality four containing both sources; and
- the common blocker as a carrier point.

This avoids importing or modifying the other scratch lane.

## Strongest checked theorem

The strongest exhaustive statement is

```lean
nonempty_robustCollisionFrontierRadiusOutcome
    (R : FrontierCommonDeletionParentResidual F)
    (N : RobustBlockerCollision (S := S) H) :
    Nonempty (RobustCollisionFrontierRadiusOutcome (radius := radius) N)
```

It proves exactly one of:

1. `source₁` is off the retained first-apex radius;
2. `source₁` is on that radius and `source₂` is off it; or
3. both sources are on it, and a global injective CCW boundary enumeration
   places the two sources on opposite open boundary arcs between the first
   apex and their common blocker:

```lean
SurplusCOMPGBank.btw firstApexIndex blockerIndex source₁Index ↔
  ¬ SurplusCOMPGBank.btw firstApexIndex blockerIndex source₂Index.
```

This is the source-valid boundary-order content of the two shared distance
equalities. It does **not** infer that either anonymous source is on the
frontier radius.

The cap-local refinements are:

```lean
commonSupport_inter_cap_card_le_two
two_le_commonSupport_sdiff_cap
commonSupport_inter_cap_eq_sources
```

For every indexed cap containing the common blocker, its exact support has at
most two points in that cap and at least two outside it. If both collision
sources lie in the cap, they are exactly its two support points there.

Finally,

```lean
commonBlocker_not_mem_surplusCap_of_sources_mem_frontierMarginal
```

shows that if both collision sources lie in the retained off-surplus
first-apex marginal, their common blocker is outside the surplus cap. This
consumes `outsidePair_unique_capCenter`: otherwise the first apex and common
blocker would be two distinct centers in the surplus cap bisecting the same
outside pair.

## Exact nonmatches and regression gate

The production hypotheses do not identify the anonymous collision sources
with `F.pair.q`, `F.pair.w`, or any member of the retained radius class. The
finite-endomap pigeonhole step only provides a repeated blocker value; it
does not control the preimage locations. Therefore a theorem asserting that
both sources lie in the frontier marginal would add a genuinely new
antecedent, not unpack an existing field.

The checked results rule out only the conjunction

```text
both collision sources in the frontier marginal
+ common blocker in the surplus cap.
```

They leave source-valid residuals with an off-radius collision source, and
the both-on-radius case with a common blocker outside the surplus cap. Cyclic
alternation itself is geometrically consistent and is not `False`.

The existing terminals still do not match:

- `u1TwoLargeCapObstruction` needs seven named metric equalities;
- the U1 source-unit banks need their complete named slot packets; and
- Kalmanson cycle consumers need another selected-row equality that converts
  the alternation into a directed strict-distance cycle.

The regression gate for any proposed strengthening is therefore the exact
trichotomy above: it must visibly eliminate both off-radius constructors and
consume the separated both-on-radius constructor. Merely asserting that the
collision occurs on the frontier radius, or that its blocker lies in the
surplus cap, is not justified by the current normal form.

## Immediate consumer boundary

The narrow already-closed subcase has the exact producer packet

```text
source₁ ∈ frontierMarginal
source₂ ∈ frontierMarginal
commonBlocker ∈ surplusCap.
```

Supplying those three placements yields `False` immediately through
`commonBlocker_not_mem_surplusCap_of_sources_mem_frontierMarginal`.

For the honest full parent route, the next consumer must instead add one
source-indexed critical-row/cap-order fact that:

1. eliminates an off-radius collision source, and
2. in the both-on-radius case supplies a second shared pair or named row
   equality turning `FrontierRadiusCollisionSeparation` into an existing
   Kalmanson or finite-bank contradiction.

No such antecedent is currently present. The lane is therefore nonterminal
and regression-gated, not a production promotion candidate by itself.

## Validation

Narrow compilation succeeded with:

```text
cd lean
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/robust-collision-cap-localization/\
RobustCollisionCapLocalization.lean
```

Every printed theorem closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned source contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, `unsafe`, heartbeat override, or linter suppression. No
production file, plan document, generated blueprint, protected unique-row
lane, `surplusM44` file, or shell-curvature file was edited.
