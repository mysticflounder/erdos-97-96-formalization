import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
The four blocker/source equality alternatives in
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
do not directly prove the correspondingly named cross hit.  Each identified
foreign source is the center of that shell, and hence is excluded from its
support.

This is a small checked obstruction certificate for proof search; it is not a
production theorem and intentionally lives under `scratch/`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ScratchPacketContradictionSearch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

theorem correspondingCrossHits_impossible_of_blockerSourceEqualities
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    (H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ →
      Pρ.source₁ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support) ∧
    (H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ →
      Pρ.source₂ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support) ∧
    (H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ →
      P.source₁ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) ∧
    (H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂ →
      P.source₂ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support) := by
  constructor
  · intro hEq hmem
    apply
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    simpa only [hEq] using hmem
  constructor
  · intro hEq hmem
    apply
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    simpa only [hEq] using hmem
  constructor
  · intro hEq hmem
    apply
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    simpa only [hEq] using hmem
  · intro hEq hmem
    apply
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support
    simpa only [hEq] using hmem

end ScratchPacketContradictionSearch
end Problem97

#print axioms
  Problem97.ScratchPacketContradictionSearch.correspondingCrossHits_impossible_of_blockerSourceEqualities
