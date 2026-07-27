# Two-frontier joint-consumer audit

## Verdict

The proposed prescribed-second-radius construction is valid and checks under
the exact imports of `FrontierLiveClosure.lean`.  It produces

```lean
∃ Fρ : CriticalPairFrontier D S ρ H,
  Nonempty (FrontierCommonDeletionParentResidual Fρ)
```

from the data available in
`false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`.

It does **not** close that theorem.  No imported or indexed theorem found in
this audit consumes the original and second-radius parent residuals jointly to
produce `False`.  The strongest short cross-frontier fact directly available
from their fields is that the two frontier survivor pairs have four
pairwise-distinct sources.  There is no cross-packet cardinality, support
overlap, blocker, or cap-localization bound that makes four such sources
impossible.

Thus the construction is a genuine new outcome/data refinement, not a
contradiction.

## Exact checked construction

The complete scratch proof is in `Probe.lean`, theorem
`nonempty_secondRadius_commonDeletionParent`.

1. Positivity of the original `radius` is reconstructed from
   `P.source₁_mem_radius` and `P.source₁_mem_capInterior`, using
   `SurplusCapPacket.capInteriorByIndex_ne_oppositeVertexByIndex`.  This is
   needed because the library's corresponding parent lemma
   `frontierRadius_pos_of_commonDeletionParent` is private.
2. Rebase `D.packet` to the supplied `S` and apply
   `U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit` at `ρ`.
3. Combine the one-hit upper bound with `hρfour` and
   `Finset.card_sdiff_add_card_inter` to obtain the required three off-surplus
   points.
4. Apply
   `ATailCriticalPairFrontier.exists_criticalPairFrontier D S ρ H` to get a
   frontier `Fρ` at the **prescribed** radius.
5. Apply
   `CriticalPairFrontier.originalUnique_or_commonDeletionParent Fρ` with
   `R.minimal`, `R.noM44`, `R.carrier_card_gt_nine`, and `hρfour`.
6. Its `OriginalFrontierUniqueRadiusArm` would apply to the original positive
   `radius` and `hfrontierFour`, yielding `radius = ρ`, contrary to
   `hρne : ρ ≠ radius`.  Therefore the common-deletion-parent arm is inhabited.

Notably, `hρpos` is not needed for this construction: the unique-radius arm
requires positivity of the competing original radius.  `hρpos` is needed by
the separate two-K4-radii robustness theorem discussed below.

Exact check:

```text
lake env lean ../scratch/atail-force/two-frontier-joint-consumer/Probe.lean
Process exited with code 0

'...nonempty_secondRadius_commonDeletionParent' depends on axioms:
[propext, Classical.choice, Quot.sound]
'...frontier_pair_sources_cross_ne' depends on axioms:
[propext, Classical.choice, Quot.sound]
```

In particular, neither checked scratch theorem depends on `sorryAx`.

## What two parents actually provide

For a frontier `F`, `FrontierCommonDeletionParentResidual F` contains:

- the repeated global facts `D.Minimal`, no `IsM44`, and `9 < D.A.card`;
- a K4 lower bound at the frontier radius;
- `FrontierCommonDeletionResidual F`, consisting of:
  - K4 at the first apex after deleting both `F.pair.q` and `F.pair.w`;
  - one `CommonDeletionTwoCenterPacket` at deleted source `F.pair.q` and the
    two fixed physical apices.

Each `CommonDeletionTwoCenterPacket` contains two single-deletion survival
facts, two exact deleted-K4 rows, internal row overlap at most two, and the
fact that that source's actual blocker avoids the two centers.  None of its
fields relates its rows, blocker, or supports to those of a packet with a
different deleted source.

The checked `frontier_pair_sources_cross_ne` proves that distinct radii force

```lean
F.pair.q ≠ Fρ.pair.q
F.pair.q ≠ Fρ.pair.w
F.pair.w ≠ Fρ.pair.q
F.pair.w ≠ Fρ.pair.w
```

because every pair source has its frontier's radius from the first apex.
Together with each frontier's internal `q_ne_w`, this gives four distinct
sources.  But `9 < D.A.card` is a lower bound, not an upper bound, and no
available theorem bounds the union of these sources by three.

## Consumer audit

