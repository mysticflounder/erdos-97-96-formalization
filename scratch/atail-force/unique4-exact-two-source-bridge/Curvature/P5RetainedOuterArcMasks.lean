/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CardElevenExactTwoBoundaryPackets
import SelectedFourClassCurvature

/-!
# Source semantics of the retained p5 outer-arc masks

This file gives the source-level meaning of the
`direct_no_four_turn_disjoint_outer_arcs` clauses retained by the p5
exact-two Boolean core.

An injective CCW `Fin 11` boundary and a `FaithfulCarrierPattern` determine,
at every boundary center, the exact four boundary positions of the selected
equal-radius row.  Sorting those positions in the centered reversed chart
gives the two outer strict-quarter-turn arcs.  Their masks are the cyclic
edge-turn positions used by `openWindowArcCurvature`.

The final theorem is the clause-family theorem: four retained outer-arc masks
which are pairwise disjoint imply `False`.  It uses the production
shell-curvature full-turn aggregate identity, not a finite SAT certificate.
-/

open scoped EuclideanGeometry Real BigOperators

namespace Problem97
namespace ATailUniqueFourExactTwoCurvatureScratch

open EuclideanGeometry
open ShellCurvatureConstruction
open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing

attribute [local instance] Classical.propDecidable

/-- Source data needed to interpret every retained p5 selected-row variable. -/
structure P5CurvatureSource (A : Finset ℝ²) where
  boundary : Fin 11 → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_ccw : IsCcwConvexPolygon boundary
  boundary_image : Finset.univ.image boundary = A
  carrierPattern : FaithfulCarrierPattern A

namespace P5CurvatureSource

/-- Forget the residual-specific fields of an exact-two boundary core while
retaining its actual boundary and faithful selected-row system. -/
def ofExactTwoBoundaryCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {distribution :
      ATailUniqueFourClassCapDistributionScratch.ExactTwoStrictHitDistribution R}
    (core :
      ATailUniqueFourExactTwoBoundaryScratch.ExactTwoBoundaryCore R distribution) :
    P5CurvatureSource D.A where
  boundary := core.boundary
  boundary_injective := core.boundary_injective
  boundary_ccw := core.boundary_ccw
  boundary_image := core.boundary_image
  carrierPattern := core.carrierPattern

theorem boundary_mem {A : Finset ℝ²} (Q : P5CurvatureSource A) (i : Fin 11) :
    Q.boundary i ∈ A := by
  have hi : Q.boundary i ∈ Finset.univ.image Q.boundary :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  simpa only [Q.boundary_image] using hi

