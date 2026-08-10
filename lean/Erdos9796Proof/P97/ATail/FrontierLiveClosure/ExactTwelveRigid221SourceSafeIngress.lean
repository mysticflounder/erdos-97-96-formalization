/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ConcreteRowsBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverSat
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary

/-!
# Live source ingress for the exact-twelve source-safe CNF

This module closes the source-to-finite ingress contract for the frozen
`C1/C2/C4` abstraction.  The exact-twelve residual supplies the exact cap and
strict-interior profile, the concrete-row bridge supplies a faithful carrier
pattern and frozen role labeling, and the safe-candidate bridge proves that
the resulting row family satisfies `FrozenSafeCubeOK`.

The resulting CNF is satisfiable, so this is an ingress theorem rather than a
contradiction.  Closing the live residual requires a separately source-proved
strengthening whose finite encoding excludes the surviving source-safe cubes.
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
open GenericRowNogoodCertificate

/-- Finite exact-twelve form of the five-row deletion boundary.

The deleted label is absent from five distinct selected rows.  Its chosen
actual blocker is distinct from the deleted label and from all five centers,
while the blocker row contains the deleted label.  This is the complete
incidence contract supplied by `FiveSurvivorFaithfulCarrierBoundary`; it does
not assert a metric core or a contradiction. -/
structure FrozenFiveOmissionBoundary
    (row : RowPattern Label) (deleted : Label) where
  blocker : Label
  centers : Finset Label
  centers_card : centers.card = 5
  blocker_ne_deleted : blocker ≠ deleted
  blocker_not_mem_centers : blocker ∉ centers
  deleted_mem_blocker_row : deleted ∈ row blocker
  deleted_not_mem_center_rows :
    ∀ center ∈ centers, deleted ∉ row center

