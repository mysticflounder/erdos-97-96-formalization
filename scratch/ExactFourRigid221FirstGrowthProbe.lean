/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyPlacementCoordinator

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

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2_probe
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- Everything geometric that follows directly from the production
`exactFiveFirstGrowth` leaf hypotheses. -/
theorem exactFourRigid221_sourceHeavyOtherXv_exactFiveFirstGrowth_capPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hother : P.other.1 = packet.xv)
    (hsecond : S.oppCap2.card = 5)
    (hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (hfirst : ExactFourFirstOppositeCapGrowth S)
    (hbudget : S.oppCap1.card + 7 = D.A.card) :
    ExactFourRigid221UHeavyExactFiveCapPacket P packet.xu packet.xv := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  have huUSupport : P.u.1 ∈ Ku.support := by
    have hmem :
        P.u.1 ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} by
        simpa [Ku] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxuUSupport : packet.xu ∈ Ku.support := by
    have hmem :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Ku, packet.source_row_trace] 
    exact (Finset.mem_inter.mp hmem).1
  have hxvVSupport : packet.xv ∈ Kv.support := by
    have hmem :
        packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Kv, packet.opposite_row_trace]
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotUSupport : packet.xv ∉ Ku.support := by
    intro hxv
    have hcenter :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
      simpa [P.huSource] using packet.blocker_eq_xv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
          (packet.xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hcenter
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← hother]
    exact P.context.other_mem_interior
  have htripleSubset :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
    · exact hxvInterior
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact huUSupport
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact hxuUSupport
  have htripleCard :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²).card = 3 := by
    simp [packet.xu_ne_u.symm, huNeXv, hxuNeXv]
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, packet.xu, packet.xv} := by
    apply Eq.symm
    apply Finset.eq_of_subset_of_card_le htripleSubset
    rw [hinterior, htripleCard]
  have hvNotInterior :
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
    · exact packet.xv_ne_v hvxv.symm
  have hdeletedNotInterior :
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
  have houtsideAdjacentOrientation :
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
      oppApex2_eq_oppositeVertexByIndex_oppIndex2_probe S
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
      Finset.mem_sdiff.mpr ⟨hvT, hvNotInterior⟩
    have hdeletedOutside :
        P.jointDeletion.deleted.1 ∈
          T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hdeletedT, hdeletedNotInterior⟩
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
  exact
    { secondOppCap_card_eq_five := hsecond
      secondInterior_eq_named := hinteriorEq
      v_not_mem_secondInterior := hvNotInterior
      deleted_not_mem_secondInterior := hdeletedNotInterior
      other_point_eq_xv := hother
      source_blocker_eq_other_point := by
        calc
          (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
              packet.xv := packet.blocker_eq_xv
          _ = P.other.1 := hother.symm
      outside_adjacent_orientation := houtsideAdjacentOrientation
      growth := .firstOpposite hfirst hbudget }

/-- The strongest elementary placement and metric consequences extracted from
the direct first-growth packet.  This deliberately does not assume or expose
any first-apex exact-five residual. -/
structure ExactFourRigid221FirstGrowthDirectTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²) : Prop where
  outsideClass_eq :
    SelectedClass D.A S.oppApex2 P.rho \
        S.capInteriorByIndex S.oppIndex2 =
      {P.v.1, P.jointDeletion.deleted.1}
  adjacentClassTraces :
    (SelectedClass D.A S.oppApex2 P.rho ∩
          S.leftAdjacentCapByIndex S.oppIndex2 = {P.v.1} ∧
        SelectedClass D.A S.oppApex2 P.rho ∩
          S.rightAdjacentCapByIndex S.oppIndex2 =
            {P.jointDeletion.deleted.1}) ∨
      (SelectedClass D.A S.oppApex2 P.rho ∩
          S.leftAdjacentCapByIndex S.oppIndex2 =
            {P.jointDeletion.deleted.1} ∧
        SelectedClass D.A S.oppApex2 P.rho ∩
          S.rightAdjacentCapByIndex S.oppIndex2 = {P.v.1})
  sourceRow_bisector :
    dist xv P.u.1 = dist xv xu
  oppositeRow_bisector :
    dist ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) P.v.1 =
      dist ((lateFirstApexSystem R).centerAt P.v.1 P.v.2) xv
  physicalApex_bisector :
    dist S.oppApex2 P.v.1 =
      dist S.oppApex2 P.jointDeletion.deleted.1
  surplusCap_card_eq_five : S.surplusCap.card = 5
  firstOppCap_card_ge_five : 5 ≤ S.oppCap1.card
  oppositeCaps_card_add_two_eq_carrier :
    S.oppCap1.card + S.oppCap2.card + 2 = D.A.card
  firstOppCap_card_add_seven_eq_carrier :
    S.oppCap1.card + 7 = D.A.card

