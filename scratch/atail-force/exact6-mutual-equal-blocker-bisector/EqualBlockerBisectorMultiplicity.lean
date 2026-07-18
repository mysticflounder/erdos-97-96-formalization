/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import GlobalMutualPairCloser

/-!
# Bi-apex blocker multiplicity on the exact-five mutual equal-blocker arm

This file instantiates the production two-omitted-values theorem at the two
sources of the actual equal-blocker critical fiber.  Its two outputs have
different limitations:

* a second blocker fiber has a genuinely different center, but its selected
  shell is known to contain its own two sources, not the original fiber pair;
* a third source in the original fiber has a selected row through the original
  pair, but its actual center is definitionally the old common blocker.

The exact-six cap hypothesis does not occur in the finite-map proof and does
not change either conclusion.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSixMutualEqualBlockerBisectorScratch

open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailGlobalMutualPairCloserScratch
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Instantiating the generic two-omitted-values theorem at the sources of
the current equal-blocker fiber gives either a genuinely different blocker
fiber or a third source at the same blocker.  The exact-six hypothesis is
retained to expose that it contributes no field to this finite-map step. -/
theorem exactSix_secondFiber_or_thirdSource_at_commonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M)
    (_hcap : S.oppCap2.card = 6) :
    (∃ a b : CriticalShellSystem.CarrierVertex D.A,
        a ≠ b ∧
        H.blockerVertex a = H.blockerVertex b ∧
        H.blockerVertex a ≠ H.blockerVertex Q.criticalFiber.source₁) ∨
      ∃ source : CriticalShellSystem.CarrierVertex D.A,
        source ≠ Q.criticalFiber.source₁ ∧
        source ≠ Q.criticalFiber.source₂ ∧
        H.blockerVertex source = H.blockerVertex Q.criticalFiber.source₁ := by
  let firstApex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, R.common.packet.center₁_mem_A⟩
  let secondApex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, R.common.packet.center₂_mem_A⟩
  have hfirst : ∀ source, H.blockerVertex source ≠ firstApex := by
    intro source
    exact B.firstApex_robust.blockerVertex_ne H source
      R.common.packet.center₁_mem_A
  have hsecond : ∀ source, H.blockerVertex source ≠ secondApex := by
    intro source
    exact B.secondApex_robust.blockerVertex_ne H source
      R.common.packet.center₂_mem_A
  have hapices : secondApex ≠ firstApex := by
    intro h
    have hvalue : S.oppApex2 = S.oppApex1 := congrArg Subtype.val h
    exact R.common.packet.centers_ne hvalue.symm
  exact second_fiber_or_larger_first_fiber_of_two_omissions
    H.blockerVertex hfirst hsecond hapices

/-- A third source returned in the original blocker fiber cannot be the
missing genuinely distinct pair center: its actual center is exactly the old
common blocker. -/
theorem thirdSource_at_commonBlocker_center_stutters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource :
      H.blockerVertex source = H.blockerVertex Q.criticalFiber.source₁) :
    H.centerAt source.1 source.2 =
      H.centerAt Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 := by
  exact congrArg Subtype.val hsource

/-- Conversely, a second blocker fiber does have a genuinely different
center, but only for its own source pair.  No membership of the old fiber
sources in this row follows from the multiplicity theorem. -/
theorem secondFiber_center_ne_commonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource :
      H.blockerVertex source ≠ H.blockerVertex Q.criticalFiber.source₁) :
    H.centerAt source.1 source.2 ≠
      H.centerAt Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 := by
  intro hcenter
  apply hsource
  apply Subtype.ext
  exact hcenter

#print axioms exactSix_secondFiber_or_thirdSource_at_commonBlocker
#print axioms thirdSource_at_commonBlocker_center_stutters
#print axioms secondFiber_center_ne_commonBlocker

end

end ATailExactSixMutualEqualBlockerBisectorScratch
end Problem97
