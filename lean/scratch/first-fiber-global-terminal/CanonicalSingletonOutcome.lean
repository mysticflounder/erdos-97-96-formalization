import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# The global-deletion outcome has a canonical singleton inhabitant

This exact-production-type scratch theorem records why the global-deletion
leaf does not narrow the fresh first-fiber arm: the fresh source's already
chosen critical shell supplies a singleton minimal-deletion core.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstFiberGlobalTerminal

open ATailBlockerMultiplicityGeometry
open ATailFrontierLiveClosure
open ATAILStageOneMinimalDeletionCore

attribute [local instance] Classical.propDecidable

theorem exists_canonicalSingletonGlobalDeletionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    Nonempty (FirstCapComplementGlobalDeletionOutcome S) := by
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
  refine ⟨{
    center := H.centerAt Q.source.1 Q.source.2
    center_mem_firstCap := hcenterCap
    deleted := {Q.source.1}
    deleted_nonempty := Finset.singleton_nonempty _
    deleted_subset_outside := ?_
    blocked := ?_
    restores := ?_
    geometry := Or.inr ?_ }⟩
  · intro x hx
    have hxq : x = Q.source.1 := Finset.mem_singleton.mp hx
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
