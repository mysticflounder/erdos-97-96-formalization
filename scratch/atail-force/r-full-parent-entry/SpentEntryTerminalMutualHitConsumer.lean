/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SpentEntryOriginalPairResidualReduction

/-!
# Closing the spent-entry terminal mutual-hit residual

The terminal mutual-hit packet is already downstream of a spent frontier
entry.  That spent certificate forces the first-apex double-deletion arm,
while the frontier itself retains the second-apex double-deletion witness.
Each double-deletion witness is monotone to deletion of either original
frontier point alone.

Consequently both original points are valid common deletions at the two
prescribed opposite apices.  No mutual-hit, cap-order, terminal-carrier, or
`IsM44` hypothesis is needed beyond the packet's ambient spent-entry context.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRActualBlockerTransitionScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A_terminalMutualHit
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A_terminalMutualHit
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_ne_oppApex2_terminalMutualHit
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

private theorem equidistant_mono_terminalMutualHit
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, le_trans hcard (Finset.card_le_card (by
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
    exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩))⟩

/-- At a spent frontier, deleting the original `q` alone preserves K4 at
both prescribed opposite apices. -/
theorem FrontierRadiusSpentAtEntry.originalQ_survives_both_apices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex2 := by
  constructor
  · apply equidistant_mono_terminalMutualHit
      (h := E.firstApexDouble)
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  · apply equidistant_mono_terminalMutualHit
      (h := F.secondApexDouble)
    intro z hz
    exact (Finset.mem_erase.mp hz).2

/-- At a spent frontier, deleting the original `w` alone preserves K4 at
both prescribed opposite apices. -/
theorem FrontierRadiusSpentAtEntry.originalW_survives_both_apices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex2 := by
  have hfirstSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex1 := by
    simpa [Finset.erase_right_comm] using E.firstApexDouble
  have hsecondSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using F.secondApexDouble
  constructor
  · apply equidistant_mono_terminalMutualHit (h := hfirstSym)
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  · apply equidistant_mono_terminalMutualHit (h := hsecondSym)
    intro z hz
    exact (Finset.mem_erase.mp hz).2

/-- The spent-entry branch itself already produces common-deletion packets
for both original frontier points.  No terminal descent or blocker-orbit
analysis is required. -/
theorem FrontierRadiusSpentAtEntry.both_originalPoints_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) :
    Nonempty (CommonDeletionTwoCenterPacket
        D H F.pair.q S.oppApex1 S.oppApex2) ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D H F.pair.w S.oppApex1 S.oppApex2) := by
  have hq := E.originalQ_survives_both_apices
  have hw := E.originalW_survives_both_apices
  exact ⟨
    nonempty_commonDeletionTwoCenterPacket H
      F.pair.q_mem_A
      (oppApex1_mem_A_terminalMutualHit S)
      (oppApex2_mem_A_terminalMutualHit S)
      (oppApex1_ne_oppApex2_terminalMutualHit S)
      hq.1 hq.2,
    nonempty_commonDeletionTwoCenterPacket H
      F.pair.w_mem_A
      (oppApex1_mem_A_terminalMutualHit S)
      (oppApex2_mem_A_terminalMutualHit S)
      (oppApex1_ne_oppApex2_terminalMutualHit S)
      hw.1 hw.2⟩

/-- Bare entry-level consumer: every spent frontier is already in the
common-deletion continuation. -/
theorem FrontierRadiusSpentAtEntry.exists_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) :
    ∃ deleted center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted center₁ S.oppApex2) := by
  exact ⟨F.pair.q, S.oppApex1, E.both_originalPoints_commonDeletion.1⟩

/-- The exact terminal mutual-hit residual produces common-deletion packets
for both original frontier points, using the two prescribed opposite apices
as centers. -/
theorem SpentEntryTerminalOriginalPairMutualHitPacket.both_originalPoints_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    {K : LeastPositiveTerminalHitPredecessor P H}
    (_M : SpentEntryTerminalOriginalPairMutualHitPacket K) :
    Nonempty (CommonDeletionTwoCenterPacket
        D H F.pair.q S.oppApex1 S.oppApex2) ∧
      Nonempty (CommonDeletionTwoCenterPacket
        D H F.pair.w S.oppApex1 S.oppApex2) := by
  exact E.both_originalPoints_commonDeletion

/-- Bare consumer form: the terminal mutual-hit residual is not a separate
spent branch; it is already a common-deletion branch. -/
theorem SpentEntryTerminalOriginalPairMutualHitPacket.exists_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    {K : LeastPositiveTerminalHitPredecessor P H}
    (M : SpentEntryTerminalOriginalPairMutualHitPacket K) :
    ∃ deleted center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted center₁ S.oppApex2) := by
  exact ⟨F.pair.q, S.oppApex1, M.both_originalPoints_commonDeletion.1⟩

/-- End-to-end spent-entry orbit consumer with the terminal mutual-hit
residual eliminated.  Every terminal hit or actual-blocker cycle now reaches
the common-deletion continuation. -/
theorem AmbientRobustHistoryPair.spentEntryOrbit_exists_commonDeletion
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
    ∃ deleted center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted center₁ S.oppApex2) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.spentEntryOrbit_originalPairMutualHit_or_commonDeletion
        T P horbit with hmutual | hcommon
  · rcases hmutual with ⟨_K, ⟨M⟩⟩
    exact M.exists_commonDeletion
  · exact hcommon

#print axioms FrontierRadiusSpentAtEntry.originalQ_survives_both_apices
#print axioms FrontierRadiusSpentAtEntry.originalW_survives_both_apices
#print axioms FrontierRadiusSpentAtEntry.both_originalPoints_commonDeletion
#print axioms FrontierRadiusSpentAtEntry.exists_commonDeletion
#print axioms SpentEntryTerminalOriginalPairMutualHitPacket.both_originalPoints_commonDeletion
#print axioms SpentEntryTerminalOriginalPairMutualHitPacket.exists_commonDeletion
#print axioms AmbientRobustHistoryPair.spentEntryOrbit_exists_commonDeletion

end ATailRFullParentEntryScratch
end Problem97
