# Common-deletion parent-consumer audit

Date: 2026-07-17

Status: **KERNEL-CHECKED PARENT NORMAL FORM; NO DIRECT `False`.  THE GENERIC
COMMON-DELETION RESIDUAL IS REDUNDANT AS A ROBUSTNESS PRODUCER AND TOO WEAK AS
A TERMINAL ROW PRODUCER.**

This lane owns only:

```text
scratch/atail-force/common-deletion-parent-consumer/
```

No production source, shared closure document, proof-blueprint state, or
sibling scratch lane was changed.

## Verdict

Let

```lean
F : RobustLargeRadiusParentSurface D S
R : CommonDeletionParentResidual H
```

The parent already contains

```lean
F.radius_pos
F.radius_class_card_ge_five :
  5 <= (SelectedClass D.A S.oppApex2 F.radius).card
```

and therefore directly implies

```lean
FullyDeletionRobustAt D S.oppApex2.
```

The common-deletion packet is not used.  Consequently it is misleading to
treat the common-deletion arm as a route which *produces* the robust endpoint:
the whole large-radius parent is already on that endpoint before the
minimal-deletion outcome is split.

The retained critical system then gives the stronger map-wide exclusion

```lean
forall source in D.A,
  H.centerAt source source_mem != S.oppApex2.
```

This is the strongest unconditional common-arm consequence found.  It does
not contradict global K4, the parent frontier, or the two exact deleted rows.

## Kernel-checked declarations

`CommonDeletionParentConsumer.lean` proves:

```lean
parent_secondApexFullyDeletionRobust

commonDeletionParentResidual_secondApexFullyDeletionRobust

commonDeletionParentResidual_allActualBlockers_ne_secondApex
```

It also restores the independently available first-apex frontier around the
common residual:

```lean
structure FrontierCoupledCommonDeletionParentResidual ... where
  frontierRadius : Real
  frontierRadius_pos : 0 < frontierRadius
  frontierRadius_class_card_ge_four :
    4 <= (SelectedClass D.A S.oppApex1 frontierRadius).card
  frontier : CriticalPairFrontier D S frontierRadius H
  common : CommonDeletionParentResidual H
  secondApexFullyDeletionRobust :
    FullyDeletionRobustAt D S.oppApex2
```

and a branch-complete production projection:

```lean
frontierCoupledCommonDeletion_or_frontierCoupledExactFive :
  Nonempty (FrontierCoupledCommonDeletionParentResidual H F) \/
  Nonempty
    (FrontierCoupledExactFivePhysicalCycleParentResidual H F)
```

Every printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx` or custom axiom.

## Why no direct consumer closes

The full-context wrapper repairs one loss: the common branch now retains the
first-apex `CriticalPairFrontier`.  It does not create a relation between that
frontier and the fields of the generic common-deletion residual.

In particular, the production residual does **not** state that:

- `R.deleted` is one of the frontier sources;
- `R.deleted` belongs to `F.radius` or the physical strict-cap interior;
- `R.center` is a named actual blocker in `H`;
- either trimmed row equals an actual selected row of `H`;
- either row contains a named frontier point; or
- the two row supports have a nonempty intersection (the packet gives only
  an upper bound of two).

Those are exactly the kinds of positive incidences needed by the closest
terminal banks.  The U5 consumers and
`u1TwoLargeCapObstruction` need additional named cross-row equalities.  The
common-outside-pair sink needs two distinct common support points.  The
critical-map consumers need an actual source-indexed row, not an arbitrary
four-point trimming of a surviving radius class.  None is projected by the
current type.

The missing information existed transiently upstream.  In
`nonempty_minimalDeletionOutcome_of_largeSecondApexRadius`, the common
deletion source is chosen from the parent physical radius and strict cap in
the direct singleton/two-deletion arms.  The absorbed shared-pair arm also
has stronger origin and cap-localization data.  The reduced outcome then
forgets this provenance and exports only

```lean
CommonDeletionTwoCenterPacket D H deleted center S.oppApex2.
```

That erasure is the first interface problem to fix before trying to prove
more row equalities.

## Required bank preflight

Before formalizing the reduction, the lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean queries for common-deletion packets, two q-deleted rows,
  source-indexed cross survival, U5 incidences, and the two-large-cap metric
  obstruction.

The closest reusable declarations were:

- `fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses`;
- `FullyDeletionRobustAt.centerAt_ne`;
- the already checked scratch common-deletion successor/critical split; and
- U5 and `u1TwoLargeCapObstruction` kernels requiring extra positive
  incidence.

No indexed theorem consumes the generic common residual plus an independent
frontier.  No bank theorem manufactures the missing relation between their
sources.

## Exact finite-metric regression

`verify_parent_projection.py` replays the pinned exact rational model from
`../paired-common-deletion-nonreturn-audit/`, digest

```text
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

and verifies simultaneously:

- a five-point physical radius class;
- a labelled six-point cap;
- global K4 and a total source-exact critical map;
- one concrete common-deletion packet at the physical apex and another
  center;
- overlap zero between its two selected rows;
- survival at the physical apex after every single deletion; and
- exclusion of the physical apex from the full blocker-map image.

The result is:

```text
PASS_EXACT_FINITE_METRIC_PROJECTION_ONLY
```

This is not a counterexample to a Lean theorem.  It does not instantiate
Euclidean planar embedding, `ConvexIndep`, MEC/cap half-plane geometry,
`D.Minimal`, `noM44`, or a first-apex frontier.  It is a regression against
any attempt to derive `False` from only the generic common rows, radius-class
robustness, and total critical-map marginals.

## Correct next boundary

There are two honest routes.

1. **Uniform parent direct-`False`.**  Prove a theorem excluding the robust
   large-radius parent itself, using `F.minimal`, `F.noM44`, the complete
   critical map, cap/MEC order, and the reconstructed frontier.  If this
   lands, the common-deletion and exact-five split is unnecessary.  This is
   the architectural parent bypass, but it remains conjectural: the present
   theorem banks and regressions do not supply its global coupling.

2. **Refine the producer before consuming rows.**  Replace the generic common
   residual by an origin-tagged outcome retaining at least the deleted
   source's parent-radius and strict-cap membership and the minimal-deletion
   or shared-pair provenance that made the first center survive.  Any actual
   critical row used downstream must retain its concrete relationship to
   `H` (or to the explicit override used in the singleton transition).  Then
   state exactly one immediate bank-facing incidence and test it before
   expanding more rows.

The second route is narrower and currently more tractable.  It is not a
weakening of the hypotheses; it is a strengthening of the producer interface
and a weakening of the artificial target.  Continuing from the present
generic residual would ask arbitrary trimmed rows to recover information that
was already discarded upstream.

The first missing global ingredient after that repair is a **source-exact
cross-row/cap coupling**: a theorem relating the origin-tagged physical
deletion source and its actual critical row to either the first-apex frontier
pair or a named common-cap consumer.  Marginal support cardinalities and
another selected-four extraction cannot provide it.

## Validation

From `lean/`:

```bash
lake env lean -R .. \
  ../scratch/atail-force/common-deletion-parent-consumer/\
CommonDeletionParentConsumer.lean
```

From the repository root:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/common-deletion-parent-consumer/\
verify_parent_projection.py
```

Both commands exited successfully.  No full project build was run for this
isolated scratch audit.
