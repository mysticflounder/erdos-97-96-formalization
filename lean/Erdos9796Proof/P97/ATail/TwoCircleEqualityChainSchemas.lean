/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U2.WitnessReflectionKernel

/-!
# Two-circle equality-chain schemas

This module banks a cardinality-independent obstruction extracted from the
exact-seventeen PIQD survivor after the interleaved three-row refinement.
Five selected rows transport one radius equality around a four-row chain;
a fifth row makes the two transported endpoints co-radial about a second
center.  Convex order puts both endpoints on the same side of the center
chord, contradicting the two-circle reflection kernel.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace TwoCircleEqualityChainBridge

private theorem signedArea2_swap23 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 a c b := by
  simp only [signedArea2]
  ring

/-- Five selected rows are impossible in the increasing boundary pattern

```text
Q : Y,T    V : U,Y    T : Q,W    U : Q,W    W : U,T
```

with `Q < U < W < Y < T < V`.
-/
theorem false_of_five_selected_rows_two_circle_chain
    {carrier : Finset ℝ²} {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {q u w y t v : Fin carrier.card}
    (hqu : q < u) (huw : u < w) (hwy : w < y)
    (hyt : y < t) (htv : t < v)
    (QRow : SelectedFourClass carrier (boundary q))
    (VRow : SelectedFourClass carrier (boundary v))
    (TRow : SelectedFourClass carrier (boundary t))
    (URow : SelectedFourClass carrier (boundary u))
    (WRow : SelectedFourClass carrier (boundary w))
    (hyQ : boundary y ∈ QRow.support)
    (htQ : boundary t ∈ QRow.support)
    (huV : boundary u ∈ VRow.support)
    (hyV : boundary y ∈ VRow.support)
    (hqT : boundary q ∈ TRow.support)
    (hwT : boundary w ∈ TRow.support)
    (hqU : boundary q ∈ URow.support)
    (hwU : boundary w ∈ URow.support)
    (huW : boundary u ∈ WRow.support)
    (htW : boundary t ∈ WRow.support) : False := by
  have hQ := (QRow.support_eq_radius _ htQ).trans
    (QRow.support_eq_radius _ hyQ).symm
  have hV := (VRow.support_eq_radius _ huV).trans
    (VRow.support_eq_radius _ hyV).symm
  have hT := (TRow.support_eq_radius _ hwT).trans
    (TRow.support_eq_radius _ hqT).symm
  have hU := (URow.support_eq_radius _ hqU).trans
    (URow.support_eq_radius _ hwU).symm
  have hW := (WRow.support_eq_radius _ huW).trans
    (WRow.support_eq_radius _ htW).symm
  have huq_yq : dist (boundary u) (boundary q) =
      dist (boundary y) (boundary q) := by
    calc
      dist (boundary u) (boundary q) = dist (boundary u) (boundary w) := hU
      _ = dist (boundary w) (boundary u) := dist_comm _ _
      _ = dist (boundary w) (boundary t) := hW
      _ = dist (boundary t) (boundary w) := dist_comm _ _
      _ = dist (boundary t) (boundary q) := hT
      _ = dist (boundary q) (boundary t) := dist_comm _ _
      _ = dist (boundary q) (boundary y) := hQ
      _ = dist (boundary y) (boundary q) := dist_comm _ _
  have huv_yv : dist (boundary u) (boundary v) =
      dist (boundary y) (boundary v) := by
    simpa only [dist_comm (boundary v) (boundary u),
      dist_comm (boundary v) (boundary y)] using hV
  have huy : boundary u ≠ boundary y :=
    hboundaryInjective.ne (ne_of_lt (huw.trans (hwy)))
  have huSide : 0 < signedArea2 (boundary u) (boundary q) (boundary v) :=
    signedArea2_pos_of_between hboundaryCcw hboundaryInjective hqu
      (huw.trans (hwy.trans (hyt.trans htv)))
  have hySide : 0 < signedArea2 (boundary y) (boundary q) (boundary v) :=
    signedArea2_pos_of_between hboundaryCcw hboundaryInjective
      (hqu.trans (huw.trans hwy)) (hyt.trans htv)
  exact twoCircle_sameSide_reflection_false
    (rq := dist (boundary u) (boundary q))
    (rv := dist (boundary u) (boundary v))
    rfl huq_yq.symm rfl huv_yv.symm huy
    (mul_self_pos.mpr (ne_of_gt huSide)) (mul_pos hySide huSide)

/-- Decreasing-index companion of
`false_of_five_selected_rows_two_circle_chain`. -/
theorem false_of_five_selected_rows_two_circle_chain_of_decreasing
    {carrier : Finset ℝ²} {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {q u w y t v : Fin carrier.card}
    (huq : u < q) (hwu : w < u) (hyw : y < w)
    (hty : t < y) (hvt : v < t)
    (QRow : SelectedFourClass carrier (boundary q))
    (VRow : SelectedFourClass carrier (boundary v))
    (TRow : SelectedFourClass carrier (boundary t))
    (URow : SelectedFourClass carrier (boundary u))
    (WRow : SelectedFourClass carrier (boundary w))
    (hyQ : boundary y ∈ QRow.support)
    (htQ : boundary t ∈ QRow.support)
    (huV : boundary u ∈ VRow.support)
    (hyV : boundary y ∈ VRow.support)
    (hqT : boundary q ∈ TRow.support)
    (hwT : boundary w ∈ TRow.support)
    (hqU : boundary q ∈ URow.support)
    (hwU : boundary w ∈ URow.support)
    (huW : boundary u ∈ WRow.support)
    (htW : boundary t ∈ WRow.support) : False := by
  have hQ := (QRow.support_eq_radius _ htQ).trans
    (QRow.support_eq_radius _ hyQ).symm
  have hV := (VRow.support_eq_radius _ huV).trans
    (VRow.support_eq_radius _ hyV).symm
  have hT := (TRow.support_eq_radius _ hwT).trans
    (TRow.support_eq_radius _ hqT).symm
  have hU := (URow.support_eq_radius _ hqU).trans
    (URow.support_eq_radius _ hwU).symm
  have hW := (WRow.support_eq_radius _ huW).trans
    (WRow.support_eq_radius _ htW).symm
  have huq_yq : dist (boundary u) (boundary q) =
      dist (boundary y) (boundary q) := by
    calc
      dist (boundary u) (boundary q) = dist (boundary u) (boundary w) := hU
      _ = dist (boundary w) (boundary u) := dist_comm _ _
      _ = dist (boundary w) (boundary t) := hW
      _ = dist (boundary t) (boundary w) := dist_comm _ _
      _ = dist (boundary t) (boundary q) := hT
      _ = dist (boundary q) (boundary t) := dist_comm _ _
      _ = dist (boundary q) (boundary y) := hQ
      _ = dist (boundary y) (boundary q) := dist_comm _ _
  have huv_yv : dist (boundary u) (boundary v) =
      dist (boundary y) (boundary v) := by
    simpa only [dist_comm (boundary v) (boundary u),
      dist_comm (boundary v) (boundary y)] using hV
  have huy : boundary u ≠ boundary y :=
    hboundaryInjective.ne (ne_of_gt (hyw.trans hwu))
  have huBetween : 0 < signedArea2 (boundary u) (boundary v) (boundary q) :=
    signedArea2_pos_of_between hboundaryCcw hboundaryInjective
      (hvt.trans (hty.trans (hyw.trans hwu))) huq
  have hyBetween : 0 < signedArea2 (boundary y) (boundary v) (boundary q) :=
    signedArea2_pos_of_between hboundaryCcw hboundaryInjective
      (hvt.trans hty) (hyw.trans (hwu.trans huq))
  have huSide : signedArea2 (boundary u) (boundary q) (boundary v) < 0 := by
    rw [signedArea2_swap23]
    linarith
  have hySide : signedArea2 (boundary y) (boundary q) (boundary v) < 0 := by
    rw [signedArea2_swap23]
    linarith
  exact twoCircle_sameSide_reflection_false
    (rq := dist (boundary u) (boundary q))
    (rv := dist (boundary u) (boundary v))
    rfl huq_yq.symm rfl huv_yv.symm huy
    (mul_self_pos.mpr (ne_of_lt huSide)) (mul_pos_of_neg_of_neg hySide huSide)

/-- Cyclic-shift form of the increasing equality-chain consumer. -/
theorem false_of_five_selected_rows_two_circle_chain_cyclicShift
    {carrier : Finset ℝ²} {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {q u w y t v : Fin carrier.card}
    (hqu : q < u) (huw : u < w) (hwy : w < y)
    (hyt : y < t) (htv : t < v)
    (QRow : SelectedFourClass carrier (boundary (q + cut)))
    (VRow : SelectedFourClass carrier (boundary (v + cut)))
    (TRow : SelectedFourClass carrier (boundary (t + cut)))
    (URow : SelectedFourClass carrier (boundary (u + cut)))
    (WRow : SelectedFourClass carrier (boundary (w + cut)))
    (hyQ : boundary (y + cut) ∈ QRow.support)
    (htQ : boundary (t + cut) ∈ QRow.support)
    (huV : boundary (u + cut) ∈ VRow.support)
    (hyV : boundary (y + cut) ∈ VRow.support)
    (hqT : boundary (q + cut) ∈ TRow.support)
    (hwT : boundary (w + cut) ∈ TRow.support)
    (hqU : boundary (q + cut) ∈ URow.support)
    (hwU : boundary (w + cut) ∈ URow.support)
    (huW : boundary (u + cut) ∈ WRow.support)
    (htW : boundary (t + cut) ∈ WRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_five_selected_rows_two_circle_chain
    (by simpa only [shifted] using injective_cyclicShift hboundaryInjective cut)
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundaryInjective hboundaryCcw cut)
    hqu huw hwy hyt htv QRow VRow TRow URow WRow
    hyQ htQ huV hyV hqT hwT hqU hwU huW htW

/-- Cyclic-shift form of the decreasing equality-chain consumer. -/
theorem false_of_five_selected_rows_two_circle_chain_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {q u w y t v : Fin carrier.card}
    (huq : u < q) (hwu : w < u) (hyw : y < w)
    (hty : t < y) (hvt : v < t)
    (QRow : SelectedFourClass carrier (boundary (q + cut)))
    (VRow : SelectedFourClass carrier (boundary (v + cut)))
    (TRow : SelectedFourClass carrier (boundary (t + cut)))
    (URow : SelectedFourClass carrier (boundary (u + cut)))
    (WRow : SelectedFourClass carrier (boundary (w + cut)))
    (hyQ : boundary (y + cut) ∈ QRow.support)
    (htQ : boundary (t + cut) ∈ QRow.support)
    (huV : boundary (u + cut) ∈ VRow.support)
    (hyV : boundary (y + cut) ∈ VRow.support)
    (hqT : boundary (q + cut) ∈ TRow.support)
    (hwT : boundary (w + cut) ∈ TRow.support)
    (hqU : boundary (q + cut) ∈ URow.support)
    (hwU : boundary (w + cut) ∈ URow.support)
    (huW : boundary (u + cut) ∈ WRow.support)
    (htW : boundary (t + cut) ∈ WRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_five_selected_rows_two_circle_chain_of_decreasing
    (by simpa only [shifted] using injective_cyclicShift hboundaryInjective cut)
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundaryInjective hboundaryCcw cut)
    huq hwu hyw hty hvt QRow VRow TRow URow WRow
    hyQ htQ huV hyV hqT hwT hqU hwU huW htW

#print axioms false_of_five_selected_rows_two_circle_chain
#print axioms false_of_five_selected_rows_two_circle_chain_of_decreasing
#print axioms false_of_five_selected_rows_two_circle_chain_cyclicShift
#print axioms false_of_five_selected_rows_two_circle_chain_cyclicShift_of_decreasing

end TwoCircleEqualityChainBridge
end Problem97
