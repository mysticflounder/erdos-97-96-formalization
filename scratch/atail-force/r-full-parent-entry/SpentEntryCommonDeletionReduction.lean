/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SpentEntryAlternateRadiusDescent
import FixedSingleRadiusTerminalCommonDeletion
import FixedSingleRadiusCycleCommonDeletion

/-!
# Common-deletion reduction after a spent frontier entry

The fixed alternate-radius suffix is not a full-carrier fixed-radius history:
the original frontier endpoints are genuine off-radius exceptions.  This file
therefore keeps those two points explicit.

For a terminal hit, the least positive predecessor produces a common-deletion
packet unless that predecessor is one of the two original endpoints.  For a
minimal cycle, the successor-as-mate construction still works whenever every
canonical source belongs to the alternate class.  Combining this with the
existing cycle split leaves precisely the named return to the original pair.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailCriticalPairFrontier
open ATailContinuationBankMatchScratch
open ATailPrescribedDeletionEdge
open ATailRActualBlockerTransitionScratch
open ATailRTransitionLiveSurfaceScratch
open ATailStrictOppCapCrossClassifierScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem postEntryCarrier_subset_ambient
    {D : CounterexampleData} {q w : ℝ²} :
    (D.A.erase q).erase w ⊆ D.A := by
  intro z hz
  exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2

private theorem equidistant_mono_spent
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, le_trans hcard (Finset.card_le_card (by
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
    exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩))⟩

private theorem oppApex2_mem_ambient
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Any exact actual-blocker OMISSION outcome already gives common deletion:
delete the robust mate, use the actual blocker as the first center, and use
the retained second-apex double-deletion witness as the second row. -/
theorem AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_actualBlockerOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (Q : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (homission : ActualBlockerOmissionOutcome Q H) :
    ∃ deleted : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket D H deleted
        (H.centerAt Q.x
          (mem_selectedClass.mp Q.x_mem_class).1)
        S.oppApex2) := by
  let hxA : Q.x ∈ D.A := (mem_selectedClass.mp Q.x_mem_class).1
  let blocker := H.centerAt Q.x hxA
  let shell := (H.selectedAt Q.x hxA).toCriticalFourShell
  change Q.y ∉ shell.support ∧
    HasNEquidistantPointsAt 4 (D.A.erase Q.y) blocker ∧
    dist blocker Q.y ≠ dist blocker Q.x at homission
  have hblockerA : blocker ∈ D.A := by
    simpa [blocker, shell, hxA] using
      (Finset.mem_erase.mp shell.center_mem).2
  have hcenters : blocker ≠ S.oppApex2 := by
    simpa [blocker, hxA] using
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 Q H
  have hsurvivesSecond :
      HasNEquidistantPointsAt 4 (D.A.erase Q.y) S.oppApex2 := by
    apply equidistant_mono_spent (h := Q.second_double)
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨hzy, hzEraseX⟩
    exact Finset.mem_erase.mpr
      ⟨hzy, (Finset.mem_erase.mp hzEraseX).2⟩
  refine ⟨Q.y, ?_⟩
  exact nonempty_commonDeletionTwoCenterPacket H
    (mem_selectedClass.mp Q.y_mem_class).1
    hblockerA
    (oppApex2_mem_ambient S)
    hcenters
    homission.2.1
    hsurvivesSecond

/- ## Terminal-hit arm -/

