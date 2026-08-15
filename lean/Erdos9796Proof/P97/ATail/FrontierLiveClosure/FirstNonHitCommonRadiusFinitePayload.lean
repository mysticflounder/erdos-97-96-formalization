/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment

/-!
# Independent finite payload for the common-radius FreshThird ingress

The common-radius producer returns a new two-source surface.  This module
reindexes that surface independently of the named canonical surface `C`; no
surface-identification bridge is assumed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open Census554.GeneralCarrierBridge

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)

/-- The finite payload of an independent common-radius source surface.

The two indices are not named roles of `C`.  The witness constructor ties them
to the producer's independent surface; the exported payload retains only
finite relations over the complete carrier `A`. -/
structure FirstNonHitFiniteCommonRadiusPayload where
  commonSourceOne : Fin A.boundary.n
  commonSourceTwo : Fin A.boundary.n
  commonSource_ne : commonSourceOne ≠ commonSourceTwo
  commonSourceOne_firstCapInterior :
    A.inCapInterior commonSourceOne S.oppIndex1 = true
  commonSourceTwo_firstCapInterior :
    A.inCapInterior commonSourceTwo S.oppIndex1 = true
  commonSourceOne_ne_firstRetainedSourceOne :
    commonSourceOne ≠ A.roleIndex .firstRetainedSourceOne
  commonSourceOne_ne_firstRetainedSourceTwo :
    commonSourceOne ≠ A.roleIndex .firstRetainedSourceTwo
  commonSourceOne_ne_secondRetainedSourceOne :
    commonSourceOne ≠ A.roleIndex .secondRetainedSourceOne
  commonSourceOne_ne_secondRetainedSourceTwo :
    commonSourceOne ≠ A.roleIndex .secondRetainedSourceTwo
  commonSourceTwo_ne_firstRetainedSourceOne :
    commonSourceTwo ≠ A.roleIndex .firstRetainedSourceOne
  commonSourceTwo_ne_firstRetainedSourceTwo :
    commonSourceTwo ≠ A.roleIndex .firstRetainedSourceTwo
  commonSourceTwo_ne_secondRetainedSourceOne :
    commonSourceTwo ≠ A.roleIndex .secondRetainedSourceOne
  commonSourceTwo_ne_secondRetainedSourceTwo :
    commonSourceTwo ≠ A.roleIndex .secondRetainedSourceTwo
  commonSourceOne_blocker_ne_first :
    A.blockerMap commonSourceOne ≠ A.blockerMap (A.roleIndex .firstRetainedSourceOne)
  commonSourceOne_blocker_ne_second :
    A.blockerMap commonSourceOne ≠ A.blockerMap (A.roleIndex .secondRetainedSourceOne)
  commonSourceTwo_blocker_ne_first :
    A.blockerMap commonSourceTwo ≠ A.blockerMap (A.roleIndex .firstRetainedSourceOne)
  commonSourceTwo_blocker_ne_second :
    A.blockerMap commonSourceTwo ≠ A.blockerMap (A.roleIndex .secondRetainedSourceOne)
  commonSourceOne_blocker_ne_firstApex_point :
    A.boundary.boundary (A.blockerMap commonSourceOne) ≠ S.oppApex1
  commonSourceOne_blocker_ne_secondApex_point :
    A.boundary.boundary (A.blockerMap commonSourceOne) ≠ S.oppApex2
  commonSourceTwo_blocker_ne_firstApex_point :
    A.boundary.boundary (A.blockerMap commonSourceTwo) ≠ S.oppApex1
  commonSourceTwo_blocker_ne_secondApex_point :
    A.boundary.boundary (A.blockerMap commonSourceTwo) ≠ S.oppApex2
  commonSourceOne_firstDeletion_survives :
    A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceOne)
        (A.blockerMap commonSourceOne) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceTwo)
          (A.blockerMap commonSourceOne) = true
  commonSourceOne_secondDeletion_survives :
    A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceOne)
        (A.blockerMap commonSourceOne) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceTwo)
          (A.blockerMap commonSourceOne) = true
  commonSourceTwo_firstDeletion_survives :
    A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceOne)
        (A.blockerMap commonSourceTwo) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceTwo)
          (A.blockerMap commonSourceTwo) = true
  commonSourceTwo_secondDeletion_survives :
    A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceOne)
        (A.blockerMap commonSourceTwo) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceTwo)
          (A.blockerMap commonSourceTwo) = true
  common_radius_eq :
    A.radiusEq (A.roleIndex .firstApex) commonSourceOne commonSourceTwo = true
  common_radius_ne_firstRetainedSourceOne :
    A.radiusEq (A.roleIndex .firstApex) commonSourceOne
        (A.roleIndex .firstRetainedSourceOne) = false
  common_radius_ne_firstRetainedSourceTwo :
    A.radiusEq (A.roleIndex .firstApex) commonSourceOne
        (A.roleIndex .firstRetainedSourceTwo) = false
  common_radius_ne_secondRetainedSourceOne :
    A.radiusEq (A.roleIndex .firstApex) commonSourceOne
        (A.roleIndex .secondRetainedSourceOne) = false
  common_radius_ne_secondRetainedSourceTwo :
    A.radiusEq (A.roleIndex .firstApex) commonSourceOne
        (A.roleIndex .secondRetainedSourceTwo) = false