/-- Relabel a faithful five-survivor boundary as the exact finite incidence
packet consumed by the next CEGAR search.  This theorem is independent of the
Rigid221 role normalization: any exact-twelve carrier equivalence transports
the same source-proved boundary. -/
theorem frozenFiveOmissionBoundary_of_faithfulCarrier
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄)
    (e : CarrierLabel D.A ≃ Label) :
    Nonempty
      (FrozenFiveOmissionBoundary
        (labeledRowPattern B.carrierPattern e) (e ⟨q, hq⟩)) := by
  classical
  let centersGeom : Finset ℝ² := {c₀, c₁, c₂, c₃, c₄}
  let centers := labelsOf e centersGeom
  let blocker := e (blockerLabel H q hq)
  have hcentersSubset : centersGeom ⊆ D.A := by
    intro x hx
    simp only [centersGeom, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl | rfl
    · exact B.c₀_mem
    · exact B.c₁_mem
    · exact B.c₂_mem
    · exact B.c₃_mem
    · exact B.c₄_mem
  have hcentersCard : centers.card = 5 := by
    calc
      centers.card = centersGeom.card :=
        labelsOf_card_eq e hcentersSubset
      _ = 5 := B.centers_card
  have hblockerNeDeleted : blocker ≠ e ⟨q, hq⟩ := by
    intro h
    have hsub : blockerLabel H q hq = (⟨q, hq⟩ : CarrierLabel D.A) :=
      e.injective h
    exact B.rows.actualBlocker_ne_deleted (congrArg Subtype.val hsub)
  have hblockerNotCenters : blocker ∉ centers := by
    intro hmem
    have hgeom : (e.symm blocker).1 ∈ centersGeom :=
      (mem_labelsOf_iff e centersGeom blocker).mp hmem
    have hblockerVal : (e.symm blocker).1 = H.centerAt q hq := by
      simp [blocker, blockerLabel]
    rw [hblockerVal] at hgeom
    simp only [centersGeom, Finset.mem_insert, Finset.mem_singleton] at hgeom
    rcases hgeom with h | h | h | h | h
    · exact B.rows.actualBlocker_ne₀ h
    · exact B.rows.actualBlocker_ne₁ h
    · exact B.rows.actualBlocker_ne₂ h
    · exact B.rows.actualBlocker_ne₃ h
    · exact B.rows.actualBlocker_ne₄ h
  have hdeletedBlocker :
      e ⟨q, hq⟩ ∈ labeledRowPattern B.carrierPattern e blocker := by
    have hsource :=
      source_mem_blocker_row B.carrierPattern H
        (⟨q, hq⟩ : CarrierLabel D.A)
    simpa [labeledRowPattern, blocker, mem_reindexRowPattern_iff] using hsource
  have hnot₀ :
      e ⟨q, hq⟩ ∉
        labeledRowPattern B.carrierPattern e (e ⟨c₀, B.c₀_mem⟩) := by
    intro hmem
    have hsupport :=
      (mem_labeledRowPattern_iff B.carrierPattern e
        (e ⟨c₀, B.c₀_mem⟩) (e ⟨q, hq⟩)).mp hmem
    have hcenter : e.symm (e ⟨c₀, B.c₀_mem⟩) = ⟨c₀, B.c₀_mem⟩ :=
      e.symm_apply_apply _
    have hpoint : e.symm (e ⟨q, hq⟩) = ⟨q, hq⟩ := e.symm_apply_apply _
    rw [hcenter, hpoint] at hsupport
    rw [B.classAt₀_eq] at hsupport
    change q ∈ B.rows.B₀ at hsupport
    exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.rows.K₀ hsupport
  have hnot₁ :
      e ⟨q, hq⟩ ∉
        labeledRowPattern B.carrierPattern e (e ⟨c₁, B.c₁_mem⟩) := by
    intro hmem
    have hsupport :=
      (mem_labeledRowPattern_iff B.carrierPattern e
        (e ⟨c₁, B.c₁_mem⟩) (e ⟨q, hq⟩)).mp hmem
    have hcenter : e.symm (e ⟨c₁, B.c₁_mem⟩) = ⟨c₁, B.c₁_mem⟩ :=
      e.symm_apply_apply _
    have hpoint : e.symm (e ⟨q, hq⟩) = ⟨q, hq⟩ := e.symm_apply_apply _
    rw [hcenter, hpoint] at hsupport
    rw [B.classAt₁_eq] at hsupport
    change q ∈ B.rows.B₁ at hsupport
    exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.rows.K₁ hsupport
  have hnot₂ :
      e ⟨q, hq⟩ ∉
        labeledRowPattern B.carrierPattern e (e ⟨c₂, B.c₂_mem⟩) := by
    intro hmem
    have hsupport :=
      (mem_labeledRowPattern_iff B.carrierPattern e
        (e ⟨c₂, B.c₂_mem⟩) (e ⟨q, hq⟩)).mp hmem
    have hcenter : e.symm (e ⟨c₂, B.c₂_mem⟩) = ⟨c₂, B.c₂_mem⟩ :=
      e.symm_apply_apply _
    have hpoint : e.symm (e ⟨q, hq⟩) = ⟨q, hq⟩ := e.symm_apply_apply _
    rw [hcenter, hpoint] at hsupport
    rw [B.classAt₂_eq] at hsupport
    change q ∈ B.rows.B₂ at hsupport
    exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.rows.K₂ hsupport
  have hnot₃ :
      e ⟨q, hq⟩ ∉
        labeledRowPattern B.carrierPattern e (e ⟨c₃, B.c₃_mem⟩) := by
    intro hmem
    have hsupport :=
      (mem_labeledRowPattern_iff B.carrierPattern e
        (e ⟨c₃, B.c₃_mem⟩) (e ⟨q, hq⟩)).mp hmem
    have hcenter : e.symm (e ⟨c₃, B.c₃_mem⟩) = ⟨c₃, B.c₃_mem⟩ :=
      e.symm_apply_apply _
    have hpoint : e.symm (e ⟨q, hq⟩) = ⟨q, hq⟩ := e.symm_apply_apply _
    rw [hcenter, hpoint] at hsupport
    rw [B.classAt₃_eq] at hsupport
    change q ∈ B.rows.B₃ at hsupport
    exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.rows.K₃ hsupport
  have hnot₄ :
      e ⟨q, hq⟩ ∉
        labeledRowPattern B.carrierPattern e (e ⟨c₄, B.c₄_mem⟩) := by
    intro hmem
    have hsupport :=
      (mem_labeledRowPattern_iff B.carrierPattern e
        (e ⟨c₄, B.c₄_mem⟩) (e ⟨q, hq⟩)).mp hmem
    have hcenter : e.symm (e ⟨c₄, B.c₄_mem⟩) = ⟨c₄, B.c₄_mem⟩ :=
      e.symm_apply_apply _
    have hpoint : e.symm (e ⟨q, hq⟩) = ⟨q, hq⟩ := e.symm_apply_apply _
    rw [hcenter, hpoint] at hsupport
    rw [B.classAt₄_eq] at hsupport
    change q ∈ B.rows.B₄ at hsupport
    exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.rows.K₄ hsupport
  have hdeletedNotCenters :
      ∀ center ∈ centers,
        e ⟨q, hq⟩ ∉ labeledRowPattern B.carrierPattern e center := by
    intro center hcenter
    have hgeom : (e.symm center).1 ∈ centersGeom :=
      (mem_labelsOf_iff e centersGeom center).mp hcenter
    simp only [centersGeom, Finset.mem_insert, Finset.mem_singleton] at hgeom
    rcases hgeom with h | h | h | h | h
    · have hcenterEq : center = e ⟨c₀, B.c₀_mem⟩ := by
        have hs : e.symm center = ⟨c₀, B.c₀_mem⟩ := by
          apply Subtype.ext
          exact h
        apply e.symm.injective
        simpa using hs
      simpa only [hcenterEq] using hnot₀
    · have hcenterEq : center = e ⟨c₁, B.c₁_mem⟩ := by
        have hs : e.symm center = ⟨c₁, B.c₁_mem⟩ := by
          apply Subtype.ext
          exact h
        apply e.symm.injective
        simpa using hs
      simpa only [hcenterEq] using hnot₁
    · have hcenterEq : center = e ⟨c₂, B.c₂_mem⟩ := by
        have hs : e.symm center = ⟨c₂, B.c₂_mem⟩ := by
          apply Subtype.ext
          exact h
        apply e.symm.injective
        simpa using hs
      simpa only [hcenterEq] using hnot₂
    · have hcenterEq : center = e ⟨c₃, B.c₃_mem⟩ := by
        have hs : e.symm center = ⟨c₃, B.c₃_mem⟩ := by
          apply Subtype.ext
          exact h
        apply e.symm.injective
        simpa using hs
      simpa only [hcenterEq] using hnot₃
    · have hcenterEq : center = e ⟨c₄, B.c₄_mem⟩ := by
        have hs : e.symm center = ⟨c₄, B.c₄_mem⟩ := by
          apply Subtype.ext
          exact h
        apply e.symm.injective
        simpa using hs
      simpa only [hcenterEq] using hnot₄
  exact ⟨{
    blocker := blocker
    centers := centers
    centers_card := hcentersCard
    blocker_ne_deleted := hblockerNeDeleted
    blocker_not_mem_centers := hblockerNotCenters
    deleted_mem_blocker_row := hdeletedBlocker
    deleted_not_mem_center_rows := hdeletedNotCenters
  }⟩

/-- Close a five-survivor faithful carrier as soon as a finite or geometric
producer supplies one of the already-formalized generic metric cores.

This is the source-clean consumer for the distinct-center arm.  It does not
produce `MetricCoreAlternative`; finite search remains responsible for a
replayable coverage theorem on the same carrier pattern. -/
theorem false_of_fiveSurvivorFaithfulCarrierBoundary_metricCore
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄)
    (hcore : MetricCoreAlternative B.carrierPattern) :
    False := by
  exact false_of_metricCoreAlternative B.carrierPattern D.convex hcore