/-- A terminal predecessor that is already known to lie on the terminal's
fixed circle gives the same common-deletion packet as in the full-carrier
case.  The terminal history itself may start on an arbitrary ambient
subcarrier `B`; only `B ⊆ D.A` is needed here. -/
theorem LeastPositiveTerminalHitPredecessor.exists_commonDeletionTwoCenterPacket_of_fixedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {B : Finset ℝ²} {radius rho : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S B radius)
    (hBsub : B ⊆ D.A)
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H)
    (hpredecessorFixed :
      K.predecessorPair.x ∈ SelectedClass D.A S.oppApex1 radius) :
    ∃ deleted : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket D H deleted
        (H.centerAt K.predecessorPair.x
          (mem_selectedClass.mp K.predecessorPair.x_mem_class).1)
        S.oppApex2) := by
  classical
  let Q := K.predecessorPair
  let hxA : Q.x ∈ D.A := (mem_selectedClass.mp Q.x_mem_class).1
  let blocker := H.centerAt Q.x hxA
  let shell := (H.selectedAt Q.x hxA).toCriticalFourShell
  rcases T.terminal with
    ⟨q, w, _hradius, hqMarginal, hwMarginal, hqw, _hcard, hsecond⟩
  have hcarrierSub : T.carrier ⊆ D.A := T.carrier_subset.trans hBsub
  have hqCarrier : q ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqMarginal).1).1
  have hwCarrier : w ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwMarginal).1).1
  have hqA : q ∈ D.A := hcarrierSub hqCarrier
  have hwA : w ∈ D.A := hcarrierSub hwCarrier
  have hqFixed : q ∈ SelectedClass D.A S.oppApex1 radius := by
    refine mem_selectedClass.mpr ⟨hqA, ?_⟩
    simpa [dist_comm] using
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqMarginal).1).2
  have hwFixed : w ∈ SelectedClass D.A S.oppApex1 radius := by
    refine mem_selectedClass.mpr ⟨hwA, ?_⟩
    simpa [dist_comm] using
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwMarginal).1).2
  have hxFixed : Q.x ∈ SelectedClass D.A S.oppApex1 radius := by
    simpa [Q] using hpredecessorFixed
  have hxNotCarrier : Q.x ∉ T.carrier :=
    (Finset.mem_sdiff.mp Q.x_mem_erased).2
  have hx_ne_q : Q.x ≠ q := by
    intro hxq
    exact hxNotCarrier (by simpa [hxq] using hqCarrier)
  have hx_ne_w : Q.x ≠ w := by
    intro hxw
    exact hxNotCarrier (by simpa [hxw] using hwCarrier)
  have hblocker_ne_first : blocker ≠ S.oppApex1 := by
    simpa [blocker, Q, hxA] using
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 Q H
  have hinter_le_two :
      ((SelectedClass D.A S.oppApex1 radius) ∩ shell.support).card ≤ 2 := by
    simpa [shell, blocker, Q, hxA] using
      criticalFourShell_fixedClass_inter_card_le_two shell hblocker_ne_first
  have hxShell : Q.x ∈ shell.support := by
    simpa [shell, Q, hxA] using shell.q_mem_support
  have hq_or_hw_omitted : q ∉ shell.support ∨ w ∉ shell.support := by
    by_cases hqShell : q ∈ shell.support
    · right
      intro hwShell
      have hxInter :
          Q.x ∈ (SelectedClass D.A S.oppApex1 radius) ∩ shell.support :=
        Finset.mem_inter.mpr ⟨hxFixed, hxShell⟩
      have hqInter :
          q ∈ (SelectedClass D.A S.oppApex1 radius) ∩ shell.support :=
        Finset.mem_inter.mpr ⟨hqFixed, hqShell⟩
      have hwInter :
          w ∈ (SelectedClass D.A S.oppApex1 radius) ∩ shell.support :=
        Finset.mem_inter.mpr ⟨hwFixed, hwShell⟩
      have hthree :
          2 < ((SelectedClass D.A S.oppApex1 radius) ∩ shell.support).card := by
        rw [Finset.two_lt_card]
        exact ⟨Q.x, hxInter, q, hqInter, w, hwInter,
          hx_ne_q, hx_ne_w, hqw⟩
      omega
    · exact Or.inl hqShell
  have hblockerA : blocker ∈ D.A := by
    simpa [blocker, shell, Q, hxA] using
      (Finset.mem_erase.mp shell.center_mem).2
  have hcenters : blocker ≠ S.oppApex2 := by
    simpa [blocker, Q, hxA] using
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 Q H
  have hqSecond :
      HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 := by
    rcases hsecond with ⟨secondRadius, hsecondRadius, hsecondCard⟩
    refine ⟨secondRadius, hsecondRadius,
      le_trans hsecondCard (Finset.card_le_card ?_)⟩
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzSmall, hzDist⟩
    have hzEraseQ : z ∈ T.carrier.erase q :=
      (Finset.mem_erase.mp hzSmall).2
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_erase.mpr
          ⟨(Finset.mem_erase.mp hzEraseQ).1,
            hcarrierSub (Finset.mem_erase.mp hzEraseQ).2⟩,
        hzDist⟩
  have hwSecond :
      HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2 := by
    rcases hsecond with ⟨secondRadius, hsecondRadius, hsecondCard⟩
    refine ⟨secondRadius, hsecondRadius,
      le_trans hsecondCard (Finset.card_le_card ?_)⟩
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzSmall, hzDist⟩
    have hzw : z ≠ w := (Finset.mem_erase.mp hzSmall).1
    have hzCarrier : z ∈ T.carrier :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hzSmall).2).2
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_erase.mpr ⟨hzw, hcarrierSub hzCarrier⟩, hzDist⟩
  rcases hq_or_hw_omitted with hqOmitted | hwOmitted
  · refine ⟨q, ?_⟩
    exact nonempty_commonDeletionTwoCenterPacket H hqA hblockerA
      (oppApex2_mem_ambient S) hcenters
      (deletion_survives_of_not_mem_selected_support
        shell.toSelectedFourClass hqOmitted)
      hqSecond
  · refine ⟨w, ?_⟩
    exact nonempty_commonDeletionTwoCenterPacket H hwA hblockerA
      (oppApex2_mem_ambient S) hcenters
      (deletion_survives_of_not_mem_selected_support
        shell.toSelectedFourClass hwOmitted)
      hwSecond

