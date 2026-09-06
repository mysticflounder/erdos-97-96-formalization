/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ExactFiveSourceThirdRowIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-!
# B1 exact-five source-blocker outcomes

This module splits each repaired exact-five parent according to whether the
actual source blocker lies in the physical five-class.  The outside branches
retain the singleton global-minimal-core output; the inside branches retain the
source-blocker placement supplied by the clean Rigid221 placement theorem.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Source-equals-`u` parent with its source blocker outside the physical
five-class and the complete singleton minimal-core output. -/
structure B1ExactFiveSourceEqUBlockerOutsideResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type where
  parent : B1ExactFiveSourceEqURigidResidual C G
  source_blocker_not_mem_class :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∉
      SelectedClass D.A S.oppApex2 C.rho
  singleton_globalDeletion :
    ExactFourMutualOmissionRigid221GlobalDeletion
      C.R C.rho G.u G.v G.jointDeletion
  singleton_center_eq_source_blocker :
    singleton_globalDeletion.center =
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2
  singleton_deleted_eq_source :
    singleton_globalDeletion.deleted = {G.source.1}
  singleton_center_ne_oppApex2 :
    singleton_globalDeletion.center ≠ S.oppApex2
  singleton_minimalDeletionCore :
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A singleton_globalDeletion.deleted singleton_globalDeletion.center)

/-- Source-equals-`u` parent with its source blocker in the physical
five-class and the specialized `deleted`/`v`-block placement. -/
structure B1ExactFiveSourceEqUBlockerInsideResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type where
  parent : B1ExactFiveSourceEqURigidResidual C G
  source_blocker_mem_class :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈
      SelectedClass D.A S.oppApex2 C.rho
  source_blocker_placement :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 =
        G.jointDeletion.deleted.1 ∨
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈
        ((lateFirstApexSystem C.R).selectedAt
            G.v.1 G.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho

/-- Genuine third-row parent with its source blocker outside the physical
five-class and the complete singleton minimal-core output. -/
structure B1ExactFiveThirdRowBlockerOutsideResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type where
  parent : B1ExactFiveSourceThirdRowResidual C G
  source_blocker_not_mem_class :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∉
      SelectedClass D.A S.oppApex2 C.rho
  singleton_globalDeletion :
    ExactFourMutualOmissionRigid221GlobalDeletion
      C.R C.rho G.u G.v G.jointDeletion
  singleton_center_eq_source_blocker :
    singleton_globalDeletion.center =
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2
  singleton_deleted_eq_source :
    singleton_globalDeletion.deleted = {G.source.1}
  singleton_center_ne_oppApex2 :
    singleton_globalDeletion.center ≠ S.oppApex2
  singleton_minimalDeletionCore :
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A singleton_globalDeletion.deleted singleton_globalDeletion.center)

/-- Genuine third-row parent with its source blocker in the physical
five-class and the specialized `deleted`/`u`/`v`-block placement. -/
structure B1ExactFiveThirdRowBlockerInsideResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type where
  parent : B1ExactFiveSourceThirdRowResidual C G
  source_blocker_mem_class :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈
      SelectedClass D.A S.oppApex2 C.rho
  source_blocker_placement :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 =
        G.jointDeletion.deleted.1 ∨
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 = G.u.1 ∨
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈
        ((lateFirstApexSystem C.R).selectedAt
            G.v.1 G.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho

/-- The source-equals-`u` rigid parent has a clean exhaustive blocker outcome.
The parent packet is retained in either branch. -/
theorem b1ExactFiveSourceEqU_blockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (P : B1ExactFiveSourceEqURigidResidual C G) :
    Nonempty (B1ExactFiveSourceEqUBlockerOutsideResidual C G) ∨
      Nonempty (B1ExactFiveSourceEqUBlockerInsideResidual C G) := by
  classical
  have hcontext :=
    B1FullGeometricCoupledSourceResidual.toExactFourMutualOmissionSourceContext
      C G
  by_cases hsourceBlockerClass :
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈
        SelectedClass D.A S.oppApex2 C.rho
  · have hplacement :=
      exactFourRigid221_sourceBlockerInClass_placement
        G.u_mem_class hcontext P.globalDeletion hsourceBlockerClass
    rcases hplacement with hsourceEq | hthirdRow
    · refine Or.inr ⟨{
        parent := P
        source_blocker_mem_class := hsourceBlockerClass
        source_blocker_placement := hsourceEq.2
      }⟩
    · have hfalse : False := by
        simpa [P.u_eq_source] using hthirdRow.1
      exact hfalse.elim
  · have houtside :=
      exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
        C.R G.surface G.source G.other G.u G.v hcontext G.jointDeletion
          P.globalDeletion hsourceBlockerClass
    rcases houtside with
      ⟨singleton, hcenterEq, hdeletedEq, hcenterNe, hcore⟩
    exact Or.inl ⟨{
      parent := P
      source_blocker_not_mem_class := hsourceBlockerClass
      singleton_globalDeletion := singleton
      singleton_center_eq_source_blocker := hcenterEq
      singleton_deleted_eq_source := hdeletedEq
      singleton_center_ne_oppApex2 := hcenterNe
      singleton_minimalDeletionCore := hcore
    }⟩

/-- The genuine third-row rigid parent has a clean exhaustive blocker outcome.
The parent packet is retained in either branch. -/
theorem b1ExactFiveThirdRow_blockerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (P : B1ExactFiveSourceThirdRowResidual C G) :
    Nonempty (B1ExactFiveThirdRowBlockerOutsideResidual C G) ∨
      Nonempty (B1ExactFiveThirdRowBlockerInsideResidual C G) := by
  classical
  have hcontext :=
    B1FullGeometricCoupledSourceResidual.toExactFourMutualOmissionSourceContext
      C G
  by_cases hsourceBlockerClass :
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈
        SelectedClass D.A S.oppApex2 C.rho
  · have hplacement :=
      exactFourRigid221_sourceBlockerInClass_placement
        G.u_mem_class hcontext P.globalDeletion hsourceBlockerClass
    rcases hplacement with hsourceEq | hthirdRow
    · exact (P.u_ne_source hsourceEq.1).elim
    · refine Or.inr ⟨{
        parent := P
        source_blocker_mem_class := hsourceBlockerClass
        source_blocker_placement := hthirdRow.2
      }⟩
  · have houtside :=
      exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
        C.R G.surface G.source G.other G.u G.v hcontext G.jointDeletion
          P.globalDeletion hsourceBlockerClass
    rcases houtside with
      ⟨singleton, hcenterEq, hdeletedEq, hcenterNe, hcore⟩
    exact Or.inl ⟨{
      parent := P
      source_blocker_not_mem_class := hsourceBlockerClass
      singleton_globalDeletion := singleton
      singleton_center_eq_source_blocker := hcenterEq
      singleton_deleted_eq_source := hdeletedEq
      singleton_center_ne_oppApex2 := hcenterNe
      singleton_minimalDeletionCore := hcore
    }⟩

end ATailFrontierLiveClosure
end Problem97
