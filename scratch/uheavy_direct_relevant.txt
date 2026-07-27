/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherCapGrowth

/-!
# Exact-four source-equals-u cross-row branch: direct u-heavy narrowing

This file keeps the complete production context and every field of the
`uHeavy` cap-shape constructor.  In the exact-five second-cap arms, the three
named points already known to lie in the strict interior exhaust that
interior.  Consequently neither `v` nor the globally deleted point is in the
strict interior, the retained peer is the named `v`-row companion `xv`, and
those two excluded class points occupy opposite adjacent caps.

The large-second-cap arm remains explicit.  No conditional closer or
additional geometric assumption is introduced.
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

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The concrete cap-growth alternatives after using all named geometry from
the `uHeavy` constructor.  In either exact-five arm, the strict interior is
the named triple `u, xu, xv`; the two other physical-class points are
excluded and occupy opposite adjacent caps, while the retained peer and
actual source blocker are both `xv`. -/
inductive ExactFourRigid221SourceEqUVRowOtherUHeavyCapAlternative
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²) : Prop
  | secondOppositeLarge
      (secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
      (secondInterior_card_ge_four :
        4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
      (robust_growth : ExactFourRobustCapGrowth S)
  | secondOppositeExactFiveSurplusGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_eq_named :
        S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv})
      (v_not_mem_secondInterior :
        P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (deleted_not_mem_secondInterior :
        P.jointDeletion.deleted.1 ∉
          S.capInteriorByIndex S.oppIndex2)
      (other_point_eq_xv : P.other.1 = xv)
      (source_blocker_eq_other_point :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
          P.other.1)
      (outside_adjacent_orientation :
        (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
            P.jointDeletion.deleted.1 ∈
              S.rightAdjacentCapByIndex S.oppIndex2) ∨
          (P.jointDeletion.deleted.1 ∈
              S.leftAdjacentCapByIndex S.oppIndex2 ∧
            P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2))
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
      (surplus_first_card_add_two_eq_carrier :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
      (surplus_first_card_ge_ten :
        10 ≤ S.surplusCap.card + S.oppCap1.card)
  | secondOppositeExactFiveFirstGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_eq_named :
        S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv})
      (v_not_mem_secondInterior :
        P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (deleted_not_mem_secondInterior :
        P.jointDeletion.deleted.1 ∉
          S.capInteriorByIndex S.oppIndex2)
      (other_point_eq_xv : P.other.1 = xv)
      (source_blocker_eq_other_point :
        (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
          P.other.1)
      (outside_adjacent_orientation :
        (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
            P.jointDeletion.deleted.1 ∈
              S.rightAdjacentCapByIndex S.oppIndex2) ∨
          (P.jointDeletion.deleted.1 ∈
              S.leftAdjacentCapByIndex S.oppIndex2 ∧
            P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2))
      (profile : ExactFourFirstOppositeCapGrowth S)
      (firstOppCap_card_add_seven_eq_carrier :
        S.oppCap1.card + 7 = D.A.card)

/-- Context-complete direct residual for the production
`sourceEqU_blockerVRowOther` leaf specialized to the `uHeavy` constructor.
The fields deliberately retain the full terminal rather than replacing it by
a weaker summary. -/
structure ExactFourRigid221SourceEqUVRowOtherUHeavyDirectResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²) : Prop where
  blocker_v_row :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 P.rho
  blocker_ne_v :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1
  terminal :
    ExactFourRigid221SourceEqUTerminal
      R P.rho P.u P.other P.v P.jointDeletion
        P.globalDeletion xu xv
  blocker_eq :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv
  pair_interior :
    ({P.u.1, xu} : Finset ℝ²) ∩
        S.capInteriorByIndex S.oppIndex2 =
      {P.u.1, xu}
  blocker_interior :
    (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
      S.capInteriorByIndex S.oppIndex2
  row_cap_trace :
    ((lateFirstApexSystem R).selectedAt
        P.u.1 P.u.2).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2 = {P.u.1, xu}
  cap_alternative :
    ExactFourRigid221SourceEqUVRowOtherUHeavyCapAlternative P xu xv

/-- Direct, source-clean narrowing of the `uHeavy` constructor.

When the physical second cap has only five points, its strict interior has
cardinality three.  The two source-row points and the source blocker `xv`
are distinct members, so they are the whole interior.  The terminal's
retained-peer placement then collapses to `other = xv` at the point level.
The adjacent-cap one-hit bounds force `v` and the global deletion into
opposite adjacent caps. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_direct
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
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          P.u.1 P.u.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {P.u.1, xu}) :
    ExactFourRigid221SourceEqUVRowOtherUHeavyDirectResidual P xu xv := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  have hblockerEqU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
    simpa [P.huSource] using blocker_eq
  have huUSupport : P.u.1 ∈ Ku.support := by
    simpa [Ku] using Ku.q_mem_support
  have hrowCapTrace :
      Ku.support ∩ S.capByIndex S.oppIndex2 = {P.u.1, xu} := by
    simpa [Ku] using row_cap_trace
  have hxuUSupport : xu ∈ Ku.support := by
    have hmem :
        xu ∈ Ku.support ∩ S.capByIndex S.oppIndex2 := by
      rw [hrowCapTrace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotUSupport : xv ∉ Ku.support := by
    intro hxv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
          (xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hblockerEqU
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hvRowTrace :
      Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho =
        {P.v.1, xv} := by
    simpa [Kv] using terminal.named_rows.v_row_trace
  have hxvVSupport : xv ∈ Kv.support := by
    have hmem :
        xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [hvRowTrace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hinteriorEqNamed
      (hinteriorCard :
        (S.capInteriorByIndex S.oppIndex2).card = 3) :
      S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv} := by
    have hpairSubset :
        ({P.u.1, xu} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.oppIndex2 := by
      intro z hz
      have hzInter :
          z ∈ ({P.u.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 := by
        rw [pair_interior]
        exact hz
      exact (Finset.mem_inter.mp hzInter).2
    have hxvInterior :
        xv ∈ S.capInteriorByIndex S.oppIndex2 := by
      rw [← hblockerEqU]
      exact blocker_interior
    have htripleSubset :
        ({P.u.1, xu, xv} : Finset ℝ²) ⊆
          S.capInteriorByIndex S.oppIndex2 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact hpairSubset (by simp)
      · exact hpairSubset (by simp)
      · exact hxvInterior
    have huNeXu : P.u.1 ≠ xu :=
      terminal.named_rows.xu_ne_u.symm
    have huNeXv : P.u.1 ≠ xv := by
      intro h
      apply hxvNotUSupport
      rw [← h]
      exact huUSupport
    have hxuNeXv : xu ≠ xv := by
      intro h
      apply hxvNotUSupport
      rw [← h]
      exact hxuUSupport
    have htripleCard :
        ({P.u.1, xu, xv} : Finset ℝ²).card = 3 := by
      simp [huNeXu, huNeXv, hxuNeXv]
    have hEq :
        ({P.u.1, xu, xv} : Finset ℝ²) =
          S.capInteriorByIndex S.oppIndex2 :=
      Finset.eq_of_subset_of_card_le htripleSubset (by
        rw [hinteriorCard, htripleCard])
    exact hEq.symm
  have hvNotInterior
      (hinteriorEq :
        S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv}) :
      P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 := by
    intro hvInterior
    rw [hinteriorEq] at hvInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvInterior
    rcases hvInterior with hvu | hvxu | hvxv
    · apply P.huNeV
      apply Subtype.ext
      exact hvu.symm
    · apply P.hvOmitted
      rw [hvxu]
      exact hxuUSupport
    · exact terminal.named_rows.xv_ne_v hvxv.symm
  have hdeletedNotInterior
      (hinteriorEq :
        S.capInteriorByIndex S.oppIndex2 = {P.u.1, xu, xv}) :
      P.jointDeletion.deleted.1 ∉
        S.capInteriorByIndex S.oppIndex2 := by
    intro hdeletedInterior
    rw [hinteriorEq] at hdeletedInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdeletedInterior
    rcases hdeletedInterior with hdu | hdxu | hdxv
    · apply P.jointDeletion.deleted_ne_u
      apply Subtype.ext
      exact hdu
    · apply P.jointDeletion.deleted_not_mem_uRow
      rw [hdxu]
      exact hxuUSupport
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdxv]
      exact hxvVSupport
  have hotherEqXv
      (hvNot :
        P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (hdeletedNot :
        P.jointDeletion.deleted.1 ∉
          S.capInteriorByIndex S.oppIndex2) :
      P.other.1 = xv := by
    rcases terminal.other_placement with
        ⟨_, hdeletedInterior⟩ |
        ⟨_, hvInterior⟩ |
        ⟨hotherPointEq, _⟩
    · exact (hdeletedNot hdeletedInterior).elim
    · exact (hvNot hvInterior).elim
    · exact hotherPointEq
  have houtsideAdjacentOrientation
      (hvNot :
        P.v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (hdeletedNot :
        P.jointDeletion.deleted.1 ∉
          S.capInteriorByIndex S.oppIndex2) :
      (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) ∨
        (P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2) := by
    let T :=
      SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) P.rho
    have hcenter :
        S.oppApex2 =
          S.oppositeVertexByIndex S.oppIndex2 :=
      oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
    have hleftOne :
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hrightOne :
        (T ∩ S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hcover :
        T \ S.capInteriorByIndex S.oppIndex2 ⊆
          (T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex2) := by
      simpa [T] using
        S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
          S.oppIndex2 P.hrho
    have hvT : P.v.1 ∈ T := by
      simpa [T, ← hcenter] using P.hvClass
    have hdeletedT : P.jointDeletion.deleted.1 ∈ T := by
      simpa [T, ← hcenter] using
        P.jointDeletion.deleted_mem_class
    have hvOutside :
        P.v.1 ∈ T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hvT, hvNot⟩
    have hdeletedOutside :
        P.jointDeletion.deleted.1 ∈
          T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hdeletedT, hdeletedNot⟩
    have hvLocation :
        P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hvOutside) with hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hdeletedLocation :
        P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hdeletedOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hvNeDeleted :
        P.v.1 ≠ P.jointDeletion.deleted.1 := by
      intro h
      apply P.jointDeletion.deleted_ne_v
      apply Subtype.ext
      exact h.symm
    have hnotBothLeft :
        ¬ (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvLeft, hdeletedLeft⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvLeft⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedLeft⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    have hnotBothRight :
        ¬ (P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvRight, hdeletedRight⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvRight⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedRight⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    rcases hvLocation with hvLeft | hvRight <;>
      rcases hdeletedLocation with hdeletedLeft | hdeletedRight
    · exact (hnotBothLeft ⟨hvLeft, hdeletedLeft⟩).elim
    · exact Or.inl ⟨hvLeft, hdeletedRight⟩
    · exact Or.inr ⟨hdeletedLeft, hvRight⟩
    · exact (hnotBothRight ⟨hvRight, hdeletedRight⟩).elim
  have hcapAlternative :
      ExactFourRigid221SourceEqUVRowOtherUHeavyCapAlternative
        P xu xv := by
    rcases exactFourRigid221_sourceEqU_blockerVRowOther_capProfile P with
        ⟨hsecondSix, hinteriorFour, hgrowth⟩ |
        ⟨hsecondFive, hinteriorThree, hsurplus, hbudget, hten⟩ |
        ⟨hsecondFive, hinteriorThree, hfirst, hcarrier⟩
    · exact .secondOppositeLarge hsecondSix hinteriorFour hgrowth
    · have hinteriorEq := hinteriorEqNamed hinteriorThree
      have hvNot := hvNotInterior hinteriorEq
      have hdeletedNot := hdeletedNotInterior hinteriorEq
      have hotherEq := hotherEqXv hvNot hdeletedNot
      exact .secondOppositeExactFiveSurplusGrowth
        hsecondFive hinteriorEq hvNot hdeletedNot
          hotherEq (blocker_eq.trans hotherEq.symm)
          (houtsideAdjacentOrientation hvNot hdeletedNot)
          hsurplus hbudget hten
    · have hinteriorEq := hinteriorEqNamed hinteriorThree
      have hvNot := hvNotInterior hinteriorEq
      have hdeletedNot := hdeletedNotInterior hinteriorEq
      have hotherEq := hotherEqXv hvNot hdeletedNot
      exact .secondOppositeExactFiveFirstGrowth
        hsecondFive hinteriorEq hvNot hdeletedNot
          hotherEq (blocker_eq.trans hotherEq.symm)
          (houtsideAdjacentOrientation hvNot hdeletedNot)
          hfirst hcarrier
  exact
    { blocker_v_row := hblockerVRow
      blocker_ne_v := hblockerNeV
      terminal := terminal
      blocker_eq := blocker_eq
      pair_interior := pair_interior
      blocker_interior := blocker_interior
      row_cap_trace := row_cap_trace
      cap_alternative := hcapAlternative }

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_direct

end ATailFrontierLiveClosure
end Problem97
