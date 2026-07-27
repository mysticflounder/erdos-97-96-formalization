/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import scratch.ExactFourRigid221SourceEqUTerminal

/-!
# Exact-four rigid `2+2+1`: the source-equals-`u`, `u`-heavy residual

The `u`-heavy terminal fixes exactly two points of the source critical shell
inside the indexed cap.  Since that shell has cardinality four, its complement
in the cap is an exact pair.  This file extracts that pair without adding an
axiom.

The terminal packet does not name a second cap center bisecting this outside
pair.  The final theorem below records the exact additional geometric bridge
that would close this branch by ordered-cap uniqueness.  The bridge is a
`PARKED-SPEC`, not a promoted proof obligation.
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

/-- The exact pair of source-shell points outside the second indexed cap in
the `u`-heavy branch. -/
structure ExactFourRigid221SourceEqUUHeavyOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (source : CarrierVertex D.A) : Type where
  left : ℝ²
  right : ℝ²
  left_ne_right : left ≠ right
  outside_trace :
    ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support \
      S.capByIndex S.oppIndex2 = {left, right}
  left_mem_A : left ∈ D.A
  right_mem_A : right ∈ D.A
  left_not_mem_cap : left ∉ S.capByIndex S.oppIndex2
  right_not_mem_cap : right ∉ S.capByIndex S.oppIndex2
  blocker_mem_cap :
    (lateFirstApexSystem R).centerAt source.1 source.2 ∈
      S.capByIndex S.oppIndex2
  blocker_equidistant :
    dist ((lateFirstApexSystem R).centerAt source.1 source.2) left =
      dist ((lateFirstApexSystem R).centerAt source.1 source.2) right

/-- A `u`-heavy source shell has exactly two points outside the indexed cap.
This is the strongest unconditional conclusion supplied by the current
terminal packet about those two points. -/
theorem nonempty_exactFourRigid221_sourceEqU_uHeavyOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {source other v : CarrierVertex D.A}
    {jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho source v}
    {G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho source v jointDeletion}
    {xu xv : ℝ²}
    (T : ExactFourRigid221SourceEqUTerminal
      R rho source other v jointDeletion G xu xv)
    (blocker_interior :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {source.1, xu}) :
    Nonempty (ExactFourRigid221SourceEqUUHeavyOutsidePair R source) := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  let C := S.capByIndex S.oppIndex2
  change K.support ∩ C = {source.1, xu} at row_cap_trace
  have hsourceXu : source.1 ≠ xu := T.named_rows.xu_ne_u.symm
  have hinter_card : (K.support ∩ C).card = 2 := by
    rw [row_cap_trace]
    simp [hsourceXu]
  have hsplit := Finset.card_sdiff_add_card_inter K.support C
  have houtside_card : (K.support \ C).card = 2 := by
    rw [K.support_card, hinter_card] at hsplit
    omega
  obtain ⟨left, right, hleftRight, houtside⟩ :=
    Finset.card_eq_two.mp houtside_card
  have hleftDiff : left ∈ K.support \ C := by
    rw [houtside]
    simp
  have hrightDiff : right ∈ K.support \ C := by
    rw [houtside]
    simp
  have hleftK : left ∈ K.support := (Finset.mem_sdiff.mp hleftDiff).1
  have hrightK : right ∈ K.support := (Finset.mem_sdiff.mp hrightDiff).1
  refine ⟨
    { left := left
      right := right
      left_ne_right := hleftRight
      outside_trace := ?_
      left_mem_A := K.support_subset_A hleftK
      right_mem_A := K.support_subset_A hrightK
      left_not_mem_cap := ?_
      right_not_mem_cap := ?_
      blocker_mem_cap :=
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2 blocker_interior
      blocker_equidistant :=
        (K.support_eq_radius left hleftK).trans
          (K.support_eq_radius right hrightK).symm }⟩
  · simpa [K, C] using houtside
  · simpa [C] using (Finset.mem_sdiff.mp hleftDiff).2
  · simpa [C] using (Finset.mem_sdiff.mp hrightDiff).2

/-- `PARKED-SPEC`: the precise extra geometry absent from the current
`u`-heavy terminal.  It asks for a second, distinct center in the same indexed
cap that bisects the extracted outside pair. -/
def ExactFourRigid221SourceEqUUHeavyOutsidePair.SecondCapCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : CarrierVertex D.A}
    (P : ExactFourRigid221SourceEqUUHeavyOutsidePair R source) : Prop :=
  ∃ center : ℝ²,
    center ∈ S.capByIndex S.oppIndex2 ∧
    center ≠ (lateFirstApexSystem R).centerAt source.1 source.2 ∧
    dist center P.left = dist center P.right

/-- The parked second-center bridge is sufficient, by ordered-cap uniqueness,
to close the `u`-heavy outside-pair residual. -/
theorem false_of_exactFourRigid221_sourceEqU_uHeavyOutsidePair_of_secondCapCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {source : CarrierVertex D.A}
    (P : ExactFourRigid221SourceEqUUHeavyOutsidePair R source)
    (hsecond : P.SecondCapCenter) :
    False := by
  classical
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  rcases hsecond with ⟨center, hcenterCap, hcenterNe, hcenterEq⟩
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hblockerImage : blocker ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact P.blocker_mem_cap
  have hcenterImage : center ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenterCap
  rcases Finset.mem_image.mp hblockerImage with
    ⟨ib, _hib, hib⟩
  rcases Finset.mem_image.mp hcenterImage with
    ⟨ic, _hic, hic⟩
  have hib_ne_ic : ib ≠ ic := by
    intro h
    apply hcenterNe
    calc
      center = L.points ic := hic.symm
      _ = L.points ib := by simp [h]
      _ = blocker := hib
  have hleftOutside : P.left ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.left_not_mem_cap
  have hrightOutside : P.right ∉ Finset.univ.image L.points := by
    simpa [hcap] using P.right_not_mem_cap
  rcases lt_or_gt_of_ne hib_ne_ic with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt
      P.left_mem_A P.right_mem_A hleftOutside hrightOutside
      P.left_ne_right
      (by simpa [blocker, hib] using P.blocker_equidistant)
      (by simpa [hic] using hcenterEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt
      P.left_mem_A P.right_mem_A hleftOutside hrightOutside
      P.left_ne_right
      (by simpa [hic] using hcenterEq)
      (by simpa [blocker, hib] using P.blocker_equidistant)

#print axioms nonempty_exactFourRigid221_sourceEqU_uHeavyOutsidePair

#print axioms
  false_of_exactFourRigid221_sourceEqU_uHeavyOutsidePair_of_secondCapCenter

end ATailFrontierLiveClosure
end Problem97
