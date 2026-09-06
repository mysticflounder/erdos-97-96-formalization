/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FullGeometricSourceContextIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-!
# B1 exact-five source-third-row ingress

This module retains the clean rigid `2+2+1` global-deletion packet and the
source-sensitive normal form exposed by the two source-clean Rigid221
placement consumers.  It leaves the resulting third-row residual open for a
later geometric consumer.
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

/-- The rigid exact-five residual in the arm where the distinguished row is
the source row.  Keeping the global deletion here prevents the equality arm
from discarding the rigid cover needed by the next clean placement consumer.
-/
structure B1ExactFiveSourceEqURigidResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type where
  u_eq_source : G.u = G.source
  globalDeletion :
    ExactFourMutualOmissionRigid221GlobalDeletion
      C.R C.rho G.u G.v G.jointDeletion

/-- The proof-relevant exact-five residual after the genuinely third-row
branch has been selected.  The fields spell out every conjunct supplied by
`exactFourRigid221_context_u_ne_source_normalForm` and retain the complete
placement disjunction supplied by
`exactFourRigid221_context_u_ne_source_otherPlacement`. -/
structure B1ExactFiveSourceThirdRowResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C) : Type where
  globalDeletion :
    ExactFourMutualOmissionRigid221GlobalDeletion
      C.R C.rho G.u G.v G.jointDeletion
  u_ne_source : G.u ≠ G.source
  u_point_ne_source : G.u.1 ≠ G.source.1
  u_not_mem_source_row :
    G.u.1 ∉
      ((lateFirstApexSystem C.R).selectedAt
        G.source.1 G.source.2).toCriticalFourShell.support
  u_block_eq_source_u :
    (((lateFirstApexSystem C.R).selectedAt
        G.u.1 G.u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 C.rho) =
      {G.source.1, G.u.1}
  source_row_inter_u_block_eq_singleton :
    (((lateFirstApexSystem C.R).selectedAt
        G.source.1 G.source.2).toCriticalFourShell.support ∩
      (((lateFirstApexSystem C.R).selectedAt
          G.u.1 G.u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho)) =
      {G.source.1}
  source_mem_u_block_interior :
    G.source.1 ∈
      ((((lateFirstApexSystem C.R).selectedAt
          G.u.1 G.u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) ∩
        S.capInteriorByIndex S.oppIndex2)
  source_blocker_ne_u :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
      (lateFirstApexSystem C.R).centerAt G.u.1 G.u.2
  source_blocker_ne_v :
    (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠
      (lateFirstApexSystem C.R).centerAt G.v.1 G.v.2
  u_blocker_ne_v :
    (lateFirstApexSystem C.R).centerAt G.u.1 G.u.2 ≠
      (lateFirstApexSystem C.R).centerAt G.v.1 G.v.2
  other_placement :
    G.other = G.u ∨
      G.other.1 ∈
        (((lateFirstApexSystem C.R).selectedAt
            G.v.1 G.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho) ∨
      G.other = G.jointDeletion.deleted

/-- At exact class cardinality five, the coupled residual either supplies a
second same-`u/v` joint deletion, identifies `u` with the source, or exposes
the named proof-relevant third-row residual. -/
theorem b1ExactFiveSourceThirdRow_or_secondDeletion_or_sourceEq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (G : B1FullGeometricCoupledSourceResidual C)
    (hclassFive : (SelectedClass D.A S.oppApex2 C.rho).card = 5) :
    (∃ K : ExactFourMutualOmissionJointDeletion C.R C.rho G.u G.v,
        K.deleted ≠ G.jointDeletion.deleted) ∨
    Nonempty (B1ExactFiveSourceEqURigidResidual C G) ∨
      Nonempty (B1ExactFiveSourceThirdRowResidual C G) := by
  classical
  rcases G.exact_five_split hclassFive G.jointDeletion with hsecond | hrigid
  · exact Or.inl hsecond
  · have hrigid' :
      let classSet := SelectedClass D.A S.oppApex2 C.rho
      let Iu :=
        ((lateFirstApexSystem C.R).selectedAt
          G.u.1 G.u.2).toCriticalFourShell.support ∩ classSet
      let Iv :=
        ((lateFirstApexSystem C.R).selectedAt
          G.v.1 G.v.2).toCriticalFourShell.support ∩ classSet
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        classSet = insert G.jointDeletion.deleted.1 (Iu ∪ Iv) := by
      simpa [b1FullGeometricActualRow] using hrigid
    obtain ⟨globalDeletion⟩ :=
      exactFourMutualOmissionRigid221_globalDeletion
        C.R C.rho C.hrho G.u G.v G.jointDeletion hclassFive hrigid'
    by_cases huSource : G.u = G.source
    · exact Or.inr (Or.inl ⟨{
        u_eq_source := huSource
        globalDeletion := globalDeletion
      }⟩)
    · have hcontext :=
        B1FullGeometricCoupledSourceResidual.toExactFourMutualOmissionSourceContext
          C G
      have hnormal :=
        exactFourRigid221_context_u_ne_source_normalForm
          G.u_mem_class hcontext G.jointDeletion.blockers_ne
            globalDeletion huSource
      have hplacement :=
        exactFourRigid221_context_u_ne_source_otherPlacement
          G.u_mem_class hcontext G.jointDeletion.blockers_ne
            globalDeletion huSource
      rcases hnormal with
        ⟨huPointNeSource, huNotSourceRow, hIuEq, hKsInter,
          hsourceIJ, hsourceBlockerNeU, hsourceBlockerNeV,
          hblockersUVNe⟩
      exact Or.inr (Or.inr ⟨{
          globalDeletion := globalDeletion
          u_ne_source := huSource
          u_point_ne_source := huPointNeSource
          u_not_mem_source_row := huNotSourceRow
          u_block_eq_source_u := hIuEq
          source_row_inter_u_block_eq_singleton := hKsInter
          source_mem_u_block_interior := hsourceIJ
          source_blocker_ne_u := hsourceBlockerNeU
          source_blocker_ne_v := hsourceBlockerNeV
          u_blocker_ne_v := hblockersUVNe
          other_placement := hplacement
        }⟩)

end ATailFrontierLiveClosure
end Problem97
