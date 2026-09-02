/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555SourceConfiguration
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Finite configuration for the balanced `(5, 5, 5)` branch

This module states the exact finite contract used by the balanced exact-twelve
computation.  It keeps the two boundary orientations explicit, records only
source-proved cap and selected-class constraints, and retains the Euclidean
realization needed to justify each Kalmanson exclusion clause.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ExactFiveDistinctThreeCenterContinuation
open ExactFiveDistinctThreeCenterTightCover
open FirstApexUniqueRadiusResidual

namespace Balanced555Orientation

/-- The surplus Moser apex has the zero-cut label in both orientations. -/
def surplusApex (_orientation : Balanced555Orientation) : Fin 12 := 0

/-- The first named opposite apex in the chosen orientation. -/
def firstApex : Balanced555Orientation → Fin 12
  | .direct => 4
  | .mirror => 8

/-- The second named opposite apex in the chosen orientation. -/
def secondApex : Balanced555Orientation → Fin 12
  | .direct => 8
  | .mirror => 4

/-- The strict interior opposite the surplus apex. -/
def surplusInterior (_orientation : Balanced555Orientation) : Finset (Fin 12) :=
  {5, 6, 7}

/-- The strict interior opposite the first named apex. -/
def firstInterior : Balanced555Orientation → Finset (Fin 12)
  | .direct => {9, 10, 11}
  | .mirror => {1, 2, 3}

/-- The strict interior opposite the second named apex. -/
def secondInterior : Balanced555Orientation → Finset (Fin 12)
  | .direct => {1, 2, 3}
  | .mirror => {9, 10, 11}

/-- The three Moser apexes, indexed by surplus, first, and second. -/
def apex (orientation : Balanced555Orientation) : Fin 3 → Fin 12
  | 0 => orientation.surplusApex
  | 1 => orientation.firstApex
  | 2 => orientation.secondApex

/-- The three strict interiors, indexed by surplus, first, and second. -/
def strictInterior (orientation : Balanced555Orientation) : Fin 3 → Finset (Fin 12)
  | 0 => orientation.surplusInterior
  | 1 => orientation.firstInterior
  | 2 => orientation.secondInterior

/-- The closed five-point cap opposite an indexed Moser apex. -/
def closedCap (orientation : Balanced555Orientation) : Fin 3 → Finset (Fin 12)
  | 0 => insert orientation.firstApex
      (insert orientation.secondApex orientation.surplusInterior)
  | 1 => insert orientation.surplusApex
      (insert orientation.secondApex orientation.firstInterior)
  | 2 => insert orientation.surplusApex
      (insert orientation.firstApex orientation.secondInterior)

end Balanced555Orientation

/-- The exact finite data and source-entitled constraints for the balanced
exact-twelve branch. -/
structure Balanced555FiniteConfiguration where
  orientation : Balanced555Orientation
  selectedAt : RowPattern (Fin 12)
  carrier : Finset ℝ²
  carrier_convex : ConvexIndep carrier
  pointOf : Fin 12 → ℝ²
  pointOf_image : Finset.univ.image pointOf = carrier
  pointOf_ccw : EuclideanGeometry.IsCcwConvexPolygon pointOf
  realizes : Realizes selectedAt pointOf
  sourceCube : SourceCubeOK selectedAt
  deleted : Fin 12
  retained : Fin 12
  third : Fin 12
  middle : Fin 12
  firstInterior_roles :
    ({deleted, retained, third} : Finset (Fin 12)) = orientation.firstInterior
  middle_ne_firstApex : middle ≠ orientation.firstApex
  middle_ne_secondApex : middle ≠ orientation.secondApex
  cap_inter_card_le_two :
    ∀ (capIndex : Fin 3) (center : Fin 12),
      center ∈ orientation.closedCap capIndex →
      (selectedAt center ∩ orientation.closedCap capIndex).card ≤ 2
  apex_interior_card_ge_two :
    ∀ apexIndex : Fin 3,
      2 ≤ (selectedAt (orientation.apex apexIndex) ∩
        orientation.strictInterior apexIndex).card
  apex_adjacent_cap_card_le_one :
    ∀ (apexIndex capIndex : Fin 3), apexIndex ≠ capIndex →
      (selectedAt (orientation.apex apexIndex) ∩
        orientation.closedCap capIndex).card ≤ 1
  deleted_not_mem_threeClasses :
    deleted ∉
      (selectedAt orientation.firstApex ∪ selectedAt middle) ∪
        selectedAt orientation.secondApex
  retained_mem_first : retained ∈ selectedAt orientation.firstApex
  retained_mem_middle : retained ∈ selectedAt middle
  retained_not_mem_second : retained ∉ selectedAt orientation.secondApex
  third_mem_first : third ∈ selectedAt orientation.firstApex
  first_inter_middle_eq_retained :
    selectedAt orientation.firstApex ∩ selectedAt middle = {retained}
  first_disjoint_second :
    Disjoint (selectedAt orientation.firstApex) (selectedAt orientation.secondApex)
  middle_disjoint_second :
    Disjoint (selectedAt middle) (selectedAt orientation.secondApex)
  threeClasses_cover :
    (selectedAt orientation.firstApex ∪ selectedAt middle) ∪
        selectedAt orientation.secondApex =
      Finset.univ.erase deleted
  sharedPairAlternating :
    ∀ {firstCenter secondCenter firstPoint secondPoint : Fin 12},
      firstCenter ≠ secondCenter →
      firstPoint ≠ secondPoint →
      firstPoint ∈ selectedAt firstCenter →
      secondPoint ∈ selectedAt firstCenter →
      firstPoint ∈ selectedAt secondCenter →
      secondPoint ∈ selectedAt secondCenter →
      (SurplusCOMPGBank.btw firstCenter secondCenter firstPoint ↔
        ¬ SurplusCOMPGBank.btw firstCenter secondCenter secondPoint)