/-- Install the source-proved five-row boundary in the frozen Rigid221 role
vocabulary.  This is the exact source-to-finite adapter required before a
five-omission CEGAR result can be promoted.  It proves neither finite coverage
nor any `MetricCoreAlternative`. -/
theorem exists_frozenRoleLabeling_with_fiveOmissionBoundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄) :
    ∃ labeling : FrozenRoleLabeling Q B.carrierPattern,
      FrozenSafeCubeOK
          (labeledRowPattern B.carrierPattern labeling.e) ∧
        Nonempty
          (FrozenFiveOmissionBoundary
            (labeledRowPattern B.carrierPattern labeling.e)
            (labeling.e ⟨q, hq⟩)) := by
  rcases exists_frozen_role_labeling Q hcard B.carrierPattern with
    ⟨labeling⟩
  rcases pentagonOffClassBlocker_card_twelve_exact_cap_profile
      P packet Q hcard with
    ⟨hsurplus, hfirst, hsecond, hsecondInterior, _growth⟩
  let interiors := labeling.interiorProfile
    hsurplus hfirst hsecond hsecondInterior
  let caps := interiors.closedCapProfile hsurplus hfirst hsecond
  exact
    ⟨labeling,
      labeling.safeCubeOK interiors caps,
      frozenFiveOmissionBoundary_of_faithfulCarrier B labeling.e⟩