/-- The exact exceptional terminal-hit state after a spent entry. -/
def SpentEntryTerminalPredecessorHitsOriginalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H) : Prop :=
  K.predecessorPair.x = F.pair.q ∨
    K.predecessorPair.x = F.pair.w

/-- The sharp terminal exception: the predecessor returns to the original
pair and its mate is in the exact HIT, rather than OMISSION, classifier arm. -/
def SpentEntryTerminalPredecessorHitsOriginalPairAndActualBlockerHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H) : Prop :=
  SpentEntryTerminalPredecessorHitsOriginalPair K ∧
    ActualBlockerHitOutcome K.predecessorPair H

/-- After retaining the exact HIT/OMISSION classifier, the only terminal-hit
residual is an original-pair predecessor in the HIT arm. -/
theorem LeastPositiveTerminalHitPredecessor.hitsOriginalPairAndActualBlockerHit_or_exists_commonDeletionTwoCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H) :
    SpentEntryTerminalPredecessorHitsOriginalPairAndActualBlockerHit K ∨
      ∃ deleted : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket D H deleted
          (H.centerAt K.predecessorPair.x
            (mem_selectedClass.mp K.predecessorPair.x_mem_class).1)
          S.oppApex2) := by
  by_cases hxq : K.predecessorPair.x = F.pair.q
  · have hentry : SpentEntryTerminalPredecessorHitsOriginalPair K :=
      Or.inl hxq
    rcases
        ActualBlockerCapMetricOutcome.hit_or_omission
          (AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
            K.predecessorPair H) with
      hhit | homission
    · exact Or.inl ⟨hentry, hhit⟩
    · exact Or.inr
        (Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_actualBlockerOmission
          K.predecessorPair H homission)
  · by_cases hxw : K.predecessorPair.x = F.pair.w
    · have hentry : SpentEntryTerminalPredecessorHitsOriginalPair K :=
        Or.inr hxw
      rcases
          ActualBlockerCapMetricOutcome.hit_or_omission
            (AmbientRobustHistoryPair.actualBlocker_capMetricClassifier
              K.predecessorPair H) with
        hhit | homission
      · exact Or.inl ⟨hentry, hhit⟩
      · exact Or.inr
          (Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_actualBlockerOmission
            K.predecessorPair H homission)
    · right
      apply K.exists_commonDeletionTwoCenterPacket_of_fixedClass
        T.terminal (postEntryCarrier_subset_ambient)
      exact T.erased_mem_alternateClass_of_avoids_originalPair
        K.predecessorPair.x_mem_erased hxq hxw

