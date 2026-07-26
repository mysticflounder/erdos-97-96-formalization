/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Extension-stable Kalmanson consumers from the exact-four search

This scratch module isolates the two signed row/order schemas extracted from
the current fixed-row exact-four `n = 11` full-LRA survivors.  The statements
are independent of the carrier cardinality: the literal slot indices from the
search have been replaced by named boundary positions and only the order
relations used by the strict Kalmanson inequalities remain.

These are contradiction consumers, not occurrence or coverage theorems.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace UniqueFourKalmansonCoresScratch

open CapCrossingKalmansonBridge

/-- One endpoint `K2` inequality and one endpoint `K1` inequality are
incompatible with the three displayed selected-row equalities.

This is the cardinality-generic normal form of
`exact4_opp1_4.full_lra.json`.  The endpoint inequalities subsume the
consecutive paths in the external core. -/
theorem false_of_endpoint_k2_endpoint_k1_three_selected_rows
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i4 i6 i7 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h14 : i1 < i4) (h46 : i4 < i6)
    (h67 : i6 < i7) (h7ten : i7 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row10 : SelectedFourClass carrier (boundary i10))
    (hi4_mem_Row0 : boundary i4 ∈ Row0.support)
    (hi6_mem_Row0 : boundary i6 ∈ Row0.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi7_mem_Row1 : boundary i7 ∈ Row1.support)
    (hi6_mem_Row10 : boundary i6 ∈ Row10.support)
    (hi7_mem_Row10 : boundary i7 ∈ Row10.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i4) = dist (boundary i0) (boundary i6) :=
    (Row0.support_eq_radius _ hi4_mem_Row0).trans
      (Row0.support_eq_radius _ hi6_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i4) = dist (boundary i1) (boundary i7) :=
    (Row1.support_eq_radius _ hi4_mem_Row1).trans
      (Row1.support_eq_radius _ hi7_mem_Row1).symm
  have hrow10 :
      dist (boundary i6) (boundary i10) = dist (boundary i7) (boundary i10) := by
    calc
      dist (boundary i6) (boundary i10) = dist (boundary i10) (boundary i6) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i7) :=
        (Row10.support_eq_radius _ hi6_mem_Row10).trans
          (Row10.support_eq_radius _ hi7_mem_Row10).symm
      _ = dist (boundary i7) (boundary i10) := dist_comm _ _
  have hkal2047 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 h14 (h46.trans h67)
  have hkal1067ten :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw
      (h01.trans (h14.trans h46)) h67 h7ten
  linarith

/-- One endpoint `K2` inequality and one endpoint `K1` inequality are
incompatible with the three displayed selected-row equalities.

This is the cardinality-generic normal form of
`exact4_opp1_5.full_lra.json`.  The endpoint inequalities subsume the two
consecutive paths in the external core. -/
theorem false_of_endpoint_k2_endpoint_k1_three_selected_rows_long
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i6 i8 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h26 : i2 < i6)
    (h68 : i6 < i8) (h8ten : i8 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row10 : SelectedFourClass carrier (boundary i10))
    (hi6_mem_Row0 : boundary i6 ∈ Row0.support)
    (hi8_mem_Row0 : boundary i8 ∈ Row0.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi6_mem_Row1 : boundary i6 ∈ Row1.support)
    (hi2_mem_Row10 : boundary i2 ∈ Row10.support)
    (hi8_mem_Row10 : boundary i8 ∈ Row10.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i6) = dist (boundary i0) (boundary i8) :=
    (Row0.support_eq_radius _ hi6_mem_Row0).trans
      (Row0.support_eq_radius _ hi8_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i2) = dist (boundary i1) (boundary i6) :=
    (Row1.support_eq_radius _ hi2_mem_Row1).trans
      (Row1.support_eq_radius _ hi6_mem_Row1).symm
  have hrow10 :
      dist (boundary i2) (boundary i10) = dist (boundary i8) (boundary i10) := by
    calc
      dist (boundary i2) (boundary i10) = dist (boundary i10) (boundary i2) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i8) :=
        (Row10.support_eq_radius _ hi2_mem_Row10).trans
          (Row10.support_eq_radius _ hi8_mem_Row10).symm
      _ = dist (boundary i8) (boundary i10) := dist_comm _ _
  have hkal20126 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 h12 h26
  have hkal1028ten :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw
      (h01.trans h12) (h26.trans h68) h8ten
  linarith

