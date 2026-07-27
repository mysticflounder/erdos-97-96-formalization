/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUTerminal

/-!
# Exact-four source-equals-u cross-row branch: robust cap-growth split

This scratch file combines the checked source-equals-`u` terminal with the
previously unused robust cap-growth field.  It also retains the physical
global-deletion cardinality.  The resulting three-way packet separates a
large physical second cap from the two exact-five physical-cap profiles.
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

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Local copy of the checked reduction in
`ExactFourRigid221SourceEqUVRowOtherMain`: the production row hypothesis
identifies the actual source blocker with the named `v`-row companion. -/
private theorem sourceEqU_blockerVRowOther_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    ∃ xu xv : ℝ²,
      ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion
            P.globalDeletion xu xv ∧
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv := by
  classical
  have contextU :
      ExactFourMutualOmissionSourceContext
        R P.rho P.u P.other P.u P.v := by
    simpa [P.huSource] using P.context
  have hsourceBlockerClassU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        SelectedClass D.A S.oppApex2 P.rho := by
    simpa [P.huSource] using P.hsourceBlockerClass
  have hblockerVRowU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
    simpa [P.huSource] using hblockerVRow
  have hblockerNeVU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ≠ P.v.1 := by
    simpa [P.huSource] using hblockerNeV
  obtain ⟨xu, xv, terminal⟩ :=
    exactFourRigid221_physicalApex_sourceEqUTerminal
      R P.hcard P.surface P.rho P.u P.other P.hrho P.hfive
        P.v P.huNeV P.huClass P.hvClass P.hvOmitted P.huOmitted
        contextU P.jointDeletion P.hclassFive P.globalDeletion
        P.hcenter hsourceBlockerClassU
  refine ⟨xu, xv, terminal, ?_⟩
  rcases terminal.source_blocker_placement with hdeleted | hv | hxv
  · have hmem :
        P.jointDeletion.deleted.1 ∈
          ((lateFirstApexSystem R).selectedAt
              P.v.1 P.v.2).toCriticalFourShell.support :=
      hdeleted ▸ (Finset.mem_inter.mp hblockerVRowU).1
    exact (P.jointDeletion.deleted_not_mem_vRow hmem).elim
  · exact (hblockerNeVU hv).elim
  · simpa [P.huSource] using hxv

/-- Exhaustive robust-growth profile at the physical second cap.

The exact-five arms record the exact three-point strict interior and the
carrier-cardinality budget obtained from the closed-cap sum. -/
inductive ExactFourRigid221SourceEqUVRowOtherCapProfile
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | secondOppositeLarge
      (secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
      (secondInterior_card_ge_four :
        4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
      (robust_growth : ExactFourRobustCapGrowth S)
  | secondOppositeExactFiveSurplusGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
      (surplus_first_card_add_two_eq_carrier :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
      (surplus_first_card_ge_ten :
        10 ≤ S.surplusCap.card + S.oppCap1.card)
  | secondOppositeExactFiveFirstGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (profile : ExactFourFirstOppositeCapGrowth S)
      (firstOppCap_card_add_seven_eq_carrier :
        S.oppCap1.card + 7 = D.A.card)

/-- The cap-growth split uses all three robust-growth constructors and the
cardinality lower bound from the full production context. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_capProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    ExactFourRigid221SourceEqUVRowOtherCapProfile S := by
  have hinteriorCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2 S] at hinteriorCard
  by_cases hsecond : 6 ≤ S.oppCap2.card
  · exact .secondOppositeLarge hsecond (by omega) P.surface.capGrowth
  have hsecondEq : S.oppCap2.card = 5 := by
    have hfive := P.surface.secondOppCap_card_ge_five
    omega
  have hinteriorEq :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    omega
  rcases P.surface.capGrowth with hsurplus | hfirst | hsecondGrowth
  · have hbudget :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card := by
      have hsum := S.capSum
      omega
    exact .secondOppositeExactFiveSurplusGrowth
      hsecondEq hinteriorEq hsurplus hbudget (by
        have hcard := P.hcard
        omega)
  · have hcarrier :
        S.oppCap1.card + 7 = D.A.card := by
      have hsum := hfirst.oppositeCaps_card_add_two_eq_carrier
      omega
    exact .secondOppositeExactFiveFirstGrowth
      hsecondEq hinteriorEq hfirst hcarrier
  · exact (hsecond hsecondGrowth.secondOppCap_card_ge_six).elim

/-- Context-complete narrowed packet for the production
`sourceEqU_blockerVRowOther` leaf. -/
structure ExactFourRigid221SourceEqUVRowOtherCapGrowthResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) : Prop where
  blocker_v_row :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho
  blocker_ne_v :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1
  global_deleted_card_eq_two :
    P.globalDeletion.deleted.card = 2
  cap_profile :
    ExactFourRigid221SourceEqUVRowOtherCapProfile S
  terminal_packet :
    ∃ xu xv,
      ExactFourRigid221SourceEqUTerminal
          R P.rho P.u P.other P.v P.jointDeletion
            P.globalDeletion xu xv ∧
        (lateFirstApexSystem R).centerAt
            P.source.1 P.source.2 = xv

/-- Direct reduction of the production leaf to the robust cap-growth
residual.  No hypotheses from the full production context are discarded. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_capGrowthResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1) :
    ExactFourRigid221SourceEqUVRowOtherCapGrowthResidual P := by
  refine
    { blocker_v_row := hblockerVRow
      blocker_ne_v := hblockerNeV
      global_deleted_card_eq_two := ?_
      cap_profile :=
        exactFourRigid221_sourceEqU_blockerVRowOther_capProfile P
      terminal_packet :=
        sourceEqU_blockerVRowOther_packet
          P hblockerVRow hblockerNeV }
  exact
    exactFourRigid221_physicalApex_deleted_card_eq_two
      P.hrho P.hclassFive P.globalDeletion P.hcenter

#print axioms exactFourRigid221_sourceEqU_blockerVRowOther_capProfile
#print axioms exactFourRigid221_sourceEqU_blockerVRowOther_capGrowthResidual

end ATailFrontierLiveClosure
end Problem97
