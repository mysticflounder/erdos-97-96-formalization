# Two-cap-source canonical-row packet: source-only insertion audit

Status: source audit only.  No Lean/Lake invocation, solver, or production-file
edit was performed.  Line numbers below are from the live worktree inspected on
2026-07-31 and must be refreshed before applying a patch.

## Live producer and its current gap

* The raw two-source producer is
  `Problem97.ATailTwoCollisionGlobalProducer.exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals` in
  `lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean:343-381`.
  It returns distinct carrier vertices plus one
  `CapSourceThirdBlockerCrossPairDeletionSurvivals P Pρ` proof per vertex.
* That raw pointwise packet is defined at `:102-129`; it supplies strict-cap
  membership, exclusion from the four collision sources, the four center
  inequalities, and the two raw cross-pair deletion-survival disjunctions.
* The existing one-source canonical packet is
  `CapSourceThirdCanonicalRowSurface` at `:552-577`.  It enriches a raw source
  with its selected K4-row membership/cardinality and wraps each survival fact
  in `CrossPairDeletionView` (defined at `:527-545`).
* `FrontierLiveClosure` currently repeats that enrichment only in the private
  adapter `exists_two_firstFiberCapSourceWitness` at
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7802-7841`.
  This is the sole direct in-project caller of the raw two-source producer.

## Minimal additive insertion point

Insert the new public abbrev and its producer theorem in namespace
`Problem97.ATailTwoCollisionGlobalProducer`, immediately after the closing line
of `CapSourceThirdCanonicalRowSurface` (current
`TwoCollisionGlobalProducer.lean:578`) and before
`capSourceThirdCanonicalRowSurface_swap` (`:581`).

This is the first position where all required vocabulary is already in scope:
`CrossPairDeletionView` is available at `:527`, and the raw two-source theorem
is already available at `:343`.  Inserting directly after the raw theorem at
`:381` would require moving or duplicating the canonical-view definitions, so
it is not a minimal additive change.

Suggested names:

```lean
abbrev TwoCapSourceThirdCanonicalRowSurface ... (P ...) ... (Pρ ...) : Prop := ...

theorem exists_two_capSources_thirdCanonicalRowSurface
    ... (secondApexRobust : FullyDeletionRobustAt D S.oppApex2)
    (hpairsDisjoint : Disjoint ...)
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    TwoCapSourceThirdCanonicalRowSurface P Pρ := by
  ...
```

The theorem should call the existing raw producer exactly once, expose its two
vertices and inequality, and obtain each K4 support fact from
`H.selectedAt source.1 source.2`.  It introduces no new proof obligation.

## Exact packet fields

Keep the cap bound once at the outer level, rather than duplicating it in both
source records.  The remaining source surface must be present for **each** of
`source` and `source'` in this order (the order is intentionally identical to
the body of the existing one-source surface after its existential):

```lean
8 ≤ (S.capByIndex S.oppIndex1).card ∧
∃ source source' : CriticalShellSystem.CarrierVertex D.A,
  source.1 ≠ source'.1 ∧
    source.1 ∈ S.capInteriorByIndex S.oppIndex1 ∧
    source.1 ∉
      (({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Pρ.source₁, Pρ.source₂}) ∧
    H.centerAt source.1 source.2 ≠ H.centerAt P.source₁ P.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∧
    H.centerAt source.1 source.2 ≠ S.oppApex1 ∧
    H.centerAt source.1 source.2 ≠ S.oppApex2 ∧
    source.1 ∈ (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    (H.selectedAt source.1 source.2).toCriticalFourShell.support.card = 4 ∧
    CrossPairDeletionView (H := H) source P.source₁ P.source₂ ∧
    CrossPairDeletionView (H := H) source Pρ.source₁ Pρ.source₂ ∧
    -- the same ten source-local conjuncts with source' substituted for source
    ...
```

Do not weaken the two `CrossPairDeletionView` fields to selected-support
omission: current callers retain deletion survival, and `.omits` derives the
omission view when required.  Do not add common-radius membership, mutual
cross-membership, blocker equality, or a geometric-multiplicity alternative:
those are downstream branch data, not consequences of the cap-eight producer.

## Smallest consumer change after insertion

Replace only the body of private
`exists_two_firstFiberCapSourceWitness` (`FrontierLiveClosure.lean:7808-7841`).
Call the new producer with the same
`fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich`,
`hpairsDisjoint`, and `hcap`; destructure the two-source surface; repackage each
source as `FirstFiberCapSourceWitness P Pρ source` by prefixing the shared
outer `hcap`.  `FirstFiberCapSourceWitness` aliases
`CapSourceThirdCanonicalRowWitness` (`:7769-7771`), whose source-local field
order is exactly the ten fields above.

No other live caller needs a change.  The common-radius adapter at `:7847-7874`
uses its specialized raw common-radius producer, and the two-source witness is
otherwise consumed through that private first-fiber route (ultimate use at
`:11301`).  The existing single-source producer at
`TwoCollisionGlobalProducer.lean:619-643` remains the correct input to
`TwoCollisionGlobalSplit` and should remain unchanged.

## Trust/verification boundary

This is a source-level plan only.  It establishes neither elaboration nor
kernel closure; no build was authorized or run.
