/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CGN.CGN6

/-!
# Conditional endpoint-spending closure for a critical-shell blocker cycle

This scratch module isolates the exact ordered-cap field missing from the
saved `(4,5,6)` one-way/distinct-blocker orbit.  A critical-shell row which
contains a fixed cap endpoint makes the source and that endpoint equidistant
from the source's blocker.  `CGN6c_oneSidedDistanceInjective` then forces the
blocker strictly toward the spent endpoint.  Three such pushes around a
three-cycle are impossible.

The live `CriticalShellSystem` supplies the blocker map and exact row-radius
equalities.  It does not assert that the source, blocker, and a selected
endpoint lie in one ordered cap, nor that every return edge selects an
endpoint.  Those facts remain producer obligations.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailEndpointSpendingCycle

open CriticalShellSystem

/-- If a source and its critical blocker lie in one modeled ordered cap and
the blocker's exact row contains the right endpoint, the blocker is strictly
to the right of the source. -/
theorem blocker_index_gt_of_right_endpoint_mem
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {m : ℕ} (L : CGN.OrderedCap m) (M : CGN.MinorCapChainModel L)
    (hm : 2 ≤ m) {q : ℝ²} (hq : q ∈ A) {iq ip : Fin m}
    (hqPoint : L.points iq = q)
    (hblockerPoint : L.points ip = H.centerAt q hq)
    (hqBeforeEndpoint : iq < CGN.lastIndex hm)
    (hendpoint :
      L.points (CGN.lastIndex hm) ∈
        (H.selectedAt q hq).toCriticalFourShell.support) :
    iq < ip := by
  have heq :
      dist (L.points ip) (L.points iq) =
        dist (L.points ip) (L.points (CGN.lastIndex hm)) := by
    rw [hqPoint, hblockerPoint]
    exact
      (H.selectedAt q hq).toCriticalFourShell.support_eq_radius q
        (H.selectedAt q hq).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt q hq).toCriticalFourShell.support_eq_radius
          (L.points (CGN.lastIndex hm)) hendpoint).symm
  have hiq_ne_ip : iq ≠ ip := by
    intro hiqip
    have hcenter_ne_q : H.centerAt q hq ≠ q :=
      (Finset.mem_erase.mp
        (H.selectedAt q hq).toCriticalFourShell.center_mem).1
    apply hcenter_ne_q
    rw [← hblockerPoint, ← hqPoint, hiqip]
  rcases lt_trichotomy ip iq with hip | hip | hip
  · exact False.elim
      ((CGN.CGN6c_oneSidedDistanceInjective M).1
        hip hqBeforeEndpoint heq)
  · exact False.elim (hiq_ne_ip hip.symm)
  · exact hip

/-- Left-endpoint mirror of `blocker_index_gt_of_right_endpoint_mem`. -/
theorem blocker_index_lt_of_left_endpoint_mem
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {m : ℕ} (L : CGN.OrderedCap m) (M : CGN.MinorCapChainModel L)
    (hm : 2 ≤ m) {q : ℝ²} (hq : q ∈ A) {iq ip : Fin m}
    (hqPoint : L.points iq = q)
    (hblockerPoint : L.points ip = H.centerAt q hq)
    (hendpointBeforeQ : CGN.firstIndex hm < iq)
    (hendpoint :
      L.points (CGN.firstIndex hm) ∈
        (H.selectedAt q hq).toCriticalFourShell.support) :
    ip < iq := by
  have heq :
      dist (L.points ip) (L.points iq) =
        dist (L.points ip) (L.points (CGN.firstIndex hm)) := by
    rw [hqPoint, hblockerPoint]
    exact
      (H.selectedAt q hq).toCriticalFourShell.support_eq_radius q
        (H.selectedAt q hq).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt q hq).toCriticalFourShell.support_eq_radius
          (L.points (CGN.firstIndex hm)) hendpoint).symm
  have hiq_ne_ip : iq ≠ ip := by
    intro hiqip
    have hcenter_ne_q : H.centerAt q hq ≠ q :=
      (Finset.mem_erase.mp
        (H.selectedAt q hq).toCriticalFourShell.center_mem).1
    apply hcenter_ne_q
    rw [← hblockerPoint, ← hqPoint, hiqip]
  rcases lt_trichotomy ip iq with hip | hip | hip
  · exact hip
  · exact False.elim (hiq_ne_ip hip.symm)
  · exact False.elim
      ((CGN.CGN6c_oneSidedDistanceInjective M).2
        hendpointBeforeQ hip heq.symm)

