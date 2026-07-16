/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleConsequence
import LeastTerminalHitPredecessor
import ContinuationBankMatch
import PrescribedDeletionEdge

/-!
# Common deletion at a coherent fixed-radius terminal hit

At the source-exact predecessor of the least positive actual-blocker hit, the
critical shell contains its erased source.  That source lies on the fixed
first-apex circle.  The two terminal endpoints also lie on the fixed circle,
are retained, and are distinct, while a critical shell centered away from the
first apex meets the fixed circle in at most two points.  Hence the shell omits
at least one terminal endpoint.

Deleting that endpoint preserves K4 both at the predecessor's actual blocker
and at the second opposite apex.  The existing public constructor therefore
produces a `CommonDeletionTwoCenterPacket` at those two distinct centers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailContinuationBankMatchScratch
open ATailPrescribedDeletionEdge
open ATailRTransitionLiveSurfaceScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- On the coherent fixed-single-radius terminal-hit arm, one of the named
terminal endpoints is a common deletion for the least-hit predecessor's
actual blocker and the second opposite apex. -/
theorem LeastPositiveTerminalHitPredecessor.exists_commonDeletionTwoCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : LeastPositiveTerminalHitPredecessor P H) :
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
  have hqCarrier : q ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqMarginal).1).1
  have hwCarrier : w ∈ T.carrier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwMarginal).1).1
  have hqA : q ∈ D.A := T.carrier_subset hqCarrier
  have hwA : w ∈ D.A := T.carrier_subset hwCarrier
  have hqFixed : q ∈ SelectedClass D.A S.oppApex1 radius := by
    refine mem_selectedClass.mpr ⟨hqA, ?_⟩
    simpa [dist_comm] using
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hqMarginal).1).2
  have hwFixed : w ∈ SelectedClass D.A S.oppApex1 radius := by
    refine mem_selectedClass.mpr ⟨hwA, ?_⟩
    simpa [dist_comm] using
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hwMarginal).1).2
  have hxFixed : Q.x ∈ SelectedClass D.A S.oppApex1 radius :=
    (T.pair_endpoints_mem_fixedClass Q).1
  have hxNotCarrier : Q.x ∉ T.carrier :=
    (Finset.mem_sdiff.mp Q.x_mem_erased).2
  have hx_ne_q : Q.x ≠ q := by
    intro hxq
    apply hxNotCarrier
    simpa [hxq] using hqCarrier
  have hx_ne_w : Q.x ≠ w := by
    intro hxw
    apply hxNotCarrier
    simpa [hxw] using hwCarrier
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
  have happApex2A : S.oppApex2 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
    · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem
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
            T.carrier_subset (Finset.mem_erase.mp hzEraseQ).2⟩,
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
      ⟨Finset.mem_erase.mpr ⟨hzw, T.carrier_subset hzCarrier⟩, hzDist⟩
  rcases hq_or_hw_omitted with hqOmitted | hwOmitted
  · refine ⟨q, ?_⟩
    exact nonempty_commonDeletionTwoCenterPacket H hqA hblockerA
      happApex2A hcenters
      (deletion_survives_of_not_mem_selected_support
        shell.toSelectedFourClass hqOmitted)
      hqSecond
  · refine ⟨w, ?_⟩
    exact nonempty_commonDeletionTwoCenterPacket H hwA hblockerA
      happApex2A hcenters
      (deletion_survives_of_not_mem_selected_support
        shell.toSelectedFourClass hwOmitted)
      hwSecond

#print axioms LeastPositiveTerminalHitPredecessor.exists_commonDeletionTwoCenterPacket

end ATailRFullParentEntryScratch
end Problem97
