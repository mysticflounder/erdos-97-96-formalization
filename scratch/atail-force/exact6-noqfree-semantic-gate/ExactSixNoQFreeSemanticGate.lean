/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix

/-!
# Exact-six named-blocker deletion-criticality manifest

This scratch module exposes the full `CriticalShellSystem.no_qfree_at`
semantics at the three actual critical rows named by the exact-six mutual
parent: the continuation unused-source row and the two mutual-omission rows.
The statement is deliberately about every positive radius after deleting the
actual source, not merely exactness of the represented critical radius.

No additional row, center, or source is introduced.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactSixNoQFreeSemanticGate

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- Negating `HasNEquidistantPointsAt 4` is exactly the assertion that every
positive-radius class has cardinality less than four. -/
theorem all_positive_radius_classes_card_lt_four
    {A : Finset ℝ²} {source blocker : ℝ²}
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) blocker) :
    ∀ r : ℝ, 0 < r →
      ((A.erase source).filter fun point ↦ dist blocker point = r).card < 4 := by
  intro r hr
  have hnot :
      ¬ 4 ≤
        ((A.erase source).filter fun point ↦ dist blocker point = r).card := by
    intro hcard
    exact hblocked ⟨r, hr, hcard⟩
  omega

/-- The exact-six mutual parent names exactly three source-faithful critical
rows before any additional all-center expansion.  Each named row retains the
complete deletion-critical semantic: after deleting its actual source, no
positive radius at its actual blocker contains four carrier points. -/
structure ExactSixMutualNamedBlockerSemanticManifest
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) : Prop where
  secondCap_card_eq_six : S.oppCap2.card = 6
  unused_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase M.continuation.unusedRow.unused.point)
      (H.centerAt M.continuation.unusedRow.unused.point
        M.continuation.unusedRow.source_mem_A)
  mutualSource_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase M.pair.source.1)
      (H.centerAt M.pair.source.1 (PhysicalVertex.mem_A M.pair.source))
  mutualTarget_deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase M.pair.target.1)
      (H.centerAt M.pair.target.1 (PhysicalVertex.mem_A M.pair.target))
  unused_all_positive_radius_classes_card_lt_four :
    ∀ r : ℝ, 0 < r →
      ((D.A.erase M.continuation.unusedRow.unused.point).filter fun point ↦
        dist
          (H.centerAt M.continuation.unusedRow.unused.point
            M.continuation.unusedRow.source_mem_A)
          point = r).card < 4
  mutualSource_all_positive_radius_classes_card_lt_four :
    ∀ r : ℝ, 0 < r →
      ((D.A.erase M.pair.source.1).filter fun point ↦
        dist
          (H.centerAt M.pair.source.1 (PhysicalVertex.mem_A M.pair.source))
          point = r).card < 4
  mutualTarget_all_positive_radius_classes_card_lt_four :
    ∀ r : ℝ, 0 < r →
      ((D.A.erase M.pair.target.1).filter fun point ↦
        dist
          (H.centerAt M.pair.target.1 (PhysicalVertex.mem_A M.pair.target))
          point = r).card < 4

/-- The named-blocker semantic manifest is theorem-derived directly from the
single retained critical system.  Exact cap six is retained only as the orbit
boundary; deletion-criticality itself is uniform in the carrier size. -/
theorem exactSixMutualNamedBlockerSemanticManifest
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile)
    (hcap : S.oppCap2.card = 6) :
    ExactSixMutualNamedBlockerSemanticManifest M := by
  let hunused := H.no_qfree_at M.continuation.unusedRow.unused.point
    M.continuation.unusedRow.source_mem_A
  let hsource := H.no_qfree_at M.pair.source.1
    (PhysicalVertex.mem_A M.pair.source)
  let htarget := H.no_qfree_at M.pair.target.1
    (PhysicalVertex.mem_A M.pair.target)
  exact {
    secondCap_card_eq_six := hcap
    unused_deletion_blocked := hunused
    mutualSource_deletion_blocked := hsource
    mutualTarget_deletion_blocked := htarget
    unused_all_positive_radius_classes_card_lt_four :=
      all_positive_radius_classes_card_lt_four hunused
    mutualSource_all_positive_radius_classes_card_lt_four :=
      all_positive_radius_classes_card_lt_four hsource
    mutualTarget_all_positive_radius_classes_card_lt_four :=
      all_positive_radius_classes_card_lt_four htarget }

#print axioms all_positive_radius_classes_card_lt_four
#print axioms exactSixMutualNamedBlockerSemanticManifest

end ExactSixNoQFreeSemanticGate
end Problem97
