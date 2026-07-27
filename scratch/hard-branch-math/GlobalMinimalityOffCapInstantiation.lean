import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
Source-clean instantiation of global minimality for the hard cap-eight branch.

Delete every carrier point outside the indexed first opposite cap.  The two
source-exact collision rows each have two such points, so the deletion is
nonempty.  The cap-eight hypothesis leaves a nonempty carrier.  Global
minimality therefore returns a center *in the cap* and a nonempty blocking
core consisting entirely of points *outside the cap*.

This is the strongest immediate ordered-cap placement supplied by the current
minimality API.  It still returns only one equidistant cap center in the
shared-radius arm, or a `MinimalDeletionCore` in the other arm.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace HardBranchGlobalMinimalityScratch

open ATailGlobalMinimalDeletion
open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

theorem exists_capCenter_sharedOutsidePair_or_offCapMinimalCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hcapEight : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (hPOutside :
      ((H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1).card = 2) :
    ∃ center ∈ S.capByIndex S.oppIndex1, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ D.A \ S.capByIndex S.oppIndex1 ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  let C := S.capByIndex S.oppIndex1
  let U := D.A \ C
  have hUsub : U ⊆ D.A := by
    exact Finset.sdiff_subset
  have hUne : U.Nonempty := by
    have hOffPos :
        0 <
          ((H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support \ C).card := by
      change
        0 <
          ((H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1).card
      rw [hPOutside]
      omega
    rcases Finset.card_pos.mp hOffPos with ⟨q, hqOff⟩
    have hqSupport :
        q ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support :=
      (Finset.mem_sdiff.mp hqOff).1
    have hqA : q ∈ D.A :=
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_subset_A hqSupport
    exact ⟨q, Finset.mem_sdiff.mpr
      ⟨hqA, (Finset.mem_sdiff.mp hqOff).2⟩⟩
  have hremaining : (D.A \ U).Nonempty := by
    have hCPos : 0 < C.card := by
      change 0 < (S.capByIndex S.oppIndex1).card
      omega
    rcases Finset.card_pos.mp hCPos with ⟨x, hxC⟩
    have hxA : x ∈ D.A :=
      S.capByIndex_subset S.oppIndex1 hxC
    refine ⟨x, Finset.mem_sdiff.mpr ⟨hxA, ?_⟩⟩
    intro hxU
    exact (Finset.mem_sdiff.mp hxU).2 hxC
  rcases exists_fresh_sharedRadiusPair_or_minimalDeletionCore
      R.minimal hUsub hUne hremaining with
    ⟨center, hcenterRemaining, V, hVne, hVsub, hblocked, hsplit⟩
  have hcenterCap : center ∈ C := by
    rcases Finset.mem_sdiff.mp hcenterRemaining with
      ⟨hcenterA, hcenterNotU⟩
    apply Classical.not_not.mp
    intro hcenterNotCap
    exact hcenterNotU
      (Finset.mem_sdiff.mpr ⟨hcenterA, hcenterNotCap⟩)
  exact ⟨center, by simpa [C] using hcenterCap, V, hVne,
    by simpa [U, C] using hVsub, hblocked, hsplit⟩

#print axioms exists_capCenter_sharedOutsidePair_or_offCapMinimalCore

end HardBranchGlobalMinimalityScratch
end Problem97
