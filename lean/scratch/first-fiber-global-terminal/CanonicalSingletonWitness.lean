import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry
import Erdos9796Proof.P97.ATail.MinimalDeletionCore

/-!
# Canonical singleton witness for the first-fiber branch

This bounded scratch theorem packages exactly the data used by the canonical
singleton arm of `FirstCapComplementGlobalDeletionOutcome`, without importing
the currently rebuilding coordinator module.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstFiberGlobalTerminal

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATAILStageOneMinimalDeletionCore

attribute [local instance] Classical.propDecidable

/-- A fresh source in the known first blocker fiber itself supplies a
cap-localized singleton blocking deletion, restoration after its only member
is erased, and a singleton `MinimalDeletionCore`. -/
theorem exists_canonicalSingletonDeletionWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    H.centerAt Q.source.1 Q.source.2 ∈
        S.capByIndex S.oppIndex1 ∧
      ({Q.source.1} : Finset ℝ²).Nonempty ∧
      ({Q.source.1} : Finset ℝ²) ⊆
        D.A \ S.capByIndex S.oppIndex1 ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A \ ({Q.source.1} : Finset ℝ²))
        (H.centerAt Q.source.1 Q.source.2) ∧
      (∀ s ∈ ({Q.source.1} : Finset ℝ²),
        HasNEquidistantPointsAt 4
          (D.A \ (({Q.source.1} : Finset ℝ²).erase s))
          (H.centerAt Q.source.1 Q.source.2)) ∧
      Nonempty
        (MinimalDeletionCore
          D.A ({Q.source.1} : Finset ℝ²)
          (H.centerAt Q.source.1 Q.source.2)) := by
  classical
  have hcenterEq :
      H.centerAt Q.source.1 Q.source.2 =
        H.centerAt P.source₁ P.source₁_mem_A := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val Q.blockers_eq
  have hcenterCap :
      H.centerAt Q.source.1 Q.source.2 ∈
        S.capByIndex S.oppIndex1 := by
    rw [hcenterEq]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hcenterA :
      H.centerAt Q.source.1 Q.source.2 ∈ D.A :=
    S.capByIndex_subset S.oppIndex1 hcenterCap
  refine ⟨hcenterCap, Finset.singleton_nonempty _, ?_, ?_, ?_, ?_⟩
  · intro x hx
    have hxQ : x = Q.source.1 := Finset.mem_singleton.mp hx
    subst x
    exact Finset.mem_sdiff.mpr
      ⟨Q.source.2, Q.source_not_mem_firstCap⟩
  · simpa only [Finset.sdiff_singleton_eq_erase] using
      H.no_qfree_at Q.source.1 Q.source.2
  · intro s hs
    have hsQ : s = Q.source.1 := Finset.mem_singleton.mp hs
    subst s
    simpa using
      D.K4
        (H.centerAt Q.source.1 Q.source.2)
        hcenterA
  · refine ⟨{
      shellAt := ?_
      supports_pairwise_disjoint := ?_ }⟩
    · intro s
      rcases s with ⟨s, hs⟩
      have hsQ : s = Q.source.1 := Finset.mem_singleton.mp hs
      subst s
      exact H.selectedAt Q.source.1 Q.source.2
    · intro s t hst
      exfalso
      apply hst
      apply Subtype.ext
      exact
        (Finset.mem_singleton.mp s.2).trans
          (Finset.mem_singleton.mp t.2).symm

end FirstFiberGlobalTerminal
end Problem97

#print axioms
  Problem97.FirstFiberGlobalTerminal.exists_canonicalSingletonDeletionWitness