### `fullyDeletionRobustAt_of_two_K4_radii`

This imported theorem is exactly type-compatible:

- original positivity is derivable as above;
- `hρpos` supplies second-radius positivity;
- `hρne.symm` supplies `radius ≠ ρ`;
- `hfrontierFour` and `hρfour` supply both K4 lower bounds.

Its conclusion is only
`FullyDeletionRobustAt D S.oppApex1`, not `False`.  Moreover it is redundant:
the original parent alone already gives
`R.firstApexFullyDeletionRobust` with exactly the same conclusion.  The
minimal unique-four cover bound needs robustness at more than three quarters
of all carrier points; harvesting the same distinguished apex twice supplies
no extra robust center.

### `CriticalPairFrontier.originalUnique_or_commonDeletionParent`

This is the successful splitter used by the probe.  After the unique-radius
arm is eliminated, its conclusion is the second parent residual itself.  It
has no terminal joint-parent continuation.

### Existing two-common-deletion-source packages

Indexed search found
`OnRadiusSurplusMarginalCommonDeletion` in
`FrontierCommonDeletionSurplusEscape.lean`.  That module explicitly documents
that its normal form contains two distinct common-deletion sources at the
same centers and that **no branch is asserted contradictory there**.  It is
not imported by `FrontierLiveClosure.lean`, and in any event its result is
another outcome package, not `False`.

Indexed search also found
`LargeCapUniqueFiveTwoCommonDeletionSources` and
`nonempty_twoCommonDeletionSources_of_largeCapUniqueFive`.  These are
second-apex exact-five/large-cap producer surfaces.  They require a
`LargeCapUniqueFiveSecondApexRadius` profile (and the constructor additionally
uses the six-point cap premise); the present exact-four first-apex pair of
parents does not provide that profile.  Their conclusion is again a
two-source structure, not a contradiction.

### Later `FrontierLiveClosure` terminal coordinators

`false_of_frontierBiApexRobustResidual`,
`false_of_frontierCommonDeletionPhysicalSecondApex`, and
`false_of_criticalPairFrontier` occur later in
`FrontierLiveClosure.lean`.  They are not usable to prove the current earlier
leaf.  More importantly, the downstream coordinator chain reaches the
current theorem through
`false_of_exactFourCollision_interior_eq_two_secondRadius_and_all_low_hits`
itself (the call is around line 1662), so routing the new parent back through
that terminal surface would be circular, not a new consumer.

### Mined theorem-bank registries

The required indexed Lean searches were run first, including searches for
two parent residuals, distinct radii, common deletion packets, and prescribed
frontiers.  The only high-confidence hit was
`FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust`; no
joint-parent theorem appeared.

Targeted searches of the registered general-n/sibling-bank census files for
`CommonDeletionTwoCenterPacket`, `FrontierCommonDeletionParentResidual`, and
`CriticalPairFrontier` returned no candidate.  Those registries therefore
contain no named import-reachable joint consumer for these structures.

## Missing bridge

A genuinely terminal joint theorem would need a new hypothesis/conclusion not
present in the two residuals, for example one of:

- an upper bound of at most three on the union of the two survivor-pair source
  sets;
- a cross-packet overlap/incidence theorem forcing two sources to coincide;
- a theorem localizing all four sources into a set known to have cardinality
  at most three;
- a cross-source blocker identity together with the critical unique-four
  cover and a proved incompatibility;
- a direct impossibility theorem for two
  `CommonDeletionTwoCenterPacket`s at the same physical apices whose source
  pairs lie on distinct first-apex radii.

The present fields give none of these.  The target's `hexactTwo`,
`hfrontierInteriorTwo`, low-hit bounds, and already-constructed
cross-incidence alternatives constrain particular original-radius or
critical-row intersections; there is no field putting the new frontier
pair's sources into those constrained intersections.  Consequently a short
field-only proof of `False` does not follow from `R` and `Rρ`.

## Artifacts

- `scratch/atail-force/two-frontier-joint-consumer/Probe.lean`
  - checked prescribed-`ρ` parent constructor;
  - checked four cross-source inequalities;
  - exact-import axiom audit.
- `scratch/atail-force/two-frontier-joint-consumer/REPORT.md`
  - this audit.

No production source was edited.
