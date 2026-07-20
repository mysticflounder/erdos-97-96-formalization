import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler
import LiveGlobalMutualCapConsumer

/-!
# Full-parent bridge for the global mutual-cap consumer

The global mutual-cap consumer is stated on a robust large-radius surface.
This bridge applies it to the actual full-parent mutual arm, retaining the
original `L` packet through the result's indices.  It is a source-faithful
reduction: the resulting distinct/equal blocker split is not a contradiction
until a geometric producer closes one of its residuals.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLiveGlobalMutualCapConsumerScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion
open ATailRobustLargeRadius
open ATailExactFiveMutualOmissionClosureScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The full-parent arbitrary mutual-omission arm reaches the same fresh
period-two same-cap residual split as the robust-radius consumer. -/
theorem nonempty_globalMutualCapOutcome_of_fullParentExactFiveMutualData
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) :
    ∃ (K : PhysicalActualCriticalOmissionCycle H profile)
      (E : PhysicalActualCriticalMutualOmissionEdge K),
      K.period = 2 ∧
      K.start = M.pair.source ∧
      K.source E.index = M.pair.source ∧
      K.source (K.successorIndex E.index) = M.pair.target ∧
      Nonempty (MutualOmissionCrissCrossNormalForm E) ∧
      (Nonempty (LiveSameCapCommonDeletionResidual
        (robustLargeRadiusParentSurfaceOfExactFive L profile) E) ∨
        Nonempty (LiveEqualBlockerShellResidual
          (robustLargeRadiusParentSurfaceOfExactFive L profile) E)) := by
  exact nonempty_globalMutualCapOutcome
    (robustLargeRadiusParentSurfaceOfExactFive L profile) M.pair

#print axioms nonempty_globalMutualCapOutcome_of_fullParentExactFiveMutualData

end

end ATailLiveGlobalMutualCapConsumerScratch