theorem exactFourRigid221_sourceHeavyOtherXv_exactFiveFirstGrowth_directTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hother : P.other.1 = packet.xv)
    (hsecond : S.oppCap2.card = 5)
    (hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (hfirst : ExactFourFirstOppositeCapGrowth S)
    (hbudget : S.oppCap1.card + 7 = D.A.card) :
    ExactFourRigid221FirstGrowthDirectTerminal P packet.xu packet.xv := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  have W :=
    exactFourRigid221_sourceHeavyOtherXv_exactFiveFirstGrowth_capPacket
      P packet hother hsecond hinterior hfirst hbudget
  have huSupport : P.u.1 ∈ Ku.support := by
    have hmem : P.u.1 ∈ Ku.support ∩ C := by
      rw [show Ku.support ∩ C = {P.u.1, packet.xu} by
        simpa [Ku, C] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxuSupport : packet.xu ∈ Ku.support := by
    have hmem : packet.xu ∈ Ku.support ∩ C := by
      rw [show Ku.support ∩ C = {P.u.1, packet.xu} by
        simpa [Ku, C] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hvSupport : P.v.1 ∈ Kv.support := by
    have hmem : P.v.1 ∈ Kv.support ∩ C := by
      rw [show Kv.support ∩ C = {P.v.1, packet.xv} by
        simpa [Kv, C] using packet.opposite_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxvSupport : packet.xv ∈ Kv.support := by
    have hmem : packet.xv ∈ Kv.support ∩ C := by
      rw [show Kv.support ∩ C = {P.v.1, packet.xv} by
        simpa [Kv, C] using packet.opposite_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have houtside :
      C \ S.capInteriorByIndex S.oppIndex2 =
        {P.v.1, P.jointDeletion.deleted.1} := by
    ext z
    constructor
    · intro hz
      have hzC := (Finset.mem_sdiff.mp hz).1
      rw [show C =
          insert P.jointDeletion.deleted.1
            ({P.u.1, packet.xu} ∪ {P.v.1, packet.xv}) by
        simpa [C] using packet.physical_class] at hzC
      simp only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton] at hzC
      rcases hzC with hdeleted | hpair
      · subst z
        simp
      rcases hpair with huPair | hvPair
      · rcases huPair with hu | hxu
        · subst z
          exact ((Finset.mem_sdiff.mp hz).2
            (by rw [W.secondInterior_eq_named]; simp)).elim
        · subst z
          exact ((Finset.mem_sdiff.mp hz).2
            (by rw [W.secondInterior_eq_named]; simp)).elim
      rcases hvPair with hv | hxv
      · subst z
        simp
      · subst z
        exact ((Finset.mem_sdiff.mp hz).2
          (by rw [W.secondInterior_eq_named]; simp)).elim
    · intro hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Finset.mem_sdiff.mpr ⟨P.hvClass,
          W.v_not_mem_secondInterior⟩
      · exact Finset.mem_sdiff.mpr
          ⟨P.jointDeletion.deleted_mem_class,
            W.deleted_not_mem_secondInterior⟩
  have hleftOne :
      (C ∩ S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
    have hcenter :=
      oppApex2_eq_oppositeVertexByIndex_oppIndex2_probe S
    change
      (SelectedClass D.A S.oppApex2 P.rho ∩
        S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1
    rw [hcenter]
    exact S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex2 P.rho
  have hrightOne :
      (C ∩ S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
    have hcenter :=
      oppApex2_eq_oppositeVertexByIndex_oppIndex2_probe S
    change
      (SelectedClass D.A S.oppApex2 P.rho ∩
        S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1
    rw [hcenter]
    exact S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex2 P.rho
  have hsingleton
      (x : ℝ²) (hxC : x ∈ C) {B : Finset ℝ²}
      (hxB : x ∈ B) (hcard : (C ∩ B).card ≤ 1) :
      C ∩ B = {x} := by
    symm
    apply Finset.eq_of_subset_of_card_le
    · intro z hz
      simp only [Finset.mem_singleton] at hz
      subst z
      exact Finset.mem_inter.mpr ⟨hxC, hxB⟩
    · simpa using hcard
  have hadjacent :
      (C ∩ S.leftAdjacentCapByIndex S.oppIndex2 = {P.v.1} ∧
          C ∩ S.rightAdjacentCapByIndex S.oppIndex2 =
            {P.jointDeletion.deleted.1}) ∨
        (C ∩ S.leftAdjacentCapByIndex S.oppIndex2 =
            {P.jointDeletion.deleted.1} ∧
          C ∩ S.rightAdjacentCapByIndex S.oppIndex2 = {P.v.1}) := by
    rcases W.outside_adjacent_orientation with h | h
    · exact Or.inl
        ⟨hsingleton P.v.1 P.hvClass h.1 hleftOne,
          hsingleton P.jointDeletion.deleted.1
            P.jointDeletion.deleted_mem_class h.2 hrightOne⟩
    · exact Or.inr
        ⟨hsingleton P.jointDeletion.deleted.1
            P.jointDeletion.deleted_mem_class h.1 hleftOne,
          hsingleton P.v.1 P.hvClass h.2 hrightOne⟩
  have hsourceCenter :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = packet.xv := by
    simpa [P.huSource] using packet.blocker_eq_xv
  exact
    { outsideClass_eq := by simpa [C] using houtside
      adjacentClassTraces := by simpa [C] using hadjacent
      sourceRow_bisector := by
        rw [← hsourceCenter]
        exact (Ku.support_eq_radius _ huSupport).trans
          (Ku.support_eq_radius _ hxuSupport).symm
      oppositeRow_bisector :=
        (Kv.support_eq_radius _ hvSupport).trans
          (Kv.support_eq_radius _ hxvSupport).symm
      physicalApex_bisector :=
        (mem_selectedClass.mp P.hvClass).2.trans
          (mem_selectedClass.mp
            P.jointDeletion.deleted_mem_class).2.symm
      surplusCap_card_eq_five := hfirst.surplusCap_card_eq_five
      firstOppCap_card_ge_five := hfirst.firstOppCap_card_ge_five
      oppositeCaps_card_add_two_eq_carrier :=
        hfirst.oppositeCaps_card_add_two_eq_carrier
      firstOppCap_card_add_seven_eq_carrier := hbudget }

end ATailFrontierLiveClosure
end Problem97
