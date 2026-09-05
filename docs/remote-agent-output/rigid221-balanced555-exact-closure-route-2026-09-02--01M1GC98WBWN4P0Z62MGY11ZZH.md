# Exact closure route for the Rigid221 balanced `(5,5,5)` tight leaf

**Date:** 2026-09-02  
**Target:** `Problem97.ATailFrontierLiveClosure.Rigid221Closure.false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical`  
**Verdict:** the leaf is reducible to one small source-order adapter and one proof-checked finite UNSAT theorem. No new continuous Euclidean lemma is needed.

## 1. Correction to the previous finite checkpoint

The previous source-facing verifier contained one real implementation defect: it asserted that every globally generated Kalmanson occurrence had a nonempty local row domain. Some occurrences are impossible at a Moser apex after the source row/cap constraints are imposed.

The correct construction discards those impossible antecedents before building the finite constraint system. After that repair:

```text
raw two-term Kalmanson cores:       49,104
impossible cores discarded:         10,122
effective cores:                    38,982
direct pinned-row root cells:        1,656
mirror pinned-row root cells:        1,656
SAT roots:                               0
```

Corrected replay receipt:

```text
230594bc83e85e84c43a612cee4fdee00fd108428c1e67f34ffd8784fe97fc3e
```

The conclusion survives the correction, but the unpatched verifier must not be cited.

## 2. The source theorem should be stated over the existing invariant

Do not expose the old role variables, a second-apex completion identity, or the new flexible-role packet in the final public theorem. The clean source-facing endpoint is:

```lean
theorem false_of_balancedTightCoverInvariant
    (I : ExactFiveDistinctThreeCenterTightCover.BalancedTightCoverInvariant R C N) :
    False
```

The live target should then be:

```lean
obtain ⟨I⟩ :=
  ExactFiveDistinctThreeCenterTightCover.nonempty_balancedTightCoverInvariant
    R C normalForm carrier_card_eq_twelve union_card_eq_eleven
      carrier_erase_deleted_eq_union
exact false_of_balancedTightCoverInvariant I
```

`BalancedTightCoverFlexibleRolePacket` is useful diagnostic/source infrastructure, but the corrected 1,656-cell theorem does not require it.

## 3. What `BalancedTightCoverInvariant` already supplies

The current invariant gives all branch-specific incidence facts needed by the finite theorem:

- `D.A.card = 12`;
- three exact selected four-classes `K₀`, `K₁`, `K₂` at the first apex, retained blocker, and second apex;
- `K₀ ∩ K₁ = {retained}`;
- `K₀` and `K₁` are disjoint from `K₂`;
- `deleted` is outside the three-row union;
- the carrier is `insert deleted (K₀ ∪ K₁ ∪ K₂)`;
- all three closed caps have cardinality five;
- both opposite strict interiors have cardinality three;
- the first strict interior is exactly `{deleted, retained, third}`.

The source does **not** need to prove:

- `SelectedClass O₂ = insert deleted K₂`;
- that `K₂` contains all three second-interior points;
- a named first or second adjacent hit;
- a named complement formula for `K₁`;
- a cap location for the retained blocker;
- an order among `deleted`, `retained`, and `third` inside their three-point block.

All six internal permutations remain source-legal and are included in the finite theorem.

## 4. New source lemma A: balanced boundary labeling

Suggested module:

```text
P97/ATail/FrontierLiveClosure/Balanced555BoundaryLabeling.lean
```

### 4.1 Statement

```lean
inductive Balanced555Orientation
| direct
| mirror

structure Balanced555BoundaryLabeling
    (I : BalancedTightCoverInvariant R C N) where
  orientation : Balanced555Orientation
  labels : GeneralCarrierBridge.CarrierLabel D.A ≃ Fin 12
  pointOf : Fin 12 → ℝ² := fun i => (labels.symm i).1
  pointOf_injective : Function.Injective pointOf
  pointOf_image : Finset.univ.image pointOf = D.A
  pointOf_ccw : EuclideanGeometry.IsCcwConvexPolygon pointOf

  surplusApex_label : labels ⟨S.surplusApex, S.surplusApex_mem⟩ = 0
  firstApex_label : labels ⟨S.oppApex1, ...⟩ =
    match orientation with | .direct => 4 | .mirror => 8
  secondApex_label : labels ⟨S.oppApex2, ...⟩ =
    match orientation with | .direct => 8 | .mirror => 4

  secondInterior_labels :
    ExactTwelveCarrierIngress.labelsOf labels
      (S.capInteriorByIndex S.oppIndex2) =
      match orientation with
      | .direct => {1,2,3}
      | .mirror => {9,10,11}

  surplusInterior_labels :
    ExactTwelveCarrierIngress.labelsOf labels
      (S.capInteriorByIndex S.surplusIdx) = {5,6,7}

  firstInterior_labels :
    ExactTwelveCarrierIngress.labelsOf labels
      (S.capInteriorByIndex S.oppIndex1) =
      match orientation with
      | .direct => {9,10,11}
      | .mirror => {1,2,3}
```

