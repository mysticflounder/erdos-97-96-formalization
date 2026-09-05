/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FullGeometricCoupledSource
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1TwoOmittedInteriorPeers

/-!
# B1 card-six distinct deletion or v-row saturation

This module retains the finite alternative left after the two-peer producer.
If a source-omitted strict-interior peer is also omitted from the `v` row and
differs from the existing joint deletion, it gives a new prescribed deletion.
If not, the existing deletion is one of the two peers and the other peer is a
typed `v`-row saturation mate.  The saturation branch keeps all row, class,
interior, and blocker incidences needed by its downstream consumer.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open B1TwoOmittedInteriorPeers

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

/-- The typed residual left when the existing joint deletion is one of the
two source-omitted peers.  Every row, class, interior, and blocker field is
retained for the downstream equality-case consumer. -/
structure B1CardSixVRowSaturationResidual
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type where
  mate : CarrierVertex D.A
  mate_ne_source : mate ≠ G.source
  mate_ne_v : mate ≠ G.v
  mate_ne_deleted : mate ≠ G.jointDeletion.deleted
  deleted_mem_class :
    G.jointDeletion.deleted.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  mate_mem_class : mate.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  deleted_mem_interior :
    G.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2
  mate_mem_interior : mate.1 ∈ S.capInteriorByIndex S.oppIndex2
  deleted_not_mem_source_row :
    G.jointDeletion.deleted.1 ∉ b1FullGeometricActualRow C G.source
  deleted_not_mem_u_row :
    G.jointDeletion.deleted.1 ∉ b1FullGeometricActualRow C G.u
  mate_not_mem_source_row :
    mate.1 ∉ b1FullGeometricActualRow C G.source
  mate_not_mem_u_row :
    mate.1 ∉ b1FullGeometricActualRow C G.u
  deleted_not_mem_v_row :
    G.jointDeletion.deleted.1 ∉ b1FullGeometricActualRow C G.v
  mate_mem_v_row : mate.1 ∈ b1FullGeometricActualRow C G.v
  v_row_intersection :
    b1FullGeometricActualRow C G.v ∩
        SelectedClass D.A S.oppApex2 C.rho =
      {G.v.1, mate.1}
  source_deleted_blockers_ne :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
      (lateFirstApexSystem C.R).centerAt
        G.jointDeletion.deleted.1 G.jointDeletion.deleted.2
  source_mate_blockers_ne :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
      (lateFirstApexSystem C.R).centerAt mate.1 mate.2

