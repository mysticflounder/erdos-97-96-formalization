/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerOmissionAdapter
import ContinuationBankMatch
import Erdos9796Proof.P97.U3ToU5DangerousTriple
import FixedSingleRadiusCycleSuccessorMate

/-!
# The self-centered common-deletion specialization

The coherent fixed-radius cycle produces a `CommonDeletionTwoCenterPacket`
whose deleted point is also its first center.  This specialization must not be
treated as an ordinary two-center coupling: deletion of the center itself
preserves every positive-radius K4 witness automatically.  Consequently the
bare packet is equivalent to the single substantive survival fact at its
second center.

The actual-blocker provenance contains more information than the bare packet.
The second theorem below constructs the packet while retaining the exact first
row selected at the predecessor source.  That row contains the predecessor,
omits the deleted blocker, and is the full positive-radius class centered at
the deleted blocker.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailRActualBlockerTransitionScratch
open ATailRTransitionLiveSurfaceScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- With fixed carrier membership and distinctness, a common-deletion packet
whose deleted point is its first center carries exactly one nonautomatic
survival assertion: survival at the second center. -/
theorem nonempty_commonDeletion_selfCenter_iff
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₂ : ℝ²}
    (hdeletedA : deleted ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : deleted ≠ center₂) :
    Nonempty (CommonDeletionTwoCenterPacket
      D H deleted deleted center₂) ↔
      HasNEquidistantPointsAt 4 (D.A.erase deleted) center₂ := by
  constructor
  · rintro ⟨C⟩
    exact C.survives₂
  · intro hsurvives₂
    exact nonempty_commonDeletionTwoCenterPacket H
      hdeletedA hdeletedA hcenter₂A hcenters
      (hasNEquidistantPointsAt_erase_center (D.K4 deleted hdeletedA))
      hsurvives₂

/-- Preserve the predecessor's exact actual-blocker row when constructing a
self-centered common-deletion packet.  In particular, the first row is not an
arbitrary four-point subset recovered from the survival proposition. -/
theorem ActualBlockerOmissionExactRowPacket.exists_selfCenteredCommonDeletion
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source deleted center₂ : ℝ²} {B₁ : Finset ℝ²}
    (R : ActualBlockerOmissionExactRowPacket
      D source deleted deleted B₁)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : deleted ≠ center₂)
    (hsurvives₂ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) center₂) :
    ∃ C : CommonDeletionTwoCenterPacket
        D H deleted deleted center₂,
      C.B₁ = B₁ ∧
        source ∈ C.B₁ ∧
        deleted ∉ C.B₁ ∧
        C.B₁ = D.A.filter fun z => dist deleted z = R.radius := by
  have hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) deleted :=
    R.deletion_survives
  have hsurvives₂' :
      HasNEquidistantPointsAt 4 (D.skeleton deleted) center₂ := by
    simpa [CounterexampleData.skeleton] using hsurvives₂
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hsurvives₂' with ⟨B₂, ⟨R₂⟩, hB₂⟩
  let C : CommonDeletionTwoCenterPacket
      D H deleted deleted center₂ :=
    { q_mem_A := R.mate_mem_A
      center₁_mem_A := R.mate_mem_A
      center₂_mem_A := hcenter₂A
      centers_ne := hcenters
      survives₁ := hsurvives₁
      survives₂ := hsurvives₂
      actual_blocker_ne_center₁ :=
        actual_blocker_ne_of_deletion_survives
          H R.mate_mem_A hsurvives₁
      actual_blocker_ne_center₂ :=
        actual_blocker_ne_of_deletion_survives
          H R.mate_mem_A hsurvives₂
      B₁ := B₁
      B₂ := B₂
      row₁ := R.qDeletedClass
      row₂ := R₂
      B₁_card := R.support_card
      B₂_card := hB₂
      overlap_le_two :=
        U5QDeletedK4Class.inter_card_le_two
          R.qDeletedClass R₂ hcenters }
  exact ⟨C, rfl, R.source_mem_support, R.mate_not_mem_support,
    R.support_eq_radiusClass⟩

private theorem oppApex2_mem_A_selfCentered
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- The cycle producer can retain the information discarded by the bare
common-deletion constructor: its first exact row is the predecessor source's
actual critical shell, so it contains that predecessor and is the full circle
centered at the deleted successor. -/
theorem SourceExactMinimalActualBlockerCycle.exists_sourcePreservingSelfCenteredCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    ∃ Q : AmbientRobustHistoryPair D S T.carrier radius,
      Q.x = (K.source
          ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩).1 ∧
        Q.y = (K.source ⟨1, K.two_le_period⟩).1 ∧
        ∃ (B₁ : Finset ℝ²)
            (R : ActualBlockerOmissionExactRowPacket
              D Q.x Q.y Q.y B₁)
            (C : CommonDeletionTwoCenterPacket
              D H Q.y Q.y S.oppApex2),
          C.B₁ = B₁ ∧
            Q.x ∈ C.B₁ ∧
            Q.y ∉ C.B₁ ∧
            C.B₁ = D.A.filter fun z => dist Q.y z = R.radius := by
  rcases
      SourceExactMinimalActualBlockerCycle.exists_fixedRadius_successorMate_omission
        K with ⟨Q, hsource, hmate, hmateBlocker, homission⟩
  let hxA : Q.x ∈ D.A := (mem_selectedClass.mp Q.x_mem_class).1
  let shell := (H.selectedAt Q.x hxA).toCriticalFourShell
  have R₀ := ActualBlockerOmissionOutcome.exactRowPacket homission
  change ActualBlockerOmissionExactRowPacket
    D Q.x Q.y (H.centerAt Q.x hxA) shell.support at R₀
  have R : ActualBlockerOmissionExactRowPacket
      D Q.x Q.y Q.y shell.support := by
    simpa [← hmateBlocker] using R₀
  have hdeletedNeSecond : Q.y ≠ S.oppApex2 := by
    intro hySecond
    exact (AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 Q H)
      (hmateBlocker.symm.trans hySecond)
  have hsurvivesSecond :
      HasNEquidistantPointsAt 4 (D.A.erase Q.y) S.oppApex2 := by
    apply hasNEquidistantPointsAt_mono (h := Q.second_double)
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨hzy, hzEraseX⟩
    exact Finset.mem_erase.mpr
      ⟨hzy, (Finset.mem_erase.mp hzEraseX).2⟩
  rcases R.exists_selfCenteredCommonDeletion
      (H := H) (oppApex2_mem_A_selfCentered S)
      hdeletedNeSecond hsurvivesSecond with
    ⟨C, hfirst, hsourceFirst, hdeletedFirst, hfirstRadius⟩
  exact ⟨Q, hsource, hmate, shell.support, R, C,
    hfirst, hsourceFirst, hdeletedFirst, hfirstRadius⟩

#print axioms nonempty_commonDeletion_selfCenter_iff
#print axioms ActualBlockerOmissionExactRowPacket.exists_selfCenteredCommonDeletion
#print axioms SourceExactMinimalActualBlockerCycle.exists_sourcePreservingSelfCenteredCommonDeletion

end ATailRFullParentEntryScratch
end Problem97