/-- A spent-entry terminal hit reduces to a common-deletion packet unless its
least positive predecessor is one of the two off-alternate entry points. -/
theorem LeastPositiveTerminalHitPredecessor.hitsOriginalPair_or_exists_commonDeletionTwoCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H) :
    SpentEntryTerminalPredecessorHitsOriginalPair K ∨
      ∃ deleted : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket D H deleted
          (H.centerAt K.predecessorPair.x
            (mem_selectedClass.mp K.predecessorPair.x_mem_class).1)
          S.oppApex2) := by
  by_cases hxq : K.predecessorPair.x = F.pair.q
  · exact Or.inl (Or.inl hxq)
  · by_cases hxw : K.predecessorPair.x = F.pair.w
    · exact Or.inl (Or.inr hxw)
    · right
      apply K.exists_commonDeletionTwoCenterPacket_of_fixedClass
        T.terminal (postEntryCarrier_subset_ambient)
      exact T.erased_mem_alternateClass_of_avoids_originalPair
        K.predecessorPair.x_mem_erased hxq hxw

/- ## Cycle arm -/

/-- On the all-alternate-source cycle arm, the first actual-blocker successor
is again a coherent robust mate and its exact classifier is OMISSION. -/
theorem SourceExactMinimalActualBlockerCycle.exists_alternateRadius_successorMate_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hall : ∀ i : Fin K.period,
      (K.source i).1 ∈
        SelectedClass D.A S.oppApex1 E.alternateRadius) :
    ∃ Q : AmbientRobustHistoryPair D S T.terminal.carrier
        E.alternateRadius,
      Q.x = (K.source
        ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩).1 ∧
      Q.y = (K.source ⟨1, K.two_le_period⟩).1 ∧
      Q.y = H.centerAt Q.x
        (mem_selectedClass.mp Q.x_mem_class).1 ∧
      ActualBlockerOmissionOutcome Q H := by
  classical
  let i0 : Fin K.period :=
    ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩
  let i1 : Fin K.period := ⟨1, K.two_le_period⟩
  let x := (K.source i0).1
  let y := (K.source i1).1
  have hedge : H.blockerVertex (K.source i0) = K.source i1 := by
    simp [i0, i1, SourceExactMinimalActualBlockerCycle.source]
  have hxy : x ≠ y := by
    intro h
    have hsources : K.source i0 = K.source i1 := Subtype.ext h
    have hindices := K.source_injective hsources
    have hvals := congrArg Fin.val hindices
    simp [i0, i1] at hvals
  have hxErased : x ∈ D.A \ T.terminal.carrier := by
    simpa [x] using K.source_mem_erased_at i0
  have hyErased : y ∈ D.A \ T.terminal.carrier := by
    simpa [y] using K.source_mem_erased_at i1
  have hxClass :
      x ∈ SelectedClass D.A S.oppApex1 E.alternateRadius := by
    simpa [x] using hall i0
  have hyClass :
      y ∈ SelectedClass D.A S.oppApex1 E.alternateRadius := by
    simpa [y] using hall i1
  have hxOff : x ∉ S.surplusCap := by
    rcases K.exists_pair_at_source_at i0 with ⟨rho0, P0, hsource0⟩
    simpa [x, hsource0] using P0.x_off_surplus
  have hyOff : y ∉ S.surplusCap := by
    rcases K.exists_pair_at_source_at i1 with ⟨rho1, P1, hsource1⟩
    simpa [y, hsource1] using P1.x_off_surplus
  have hstrict :
      x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∨
        y ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
    by_cases hxOpp2 : x ∈ S.oppCap2
    · right
      have hyNotOpp2 : y ∉ S.oppCap2 := by
        intro hyOpp2
        let DS : CounterexampleData :=
          { A := D.A
            nonempty := D.nonempty
            convex := D.convex
            K4 := D.K4
            packet := S }
        have hone :=
          U2NonSurplusSqueeze.oppApex1_otherCap_one_hit
            DS E.alternateRadius
        rw [Finset.card_le_one] at hone
        have hxInter :
            x ∈ (D.A.filter fun z =>
                dist z S.oppApex1 = E.alternateRadius) ∩ S.oppCap2 := by
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_filter.mpr
              ⟨(mem_selectedClass.mp hxClass).1, by
                simpa [dist_comm] using
                  (mem_selectedClass.mp hxClass).2⟩,
              hxOpp2⟩
        have hyInter :
            y ∈ (D.A.filter fun z =>
                dist z S.oppApex1 = E.alternateRadius) ∩ S.oppCap2 := by
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_filter.mpr
              ⟨(mem_selectedClass.mp hyClass).1, by
                simpa [dist_comm] using
                  (mem_selectedClass.mp hyClass).2⟩,
              hyOpp2⟩
        exact hxy (hone x (by simpa [DS] using hxInter)
          y (by simpa [DS] using hyInter))
      exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps S
        (mem_selectedClass.mp hyClass).1 hyOff hyNotOpp2
    · left
      exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps S
        (mem_selectedClass.mp hxClass).1 hxOff hxOpp2
  rcases T.terminal.terminal with
    ⟨q, w, hradius, _hqTerminal, _hwTerminal, _hqw, hfixedCard,
      hsecondTerminal⟩
  have hcarrierSub : T.terminal.carrier ⊆ D.A :=
    T.terminal.carrier_subset.trans postEntryCarrier_subset_ambient
  have hfirstDouble :
      HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) S.oppApex1 := by
    refine ⟨E.alternateRadius, hradius, ?_⟩
    have hfourCarrier :
        4 ≤ (SelectedClass T.terminal.carrier S.oppApex1
          E.alternateRadius).card := by
      rcases hfixedCard with h | h <;> omega
    have hsub :
        SelectedClass T.terminal.carrier S.oppApex1 E.alternateRadius ⊆
          SelectedClass ((D.A.erase x).erase y) S.oppApex1
            E.alternateRadius := by
      intro z hz
      rcases mem_selectedClass.mp hz with ⟨hzCarrier, hzdist⟩
      have hzx : z ≠ x := by
        intro hzx
        exact (Finset.mem_sdiff.mp hxErased).2
          (by simpa [hzx] using hzCarrier)
      have hzy : z ≠ y := by
        intro hzy
        exact (Finset.mem_sdiff.mp hyErased).2
          (by simpa [hzy] using hzCarrier)
      exact mem_selectedClass.mpr
        ⟨Finset.mem_erase.mpr
          ⟨hzy, Finset.mem_erase.mpr
            ⟨hzx, hcarrierSub hzCarrier⟩⟩,
          hzdist⟩
    simpa [SelectedClass] using
      le_trans hfourCarrier (Finset.card_le_card hsub)
  have hsecondDouble :
      HasNEquidistantPointsAt 4 ((D.A.erase x).erase y) S.oppApex2 := by
    apply equidistant_mono_spent (h := hsecondTerminal)
    intro z hz
    have hzCarrier : z ∈ T.terminal.carrier :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
    have hzx : z ≠ x := by
      intro hzx
      exact (Finset.mem_sdiff.mp hxErased).2
        (by simpa [hzx] using hzCarrier)
    have hzy : z ≠ y := by
      intro hzy
      exact (Finset.mem_sdiff.mp hyErased).2
        (by simpa [hzy] using hzCarrier)
    exact Finset.mem_erase.mpr
      ⟨hzy, Finset.mem_erase.mpr
        ⟨hzx, hcarrierSub hzCarrier⟩⟩
  let Q : AmbientRobustHistoryPair D S T.terminal.carrier
      E.alternateRadius :=
    { x := x
      y := y
      x_mem_erased := hxErased
      y_mem_erased := hyErased
      x_mem_class := hxClass
      y_mem_class := hyClass
      x_ne_y := hxy
      x_off_surplus := hxOff
      y_off_surplus := hyOff
      first_double := hfirstDouble
      second_double := hsecondDouble
      strict_endpoint := hstrict }
  have hQx : Q.x = (K.source i0).1 := rfl
  have hQy : Q.y = (K.source i1).1 := rfl
  have hQblocker :
      Q.y = H.centerAt Q.x (mem_selectedClass.mp Q.x_mem_class).1 := by
    have hvalue := congrArg Subtype.val hedge
    simpa [Q, x, y, i0, CriticalShellSystem.blockerVertex] using hvalue.symm
  have hOmission : ActualBlockerOmissionOutcome Q H := by
    rcases
        ActualBlockerCapMetricOutcome.hit_or_omission
          (AmbientRobustHistoryPair.actualBlocker_capMetricClassifier Q H) with
      hhit | homission
    · exfalso
      let hxA := (mem_selectedClass.mp Q.x_mem_class).1
      let shell := (H.selectedAt Q.x hxA).toCriticalFourShell
      have hySupport : Q.y ∈ shell.support := by
        simpa [shell, hxA] using hhit.1
      have hyCenter : Q.y = H.centerAt Q.x hxA := by
        simpa [hxA] using hQblocker
      exact shell.center_not_mem_support
        (by simpa [hyCenter] using hySupport)
    · exact homission
  refine ⟨Q, ?_, ?_, hQblocker, hOmission⟩
  · simpa [i0] using hQx
  · simpa [i1] using hQy

