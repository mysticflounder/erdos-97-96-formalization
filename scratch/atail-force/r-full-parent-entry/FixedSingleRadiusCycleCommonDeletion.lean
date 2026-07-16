/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleSuccessorMate
import ContinuationBankMatch

/-!
# Common deletion produced by a coherent fixed-radius cycle

The successor-mate theorem turns the first blocker edge of a coherent cycle
into an ambient robust pair whose mate is its actual blocker center.  The
OMISSION row therefore survives deletion of that center.  The pair's retained
second-apex double-deletion witness survives the same single deletion.  These
are precisely the two local witnesses consumed by the existing
`CommonDeletionTwoCenterPacket` constructor.

Thus both coherent orbit outcomes now feed the common-deletion family:
terminal hit via `FixedSingleRadiusTerminalCommonDeletion`, and a genuine
cycle via the theorem below.  The downstream aligned-pair/cycle foreclosure
remains open.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch
open ATailRTransitionLiveSurfaceScratch
open ATailContinuationBankMatchScratch

attribute [local instance] Classical.propDecidable

private theorem equidistant_mono_cycle
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, le_trans hcard (Finset.card_le_card (by
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
    exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩))⟩

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- A coherent fixed-radius actual-blocker cycle produces an existing common-
deletion packet.  The deleted point and first center are the same geometric
point—the successor/mate/actual blocker—while the second center is
`oppApex2`. -/
theorem SourceExactMinimalActualBlockerCycle.exists_commonDeletionTwoCenterPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    ∃ deleted : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted deleted S.oppApex2) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_fixedRadius_successorMate_omission
        K with
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
    apply equidistant_mono_cycle (h := Q.second_double)
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨hzy, hzEraseX⟩
    exact Finset.mem_erase.mpr
      ⟨hzy, (Finset.mem_erase.mp hzEraseX).2⟩
  refine ⟨Q.y, ?_⟩
  exact nonempty_commonDeletionTwoCenterPacket H
    (mem_selectedClass.mp Q.y_mem_class).1
    (mem_selectedClass.mp Q.y_mem_class).1
    (oppApex2_mem_A S)
    hdeletedNeSecond
    hsurvivesBlocker
    hsurvivesSecond

#print axioms SourceExactMinimalActualBlockerCycle.exists_commonDeletionTwoCenterPacket

end ATailRFullParentEntryScratch
end Problem97
