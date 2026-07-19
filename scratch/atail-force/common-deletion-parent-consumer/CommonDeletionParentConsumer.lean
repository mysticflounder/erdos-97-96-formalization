/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PhysicalOmissionCycleParentResidual
import Erdos9796Proof.P97.ATail.DeletionRobustness

/-!
# Scratch: the common-deletion residual on its full parent surface

The production common-deletion residual is not an independent alternative to
full deletion robustness at the physical second apex.  Its parent already
contains a positive radius class of cardinality at least five there, so every
single carrier deletion preserves K4 at that apex.

This file restores the independently available first-apex critical-pair
frontier around the common-deletion residual and records the resulting exact
normal form.  It proves a reduction, not a direct contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCommonDeletionParentConsumerScratch

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailPhysicalOmissionCycleParentResidual
open ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The large-radius parent itself makes the physical second apex robust under
every single carrier deletion.  No common-deletion row is needed for this
conclusion. -/
theorem parent_secondApexFullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (F : RobustLargeRadiusParentSurface D S) :
    FullyDeletionRobustAt D S.oppApex2 :=
  fullyDeletionRobustAt_of_five_le_selectedClass
    F.radius_pos F.radius_class_card_ge_five

/-- Exact projection of a common-deletion residual at the live parent: its
physical second center is already fully deletion-robust. -/
theorem commonDeletionParentResidual_secondApexFullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (_R : CommonDeletionParentResidual (S := S) H)
    (F : RobustLargeRadiusParentSurface D S) :
    FullyDeletionRobustAt D S.oppApex2 :=
  parent_secondApexFullyDeletionRobust F

/-- Consequently the physical second apex is absent from the complete image
of the retained critical map, not only from the blocker attached to the
common-deletion source. -/
theorem commonDeletionParentResidual_allActualBlockers_ne_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (R : CommonDeletionParentResidual (S := S) H)
    (F : RobustLargeRadiusParentSurface D S)
    (source : ℝ²) (hsource : source ∈ D.A) :
    H.centerAt source hsource ≠ S.oppApex2 :=
  (commonDeletionParentResidual_secondApexFullyDeletionRobust R F).centerAt_ne
    H source hsource

/-- Full faithful surface for the common-deletion arm.  The first-apex
frontier, common-deletion packet, parent large radius, and total critical map
all refer to the same carrier and the same concrete critical system. -/
structure FrontierCoupledCommonDeletionParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Type where
  frontierRadius : ℝ
  frontierRadius_pos : 0 < frontierRadius
  frontierRadius_class_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex1 frontierRadius).card
  frontier : CriticalPairFrontier D S frontierRadius H
  common : CommonDeletionParentResidual (S := S) H
  secondApexFullyDeletionRobust :
    FullyDeletionRobustAt D S.oppApex2

/-- Restore the complete first-apex frontier around the common-deletion arm
and retain the parent-forced robust second-apex endpoint. -/
theorem nonempty_frontierCoupledCommonDeletionParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    (R : CommonDeletionParentResidual (S := S) H) :
    Nonempty (FrontierCoupledCommonDeletionParentResidual H F) := by
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨frontierRadius, hradius, hfour, ⟨frontier⟩⟩
  exact ⟨{
    frontierRadius := frontierRadius
    frontierRadius_pos := hradius
    frontierRadius_class_card_ge_four := hfour
    frontier := frontier
    common := R
    secondApexFullyDeletionRobust :=
      commonDeletionParentResidual_secondApexFullyDeletionRobust R F }⟩

/-- Branch-complete parent output with the first-apex frontier retained on
both sides.  The common side also exposes the already-forced robust endpoint.
-/
theorem frontierCoupledCommonDeletion_or_frontierCoupledExactFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (FrontierCoupledCommonDeletionParentResidual H F) ∨
      Nonempty
        (FrontierCoupledExactFivePhysicalCycleParentResidual H F) := by
  rcases commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
      H F with hcommon | hexact
  · rcases hcommon with ⟨R⟩
    exact Or.inl
      (nonempty_frontierCoupledCommonDeletionParentResidual F R)
  · exact Or.inr hexact

#print axioms parent_secondApexFullyDeletionRobust
#print axioms commonDeletionParentResidual_secondApexFullyDeletionRobust
#print axioms commonDeletionParentResidual_allActualBlockers_ne_secondApex
#print axioms nonempty_frontierCoupledCommonDeletionParentResidual
#print axioms frontierCoupledCommonDeletion_or_frontierCoupledExactFive

end

end ATailCommonDeletionParentConsumerScratch
end Problem97