/-- One `K1` inequality on four increasing boundary vertices is incompatible
with the three cyclic selected-row equalities

```text
row i1: i0 = i2
row i3: i1 = i2
row i2: i0 = i1.
```

This is the cardinality-generic normal form of the smaller full-partition
rerun core `fullpart_opp1_4.full_lra.json`. -/
theorem false_of_one_k1_three_cyclic_selected_rows
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi1_mem_Row3 : boundary i1 ∈ Row3.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support) :
    False := by
  have hrow1 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i2) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i2) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi2_mem_Row1).symm
  have hrow2 :
      dist (boundary i0) (boundary i2) = dist (boundary i1) (boundary i2) := by
    calc
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i1) :=
        (Row2.support_eq_radius _ hi0_mem_Row2).trans
          (Row2.support_eq_radius _ hi1_mem_Row2).symm
      _ = dist (boundary i1) (boundary i2) := dist_comm _ _
  have hrow3 :
      dist (boundary i1) (boundary i3) = dist (boundary i2) (boundary i3) := by
    calc
      dist (boundary i1) (boundary i3) = dist (boundary i3) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i2) :=
        (Row3.support_eq_radius _ hi1_mem_Row3).trans
          (Row3.support_eq_radius _ hi2_mem_Row3).symm
      _ = dist (boundary i2) (boundary i3) := dist_comm _ _
  have hkal :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01 h12 h23
  linarith

/-- Four `K2` inequalities on a six-vertex boundary chain are incompatible
with the five displayed selected-row equalities.

This is the cardinality-generic normal form of the smaller full-partition
rerun core `fullpart_opp1_5.full_lra.json`. -/
theorem false_of_four_k2_five_selected_row_equalities
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi5_mem_Row2 : boundary i5 ∈ Row2.support)
    (hi0_mem_Row3 : boundary i0 ∈ Row3.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i2) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i2) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi2_mem_Row1).symm
  have hrow2a :
      dist (boundary i0) (boundary i2) = dist (boundary i1) (boundary i2) := by
    calc
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i1) :=
        (Row2.support_eq_radius _ hi0_mem_Row2).trans
          (Row2.support_eq_radius _ hi1_mem_Row2).symm
      _ = dist (boundary i1) (boundary i2) := dist_comm _ _
  have hrow2b :
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i5) := by
    calc
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i5) :=
        (Row2.support_eq_radius _ hi0_mem_Row2).trans
          (Row2.support_eq_radius _ hi5_mem_Row2).symm
  have hrow3 :
      dist (boundary i0) (boundary i3) = dist (boundary i2) (boundary i3) := by
    calc
      dist (boundary i0) (boundary i3) = dist (boundary i3) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i2) :=
        (Row3.support_eq_radius _ hi0_mem_Row3).trans
          (Row3.support_eq_radius _ hi2_mem_Row3).symm
      _ = dist (boundary i2) (boundary i3) := dist_comm _ _
  have hkal0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 (h12.trans h23) h34
  have hkal0145 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 ((h12.trans h23).trans h34) h45
  have hkal1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 h34
  have hkal1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 (h23.trans h34) h45
  linarith

/-- One `K2` and two `K1` inequalities on five increasing boundary vertices
are incompatible with the three displayed selected-row equalities.

