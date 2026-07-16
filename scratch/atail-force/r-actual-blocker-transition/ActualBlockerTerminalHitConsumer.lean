/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import ActualBlockerCapMetricClassifier
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Terminal-HIT third-common-point consumer

The actual-blocker HIT arm already puts the robust pair on both the first-apex
circle and the actual blocker circle.  This module records the exact banked
consumer: any third distinct point common to those circles is impossible.

This is a conditional closing consumer.  It does not produce the third point
from terminal-carrier membership.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRTransitionLiveSurfaceScratch

attribute [local instance] Classical.propDecidable

/-- The HIT branch closes as soon as the actual blocker support contains a
third point in the robust source radius class.  The only remaining HIT content
is production of that named third common point. -/
theorem AmbientRobustHistoryPair.false_of_actualBlocker_hit_thirdCommonPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hySupport :
      P.y ∈ (H.selectedAt P.x
        (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support)
    {z : ℝ²}
    (hzSupport :
      z ∈ (H.selectedAt P.x
        (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support)
    (hzClass : z ∈ SelectedClass D.A S.oppApex1 rho)
    (hz_ne_x : z ≠ P.x)
    (hz_ne_y : z ≠ P.y) :
    False := by
  let hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  let b := H.centerAt P.x hxA
  let K := (H.selectedAt P.x hxA).toCriticalFourShell
  have hb_ne : b ≠ S.oppApex1 := by
    simpa [b, hxA] using
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1 P H
  have hcircles :
      (⟨S.oppApex1, rho⟩ : Sphere ℝ²) ≠ ⟨b, K.radius⟩ := by
    intro h
    exact hb_ne (congrArg Sphere.center h).symm
  have hxFirst : dist P.x S.oppApex1 = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp P.x_mem_class).2
  have hyFirst : dist P.y S.oppApex1 = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp P.y_mem_class).2
  have hzFirst : dist z S.oppApex1 = rho := by
    simpa [dist_comm] using (mem_selectedClass.mp hzClass).2
  have hxBlocker : dist P.x b = K.radius := by
    simpa [b, K, hxA, dist_comm] using
      K.support_eq_radius P.x K.q_mem_support
  have hyBlocker : dist P.y b = K.radius := by
    simpa [b, K, hxA, dist_comm] using
      K.support_eq_radius P.y (by simpa [K, hxA] using hySupport)
  have hzBlocker : dist z b = K.radius := by
    simpa [b, K, hxA, dist_comm] using
      K.support_eq_radius z (by simpa [K, hxA] using hzSupport)
  have hz_eq_y : z = P.y :=
    two_circle_third_point_eq hcircles P.x_ne_y
      hxFirst hyFirst hxBlocker hyBlocker hzFirst hzBlocker hz_ne_x
  exact hz_ne_y hz_eq_y

#print axioms AmbientRobustHistoryPair.false_of_actualBlocker_hit_thirdCommonPoint

end ATailRActualBlockerTransitionScratch
end Problem97
