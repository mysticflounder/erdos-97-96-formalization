/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Parent adapter for the exact-five physical omission cycle

This scratch module records the exact reduction from the production robust
large-radius parent to the physical actual-critical omission-cycle consumer.
It retains the original critical-shell system in both the exact-five
common-deletion continuation and the cycle.

The common-deletion arm is left explicit.  No protected branch result is
assumed or reproduced here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPhysicalOmissionCycleParentAdapterScratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailCriticalPairFrontier
open ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The common-deletion residual left unchanged by the cycle consumer. -/
structure CommonDeletionParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A) : Type where
  deleted : ℝ²
  center : ℝ²
  packet : ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
    D H deleted center S.oppApex2

/-- The strongest exact-five residual available at the robust large-radius
parent.  It retains the two-source common-deletion continuation, the finite
physical omission cycle, and equality with the parent's original radius. -/
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

/-- The consumer-facing exact-five residual with the entire first-apex
critical-pair frontier restored.  Both the frontier and exact-five cycle are
indexed by the same concrete critical-shell system `H`. -/
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

/-- The exact consumer assumption exposed by this adapter.  The same `H`
indexes both the residual continuation and its physical omission cycle. -/
abbrev FalseOfPhysicalActualCriticalOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Prop :=
  FrontierCoupledExactFivePhysicalCycleParentResidual H F → False

/-- Package a production exact-five arm as the full parent residual. -/
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

/-- Restore the complete first-apex frontier around the exact-five cycle.
No new hypothesis is needed beyond `D.K4`, already carried by
`CounterexampleData`. -/
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

/-- The abstract cycle consumer closes exactly the exact-five constructor of
the reduced robust large-radius outcome. -/
theorem false_of_exactUniqueFive_of_physicalActualCriticalOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (F : RobustLargeRadiusParentSurface D S)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile)
    (false_of_physicalActualCriticalOmissionCycle :
      FalseOfPhysicalActualCriticalOmissionCycle H F) : False := by
  rcases nonempty_frontierCoupledExactFivePhysicalCycleParentResidual
      F profile continuation with ⟨R⟩
  exact false_of_physicalActualCriticalOmissionCycle R

/-- Branch-complete parent reduction without assuming either terminal
consumer: the existing common-deletion residual or the full exact-five cycle
residual. -/
theorem commonDeletion_or_exactFivePhysicalCycleParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (CommonDeletionParentResidual (S := S) H) ∨
      Nonempty (ExactFivePhysicalCycleParentResidual H F) := by
  rcases nonempty_reducedOutcome_of_largeSecondApexRadius H F with ⟨outcome⟩
  cases outcome with
  | commonDeletion deleted center packet =>
      exact Or.inl ⟨{
        deleted := deleted
        center := center
        packet := packet }⟩
  | exactUniqueFive profile continuation =>
      exact Or.inr
        (nonempty_exactFivePhysicalCycleParentResidual
          F profile continuation)

/-- Stronger branch-complete reduction for the geometric consumer: the
exact-five arm carries the full first-apex frontier with the same critical
map. -/
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

/-- After supplying only the exact-five cycle consumer, the protected
common-deletion residual remains explicit. -/
theorem commonDeletion_or_false_of_physicalActualCriticalOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S)
    (false_of_physicalActualCriticalOmissionCycle :
      FalseOfPhysicalActualCriticalOmissionCycle H F) :
    Nonempty (CommonDeletionParentResidual (S := S) H) ∨ False := by
  rcases commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
      H F with
    hcommon | hexact
  · exact Or.inl hcommon
  · rcases hexact with ⟨R⟩
    exact Or.inr (false_of_physicalActualCriticalOmissionCycle R)

/-- Explicit pair of terminal consumers sufficient to close the robust
large-radius parent.  This is an interface only; this scratch module does not
construct either field. -/
structure RobustLargeRadiusResidualConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) : Prop where
  commonDeletion :
    CommonDeletionParentResidual (S := S) H → False
  exactFiveCycle : FalseOfPhysicalActualCriticalOmissionCycle H F

/-- The two explicit consumers close the production reduced outcome. -/
theorem false_of_largeSecondApexRadius_of_residualConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S)
    (C : RobustLargeRadiusResidualConsumers H F) : False := by
  rcases commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
      H F with
    hcommon | hexact
  · rcases hcommon with ⟨R⟩
    exact C.commonDeletion R
  · rcases hexact with ⟨R⟩
    exact C.exactFiveCycle R

/-- The concrete surplus packet used by `u1_largeCap_routeB_tail_false`. -/
abbrev u1LeafSurplusPacket
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card) : SurplusCapPacket D.A :=
  U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
    MT hCirc CP i hM hsurplus

/-- Additional ingress not present in the current U1 leaf statement: the
chosen orientation must have a six-point physical cap and one radius class
of cardinality at least five at its physical apex. -/
structure U1LeafLargePhysicalRadiusIngress
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card) : Type where
  oppCap2_card_ge_six :
    6 ≤ (u1LeafSurplusPacket MT hCirc CP i hM hsurplus).oppCap2.card
  radius : ℝ
  radius_pos : 0 < radius
  radius_class_card_ge_five :
    5 ≤
      (SelectedClass D.A
        (u1LeafSurplusPacket MT hCirc CP i hM hsurplus).oppApex2
        radius).card

namespace U1LeafLargePhysicalRadiusIngress

/-- The current U1 parent hypotheses plus the explicit ingress fields produce
the exact production robust-large-radius parent surface. -/
def toRobustLargeRadiusParentSurface
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    {MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol}
    {hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩}
    {M : MoserTriangle D.A} {CP : CapTriple D.A M} {i : Fin 3}
    {hM : M = MT.toMoserTriangle.toStructural hCirc}
    {hsurplus : 4 < (CP.capAt i).card}
    (I : U1LeafLargePhysicalRadiusIngress MT hCirc CP i hM hsurplus)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44) :
    RobustLargeRadiusParentSurface D
      (u1LeafSurplusPacket MT hCirc CP i hM hsurplus) where
  minimal := hmin
  noM44 := hNoM44
  oppCap2_card_ge_six := I.oppCap2_card_ge_six
  radius := I.radius
  radius_pos := I.radius_pos
  radius_class_card_ge_five := I.radius_class_card_ge_five

end U1LeafLargePhysicalRadiusIngress

#print axioms nonempty_exactFivePhysicalCycleParentResidual
#print axioms nonempty_frontierCoupledExactFivePhysicalCycleParentResidual
#print axioms false_of_exactUniqueFive_of_physicalActualCriticalOmissionCycle
#print axioms commonDeletion_or_exactFivePhysicalCycleParentResidual
#print axioms commonDeletion_or_frontierCoupledExactFivePhysicalCycleParentResidual
#print axioms commonDeletion_or_false_of_physicalActualCriticalOmissionCycle
#print axioms false_of_largeSecondApexRadius_of_residualConsumers
#print axioms U1LeafLargePhysicalRadiusIngress.toRobustLargeRadiusParentSurface

end


end ATailPhysicalOmissionCycleParentAdapterScratch
end Problem97
