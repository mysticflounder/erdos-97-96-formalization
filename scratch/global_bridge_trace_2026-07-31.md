# Frontier global-bridge trace (2026-07-31)

## Scope

Read-only audit of the live `TwoSourceExactCollisionRowsTerminal` route in
`FrontierLiveClosure.lean`, focused on the two terminal leaves
`false_of_crossBlockerCoincidence` and
`false_of_capSourceThirdCanonicalRowSurface`. No production Lean files were
changed.

## Load-bearing leaves and immediate consumer

- `FrontierLiveClosure.lean:7452-7456` declares
  `false_of_crossBlockerCoincidence`; its hypotheses are the four-arm
  `CrossBlockerCoincidence` disjunction and
  `GeometricMultiplicityResidual`, and the body is `sorry`.
- `FrontierLiveClosure.lean:7491-7495` declares
  `false_of_capSourceThirdCanonicalRowSurface`; it takes the cap-eight source
  surface plus the same residual and its body is `sorry`.
- The only direct load-bearing calls are the residual branches of
  `exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
  (`FrontierLiveClosure.lean:11343-11373`). The checked finite incidence
  theorem first produces
  `CollisionCrossHit ∨ GeometricMultiplicityResidual`; in the residual case
  it splits the cap/equality packet and calls exactly these two leaves. The
  subsequent three-hit and low-hit contradiction theorems therefore do not
  provide an alternate bridge.

`CrossBlockerCoincidence` is exactly the four equalities at
`TwoCollisionGlobalProducer.lean:478-492`. The source packet is the explicit
cap-card/source/support/deletion-survival conjunction at
`TwoCollisionGlobalProducer.lean:547-577`.

## Checked producers that stop before contradiction

The blocker-fiber residual is only a disjunction:
`Nonempty FreshThirdBlockerFiber ∨ Nonempty FreshOutsideFirstBlockerFiber ∨
Nonempty FreshOutsideSecondBlockerFiber` (the `BlockerMultiplicityGeometry`
abbrev). `collisionCrossHit_or_geometricMultiplicity` is checked, but has no
negative conclusion.

The source-level compatibility adapters immediately call the cap-source leaf,
without consuming their extra fields:

- `false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow` and
  `false_of_capSource_freshThirdBlockerFiber`
  (`FrontierLiveClosure.lean:7578-7608`) pass the fresh-third arm.
- `false_of_twoCapSources_oneSidedDeletionSurvival`
  (`:9193-9214`) passes the fresh-first arm; its source radii and one-sided
  survival are not used by the terminal.
- `false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
  (`:11047-11069`) passes the same fresh-first arm. `hsingleton`, `haligned`,
  and `hsecondNe` are compatibility-only arguments at this boundary.

One checked local bridge does exist:
`secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` proves `hsecondNe`
from ordered-cap uniqueness, but it only returns the inequality and does not
close the cap-source branch.

## Minimal deletion / deletion-survival audit

The current cap-source section contains a promising but unconsumed chain:

1. `exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion`
   (`FrontierLiveClosure.lean:9408-9424`) obtains one endpoint from each
   collision pair, source-row survival after deleting both, and first-apex
   blocking after deleting both.
2. `firstApex_minimalDeletionCore_of_crossRetainedEndpoints`
   (`:9647-9695`) turns that blocked double deletion into
   `Nonempty MinimalDeletionCore D.A {x,y} S.oppApex1`.
3. `exists_secondRowOutsidePoint_ne_firstOutsidePair`
   (`:9569-9640`) uses the fresh-first fiber and `hsecondNe` to produce an
   additional second-row point outside its two-point off-cap pair.
4. `freshOutsideSecondBlockerFiber_of_secondRowOutsidePoint`
   (`:9781-9805` onward) upgrades that point to a fresh-second fiber when its
   blocker is the second collision blocker.

Search over `P97/ATail` shows no consumer of the resulting
`MinimalDeletionCore`, second-row point, or fresh-second packet that reaches
`False`; the only current uses of `MinimalDeletionCore` are legacy route code
and the private constructor above. `GlobalMinimalDeletion.lean` supplies a
general deletion-core theorem, but no current FrontierLiveClosure declaration
calls it.

## First exact missing bridge

There is no source-clean theorem combining the retained global data with the
residual to prove either terminal. The first missing bridge is therefore a
global contradiction lemma of one of these equivalent shapes:

```text
CapSourceThirdCanonicalRowSurface P Pρ ∧
  GeometricMultiplicityResidual P Pρ → False

CrossBlockerCoincidence P Pρ ∧
  GeometricMultiplicityResidual P Pρ → False
```

To avoid merely restating the `sorry`, its proof must consume at least one of
the currently stranded objects above (minimal deletion core / six-center
deletion-survival packet / second-row outside point) together with the retained
tri-apex/no-M44 and localized-deletion hypotheses. No checked local singleton,
alignment, blocker-inequality, cap-card, or finite-incidence lemma currently
supplies that final global contradiction.

