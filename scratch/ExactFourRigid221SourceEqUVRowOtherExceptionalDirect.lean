/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherMain

/-!
# Exact-four source-equals-u cross-row blocker: exceptional arm

This file works only on the exceptional constructor of the source-clean
cross-row blocker residual.  It keeps the complete production context, the
two named row companions, the complete terminal, the identification of the
source blocker with `xv`, and the exceptional packet.

The theorem below exposes the strongest unconditional direct normalization
currently obtained from those data:

* the source is the unique strict-cap member of its named row pair;
* the actual source blocker is the non-`v` point of the named `v` row;
* the `v` pair has its exact one-in/one-out orientation;
* `other` has its exact contextual three-way placement and orientation; and
* the terminal boundary order is rewritten so that its named points are
  literally `source`, `xv`, and `xu`, hence are pairwise distinct.

The exact remaining direct lemma is to derive `False` from the parameters of
`exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_direct_narrowing`.
No conditional closer for that step is introduced here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Direct, source-clean normalization of the exceptional cross-row-blocker
branch.  Every load-bearing datum of the exceptional residual remains an
explicit parameter. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_direct_narrowing
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (packet :
      ExactFourRigid221PhysicalFiveExceptionalArm
        R P.rho P.u P.other P.u P.v P.jointDeletion
          P.globalDeletion xu xv) :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv ∧
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho ∧
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1 ∧
    (P.source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      xu ∉ S.capInteriorByIndex S.oppIndex2) ∧
    ({P.source.1, xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 = {P.source.1} ∧
    ((lateFirstApexSystem R).selectedAt
        P.source.1 P.source.2).toCriticalFourShell.support ∩
      (SelectedClass D.A S.oppApex2 P.rho ∩
        S.capInteriorByIndex S.oppIndex2) = {P.source.1} ∧
    ((P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xv ∉ S.capInteriorByIndex S.oppIndex2 ∧
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 = {P.v.1}) ∨
      (P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
        xv ∈ S.capInteriorByIndex S.oppIndex2 ∧
        ({P.v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 = {xv})) ∧
    ((P.other = P.jointDeletion.deleted ∧
        P.jointDeletion.deleted.1 ∈
          S.capInteriorByIndex S.oppIndex2) ∨
      (P.other = P.v ∧
        P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xv ∉ S.capInteriorByIndex S.oppIndex2) ∨
      (P.other.1 = xv ∧
        P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
        xv ∈ S.capInteriorByIndex S.oppIndex2)) ∧
    xv ≠ P.source.1 ∧
    xv ≠ xu ∧
    P.source.1 ≠ xu ∧
    ∃ (card_pos : 0 < D.A.card)
        (boundary : Fin D.A.card → ℝ²)
        (blocker_index source_index companion_index : Fin D.A.card),
      Function.Injective boundary ∧
      Finset.univ.image boundary = D.A ∧
      EuclideanGeometry.IsCcwConvexPolygon boundary ∧
      boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
      boundary blocker_index = xv ∧
      boundary source_index = P.source.1 ∧
      boundary companion_index = xu ∧
      ((source_index < blocker_index ∧
          blocker_index < companion_index) ∨
        (companion_index < blocker_index ∧
          blocker_index < source_index)) := by
  classical
  have hu_orientation :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xu ∉ S.capInteriorByIndex S.oppIndex2 := by
    rcases packet.contextual_trace with hsource | hnotSource
    · exact ⟨hsource.2.1, hsource.2.2.1⟩
    · exact (hnotSource.1 rfl).elim
  have hu_pair_trace :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 = {P.u.1} := by
    rcases packet.u_interior_trace with hinside | houtside
    · exact hinside.2.2
    · exact (houtside.1 hu_orientation.1).elim
  have hsource_orientation :
      P.source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        xu ∉ S.capInteriorByIndex S.oppIndex2 := by
    simpa [P.huSource] using hu_orientation
  have hsource_pair_trace :
      ({P.source.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 = {P.source.1} := by
    simpa [P.huSource] using hu_pair_trace
  have hu_row_interior :
      ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex2 P.rho ∩
          S.capInteriorByIndex S.oppIndex2) = {P.u.1} := by
    rw [← Finset.inter_assoc, terminal.named_rows.u_row_trace]
    simp [hu_orientation.1, hu_orientation.2]
  have hsource_row_interior :
      ((lateFirstApexSystem R).selectedAt
          P.source.1 P.source.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex2 P.rho ∩
          S.capInteriorByIndex S.oppIndex2) = {P.source.1} := by
    rw [← P.huSource]
    exact hu_row_interior
  have hxv_v_row :
      xv ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [terminal.named_rows.v_row_trace]
    simp
  have hblocker_v_row :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    rw [blocker_eq]
    exact hxv_v_row
  have hblocker_ne_v :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠
        P.v.1 := by
    rw [blocker_eq]
    exact packet.named_rows.xv_ne_v
  have hother_orientation :
      P.other = P.jointDeletion.deleted ∨
        (P.other = P.v ∧
          P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
          xv ∉ S.capInteriorByIndex S.oppIndex2) ∨
        (P.other.1 = xv ∧
          P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
          xv ∈ S.capInteriorByIndex S.oppIndex2) := by
    rcases packet.contextual_trace with hsource | hnotSource
    · exact hsource.2.2.2
    · exact (hnotSource.1 rfl).elim
  have hother_exact :
      (P.other = P.jointDeletion.deleted ∧
          P.jointDeletion.deleted.1 ∈
            S.capInteriorByIndex S.oppIndex2) ∨
        (P.other = P.v ∧
          P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
          xv ∉ S.capInteriorByIndex S.oppIndex2) ∨
        (P.other.1 = xv ∧
          P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 ∧
          xv ∈ S.capInteriorByIndex S.oppIndex2) := by
    rcases hother_orientation with hdeleted | hv | hxv
    · exact Or.inl ⟨hdeleted, packet.deleted_mem_interior⟩
    · exact Or.inr (Or.inl hv)
    · exact Or.inr (Or.inr hxv)
  rcases terminal.boundary_order with
    ⟨card_pos, boundary, blocker_index, source_index, companion_index,
      hinj, himage, hccw, hzero, hblocker, hsource, hcompanion, hbetween⟩
  have hblocker_xv : boundary blocker_index = xv := by
    calc
      boundary blocker_index =
          (lateFirstApexSystem R).centerAt P.u.1 P.u.2 := hblocker
      _ = (lateFirstApexSystem R).centerAt
          P.source.1 P.source.2 := by rw [P.huSource]
      _ = xv := blocker_eq
  have hboundary_source : boundary source_index = P.source.1 := by
    simpa [P.huSource] using hsource
  have hblocker_index_ne_source : blocker_index ≠ source_index := by
    omega
  have hblocker_index_ne_companion :
      blocker_index ≠ companion_index := by
    omega
  have hsource_index_ne_companion :
      source_index ≠ companion_index := by
    omega
  have hxv_ne_source : xv ≠ P.source.1 := by
    intro heq
    apply hblocker_index_ne_source
    apply hinj
    calc
      boundary blocker_index = xv := hblocker_xv
      _ = P.source.1 := heq
      _ = boundary source_index := hboundary_source.symm
  have hxv_ne_xu : xv ≠ xu := by
    intro heq
    apply hblocker_index_ne_companion
    apply hinj
    calc
      boundary blocker_index = xv := hblocker_xv
      _ = xu := heq
      _ = boundary companion_index := hcompanion.symm
  have hsource_ne_xu : P.source.1 ≠ xu := by
    intro heq
    apply hsource_index_ne_companion
    apply hinj
    calc
      boundary source_index = P.source.1 := hboundary_source
      _ = xu := heq
      _ = boundary companion_index := hcompanion.symm
  refine
    ⟨blocker_eq, hblocker_v_row, hblocker_ne_v,
      hsource_orientation, hsource_pair_trace, hsource_row_interior,
      packet.v_interior_trace, hother_exact, hxv_ne_source, hxv_ne_xu,
      hsource_ne_xu, ?_⟩
  exact
    ⟨card_pos, boundary, blocker_index, source_index, companion_index,
      hinj, himage, hccw, hzero, hblocker_xv, hboundary_source,
      hcompanion, hbetween⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_exceptional_direct_narrowing

end ATailFrontierLiveClosure
end Problem97