private theorem orientation_apex_zero (orientation : Balanced555Orientation) :
    orientation.apex 0 = orientation.surplusApex := by
  cases orientation <;> rfl

private theorem orientation_apex_two (orientation : Balanced555Orientation) :
    orientation.apex 2 = orientation.secondApex := by
  cases orientation <;> rfl

private theorem orientation_strictInterior_one (orientation : Balanced555Orientation) :
    orientation.strictInterior 1 = orientation.firstInterior := by
  cases orientation <;> rfl

private def sourceCapIndex {A : Finset ℝ²} (S : SurplusCapPacket A) : Fin 3 → Fin 3
  | 0 => S.surplusIdx
  | 1 => S.oppIndex1
  | 2 => S.oppIndex2

private theorem sourceCapIndex_injective {A : Finset ℝ²} (S : SurplusCapPacket A) :
    Function.Injective (sourceCapIndex S) := by
  intro i j hij
  fin_cases i <;> fin_cases j
  · rfl
  · exact (S.surplusIdx_ne_oppIndex1 hij).elim
  · exact (S.surplusIdx_ne_oppIndex2 hij).elim
  · exact (S.surplusIdx_ne_oppIndex1 hij.symm).elim
  · rfl
  · exact (S.oppIndex1_ne_oppIndex2 hij).elim
  · exact (S.surplusIdx_ne_oppIndex2 hij.symm).elim
  · exact (S.oppIndex1_ne_oppIndex2 hij.symm).elim
  · rfl

private theorem capByIndex_eq_insert_outer_vertices {A : Finset ℝ²}
    (S : SurplusCapPacket A) (i : Fin 3) :
    S.capByIndex i =
      insert (S.triangleByIndex i).v2
        (insert (S.triangleByIndex i).v3 (S.capInteriorByIndex i)) := by
  fin_cases i
  · change S.partition.C1 =
      insert S.triangle.v2
        (insert S.triangle.v3
          ((S.partition.C1.erase S.triangle.v2).erase S.triangle.v3))
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    rw [Finset.insert_erase hv3, Finset.insert_erase S.partition.v2_mem_C1]
  · change S.partition.C2 =
      insert S.triangle.v3
        (insert S.triangle.v1
          ((S.partition.C2.erase S.triangle.v3).erase S.triangle.v1))
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    rw [Finset.insert_erase hv1, Finset.insert_erase S.partition.v3_mem_C2]
  · change S.partition.C3 =
      insert S.triangle.v1
        (insert S.triangle.v2
          ((S.partition.C3.erase S.triangle.v1).erase S.triangle.v2))
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    rw [Finset.insert_erase hv2, Finset.insert_erase S.partition.v1_mem_C3]

private theorem labelsOf_insert_of_mem {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Fin 12) {point : ℝ²} (hpoint : point ∈ A)
    (T : Finset ℝ²) :
    labelsOf e (insert point T) = insert (e ⟨point, hpoint⟩) (labelsOf e T) := by
  ext label
  simp only [mem_labelsOf_iff, Finset.mem_insert]
  constructor
  · rintro (h | h)
    · left
      apply e.symm.injective
      rw [e.symm_apply_apply]
      exact Subtype.ext h
    · exact Or.inr h
  · rintro (h | h)
    · left
      subst label
      simp
    · exact Or.inr h

private theorem labelsOf_union {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Fin 12) (U V : Finset ℝ²) :
    labelsOf e (U ∪ V) = labelsOf e U ∪ labelsOf e V := by
  ext label
  simp only [mem_labelsOf_iff, Finset.mem_union]