/-- Every live exact-twelve pentagon-off-class residual induces a proof-facing
source-safe row family.  The carrier pattern is chosen by the concrete-row
producer, so future source-proved clauses may strengthen this ingress without
changing the role labeling. -/
theorem exists_source_safeCubeOK
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        FrozenSafeCubeOK
          (labeledRowPattern carrierPattern labeling.e) := by
  classical
  obtain ⟨carrierPattern, ⟨labeling⟩, _hphysical, _hxv, _hnext⟩ :=
    exists_frozen_role_labeling_for_xuConcreteRows Q hcard
  rcases pentagonOffClassBlocker_card_twelve_exact_cap_profile
      P packet Q hcard with
    ⟨hsurplus, hfirst, hsecond, hsecondInterior, _growth⟩
  let interiors := labeling.interiorProfile
    hsurplus hfirst hsecond hsecondInterior
  let caps := interiors.closedCapProfile hsurplus hfirst hsecond
  exact ⟨carrierPattern, labeling, labeling.safeCubeOK interiors caps⟩

/-- Direct source-to-CNF ingress.  This theorem states the sound direction of
the abstraction only; it does not turn satisfiability into source
realizability or discharge any live contradiction. -/
theorem source_safeCoverCnf_sat
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) :
    ∃ τ : Nat → Bool,
      Std.Sat.CNF.eval τ SafeCoverCnf.baseCnf = true := by
  obtain ⟨_carrierPattern, _labeling, hsafe⟩ :=
    exists_source_safeCubeOK Q hcard
  exact safeCoverCnf_sat_of_safeCubeOK hsafe

/-- In the exact-twelve `nextRowOnlyHit` arm, deleting `u` leaves an exact
eleven-point carrier with five exact q-free K4 rows and the distinct actual
blocker where deletion fails.

This is a source-clean finite ingress theorem.  It does not assert that the
five rows satisfy a terminal nogood or close the live residual. -/
theorem uDeletion_exactEleven_fiveSurvivorRows_of_u_not_mem_nextRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12)
    (huNotKc :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      P.u.1 ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let d := Hlate.centerAt c hcA
    (D.A.erase P.u.1).card = 11 ∧
      Nonempty
        (ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
          D H P.u.1 P.u.2
          (Hlate.centerAt packet.xu Q.hxuA)
          (Hlate.centerAt P.jointDeletion.deleted.1
            P.jointDeletion.deleted.2)
          S.oppApex2
          (Hlate.centerAt P.v.1 P.v.2)
          d) := by
  exact
    pentagonOffClassBlocker_uDeletion_exactEleven_fiveSurvivorRows_of_u_not_mem_nextRow
      Q hcard huNotKc

/-- The five rows exposed by the exact-eleven deletion boundary either have
five distinct centers, or the iterated blocker row is exactly the `xu` row.
In the collision arm equality of actual blockers forces equality of the
selected supports, so `xu` and the first off-class blocker are mutually
incident.

The other two a priori collision arms are impossible from the live data:
collision with the deleted-source row contradicts `xu ∉ Kdeleted`, while
collision with the `v` row contradicts `xv ∉ Kc` and `xv ∈ Kv`.

This is a source-level producer for the next finite/geometry consumer.  It is
not itself a terminal nogood. -/
theorem nextRowOnlyHit_fiveDistinct_or_xuPositiveRowCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hnextRowOnlyHit :
      let Hlate := lateFirstApexSystem R
      let Kxv :=
        (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
      let c := Hlate.centerAt packet.xv Q.hxvA
      let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
      let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
      packet.xu ∈ Kc.support ∧
        P.u.1 ∉ Kc.support ∧ packet.xv ∉ Kc.support) :
    let Hlate := lateFirstApexSystem R
    let Kxv :=
      (Hlate.selectedAt packet.xv Q.hxvA).toCriticalFourShell
    let c := Hlate.centerAt packet.xv Q.hxvA
    let hcA : c ∈ D.A := (Finset.mem_erase.mp Kxv.center_mem).2
    let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
    let d := Hlate.centerAt c hcA
    let Kxu :=
      (Hlate.selectedAt packet.xu Q.hxuA).toCriticalFourShell
    let Kdeleted :=
      (Hlate.selectedAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell
    let Kv := (Hlate.selectedAt P.v.1 P.v.2).toCriticalFourShell
    let c0 := Hlate.centerAt packet.xu Q.hxuA
    let c1 := Hlate.centerAt P.jointDeletion.deleted.1
      P.jointDeletion.deleted.2
    let c3 := Hlate.centerAt P.v.1 P.v.2
    ({c0, c1, S.oppApex2, c3, d} : Finset ℝ²).card = 5 ∨
      (d = c0 ∧ packet.xu ∈ Kc.support ∧ c ∈ Kxu.support) := by
  exact
    pentagonOffClassBlocker_nextRowOnlyHit_fiveDistinct_or_xuPositiveRowCollision
      Q hnextRowOnlyHit

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