This is the cardinality-generic normal form of
`round2_opp1_5.full_lra.json`. -/
theorem false_of_one_k2_two_k1_three_selected_rows
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support) :
    False := by
  have hrow1 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i3) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i3) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi3_mem_Row1).symm
  have hrow2 :
      dist (boundary i0) (boundary i2) = dist (boundary i1) (boundary i2) := by
    calc
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i1) :=
        (Row2.support_eq_radius _ hi0_mem_Row2).trans
          (Row2.support_eq_radius _ hi1_mem_Row2).symm
      _ = dist (boundary i1) (boundary i2) := dist_comm _ _
  have hrow4 :
      dist (boundary i1) (boundary i4) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i1) (boundary i4) = dist (boundary i4) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i4) (boundary i3) :=
        (Row4.support_eq_radius _ hi1_mem_Row4).trans
          (Row4.support_eq_radius _ hi3_mem_Row4).symm
      _ = dist (boundary i3) (boundary i4) := dist_comm _ _
  have hkal20123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 h12 h23
  have hkal10124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01 h12 (h23.trans h34)
  have hkal10234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw (h01.trans h12) h23 h34
  linarith

/-- The three-term `K1` path in the round-three card-four core is exactly one
endpoint `K1` inequality.  Four selected rows force its two sides equal. -/
theorem false_of_endpoint_k1_four_selected_rows
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i5 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h25 : i2 < i5) (h5ten : i5 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row10 : SelectedFourClass carrier (boundary i10))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi0_mem_Row10 : boundary i0 ∈ Row10.support)
    (hi2_mem_Row10 : boundary i2 ∈ Row10.support)
    (hi5_mem_Row10 : boundary i5 ∈ Row10.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i2) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i2) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi2_mem_Row1).symm
  have hrow2 :
      dist (boundary i0) (boundary i2) = dist (boundary i1) (boundary i2) := by
    calc
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i1) :=
        (Row2.support_eq_radius _ hi0_mem_Row2).trans
          (Row2.support_eq_radius _ hi1_mem_Row2).symm
      _ = dist (boundary i1) (boundary i2) := dist_comm _ _
  have hrow10a :
      dist (boundary i0) (boundary i10) = dist (boundary i2) (boundary i10) := by
    calc
      dist (boundary i0) (boundary i10) = dist (boundary i10) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i2) :=
        (Row10.support_eq_radius _ hi0_mem_Row10).trans
          (Row10.support_eq_radius _ hi2_mem_Row10).symm
      _ = dist (boundary i2) (boundary i10) := dist_comm _ _
  have hrow10b :
      dist (boundary i0) (boundary i10) = dist (boundary i5) (boundary i10) := by
    calc
      dist (boundary i0) (boundary i10) = dist (boundary i10) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i5) :=
        (Row10.support_eq_radius _ hi0_mem_Row10).trans
          (Row10.support_eq_radius _ hi5_mem_Row10).symm
      _ = dist (boundary i5) (boundary i10) := dist_comm _ _
  have hkal :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw (h01.trans h12) h25 h5ten
  linarith

/-- Endpoint compression of the round-three card-five core. -/
theorem false_of_one_k1_two_endpoint_k2_three_selected_rows
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i4 i7 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h24 : i2 < i4)
    (h47 : i4 < i7) (h7ten : i7 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (hi4_mem_Row0 : boundary i4 ∈ Row0.support)
    (hi7_mem_Row0 : boundary i7 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi7_mem_Row1 : boundary i7 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i4) = dist (boundary i0) (boundary i7) :=
    (Row0.support_eq_radius _ hi4_mem_Row0).trans
      (Row0.support_eq_radius _ hi7_mem_Row0).symm
  have hrow1 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i7) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i7) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi7_mem_Row1).symm
  have hrow2 :
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i4) := by
    calc
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i4) :=
        (Row2.support_eq_radius _ hi0_mem_Row2).trans
          (Row2.support_eq_radius _ hi4_mem_Row2).symm
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01 h12
      (h24.trans (h47.trans h7ten))
  have hkal2a :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 (h12.trans h24) h47
  have hkal2b :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h24 (h47.trans h7ten)
  linarith

