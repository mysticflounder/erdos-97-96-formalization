/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalSystemRebase
import Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion

/-!
# Scratch: cap-strengthened bi-apex parent surface

The generic `FrontierBiApexRobustResidual` deliberately records only the
second-apex robustness proof.  The actual live large-cap branch also carries
both opposite-cap lower bounds.  This file packages that exact branch surface
and records the routine rebase ladder needed to choose a critical-shell system
after the physical frontier has been selected.

The public mathematical target on this surface is direct `False`.  The rebase
definitions below are only optional plumbing for a proof which internally uses
`CriticalFiberClosingCore` at one favorable late critical system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeOppositeCapsBiApexSurfaceScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- Exact live robust branch after both small-cap arms have been dispatched. -/
structure FrontierLargeOppositeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R) : Prop where
  firstOppCap_card_ge_six : 6 ≤ S.oppCap1.card
  secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card

/-- The cap-strengthened live branch starts at carrier cardinality fourteen. -/
theorem FrontierLargeOppositeCapsBiApexRobustResidual.carrier_card_ge_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    14 ≤ D.A.card :=
  carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
    D S L.firstOppCap_card_ge_six L.secondOppCap_card_ge_six

/-- Change only the critical-shell system of a common-deletion packet.  Its
two physical rows and deletion-survival facts are geometric and unchanged. -/
def rebaseCommonDeletionSystem
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q center₁ center₂ : ℝ²}
    (C : ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
      D H q center₁ center₂)
    (H' : CriticalShellSystem D.A) :
    ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
      D H' q center₁ center₂ where
  q_mem_A := C.q_mem_A
  center₁_mem_A := C.center₁_mem_A
  center₂_mem_A := C.center₂_mem_A
  centers_ne := C.centers_ne
  survives₁ := C.survives₁
  survives₂ := C.survives₂
  actual_blocker_ne_center₁ :=
    actual_blocker_ne_of_deletion_survives H' C.q_mem_A C.survives₁
  actual_blocker_ne_center₂ :=
    actual_blocker_ne_of_deletion_survives H' C.q_mem_A C.survives₂
  B₁ := C.B₁
  B₂ := C.B₂
  row₁ := C.row₁
  row₂ := C.row₂
  B₁_card := C.B₁_card
  B₂_card := C.B₂_card
  overlap_le_two := C.overlap_le_two

/-- Rebase the source-faithful common-deletion residual along the production
frontier rebase. -/
def rebaseFrontierCommonDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : FrontierCommonDeletionResidual F)
    (H' : CriticalShellSystem D.A) :
    FrontierCommonDeletionResidual
      (rebaseCriticalPairFrontierSystem F H') where
  firstApexDouble := by
    simpa [rebaseCriticalPairFrontierSystem,
      rebaseSurvivorPairCriticalSystem] using C.firstApexDouble
  packet := by
    simpa [rebaseCriticalPairFrontierSystem,
      rebaseSurvivorPairCriticalSystem] using
      rebaseCommonDeletionSystem C.packet H'

/-- Rebase the complete common-deletion parent.  Every parent field except the
critical-system index is independent of the chosen critical map. -/
def rebaseFrontierCommonDeletionParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (H' : CriticalShellSystem D.A) :
    FrontierCommonDeletionParentResidual
      (rebaseCriticalPairFrontierSystem F H') where
  minimal := R.minimal
  noM44 := R.noM44
  carrier_card_gt_nine := R.carrier_card_gt_nine
  frontierRadius_class_card_ge_four := R.frontierRadius_class_card_ge_four
  common := rebaseFrontierCommonDeletionResidual R.common H'

/-- Second-apex robustness is geometric and survives critical-system rebase. -/
def rebaseFrontierBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (B : FrontierBiApexRobustResidual R)
    (H' : CriticalShellSystem D.A) :
    FrontierBiApexRobustResidual
      (rebaseFrontierCommonDeletionParentResidual R H') where
  secondApex_robust := B.secondApex_robust

/-- The two cap bounds are fields of the fixed geometric packet `S`, so the
cap-strengthened wrapper rebases by copying them. -/
def rebaseFrontierLargeOppositeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (H' : CriticalShellSystem D.A) :
    FrontierLargeOppositeCapsBiApexRobustResidual
      (rebaseFrontierBiApexRobustResidual B H') where
  firstOppCap_card_ge_six := L.firstOppCap_card_ge_six
  secondOppCap_card_ge_six := L.secondOppCap_card_ge_six

#print axioms FrontierLargeOppositeCapsBiApexRobustResidual.carrier_card_ge_fourteen
#print axioms rebaseCommonDeletionSystem
#print axioms rebaseFrontierCommonDeletionResidual
#print axioms rebaseFrontierCommonDeletionParentResidual
#print axioms rebaseFrontierBiApexRobustResidual
#print axioms rebaseFrontierLargeOppositeCapsBiApexRobustResidual

end ATailLargeOppositeCapsBiApexSurfaceScratch
end Problem97