/-- No positive-period blocker orbit can remain in one modeled cap while every
step spends the same right endpoint.  The index family only has to represent
the finite orbit segment `0, ..., k`; no global enumeration of the carrier by
the cap is assumed. -/
theorem right_endpoint_blocker_periodic_false
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {m : ℕ} (L : CGN.OrderedCap m) (M : CGN.MinorCapChainModel L)
    (hm : 2 ≤ m)
    (q : CarrierVertex A) (k : ℕ) (hk : 0 < k)
    (hperiodic : Function.IsPeriodicPt H.blockerVertex k q)
    (index : ℕ → Fin m)
    (hpoint : ∀ t, t ≤ k →
      L.points (index t) = ((H.blockerVertex^[t]) q).1)
    (hbeforeEndpoint : ∀ t, t < k →
      index t < CGN.lastIndex hm)
    (hendpoint : ∀ t, (ht : t < k) →
      L.points (CGN.lastIndex hm) ∈
        (H.selectedAt ((H.blockerVertex^[t]) q).1
          ((H.blockerVertex^[t]) q).2).toCriticalFourShell.support) :
    False := by
  have hstep : ∀ t, t < k → index t < index (t + 1) := by
    intro t ht
    let qt : CarrierVertex A := (H.blockerVertex^[t]) q
    have hsourcePoint : L.points (index t) = qt.1 := by
      exact hpoint t (by omega)
    have hblockerPoint :
        L.points (index (t + 1)) = H.centerAt qt.1 qt.2 := by
      calc
        L.points (index (t + 1)) =
            ((H.blockerVertex^[t + 1]) q).1 :=
          hpoint (t + 1) (by omega)
        _ = (H.blockerVertex qt).1 := by
          rw [Function.iterate_succ_apply']
        _ = H.centerAt qt.1 qt.2 := rfl
    exact blocker_index_gt_of_right_endpoint_mem H L M hm qt.2
      hsourcePoint hblockerPoint (hbeforeEndpoint t ht) (hendpoint t ht)
  have hchain : ∀ t, t ≤ k → 0 < t → index 0 < index t := by
    intro t
    induction t with
    | zero =>
        intro _ ht
        omega
    | succ t ih =>
        intro htk _
        by_cases htzero : t = 0
        · subst t
          exact hstep 0 (by omega)
        · exact (ih (by omega) (by omega)).trans (hstep t (by omega))
  have hindexEq : index k = index 0 := by
    apply L.injective
    calc
      L.points (index k) = ((H.blockerVertex^[k]) q).1 :=
        hpoint k (by omega)
      _ = q.1 := congrArg Subtype.val hperiodic
      _ = ((H.blockerVertex^[0]) q).1 := by simp
      _ = L.points (index 0) := (hpoint 0 (by omega)).symm
  have hstrict := hchain k (by omega) hk
  rw [hindexEq] at hstrict
  exact lt_irrefl (index 0) hstrict

/-- Three critical-shell blocker edges in one modeled cap cannot form a
three-cycle while every edge spends the same right endpoint. -/
theorem right_endpoint_three_blocker_cycle_false
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {m : ℕ} (L : CGN.OrderedCap m) (M : CGN.MinorCapChainModel L)
    (hm : 2 ≤ m)
    (q₀ q₁ q₂ : CarrierVertex A)
    (h₀₁ : H.blockerVertex q₀ = q₁)
    (h₁₂ : H.blockerVertex q₁ = q₂)
    (h₂₀ : H.blockerVertex q₂ = q₀)
    (i₀ i₁ i₂ : Fin m)
    (hq₀Point : L.points i₀ = q₀.1)
    (hq₁Point : L.points i₁ = q₁.1)
    (hq₂Point : L.points i₂ = q₂.1)
    (hq₀BeforeEndpoint : i₀ < CGN.lastIndex hm)
    (hq₁BeforeEndpoint : i₁ < CGN.lastIndex hm)
    (hq₂BeforeEndpoint : i₂ < CGN.lastIndex hm)
    (hendpoint₀ :
      L.points (CGN.lastIndex hm) ∈
        (H.selectedAt q₀.1 q₀.2).toCriticalFourShell.support)
    (hendpoint₁ :
      L.points (CGN.lastIndex hm) ∈
        (H.selectedAt q₁.1 q₁.2).toCriticalFourShell.support)
    (hendpoint₂ :
      L.points (CGN.lastIndex hm) ∈
        (H.selectedAt q₂.1 q₂.2).toCriticalFourShell.support) :
    False := by
  have h₀₁Val : H.centerAt q₀.1 q₀.2 = q₁.1 :=
    congrArg Subtype.val h₀₁
  have h₁₂Val : H.centerAt q₁.1 q₁.2 = q₂.1 :=
    congrArg Subtype.val h₁₂
  have h₂₀Val : H.centerAt q₂.1 q₂.2 = q₀.1 :=
    congrArg Subtype.val h₂₀
  have hi₀i₁ : i₀ < i₁ :=
    blocker_index_gt_of_right_endpoint_mem H L M hm q₀.2
      hq₀Point (hq₁Point.trans h₀₁Val.symm)
      hq₀BeforeEndpoint hendpoint₀
  have hi₁i₂ : i₁ < i₂ :=
    blocker_index_gt_of_right_endpoint_mem H L M hm q₁.2
      hq₁Point (hq₂Point.trans h₁₂Val.symm)
      hq₁BeforeEndpoint hendpoint₁
  have hi₂i₀ : i₂ < i₀ :=
    blocker_index_gt_of_right_endpoint_mem H L M hm q₂.2
      hq₂Point (hq₀Point.trans h₂₀Val.symm)
      hq₂BeforeEndpoint hendpoint₂
  exact lt_irrefl i₀ ((hi₀i₁.trans hi₁i₂).trans hi₂i₀)

end ATailEndpointSpendingCycle
end Problem97

#print axioms Problem97.ATailEndpointSpendingCycle.blocker_index_gt_of_right_endpoint_mem
#print axioms Problem97.ATailEndpointSpendingCycle.blocker_index_lt_of_left_endpoint_mem
#print axioms Problem97.ATailEndpointSpendingCycle.right_endpoint_blocker_periodic_false
#print axioms Problem97.ATailEndpointSpendingCycle.right_endpoint_three_blocker_cycle_false