private theorem labelsOf_inter {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Fin 12) (U V : Finset ℝ²) :
    labelsOf e (U ∩ V) = labelsOf e U ∩ labelsOf e V := by
  ext label
  simp only [mem_labelsOf_iff, Finset.mem_inter]

private theorem labelsOf_singleton_of_mem {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Fin 12) {point : ℝ²} (hpoint : point ∈ A) :
    labelsOf e {point} = {e ⟨point, hpoint⟩} := by
  simpa [labelsOf] using labelsOf_insert_of_mem e hpoint (∅ : Finset ℝ²)

private theorem labelsOf_erase_of_mem {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Fin 12) {point : ℝ²} (hpoint : point ∈ A)
    (T : Finset ℝ²) :
    labelsOf e (T.erase point) = (labelsOf e T).erase (e ⟨point, hpoint⟩) := by
  ext label
  simp only [mem_labelsOf_iff, Finset.mem_erase]
  constructor
  · rintro ⟨hne, hmem⟩
    refine ⟨?_, hmem⟩
    intro hlabel
    apply hne
    subst label
    simp
  · rintro ⟨hne, hmem⟩
    refine ⟨?_, hmem⟩
    intro hsource
    apply hne
    apply e.symm.injective
    rw [e.symm_apply_apply]
    exact Subtype.ext hsource

private theorem labelsOf_carrier {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Fin 12) : labelsOf e A = Finset.univ := by
  ext label
  simp only [mem_labelsOf_iff, Finset.mem_univ, iff_true]
  exact (e.symm label).2

private theorem labelsOf_disjoint {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Fin 12) {U V : Finset ℝ²}
    (hdisjoint : Disjoint U V) : Disjoint (labelsOf e U) (labelsOf e V) := by
  rw [Finset.disjoint_left] at hdisjoint ⊢
  intro label hU hV
  exact hdisjoint (mem_labelsOf_iff e U label |>.mp hU)
    (mem_labelsOf_iff e V label |>.mp hV)

private theorem surplusApex_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex = S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem Balanced555BoundaryLabeling.firstApex_label_eq_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (L : Balanced555BoundaryLabeling R C N I) (hfirst : S.oppApex1 ∈ D.A) :
    L.labels ⟨S.oppApex1, hfirst⟩ = L.orientation.firstApex := by
  rcases L with ⟨orientation, labels, hinjective, himage, hccw,
    hsurplus, hfirstLabel, hsecondLabel, hsecondInterior,
    hsurplusInterior, hfirstInterior⟩
  cases orientation <;> exact hfirstLabel hfirst

private theorem Balanced555BoundaryLabeling.secondApex_label_eq_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (L : Balanced555BoundaryLabeling R C N I) (hsecond : S.oppApex2 ∈ D.A) :
    L.labels ⟨S.oppApex2, hsecond⟩ = L.orientation.secondApex := by
  rcases L with ⟨orientation, labels, hinjective, himage, hccw,
    hsurplus, hfirstLabel, hsecondLabel, hsecondInterior,
    hsurplusInterior, hfirstInterior⟩
  cases orientation <;> exact hsecondLabel hsecond

private theorem Balanced555BoundaryLabeling.firstInterior_labels_eq_firstInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (L : Balanced555BoundaryLabeling R C N I) :
    labelsOf L.labels (S.capInteriorByIndex S.oppIndex1) =
      L.orientation.firstInterior := by
  rcases L with ⟨orientation, labels, hinjective, himage, hccw,
    hsurplus, hfirstLabel, hsecondLabel, hsecondInterior,
    hsurplusInterior, hfirstInterior⟩
  cases orientation <;> exact hfirstInterior

private theorem Balanced555BoundaryLabeling.secondInterior_labels_eq_secondInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (L : Balanced555BoundaryLabeling R C N I) :
    labelsOf L.labels (S.capInteriorByIndex S.oppIndex2) =
      L.orientation.secondInterior := by
  rcases L with ⟨orientation, labels, hinjective, himage, hccw,
    hsurplus, hfirstLabel, hsecondLabel, hsecondInterior,
    hsurplusInterior, hfirstInterior⟩
  cases orientation <;> exact hsecondInterior

