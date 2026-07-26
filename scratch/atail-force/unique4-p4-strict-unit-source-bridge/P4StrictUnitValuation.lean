/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4StrictUnitSourceBridge
import IndexedSourceValuation
import Families

/-!
# Direct P4 strict-unit valuation bridge

The two direct P4 strict-cap positions are selected-class hits.  The final
two lemmas express this as the compact class literals used by the P4 residual
slice through its existing total source valuation agreement.
-/

namespace Problem97
namespace P4StrictUnitSourceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P5IndexedSourceScratch
open P4CriticalSupportOccurrenceBridgeScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The P4 direct re-cut's slot `5` is a selected first-apex class hit. -/
theorem classHit_direct_five
    (P : P4DirectBoundaryPacket R profile distribution) :
    classHit P.core directIndex 5 := by
  unfold classHit
  rw [directIndex_apply, P.boundary_eq]
  exact selected_mem_of_strict_firstOpposite_mem P
    (direct_boundary_strict_firstOpposite_mem P.orientedBoundary 0)

/-- The P4 direct re-cut's slot `6` is a selected first-apex class hit. -/
theorem classHit_direct_six
    (P : P4DirectBoundaryPacket R profile distribution) :
    classHit P.core directIndex 6 := by
  unfold classHit
  rw [directIndex_apply, P.boundary_eq]
  exact selected_mem_of_strict_firstOpposite_mem P
    (direct_boundary_strict_firstOpposite_mem P.orientedBoundary 1)

/-- Compact P4 class literal `632` (class position `5`) is true under the
direct source valuation. -/
theorem classUnit_direct_five {v : Nat → Prop}
    (P : P4DirectBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core directIndex v) :
    v (classVariable 5) :=
  (hv.firstApexClass 5).mpr (classHit_direct_five P)

/-- Compact P4 class literal `633` (class position `6`) is true under the
direct source valuation. -/
theorem classUnit_direct_six {v : Nat → Prop}
    (P : P4DirectBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core directIndex v) :
    v (classVariable 6) :=
  (hv.firstApexClass 6).mpr (classHit_direct_six P)

/-- The direct source valuation satisfies compact literal `632`. -/
theorem classUnit_direct_lit632 {v : Nat → Prop}
    (P : P4DirectBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core directIndex v) : v 632 := by
  simpa [classVariable] using classUnit_direct_five P hv

/-- The direct source valuation satisfies compact literal `633`. -/
theorem classUnit_direct_lit633 {v : Nat → Prop}
    (P : P4DirectBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core directIndex v) : v 633 := by
  simpa [classVariable] using classUnit_direct_six P hv

/-- The direct P4 packet supplies both compact strict-unit assumptions needed
by the later residual/RUP coordinator. -/
theorem strictUnits_direct {v : Nat → Prop}
    (P : P4DirectBoundaryPacket R profile distribution)
    (hv : ValAgreement P.core directIndex v) : v 632 ∧ v 633 :=
  ⟨classUnit_direct_lit632 P hv, classUnit_direct_lit633 P hv⟩

end P4StrictUnitSourceBridgeScratch
end Problem97
