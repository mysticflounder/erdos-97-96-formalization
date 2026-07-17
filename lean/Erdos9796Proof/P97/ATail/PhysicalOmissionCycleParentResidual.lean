/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RobustLargeRadiusReduction

/-!
# Parent residual for the exact-five physical omission cycle

This module records the production boundary for the exact-five branch of the
large physical-radius reduction.  The residual keeps the complete parent
surface, a reconstructed first-apex critical-pair frontier, the origin-tagged
two-source continuation, and a physical omission cycle indexed by the same
concrete critical-shell system.

The cycle transition orbit is anchored at the continuation's first deletion
source.  The periodic base may occur later on that orbit, but the parent
consumer no longer loses the ingress source.

The common-deletion branch remains explicit.  This is a reduction interface,
not a geometric contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPhysicalOmissionCycleParentResidual

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The common-deletion sibling left explicit by the exact-five cycle
consumer. -/
structure CommonDeletionParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A) : Type where
  deleted : ℝ²
  center : ℝ²
  packet : ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
    D H deleted center S.oppApex2

/-- The exact-five production output at the robust large-radius parent. -/
structure ExactFivePhysicalCycleParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Type where
  profile : LargeCapUniqueFiveSecondApexRadius D S
  continuation :
    LargeCapUniqueFiveTwoCommonDeletionSources D S H profile
  cycle : PhysicalActualCriticalOmissionCycle H profile
  cycle_start_eq_first : cycle.start.1 = continuation.first
  profile_radius_eq_parent : profile.radius = F.radius

/-- The intended geometric-consumer surface.  The first-apex frontier and the
exact-five continuation use the same concrete critical-shell system. -/
structure FrontierCoupledExactFivePhysicalCycleParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Type where
  frontierRadius : ℝ
  frontierRadius_pos : 0 < frontierRadius
  frontierRadius_class_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex1 frontierRadius).card
  frontier : CriticalPairFrontier D S frontierRadius H
  exactFive : ExactFivePhysicalCycleParentResidual H F

/-- The exact remaining contradiction on the frontier-coupled exact-five
branch.  A theorem of this type is the mathematical consumer, while the
parent `False` theorem is only its assembler. -/
abbrev FalseOfFrontierCoupledExactFivePhysicalCycleParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Prop :=
  FrontierCoupledExactFivePhysicalCycleParentResidual H F → False

/-- Package a production exact-five arm while anchoring its transition orbit
at the first origin-tagged common-deletion source. -/
theorem nonempty_exactFivePhysicalCycleParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    Nonempty (ExactFivePhysicalCycleParentResidual H F) := by
  let start : PhysicalVertex profile :=
    ⟨continuation.first, continuation.first_mem_physicalInterior⟩
  rcases nonempty_physicalActualCriticalOmissionCycle_from_start
      H profile start with ⟨cycle, hstart⟩
  have hparentFour :
      4 ≤ (SelectedClass D.A S.oppApex2 F.radius).card := by
    have := F.radius_class_card_ge_five
    omega
  have hradius : F.radius = profile.radius :=
    profile.unique_K4_radius F.radius F.radius_pos hparentFour
  exact ⟨{
    profile := profile
    continuation := continuation
    cycle := cycle
    cycle_start_eq_first := by
      simpa [start] using congrArg Subtype.val hstart
    profile_radius_eq_parent := hradius.symm }⟩

/-- Restore the complete first-apex frontier around the exact-five cycle. -/
theorem nonempty_frontierCoupledExactFivePhysicalCycleParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile) :
    Nonempty (FrontierCoupledExactFivePhysicalCycleParentResidual H F) := by
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨frontierRadius, hradius, hfour, ⟨frontier⟩⟩
  rcases nonempty_exactFivePhysicalCycleParentResidual
      F profile continuation with ⟨exactFive⟩
  exact ⟨{
    frontierRadius := frontierRadius
    frontierRadius_pos := hradius
    frontierRadius_class_card_ge_four := hfour
    frontier := frontier
    exactFive := exactFive }⟩

/-- The common-deletion branch or the complete frontier-coupled exact-five
residual is the branch-complete output of the production large-radius
reduction. -/
theorem commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (CommonDeletionParentResidual (S := S) H) ∨
      Nonempty
        (FrontierCoupledExactFivePhysicalCycleParentResidual H F) := by
  rcases nonempty_reducedOutcome_of_largeSecondApexRadius H F with ⟨outcome⟩
  cases outcome with
  | commonDeletion deleted center packet =>
      exact Or.inl ⟨{
        deleted := deleted
        center := center
        packet := packet }⟩
  | exactUniqueFive profile continuation =>
      exact Or.inr
        (nonempty_frontierCoupledExactFivePhysicalCycleParentResidual
          F profile continuation)

/-- The two mathematical consumers sufficient to close a large-radius parent
surface.  Neither consumer is assumed by the production reduction above. -/
structure RobustLargeRadiusResidualConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Prop where
  commonDeletion :
    CommonDeletionParentResidual (S := S) H → False
  exactFiveCycle :
    FalseOfFrontierCoupledExactFivePhysicalCycleParentResidual H F

/-- Supplying both explicit consumers closes the large physical-radius
parent surface. -/
theorem false_of_largeSecondApexRadius_of_residualConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S)
    (C : RobustLargeRadiusResidualConsumers H F) : False := by
  rcases commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
      H F with hcommon | hexact
  · rcases hcommon with ⟨R⟩
    exact C.commonDeletion R
  · rcases hexact with ⟨R⟩
    exact C.exactFiveCycle R

#print axioms nonempty_exactFivePhysicalCycleParentResidual
#print axioms nonempty_frontierCoupledExactFivePhysicalCycleParentResidual
#print axioms commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
#print axioms false_of_largeSecondApexRadius_of_residualConsumers

end

end ATailPhysicalOmissionCycleParentResidual
end Problem97
