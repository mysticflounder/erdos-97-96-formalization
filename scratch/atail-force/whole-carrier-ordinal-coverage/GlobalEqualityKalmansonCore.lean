/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# Global equality-quotiented Kalmanson consumer

This scratch theorem consumes equality chains from arbitrarily many selected
rows.  It is deliberately more general than a local one-row cancellation: the
two `EdgeClosure` witnesses may be transitive chains through the whole carrier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace WholeCarrierGlobalEqualityKalmanson

open Census554.EqualityCore

/-- If global selected-row equality closure identifies the two sides in the
first strict Kalmanson sum with the corresponding diagonals, the realization
is impossible. -/
theorem false_of_equal_sum_core
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf)
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {label : Fin A.card → α}
    (hpoint : ∀ i, pointOf (label i) = boundary i)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hbc_ac : EdgeClosure P (label ib, label ic) (label ia, label ic))
    (had_bd : EdgeClosure P (label ia, label id) (label ib, label id)) :
    False := by
  have hbc_ac_dist :
      dist (boundary ib) (boundary ic) =
        dist (boundary ia) (boundary ic) := by
    simpa only [edgeDist, hpoint] using EdgeClosure.sound hreal hbc_ac
  have had_bd_dist :
      dist (boundary ia) (boundary id) =
        dist (boundary ib) (boundary id) := by
    simpa only [edgeDist, hpoint] using EdgeClosure.sound hreal had_bd
  have hstrict :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hA hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
  linarith

/-- Companion consumer for the other strict Kalmanson sum. -/
theorem false_of_complementary_equal_sum_core
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf)
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {label : Fin A.card → α}
    (hpoint : ∀ i, pointOf (label i) = boundary i)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hab_ac : EdgeClosure P (label ia, label ib) (label ia, label ic))
    (hcd_bd : EdgeClosure P (label ic, label id) (label ib, label id)) :
    False := by
  have hab_ac_dist :
      dist (boundary ia) (boundary ib) =
        dist (boundary ia) (boundary ic) := by
    simpa only [edgeDist, hpoint] using EdgeClosure.sound hreal hab_ac
  have hcd_bd_dist :
      dist (boundary ic) (boundary id) =
        dist (boundary ib) (boundary id) := by
    simpa only [edgeDist, hpoint] using EdgeClosure.sound hreal hcd_bd
  have hstrict :=
    CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      hA hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
  linarith

#print axioms false_of_equal_sum_core
#print axioms false_of_complementary_equal_sum_core

end WholeCarrierGlobalEqualityKalmanson
end Problem97