private theorem firstApex_point_eq_oppApex1 :
    A.boundary.boundary (A.roleIndex .firstApex) = S.oppApex1 := by
  rw [A.roleIndex_point_eq]
  change S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem index_ne_of_point_ne
    {i j : Fin A.boundary.n} {x y : ℝ²}
    (hi : A.boundary.boundary i = x)
    (hj : A.boundary.boundary j = y)
    (hne : x ≠ y) : i ≠ j := by
  intro hij
  apply hne
  rw [← hi, ← hj, hij]

private theorem blocker_index_ne_of_center_ne
    {i j : Fin A.boundary.n}
    (hcenter :
      H.centerAt (A.boundary.boundary i) (A.boundary_mem i) ≠
        H.centerAt (A.boundary.boundary j) (A.boundary_mem j)) :
    A.blockerMap i ≠ A.blockerMap j := by
  intro hij
  have hpoint := congrArg A.boundary.boundary hij
  rw [A.blockerMap_point_eq i, A.blockerMap_point_eq j] at hpoint
  exact hcenter hpoint

private theorem blocker_index_ne_of_point_ne
    {i j : Fin A.boundary.n}
    (hne : H.centerAt (A.boundary.boundary i) (A.boundary_mem i) ≠
      A.boundary.boundary j) :
    A.blockerMap i ≠ j := by
  intro hij
  have hpoint := congrArg A.boundary.boundary hij
  rw [A.blockerMap_point_eq i] at hpoint
  exact hne hpoint

private theorem common_radius_false_of_ne
    {i j : Fin A.boundary.n} {d e : ℝ}
    (hi : A.boundary.boundary i ∈ SelectedClass D.A S.oppApex1 d)
    (hj : A.boundary.boundary j ∈ SelectedClass D.A S.oppApex1 e)
    (hne : d ≠ e) :
    A.radiusEq (A.roleIndex .firstApex) i j = false := by
  cases hradius : A.radiusEq (A.roleIndex .firstApex) i j with
  | false => rfl
  | true =>
      exfalso
      apply hne
      have hdist := (A.radiusEq_iff _ _ _).mp hradius
      have hfirst := (mem_selectedClass.mp hi).2
      have hsecond := (mem_selectedClass.mp hj).2
      rw [firstApex_point_eq_oppApex1] at hdist
      have hdist' : dist S.oppApex1 (A.boundary.boundary i) =
          dist S.oppApex1 (A.boundary.boundary j) := by
        simpa using hdist
      linarith

