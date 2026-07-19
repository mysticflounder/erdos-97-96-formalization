/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Direct LIVE-helper closure boundary

This file records the strongest common use of the new whole-carrier consumer
and the positive metric prefix of the most constrained LIVE-C helper.  It does
not add either missing producer as an assumption to an existing source helper.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace LiveHelperDirectClosureAudit

open U1Depth5
open Census554.GeneralCarrierBridge

/-- The uniform whole-carrier statement that would bypass every LIVE-Q/C
helper.  `GeneralCarrierBridge` proves how to consume this statement, but does
not prove it. -/
def UniformShellMetricCoverage (D : CounterexampleData) : Prop :=
  ∀ (F : FaithfulCarrierPattern D.A) (H : CriticalShellSystem D.A),
    ShellMetricCoreAlternative F H

/-- Exact parent-bypass boundary: global K4 and one critical-shell system
construct the inputs of the new consumer; the only additional mathematical
input is uniform production of `ShellMetricCoreAlternative`. -/
theorem false_of_uniformShellMetricCoverage
    (D : CounterexampleData)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hcoverage : UniformShellMetricCoverage D) : False := by
  rcases D.nonempty with ⟨center, hcenter⟩
  rcases exists_faithfulCarrierPattern_of_globalK4 D.K4 hcenter with ⟨F⟩
  rcases hcritical with ⟨H⟩
  exact false_of_shellMetricCoreAlternative F H D.convex (hcoverage F H)

/-- The full positive metric content supplied by the named `center = t2`
branch before any additional cross-row or whole-carrier coverage theorem is
used. -/
theorem center_t2_named_metric_prefix
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
    (hcenter_t2 : f2Row.center = t2)
    (hf5_named :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l1 ∨
        rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l2 ∨
        rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l3 ∨
        rows.pointOfChoice { source := CriticalSource.t2, slot := 1 } =
          f2Row.selected.l4)
    (hp_named :
      p = f2Row.selected.l1 ∨ p = f2Row.selected.l2 ∨
        p = f2Row.selected.l3 ∨ p = f2Row.selected.l4)
    (hq_named :
      q = f2Row.selected.l1 ∨ q = f2Row.selected.l2 ∨
        q = f2Row.selected.l3 ∨ q = f2Row.selected.l4) :
    dist p t1 = dist p q ∧
      dist p t2 = dist p q ∧
      dist p t3 = dist p q ∧
      dist t2 p = dist t2 q ∧
      dist t2 p =
        dist t2 (rows.pointOfChoice { source := CriticalSource.t2, slot := 1 }) := by
  have hpOn :
      dist t2 p = f2Row.selected.toCriticalFourShell.radius := by
    simpa [hcenter_t2] using f2Row.point_on_shell_of_eq_named hp_named
  have hqOn :
      dist t2 q = f2Row.selected.toCriticalFourShell.radius := by
    simpa [hcenter_t2] using f2Row.point_on_shell_of_eq_named hq_named
  have hf5On :
      dist t2 (rows.pointOfChoice { source := CriticalSource.t2, slot := 1 }) =
        f2Row.selected.toCriticalFourShell.radius := by
    simpa [hcenter_t2] using f2Row.point_on_shell_of_eq_named hf5_named
  exact ⟨hfixed.t1_same_radius, hfixed.t2_same_radius, hfixed.t3_same_radius,
    hpOn.trans hqOn.symm, hpOn.trans hf5On.symm⟩

#print axioms false_of_uniformShellMetricCoverage
#print axioms center_t2_named_metric_prefix

end LiveHelperDirectClosureAudit
end Problem97