private theorem exists_boundaryIndexOf {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (x : CarrierLabel A) :
    ∃ i : Fin 11, Q.boundary i = x.1 := by
  have hx : x.1 ∈ Finset.univ.image Q.boundary := by
    rw [Q.boundary_image]
    exact x.2
  rcases Finset.mem_image.mp hx with ⟨i, _hi, hix⟩
  exact ⟨i, hix⟩

/-- The inverse boundary coordinate of a carrier label. -/
noncomputable def boundaryIndexOf {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (x : CarrierLabel A) : Fin 11 :=
  Classical.choose (Q.exists_boundaryIndexOf x)

theorem boundary_boundaryIndexOf {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (x : CarrierLabel A) :
    Q.boundary (Q.boundaryIndexOf x) = x.1 :=
  Classical.choose_spec (Q.exists_boundaryIndexOf x)

theorem boundaryIndexOf_injective {A : Finset ℝ²}
    (Q : P5CurvatureSource A) : Function.Injective Q.boundaryIndexOf := by
  intro x y hxy
  apply Subtype.ext
  calc
    x.1 = Q.boundary (Q.boundaryIndexOf x) := (Q.boundary_boundaryIndexOf x).symm
    _ = Q.boundary (Q.boundaryIndexOf y) := congrArg Q.boundary hxy
    _ = y.1 := Q.boundary_boundaryIndexOf y

theorem boundaryIndexOf_boundary {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (i : Fin 11) :
    Q.boundaryIndexOf ⟨Q.boundary i, Q.boundary_mem i⟩ = i := by
  apply Q.boundary_injective
  exact Q.boundary_boundaryIndexOf ⟨Q.boundary i, Q.boundary_mem i⟩

/-- The production shell-curvature indexing induced by the retained boundary. -/
noncomputable def indexing {A : Finset ℝ²}
    (Q : P5CurvatureSource A) : ShellBoundaryIndexing A where
  n := 10
  three_le := by omega
  boundary := Q.boundary
  indexOf := Q.boundaryIndexOf
  boundary_injective := Q.boundary_injective
  boundary_image := Q.boundary_image
  boundary_ccw := Q.boundary_ccw
  index_injective := Q.boundaryIndexOf_injective
  point_eq := Q.boundary_boundaryIndexOf

/-- The actual selected four-point row at boundary center `center`. -/
noncomputable def selectedRow {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (center : Fin 11) :
    SelectedFourClass A (Q.boundary center) :=
  Q.carrierPattern.classAt (Q.boundary center) (Q.boundary_mem center)

/-- Boundary positions occupied by the actual selected row at `center`. -/
noncomputable def selectedRowSupport {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (center : Fin 11) : Finset (Fin 11) :=
  Finset.univ.filter fun i ↦ Q.boundary i ∈ (Q.selectedRow center).support

/-- The boundary image of `selectedRowSupport` is exactly the geometric row. -/
theorem image_selectedRowSupport {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (center : Fin 11) :
    (Q.selectedRowSupport center).image Q.boundary =
      (Q.selectedRow center).support := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    exact (Finset.mem_filter.mp hi).2
  · intro hx
    have hxA := (Q.selectedRow center).support_subset_A hx
    have hxImage : x ∈ Finset.univ.image Q.boundary := by
      rw [Q.boundary_image]
      exact hxA
    rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
    exact Finset.mem_image.mpr
      ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hx⟩, rfl⟩

/-- Every retained selected row has exactly four boundary positions. -/
theorem selectedRowSupport_card {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (center : Fin 11) :
    (Q.selectedRowSupport center).card = 4 := by
  have hcard := congrArg Finset.card (Q.image_selectedRowSupport center)
  rw [Finset.card_image_of_injective _ Q.boundary_injective] at hcard
  exact hcard.trans (Q.selectedRow center).support_card

/-- Left or right outer arc of a selected four-point row. -/
inductive OuterSide
  | left
  | right
  deriving DecidableEq

/-- One retained outer-arc variable, identified by its center and side. -/
structure RetainedOuterArc where
  center : Fin 11
  side : OuterSide

namespace RetainedOuterArc

noncomputable def centerLabel {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) : CarrierLabel A :=
  ⟨Q.boundary arc.center, Q.boundary_mem arc.center⟩

noncomputable def start {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) : ℕ :=
  let B := Q.indexing
  let K := Q.selectedRow arc.center
  let center := arc.centerLabel Q
  match arc.side with
  | .left =>
      B.globalChartStartAt (selectedClassCenterLabel K center.2)
  | .right =>
      B.globalChartStartAt (selectedClassCenterLabel K center.2) +
        B.selectedCenteredSupportIndex K center.2 2

noncomputable def turnCount {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) : ℕ :=
  let B := Q.indexing
  let K := Q.selectedRow arc.center
  let center := arc.centerLabel Q
  match arc.side with
  | .left => B.selectedCenteredSupportIndex K center.2 1 - 1
  | .right => 10 - B.selectedCenteredSupportIndex K center.2 2

noncomputable def finish {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) : ℕ :=
  arc.start Q + arc.turnCount Q + 1

/-- The exact cyclic edge-turn mask used by this retained outer arc. -/
noncomputable def turnMask {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) : Finset (Fin 11) :=
  (Finset.range (arc.turnCount Q)).image fun k ↦
    ⟨(arc.start Q + k) % 11, Nat.mod_lt _ (by omega)⟩

theorem turnCount_pos {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) : 0 < arc.turnCount Q := by
  rcases arc with ⟨arcCenter, arcSide⟩
  let B := Q.indexing
  let K := Q.selectedRow arcCenter
  let center : CarrierLabel A := ⟨Q.boundary arcCenter, Q.boundary_mem arcCenter⟩
  have h₀ :
      0 < B.selectedCenteredSupportIndex K center.2 0 :=
    B.selectedCenteredSupportIndex_pos K center.2 0
  have h₀₁ :
      B.selectedCenteredSupportIndex K center.2 0 <
        B.selectedCenteredSupportIndex K center.2 1 :=
    (B.selectedCenteredSupportOrder K center.2).strictMono
      (by decide : (0 : Fin 4) < 1)
  have h₂₃ :
      B.selectedCenteredSupportIndex K center.2 2 <
        B.selectedCenteredSupportIndex K center.2 3 :=
    (B.selectedCenteredSupportOrder K center.2).strictMono
      (by decide : (2 : Fin 4) < 3)
  have h₃ :
      B.selectedCenteredSupportIndex K center.2 3 < 11 := by
    simpa [B, indexing] using
      B.selectedCenteredSupportIndex_lt_period K center.2 3
  cases arcSide with
  | left =>
      change 0 <
        B.selectedCenteredSupportIndex K center.2 1 - 1
      omega
  | right =>
      change 0 <
        10 - B.selectedCenteredSupportIndex K center.2 2
      omega

theorem turnCount_le_eleven {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) : arc.turnCount Q ≤ 11 := by
  rcases arc with ⟨arcCenter, arcSide⟩
  let B := Q.indexing
  let K := Q.selectedRow arcCenter
  let center : CarrierLabel A := ⟨Q.boundary arcCenter, Q.boundary_mem arcCenter⟩
  have h₁ :
      B.selectedCenteredSupportIndex K center.2 1 < 11 := by
    simpa [B, indexing] using
      B.selectedCenteredSupportIndex_lt_period K center.2 1
  cases arcSide with
  | left =>
      change B.selectedCenteredSupportIndex K center.2 1 - 1 ≤ 11
      omega
  | right =>
      change 10 - B.selectedCenteredSupportIndex K center.2 2 ≤ 11
      omega

theorem start_add_turnCount_lt_twentyTwo {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (arc : RetainedOuterArc) :
    arc.start Q + arc.turnCount Q < 22 := by
  rcases arc with ⟨arcCenter, arcSide⟩
  let B := Q.indexing
  let K := Q.selectedRow arcCenter
  let center : CarrierLabel A := ⟨Q.boundary arcCenter, Q.boundary_mem arcCenter⟩
  have hs :
      B.globalChartStartAt (selectedClassCenterLabel K center.2) < 11 := by
    exact (-(B.indexOf (selectedClassCenterLabel K center.2))).isLt
  have h₁ :
      B.selectedCenteredSupportIndex K center.2 1 < 11 := by
    simpa [B, indexing] using
      B.selectedCenteredSupportIndex_lt_period K center.2 1
  have h₂ :
      B.selectedCenteredSupportIndex K center.2 2 < 11 := by
    simpa [B, indexing] using
      B.selectedCenteredSupportIndex_lt_period K center.2 2
  cases arcSide with
  | left =>
      change B.globalChartStartAt (selectedClassCenterLabel K center.2) +
          (B.selectedCenteredSupportIndex K center.2 1 - 1) < 22
      omega
  | right =>
      change B.globalChartStartAt (selectedClassCenterLabel K center.2) +
          B.selectedCenteredSupportIndex K center.2 2 +
          (10 - B.selectedCenteredSupportIndex K center.2 2) < 22
      omega

/-- Each retained arc has the strict quarter-turn inequality attached to its
actual selected equal-radius row. -/
theorem quarterTurn {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc : RetainedOuterArc) :
    Real.pi / 2 <
      ShellCurvature.openWindowArcCurvature Q.indexing.chart
        (arc.start Q) (arc.finish Q) := by
  rcases arc with ⟨arcCenter, arcSide⟩
  let B := Q.indexing
  let K := Q.selectedRow arcCenter
  let center : CarrierLabel A := ⟨Q.boundary arcCenter, Q.boundary_mem arcCenter⟩
  have hsep := B.selectedFourClass_has_globalSelectedQuarterTurnArcs K center.2
  dsimp [HasGlobalSelectedQuarterTurnArcs] at hsep
  have h₁ : 0 < B.selectedCenteredSupportIndex K center.2 1 :=
    B.selectedCenteredSupportIndex_pos K center.2 1
  have h₂ :
      B.selectedCenteredSupportIndex K center.2 2 < 11 := by
    simpa [B, indexing] using
      B.selectedCenteredSupportIndex_lt_period K center.2 2
  cases arcSide with
  | left =>
      change Real.pi / 2 <
        ShellCurvature.openWindowArcCurvature B.chart
          (B.globalChartStartAt (selectedClassCenterLabel K center.2))
          (B.globalChartStartAt (selectedClassCenterLabel K center.2) +
            (B.selectedCenteredSupportIndex K center.2 1 - 1) + 1)
      have hfinish :
          B.globalChartStartAt (selectedClassCenterLabel K center.2) +
              (B.selectedCenteredSupportIndex K center.2 1 - 1) + 1 =
            B.globalChartStartAt (selectedClassCenterLabel K center.2) +
              B.selectedCenteredSupportIndex K center.2 1 := by
        omega
      rw [hfinish]
      exact hsep.1
  | right =>
      change Real.pi / 2 <
        ShellCurvature.openWindowArcCurvature B.chart
          (B.globalChartStartAt (selectedClassCenterLabel K center.2) +
            B.selectedCenteredSupportIndex K center.2 2)
          (B.globalChartStartAt (selectedClassCenterLabel K center.2) +
            B.selectedCenteredSupportIndex K center.2 2 +
            (10 - B.selectedCenteredSupportIndex K center.2 2) + 1)
      have hfinish :
          B.globalChartStartAt (selectedClassCenterLabel K center.2) +
                B.selectedCenteredSupportIndex K center.2 2 +
                (10 - B.selectedCenteredSupportIndex K center.2 2) + 1 =
            B.globalChartStartAt (selectedClassCenterLabel K center.2) + 11 := by
        omega
      rw [hfinish]
      exact hsep.2

end RetainedOuterArc

private theorem edgeLift_add_count_sub
    (point : Fin 11 → ℝ²) (start count : ℕ) :
    edgeLift point (start + count) - edgeLift point start =
      ∑ k ∈ Finset.range count, exteriorTurn point (start + k) := by
  induction count with
  | zero => simp
  | succ count ih =>
      rw [show start + (count + 1) = (start + count) + 1 by omega,
        edgeLift_succ, Finset.sum_range_succ]
      calc
        edgeLift point (start + count) + exteriorTurn point (start + count) -
              edgeLift point start =
            (edgeLift point (start + count) - edgeLift point start) +
              exteriorTurn point (start + count) := by ring
        _ = (∑ k ∈ Finset.range count, exteriorTurn point (start + k)) +
              exteriorTurn point (start + count) := by rw [ih]

private theorem exteriorTurn_eq_mod_eleven
    (point : Fin 11 → ℝ²) {i : ℕ} (hi : i < 22) :
    exteriorTurn point i = exteriorTurn point (i % 11) := by
  by_cases hsmall : i < 11
  · rw [Nat.mod_eq_of_lt hsmall]
  · have hsub : i - 11 < 11 := by omega
    have hiEq : i = (i - 11) + 11 := by omega
    have hmod : i % 11 = i - 11 := by omega
    calc
      exteriorTurn point i =
          exteriorTurn point ((i - 11) + 11) :=
        congrArg (exteriorTurn point) hiEq
      _ = exteriorTurn point (i - 11) :=
        exteriorTurn_add_period (n := 10) (i := i - 11) point
      _ = exteriorTurn point (i % 11) := by rw [hmod]

private theorem turnMask_sum_eq_arcTurnSum
    (point : Fin 11 → ℝ²) (start count : ℕ)
    (hcount : count ≤ 11) (hbound : start + count < 22) :
    ∑ i ∈
        (Finset.range count).image (fun k ↦
          (⟨(start + k) % 11, Nat.mod_lt _ (by omega)⟩ : Fin 11)),
        exteriorTurn point i.1 =
      ∑ k ∈ Finset.range count, exteriorTurn point (start + k) := by
  rw [Finset.sum_image]
  · apply Finset.sum_congr rfl
    intro k hk
    have hklt : k < count := Finset.mem_range.mp hk
    symm
    exact exteriorTurn_eq_mod_eleven point (by omega)
  · intro k hk l hl hkl
    have hklt : k < count := Finset.mem_range.mp hk
    have hllt : l < count := Finset.mem_range.mp hl
    have hmods : (start + k) % 11 = (start + l) % 11 :=
      congrArg Fin.val hkl
    omega

/-- Exterior-turn weight of one retained cyclic mask position. -/
noncomputable def turnWeight {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (i : Fin 11) : ℝ :=
  exteriorTurn Q.boundary i.1

/-- A retained arc's mask sum is exactly its open-window curvature. -/
theorem RetainedOuterArc.maskSum_eq_curvature {A : Finset ℝ²}
    (Q : P5CurvatureSource A) (arc : RetainedOuterArc) :
    ∑ i ∈ arc.turnMask Q, Q.turnWeight i =
      ShellCurvature.openWindowArcCurvature Q.indexing.chart
        (arc.start Q) (arc.finish Q) := by
  have hsum := turnMask_sum_eq_arcTurnSum Q.boundary
    (arc.start Q) (arc.turnCount Q) (arc.turnCount_le_eleven Q)
      (arc.start_add_turnCount_lt_twentyTwo Q)
  simp only [RetainedOuterArc.turnMask, turnWeight]
  rw [hsum]
  rw [← edgeLift_add_count_sub Q.boundary]
  change edgeLift Q.boundary (arc.start Q + arc.turnCount Q) -
      edgeLift Q.boundary (arc.start Q) =
    edgeLift Q.boundary (arc.finish Q - 1) -
      edgeLift Q.boundary (arc.start Q)
  simp only [RetainedOuterArc.finish]
  congr 2

/-- The eleven retained turn weights sum to the production full-turn budget. -/
theorem sum_turnWeight_eq_two_pi {A : Finset ℝ²}
    (Q : P5CurvatureSource A) :
    ∑ i : Fin 11, Q.turnWeight i = 2 * Real.pi := by
  have hfull := edgeLift_full_turn (n := 10) (by omega)
    Q.boundary_injective Q.boundary_ccw
  change (∑ i : Fin 11, exteriorTurn Q.boundary i.1) = 2 * Real.pi
  rw [Fin.sum_univ_eq_sum_range]
  dsimp [edgeLift] at hfull
  linarith

private theorem disjoint_union_left_of_pairwise
    {M₁ M₂ M₃ : Finset (Fin 11)}
    (h₁₃ : Disjoint M₁ M₃) (h₂₃ : Disjoint M₂ M₃) :
    Disjoint (M₁ ∪ M₂) M₃ := by
  rw [Finset.disjoint_left]
  intro i hi h₃
  rcases Finset.mem_union.mp hi with h₁ | h₂
  · exact (Finset.disjoint_left.mp h₁₃) h₁ h₃
  · exact (Finset.disjoint_left.mp h₂₃) h₂ h₃

/-- Four pairwise-disjoint retained outer-arc masks are impossible.

This is the generic source theorem validating every
`direct_no_four_turn_disjoint_outer_arcs` clause: each negative literal names
one `RetainedOuterArc`, and the encoder emits the clause exactly when the four
displayed masks are pairwise disjoint. -/
theorem false_of_four_pairwiseDisjoint_retainedOuterArcMasks
    {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (arc₁ arc₂ arc₃ arc₄ : RetainedOuterArc)
    (h₁₂ : Disjoint (arc₁.turnMask Q) (arc₂.turnMask Q))
    (h₁₃ : Disjoint (arc₁.turnMask Q) (arc₃.turnMask Q))
    (h₁₄ : Disjoint (arc₁.turnMask Q) (arc₄.turnMask Q))
    (h₂₃ : Disjoint (arc₂.turnMask Q) (arc₃.turnMask Q))
    (h₂₄ : Disjoint (arc₂.turnMask Q) (arc₄.turnMask Q))
    (h₃₄ : Disjoint (arc₃.turnMask Q) (arc₄.turnMask Q)) : False := by
  let M₁ := arc₁.turnMask Q
  let M₂ := arc₂.turnMask Q
  let M₃ := arc₃.turnMask Q
  let M₄ := arc₄.turnMask Q
  change Disjoint M₁ M₂ at h₁₂
  change Disjoint M₁ M₃ at h₁₃
  change Disjoint M₁ M₄ at h₁₄
  change Disjoint M₂ M₃ at h₂₃
  change Disjoint M₂ M₄ at h₂₄
  change Disjoint M₃ M₄ at h₃₄
  have h₁₂₃ : Disjoint (M₁ ∪ M₂) M₃ :=
    disjoint_union_left_of_pairwise h₁₃ h₂₃
  have h₁₂₃₄ : Disjoint ((M₁ ∪ M₂) ∪ M₃) M₄ := by
    apply disjoint_union_left_of_pairwise
    · exact disjoint_union_left_of_pairwise h₁₄ h₂₄
    · exact h₃₄
  have hsumUnion :
      ∑ i ∈ ((M₁ ∪ M₂) ∪ M₃) ∪ M₄, Q.turnWeight i =
        (∑ i ∈ M₁, Q.turnWeight i) +
          (∑ i ∈ M₂, Q.turnWeight i) +
          (∑ i ∈ M₃, Q.turnWeight i) +
          ∑ i ∈ M₄, Q.turnWeight i := by
    rw [Finset.sum_union h₁₂₃₄, Finset.sum_union h₁₂₃,
      Finset.sum_union h₁₂]
  have hnonneg (i : Fin 11) : 0 ≤ Q.turnWeight i :=
    (exteriorTurn_pos (n := 10) (by omega) Q.boundary_ccw i.1).le
  have hsumLe :
      ∑ i ∈ ((M₁ ∪ M₂) ∪ M₃) ∪ M₄, Q.turnWeight i ≤
        ∑ i : Fin 11, Q.turnWeight i := by
    apply Finset.sum_le_sum_of_subset_of_nonneg
    · exact Finset.subset_univ _
    · intro i _hi _hnot
      exact hnonneg i
  have h₁ := arc₁.quarterTurn Q
  have h₂ := arc₂.quarterTurn Q
  have h₃ := arc₃.quarterTurn Q
  have h₄ := arc₄.quarterTurn Q
  rw [← arc₁.maskSum_eq_curvature Q] at h₁
  rw [← arc₂.maskSum_eq_curvature Q] at h₂
  rw [← arc₃.maskSum_eq_curvature Q] at h₃
  rw [← arc₄.maskSum_eq_curvature Q] at h₄
  rw [hsumUnion, Q.sum_turnWeight_eq_two_pi] at hsumLe
  linarith

#print axioms image_selectedRowSupport
#print axioms selectedRowSupport_card
#print axioms RetainedOuterArc.maskSum_eq_curvature
#print axioms false_of_four_pairwiseDisjoint_retainedOuterArcMasks

end P5CurvatureSource
end ATailUniqueFourExactTwoCurvatureScratch
end Problem97
