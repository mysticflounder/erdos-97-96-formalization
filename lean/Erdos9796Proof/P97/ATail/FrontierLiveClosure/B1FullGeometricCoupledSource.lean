/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1WinningSliceOrderOutcome
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.ExactFiveSplit

/-!
# Full-geometric B1 coupled-source residual

This module keeps the source, cap/order witness, robust surface, exact late
rows, and the exact-five row split together.  The historical source-context
adapter is intentionally not used here: its job is to forget this geometry.
The branch field records the identities that must be retained before that
forgetful step.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

noncomputable def b1FullGeometricActualRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) (x : CarrierVertex D.A) : Finset ℝ² :=
  ((lateFirstApexSystem C.R).selectedAt x.1 x.2).toCriticalFourShell.support

/-- The data that survive the full geometric producer boundary.  In
particular, `branch_residual` retains the `u = source` arm and all three
possible identities for `other`; it is not a scalarized existence claim. -/
structure B1FullGeometricCoupledSourceResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type where
  convex_independent : ConvexIndep D.A
  surface : ExactFourPostCardElevenRobustSurface C.R
  escape : B1EscapeRowProvenanceStar C
  source : CarrierVertex D.A
  source_mem_class :
    source.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  source_mem_interior :
    source.1 ∈ S.capInteriorByIndex S.oppIndex2
  source_mem_outside : source ∈ outsideFirstApexFiber C.R
  source_survives_q_or_w :
    HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
        ((lateFirstApexSystem C.R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
        ((lateFirstApexSystem C.R).centerAt source.1 source.2)
  other : CarrierVertex D.A
  other_ne_source : other ≠ source
  other_mem_class :
    other.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  other_mem_interior :
    other.1 ∈ S.capInteriorByIndex S.oppIndex2
  other_not_mem_source_row :
    other.1 ∉ b1FullGeometricActualRow C source
  source_other_blockers_ne :
    (lateFirstApexSystem C.R).centerAt source.1 source.2 ≠
      (lateFirstApexSystem C.R).centerAt other.1 other.2
  u : CarrierVertex D.A
  v : CarrierVertex D.A
  u_ne_v : u ≠ v
  u_mem_class : u.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  v_mem_class : v.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  v_not_mem_u_row : v.1 ∉ b1FullGeometricActualRow C u
  u_not_mem_v_row : u.1 ∉ b1FullGeometricActualRow C v
  source_mem_u_row : source.1 ∈ b1FullGeometricActualRow C u
  v_not_mem_source_row : v.1 ∉ b1FullGeometricActualRow C source
  u_eq_source_or_not_mem_source_row :
    u = source ∨ u.1 ∉ b1FullGeometricActualRow C source
  jointDeletion : ExactFourMutualOmissionJointDeletion C.R C.rho u v
  source_row_card_le_two :
    (b1FullGeometricActualRow C source ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2
  u_row_card_le_two :
    (b1FullGeometricActualRow C u ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2
  v_row_card_le_two :
    (b1FullGeometricActualRow C v ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2
  /-- The identity/omission split demanded before identities are discarded. -/
  branch_residual :
    (u = source ∧
        other.1 ∉ b1FullGeometricActualRow C u ∧
          (other.1 ∉ b1FullGeometricActualRow C v ∨
            (v.1 ∈ b1FullGeometricActualRow C v ∧
              other.1 ∈ b1FullGeometricActualRow C v ∧
              source.1 ∉ b1FullGeometricActualRow C v))) ∨
      (u ≠ source ∧
        ((other = u ∧
            u.1 ∉ b1FullGeometricActualRow C source ∧
            v.1 ∉ b1FullGeometricActualRow C u ∧
            other.1 ∉ b1FullGeometricActualRow C v) ∨
          (other = v ∧
            v.1 ∉ b1FullGeometricActualRow C source ∧
            v.1 ∉ b1FullGeometricActualRow C u ∧
            u.1 ∉ b1FullGeometricActualRow C v) ∨
          (other ≠ u ∧ other ≠ v ∧
            u.1 ∉ b1FullGeometricActualRow C source ∧
            v.1 ∉ b1FullGeometricActualRow C source ∧
            other.1 ∉ b1FullGeometricActualRow C source ∧
            v.1 ∉ b1FullGeometricActualRow C u ∧
            u.1 ∉ b1FullGeometricActualRow C v)))
  /-- At exact cardinality five, retain the `2+2` alternative or a second
  same-`u/v` joint deletion. -/
  exact_five_split :
    ∀ (_hcard : (SelectedClass D.A S.oppApex2 C.rho).card = 5)
      (J : ExactFourMutualOmissionJointDeletion C.R C.rho u v),
      (∃ K : ExactFourMutualOmissionJointDeletion C.R C.rho u v,
          K.deleted ≠ J.deleted) ∨
        (let classSet := SelectedClass D.A S.oppApex2 C.rho
         let Iu := b1FullGeometricActualRow C u ∩ classSet
         let Iv := b1FullGeometricActualRow C v ∩ classSet
         Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
           classSet = insert J.deleted.1 (Iu ∪ Iv))

/-- The exact first premise not supplied by the producer is the weakest
winning-live-slice same-boundary-arc statement consumed by the contradiction.
This is a proposition-valued label, not a proof of the premise. -/
def B1FullGeometricFirstMissingPremise
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  B1WinningLiveSliceSameBoundaryArc C

theorem B1FullGeometricFirstMissingPremise_eq_winning_arc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    B1FullGeometricFirstMissingPremise C = B1WinningLiveSliceSameBoundaryArc C := rfl

theorem nonempty_b1FullGeometricCoupledSourceResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    Nonempty (B1FullGeometricCoupledSourceResidual C) := by
  classical
  obtain ⟨escape⟩ := nonempty_b1EscapeRowProvenanceStar C hnormal
  obtain ⟨source, hsourceClass, hsourceInterior, hsourceOutside,
      hsourceSurvives⟩ :=
    exists_interiorPairGoodOutsideSource_mem_secondClassInterior
      C.R C.surface.secondApex_robust C.hrho C.hfive
  have hsourceCross :=
    actualLateRow_secondClassInterior_card_le_two
      C.R C.surface source hsourceClass hsourceInterior
  obtain ⟨other, hotherNe, hotherClass, hotherInterior,
      hotherOmitted, hblockersNe⟩ :=
    exists_omittedSecondClassInteriorPeer
      C.R source C.hrho C.hfive hsourceCross
  obtain ⟨u, v, huNeV, huClass, hvClass, hvOmitted, huOmitted,
      hsourceMemURow, hvOmittedSourceRow, huEqSourceOrOmitted⟩ :=
    exists_mutuallyOmittedSecondClassPair
      C.R C.surface source C.hfive hsourceClass
  have hblockersUVNe :
      (lateFirstApexSystem C.R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem C.R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem C.R) u.2 v.2 hcenters
    apply hvOmitted
    rw [hsupports]
    exact
      ((lateFirstApexSystem C.R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  obtain ⟨jointDeletion⟩ :=
    nonempty_exactFourMutualOmissionJointDeletion
      C.R C.surface C.rho C.hfive u v hblockersUVNe
  have hsourceRowCard :
      (b1FullGeometricActualRow C source ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2 := by
    simpa [b1FullGeometricActualRow] using
      actualLateRow_secondClass_card_le_two C.R C.surface source
  have huRowCard :
      (b1FullGeometricActualRow C u ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2 := by
    simpa [b1FullGeometricActualRow] using
      actualLateRow_secondClass_card_le_two C.R C.surface u
  have hvRowCard :
      (b1FullGeometricActualRow C v ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2 := by
    simpa [b1FullGeometricActualRow] using
      actualLateRow_secondClass_card_le_two C.R C.surface v
  have hbranch :
      (u = source ∧
          other.1 ∉ b1FullGeometricActualRow C u ∧
            (other.1 ∉ b1FullGeometricActualRow C v ∨
              (v.1 ∈ b1FullGeometricActualRow C v ∧
                other.1 ∈ b1FullGeometricActualRow C v ∧
                source.1 ∉ b1FullGeometricActualRow C v))) ∨
        (u ≠ source ∧
          ((other = u ∧
              u.1 ∉ b1FullGeometricActualRow C source ∧
              v.1 ∉ b1FullGeometricActualRow C u ∧
              other.1 ∉ b1FullGeometricActualRow C v) ∨
            (other = v ∧
              v.1 ∉ b1FullGeometricActualRow C source ∧
              v.1 ∉ b1FullGeometricActualRow C u ∧
              u.1 ∉ b1FullGeometricActualRow C v) ∨
            (other ≠ u ∧ other ≠ v ∧
              u.1 ∉ b1FullGeometricActualRow C source ∧
              v.1 ∉ b1FullGeometricActualRow C source ∧
              other.1 ∉ b1FullGeometricActualRow C source ∧
              v.1 ∉ b1FullGeometricActualRow C u ∧
              u.1 ∉ b1FullGeometricActualRow C v))) := by
    by_cases huSource : u = source
    · left
      refine ⟨huSource, ?_, ?_⟩
      · rw [huSource]
        simpa [b1FullGeometricActualRow] using hotherOmitted
      · by_cases hotherV : other.1 ∉ b1FullGeometricActualRow C v
        · exact Or.inl hotherV
        · right
          have hotherV' : other.1 ∈ b1FullGeometricActualRow C v :=
            not_not.mp hotherV
          refine ⟨?_, hotherV', ?_⟩
          · simpa [b1FullGeometricActualRow] using
              ((lateFirstApexSystem C.R).selectedAt
                v.1 v.2).toCriticalFourShell.q_mem_support
          · simpa [huSource, b1FullGeometricActualRow] using huOmitted
    · right
      refine ⟨huSource, ?_⟩
      have hsourceOmitted :
          u.1 ∉ b1FullGeometricActualRow C source := by
        simpa [b1FullGeometricActualRow] using huEqSourceOrOmitted.resolve_left huSource
      rcases eq_or_ne other u with hotherU | hotherU
      · exact Or.inl ⟨hotherU, hsourceOmitted,
          by simpa [b1FullGeometricActualRow] using hvOmitted,
          by simpa [hotherU, b1FullGeometricActualRow] using huOmitted⟩
      · rcases eq_or_ne other v with hotherV | hotherV
        · exact Or.inr (Or.inl ⟨hotherV,
            by simpa [b1FullGeometricActualRow] using hvOmittedSourceRow,
            by simpa [b1FullGeometricActualRow] using hvOmitted,
            by simpa [b1FullGeometricActualRow] using huOmitted⟩)
        · exact Or.inr (Or.inr ⟨hotherU, hotherV, hsourceOmitted,
            by simpa [b1FullGeometricActualRow] using hvOmittedSourceRow,
            by simpa [b1FullGeometricActualRow] using hotherOmitted,
            by simpa [b1FullGeometricActualRow] using hvOmitted,
            by simpa [b1FullGeometricActualRow] using huOmitted⟩)
  refine ⟨{
    convex_independent := D.convex
    surface := C.surface
    escape := escape
    source := source
    source_mem_class := hsourceClass
    source_mem_interior := hsourceInterior
    source_mem_outside := hsourceOutside
    source_survives_q_or_w := hsourceSurvives
    other := other
    other_ne_source := hotherNe
    other_mem_class := hotherClass
    other_mem_interior := hotherInterior
    other_not_mem_source_row := by
      simpa [b1FullGeometricActualRow] using hotherOmitted
    source_other_blockers_ne := hblockersNe
    u := u
    v := v
    u_ne_v := huNeV
    u_mem_class := huClass
    v_mem_class := hvClass
    v_not_mem_u_row := by
      simpa [b1FullGeometricActualRow] using hvOmitted
    u_not_mem_v_row := by
      simpa [b1FullGeometricActualRow] using huOmitted
    source_mem_u_row := by
      simpa [b1FullGeometricActualRow] using hsourceMemURow
    v_not_mem_source_row := by
      simpa [b1FullGeometricActualRow] using hvOmittedSourceRow
    u_eq_source_or_not_mem_source_row := by
      rcases huEqSourceOrOmitted with h | h
      · exact Or.inl h
      · exact Or.inr (by simpa [b1FullGeometricActualRow] using h)
    jointDeletion := jointDeletion
    source_row_card_le_two := hsourceRowCard
    u_row_card_le_two := huRowCard
    v_row_card_le_two := hvRowCard
    branch_residual := hbranch
    exact_five_split := by
      intro hcard J
      simpa [b1FullGeometricActualRow] using
        (exactFourMutualOmissionJointDeletion_exactFive_strongSplit
          C.R C.surface C.rho hcard u v J)
  }⟩

end ATailFrontierLiveClosure
end Problem97
