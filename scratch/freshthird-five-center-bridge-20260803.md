# FreshThird -> FiveCenter bridge audit (2026-08-03)

## Verdict

**OPEN (no source-clean FiveCenter adapter found).**  The `firstNonHit` /
`secondNonHit` payloads do not construct an existing
`ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival` packet, and no
other checked contradiction consumer accepts them.  The only direct consumer
is the unresolved theorem
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`, whose
body is still `sorry` (`FrontierLiveClosure.lean:11324-11331`).

## Exact interfaces

* `CrossPairDeletionView source x y` is only
  `HasNEquidistantPointsAt 4 (D.A.erase x) center ∨
  HasNEquidistantPointsAt 4 (D.A.erase y) center`
  (`TwoCollisionGlobalProducer.lean:494-502, 527-531`).  Its checked
  projection is the equivalent support omission
  `x ∉ support ∨ y ∉ support` via `CrossPairDeletionView.omits`
  (`:512-543`).
* `CapSourceThirdCanonicalRowWitness` stores one source row, two such
  cross-pair views (for `P` and `Pρ`), and source/cap/center exclusions
  (`FrontierLiveClosure.lean:9227-9245`).
* `FreshThirdCapSourceNonHit` has only two constructors
  (`FrontierLiveClosure.lean:10463-10482`):
  `sameBlocker` (center/support equality with `Q.source₁`) or
  `sourceRowOmission` (one deleted `Q.source₁/₂`, omitted from this source
  support, with K4 surviving at this source center).
  `FreshThirdNormalizedResidualCase.firstNonHit/secondNonHit` carry exactly
  one such payload (`:10515-10527`); the remaining-case versions additionally
  carry the other `FreshThirdCapSourceInteraction` (`:11280-11300`).

## Why FiveCenter does not follow

`FiveCenterDeletionSurvival D q c₀ c₁ c₂ c₃ c₄` (theorem-bank definition in
`FirstFiberOverlapDescent.lean:39-48`) requires **one common deleted point**
`q` and five independent surviving rows at five named centers.  A
`CrossPairDeletionView` gives only a disjunction and only at the cap-source
center; the two views may choose different endpoints.  `sameBlocker` adds no
deletion survival at all.  `sourceRowOmission` gives survival for a `Q`
endpoint only at the one source center, with no rows at either collision
blocker, `S.oppApex1`, `S.oppApex2`, or `S.surplusApex`.  Thus the missing
hypotheses for a FiveCenter adapter are:

1. a single endpoint `q` selected consistently by both cross-pair obligations
   (or a theorem upgrading the two disjunctions to one common endpoint);
2. four additional `HasNEquidistantPointsAt 4 (D.A.erase q) ...` rows at the
   required blocker/apex centers; and
3. the usual source/deleted membership and center-separation facts needed by
   `FiveSurvivorExactRowsBoundary`.

The `FirstFiberCollisionFiveCenterDeletionResidual` consumer instead expects
one of the four collision endpoints as `q` and already-supplied robust rows
at the opposite blocker and two robust apices (`FirstFiberOverlapDescent.lean:
85-108`); FreshThird non-hit data supplies none of these.

## Closest checked consumer

The existing source-clean use of the two `CrossPairDeletionView`s is the
private aligned-radii lemma
`exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion`
(`FrontierLiveClosure.lean:14144-14160`): it extracts one omitted endpoint
from each pair via `.omits` (`:14162-14181`), proving **double-deletion**
survival at the cap-source row and first-apex failure under an extra
`FirstCapMultiPointRadiiRetained` alignment hypothesis.  This is not a
FiveCenter (single-deletion/five-center) packet and does not apply to the
FreshThird non-hit residual without that alignment and endpoint-radius data.

## Compile check

The projection adapter

```lean
example {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A) (x y : ℝ²)
    (v : CrossPairDeletionView (H := H) source x y) :
    CrossPairSelectedSupportOmission (H := H) source x y := v.omits
```

was checked from stdin with `lake env lean` after a successful
`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure` (build completed
successfully).  No adapter to `FiveCenterDeletionSurvival` or a source-clean
FreshThird contradiction compiled/exists in the current imports.
