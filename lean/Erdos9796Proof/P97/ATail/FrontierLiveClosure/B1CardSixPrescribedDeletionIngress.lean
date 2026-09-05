/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FullGeometricCoupledSource
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1TwoOmittedInteriorPeers

/-!
# B1 card-six prescribed-deletion ingress

This module adapts the source-clean two-peer producer to the full geometric
B1 residual in the `u = source` and `v`-outside-strict-interior branch.  The
prescribed-deletion constructor retains the selected peer as the deleted
vertex of an `ExactFourMutualOmissionJointDeletion` packet.

The final dichotomy records the two possible identities of that deletion
relative to the residual's existing joint deletion.  It is an honest
dichotomy and does not assert either branch or derive a contradiction.
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

/-- In the card-six source arm, the outside-interior endpoint admits a
prescribed mutual-omission deletion at one of the two source-omitted
strict-interior peers. -/
theorem exists_b1CardSix_prescribedDeletion_of_source_eq_and_v_outsideInterior
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (hu : G.u = G.source)
    (hvOutside : G.v.1 ∉ S.capInteriorByIndex S.oppIndex2) :
    ∃ peer : CarrierVertex D.A,
      ∃ K : ExactFourMutualOmissionJointDeletion C.R C.rho G.u G.v,
        peer ≠ G.source ∧
        peer ≠ G.v ∧
        peer.1 ∈ SelectedClass D.A S.oppApex2 C.rho ∧
        peer.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        peer.1 ∉ b1FullGeometricActualRow C G.source ∧
        peer.1 ∉ b1FullGeometricActualRow C G.v ∧
        (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
          (lateFirstApexSystem C.R).centerAt peer.1 peer.2 ∧
        K.deleted = peer := by
  have hclassSix :
      6 ≤ (SelectedClass D.A S.oppApex2 C.rho).card := by
    omega
  have hsourceRowCard :
      (b1FullGeometricActualRow C G.source ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2 :=
    G.source_row_card_le_two
  have hsourceCross :
      ((((lateFirstApexSystem C.R).selectedAt
            G.source.1 G.source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 C.rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2) := by
    apply le_trans ?_ hsourceRowCard
    apply Finset.card_le_card
    intro x hx
    have hx' := Finset.mem_inter.mp hx
    exact Finset.mem_inter.mpr
      ⟨hx'.1, (Finset.mem_inter.mp hx'.2).1⟩
  have hvRowCard :
      (b1FullGeometricActualRow C G.v ∩
        SelectedClass D.A S.oppApex2 C.rho).card ≤ 2 :=
    G.v_row_card_le_two
  obtain ⟨peer, hpeerSource, hpeerV, hpeerClass, hpeerInterior,
      hpeerSourceRow, hpeerVRow, hpeerBlocker⟩ :=
    exists_coupled_omittedSecondClassInteriorPeer
      (S := S) (rho := C.rho)
      C.R G.source G.v C.hrho hclassSix hsourceCross G.v_mem_class
      hvOutside hvRowCard
  have hpeerURow :
      peer.1 ∉
        ((lateFirstApexSystem C.R).selectedAt
          G.u.1 G.u.2).toCriticalFourShell.support := by
    rw [hu]
    exact hpeerSourceRow
  obtain ⟨K, hKdeleted⟩ :=
    exactFourMutualOmissionJointDeletion_of_prescribed
      C.R G.surface C.rho G.u G.v peer
      (by simpa using hpeerClass)
      hpeerURow
      hpeerVRow
      G.jointDeletion.blockers_ne
  refine ⟨peer, K, hpeerSource, hpeerV, hpeerClass, hpeerInterior, ?_, ?_,
    hpeerBlocker, ?_⟩
  · simpa [b1FullGeometricActualRow] using hpeerSourceRow
  · simpa [b1FullGeometricActualRow] using hpeerVRow
  · exact hKdeleted

/-- The prescribed deletion has the honest two-way identity split relative to
the residual deletion; this declaration does not choose a branch. -/
theorem exists_b1CardSix_prescribedDeletion_with_deleted_dichotomy
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (hu : G.u = G.source)
    (hvOutside : G.v.1 ∉ S.capInteriorByIndex S.oppIndex2) :
    ∃ peer : CarrierVertex D.A,
      ∃ K : ExactFourMutualOmissionJointDeletion C.R C.rho G.u G.v,
        peer ≠ G.source ∧
        peer ≠ G.v ∧
        peer.1 ∈ SelectedClass D.A S.oppApex2 C.rho ∧
        peer.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        peer.1 ∉ b1FullGeometricActualRow C G.source ∧
        peer.1 ∉ b1FullGeometricActualRow C G.v ∧
        (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
          (lateFirstApexSystem C.R).centerAt peer.1 peer.2 ∧
        K.deleted = peer ∧
        (K.deleted ≠ G.jointDeletion.deleted ∨
          K.deleted = G.jointDeletion.deleted) := by
  obtain ⟨peer, K, hpeerSource, hpeerV, hpeerClass, hpeerInterior,
      hpeerSourceRow, hpeerVRow, hpeerBlocker, hKdeleted⟩ :=
    exists_b1CardSix_prescribedDeletion_of_source_eq_and_v_outsideInterior
      C G hsix hu hvOutside
  exact ⟨peer, K, hpeerSource, hpeerV, hpeerClass, hpeerInterior,
    hpeerSourceRow, hpeerVRow, hpeerBlocker, hKdeleted, ne_or_eq _ _⟩

end ATailFrontierLiveClosure
end Problem97
