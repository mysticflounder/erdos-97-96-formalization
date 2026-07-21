/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveSecondCap
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap

/-!
# Live large-cap frontier closure boundary

The old Route-B tail asked for an impossible double-apex equal-radius pair and
then immediately refuted it.  The live parent already has global minimality,
the no-M44 hypothesis, and a concrete critical-shell system, so its honest
residual is the exhaustive `CriticalPairFrontier` split instead.  This module
keeps those hypotheses on both remaining arms and exposes no LIVE slot or
center classification.

The declarations below are deliberately parent-facing: a future proof must
consume the full frontier and the physical-second-apex split of its genuine
common-deletion packet, rather than manufacture the already-impossible
shared-radius pair.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap

/-- The protected exact-four-or-five first-apex radius arm, with the live
minimality and no-M44 context retained. -/
theorem false_of_originalFrontierUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False := by
  sorry

/-- The one remaining exact-five consumer after the parent-row bridge and
the exact-five all-reverse arm have been discharged.  This target sees the
actual arbitrary mutual omission together with its sharp distribution across
the two retained parent rows. -/
theorem false_of_frontierBiApexRobustExactFiveMutualParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : FrontierBiApexRobustExactFiveMutualParentResidual Q profile) :
    False := by
  sorry

/-- The exact-five second-cap profile reduces unconditionally to the
full-parent mutual residual.  The complementary global all-reverse arm is
closed by the exact-five period-three straddle contradiction. -/
theorem false_of_frontierBiApexRobustExactFiveSecondCapProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    False := by
  rcases nonempty_frontierBiApexRobustExactFiveMutualParentResidual
      Q profile with ⟨M⟩
  exact false_of_frontierBiApexRobustExactFiveMutualParentResidual
    F R B Q profile M

/-- The exact-five second-cap robust residual. It first produces the forced
unique ambient five-point profile before entering its terminal. -/
theorem false_of_frontierBiApexRobustExactFiveSecondCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
    False := by
  rcases nonempty_largeCapUniqueFiveSecondApexRadius_of_exactFiveSecondCap Q with
    ⟨profile⟩
  exact false_of_frontierBiApexRobustExactFiveSecondCapProfile F R B Q profile

/-- The cap-six continuation of the bi-apex robust parent. Its terminal must
consume the complete large-cap surface, not a locally manufactured witness. -/
theorem false_of_frontierLargeOppositeCapsBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B) :
    False := by
  sorry

/-- The source-faithful common-deletion arm after both physical opposite
apices are deletion-robust. It retains the complete parent residual and
dispatches its checked cap-bound split to the two terminal surfaces. -/
theorem false_of_frontierBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R) :
    False := by
  rcases biApexRobust_exactFiveSecond_or_largeOppositeCaps B with hfive | hlarge
  · exact false_of_frontierBiApexRobustExactFiveSecondCapResidual F R B hfive.some
  · exact false_of_frontierLargeOppositeCapsBiApexRobustResidual F R B hlarge.some

/-- The non-robust physical-second-apex outcome.  The residual is kept with
the critical shell: the intended consumer is the packet-generic swapped
first-apex unique-four route, not an anonymous critical-row contradiction. -/
theorem false_of_physicalSecondApexCriticalResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : PhysicalSecondApexCriticalResidual D S) :
    False := by
  rcases physicalSecondCritical_reorients_to_swappedUniqueFour
      (H := H) P.shell P.deletion_blocked with ⟨U⟩
  apply false_of_originalFrontierUniqueRadiusArm (H := H)
    U.frontier R.minimal R.noM44 R.carrier_card_gt_nine
  · rw [U.firstClass_card_eq_four]
  · exact ⟨Or.inl U.firstClass_card_eq_four, U.firstClass_unique_radius⟩

/-- The exact physical split of a common-deletion parent.  This is strictly
stronger routing than the former coupled strict-interior normal form: it
exposes the robust and prescribed-critical geometric endpoints directly. -/
theorem false_of_frontierCommonDeletionPhysicalSecondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F) :
    False := by
  rcases frontierCommonDeletionParent_biApexRobust_or_critical R with
    hrobust | hcritical
  · exact false_of_frontierBiApexRobustResidual F R hrobust.some
  · exact false_of_physicalSecondApexCriticalResidual F R hcritical.some

/-- Assemble the two genuine frontier arms. -/
theorem false_of_criticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card) :
    False := by
  apply CriticalPairFrontier.false_of_parentResidualConsumers
    F hmin hNoM44 hcard hfour
  · exact false_of_originalFrontierUniqueRadiusArm F hmin hNoM44 hcard hfour
  · intro R
    exact false_of_frontierCommonDeletionPhysicalSecondApex F R

/-- Parent-facing large-opposite-cap contradiction.  The extraction is
uniform from the live `CriticalShellSystem`; slot-labelled LIVE data is not an
input to this boundary. -/
theorem false_of_twoLargeCaps_commonCriticalMap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (H : CriticalShellSystem D.A) :
    False := by
  rcases exists_criticalPairFrontier_of_K4 D S H with
    ⟨radius, _hradius, hfour, hfrontier⟩
  exact false_of_criticalPairFrontier hfrontier.some hmin hNoM44 hcard hfour

end ATailFrontierLiveClosure
end Problem97