/-- Endpoint compression of the 18-inequality round-two card-four core. -/
theorem false_of_roundTwoFour_endpoint_rows
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5) (h5ten : i5 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row10 : SelectedFourClass carrier (boundary i10))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi5_mem_Row2 : boundary i5 ∈ Row2.support)
    (hi1_mem_Row3 : boundary i1 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support)
    (hi0_mem_Row10 : boundary i0 ∈ Row10.support)
    (hi3_mem_Row10 : boundary i3 ∈ Row10.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1a :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i3) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i3) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi3_mem_Row1).symm
  have hrow1b :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i4) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i4) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi4_mem_Row1).symm
  have hrow2 :
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i5) := by
    calc
      dist (boundary i0) (boundary i2) = dist (boundary i2) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i5) :=
        (Row2.support_eq_radius _ hi0_mem_Row2).trans
          (Row2.support_eq_radius _ hi5_mem_Row2).symm
  have hrow3 :
      dist (boundary i1) (boundary i3) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i1) (boundary i3) = dist (boundary i3) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i4) :=
        (Row3.support_eq_radius _ hi1_mem_Row3).trans
          (Row3.support_eq_radius _ hi4_mem_Row3).symm
  have hrow10 :
      dist (boundary i0) (boundary i10) = dist (boundary i3) (boundary i10) := by
    calc
      dist (boundary i0) (boundary i10) = dist (boundary i10) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i3) :=
        (Row10.support_eq_radius _ hi0_mem_Row10).trans
          (Row10.support_eq_radius _ hi3_mem_Row10).symm
      _ = dist (boundary i3) (boundary i10) := dist_comm _ _
  have h2ten : i2 < i10 := h23.trans (h34.trans (h45.trans h5ten))
  have h4ten : i4 < i10 := h45.trans h5ten
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw h01 h12 h2ten
  have hkal2a :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01
      (h12.trans (h23.trans (h34.trans h45))) h5ten
  have hkal2b :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 (h23.trans h34) h4ten
  have hkal2c :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 (h23.trans (h34.trans h45)) h5ten
  have hkal2d :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h23 h34 h4ten
  linarith

/-- Three endpoint inequalities obtained by telescoping the first new
post-bank-eight card-four core. -/
theorem false_of_three_endpoint_kalmanson_four_selected_rows
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i5 i6 i8 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h35 : i3 < i5) (h56 : i5 < i6) (h68 : i6 < i8) (h8ten : i8 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (Row10 : SelectedFourClass carrier (boundary i10))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi6_mem_Row0 : boundary i6 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi5_mem_Row1 : boundary i5 ∈ Row1.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi8_mem_Row2 : boundary i8 ∈ Row2.support)
    (hi0_mem_Row10 : boundary i0 ∈ Row10.support)
    (hi6_mem_Row10 : boundary i6 ∈ Row10.support)
    (hi8_mem_Row10 : boundary i8 ∈ Row10.support) :
    False := by
  have hrow01_5 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow01_6 :
      dist (boundary i0) (boundary i1) = dist (boundary i0) (boundary i6) :=
    (Row0.support_eq_radius _ hi1_mem_Row0).trans
      (Row0.support_eq_radius _ hi6_mem_Row0).symm
  have hrow10_3 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i3) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i3) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi3_mem_Row1).symm
  have hrow10_5 :
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i5) := by
    calc
      dist (boundary i0) (boundary i1) = dist (boundary i1) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i1) (boundary i5) :=
        (Row1.support_eq_radius _ hi0_mem_Row1).trans
          (Row1.support_eq_radius _ hi5_mem_Row1).symm
  have hrow21_3 :
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i3) := by
    calc
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i3) :=
        (Row2.support_eq_radius _ hi1_mem_Row2).trans
          (Row2.support_eq_radius _ hi3_mem_Row2).symm
  have hrow21_8 :
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i8) := by
    calc
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i8) :=
        (Row2.support_eq_radius _ hi1_mem_Row2).trans
          (Row2.support_eq_radius _ hi8_mem_Row2).symm
  have hrow100_6 :
      dist (boundary i0) (boundary i10) = dist (boundary i6) (boundary i10) := by
    calc
      dist (boundary i0) (boundary i10) = dist (boundary i10) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i6) :=
        (Row10.support_eq_radius _ hi0_mem_Row10).trans
          (Row10.support_eq_radius _ hi6_mem_Row10).symm
      _ = dist (boundary i6) (boundary i10) := dist_comm _ _
  have hrow100_8 :
      dist (boundary i0) (boundary i10) = dist (boundary i8) (boundary i10) := by
    calc
      dist (boundary i0) (boundary i10) = dist (boundary i10) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i8) :=
        (Row10.support_eq_radius _ hi0_mem_Row10).trans
          (Row10.support_eq_radius _ hi8_mem_Row10).symm
      _ = dist (boundary i8) (boundary i10) := dist_comm _ _
  have hkal2a :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01
      (h12.trans (h23.trans h35)) (h56.trans h68)
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw
      (h01.trans (h12.trans (h23.trans (h35.trans h56)))) h68 h8ten
  have hkal2b :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23
      (h35.trans (h56.trans h68))
  linarith