/-- Every all-alternate-source spent-entry cycle produces the existing
common-deletion packet. -/
theorem SourceExactMinimalActualBlockerCycle.exists_commonDeletionTwoCenterPacket_of_all_sources_alternate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hall : ∀ i : Fin K.period,
      (K.source i).1 ∈
        SelectedClass D.A S.oppApex1 E.alternateRadius) :
    ∃ deleted : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted deleted S.oppApex2) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_alternateRadius_successorMate_omission
        K hall with
    ⟨Q, _hsource, _hmate, hmateBlocker, homission⟩
  let hxA : Q.x ∈ D.A := (mem_selectedClass.mp Q.x_mem_class).1
  have hblockerNeSecond :
      H.centerAt Q.x hxA ≠ S.oppApex2 := by
    simpa [hxA] using
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 Q H
  have hdeletedNeSecond : Q.y ≠ S.oppApex2 := by
    intro hySecond
    exact hblockerNeSecond (hmateBlocker.symm.trans hySecond)
  have hsurvivesBlocker :
      HasNEquidistantPointsAt 4 (D.A.erase Q.y) Q.y := by
    change Q.y ∉
        (H.selectedAt Q.x hxA).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4 (D.A.erase Q.y)
        (H.centerAt Q.x hxA) ∧
      dist (H.centerAt Q.x hxA) Q.y ≠
        dist (H.centerAt Q.x hxA) Q.x at homission
    simpa [hxA, ← hmateBlocker] using homission.2.1
  have hsurvivesSecond :
      HasNEquidistantPointsAt 4 (D.A.erase Q.y) S.oppApex2 := by
    apply equidistant_mono_spent (h := Q.second_double)
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨hzy, hzEraseX⟩
    exact Finset.mem_erase.mpr
      ⟨hzy, (Finset.mem_erase.mp hzEraseX).2⟩
  refine ⟨Q.y, ?_⟩
  exact nonempty_commonDeletionTwoCenterPacket H
    (mem_selectedClass.mp Q.y_mem_class).1
    (mem_selectedClass.mp Q.y_mem_class).1
    (oppApex2_mem_ambient S)
    hdeletedNeSecond
    hsurvivesBlocker
    hsurvivesSecond

