/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowOnlyHitIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NormalizedSafeIngress

/-!
# Normalized exact-twelve next-row-only-hit ingress

This module transports the source-produced physical five-cycle packet and the
next-row dichotomy to one of the checked separated placement representatives.
It is the finite ingress contract for a separate successor CEGAR schema.  It is
not finite coverage, a terminal nogood, or a proof of the live Rigid221 leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- Every source model in the next-row-only-hit branch yields a normalized
frozen physical-cycle model satisfying the branch-specific dichotomy. -/
theorem exists_source_normalized_physicalCycle_nextRowOnlyHitDichotomy
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
        let row := labeledRowPattern carrierPattern labeling.e
        let Hlate := lateFirstApexSystem R
        let C := SelectedClass D.A S.oppApex2 P.rho
        let BO := SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho
        let sources : Fin 5 → CriticalShellSystem.CarrierVertex D.A := fun i => ![
          P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
          P.v, ⟨packet.xv, Q.hxvA⟩] i
        let edges : Fin 5 → Finset ℝ² := fun i => ![
          ({P.u.1, packet.xu} : Finset ℝ²),
          {packet.xu, P.jointDeletion.deleted.1},
          {P.jointDeletion.deleted.1, P.v.1},
          {P.v.1, packet.xv},
          {packet.xv, P.u.1}] i
        (labeling.e P.jointDeletion.deleted, labeling.e P.v) ∈
            frozenSeparatedPlacementRepresentatives ∧
          FrozenSafeCubeOK row ∧
          row 1 = labelsOf labeling.e BO ∧
          labeling.e P.jointDeletion.deleted ∈ row 1 ∧
          labeling.e P.v ∈ row 1 ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈ surplusCapLabels ∧
            labeling.e P.v ∈ surplusCapLabels) ∧
          ¬ (labeling.e P.jointDeletion.deleted ∈
                firstOppositeCapLabels ∧
            labeling.e P.v ∈ firstOppositeCapLabels) ∧
          ∃ blocker : Fin 5 → Label,
            Function.Injective blocker ∧
              blocker 0 = 8 ∧ blocker 4 = 7 ∧
              (∀ i, blocker i = labeling.e
                ⟨Hlate.centerAt (sources i).1 (sources i).2,
                  (Finset.mem_erase.mp
                    (Hlate.selectedAt (sources i).1
                      (sources i).2).toCriticalFourShell.center_mem).2⟩) ∧
              (∀ i, blocker i ≠ labeling.e (sources i)) ∧
              (∀ i, blocker i ≠ 1) ∧
              (∀ i, row (blocker i) ∩ labelsOf labeling.e C =
                labelsOf labeling.e (edges i)) ∧
              FrozenNextRowOnlyHitDichotomy row blocker := by
  classical
  obtain ⟨carrierPattern, labeling, _hsafe, hphysicalRow, hdeletedRow,
      hvRow, hnotSurplus, hnotFirst, blocker, hblockerInjective,
      hblockerU, hblockerXv, hblockerActual, hblockerNeSource,
      hblockerNeSecondApex, hrowTrace⟩ :=
    exists_source_safeCubeOK_with_physicalCycleBlockers Q hcard
  let oldRow := labeledRowPattern carrierPattern labeling.e
  have hnext : FrozenNextRowOnlyHitDichotomy oldRow blocker :=
    frozenNextRowOnlyHitDichotomy_of_actualBlockers Q carrierPattern labeling
      blocker hblockerActual hnextRowOnlyHit
  let placement : Label × Label :=
    (labeling.e P.jointDeletion.deleted, labeling.e P.v)
  have hplacement : placement ∈ frozenSeparatedPlacementDomain :=
    labeling.separatedPlacement_mem hnotSurplus hnotFirst
  let relabeling := normalizingRelabeling placement
  have hadmissible : AdmissibleFrozenRelabeling relabeling :=
    normalizingRelabeling_admissible placement
  let normalized : FrozenRoleLabeling Q carrierPattern :=
    labeling.relabel_of_admissible relabeling hadmissible
  let normalizedBlocker : Fin 5 → Label := reindexBlocker relabeling blocker
  let newRow := labeledRowPattern carrierPattern normalized.e
  have hrowEq : newRow = reindexRowPattern relabeling oldRow := by
    simpa [newRow, oldRow, normalized,
      FrozenRoleLabeling.relabel_of_admissible,
      FrozenRoleLabeling.relabel] using
        labeledRowPattern_trans carrierPattern labeling.e relabeling
  have hnormalizedPlacement :
      (normalized.e P.jointDeletion.deleted, normalized.e P.v) =
        normalizePlacement placement := by
    rfl
  have hnormalizedSeparated :
      (normalized.e P.jointDeletion.deleted, normalized.e P.v) ∈
        frozenSeparatedPlacementDomain := by
    rw [hnormalizedPlacement]
    exact normalizePlacement_mem_separatedDomain placement hplacement
  have hrepresentative :
      (normalized.e P.jointDeletion.deleted, normalized.e P.v) ∈
        frozenSeparatedPlacementRepresentatives := by
    rw [hnormalizedPlacement]
    exact Finset.mem_image.mpr ⟨placement, hplacement, rfl⟩
  have hinteriors : FrozenInteriorProfile normalized :=
    normalized.interiorProfile hsurplus hfirst hsecond hsecondInterior
  have hcaps : FrozenClosedCapProfile normalized :=
    hinteriors.closedCapProfile hsurplus hfirst hsecond
  have hsafe : FrozenSafeCubeOK newRow :=
    normalized.safeCubeOK hinteriors hcaps
  have hone : relabeling 1 = 1 :=
    hadmissible.apply_eq_self (by decide)
  have height : relabeling 8 = 8 :=
    hadmissible.apply_eq_self (by decide)
  have hseven : relabeling 7 = 7 :=
    hadmissible.apply_eq_self (by decide)
  have hphysicalRow' :
      newRow 1 = labelsOf normalized.e
        (SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho) := by
    calc
      newRow 1 = reindexRowPattern relabeling oldRow 1 :=
        congrFun hrowEq 1
      _ = reindexRowPattern relabeling oldRow (relabeling 1) := by
        rw [hone]
      _ = (oldRow 1).map relabeling.toEmbedding :=
        rowFiber_reindex relabeling oldRow 1
      _ = (labelsOf labeling.e
          (SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho)).map
            relabeling.toEmbedding := by
        exact congrArg (Finset.map relabeling.toEmbedding)
          (by simpa [oldRow] using hphysicalRow)
      _ = labelsOf (labeling.e.trans relabeling)
          (SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho) := by
        rw [labelsOf_trans_map]
      _ = labelsOf normalized.e
          (SelectedClass (D.A.erase packet.xu) S.oppApex2 P.rho) := by
        rfl
  have hdeletedRow' : normalized.e P.jointDeletion.deleted ∈ newRow 1 := by
    rw [hrowEq]
    change relabeling (labeling.e P.jointDeletion.deleted) ∈
      reindexRowPattern relabeling oldRow 1
    rw [← hone]
    simpa [oldRow, mem_reindexRowPattern_iff] using hdeletedRow
  have hvRow' : normalized.e P.v ∈ newRow 1 := by
    rw [hrowEq]
    change relabeling (labeling.e P.v) ∈
      reindexRowPattern relabeling oldRow 1
    rw [← hone]
    simpa [oldRow, mem_reindexRowPattern_iff] using hvRow
  have hblockerInjective' : Function.Injective normalizedBlocker := by
    intro i j hij
    apply hblockerInjective
    exact relabeling.injective hij
  have hblockerU' : normalizedBlocker 0 = 8 := by
    simp [normalizedBlocker, reindexBlocker, hblockerU, height]
  have hblockerXv' : normalizedBlocker 4 = 7 := by
    simp [normalizedBlocker, reindexBlocker, hblockerXv, hseven]
  have hblockerActual' : ∀ i, normalizedBlocker i = normalized.e
      ⟨(lateFirstApexSystem R).centerAt
          (![P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
              P.v, ⟨packet.xv, Q.hxvA⟩] i).1
          (![P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
              P.v, ⟨packet.xv, Q.hxvA⟩] i).2,
        (Finset.mem_erase.mp
          ((lateFirstApexSystem R).selectedAt
            (![P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
                P.v, ⟨packet.xv, Q.hxvA⟩] i).1
            (![P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
                P.v, ⟨packet.xv, Q.hxvA⟩] i).2).toCriticalFourShell.center_mem).2⟩ := by
    intro i
    exact congrArg relabeling (hblockerActual i)
  have hblockerNeSource' : ∀ i, normalizedBlocker i ≠ normalized.e
      (![P.u, ⟨packet.xu, Q.hxuA⟩, P.jointDeletion.deleted,
          P.v, ⟨packet.xv, Q.hxvA⟩] i) := by
    intro i
    exact relabeling.injective.ne (hblockerNeSource i)
  have hblockerNeSecondApex' : ∀ i, normalizedBlocker i ≠ 1 := by
    intro i hi
    apply hblockerNeSecondApex i
    apply relabeling.injective
    simpa [normalizedBlocker, reindexBlocker, hone] using hi
  have hrowTrace' : ∀ i,
      newRow (normalizedBlocker i) ∩
          labelsOf normalized.e (SelectedClass D.A S.oppApex2 P.rho) =
        labelsOf normalized.e (![({P.u.1, packet.xu} : Finset ℝ²),
          {packet.xu, P.jointDeletion.deleted.1},
          {P.jointDeletion.deleted.1, P.v.1},
          {P.v.1, packet.xv}, {packet.xv, P.u.1}] i) := by
    intro i
    rw [hrowEq]
    simpa [normalizedBlocker, normalized,
      FrozenRoleLabeling.relabel_of_admissible,
      FrozenRoleLabeling.relabel] using
        rowTrace_reindex labeling.e relabeling oldRow (blocker i)
          (SelectedClass D.A S.oppApex2 P.rho)
          (![({P.u.1, packet.xu} : Finset ℝ²),
            {packet.xu, P.jointDeletion.deleted.1},
            {P.jointDeletion.deleted.1, P.v.1},
            {P.v.1, packet.xv}, {packet.xv, P.u.1}] i)
          (hrowTrace i)
  have hnext' :
      FrozenNextRowOnlyHitDichotomy newRow normalizedBlocker := by
    rw [hrowEq]
    exact hnext.reindex relabeling hadmissible
  refine ⟨carrierPattern, normalized, hrepresentative, hsafe,
    hphysicalRow', hdeletedRow', hvRow', ?_, ?_, normalizedBlocker,
    hblockerInjective', hblockerU', hblockerXv', hblockerActual',
    hblockerNeSource', hblockerNeSecondApex', hrowTrace', hnext'⟩
  · exact (mem_frozenSeparatedPlacementDomain_iff _ _).1
      hnormalizedSeparated |>.2.1
  · exact (mem_frozenSeparatedPlacementDomain_iff _ _).1
      hnormalizedSeparated |>.2.2

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
