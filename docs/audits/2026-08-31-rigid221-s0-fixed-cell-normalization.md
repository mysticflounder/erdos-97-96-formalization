# Rigid221 S0 fixed-cell normalization audit

**Date:** 2026-08-31

**Lane:** `rigid221-s0-fixed-cell-normalization-20260831`

**Base revision:** `299be31ce982c1c0b0dee15bb92f68c9e467e1b2`

**Status:** bounded fixed-cell candidate independently verified; live source ingress remains open

## Scope decision

The exact-12 coordinate contradiction cannot be applied directly to
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`.
Three independent read-only audits compared the live interface with the twelve
hypotheses of
`Erdos9796Proof.Geometry.normalizedFivePoint_orientation_incompatibility`.
They found that the live packet supplies abstract row traces, cap membership,
selected-class equal radii, and blocker identities, but not the experimental
rational Moser shape or the two fixed cyclic-order signs.

In particular, `sourceRowInteriorCount = 2` is only an incidence/cardinality
statement.  It does not force

```text
m1_y = -4/5,
m2 = (8/5, 4/5),
signedArea2 v delta O > 0,
signedArea2 delta m1 v > 0,
```

or the retained cap-orientation product sign.  Those facts are restrictions of
the frozen `M0-I-v1` and `M0-N-v1` computation cells.  Treating them as
consequences of the live source packet would overstate the computation.

## Reuse preflight

The project already contains the orientation-preserving similarity
`Problem97.normSim`.  Its checked API supplies all mechanical transport needed
for a sound fixed-cell bridge:

- `normSim_fst` and `normSim_snd` send distinct anchors to `(0,0)` and `(1,0)`;
- `normSim_dist_image` transports distances by the positive inverse anchor
  distance; and
- `signedArea2_normSim` transports signed areas by a positive inverse squared
  scale.

Related MEC disk transport exists in `P97/Q3SharedInterior.lean`, but no current
theorem derives the rational Moser coordinates or the required fixed order from
the Rigid221 source packet.  The closest equality-core normalization theorems
only treat an equilateral hinge and do not determine this Moser shape.

## Lean landing

The selected theorem is a bounded similarity-normalized fixed-cell ingress.  It
starts with unnormalized points `O`, `M`, `m1`, `m2`, `delta`, and `v`; assumes
`O != M`; states only the three experimental rational coordinates after applying
`normSim O M`; and keeps the original-space equal-radius, MEC disk/boundary,
orientation, and cap-product facts.  Its proof must transport those facts and
invoke the already checked common adapter.  It must not assume the normalized
metric or sign clauses directly.

Two compatibility corollaries record the canonicalized experimental cells
`m0-distinct-s0-i` and `m0-distinct-s0-n`.  Their mathematical interfaces are
intentionally identical: the minimized common core contains no branch-only
assertion.  These names record bounded cell provenance, not additional coverage.

## Frontier accounting

The configured publication target is `Problem97.erdos97_rhs`.  At the preflight
snapshot its kernel spine had 25 open obligations, including the `sourceRowHeavy`
consumer above.  This lane does not reduce that frontier and must remain
registered off-spine infrastructure/compatibility work.  Its value is to isolate
the remaining live ingress obligation to two genuinely mathematical producers:

1. a source-entitled Moser shape theorem, or a complete split of the remaining
   symbolic shape regions; and
2. a dispatcher proving the cyclic-order, overlap/equality, role-identification,
   and cap-product cases used by the fixed cells.

Until both producers exist, neither fixed-cell corollary closes `minimalCore` or
any live source branch.

## Implemented declarations

The module
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FixedCellNormalization`
provides the common theorem

```text
Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.
  false_of_fixedCellNormalization
```

and the two provenance-preserving compatibility corollaries

```text
false_of_m0DistinctS0I_fixedCell
false_of_m0DistinctS0N_fixedCell.
```

The common proof derives the normalized origin, equal squared radii, MEC disk
inequality, two boundary equalities, both strict orientations, and the cap
product sign using `normSim_fst`, `normSim_snd`, `normSim_dist_image`, and
`signedArea2_normSim`.  It then invokes
`normalizedFivePoint_orientation_incompatibility`.  Thus it assumes neither
normalized metric facts nor normalized orientation signs.

The author-side focused command

```text
LAKE_BUILD_NO_REFRESH=1 lake-build \
  Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FixedCellNormalization
```

completed successfully with 8050 jobs and no warning attributed to the new
module.  The source contains no `sorry`, `admit`, custom axiom, native
reduction, runtime implementation escape, external evidence, or heartbeat
override.  Independent verification remains the promotion gate for this
bounded off-spine candidate.

## Independent verification

The independent read-only lane
`rigid221_fixed_cell_normalization_verifier` reviewed the candidate against the
lane base and classified it as an **independently verified bounded candidate**.
It reran the focused build, checked the recommendation and all three statements,
and independently verified the direction and positive scale of every distance,
disk/boundary, equal-radius, signed-area, and product transport.

Literal `proof-blueprint axioms` checks for all three declarations reported
exactly `propext`, `Classical.choice`, and `Quot.sound`.  A fresh reference mine
found three declarations, 16 constant edges, and no axiom edge.  No `sorry`,
custom axiom, native/runtime escape, external evidence, heartbeat override, or
new-module warning was found.

The mine confirmed that the module has no importing sibling and all three
declarations are off the publication spine.  The live frontier remains at 25
open obligations.  The common theorem is registered as deliberate off-spine
infrastructure; the two cell names are registered as compatibility-only.  This
verification therefore authenticates the bounded fixed-cell result and does not
promote it to source-universal or `minimalCore` closure.