/-- The named original-pair return is the only cycle residual left after the
spent-entry cycle split; the complementary arm reaches common deletion. -/
theorem SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_exists_commonDeletionTwoCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    SpentEntryCycleHitsOriginalPair F K ∨
      ∃ deleted : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket
          D H deleted deleted S.oppApex2) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_all_sources_mem_alternateClass
        K with
    hhit | hall
  · exact Or.inl hhit
  · exact Or.inr
      (Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_commonDeletionTwoCenterPacket_of_all_sources_alternate
        K hall)

/-- End-to-end spent-entry orbit reduction.  Apart from a terminal predecessor
or a canonical cycle source returning to the original frontier pair, either
orbit outcome reaches the existing common-deletion interface. -/
theorem AmbientRobustHistoryPair.spentEntryOrbit_originalPairHit_or_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    (P : AmbientRobustHistoryPair D S T.terminal.carrier rho)
    (horbit :
      (∃ n : ℕ,
        ((H.blockerVertex^[n])
          (actualBlockerStartVertex P)).1 ∈ T.terminal.carrier) ∨
        Nonempty (SourceExactMinimalActualBlockerCycle P H)) :
    (∃ K : LeastPositiveTerminalHitPredecessor P H,
        SpentEntryTerminalPredecessorHitsOriginalPairAndActualBlockerHit K) ∨
      (∃ K : SourceExactMinimalActualBlockerCycle P H,
        SpentEntryCycleHitsOriginalPair F K) ∨
      ∃ deleted center₁ : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket
          D H deleted center₁ S.oppApex2) := by
  rcases horbit with hhit | hcycle
  · rcases
        Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
          P H T.ambient_history hhit with
      ⟨K⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.LeastPositiveTerminalHitPredecessor.hitsOriginalPairAndActualBlockerHit_or_exists_commonDeletionTwoCenterPacket
          K with
      hentry | hpacket
    · exact Or.inl ⟨K, hentry⟩
    · right
      right
      rcases hpacket with ⟨deleted, hpacket⟩
      exact ⟨deleted,
        H.centerAt K.predecessorPair.x
          (mem_selectedClass.mp K.predecessorPair.x_mem_class).1,
        hpacket⟩
  · rcases hcycle with ⟨K⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_exists_commonDeletionTwoCenterPacket
          K with
      hentry | hpacket
    · exact Or.inr (Or.inl ⟨K, hentry⟩)
    · rcases hpacket with ⟨deleted, hpacket⟩
      exact Or.inr (Or.inr ⟨deleted, deleted, hpacket⟩)