private theorem source_point_eq
    {i : Fin A.boundary.n} {source : CriticalShellSystem.CarrierVertex D.A}
    (hi : A.boundary.boundary i = source.1) :
    (⟨A.boundary.boundary i, A.boundary_mem i⟩ :
      CriticalShellSystem.CarrierVertex D.A) = source := by
  apply Subtype.ext
  exact hi

private theorem finite_hasFour_of_geometric
    {i deleted : Fin A.boundary.n} {x : ℝ²}
    (hdeleted : A.boundary.boundary deleted = x)
    {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary i = source.1)
    (h : HasNEquidistantPointsAt 4 (D.A.erase x)
      (H.centerAt source.1 source.2)) :
    A.hasFourAfterDeleting deleted (A.blockerMap i) = true := by
  apply (A.hasFourAfterDeleting_iff deleted (A.blockerMap i)).mpr
  have hcenter :
      A.boundary.boundary (A.blockerMap i) = H.centerAt source.1 source.2 := by
    simpa [hsource] using A.blockerMap_point_eq i
  simpa [hdeleted, hcenter] using h

private theorem finite_cross_pair_view
    {i : Fin A.boundary.n} {source : CriticalShellSystem.CarrierVertex D.A}
    (hsource : A.boundary.boundary i = source.1)
    {left right : Fin A.boundary.n} {x y : ℝ²}
    (hleft : A.boundary.boundary left = x)
    (hright : A.boundary.boundary right = y)
    (hview : CrossPairDeletionView (H := H) source x y) :
    A.hasFourAfterDeleting left (A.blockerMap i) = true ∨
      A.hasFourAfterDeleting right (A.blockerMap i) = true := by
  rcases hview.survives with h | h
  · exact Or.inl (finite_hasFour_of_geometric
      (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A) hleft hsource h)
  · exact Or.inr (finite_hasFour_of_geometric
      (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A) hright hsource h)

