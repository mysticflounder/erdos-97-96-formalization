/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowDispatcher
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SameBoundaryOrderIngress

/-!
# Boundary-order adapter for the exact-twelve next-row lane

The next-row dispatcher already supplies a source-normalized cell, row, and
blocker map.  This module exposes the other hypotheses required by the
source-order terminal consumer: the strict-cap profile, one common boundary
order, its forced second-cap orientation, realization, and convex independence.
It is intentionally conditional on the terminal bank; it does not claim that
the existing four arm certificates cover the twelve cells.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open FrozenNextRowJobCnf
open GenericRowNogoodCertificate
open NextRowTerminalBankConsumer
open SourceOrderTerminalBankConsumer
open TerminalBankConsumer

/- The relabeled carrier points enumerate the original finite carrier. -/
private theorem labeledPointImage_eq
    {A : Finset ℝ²} (e : CarrierLabel A ≃ Label) :
    (Finset.univ : Finset Label).image
        (fun label => (e.symm label).1) = A := by
  classical
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨label, _hlabel, rfl⟩
    exact (e.symm label).2
  · intro hx
    let source : CarrierLabel A := ⟨x, hx⟩
    refine Finset.mem_image.mpr ⟨e source, Finset.mem_univ _, ?_⟩
    simpa [source] using congrArg Subtype.val (e.symm_apply_apply source)

/-- A source-normalized next-row branch with every geometric prerequisite of a
source-order terminal bank made explicit.  The `job` equality identifies the
source-produced cell with the checked finite dispatch. -/
theorem exists_source_namedNextRowBoundaryJob
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
            ∃ job : CompiledNextRowJob cell.1.1 cell.1.2,
              cell.1 =
                  (labeling.e P.jointDeletion.deleted, labeling.e P.v) ∧
                FrozenSafeCubeOK
                  (labeledRowPattern carrierPattern labeling.e) ∧
                FrozenNextRowOnlyHitAddedConstraintsHold
                  (labeledRowPattern carrierPattern labeling.e) blocker
                  (labeling.e P.jointDeletion.deleted) (labeling.e P.v) ∧
                job = nextRowJobForCell cell ∧
                FrozenInteriorProfile labeling ∧
                (∃ order : FrozenBoundaryOrder
                    (fun label => (labeling.e.symm label).1),
                  FrozenForcedSecondCapOrder order.position ∧
                  Realizes (labeledRowPattern carrierPattern labeling.e)
                    (fun label => (labeling.e.symm label).1) ∧
                  ConvexIndep
                    ((Finset.univ : Finset Label).image
                      (fun label => (labeling.e.symm label).1))) := by
  obtain ⟨carrierPattern, labeling, blocker, cell, hcell, hsafe, hadded,
      job, hjob⟩ := exists_source_namedNextRowJob Q hcard hsurplus hfirst
    hsecond hsecondInterior hnextRowOnlyHit
  let interiors : FrozenInteriorProfile labeling :=
    labeling.interiorProfile hsurplus hfirst hsecond hsecondInterior
  obtain ⟨order, hforced⟩ :=
    FrozenRoleLabeling.exists_frozenBoundaryOrder_with_forced_secondCap
      labeling interiors hcard
  have hreal :
      Realizes (labeledRowPattern carrierPattern labeling.e)
        (fun label => (labeling.e.symm label).1) := by
    simpa [Census554.GeneralCarrierBridge.pointOf] using labeling.realizes
  have hconv :
      ConvexIndep
        ((Finset.univ : Finset Label).image
          (fun label => (labeling.e.symm label).1)) := by
    rw [labeledPointImage_eq labeling.e]
    exact D.convex
  exact ⟨carrierPattern, labeling, blocker, cell, job, hcell, hsafe, hadded,
    hjob, interiors, order, hforced, hreal, hconv⟩

/-- If a sound terminal bank is supplied for each of the twelve dispatched
cells, the source-normalized next-row branch is contradictory.  This is the
remaining bank-coverage interface, not a claim that such a bank is present. -/
theorem false_of_source_namedNextRowTerminalBank
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
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support)
    (bank : FrozenNextRowCell → List SourceOrderPositiveNogood)
    (hencodable : ∀ (cell : FrozenNextRowCell) (nogood : SourceOrderPositiveNogood),
      nogood ∈ bank cell → ∀ (choice : RowChoice Label), choice ∈ nogood.choices →
        FrozenSafeCandidateAt choice.center choice.support)
    (hterminal : ∀ cell : FrozenNextRowCell,
      DimacsUnsatisfiable
        (terminalDimacs (nextRowJobForCell cell) (bank cell))) : False := by
  obtain ⟨carrierPattern, labeling, blocker, cell, job, hcell, hsafe, hadded,
      hjob, interiors, order, hforced, hreal, hconv⟩ :=
    exists_source_namedNextRowBoundaryJob Q hcard hsurplus hfirst hsecond
      hsecondInterior hnextRowOnlyHit
  have haddedCell :
      FrozenNextRowOnlyHitAddedConstraintsHold
        (labeledRowPattern carrierPattern labeling.e) blocker
        cell.1.1 cell.1.2 := by
    simpa only [hcell] using hadded
  have hterminal' :
      DimacsUnsatisfiable (terminalDimacs job (bank cell)) := by
    simpa [hjob] using hterminal cell
  exact false_of_terminalNextRowSourceOrderBank hsafe haddedCell hreal order
    hforced hconv job (bank cell) (hencodable cell) hterminal'

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
