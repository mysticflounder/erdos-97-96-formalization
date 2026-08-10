/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BranchTransport

/-!
# Exact-twelve next-row-only-hit ingress

This module translates the source-proved next-row dichotomy into the frozen
twelve-label vocabulary.  It is a branch-specific producer for a successor
CEGAR schema, not a terminal nogood or a proof of the live Rigid221 leaf.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- Frozen form of the source-proved next-row dichotomy.

The witness `d` is the actual blocker of pinned label `7`, the blocker of
`xv`.  Its selected row contains `xu = 9` and omits `u = 6` and `xv = 8`.
Either the five centers `blocker 1`, `blocker 2`, `1`, `blocker 3`, and `d`
are distinct, or `d` is the actual `xu` blocker and the reciprocal incidence
`7 ∈ row (blocker 1)` holds.  The physical-cycle packet separately supplies
injectivity of `blocker` and identifies indices `1`, `2`, and `3` with the
actual blockers of `xu`, the joint-deletion point, and `v`.
-/
def FrozenNextRowOnlyHitDichotomy (row : RowPattern Label)
    (blocker : Fin 5 → Label) : Prop :=
  ∃ d,
    d ≠ 1 ∧ d ≠ 7 ∧
      7 ∈ row d ∧ 9 ∈ row d ∧ 6 ∉ row d ∧ 8 ∉ row d ∧
      (({blocker 1, blocker 2, 1, blocker 3, d} : Finset Label).card = 5 ∨
        (d = blocker 1 ∧ 7 ∈ row (blocker 1)))

