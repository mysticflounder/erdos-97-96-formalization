/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowClauseDeltaArtifacts

/-!
# Exact-twelve next-row named-job dispatch

This module connects the twelve normalized source placement representatives
with their source-checked `CompiledNextRowJob` declarations.  The dispatch
preserves the source row and blocker hypotheses supplied by the
`nextRowOnlyHit` semantic producer.  It does not provide terminal
unsatisfiability certificates or close the geometric residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open FrozenNextRowJobCnf
open FrozenNextRowClauseDeltaArtifact
open NextRowTerminalBankConsumer

set_option maxRecDepth 100000 in
/-- Every normalized source placement is one of the twelve named schedule
cells used by the clause-delta collection. -/
theorem frozenNextRowCell_cases (cell : FrozenNextRowCell) :
    cell = cell0000 ∨ cell = cell0001 ∨ cell = cell0002 ∨
      cell = cell0003 ∨ cell = cell0004 ∨ cell = cell0005 ∨
      cell = cell0006 ∨ cell = cell0007 ∨ cell = cell0008 ∨
      cell = cell0009 ∨ cell = cell0010 ∨ cell = cell0011 := by
  revert cell
  native_decide

/-- The source-checked compiled job attached to a normalized placement cell. -/
def nextRowJobForCell (cell : FrozenNextRowCell) :
    CompiledNextRowJob cell.1.1 cell.1.2 := by
  classical
  if h : cell = cell0000 then
    exact h ▸ cell0000CompiledNextRowJob
  else if h : cell = cell0001 then
    exact h ▸ cell0001CompiledNextRowJob
  else if h : cell = cell0002 then
    exact h ▸ cell0002CompiledNextRowJob
  else if h : cell = cell0003 then
    exact h ▸ cell0003CompiledNextRowJob
  else if h : cell = cell0004 then
    exact h ▸ cell0004CompiledNextRowJob
  else if h : cell = cell0005 then
    exact h ▸ cell0005CompiledNextRowJob
  else if h : cell = cell0006 then
    exact h ▸ cell0006CompiledNextRowJob
  else if h : cell = cell0007 then
    exact h ▸ cell0007CompiledNextRowJob
  else if h : cell = cell0008 then
    exact h ▸ cell0008CompiledNextRowJob
  else if h : cell = cell0009 then
    exact h ▸ cell0009CompiledNextRowJob
  else if h : cell = cell0010 then
    exact h ▸ cell0010CompiledNextRowJob
  else if h : cell = cell0011 then
    exact h ▸ cell0011CompiledNextRowJob
  else
    exact False.elim (by
      rcases frozenNextRowCell_cases cell with h | h | h | h | h | h |
        h | h | h | h | h | h <;> contradiction)

/-- The source normal-form producer supplies a named typed job for its
normalized placement, while retaining the row and blocker hypotheses needed
by the job's source-witness contract. -/
theorem exists_source_namedNextRowJob
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (hsurplus : S.surplusCap.card = 5)
    (hfirst : S.oppCap1.card = 4)
    (hsecond : S.oppCap2.card = 6)
    (hsecondInterior :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1,
          (lateFirstApexSystem R).centerAt packet.xv Q.hxvA,
          packet.xv, packet.xu})
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        ∃ blocker : Fin 5 → Label,
          ∃ cell : FrozenNextRowCell,
            cell.1 =
                (labeling.e P.jointDeletion.deleted, labeling.e P.v) ∧
              FrozenSafeCubeOK
                (labeledRowPattern carrierPattern labeling.e) ∧
              FrozenNextRowOnlyHitAddedConstraintsHold
                (labeledRowPattern carrierPattern labeling.e) blocker
                (labeling.e P.jointDeletion.deleted) (labeling.e P.v) ∧
              ∃ job :
                  CompiledNextRowJob cell.1.1 cell.1.2,
                job = nextRowJobForCell cell := by
  obtain ⟨carrierPattern, labeling, blocker, hplacement, hsafe, hadded⟩ :=
    exists_source_normalized_nextRowOnlyHitJob Q hcard hsurplus hfirst
      hsecond hsecondInterior hnextRowOnlyHit
  let cell : FrozenNextRowCell :=
    ⟨(labeling.e P.jointDeletion.deleted, labeling.e P.v), hplacement⟩
  refine ⟨carrierPattern, labeling, blocker, cell, ?_, hsafe, hadded, ?_⟩
  · rfl
  · exact ⟨nextRowJobForCell cell, rfl⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