/-- In the card-six source arm, either a prescribed deletion differs from the
existing joint deletion, or the `v` row is exactly saturated by `v` and a
second strict-interior mate.  The latter branch retains the source/u-row
omissions and both source-versus-peer blocker inequalities. -/
theorem exists_b1CardSix_distinctDeletion_or_vRowSaturation
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (hu : G.u = G.source)
    (hvOutside : G.v.1 ∉ S.capInteriorByIndex S.oppIndex2) :
    (∃ K : ExactFourMutualOmissionJointDeletion C.R C.rho G.u G.v,
        K.deleted ≠ G.jointDeletion.deleted) ∨
      Nonempty (B1CardSixVRowSaturationResidual C G) := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let vRow := b1FullGeometricActualRow C G.v
  have hclassEq : physicalClass.card = 6 := by
    simpa [physicalClass] using hsix
  have hclassSix : 6 ≤ physicalClass.card := by
    omega
  have hsourceRowCard :
      (b1FullGeometricActualRow C G.source ∩ physicalClass).card ≤ 2 := by
    simpa [physicalClass] using G.source_row_card_le_two
  have hsourceCross :
      ((((lateFirstApexSystem C.R).selectedAt
            G.source.1 G.source.2).toCriticalFourShell.support ∩
          (physicalClass ∩ S.capInteriorByIndex S.oppIndex2)).card ≤ 2) := by
    apply le_trans ?_ hsourceRowCard
    apply Finset.card_le_card
    intro x hx
    have hx' := Finset.mem_inter.mp hx
    exact Finset.mem_inter.mpr
      ⟨hx'.1, (Finset.mem_inter.mp hx'.2).1⟩
  have hvRowCard : (vRow ∩ physicalClass).card ≤ 2 := by
    simpa [vRow, physicalClass] using G.v_row_card_le_two
  obtain ⟨peer₁, peer₂, hpeerNe, hpeer₁Source, hpeer₂Source,
      hpeer₁Class, hpeer₂Class, hpeer₁Interior, hpeer₂Interior,
      hpeer₁SourceRow, hpeer₂SourceRow, hblocker₁, hblocker₂⟩ :=
    exists_two_omittedSecondClassInteriorPeers
      C.R G.source C.hrho hclassSix hsourceCross
  have hpeer₁URow :
      peer₁.1 ∉ b1FullGeometricActualRow C G.u := by
    rw [hu]
    simpa [b1FullGeometricActualRow] using hpeer₁SourceRow
  have hpeer₂URow :
      peer₂.1 ∉ b1FullGeometricActualRow C G.u := by
    rw [hu]
    simpa [b1FullGeometricActualRow] using hpeer₂SourceRow
  have hdeletedURow :
      G.jointDeletion.deleted.1 ∉ b1FullGeometricActualRow C G.u := by
    simpa [b1FullGeometricActualRow] using
      G.jointDeletion.deleted_not_mem_uRow
  have hdeletedSourceRow :
      G.jointDeletion.deleted.1 ∉ b1FullGeometricActualRow C G.source := by
    rw [← hu]
    exact hdeletedURow
  have hdeletedVRow :
      G.jointDeletion.deleted.1 ∉ b1FullGeometricActualRow C G.v := by
    simpa [b1FullGeometricActualRow] using
      G.jointDeletion.deleted_not_mem_vRow
  have hdeletedClass :
      G.jointDeletion.deleted.1 ∈ physicalClass := by
    simpa [physicalClass] using G.jointDeletion.deleted_mem_class
  have hvOwn : G.v.1 ∈ vRow := by
    simpa [vRow, b1FullGeometricActualRow] using
      ((lateFirstApexSystem C.R).selectedAt
        G.v.1 G.v.2).toCriticalFourShell.q_mem_support
  have hvMem : G.v.1 ∈ vRow ∩ physicalClass := by
    exact Finset.mem_inter.mpr
      ⟨hvOwn, by simpa [physicalClass] using G.v_mem_class⟩
  have hpeer₁NeV : peer₁ ≠ G.v := by
    intro h
    apply hvOutside
    simpa [h] using hpeer₁Interior
  have hpeer₂NeV : peer₂ ≠ G.v := by
    intro h
    apply hvOutside
    simpa [h] using hpeer₂Interior
  have hpeer₁ValNeV : peer₁.1 ≠ G.v.1 := by
    intro h
    exact hpeer₁NeV (Subtype.ext h)
  have hpeer₂ValNeV : peer₂.1 ≠ G.v.1 := by
    intro h
    exact hpeer₂NeV (Subtype.ext h)
  have hpeer₁ValNe₂ : peer₁.1 ≠ peer₂.1 := by
    intro h
    exact hpeerNe (Subtype.ext h)
  have hsomeOmitted :
      peer₁.1 ∉ vRow ∨ peer₂.1 ∉ vRow := by
    by_contra hnone
    push_neg at hnone
    have hpeer₁Mem : peer₁.1 ∈ vRow ∩ physicalClass :=
      Finset.mem_inter.mpr
        ⟨hnone.1, by simpa [physicalClass] using hpeer₁Class⟩
    have hpeer₂Mem : peer₂.1 ∈ vRow ∩ physicalClass :=
      Finset.mem_inter.mpr
        ⟨hnone.2, by simpa [physicalClass] using hpeer₂Class⟩
    have hthreeSubset :
        ({G.v.1, peer₁.1, peer₂.1} : Finset ℝ²) ⊆
          vRow ∩ physicalClass := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl
      · exact hvMem
      · exact hpeer₁Mem
      · exact hpeer₂Mem
    have hthreeCard :
        ({G.v.1, peer₁.1, peer₂.1} : Finset ℝ²).card = 3 := by
      exact Finset.card_eq_three.mpr
        ⟨G.v.1, peer₁.1, peer₂.1, Ne.symm hpeer₁ValNeV,
          Ne.symm hpeer₂ValNeV, hpeer₁ValNe₂, rfl⟩
    have hthreeLe := Finset.card_le_card hthreeSubset
    rw [hthreeCard] at hthreeLe
    omega
  have hrowPairEq :
      ∀ (mate : CarrierVertex D.A),
        mate.1 ≠ G.v.1 →
        mate.1 ∈ vRow →
        mate.1 ∈ physicalClass →
        vRow ∩ physicalClass = {G.v.1, mate.1} := by
    intro mate hmateNeV hmateV hmateClass
    have hpairSubset :
        ({G.v.1, mate.1} : Finset ℝ²) ⊆ vRow ∩ physicalClass := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl
      · exact hvMem
      · exact Finset.mem_inter.mpr ⟨hmateV, hmateClass⟩
    have hpairCard : ({G.v.1, mate.1} : Finset ℝ²).card = 2 := by
      simp [Ne.symm hmateNeV]
    have hpairLe : (vRow ∩ physicalClass).card ≤
        ({G.v.1, mate.1} : Finset ℝ²).card := by
      rw [hpairCard]
      exact hvRowCard
    exact (Finset.eq_of_subset_of_card_le hpairSubset hpairLe).symm
  have hmakeDistinct :
      ∀ (w : CarrierVertex D.A),
        w ≠ G.jointDeletion.deleted →
        w.1 ∈ physicalClass →
        w.1 ∉ b1FullGeometricActualRow C G.u →
        w.1 ∉ b1FullGeometricActualRow C G.v →
        ∃ K : ExactFourMutualOmissionJointDeletion C.R C.rho G.u G.v,
          K.deleted ≠ G.jointDeletion.deleted := by
    intro w hwd hwClass hwU hwV
    obtain ⟨K, hK⟩ :=
      exactFourMutualOmissionJointDeletion_of_prescribed
        C.R G.surface C.rho G.u G.v w
        (by simpa [physicalClass] using hwClass)
        hwU hwV G.jointDeletion.blockers_ne
    refine ⟨K, ?_⟩
    intro hKd
    apply hwd
    exact hK ▸ hKd
  rcases hsomeOmitted with hpeer₁V | hpeer₂V
  · by_cases hpeer₁Deleted : peer₁ = G.jointDeletion.deleted
    · by_cases hpeer₂V' : peer₂.1 ∉ vRow
      · left
        have hpeer₂Deleted : peer₂ ≠ G.jointDeletion.deleted := by
          intro h
          apply hpeerNe
          exact hpeer₁Deleted.trans h.symm
        exact hmakeDistinct peer₂ hpeer₂Deleted
          (by simpa [physicalClass] using hpeer₂Class)
          hpeer₂URow (by simpa [vRow] using hpeer₂V')
      · have hpeer₂VRow : peer₂.1 ∈ vRow := not_not.mp hpeer₂V'
        have hpeer₂Deleted : peer₂ ≠ G.jointDeletion.deleted := by
          intro h
          apply hpeerNe
          exact hpeer₁Deleted.trans h.symm
        have hdeletedInterior :
            G.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
          rw [← hpeer₁Deleted]
          exact hpeer₁Interior
        have hsourceDeletedBlocker :
            (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
              (lateFirstApexSystem C.R).centerAt
                G.jointDeletion.deleted.1 G.jointDeletion.deleted.2 := by
          rw [← hpeer₁Deleted]
          exact hblocker₁
        have hR : B1CardSixVRowSaturationResidual C G := {
          mate := peer₂
          mate_ne_source := hpeer₂Source
          mate_ne_v := hpeer₂NeV
          mate_ne_deleted := hpeer₂Deleted
          deleted_mem_class := by simpa [physicalClass] using hdeletedClass
          mate_mem_class := by simpa [physicalClass] using hpeer₂Class
          deleted_mem_interior := hdeletedInterior
          mate_mem_interior := hpeer₂Interior
          deleted_not_mem_source_row := hdeletedSourceRow
          deleted_not_mem_u_row := hdeletedURow
          mate_not_mem_source_row := by
            simpa [b1FullGeometricActualRow] using hpeer₂SourceRow
          mate_not_mem_u_row := hpeer₂URow
          deleted_not_mem_v_row := hdeletedVRow
          mate_mem_v_row := by simpa [vRow] using hpeer₂VRow
          v_row_intersection := by
            simpa [vRow, physicalClass] using
              (hrowPairEq peer₂ hpeer₂ValNeV hpeer₂VRow
                (by simpa [physicalClass] using hpeer₂Class))
          source_deleted_blockers_ne := hsourceDeletedBlocker
          source_mate_blockers_ne := hblocker₂ }
        exact Or.inr ⟨hR⟩
    · left
      exact hmakeDistinct peer₁ hpeer₁Deleted
        (by simpa [physicalClass] using hpeer₁Class)
        hpeer₁URow (by simpa [vRow] using hpeer₁V)
  · by_cases hpeer₂Deleted : peer₂ = G.jointDeletion.deleted
    · by_cases hpeer₁V' : peer₁.1 ∉ vRow
      · left
        have hpeer₁Deleted : peer₁ ≠ G.jointDeletion.deleted := by
          intro h
          apply hpeerNe
          exact h.trans hpeer₂Deleted.symm
        exact hmakeDistinct peer₁ hpeer₁Deleted
          (by simpa [physicalClass] using hpeer₁Class)
          hpeer₁URow (by simpa [vRow] using hpeer₁V')
      · have hpeer₁VRow : peer₁.1 ∈ vRow := not_not.mp hpeer₁V'
        have hpeer₁Deleted : peer₁ ≠ G.jointDeletion.deleted := by
          intro h
          apply hpeerNe
          exact h.trans hpeer₂Deleted.symm
        have hdeletedInterior :
            G.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
          rw [← hpeer₂Deleted]
          exact hpeer₂Interior
        have hsourceDeletedBlocker :
            (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
              (lateFirstApexSystem C.R).centerAt
                G.jointDeletion.deleted.1 G.jointDeletion.deleted.2 := by
          rw [← hpeer₂Deleted]
          exact hblocker₂
        have hR : B1CardSixVRowSaturationResidual C G := {
          mate := peer₁
          mate_ne_source := hpeer₁Source
          mate_ne_v := hpeer₁NeV
          mate_ne_deleted := hpeer₁Deleted
          deleted_mem_class := by simpa [physicalClass] using hdeletedClass
          mate_mem_class := by simpa [physicalClass] using hpeer₁Class
          deleted_mem_interior := hdeletedInterior
          mate_mem_interior := hpeer₁Interior
          deleted_not_mem_source_row := hdeletedSourceRow
          deleted_not_mem_u_row := hdeletedURow
          mate_not_mem_source_row := by
            simpa [b1FullGeometricActualRow] using hpeer₁SourceRow
          mate_not_mem_u_row := hpeer₁URow
          deleted_not_mem_v_row := hdeletedVRow
          mate_mem_v_row := by simpa [vRow] using hpeer₁VRow
          v_row_intersection := by
            simpa [vRow, physicalClass] using
              (hrowPairEq peer₁ hpeer₁ValNeV hpeer₁VRow
                (by simpa [physicalClass] using hpeer₁Class))
          source_deleted_blockers_ne := hsourceDeletedBlocker
          source_mate_blockers_ne := hblocker₁ }
        exact Or.inr ⟨hR⟩
    · left
      exact hmakeDistinct peer₂ hpeer₂Deleted
        (by simpa [physicalClass] using hpeer₂Class)
        hpeer₂URow (by simpa [vRow] using hpeer₂V)

end ATailFrontierLiveClosure
end Problem97
