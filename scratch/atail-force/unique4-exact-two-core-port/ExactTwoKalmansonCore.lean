/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# A strict Kalmanson consumer from the exact-two cap-class branch

This scratch module records the smallest contradiction extracted from the
exact-two strict-cap-hit search.  It is a generic consumer: no occurrence
theorem from the exact-four parent residual is claimed here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactTwoKalmansonCoreScratch

open CapCrossingKalmansonBridge

/-- Two Kalmanson inequalities of the second kind are incompatible with the
three displayed two-point incidences in selected equal-distance classes.

This is the normalized form of the exact-two round-three card-five core.  The
intermediate reference point in two selected classes has been dropped: only
the resulting pairwise equalities are needed.
-/
theorem false_of_two_k2_three_selected_classes
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h3ten : i3 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi10_mem_Row0 : boundary i10 ∈ Row0.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi10_mem_Row2 : boundary i10 ∈ Row2.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i2) = dist (boundary i0) (boundary i10) :=
    (Row0.support_eq_radius _ hi2_mem_Row0).trans
      (Row0.support_eq_radius _ hi10_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i2) = dist (boundary i1) (boundary i3) :=
    (Row1.support_eq_radius _ hi2_mem_Row1).trans
      (Row1.support_eq_radius _ hi3_mem_Row1).symm
  have hrow2 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i10) :=
    (Row2.support_eq_radius _ hi3_mem_Row2).trans
      (Row2.support_eq_radius _ hi10_mem_Row2).symm
  have hkal2a :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 h12 h23
  have hkal2b :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw (h01.trans h12) h23 h3ten
  linarith

#print axioms false_of_two_k2_three_selected_classes

end ExactTwoKalmansonCoreScratch
end Problem97
