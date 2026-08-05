# Cross-pair deletion/view audit (2026-08-05)

## Declarations in `TwoCollisionGlobalProducer.lean`

- `CrossPairDeletionSurvival` (`:495`) is only
  `HasNEquidistantPointsAt 4 (D.A.erase x) center ∨
  HasNEquidistantPointsAt 4 (D.A.erase y) center`.
- `crossPairDeletionSurvival_iff_selectedSupportOmission` (`:514`) rewrites
  that disjunction to `x ∉ K.support ∨ y ∉ K.support`, where `K` is the
  source's canonical `CriticalFourShell`.
- `CrossPairDeletionView` (`:527`) stores only the survival proposition;
  `CrossPairDeletionView.omits` (`:539`) is the derived omission disjunction.
- `CapSourceThirdCanonicalRowSurface` (`:552`) adds the cap-eight bound,
  source interior/outside and center exclusions, `q_mem_support`,
  `support.card = 4`, and one `CrossPairDeletionView` for each collision pair.
- `exists_capSource_thirdCanonicalRow_omits_each_collisionPair` (`:619`) is
  the producer of that surface.  Despite its docstring, its conclusion is the
  surface/views packet; it does not assert a positive third-row incidence.

## Existing FreshThird consumers

`FrontierLiveClosure.lean` consumes the views negatively at `:18523` in
`exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion`: each
`view.omits` is destructured to choose an omitted endpoint, then the source
row is shown to survive deleting both chosen endpoints.  The same omission
fields feed `common_omission_or_complementary_membership` at `:13504`.

The positive incidence notion is separately defined as
`FreshThirdCrossRowHit` (`FrontierLiveClosure.lean:14125`):

```lean
H.centerAt source.1 source.2 ≠ H.centerAt Q.source₁.1 Q.source₁.2 ∧
Q.source₁.1 ∈ K.support ∧ Q.source₂.1 ∈ K.support
```

Its positive fields are supplied only by the
`FreshThirdCapSourceInteraction.distinctBlockersDifferentCaps` and
`.sameCapWithInternalFiberSource` constructors (`:14059`), or by an explicit
`FreshThirdCrossRowHit` premise.  The `sourceRowOmission` constructor is the
opposite (negative) case and is normalized by
`FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` (`:14249`).

## Strongest source-clean result / implementation route

From the deletion-survival fields alone, the strongest source-clean theorem is
the existing surface (or a trivial projection adapter):

```lean
theorem crossPairViews_omit_each
    (h : CapSourceThirdCanonicalRowSurface P Pρ) :
    ∃ source, CrossPairSelectedSupportOmission source P.source₁ P.source₂ ∧
      CrossPairSelectedSupportOmission source Pρ.source₁ Pρ.source₂ := by
  rcases h with ⟨hcap, source, hsourceInterior, hsourceOutside,
    hcenterNe, hcenterNeρ, hcenterNeFirst, hcenterNeSecond,
    hsourceMem, hsourceCard, hP, hPρ⟩
  exact ⟨source, hP.omits, hPρ.omits⟩
```

(The production theorem may retain the other surface fields in the witness;
this adapter adds no mathematical content.)  There is no derivation of a positive
`FreshThirdCrossRowHit` or of a third support/incidence point from
`q_mem_support + support.card = 4 + two omission disjunctions`: omission is
negative, and the two collision pairs may each omit an endpoint.  A positive
third-row theorem must therefore take one of the interaction constructors (or
`source₁_mem`/`source₂_mem`) as an additional premise and return
`⟨centers_ne, source₁_mem, source₂_mem⟩`; it cannot be produced by
`CrossPairDeletionView` alone.