### 4.2 Proof chain

1. Call `Problem97.Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S`.
2. Derive the surplus strict-interior cardinality from `capInteriorByIndex_card_add_two S S.surplusIdx` and the surplus cap cardinality five.
3. Derive `B.n = 12` by taking cardinalities of `univ.image B.boundary`, using boundary injectivity/image and `I.carrier_card_eq_twelve`.
4. In the direct branch, inject the three strict interiors into the three open index intervals. Each interval contains at least three indices; the three apex indices consume the other three positions. `omega` gives `iv=4`, `iw=8`, and exact three-slot blocks.
5. The mirror branch gives `iw=4`, `iv=8` similarly.
6. Define the labeling equivalence from `B.indexOf`, cast through `B.n=12`, and prove surjectivity from finite cardinality. Use `B.point_eq` for the point identities.

No second-apex selected-class identity is needed.

## 5. New source lemma B: one pinned all-center row pattern

Use `Problem97.exists_faithfulCarrierPattern_with_classes_on` with center set `{S.oppApex1, blocker, S.oppApex2}` and dependent classes `N.firstApexClass`, `N.blockerClass`, and `N.secondApexClass`. Center membership/distinctness are fields of `N.freshThreeCenter`.

Relabel `GeneralCarrierBridge.rowPattern F` through the boundary equivalence using `GenericRowNogoodCertificate.reindexRowPattern`, `realizes_reindexRowPattern`, and the exact-twelve labeled row-pattern APIs. No faithful-support closure or minimality theorem is used.

## 6. Source facts that discharge the finite row surface

- row cardinality and center exclusion: `SelectedFourClass` fields;
- cap intersection at most two: `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`;
- opposite-apex strict-interior and adjacent-cap distribution: the existing selected-class distribution theorems;
- shared-pair alternation: `GeneralCarrierAbstractRowSystem.system_sharedPairAlternating` or `selectedFourClass_shared_pair_separated`;
- pinned row intersections, deletion exclusion, and carrier cover: fields of `I` after relabeling.

## 7. Finite theorem and certificate

```lean
structure Balanced555FiniteSurface where
  orientation : Balanced555Orientation
  row : Fin 12 → Finset (Fin 12)
  deleted retained third middle : Fin 12
  -- generic row/cap/shared-pair fields
  -- pinned tight-cover fields

theorem false_of_balanced555FiniteSurface
    (S : Balanced555FiniteSurface) : False
```

The corrected search has 1,656 direct roots, 1,656 mirror roots, and 38,982 effective two-term Kalmanson occurrences. `S4-A` is unnecessary. Every retained leaf can call `GenericRowNogoodCertificate.false_of_twoKalmansonCancellationData_of_check`.

The recommended kernel route is a deterministic direct/mirror CNF plus existing compact RUP/LRAT infrastructure (`CheckpointedRup`, compact ingress, and `TerminalRupIngress`). The source side defines a valuation from the relabeled row table and proves every clause family.

Externally reported v3 formulas are:

```text
direct: 148 vars, 50,657 clauses
SHA-256 8ff31b7789c3cfcce63be86bee1ddf76f6b131d91f8949feb0b73eb6fba52006

mirror: 148 vars, 50,657 clauses
SHA-256 fa330b76c28b0061a3dadd23e0d4066c20ba63d941d1c70ffe1b54bab35a2d88
```

These must be regenerated and committed with the generator, exact inputs, proof payloads, manifest, and independent checker receipts; hashes alone are not proof custody.

## 8. Final ingress

```lean
theorem false_of_balancedTightCoverInvariant
    (I : BalancedTightCoverInvariant R C N) : False := by
  obtain ⟨L⟩ := nonempty_balanced555BoundaryLabeling I
  obtain ⟨F, hF⟩ := pinnedFaithfulCarrierPattern I
  let P := ExactTwelveCarrierIngress.labeledRowPattern F L.labels
  have hreal : EqualityCore.Realizes P L.pointOf := ...
  have hsurface : Balanced555FiniteSurface :=
    balanced555FiniteSurface_of_source I L F hF
  exact false_of_balanced555FiniteSurface hsurface
```

The live target then reduces to constructing `I` and invoking this theorem.

## 9. Exact remaining obligations

1. `Balanced555BoundaryLabeling.lean`.
2. Deterministic direct/mirror finite formula generator and committed exact inputs.
3. Independently checked compact RUP/LRAT proofs plus Lean clause identity.
4. Source valuation/ingress theorem and one-line replacement of the target `sorry`.

No additional continuous geometry, PiQD search, B1/TwoDeletion import, second-class completion theorem, blocker-cap localization, or source-heavy exact-twelve packet is required.