private theorem boundary_apex_label
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) (i : Fin 3) :
    Q.boundary.labels
        ⟨S.oppositeVertexByIndex (sourceCapIndex S i),
          S.oppositeVertexByIndex_mem (sourceCapIndex S i)⟩ =
      Q.boundary.orientation.apex i := by
  fin_cases i
  all_goals simp only [sourceCapIndex, Balanced555Orientation.apex]
  · have hsurplusMem : S.surplusApex ∈ D.A := by
      rw [surplusApex_eq_oppositeVertexByIndex_surplusIdx S]
      exact S.oppositeVertexByIndex_mem S.surplusIdx
    calc
      Q.boundary.labels
          ⟨S.oppositeVertexByIndex S.surplusIdx,
            S.oppositeVertexByIndex_mem S.surplusIdx⟩ =
          Q.boundary.labels ⟨S.surplusApex, hsurplusMem⟩ := by
        apply congrArg Q.boundary.labels
        exact Subtype.ext
          (surplusApex_eq_oppositeVertexByIndex_surplusIdx S).symm
      _ = 0 := Q.boundary.surplusApex_label hsurplusMem
  · have hfirstMem : S.oppApex1 ∈ D.A := by
      rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
      exact S.oppositeVertexByIndex_mem S.oppIndex1
    calc
      Q.boundary.labels
          ⟨S.oppositeVertexByIndex S.oppIndex1,
            S.oppositeVertexByIndex_mem S.oppIndex1⟩ =
          Q.boundary.labels ⟨S.oppApex1, hfirstMem⟩ := by
        apply congrArg Q.boundary.labels
        exact Subtype.ext
          (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
      _ = Q.boundary.orientation.firstApex :=
        Q.boundary.firstApex_label_eq_firstApex hfirstMem
  · have hsecondMem : S.oppApex2 ∈ D.A := by
      rw [oppApex2_eq_oppositeVertexByIndex_oppIndex2 S]
      exact S.oppositeVertexByIndex_mem S.oppIndex2
    calc
      Q.boundary.labels
          ⟨S.oppositeVertexByIndex S.oppIndex2,
            S.oppositeVertexByIndex_mem S.oppIndex2⟩ =
          Q.boundary.labels ⟨S.oppApex2, hsecondMem⟩ := by
        apply congrArg Q.boundary.labels
        exact Subtype.ext
          (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
      _ = Q.boundary.orientation.secondApex :=
        Q.boundary.secondApex_label_eq_secondApex hsecondMem

private theorem boundary_strictInterior_labels
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) (i : Fin 3) :
    labelsOf Q.boundary.labels
        (S.capInteriorByIndex (sourceCapIndex S i)) =
      Q.boundary.orientation.strictInterior i := by
  fin_cases i
  all_goals simp only [sourceCapIndex, Balanced555Orientation.strictInterior]
  · change labelsOf Q.boundary.labels
      (S.capInteriorByIndex S.surplusIdx) = {5, 6, 7}
    exact Q.boundary.surplusInterior_labels
  · change labelsOf Q.boundary.labels
      (S.capInteriorByIndex S.oppIndex1) =
        match Q.boundary.orientation with
        | .direct => {9, 10, 11}
        | .mirror => {1, 2, 3}
    exact Q.boundary.firstInterior_labels_eq_firstInterior
  · change labelsOf Q.boundary.labels
      (S.capInteriorByIndex S.oppIndex2) =
        match Q.boundary.orientation with
        | .direct => {1, 2, 3}
        | .mirror => {9, 10, 11}
    exact Q.boundary.secondInterior_labels_eq_secondInterior

private theorem boundary_closedCap_labels
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (Q : Balanced555SourceConfiguration R C N I) (i : Fin 3) :
    labelsOf Q.boundary.labels (S.capByIndex (sourceCapIndex S i)) =
      Q.boundary.orientation.closedCap i := by
  rw [capByIndex_eq_insert_outer_vertices]
  rw [labelsOf_insert_of_mem Q.boundary.labels
    (S.triangleByIndex (sourceCapIndex S i)).v2_mem]
  rw [labelsOf_insert_of_mem Q.boundary.labels
    (S.triangleByIndex (sourceCapIndex S i)).v3_mem]
  fin_cases i
  all_goals simp only [sourceCapIndex, Balanced555Orientation.closedCap]
  · have houter1 :
        Q.boundary.labels
            ⟨(S.triangleByIndex S.surplusIdx).v2,
              (S.triangleByIndex S.surplusIdx).v2_mem⟩ =
          Q.boundary.orientation.apex 1 := by
      calc
        Q.boundary.labels
            ⟨(S.triangleByIndex S.surplusIdx).v2,
              (S.triangleByIndex S.surplusIdx).v2_mem⟩ =
            Q.boundary.labels
              ⟨S.oppositeVertexByIndex S.oppIndex1,
                S.oppositeVertexByIndex_mem S.oppIndex1⟩ := by
          apply congrArg Q.boundary.labels
          exact Subtype.ext
            S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1
        _ = Q.boundary.orientation.apex 1 := boundary_apex_label Q 1
    have houter2 :
        Q.boundary.labels
            ⟨(S.triangleByIndex S.surplusIdx).v3,
              (S.triangleByIndex S.surplusIdx).v3_mem⟩ =
          Q.boundary.orientation.apex 2 := by
      calc
        Q.boundary.labels
            ⟨(S.triangleByIndex S.surplusIdx).v3,
              (S.triangleByIndex S.surplusIdx).v3_mem⟩ =
            Q.boundary.labels
              ⟨S.oppositeVertexByIndex S.oppIndex2,
                S.oppositeVertexByIndex_mem S.oppIndex2⟩ := by
          apply congrArg Q.boundary.labels
          exact Subtype.ext
            S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2
        _ = Q.boundary.orientation.apex 2 := boundary_apex_label Q 2
    have hinter := boundary_strictInterior_labels Q 0
    change labelsOf Q.boundary.labels (S.capInteriorByIndex S.surplusIdx) =
      Q.boundary.orientation.strictInterior 0 at hinter
    rw [houter1, houter2, hinter]
    rfl
  · have houter2 :
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex1).v2,
              (S.triangleByIndex S.oppIndex1).v2_mem⟩ =
          Q.boundary.orientation.apex 2 := by
      calc
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex1).v2,
              (S.triangleByIndex S.oppIndex1).v2_mem⟩ =
            Q.boundary.labels
              ⟨S.oppositeVertexByIndex S.oppIndex2,
                S.oppositeVertexByIndex_mem S.oppIndex2⟩ := by
          apply congrArg Q.boundary.labels
          exact Subtype.ext
            S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2
        _ = Q.boundary.orientation.apex 2 := boundary_apex_label Q 2
    have houter0 :
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex1).v3,
              (S.triangleByIndex S.oppIndex1).v3_mem⟩ =
          Q.boundary.orientation.apex 0 := by
      calc
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex1).v3,
              (S.triangleByIndex S.oppIndex1).v3_mem⟩ =
            Q.boundary.labels
              ⟨S.oppositeVertexByIndex S.surplusIdx,
                S.oppositeVertexByIndex_mem S.surplusIdx⟩ := by
          apply congrArg Q.boundary.labels
          exact Subtype.ext
            S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx
        _ = Q.boundary.orientation.apex 0 := boundary_apex_label Q 0
    have hinter := boundary_strictInterior_labels Q 1
    change labelsOf Q.boundary.labels (S.capInteriorByIndex S.oppIndex1) =
      Q.boundary.orientation.strictInterior 1 at hinter
    rw [houter2, houter0, hinter]
    rw [orientation_apex_two, orientation_apex_zero,
      orientation_strictInterior_one]
    rw [Finset.insert_comm]
  · have houter0 :
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex2).v2,
              (S.triangleByIndex S.oppIndex2).v2_mem⟩ =
          Q.boundary.orientation.apex 0 := by
      calc
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex2).v2,
              (S.triangleByIndex S.oppIndex2).v2_mem⟩ =
            Q.boundary.labels
              ⟨S.oppositeVertexByIndex S.surplusIdx,
                S.oppositeVertexByIndex_mem S.surplusIdx⟩ := by
          apply congrArg Q.boundary.labels
          exact Subtype.ext
            S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx
        _ = Q.boundary.orientation.apex 0 := boundary_apex_label Q 0
    have houter1 :
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex2).v3,
              (S.triangleByIndex S.oppIndex2).v3_mem⟩ =
          Q.boundary.orientation.apex 1 := by
      calc
        Q.boundary.labels
            ⟨(S.triangleByIndex S.oppIndex2).v3,
              (S.triangleByIndex S.oppIndex2).v3_mem⟩ =
            Q.boundary.labels
              ⟨S.oppositeVertexByIndex S.oppIndex1,
                S.oppositeVertexByIndex_mem S.oppIndex1⟩ := by
          apply congrArg Q.boundary.labels
          exact Subtype.ext
            S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1
        _ = Q.boundary.orientation.apex 1 := boundary_apex_label Q 1
    have hinter := boundary_strictInterior_labels Q 2
    change labelsOf Q.boundary.labels (S.capInteriorByIndex S.oppIndex2) =
      Q.boundary.orientation.strictInterior 2 at hinter
    rw [houter0, houter1, hinter]
    rfl