/-- Reindex an arbitrary common-radius producer witness without identifying it
with the named canonical surface `C`. -/
noncomputable def FirstNonHitFiniteCommonRadiusPayload.ofWitness
    (G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ) :
    Nonempty (FirstNonHitFiniteCommonRadiusPayload P Pρ C Q A) := by
  classical
  let commonOne := A.boundary.indexOf
    ⟨G.surface.firstSource.1, G.surface.firstSource.2⟩
  let commonTwo := A.boundary.indexOf
    ⟨G.surface.secondSource.1, G.surface.secondSource.2⟩
  have hcommonOnePoint : A.boundary.boundary commonOne = G.surface.firstSource.1 := by
    exact A.boundary.point_eq _
  have hcommonTwoPoint : A.boundary.boundary commonTwo = G.surface.secondSource.1 := by
    exact A.boundary.point_eq _
  rcases G.surface.firstSource_data with
    ⟨_, hfirstInterior, hfirstOutside, hfirstBlocker, hfirstBlockerρ,
      hfirstApex1, hfirstApex2, _, _, hfirstView, hfirstViewρ⟩
  rcases G.surface.secondSource_data with
    ⟨_, hsecondInterior, hsecondOutside, hsecondBlocker, hsecondBlockerρ,
      hsecondApex1, hsecondApex2, _, _, hsecondView, hsecondViewρ⟩
  have hP₁Class :
      A.boundary.boundary (A.roleIndex .firstRetainedSourceOne) ∈
        SelectedClass D.A S.oppApex1 radius := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using P.source₁_mem_radius
  have hP₂Class :
      A.boundary.boundary (A.roleIndex .firstRetainedSourceTwo) ∈
        SelectedClass D.A S.oppApex1 radius := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using P.source₂_mem_radius
  have hPρ₁Class :
      A.boundary.boundary (A.roleIndex .secondRetainedSourceOne) ∈
        SelectedClass D.A S.oppApex1 ρ := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using Pρ.source₁_mem_radius
  have hPρ₂Class :
      A.boundary.boundary (A.roleIndex .secondRetainedSourceTwo) ∈
        SelectedClass D.A S.oppApex1 ρ := by
    simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using Pρ.source₂_mem_radius
  have hfirstSource := source_point_eq
    (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A) hcommonOnePoint
  have hsecondSource := source_point_eq
    (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A) hcommonTwoPoint
  have hcommonNe : commonOne ≠ commonTwo := by
    apply index_ne_of_point_ne
      (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
      hcommonOnePoint hcommonTwoPoint
    exact G.surface.sources_ne
  have hfirstRolePoint (role : FirstNonHitNamedRole) :
      A.boundary.boundary (A.roleIndex role) =
        FirstNonHitNamedRole.point P Pρ C Q role := A.roleIndex_point_eq role
  have hfirstOutsideOne :
      G.surface.firstSource.1 ≠ P.source₁ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hfirstOutsideTwo :
      G.surface.firstSource.1 ≠ P.source₂ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hfirstOutsideρOne :
      G.surface.firstSource.1 ≠ Pρ.source₁ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hfirstOutsideρTwo :
      G.surface.firstSource.1 ≠ Pρ.source₂ := by
    intro h
    apply hfirstOutside
    simp [h]
  have hsecondOutsideOne :
      G.surface.secondSource.1 ≠ P.source₁ := by
    intro h
    apply hsecondOutside
    simp [h]
  have hsecondOutsideTwo :
      G.surface.secondSource.1 ≠ P.source₂ := by
    intro h
    apply hsecondOutside
    simp [h]
  have hsecondOutsideρOne :
      G.surface.secondSource.1 ≠ Pρ.source₁ := by
    intro h
    apply hsecondOutside
    simp [h]
  have hsecondOutsideρTwo :
      G.surface.secondSource.1 ≠ Pρ.source₂ := by
    intro h
    apply hsecondOutside
    simp [h]
  have hcommonOneClass :
      A.boundary.boundary commonOne ∈
        SelectedClass D.A S.oppApex1 G.commonRadius := by
    simpa [hcommonOnePoint] using G.firstSource_mem
  have hP₁Point :
      A.boundary.boundary (A.roleIndex .firstRetainedSourceOne) = P.source₁ := by
    simpa [FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .firstRetainedSourceOne
  have hP₂Point :
      A.boundary.boundary (A.roleIndex .firstRetainedSourceTwo) = P.source₂ := by
    simpa [FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .firstRetainedSourceTwo
  have hPρ₁Point :
      A.boundary.boundary (A.roleIndex .secondRetainedSourceOne) = Pρ.source₁ := by
    simpa [FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .secondRetainedSourceOne
  have hPρ₂Point :
      A.boundary.boundary (A.roleIndex .secondRetainedSourceTwo) = Pρ.source₂ := by
    simpa [FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .secondRetainedSourceTwo
  refine ⟨
    { commonSourceOne := commonOne
      commonSourceTwo := commonTwo
      commonSource_ne := hcommonNe
      commonSourceOne_firstCapInterior :=
        (A.inCapInterior_iff _ _).mpr (by simpa [hcommonOnePoint] using hfirstInterior)
      commonSourceTwo_firstCapInterior :=
        (A.inCapInterior_iff _ _).mpr (by simpa [hcommonTwoPoint] using hsecondInterior)
      commonSourceOne_ne_firstRetainedSourceOne := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonOnePoint (hfirstRolePoint _)
        exact hfirstOutsideOne
      commonSourceOne_ne_firstRetainedSourceTwo := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonOnePoint (hfirstRolePoint _)
        exact hfirstOutsideTwo
      commonSourceOne_ne_secondRetainedSourceOne := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonOnePoint (hfirstRolePoint _)
        exact hfirstOutsideρOne
      commonSourceOne_ne_secondRetainedSourceTwo := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonOnePoint (hfirstRolePoint _)
        exact hfirstOutsideρTwo
      commonSourceTwo_ne_firstRetainedSourceOne := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonTwoPoint (hfirstRolePoint _)
        exact hsecondOutsideOne
      commonSourceTwo_ne_firstRetainedSourceTwo := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonTwoPoint (hfirstRolePoint _)
        exact hsecondOutsideTwo
      commonSourceTwo_ne_secondRetainedSourceOne := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonTwoPoint (hfirstRolePoint _)
        exact hsecondOutsideρOne
      commonSourceTwo_ne_secondRetainedSourceTwo := by
        apply index_ne_of_point_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonTwoPoint (hfirstRolePoint _)
        exact hsecondOutsideρTwo
      commonSourceOne_blocker_ne_first := by
        apply blocker_index_ne_of_center_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
        simpa [hcommonOnePoint, hfirstRolePoint] using hfirstBlocker
      commonSourceOne_blocker_ne_second := by
        apply blocker_index_ne_of_center_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
        simpa [hcommonOnePoint, hfirstRolePoint] using hfirstBlockerρ
      commonSourceTwo_blocker_ne_first := by
        apply blocker_index_ne_of_center_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
        simpa [hcommonTwoPoint, hfirstRolePoint] using hsecondBlocker
      commonSourceTwo_blocker_ne_second := by
        apply blocker_index_ne_of_center_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
        simpa [hcommonTwoPoint, hfirstRolePoint] using hsecondBlockerρ
      commonSourceOne_blocker_ne_firstApex_point := by
        rw [A.blockerMap_point_eq]
        simpa [hcommonOnePoint] using hfirstApex1
      commonSourceOne_blocker_ne_secondApex_point := by
        rw [A.blockerMap_point_eq]
        simpa [hcommonOnePoint] using hfirstApex2
      commonSourceTwo_blocker_ne_firstApex_point := by
        rw [A.blockerMap_point_eq]
        simpa [hcommonTwoPoint] using hsecondApex1
      commonSourceTwo_blocker_ne_secondApex_point := by
        rw [A.blockerMap_point_eq]
        simpa [hcommonTwoPoint] using hsecondApex2
      commonSourceOne_firstDeletion_survives := by
        exact finite_cross_pair_view
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonOnePoint hP₁Point hP₂Point hfirstView
      commonSourceOne_secondDeletion_survives := by
        exact finite_cross_pair_view
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonOnePoint hPρ₁Point hPρ₂Point hfirstViewρ
      commonSourceTwo_firstDeletion_survives := by
        exact finite_cross_pair_view
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonTwoPoint hP₁Point hP₂Point hsecondView
      commonSourceTwo_secondDeletion_survives := by
        exact finite_cross_pair_view
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          hcommonTwoPoint hPρ₁Point hPρ₂Point hsecondViewρ
      common_radius_eq := by
        apply (A.radiusEq_iff _ _ _).mpr
        have hfirst := (mem_selectedClass.mp G.firstSource_mem).2
        have hsecond := (mem_selectedClass.mp G.secondSource_mem).2
        rw [firstApex_point_eq_oppApex1]
        simpa [hcommonOnePoint, hcommonTwoPoint] using hfirst.trans hsecond.symm
      common_radius_ne_firstRetainedSourceOne :=
        common_radius_false_of_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          (i := commonOne) (j := A.roleIndex .firstRetainedSourceOne)
          hcommonOneClass hP₁Class G.commonRadius_ne_radius
      common_radius_ne_firstRetainedSourceTwo :=
        common_radius_false_of_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          (i := commonOne) (j := A.roleIndex .firstRetainedSourceTwo)
          hcommonOneClass hP₂Class G.commonRadius_ne_radius
      common_radius_ne_secondRetainedSourceOne :=
        common_radius_false_of_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          (i := commonOne) (j := A.roleIndex .secondRetainedSourceOne)
          hcommonOneClass hPρ₁Class G.commonRadius_ne_ρ
      common_radius_ne_secondRetainedSourceTwo :=
        common_radius_false_of_ne
          (P := P) (Pρ := Pρ) (C := C) (Q := Q) (A := A)
          (i := commonOne) (j := A.roleIndex .secondRetainedSourceTwo)
          hcommonOneClass hPρ₂Class G.commonRadius_ne_ρ }⟩

end
end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
