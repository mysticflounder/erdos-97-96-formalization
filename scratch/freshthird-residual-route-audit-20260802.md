# FreshThird residual route audit (2026-08-02)

## Target and scope

The live target is

`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`

with the exact shape

```lean
theorem false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q)
    (hresidual : FreshThirdNormalizedResidualCase P Pρ C Q) :
    False := by
  sorry
```

The source tree and local theorem-bank search (`rg` over `lean/`,
`certificates/`, and relevant `docs/`) found no declaration outside
`FrontierLiveClosure.lean` that consumes `FreshThirdNormalizedResidualCase`,
`FreshThirdCapSourceNonHit`, or `FreshThirdEqualCenterExactFourRow` to derive
`False`.  The only matching declarations are producers/normalizers in that
file, and the target itself (the relevant source spans are approximately
`9063–9285`, `9436–9518`, and `9800–9818`).

## Available source-clean producers and adapters

* `FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` converts a
  non-cross-row interaction to `FreshThirdCapSourceNonHit`; it does not prove
  a contradiction.
* `cross_deletion_survives_iff_not_mem_selected_support` gives
  `HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt q hq) ↔
  w ∉ selected row support`.  It only changes the presentation of the
  `sourceRowOmission` survival field.
* `freshThirdEqualCenterExactFourRow_of_hits C Q hfirst hsecond hcenters`
  produces `FreshThirdEqualCenterExactFourRow C Q` from the two cross-row hits
  and equal centers.
* `allCollisionEndpointsOmitted_of_equalCenterHits C Q hfirst hsecond hcenters`
  produces `AllCollisionEndpointsOmitted P Pρ C.firstSource C.secondSource`.
* `false_of_two_freshThirdCrossRowHits_distinctCenters Q firstSource
  secondSource hfirst hsecond hcentersNe` is a contradiction only when the two
  source centers are *unequal*; it cannot consume the
  `equalCrossRowCenters` constructor.
* The definitional alias
  `FirstFiberCapSourceWitness P Pρ source :=
  CapSourceThirdCanonicalRowWitness P Pρ source` supplies a first-fiber
  witness when the source data already has that shape.  It is not an adapter
  from `FreshThirdBlockerFiber` to `FreshOutsideFirstBlockerFiber`.

## Constructor-by-constructor verdict

### `firstNonHit`

`FreshThirdCapSourceNonHit C.firstSource Q` has only the two cases
`sameBlocker (center_eq, support_eq)` and `sourceRowOmission (deleted,
deleted_eq, deleted_not_mem, deletion_survives)`.  No local terminal consumes
these fields together with a generic `FreshThirdBlockerFiber`; the deletion
equivalence above does not supply cap membership, common-radius membership, or
the fixed-blocker/outside-cap data required by existing first-fiber terminals.
**No kernel-valid route found.**

### `secondNonHit`

The second-source non-hit has the same interface and the same missing data,
with the symmetric source.  Existing second-fiber consumers require a
`FreshOutsideSecondBlockerFiber`, not `FreshThirdBlockerFiber`.
**No kernel-valid route found.**

### `equalCrossRowCenters`

The exact-row and all-endpoint-omission producers above are available, but no
source-clean consumer accepts their FreshThird packet.  The nearest terminal,
`false_of_twoCapSources_sameBlockerAllEndpointOmission`, additionally requires
`FreshOutsideFirstBlockerFiber P Pρ`, common-radius memberships for both
sources, mutual cross-membership, equality of source blockers, blocker-cap
interior membership, and an exact shell/interior-cap intersection.  None of
these is entailed by `FreshThirdBlockerFiber` or by the equal-center residual.
The distinct-center terminal is inapplicable because this constructor asserts
center equality. **No kernel-valid route found.**

## Closest existing contradiction signatures (not applicable)

* `false_of_twoCapSources_freshOutsideFirstBlockerFiber (C)
  (Nonempty (FreshOutsideFirstBlockerFiber P Pρ))` and its second-blocker
  analogue need a same-`P` blocker fiber with outside-cap and exact-shell
  fields absent from `Q`.
* `false_of_twoCapSources_oneSidedDeletionSurvival` needs a
  `FreshOutsideFirstBlockerFiber`, two common-radius source memberships, two
  `FirstFiberCapSourceWitness` values, and a
  `TwoCapSourcesOneSidedDeletionSurvival` disjunction; the residual supplies
  none of the fixed-fiber/radius hypotheses.
* `false_of_twoCapSources_sameBlockerAllEndpointOmission` has the additional
  requirements listed above; equal-center omission alone is insufficient.

## Overall status

All three residual constructors remain genuinely open.  A source-clean alias,
conditional wrapper, or solver result would not close the target.  The next
valid step is a new source-faithful bridge/terminal retaining the cap, apex,
blocker, and row-order provenance needed by one of the existing contradiction
consumers; simply coercing `Q` to a `FreshOutside*` fiber would be unsound.