private theorem selectedFourClass_capInteriorByIndex_card_ge_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center = S.oppositeVertexByIndex i) :
    2 ≤ (K.support ∩ S.capInteriorByIndex i).card := by
  classical
  have support_mem_selectedClass {point : ℝ²} (hpoint : point ∈ K.support) :
      point ∈ SelectedClass A (S.oppositeVertexByIndex i) K.radius := by
    apply mem_selectedClass.mpr
    refine ⟨K.support_subset_A hpoint, ?_⟩
    rw [← hcenter]
    exact K.support_eq_radius point hpoint
  have hleft :
      (K.support ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    apply (Finset.card_le_card ?_).trans
      (S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i K.radius)
    intro point hpoint
    exact Finset.mem_inter.mpr
      ⟨support_mem_selectedClass (Finset.mem_inter.mp hpoint).1,
        (Finset.mem_inter.mp hpoint).2⟩
  have hright :
      (K.support ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    apply (Finset.card_le_card ?_).trans
      (S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i K.radius)
    intro point hpoint
    exact Finset.mem_inter.mpr
      ⟨support_mem_selectedClass (Finset.mem_inter.mp hpoint).1,
        (Finset.mem_inter.mp hpoint).2⟩
  have hcover :
      K.support \ S.capInteriorByIndex i ⊆
        (K.support ∩ S.leftAdjacentCapByIndex i) ∪
          (K.support ∩ S.rightAdjacentCapByIndex i) := by
    intro point hpoint
    have hselectedDiff :
        point ∈ SelectedClass A (S.oppositeVertexByIndex i) K.radius \
          S.capInteriorByIndex i :=
      Finset.mem_sdiff.mpr
        ⟨support_mem_selectedClass (Finset.mem_sdiff.mp hpoint).1,
          (Finset.mem_sdiff.mp hpoint).2⟩
    have hadjacent :=
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i
        K.radius_pos hselectedDiff
    rcases Finset.mem_union.mp hadjacent with hleftPoint | hrightPoint
    · exact Finset.mem_union_left _ <| Finset.mem_inter.mpr
        ⟨(Finset.mem_sdiff.mp hpoint).1, (Finset.mem_inter.mp hleftPoint).2⟩
    · exact Finset.mem_union_right _ <| Finset.mem_inter.mpr
        ⟨(Finset.mem_sdiff.mp hpoint).1, (Finset.mem_inter.mp hrightPoint).2⟩
  have houtside : (K.support \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (K.support \ S.capInteriorByIndex i).card ≤
          ((K.support ∩ S.leftAdjacentCapByIndex i) ∪
            (K.support ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (K.support ∩ S.leftAdjacentCapByIndex i).card +
            (K.support ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := Nat.add_le_add hleft hright
      _ = 2 := by norm_num
  have hsplit :=
    Finset.card_sdiff_add_card_inter K.support (S.capInteriorByIndex i)
  rw [K.support_card] at hsplit
  omega

private theorem selectedFourClass_inter_capByIndex_card_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    {center : ℝ²} (K : SelectedFourClass A center) {i j : Fin 3}
    (hji : j ≠ i) (hcenter : center = S.oppositeVertexByIndex i) :
    (K.support ∩ S.capByIndex j).card ≤ 1 := by
  have hsub :
      K.support ∩ S.capByIndex j ⊆
        SelectedClass A (S.oppositeVertexByIndex i) K.radius ∩
          S.capByIndex j := by
    intro point hpoint
    rw [Finset.mem_inter] at hpoint ⊢
    refine ⟨?_, hpoint.2⟩
    rw [mem_selectedClass]
    refine ⟨K.support_subset_A hpoint.1, ?_⟩
    rw [← hcenter]
    exact K.support_eq_radius point hpoint.1
  have hbound :
      (SelectedClass A (S.oppositeVertexByIndex i) K.radius ∩
        S.capByIndex j).card ≤ 1 := by
    fin_cases i <;> fin_cases j
    · exact (hji rfl).elim
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 0 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 0 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 1 K.radius
    · exact (hji rfl).elim
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 1 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 2 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 2 K.radius
    · exact (hji rfl).elim
  exact (Finset.card_le_card hsub).trans hbound

/-- Every source-faithful balanced exact-twelve configuration induces the
finite configuration consumed by the checked search. -/
theorem nonempty_balanced555FiniteConfiguration
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (I : BalancedTightCoverInvariant R C N)
    (Q : Balanced555SourceConfiguration R C N I) :
    Nonempty Balanced555FiniteConfiguration := by
  classical
  have hfirstApexMem : S.oppApex1 ∈ D.A := by
    rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
    exact S.oppositeVertexByIndex_mem S.oppIndex1
  have hsecondApexMem : S.oppApex2 ∈ D.A :=
    N.freshThreeCenter.center₂_mem_A
  have hthirdMem : I.firstInteriorThird ∈ D.A :=
    N.firstApexClass.support_subset_A
      (Finset.mem_erase.mp I.firstInteriorThird_mem).2
  let deletedLabel : Fin 12 := Q.boundary.labels ⟨deleted, C.q_mem_A⟩
  let retainedLabel : Fin 12 :=
    Q.boundary.labels ⟨N.retained, N.retained_mem_A⟩
  let thirdLabel : Fin 12 :=
    Q.boundary.labels ⟨I.firstInteriorThird, hthirdMem⟩
  let middleLabel : Fin 12 :=
    Q.boundary.labels ⟨blocker, N.freshThreeCenter.center₁_mem_A⟩
  have hfirstApexLabel :
      Q.boundary.labels ⟨S.oppApex1, hfirstApexMem⟩ =
        Q.boundary.orientation.firstApex := by
    calc
      Q.boundary.labels ⟨S.oppApex1, hfirstApexMem⟩ =
          Q.boundary.labels
            ⟨S.oppositeVertexByIndex S.oppIndex1,
              S.oppositeVertexByIndex_mem S.oppIndex1⟩ := by
        apply congrArg Q.boundary.labels
        exact Subtype.ext
          (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S)
      _ = Q.boundary.orientation.apex 1 := boundary_apex_label Q 1
      _ = Q.boundary.orientation.firstApex := rfl
  have hsecondApexLabel :
      Q.boundary.labels ⟨S.oppApex2, hsecondApexMem⟩ =
        Q.boundary.orientation.secondApex := by
    calc
      Q.boundary.labels ⟨S.oppApex2, hsecondApexMem⟩ =
          Q.boundary.labels
            ⟨S.oppositeVertexByIndex S.oppIndex2,
              S.oppositeVertexByIndex_mem S.oppIndex2⟩ := by
        apply congrArg Q.boundary.labels
        exact Subtype.ext
          (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S)
      _ = Q.boundary.orientation.apex 2 := boundary_apex_label Q 2
      _ = Q.boundary.orientation.secondApex := rfl
  have hfirstRow :
      Q.selectedAt Q.boundary.orientation.firstApex =
        labelsOf Q.boundary.labels N.firstApexClass.support := by
    rw [← hfirstApexLabel]
    exact Q.selectedAt_firstApex_eq
  have hmiddleRow :
      Q.selectedAt middleLabel =
        labelsOf Q.boundary.labels N.blockerClass.support := by
    simpa [middleLabel] using Q.selectedAt_blocker_eq
  have hsecondRow :
      Q.selectedAt Q.boundary.orientation.secondApex =
        labelsOf Q.boundary.labels N.secondApexClass.support := by
    rw [← hsecondApexLabel]
    exact Q.selectedAt_secondApex_eq
  have hfirstInteriorRoles :
      ({deletedLabel, retainedLabel, thirdLabel} : Finset (Fin 12)) =
        Q.boundary.orientation.firstInterior := by
    have hboundary := boundary_strictInterior_labels Q 1
    change labelsOf Q.boundary.labels
      (S.capInteriorByIndex S.oppIndex1) =
        Q.boundary.orientation.firstInterior at hboundary
    rw [← hboundary, I.firstInterior_eq]
    rw [labelsOf_insert_of_mem Q.boundary.labels C.q_mem_A]
    rw [labelsOf_insert_of_mem Q.boundary.labels N.retained_mem_A]
    rw [labelsOf_singleton_of_mem Q.boundary.labels hthirdMem]
  have hmiddleNeFirst :
      middleLabel ≠ Q.boundary.orientation.firstApex := by
    rw [← hfirstApexLabel]
    intro hlabels
    have hsources := Q.boundary.labels.injective hlabels
    exact N.freshThreeCenter.center₀_ne_center₁
      (congrArg (fun source : CarrierLabel D.A ↦ source.1) hsources).symm
  have hmiddleNeSecond :
      middleLabel ≠ Q.boundary.orientation.secondApex := by
    rw [← hsecondApexLabel]
    intro hlabels
    have hsources := Q.boundary.labels.injective hlabels
    exact N.freshThreeCenter.center₁_ne_center₂
      (congrArg (fun source : CarrierLabel D.A ↦ source.1) hsources)
  refine ⟨{
    orientation := Q.boundary.orientation
    selectedAt := Q.selectedAt
    carrier := D.A
    carrier_convex := D.convex
    pointOf := Q.boundary.pointOf
    pointOf_image := Q.boundary.pointOf_image
    pointOf_ccw := Q.boundary.pointOf_ccw
    realizes := Q.realizes_selectedAt
    sourceCube := Q.sourceCubeOK_selectedAt
    deleted := deletedLabel
    retained := retainedLabel
    third := thirdLabel
    middle := middleLabel
    firstInterior_roles := hfirstInteriorRoles
    middle_ne_firstApex := hmiddleNeFirst
    middle_ne_secondApex := hmiddleNeSecond
    cap_inter_card_le_two := ?_
    apex_interior_card_ge_two := ?_
    apex_adjacent_cap_card_le_one := ?_
    deleted_not_mem_threeClasses := ?_
    retained_mem_first := ?_
    retained_mem_middle := ?_
    retained_not_mem_second := ?_
    third_mem_first := ?_
    first_inter_middle_eq_retained := ?_
    first_disjoint_second := ?_
    middle_disjoint_second := ?_
    threeClasses_cover := ?_
    sharedPairAlternating := Q.sharedPairAlternating_selectedAt }⟩
  · intro capIndex center hcenter
    have hsourceCenter :
        (Q.boundary.labels.symm center).1 ∈
          S.capByIndex (sourceCapIndex S capIndex) := by
      apply (mem_labelsOf_iff Q.boundary.labels
        (S.capByIndex (sourceCapIndex S capIndex)) center).mp
      simpa only [boundary_closedCap_labels Q capIndex] using hcenter
    change (labeledRowPattern Q.carrierPattern Q.boundary.labels center ∩
      Q.boundary.orientation.closedCap capIndex).card ≤ 2
    rw [← boundary_closedCap_labels Q capIndex,
      labeledRowPattern_inter_labelsOf_card_eq]
    exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex (sourceCapIndex S capIndex)
        (Q.carrierPattern.classAt
          (Q.boundary.labels.symm center).1
          (Q.boundary.labels.symm center).2) hsourceCenter
  · intro apexIndex
    change 2 ≤
      (labeledRowPattern Q.carrierPattern Q.boundary.labels
          (Q.boundary.orientation.apex apexIndex) ∩
        Q.boundary.orientation.strictInterior apexIndex).card
    rw [← boundary_apex_label Q apexIndex,
      ← boundary_strictInterior_labels Q apexIndex,
      labeledRowPattern_inter_labelsOf_card_eq]
    rw [Q.boundary.labels.symm_apply_apply]
    simpa using selectedFourClass_capInteriorByIndex_card_ge_two
      S D.convex (sourceCapIndex S apexIndex)
        (Q.carrierPattern.classAt
          (S.oppositeVertexByIndex (sourceCapIndex S apexIndex))
          (S.oppositeVertexByIndex_mem (sourceCapIndex S apexIndex))) rfl
  · intro apexIndex capIndex hne
    have hsourceNe :
        sourceCapIndex S capIndex ≠ sourceCapIndex S apexIndex := by
      intro hsources
      exact hne ((sourceCapIndex_injective S hsources).symm)
    change
      (labeledRowPattern Q.carrierPattern Q.boundary.labels
          (Q.boundary.orientation.apex apexIndex) ∩
        Q.boundary.orientation.closedCap capIndex).card ≤ 1
    rw [← boundary_apex_label Q apexIndex,
      ← boundary_closedCap_labels Q capIndex,
      labeledRowPattern_inter_labelsOf_card_eq]
    rw [Q.boundary.labels.symm_apply_apply]
    simpa using selectedFourClass_inter_capByIndex_card_le_one
      S D.convex
        (Q.carrierPattern.classAt
          (S.oppositeVertexByIndex (sourceCapIndex S apexIndex))
          (S.oppositeVertexByIndex_mem (sourceCapIndex S apexIndex)))
        hsourceNe rfl
  · rw [hfirstRow, hmiddleRow, hsecondRow]
    have hdeleted :
        deleted ∉
          (N.firstApexClass.support ∪ N.blockerClass.support) ∪
            N.secondApexClass.support := by
      rw [← I.carrier_erase_deleted_eq_union]
      simp
    simpa [deletedLabel] using hdeleted
  · rw [hfirstRow]
    simpa [retainedLabel] using N.retained_mem_firstApexClass
  · rw [hmiddleRow]
    simpa [retainedLabel] using N.retained_mem_blockerClass
  · rw [hsecondRow]
    simpa [retainedLabel] using I.retained_not_mem_second
  · rw [hfirstRow]
    simpa [thirdLabel] using (Finset.mem_erase.mp I.firstInteriorThird_mem).2
  · rw [hfirstRow, hmiddleRow, ← labelsOf_inter,
      I.support_intersections.1,
      labelsOf_singleton_of_mem Q.boundary.labels N.retained_mem_A]
  · rw [hfirstRow, hsecondRow]
    exact labelsOf_disjoint Q.boundary.labels I.support_intersections.2.1
  · rw [hmiddleRow, hsecondRow]
    exact labelsOf_disjoint Q.boundary.labels I.support_intersections.2.2
  · rw [hfirstRow, hmiddleRow, hsecondRow,
      ← labelsOf_union, ← labelsOf_union,
      ← I.carrier_erase_deleted_eq_union,
      labelsOf_erase_of_mem Q.boundary.labels C.q_mem_A D.A,
      labelsOf_carrier]
end ATailFrontierLiveClosure
end Problem97