/-- The geometric next-row producer compiles to
`FrozenNextRowOnlyHitDichotomy` for the same blocker map used by the physical
five-cycle ingress. -/
theorem frozenNextRowOnlyHitDichotomy_of_actualBlockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (carrierPattern : FaithfulCarrierPattern D.A)
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (blocker : Fin 5 → Label)
    (hblockerActual : ∀ i, blocker i = labeling.e
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
                P.v, ⟨packet.xv, Q.hxvA⟩] i).2).toCriticalFourShell.center_mem).2⟩)
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) :
    FrozenNextRowOnlyHitDichotomy
      (labeledRowPattern carrierPattern labeling.e) blocker := by
  classical
  let Hlate := lateFirstApexSystem R
  let Kxv := (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
  let c := Hlate.centerAt packet.xv Q.hxvA
  have hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
  let d := Hlate.centerAt c hcA
  have hdA : d ∈ D.A := (Finset.mem_erase.mp Kc.center_mem).2
  let dLabel : Label := labeling.e ⟨d, hdA⟩
  let row := labeledRowPattern carrierPattern labeling.e
  have hdNeO : d ≠ S.oppApex2 :=
    P.surface.secondApex_robust.centerAt_ne Hlate c hcA
  have hdNeC : d ≠ c := centerAt_ne_source Hlate c hcA
  have hdLabelNeOne : dLabel ≠ 1 := by
    intro h
    apply hdNeO
    calc
      d = (labeling.e.symm dLabel).1 := by simp [dLabel]
      _ = (labeling.e.symm 1).1 := congrArg
        (fun label => (labeling.e.symm label).1) h
      _ = S.oppApex2 := labeling.secondApex
  have hdLabelNeSeven : dLabel ≠ 7 := by
    intro h
    apply hdNeC
    calc
      d = (labeling.e.symm dLabel).1 := by simp [dLabel]
      _ = (labeling.e.symm 7).1 := congrArg
        (fun label => (labeling.e.symm label).1) h
      _ = c := by simpa [c, Hlate] using labeling.blockerXv
  have hrowIff (label : Label) :
      label ∈ row dLabel ↔
        (labeling.e.symm label).1 ∈ Kc.support := by
    simpa only [row, dLabel, d, Kc] using
      (mem_labeledRow_at_actualBlocker_iff carrierPattern labeling.e
        Hlate ⟨c, hcA⟩ label)
  have hsevenRow : 7 ∈ row dLabel := by
    apply (hrowIff 7).2
    simpa [c, Hlate, labeling.blockerXv] using Kc.q_mem_support
  have hnineRow : 9 ∈ row dLabel := by
    apply (hrowIff 9).2
    simpa only [labeling.xu] using hnextRowOnlyHit.1
  have hsixNotRow : 6 ∉ row dLabel := by
    intro h
    apply hnextRowOnlyHit.2.1
    have := (hrowIff 6).1 h
    simpa only [labeling.u] using this
  have heightNotRow : 8 ∉ row dLabel := by
    intro h
    apply hnextRowOnlyHit.2.2
    have := (hrowIff 8).1 h
    simpa only [labeling.xv] using this
  have hsource := nextRowOnlyHit_fiveDistinct_or_xuPositiveRowCollision
    Q hnextRowOnlyHit
  refine ⟨dLabel, hdLabelNeOne, hdLabelNeSeven, hsevenRow, hnineRow,
    hsixNotRow, heightNotRow, ?_⟩
  rcases hsource with hfive | hcollision
  · left
    let c0 := Hlate.centerAt packet.xu Q.hxuA
    let c1 := Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
    let c3 := Hlate.centerAt P.v.1 P.v.2
    let centersGeom : Finset ℝ² := {c0, c1, S.oppApex2, c3, d}
    have hcentersSubset : centersGeom ⊆ D.A := by
      intro x hx
      simp only [centersGeom, Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl | rfl | rfl
      · exact (Finset.mem_erase.mp
          (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell.center_mem).2
      · exact (Finset.mem_erase.mp
          (Hlate.selectedAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2).toCriticalFourShell.center_mem).2
      · rw [← labeling.secondApex]
        exact (labeling.e.symm 1).2
      · exact (Finset.mem_erase.mp
          (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.center_mem).2
      · exact hdA
    have hlabelsCard :
        (labelsOf labeling.e centersGeom).card = 5 := by
      rw [labelsOf_card_eq labeling.e hcentersSubset]
      simpa only [centersGeom, c0, c1, c3, d, Hlate] using hfive
    have hlabelsEq :
        labelsOf labeling.e centersGeom =
          {blocker 1, blocker 2, 1, blocker 3, dLabel} := by
      ext label
      have hlabelEq (x : CarrierLabel D.A) :
          (labeling.e.symm label).1 = x.1 ↔ label = labeling.e x := by
        constructor
        · intro h
          apply labeling.e.symm.injective
          simpa only [Equiv.symm_apply_apply] using
            (Subtype.ext h : labeling.e.symm label = x)
        · intro h
          simpa [h]
      have hO :
          (labeling.e.symm label).1 = S.oppApex2 ↔ label = 1 := by
        rw [← labeling.secondApex]
        constructor
        · intro h
          exact labeling.e.symm.injective (Subtype.ext h)
        · intro h
          simpa [h]
      simp only [mem_labelsOf_iff, centersGeom, Finset.mem_insert,
        Finset.mem_singleton, hO]
      rw [hlabelEq ⟨c0, hcentersSubset (by simp [centersGeom])⟩,
        hlabelEq ⟨c1, hcentersSubset (by simp [centersGeom])⟩,
        hlabelEq ⟨c3, hcentersSubset (by simp [centersGeom])⟩,
        hlabelEq ⟨d, hdA⟩]
      have hb1 := hblockerActual 1
      have hb2 := hblockerActual 2
      have hb3 := hblockerActual 3
      change blocker 1 = labeling.e
        ⟨Hlate.centerAt packet.xu Q.hxuA,
          (Finset.mem_erase.mp
            (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell.center_mem).2⟩
        at hb1
      change blocker 2 = labeling.e
        ⟨Hlate.centerAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2,
          (Finset.mem_erase.mp
            (Hlate.selectedAt P.jointDeletion.deleted.1
              P.jointDeletion.deleted.2).toCriticalFourShell.center_mem).2⟩
        at hb2
      change blocker 3 = labeling.e
        ⟨Hlate.centerAt P.v.1 P.v.2,
          (Finset.mem_erase.mp
            (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell.center_mem).2⟩
        at hb3
      simpa only [c0, c1, c3, Hlate, dLabel, hb1, hb2, hb3]
    rw [← hlabelsEq]
    exact hlabelsCard
  · right
    rcases hcollision with ⟨hdc0, _hxuKc, hcKxu⟩
    have hb1 := hblockerActual 1
    change blocker 1 = labeling.e
      ⟨Hlate.centerAt packet.xu Q.hxuA,
        (Finset.mem_erase.mp
          (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell.center_mem).2⟩
      at hb1
    constructor
    · rw [hb1]
      change labeling.e ⟨d, hdA⟩ = _
      exact congrArg labeling.e (Subtype.ext (by
        simpa only [d, Hlate] using hdc0))
    · have hrowXu :=
        (mem_labeledRow_at_actualBlocker_iff carrierPattern labeling.e
          Hlate ⟨packet.xu, Q.hxuA⟩ 7).2
          (by simpa [c, Hlate, labeling.blockerXv] using hcKxu)
      simpa only [row, hb1] using hrowXu

/-- The next-row dichotomy survives every admissible relabeling of the two
variable frozen roles.  In particular, it may be transported to a checked
placement representative without changing the named labels in the predicate.
-/
theorem FrozenNextRowOnlyHitDichotomy.reindex
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (relabeling : Label ≃ Label)
    (hadmissible : AdmissibleFrozenRelabeling relabeling)
    (hnext : FrozenNextRowOnlyHitDichotomy row blocker) :
    FrozenNextRowOnlyHitDichotomy (reindexRowPattern relabeling row)
      (reindexBlocker relabeling blocker) := by
  classical
  have honeInv := hadmissible.1 1 (by decide)
  have hsixInv := hadmissible.1 6 (by decide)
  have hsevenInv := hadmissible.1 7 (by decide)
  have heightInv := hadmissible.1 8 (by decide)
  have hnineInv := hadmissible.1 9 (by decide)
  have hone := hadmissible.apply_eq_self (i := 1) (by decide)
  have hseven := hadmissible.apply_eq_self (i := 7) (by decide)
  rcases hnext with
    ⟨d, hd1, hd7, hsevenRow, hnineRow, hsixMissing, heightMissing,
      hcenters | hcollision⟩
  · refine ⟨relabeling d, ?_, ?_, ?_, ?_, ?_, ?_, Or.inl ?_⟩
    · intro h
      exact hd1 (relabeling.injective (h.trans hone.symm))
    · intro h
      exact hd7 (relabeling.injective (h.trans hseven.symm))
    · simpa [hsevenInv] using hsevenRow
    · simpa [hnineInv] using hnineRow
    · simpa [hsixInv] using hsixMissing
    · simpa [heightInv] using heightMissing
    · have hmapCard :
          (({blocker 1, blocker 2, 1, blocker 3, d} : Finset Label).map
              relabeling.toEmbedding).card = 5 := by
          simpa only [Finset.card_map] using hcenters
      have hmapEq :
          ({blocker 1, blocker 2, 1, blocker 3, d} : Finset Label).map
              relabeling.toEmbedding =
            {relabeling (blocker 1), relabeling (blocker 2), relabeling 1,
              relabeling (blocker 3), relabeling d} := by
        ext label
        simp
      rw [hmapEq] at hmapCard
      simpa only [reindexBlocker, hone] using hmapCard
  · refine ⟨relabeling d, ?_, ?_, ?_, ?_, ?_, ?_, Or.inr ?_⟩
    · intro h
      exact hd1 (relabeling.injective (h.trans hone.symm))
    · intro h
      exact hd7 (relabeling.injective (h.trans hseven.symm))
    · simpa [hsevenInv] using hsevenRow
    · simpa [hnineInv] using hnineRow
    · simpa [hsixInv] using hsixMissing
    · simpa [heightInv] using heightMissing
    · refine ⟨congrArg relabeling hcollision.1, ?_⟩
      simpa [reindexBlocker, hsevenInv] using hcollision.2

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
