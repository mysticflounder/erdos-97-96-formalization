# Cross-blocker / cap-source bridge search (2026-07-31)

## Scope and verdict

Read-only audit of the two direct load-bearing leaves in
`P97/ATail/FrontierLiveClosure.lean`:

* `TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence`
  (`FrontierLiveClosure.lean:7452-7456`), and
* `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`
  (`FrontierLiveClosure.lean:7491-7495`).

Both bodies are still `by sorry`.  A focused indexed search

```text
nthdegree docs search --lean \
  "CrossBlockerCoincidence GeometricMultiplicityResidual CapSourceThirdCanonicalRowSurface" \
  --current-project
```

returned only these two leaves, the three source abbreviations, and the
compatibility adapter
`false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`.
The concept-level search for “two collision rows cap source blocker
multiplicity residual cross omission” likewise found no source-clean terminal
or alternate bridge.  No production Lean file was changed.

## Exact live interfaces

`CrossBlockerCoincidence` is the four-way disjunction from
`ATail/TwoCollisionGlobalProducer.lean:480-489`:

```text
center(P.source1) = Pρ.source1 ∨
center(P.source1) = Pρ.source2 ∨
center(Pρ.source1) = P.source1 ∨
center(Pρ.source1) = P.source2.
```

`GeometricMultiplicityResidual` is the checked three-arm disjunction from
`ATail/BlockerMultiplicityGeometry.lean:339-350`:

```text
Nonempty (FreshThirdBlockerFiber P Pρ) ∨
  Nonempty (FreshOutsideFirstBlockerFiber P Pρ) ∨
    Nonempty (FreshOutsideSecondBlockerFiber P Pρ).
```

`CapSourceThirdCanonicalRowSurface` is the cap-eight packet from
`ATail/TwoCollisionGlobalProducer.lean:552-577`: `8 ≤ cap.card`, an interior
source outside all four collision endpoints, a blocker center distinct from
both collision blockers and both rich apices, an exact four-point canonical
row containing the source, and two `CrossPairDeletionView` survival packets.
The source-clean producer
`exists_capSource_thirdCanonicalRow_omits_each_collisionPair`
(`TwoCollisionGlobalProducer.lean:614-639`) constructs this packet, but proves
no contradiction and does not construct the residual.

The direct consumer is
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
(`FrontierLiveClosure.lean:11207-11373`).  It first obtains
`CollisionCrossHit ∨ GeometricMultiplicityResidual` from the checked finite
normalizer `collisionCrossHit_or_geometricMultiplicity`, then sends the
residual through `TwoCollisionGlobalSplit` to exactly the two sorry leaves.

## Checked facts that stop before `False`

* The fresh-third adapter (`:7578-7608`) only packages one residual arm and
  calls the cap-source leaf.  The positive theorem
  `false_of_freshThird_sameCapCrossRowAlignment` is source-clean, but no
  checked producer currently supplies its alignment hypotheses (fresh blocker
  center in a common cap, both fresh sources outside that cap and in the
  cap-source row).
* The first-fiber adapter (`:9193-9214`) and the aligned/nonbisector adapter
  (`:11047-11069`) also call the cap-source leaf without consuming their extra
  radius/alignment/inequality fields.  The checked
  `secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` only proves the
  supplied distance inequality.
* A useful checked chain exists but has no terminal consumer:
  `exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion` (`:9408-9424`)
  gives two omitted collision endpoints and a source-row K4 surviving their
  double deletion; under aligned radii,
  `firstApex_minimalDeletionCore_of_crossRetainedEndpoints` (`:9647-9695`)
  packages the corresponding first-apex `MinimalDeletionCore`.  The private
  `exists_secondRowOutsidePoint_ne_firstOutsidePair` (`:9569-9640`) and
  `freshOutsideSecondBlockerFiber_of_secondRowOutsidePoint` (`:9781-9805`)
  provide a second-row outside point/fresh-second packet in the appropriate
  blocker case.  Search over `P97/ATail` found no theorem consuming these
  objects to `False`, `CollisionCrossHit`, or a three-hit.
* `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`
  (`FrontierLiveClosure.lean:9007-9025`) is source-clean, but requires two
  cap-source points on one first-apex radius with mutual cross-membership and
  distinct blockers.  The generic residual does not provide those premises.

## Why a local metric bridge is unavailable

The exact rational audit in
`scratch/atail-force/cross-blocker-euclidean-audit/` realizes all
`4 × 3 = 12` combinations of the four coincidence arms and three residual
arms in the named Euclidean projection.  The older
`scratch/full-exact-two-cross-equality/REPORT.md` likewise realizes the
interleaving equality geometry.  These are projections only (not complete
`CounterexampleData`, cap order, minimality, no-M44, or tri-apex models), but
they show that blocker equalities plus the local shell/incidence data do not
contradict by themselves.  Any proof must use the stranded global support,
minimality, cap-order, no-`(m,4,4)`, or tri-apex data.

## First missing bridge / candidate theorem shapes

The first missing mathematical bridge remains one of the exact terminal
interfaces:

```text
CapSourceThirdCanonicalRowSurface P Pρ ∧
  GeometricMultiplicityResidual P Pρ → False

CrossBlockerCoincidence P Pρ ∧
  GeometricMultiplicityResidual P Pρ → False.
```

To be genuine progress, a proof must consume at least one global object that
is currently stranded (the six-center double-deletion packet and resulting
`MinimalDeletionCore`, the second-row outside point, or a joint cap-source /
fresh-third alignment producer) together with `T`, `LPρ/MPρ`, `LP/MP`, and
the exact collision-row equations.  A merely local alias rewrite or a
repackaging of the residual would not close the frontier.

The most concrete decomposed target is therefore a source-clean producer of
one of the following, followed by existing checked consumers:

```text
FreshThirdBlockerFiber P Pρ ∧ CapSourceThirdCanonicalRowSurface P Pρ
  → CollisionCrossHit P Pρ ∨ FreshThirdSameCapCrossRowAlignment P Pρ Q source

FreshOutsideFirstBlockerFiber P Pρ ∧ CapSourceThirdCanonicalRowSurface P Pρ
  → (a six-center/minimal-deletion contradiction)
    ∨ CollisionCrossHit P Pρ ∨ (a three-hit witness)
```

The second-side residual is symmetric via
`FreshOutsideSecondBlockerFiber.toSwappedFirst`.  No theorem with either
positive-incidence/deletion-output shape is present in the indexed corpus.

## Status label

`false_of_crossBlockerCoincidence` and
`false_of_capSourceThirdCanonicalRowSurface`: **CONJECTURED bridge targets**
(direct load-bearing `sorry`s).  All producer/normalizer facts cited above are
**PROVEN/source-clean**; the rational branch checks are
**EMPIRICALLY VERIFIED projections**, not theorem-level countermodels or
closure.

