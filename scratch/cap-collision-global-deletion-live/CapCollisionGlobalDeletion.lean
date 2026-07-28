import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
Source-clean global-minimality instantiation for the live cap-source/first-fiber
branch.

The retained cap-eight bound leaves a carrier point after deleting the
complement of the first indexed cap.  The fresh outside blocker-fiber source
makes that complement nonempty.  Global minimality therefore supplies a center
in the cap and a nonempty blocking subdeletion outside it.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CapCollisionGlobalDeletionLiveScratch

open ATailGlobalMinimalDeletion
open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open ATailBlockerMultiplicityGeometry

attribute [local instance] Classical.propDecidable

theorem exists_capCenter_sharedOutsidePair_or_offCapMinimalCore_of_firstFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ)) :
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
  have hcapEight : 8 ≤ (S.capByIndex S.oppIndex1).card :=
    hcapSource.1
  have hUsub : U ⊆ D.A := Finset.sdiff_subset
  rcases hfirst with ⟨Q⟩
  have hUne : U.Nonempty := by
    refine ⟨Q.source.1, Finset.mem_sdiff.mpr ⟨Q.source.2, ?_⟩⟩
    simpa [C] using Q.source_not_mem_firstCap
  have hremaining : (D.A \ U).Nonempty := by
    have hCPos : 0 < C.card := by
      change 0 < (S.capByIndex S.oppIndex1).card
      omega
    rcases Finset.card_pos.mp hCPos with ⟨x, hxC⟩
    have hxA : x ∈ D.A :=
      S.capByIndex_subset S.oppIndex1 (by simpa [C] using hxC)
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

#print axioms
  exists_capCenter_sharedOutsidePair_or_offCapMinimalCore_of_firstFiber

end CapCollisionGlobalDeletionLiveScratch
end Problem97
