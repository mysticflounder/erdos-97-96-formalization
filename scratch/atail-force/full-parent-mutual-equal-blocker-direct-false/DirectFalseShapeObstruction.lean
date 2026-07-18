/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GlobalMutualPairCloser
import EqualBlockerTerminal

/-!
# Statement-shape obstruction for direct equal-blocker closure

The complete full-parent mutual equal-blocker arm retains both physical
apices and the parent's global no-`IsM44` hypothesis.  The current large-cap
packet cannot itself consume that hypothesis: both of its opposite caps have
cardinality at least six.  Moreover, full MEC/cap geometry proves that neither
physical apex is equidistant from the equal-blocker source pair.  Thus the only
currently named center of that pair is its actual common blocker.

This module records those exact negative facts.  It does not add a conditional
packet or assert a direct contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFullParentMutualEqualBlockerDirectFalseScratch

open ATailGlobalMutualEqualBlockerTerminalScratch
open ATailGlobalMutualPairCloserScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The current large-opposite-caps packet is not an `IsM44` packet, without
using the parent's quantified `noM44` field. -/
theorem currentPacket_not_isM44
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    ¬ S.IsM44 := by
  intro hM44
  have hfirst := hM44.1
  have hlarge := L.firstOppCap_card_ge_six
  omega

/-- Consequently every hypothetical `IsM44` witness on the same carrier must
use a genuinely different surplus-cap packet, hence a different support
triangle/cap partition. -/
theorem anyM44Packet_ne_currentPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    {T : SurplusCapPacket D.A} (hT : T.IsM44) :
    T ≠ S := by
  intro hTS
  subst T
  exact currentPacket_not_isM44 L hT

/-- The unused continuation source and the mutual partner have different
distances from the physical second apex.  This consumes the exact-five radius
filter: the partner is in it and the unused source is not. -/
theorem equalBlocker_physicalSecondApex_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    dist S.oppApex2 M.continuation.unusedRow.unused.point ≠
      dist S.oppApex2 Q.chosen.partner.1 := by
  intro hdist
  apply M.continuation.unusedRow.unused.point_not_mem_radiusClass
  apply mem_selectedClass.mpr
  refine ⟨M.continuation.unusedRow.source_mem_A, ?_⟩
  exact hdist.trans
    (mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass Q.chosen.partner)).2

/-- Fiber-indexed form of the physical-second-apex separation. -/
theorem equalBlocker_fiber_physicalSecondApex_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    dist S.oppApex2 Q.criticalFiber.source₁.1 ≠
      dist S.oppApex2 Q.criticalFiber.source₂.1 := by
  simpa only [Q.criticalFiber_source₁, Q.criticalFiber_source₂] using
    equalBlocker_physicalSecondApex_dist_ne Q

/-- The actual common blocker is equidistant from the two fiber sources. -/
theorem equalBlocker_commonBlocker_dist_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    dist
        (H.centerAt Q.criticalFiber.source₁.1
          Q.criticalFiber.source₁.2)
        Q.criticalFiber.source₁.1 =
      dist
        (H.centerAt Q.criticalFiber.source₁.1
          Q.criticalFiber.source₁.2)
        Q.criticalFiber.source₂.1 := by
  let K :=
    (H.selectedAt Q.criticalFiber.source₁.1
      Q.criticalFiber.source₁.2).toCriticalFourShell
  exact
    (K.support_eq_radius Q.criticalFiber.source₁.1
      K.q_mem_support).trans
      (K.support_eq_radius Q.criticalFiber.source₂.1
        Q.criticalFiber.source₂_mem_commonSupport).symm

/-- Full named-center ledger: the common blocker bisects the source pair,
while both physical apices provably do not.  Any direct two-center terminal
therefore needs a new source-realized or otherwise geometrically certified
center. -/
theorem equalBlocker_namedPairCenter_ledger
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    (dist
        (H.centerAt Q.criticalFiber.source₁.1
          Q.criticalFiber.source₁.2)
        Q.criticalFiber.source₁.1 =
      dist
        (H.centerAt Q.criticalFiber.source₁.1
          Q.criticalFiber.source₁.2)
        Q.criticalFiber.source₂.1) ∧
    dist S.oppApex1 Q.criticalFiber.source₁.1 ≠
      dist S.oppApex1 Q.criticalFiber.source₂.1 ∧
    dist S.oppApex2 Q.criticalFiber.source₁.1 ≠
      dist S.oppApex2 Q.criticalFiber.source₂.1 := by
  exact ⟨equalBlocker_commonBlocker_dist_eq Q,
    equalBlocker_firstApex_dist_ne Q,
    equalBlocker_fiber_physicalSecondApex_dist_ne Q⟩

#print axioms currentPacket_not_isM44
#print axioms anyM44Packet_ne_currentPacket
#print axioms equalBlocker_physicalSecondApex_dist_ne
#print axioms equalBlocker_fiber_physicalSecondApex_dist_ne
#print axioms equalBlocker_commonBlocker_dist_eq
#print axioms equalBlocker_namedPairCenter_ledger

end

end ATailFullParentMutualEqualBlockerDirectFalseScratch
end Problem97