/-- Consumer-facing form from any point erased after the spent frontier
entry.  It exposes a source-faithful alternate-radius orbit and the exact two
original-pair return residuals left before common deletion. -/
theorem SpentEntryAlternateRadiusTerminal.exists_alternateRadiusOrbit_originalPairHit_or_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    {x : ℝ²}
    (hx : x ∈ ((D.A.erase F.pair.q).erase F.pair.w) \
      T.terminal.carrier) :
    ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier
        E.alternateRadius,
      P.x = x ∧
        ((∃ K : LeastPositiveTerminalHitPredecessor P H,
            SpentEntryTerminalPredecessorHitsOriginalPairAndActualBlockerHit K) ∨
          (∃ K : SourceExactMinimalActualBlockerCycle P H,
            SpentEntryCycleHitsOriginalPair F K) ∨
          ∃ deleted center₁ : ℝ²,
            Nonempty (CommonDeletionTwoCenterPacket
              D H deleted center₁ S.oppApex2)) := by
  rcases T.exists_alternateRadiusOrbit_of_postEntry_erased hx with
    ⟨P, hsource, horbit⟩
  exact ⟨P, hsource,
    Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.spentEntryOrbit_originalPairHit_or_commonDeletion
      T P horbit⟩

#print axioms AmbientRobustHistoryPair.exists_commonDeletionTwoCenterPacket_of_actualBlockerOmission
#print axioms LeastPositiveTerminalHitPredecessor.exists_commonDeletionTwoCenterPacket_of_fixedClass
#print axioms LeastPositiveTerminalHitPredecessor.hitsOriginalPairAndActualBlockerHit_or_exists_commonDeletionTwoCenterPacket
#print axioms LeastPositiveTerminalHitPredecessor.hitsOriginalPair_or_exists_commonDeletionTwoCenterPacket
#print axioms SourceExactMinimalActualBlockerCycle.exists_alternateRadius_successorMate_omission
#print axioms SourceExactMinimalActualBlockerCycle.exists_commonDeletionTwoCenterPacket_of_all_sources_alternate
#print axioms SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_exists_commonDeletionTwoCenterPacket
#print axioms AmbientRobustHistoryPair.spentEntryOrbit_originalPairHit_or_commonDeletion
#print axioms SpentEntryAlternateRadiusTerminal.exists_alternateRadiusOrbit_originalPairHit_or_commonDeletion

end ATailRFullParentEntryScratch
end Problem97