/-- Two endpoint inequalities obtained by telescoping the first new
post-bank-eight card-five core. -/
theorem false_of_endpoint_k2_endpoint_k1_three_selected_rows_postBankEight
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i7 i9 i10 : Fin carrier.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h27 : i2 < i7)
    (h79 : i7 < i9) (h9ten : i9 < i10)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row10 : SelectedFourClass carrier (boundary i10))
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi7_mem_Row0 : boundary i7 ∈ Row0.support)
    (hi7_mem_Row1 : boundary i7 ∈ Row1.support)
    (hi9_mem_Row1 : boundary i9 ∈ Row1.support)
    (hi0_mem_Row10 : boundary i0 ∈ Row10.support)
    (hi2_mem_Row10 : boundary i2 ∈ Row10.support)
    (hi9_mem_Row10 : boundary i9 ∈ Row10.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i2) = dist (boundary i0) (boundary i7) :=
    (Row0.support_eq_radius _ hi2_mem_Row0).trans
      (Row0.support_eq_radius _ hi7_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i7) = dist (boundary i1) (boundary i9) :=
    (Row1.support_eq_radius _ hi7_mem_Row1).trans
      (Row1.support_eq_radius _ hi9_mem_Row1).symm
  have hrow10a :
      dist (boundary i0) (boundary i10) = dist (boundary i2) (boundary i10) := by
    calc
      dist (boundary i0) (boundary i10) = dist (boundary i10) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i2) :=
        (Row10.support_eq_radius _ hi0_mem_Row10).trans
          (Row10.support_eq_radius _ hi2_mem_Row10).symm
      _ = dist (boundary i2) (boundary i10) := dist_comm _ _
  have hrow10b :
      dist (boundary i0) (boundary i10) = dist (boundary i9) (boundary i10) := by
    calc
      dist (boundary i0) (boundary i10) = dist (boundary i10) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i10) (boundary i9) :=
        (Row10.support_eq_radius _ hi0_mem_Row10).trans
          (Row10.support_eq_radius _ hi9_mem_Row10).symm
      _ = dist (boundary i9) (boundary i10) := dist_comm _ _
  have hkal2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 (h12.trans h27) h79
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundaryInjective hboundaryImage hboundaryCcw (h01.trans h12)
      (h27.trans h79) h9ten
  linarith

#print axioms false_of_endpoint_k2_endpoint_k1_three_selected_rows
#print axioms false_of_endpoint_k2_endpoint_k1_three_selected_rows_long
#print axioms false_of_one_k1_three_cyclic_selected_rows
#print axioms false_of_four_k2_five_selected_row_equalities
#print axioms false_of_one_k2_two_k1_three_selected_rows
#print axioms false_of_endpoint_k1_four_selected_rows
#print axioms false_of_one_k1_two_endpoint_k2_three_selected_rows
#print axioms false_of_roundTwoFour_endpoint_rows
#print axioms false_of_three_endpoint_kalmanson_four_selected_rows
#print axioms false_of_endpoint_k2_endpoint_k1_three_selected_rows_postBankEight

end UniqueFourKalmansonCoresScratch
end Problem97
