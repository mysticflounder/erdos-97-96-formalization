/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.FivePointEuclideanObstruction
import Erdos9796Proof.P97.ConvexCyclicOrder.Basic

/-!
# Three-equality Kalmanson schemas

This module records irreducible three-equality contradictions from the
equality-only CEGAR audits.  Each theorem is cardinality-independent:
it assumes only that the displayed vertices occur in the stated order in one
strictly convex CCW boundary enumeration.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

/-- Transport any contradiction schema stated for a CCW enumeration across a
cyclic change of cut.  This is the soundness bridge used when the finite miner
closes a checked three-shell schema under rotations but not reflections. -/
theorem false_of_cyclicShift_ccw
    {A : Finset ℝ²}
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (cut : Fin A.card)
    {P : (Fin A.card → ℝ²) → Prop}
    (hP : P (fun t : Fin A.card => phi (t + cut)))
    (hfalse : ∀ {psi : Fin A.card → ℝ²},
      Function.Injective psi →
      Finset.univ.image psi = A →
      EuclideanGeometry.IsCcwConvexPolygon psi →
      P psi →
      False) :
    False := by
  apply hfalse (psi := fun t : Fin A.card => phi (t + cut))
  · exact Problem97.injective_cyclicShift hphi_inj cut
  · exact (Problem97.image_univ_cyclicShift phi cut).trans hphi_image
  · exact Problem97.isCcwConvexPolygon_cyclicShift hphi_inj hccw cut
  · exact hP

/-- The three distance equalities

```text
d(0,1) = d(0,3),  d(4,1) = d(4,2),  d(5,2) = d(5,3)
```

are incompatible with six vertices in the strict CCW order `0 < 1 < 2 < 3 < 4 < 5`.
-/
theorem false_of_six_ccw_three_shell_equalities_013_412_523
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h412 : dist (phi i4) (phi i1) = dist (phi i4) (phi i2))
    (h523 : dist (phi i5) (phi i2) = dist (phi i5) (phi i3)) :
    False := by
  have hK1_0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hK1_0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hK2_1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have h412' : dist (phi i1) (phi i4) = dist (phi i2) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i2)] using h412
  have h523' : dist (phi i2) (phi i5) = dist (phi i3) (phi i5) := by
    simpa only [dist_comm (phi i5) (phi i2), dist_comm (phi i5) (phi i3)] using h523
  linarith

/-- The three distance equalities

```text
d(3,0) = d(3,1),  d(4,1) = d(4,5),  d(2,0) = d(2,5)
```

are incompatible with six vertices in the strict CCW order `0 < 1 < 2 < 3 < 4 < 5`.
This is the cyclicly shifted orientation of the `013_412_523` shell pattern
found by the exact-seventeen full-cover audit.
-/
theorem false_of_six_ccw_three_shell_equalities_301_415_205
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h301 : dist (phi i3) (phi i0) = dist (phi i3) (phi i1))
    (h415 : dist (phi i4) (phi i1) = dist (phi i4) (phi i5))
    (h205 : dist (phi i2) (phi i0) = dist (phi i2) (phi i5)) :
    False := by
  have hmain_0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hcomp_0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hcomp_0345 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans (h12.trans h23)) h34 h45
  have h301' : dist (phi i0) (phi i3) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0), dist_comm (phi i3) (phi i1)] using h301
  have h415' : dist (phi i1) (phi i4) = dist (phi i4) (phi i5) := by
    simpa only [dist_comm (phi i4) (phi i1)] using h415
  have h205' : dist (phi i0) (phi i2) = dist (phi i2) (phi i5) := by
    simpa only [dist_comm (phi i2) (phi i0)] using h205
  linarith

/-- The three distance equalities

```text
d(1,0) = d(1,4),  d(2,4) = d(2,5),  d(3,0) = d(3,5)
```

are incompatible with six vertices in the strict CCW order `0 < 1 < 2 < 3 < 4 < 5`.
This reflected fixed-order orientation was isolated by the exact-seventeen
full-cover audit.
-/
theorem false_of_six_ccw_three_shell_equalities_104_245_305
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h104 : dist (phi i1) (phi i0) = dist (phi i1) (phi i4))
    (h245 : dist (phi i2) (phi i4) = dist (phi i2) (phi i5))
    (h305 : dist (phi i3) (phi i0) = dist (phi i3) (phi i5)) :
    False := by
  have hcomp_0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hcomp_0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hmain_1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have h104' : dist (phi i0) (phi i1) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h104
  have h305' : dist (phi i0) (phi i3) = dist (phi i3) (phi i5) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h305
  linarith

/-- The `215_305_401` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_215_305_401
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h215 : dist (phi i2) (phi i1) = dist (phi i2) (phi i5))
    (h305 : dist (phi i3) (phi i0) = dist (phi i3) (phi i5))
    (h401 : dist (phi i4) (phi i0) = dist (phi i4) (phi i1)) : False := by
  have hC0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h01 h12 h23
  have hC0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hM0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have h215' : dist (phi i1) (phi i2) = dist (phi i2) (phi i5) := by
    simpa only [dist_comm (phi i2) (phi i1)] using h215
  have h305' : dist (phi i0) (phi i3) = dist (phi i3) (phi i5) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h305
  have h401' : dist (phi i0) (phi i4) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i0), dist_comm (phi i4) (phi i1)] using h401
  linarith

/-- The `124_304_402` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_124_304_402
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h124 : dist (phi i1) (phi i2) = dist (phi i1) (phi i4))
    (h304 : dist (phi i3) (phi i0) = dist (phi i3) (phi i4))
    (h402 : dist (phi i4) (phi i0) = dist (phi i4) (phi i2)) : False := by
  have hM0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have hC0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hC0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h01 h12 h23
  have h304' : dist (phi i0) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h304
  have h402' : dist (phi i0) (phi i4) = dist (phi i2) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i0), dist_comm (phi i4) (phi i2)] using h402
  linarith

/-- The `105_245_304` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_105_245_304
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h105 : dist (phi i1) (phi i0) = dist (phi i1) (phi i5))
    (h245 : dist (phi i2) (phi i4) = dist (phi i2) (phi i5))
    (h304 : dist (phi i3) (phi i0) = dist (phi i3) (phi i4)) : False := by
  have hM0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hM0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hC2345 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h23 h34 h45
  have h105' : dist (phi i0) (phi i1) = dist (phi i1) (phi i5) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h105
  have h304' : dist (phi i0) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h304
  linarith

/-- The `103_302_423` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_103_302_423
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h103 : dist (phi i1) (phi i0) = dist (phi i1) (phi i3))
    (h302 : dist (phi i3) (phi i0) = dist (phi i3) (phi i2))
    (h423 : dist (phi i4) (phi i2) = dist (phi i4) (phi i3)) : False := by
  have hM0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have hM0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hC1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h12 h23 h34
  have h103' : dist (phi i0) (phi i1) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h103
  have h302' : dist (phi i0) (phi i3) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0), dist_comm (phi i3) (phi i2)] using h302
  have h423' : dist (phi i2) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i2), dist_comm (phi i4) (phi i3)] using h423
  linarith

/-- The `215_301_405` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_215_301_405
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h215 : dist (phi i2) (phi i1) = dist (phi i2) (phi i5))
    (h301 : dist (phi i3) (phi i0) = dist (phi i3) (phi i1))
    (h405 : dist (phi i4) (phi i0) = dist (phi i4) (phi i5)) : False := by
  have hM0345 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans (h12.trans h23)) h34 h45
  have hM0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hC0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h01 h12 h23
  have h215' : dist (phi i1) (phi i2) = dist (phi i2) (phi i5) := by
    simpa only [dist_comm (phi i2) (phi i1)] using h215
  have h301' : dist (phi i0) (phi i3) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0), dist_comm (phi i3) (phi i1)] using h301
  have h405' : dist (phi i0) (phi i4) = dist (phi i4) (phi i5) := by
    simpa only [dist_comm (phi i4) (phi i0)] using h405
  linarith

/-- The `104_203_534` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_104_203_534
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h104 : dist (phi i1) (phi i0) = dist (phi i1) (phi i4))
    (h203 : dist (phi i2) (phi i0) = dist (phi i2) (phi i3))
    (h534 : dist (phi i5) (phi i3) = dist (phi i5) (phi i4)) : False := by
  have hM0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hC0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hM0345 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans (h12.trans h23)) h34 h45
  have hC1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h12 h23 h34
  have hC1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have h104' : dist (phi i0) (phi i1) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h104
  have h203' : dist (phi i0) (phi i2) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i2) (phi i0)] using h203
  have h534' : dist (phi i3) (phi i5) = dist (phi i4) (phi i5) := by
    simpa only [dist_comm (phi i5) (phi i3), dist_comm (phi i5) (phi i4)] using h534
  linarith

/-- The `145_205_304` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_145_205_304
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h145 : dist (phi i1) (phi i4) = dist (phi i1) (phi i5))
    (h205 : dist (phi i2) (phi i0) = dist (phi i2) (phi i5))
    (h304 : dist (phi i3) (phi i0) = dist (phi i3) (phi i4)) : False := by
  have hC1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have hM0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hC2345 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h23 h34 h45
  have h205' : dist (phi i0) (phi i2) = dist (phi i2) (phi i5) := by
    simpa only [dist_comm (phi i2) (phi i0)] using h205
  have h304' : dist (phi i0) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h304
  linarith

/-- The `302_401_512` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_302_401_512
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h302 : dist (phi i3) (phi i0) = dist (phi i3) (phi i2))
    (h401 : dist (phi i4) (phi i0) = dist (phi i4) (phi i1))
    (h512 : dist (phi i5) (phi i1) = dist (phi i5) (phi i2)) : False := by
  have hC1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have hC0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hC1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h12 h23 h34
  have h302' : dist (phi i0) (phi i3) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0), dist_comm (phi i3) (phi i2)] using h302
  have h401' : dist (phi i0) (phi i4) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i0), dist_comm (phi i4) (phi i1)] using h401
  have h512' : dist (phi i1) (phi i5) = dist (phi i2) (phi i5) := by
    simpa only [dist_comm (phi i5) (phi i1), dist_comm (phi i5) (phi i2)] using h512
  linarith

/-- The `105_302_425` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_105_302_425
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h105 : dist (phi i1) (phi i0) = dist (phi i1) (phi i5))
    (h302 : dist (phi i3) (phi i0) = dist (phi i3) (phi i2))
    (h425 : dist (phi i4) (phi i2) = dist (phi i4) (phi i5)) : False := by
  have hM0345 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans (h12.trans h23)) h34 h45
  have hC1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h12 h23 h34
  have hM0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hM0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hC0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have h105' : dist (phi i0) (phi i1) = dist (phi i1) (phi i5) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h105
  have h302' : dist (phi i0) (phi i3) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0), dist_comm (phi i3) (phi i2)] using h302
  have h425' : dist (phi i2) (phi i4) = dist (phi i4) (phi i5) := by
    simpa only [dist_comm (phi i4) (phi i2)] using h425
  linarith

/-- The `312_401_502` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_312_401_502
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h312 : dist (phi i3) (phi i1) = dist (phi i3) (phi i2))
    (h401 : dist (phi i4) (phi i0) = dist (phi i4) (phi i1))
    (h502 : dist (phi i5) (phi i0) = dist (phi i5) (phi i2)) : False := by
  have hK0245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      (h01.trans h12) (h23.trans h34) h45
  have hK1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h12 h23 h34
  have h312' : dist (phi i1) (phi i3) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i1), dist_comm (phi i3) (phi i2)] using h312
  have h401' : dist (phi i0) (phi i4) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i0), dist_comm (phi i4) (phi i1)] using h401
  have h502' : dist (phi i0) (phi i5) = dist (phi i2) (phi i5) := by
    simpa only [dist_comm (phi i5) (phi i0), dist_comm (phi i5) (phi i2)] using h502
  linarith

/-- The `132_234_024` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_132_234_024
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h132 : dist (phi i1) (phi i3) = dist (phi i1) (phi i2))
    (h234 : dist (phi i2) (phi i3) = dist (phi i2) (phi i4))
    (h024 : dist (phi i0) (phi i2) = dist (phi i0) (phi i4)) : False := by
  have hK0124 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 (h23.trans h34)
  have hK1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h12 h23 h34
  linarith

/-- The `501_241_304` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_501_241_304
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h501 : dist (phi i5) (phi i0) = dist (phi i5) (phi i1))
    (h241 : dist (phi i2) (phi i4) = dist (phi i2) (phi i1))
    (h304 : dist (phi i3) (phi i0) = dist (phi i3) (phi i4)) : False := by
  have hK0135 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) (h34.trans h45)
  have hK1235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h12 h23 (h34.trans h45)
  have hK2345 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h23 h34 h45
  have h501' : dist (phi i0) (phi i5) = dist (phi i1) (phi i5) := by
    simpa only [dist_comm (phi i5) (phi i0), dist_comm (phi i5) (phi i1)] using h501
  have h241' : dist (phi i2) (phi i4) = dist (phi i1) (phi i2) := by
    simpa only [dist_comm (phi i2) (phi i1)] using h241
  have h304' : dist (phi i0) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h304
  linarith

/-- The `421_301_520` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_421_301_520
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h421 : dist (phi i4) (phi i2) = dist (phi i4) (phi i1))
    (h301 : dist (phi i3) (phi i0) = dist (phi i3) (phi i1))
    (h520 : dist (phi i5) (phi i2) = dist (phi i5) (phi i0)) : False := by
  have hK0135 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) (h34.trans h45)
  have hK1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have h421' : dist (phi i2) (phi i4) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i2), dist_comm (phi i4) (phi i1)] using h421
  have h301' : dist (phi i0) (phi i3) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0), dist_comm (phi i3) (phi i1)] using h301
  have h520' : dist (phi i2) (phi i5) = dist (phi i0) (phi i5) := by
    simpa only [dist_comm (phi i5) (phi i2), dist_comm (phi i5) (phi i0)] using h520
  linarith

/-- The `541_031_234` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_541_031_234
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h541 : dist (phi i5) (phi i4) = dist (phi i5) (phi i1))
    (h031 : dist (phi i0) (phi i3) = dist (phi i0) (phi i1))
    (h234 : dist (phi i2) (phi i3) = dist (phi i2) (phi i4)) : False := by
  have hK0145 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 (h12.trans (h23.trans h34)) h45
  have hK0234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      (h01.trans h12) h23 h34
  have h541' : dist (phi i4) (phi i5) = dist (phi i1) (phi i5) := by
    simpa only [dist_comm (phi i5) (phi i4), dist_comm (phi i5) (phi i1)] using h541
  linarith

/-- The `012_013_123` fixed-order shell pattern is impossible on four CCW vertices. -/
theorem false_of_four_ccw_three_shell_equalities_012_013_123
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h123 : dist (phi i1) (phi i2) = dist (phi i1) (phi i3)) : False := by
  have hK :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h01 h12 h23
  linarith

/-- The `012_013_423` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_012_013_423
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h423 : dist (phi i4) (phi i2) = dist (phi i4) (phi i3)) : False := by
  have hK :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have h423' : dist (phi i2) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i2), dist_comm (phi i4) (phi i3)] using h423
  linarith

/-- The `012_023_413` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_012_023_413
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h023 : dist (phi i0) (phi i2) = dist (phi i0) (phi i3))
    (h413 : dist (phi i4) (phi i1) = dist (phi i4) (phi i3)) : False := by
  have hK0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hK0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have h413' : dist (phi i1) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i3)] using h413
  linarith

/-- The `012_314_324` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_012_314_324
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h314 : dist (phi i3) (phi i1) = dist (phi i3) (phi i4))
    (h324 : dist (phi i3) (phi i2) = dist (phi i3) (phi i4)) : False := by
  have hK0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hK1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw h12 h23 h34
  have h314' : dist (phi i1) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i1)] using h314
  have h324' : dist (phi i2) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i2)] using h324
  linarith

/-- The `013_023_412` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_013_023_412
    {A : Finset ℝ²} (hA : ConvexIndep A) {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi) (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h023 : dist (phi i0) (phi i2) = dist (phi i0) (phi i3))
    (h412 : dist (phi i4) (phi i1) = dist (phi i4) (phi i2)) : False := by
  have hK :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have h412' : dist (phi i1) (phi i4) = dist (phi i2) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i2)] using h412
  linarith

/-- The three distance equalities

```text
d(0,1) = d(0,2),  d(3,2) = d(3,5),  d(4,1) = d(4,5)
```

are incompatible with six vertices in the strict CCW order `0 < 1 < 2 < 3 < 4 < 5`.
-/
theorem false_of_six_ccw_three_shell_equalities_012_325_415
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h325 : dist (phi i3) (phi i2) = dist (phi i3) (phi i5))
    (h415 : dist (phi i4) (phi i1) = dist (phi i4) (phi i5)) :
    False := by
  have hK1_0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hK2_0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hK1_0345 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans (h12.trans h23)) h34 h45
  have hK2_1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 h23 h34
  have hK2_1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have h325' : dist (phi i2) (phi i3) = dist (phi i3) (phi i5) := by
    simpa only [dist_comm (phi i3) (phi i2)] using h325
  have h415' : dist (phi i1) (phi i4) = dist (phi i4) (phi i5) := by
    simpa only [dist_comm (phi i4) (phi i1)] using h415
  linarith

/-- The three distance equalities

```text
d(0,1) = d(0,2),  d(1,2) = d(1,4),  d(3,1) = d(3,4)
```

are incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
-/
theorem false_of_five_ccw_three_shell_equalities_012_124_314
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h124 : dist (phi i1) (phi i2) = dist (phi i1) (phi i4))
    (h314 : dist (phi i3) (phi i1) = dist (phi i3) (phi i4)) :
    False := by
  have hK2_0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 h23
  have hK1_0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hK1_0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have h314' : dist (phi i1) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i1)] using h314
  linarith

/-- The three distance equalities

```text
d(0,1) = d(0,3),  d(2,3) = d(2,5),  d(4,1) = d(4,5)
```

are incompatible with six vertices in the strict CCW order `0 < 1 < 2 < 3 < 4 < 5`.
-/
theorem false_of_six_ccw_three_shell_equalities_013_235_415
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h235 : dist (phi i2) (phi i3) = dist (phi i2) (phi i5))
    (h415 : dist (phi i4) (phi i1) = dist (phi i4) (phi i5)) :
    False := by
  have hK1_0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hK2_0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hK1_0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hK1_0345 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans (h12.trans h23)) h34 h45
  have hK2_1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 h23 h34
  have hK2_1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have h415' : dist (phi i1) (phi i4) = dist (phi i4) (phi i5) := by
    simpa only [dist_comm (phi i4) (phi i1)] using h415
  linarith

/-- The three distance equalities

```text
d(1,4) = d(1,0),  d(2,5) = d(2,0),  d(3,5) = d(3,4)
```

are incompatible with six vertices in the strict CCW order `0 < 1 < 2 < 3 < 4 < 5`.
This is the middle-center orientation arising in the exact-fifteen four-row bank.
-/
theorem false_of_six_ccw_three_shell_equalities_140_250_354
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h140 : dist (phi i1) (phi i4) = dist (phi i1) (phi i0))
    (h250 : dist (phi i2) (phi i5) = dist (phi i2) (phi i0))
    (h354 : dist (phi i3) (phi i5) = dist (phi i3) (phi i4)) :
    False := by
  have hcomp_0125 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans (h34.trans h45))
  have hmain_1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have hmain_2345 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h23 h34 h45
  have h140' : dist (phi i1) (phi i4) = dist (phi i0) (phi i1) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h140
  have h250' : dist (phi i2) (phi i5) = dist (phi i0) (phi i2) := by
    simpa only [dist_comm (phi i2) (phi i0)] using h250
  linarith

/-- The reflected companion of `false_of_six_ccw_three_shell_equalities_140_250_354`.
The three distance equalities

```text
d(4,1) = d(4,5),  d(3,0) = d(3,5),  d(2,0) = d(2,1)
```

are incompatible with six vertices in the strict CCW order `0 < 1 < 2 < 3 < 4 < 5`.
-/
theorem false_of_six_ccw_three_shell_equalities_415_305_201
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h415 : dist (phi i4) (phi i1) = dist (phi i4) (phi i5))
    (h305 : dist (phi i3) (phi i0) = dist (phi i3) (phi i5))
    (h201 : dist (phi i2) (phi i0) = dist (phi i2) (phi i1)) :
    False := by
  have hmain_0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 h23
  have hcomp_1345 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h12.trans h23) h34 h45
  have h415' : dist (phi i1) (phi i4) = dist (phi i4) (phi i5) := by
    simpa only [dist_comm (phi i4) (phi i1)] using h415
  have h305' : dist (phi i0) (phi i3) = dist (phi i3) (phi i5) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h305
  have h201' : dist (phi i0) (phi i2) = dist (phi i1) (phi i2) := by
    simpa only [dist_comm (phi i2) (phi i0), dist_comm (phi i2) (phi i1)] using h201
  linarith

/-- The three distance equalities

```text
d(0,4) = d(0,3),  d(1,4) = d(1,0),  d(2,0) = d(2,3)
```

are incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
This is the overlap orientation arising in the exact-fifteen four-row bank.
-/
theorem false_of_five_ccw_three_shell_equalities_043_140_203
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h043 : dist (phi i0) (phi i4) = dist (phi i0) (phi i3))
    (h140 : dist (phi i1) (phi i4) = dist (phi i1) (phi i0))
    (h203 : dist (phi i2) (phi i0) = dist (phi i2) (phi i3)) :
    False := by
  have hcomp_0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hmain_0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hmain_1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 h23 h34
  have h140' : dist (phi i1) (phi i4) = dist (phi i0) (phi i1) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h140
  have h203' : dist (phi i0) (phi i2) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i2) (phi i0)] using h203
  linarith

/-- The reflected companion of `false_of_five_ccw_three_shell_equalities_043_140_203`.
The three distance equalities

```text
d(4,1) = d(4,0),  d(3,0) = d(3,4),  d(2,4) = d(2,1)
```

are incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
-/
theorem false_of_five_ccw_three_shell_equalities_410_304_241
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h410 : dist (phi i4) (phi i1) = dist (phi i4) (phi i0))
    (h304 : dist (phi i3) (phi i0) = dist (phi i3) (phi i4))
    (h241 : dist (phi i2) (phi i4) = dist (phi i2) (phi i1)) :
    False := by
  have hmain_0124 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 (h23.trans h34)
  have hcomp_0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have h410' : dist (phi i1) (phi i4) = dist (phi i0) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i0)] using h410
  have h304' : dist (phi i0) (phi i3) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h304
  have h241' : dist (phi i2) (phi i4) = dist (phi i1) (phi i2) := by
    simpa only [dist_comm (phi i2) (phi i1)] using h241
  linarith

/-- The three distance equalities

```text
d(1,0) = d(1,3),  d(2,4) = d(2,3),  d(3,4) = d(3,0)
```

are incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
This is the second overlap orientation arising in the exact-fifteen four-row bank.
-/
theorem false_of_five_ccw_three_shell_equalities_103_243_340
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h103 : dist (phi i1) (phi i0) = dist (phi i1) (phi i3))
    (h243 : dist (phi i2) (phi i4) = dist (phi i2) (phi i3))
    (h340 : dist (phi i3) (phi i4) = dist (phi i3) (phi i0)) :
    False := by
  have hcomp_0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hcomp_0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have hmain_1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 h23 h34
  have h103' : dist (phi i0) (phi i1) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h103
  have h340' : dist (phi i3) (phi i4) = dist (phi i0) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0)] using h340
  linarith

/-- The reflected companion of `false_of_five_ccw_three_shell_equalities_103_243_340`.
The three distance equalities

```text
d(3,4) = d(3,1),  d(2,0) = d(2,1),  d(1,0) = d(1,4)
```

are incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
-/
theorem false_of_five_ccw_three_shell_equalities_341_201_104
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h341 : dist (phi i3) (phi i4) = dist (phi i3) (phi i1))
    (h201 : dist (phi i2) (phi i0) = dist (phi i2) (phi i1))
    (h104 : dist (phi i1) (phi i0) = dist (phi i1) (phi i4)) :
    False := by
  have hmain_0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 h23
  have hcomp_0134 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 (h12.trans h23) h34
  have h341' : dist (phi i3) (phi i4) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i1)] using h341
  have h201' : dist (phi i0) (phi i2) = dist (phi i1) (phi i2) := by
    simpa only [dist_comm (phi i2) (phi i0), dist_comm (phi i2) (phi i1)] using h201
  have h104' : dist (phi i0) (phi i1) = dist (phi i1) (phi i4) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h104
  linarith

/-- The three distance equalities

```text
d(0,1) = d(0,2),  d(1,0) = d(1,2),  d(3,0) = d(3,1)
```

are incompatible with four vertices in the strict CCW order `0 < 1 < 2 < 3`.
-/
theorem false_of_four_ccw_three_shell_equalities_012_102_301
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h102 : dist (phi i1) (phi i0) = dist (phi i1) (phi i2))
    (h301 : dist (phi i3) (phi i0) = dist (phi i3) (phi i1)) :
    False := by
  have hK2_0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 h23
  have h102' : dist (phi i0) (phi i1) = dist (phi i1) (phi i2) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h102
  have h301' : dist (phi i0) (phi i3) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i0), dist_comm (phi i3) (phi i1)] using h301
  linarith

/-- The three distance equalities

```text
d(0,1) = d(0,2),  d(1,2) = d(1,3),  d(4,1) = d(4,3)
```

are incompatible with five vertices in the strict CCW order `0 < 1 < 2 < 3 < 4`.
-/
theorem false_of_five_ccw_three_shell_equalities_012_123_413
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h123 : dist (phi i1) (phi i2) = dist (phi i1) (phi i3))
    (h413 : dist (phi i4) (phi i1) = dist (phi i4) (phi i3)) :
    False := by
  have hK1_0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hK1_0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have hK2_0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 h23
  have h413' : dist (phi i1) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i3)] using h413
  linarith

/-- The `013_023_312` fixed-order shell pattern is impossible on four CCW vertices. -/
theorem false_of_four_ccw_three_shell_equalities_013_023_312
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h023 : dist (phi i0) (phi i2) = dist (phi i0) (phi i3))
    (h312 : dist (phi i3) (phi i1) = dist (phi i3) (phi i2)) :
    False := by
  have hC0123 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 h23
  have h312' : dist (phi i1) (phi i3) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i1), dist_comm (phi i3) (phi i2)] using h312
  linarith

/-- Cyclic-shift consumer for the `013_023_312` schema.  It witnesses the
production path used for every rotation in the finite three-shell bank. -/
theorem false_of_four_ccw_three_shell_equalities_013_023_312_cyclicShift
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    (cut : Fin A.card)
    {i0 i1 i2 i3 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h013 : dist (phi (i0 + cut)) (phi (i1 + cut)) =
      dist (phi (i0 + cut)) (phi (i3 + cut)))
    (h023 : dist (phi (i0 + cut)) (phi (i2 + cut)) =
      dist (phi (i0 + cut)) (phi (i3 + cut)))
    (h312 : dist (phi (i3 + cut)) (phi (i1 + cut)) =
      dist (phi (i3 + cut)) (phi (i2 + cut))) :
    False := by
  apply false_of_cyclicShift_ccw hphi_inj hphi_image hccw cut
    (P := fun psi =>
      dist (psi i0) (psi i1) = dist (psi i0) (psi i3) ∧
      dist (psi i0) (psi i2) = dist (psi i0) (psi i3) ∧
      dist (psi i3) (psi i1) = dist (psi i3) (psi i2))
  · exact ⟨h013, h023, h312⟩
  · intro psi hpsi_inj hpsi_image hpsi_ccw hpattern
    exact false_of_four_ccw_three_shell_equalities_013_023_312 hA
      hpsi_inj hpsi_image hpsi_ccw h01 h12 h23
      hpattern.1 hpattern.2.1 hpattern.2.2

/-- The `013_103_201` fixed-order shell pattern is impossible on four CCW vertices. -/
theorem false_of_four_ccw_three_shell_equalities_013_103_201
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h103 : dist (phi i1) (phi i0) = dist (phi i1) (phi i3))
    (h201 : dist (phi i2) (phi i0) = dist (phi i2) (phi i1)) :
    False := by
  have hM0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 h23
  have h103' : dist (phi i0) (phi i1) = dist (phi i1) (phi i3) := by
    simpa only [dist_comm (phi i1) (phi i0)] using h103
  have h201' : dist (phi i0) (phi i2) = dist (phi i1) (phi i2) := by
    simpa only [dist_comm (phi i2) (phi i0), dist_comm (phi i2) (phi i1)] using h201
  linarith

/-- The `012_413_423` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_012_413_423
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h012 : dist (phi i0) (phi i1) = dist (phi i0) (phi i2))
    (h413 : dist (phi i4) (phi i1) = dist (phi i4) (phi i3))
    (h423 : dist (phi i4) (phi i2) = dist (phi i4) (phi i3)) :
    False := by
  have hC0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have h413' : dist (phi i1) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i3)] using h413
  have h423' : dist (phi i2) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i2), dist_comm (phi i4) (phi i3)] using h423
  linarith

/-- The `013_412_423` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_013_412_423
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h013 : dist (phi i0) (phi i1) = dist (phi i0) (phi i3))
    (h412 : dist (phi i4) (phi i1) = dist (phi i4) (phi i2))
    (h423 : dist (phi i4) (phi i2) = dist (phi i4) (phi i3)) :
    False := by
  have hC0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hC0234 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 h34
  have h412' : dist (phi i1) (phi i4) = dist (phi i2) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i2)] using h412
  have h423' : dist (phi i2) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i2), dist_comm (phi i4) (phi i3)] using h423
  linarith

/-- The `014_024_312` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_014_024_312
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h014 : dist (phi i0) (phi i1) = dist (phi i0) (phi i4))
    (h024 : dist (phi i0) (phi i2) = dist (phi i0) (phi i4))
    (h312 : dist (phi i3) (phi i1) = dist (phi i3) (phi i2)) :
    False := by
  have hC0124 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw h01 h12 (h23.trans h34)
  have hM1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 h23 h34
  have h312' : dist (phi i1) (phi i3) = dist (phi i2) (phi i3) := by
    simpa only [dist_comm (phi i3) (phi i1), dist_comm (phi i3) (phi i2)] using h312
  linarith

/-- The `023_024_134` fixed-order shell pattern is impossible on five CCW vertices. -/
theorem false_of_five_ccw_three_shell_equalities_023_024_134
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h023 : dist (phi i0) (phi i2) = dist (phi i0) (phi i3))
    (h024 : dist (phi i0) (phi i2) = dist (phi i0) (phi i4))
    (h134 : dist (phi i1) (phi i3) = dist (phi i1) (phi i4)) :
    False := by
  have hM0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  linarith

/-- The `035_215_413` fixed-order shell pattern is impossible on six CCW vertices. -/
theorem false_of_six_ccw_three_shell_equalities_035_215_413
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {i0 i1 i2 i3 i4 i5 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h035 : dist (phi i0) (phi i3) = dist (phi i0) (phi i5))
    (h215 : dist (phi i2) (phi i1) = dist (phi i2) (phi i5))
    (h413 : dist (phi i4) (phi i1) = dist (phi i4) (phi i3)) :
    False := by
  have hM0123 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 h12 h23
  have hM0134 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans h23) h34
  have hM0145 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h01 (h12.trans (h23.trans h34)) h45
  have hC0235 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw (h01.trans h12) h23 (h34.trans h45)
  have hM1245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h12 (h23.trans h34) h45
  have hM2345 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      h23 h34 h45
  have h215' : dist (phi i1) (phi i2) = dist (phi i2) (phi i5) := by
    simpa only [dist_comm (phi i2) (phi i1)] using h215
  have h413' : dist (phi i1) (phi i4) = dist (phi i3) (phi i4) := by
    simpa only [dist_comm (phi i4) (phi i1), dist_comm (phi i4) (phi i3)] using h413
  linarith

/-
The next four consumers are cardinality-independent.  The six selected
boundary vertices are in consecutive blocks, and the three selected-row
equalities form a triangle in either incidence orientation.
-/

/-- A center-first three-row triangle in the original incidence orientation. -/
theorem false_of_center_first_two_k2_three_selected_rows_triangle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi5_mem_Row1 : boundary i5 ∈ Row1.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i3) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi3_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i4) = dist (boundary i1) (boundary i5) :=
    (Row1.support_eq_radius _ hi4_mem_Row1).trans
      (Row1.support_eq_radius _ hi5_mem_Row1).symm
  have hrow2 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i4) :=
    (Row2.support_eq_radius _ hi3_mem_Row2).trans
      (Row2.support_eq_radius _ hi4_mem_Row2).symm
  have hkal0135 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i0) (ib := i1) (ic := i3) (id := i5) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 (h12.trans h23) (h34.trans h45)
  have hkal1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i1) (ib := i2) (ic := i3) (id := i4) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 h34
  linarith

/-- A center-first three-row triangle in the reflected incidence orientation. -/
theorem false_of_center_first_two_k2_three_selected_rows_triangle_reflected
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass carrier (boundary i0))
    (Row1 : SelectedFourClass carrier (boundary i1))
    (Row2 : SelectedFourClass carrier (boundary i2))
    (hi4_mem_Row0 : boundary i4 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi5_mem_Row2 : boundary i5 ∈ Row2.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i4) = dist (boundary i0) (boundary i5) :=
    (Row0.support_eq_radius _ hi4_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary i1) (boundary i3) = dist (boundary i1) (boundary i4) :=
    (Row1.support_eq_radius _ hi3_mem_Row1).trans
      (Row1.support_eq_radius _ hi4_mem_Row1).symm
  have hrow2 :
      dist (boundary i2) (boundary i3) = dist (boundary i2) (boundary i5) :=
    (Row2.support_eq_radius _ hi3_mem_Row2).trans
      (Row2.support_eq_radius _ hi5_mem_Row2).symm
  have hkal0145 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i0) (ib := i1) (ic := i4) (id := i5) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 (h12.trans (h23.trans h34)) h45
  have hkal1235 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i1) (ib := i2) (ic := i3) (id := i5) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 (h34.trans h45)
  linarith

/-- A support-first three-row triangle in the original incidence orientation. -/
theorem false_of_support_first_two_k2_three_selected_rows_triangle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi0_mem_Row3 : boundary i0 ∈ Row3.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi2_mem_Row4 : boundary i2 ∈ Row4.support)
    (hi0_mem_Row5 : boundary i0 ∈ Row5.support)
    (hi1_mem_Row5 : boundary i1 ∈ Row5.support) :
    False := by
  have hrow3 :
      dist (boundary i0) (boundary i3) = dist (boundary i2) (boundary i3) := by
    rw [dist_comm (boundary i0), dist_comm (boundary i2)]
    exact (Row3.support_eq_radius _ hi0_mem_Row3).trans
      (Row3.support_eq_radius _ hi2_mem_Row3).symm
  have hrow4 :
      dist (boundary i1) (boundary i4) = dist (boundary i2) (boundary i4) := by
    rw [dist_comm (boundary i1), dist_comm (boundary i2)]
    exact (Row4.support_eq_radius _ hi1_mem_Row4).trans
      (Row4.support_eq_radius _ hi2_mem_Row4).symm
  have hrow5 :
      dist (boundary i0) (boundary i5) = dist (boundary i1) (boundary i5) := by
    rw [dist_comm (boundary i0), dist_comm (boundary i1)]
    exact (Row5.support_eq_radius _ hi0_mem_Row5).trans
      (Row5.support_eq_radius _ hi1_mem_Row5).symm
  have hkal0135 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i0) (ib := i1) (ic := i3) (id := i5) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h01 (h12.trans h23) (h34.trans h45)
  have hkal1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i1) (ib := i2) (ic := i3) (id := i4) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 h34
  linarith

/-- A support-first three-row triangle in the reflected incidence orientation. -/
theorem false_of_support_first_two_k2_three_selected_rows_triangle_reflected
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row3 : SelectedFourClass carrier (boundary i3))
    (Row4 : SelectedFourClass carrier (boundary i4))
    (Row5 : SelectedFourClass carrier (boundary i5))
    (hi1_mem_Row3 : boundary i1 ∈ Row3.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi0_mem_Row4 : boundary i0 ∈ Row4.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi0_mem_Row5 : boundary i0 ∈ Row5.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support) :
    False := by
  have hrow3 :
      dist (boundary i1) (boundary i3) = dist (boundary i2) (boundary i3) := by
    rw [dist_comm (boundary i1), dist_comm (boundary i2)]
    exact (Row3.support_eq_radius _ hi1_mem_Row3).trans
      (Row3.support_eq_radius _ hi2_mem_Row3).symm
  have hrow4 :
      dist (boundary i0) (boundary i4) = dist (boundary i1) (boundary i4) := by
    rw [dist_comm (boundary i0), dist_comm (boundary i1)]
    exact (Row4.support_eq_radius _ hi0_mem_Row4).trans
      (Row4.support_eq_radius _ hi1_mem_Row4).symm
  have hrow5 :
      dist (boundary i0) (boundary i5) = dist (boundary i2) (boundary i5) := by
    rw [dist_comm (boundary i0), dist_comm (boundary i2)]
    exact (Row5.support_eq_radius _ hi0_mem_Row5).trans
      (Row5.support_eq_radius _ hi2_mem_Row5).symm
  have hkal0245 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i0) (ib := i2) (ic := i4) (id := i5) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw (h01.trans h12) (h23.trans h34) h45
  have hkal1234 :=
    dist_add_dist_lt_diagonal_sum_of_ccw (phi := boundary)
      (ia := i1) (ib := i2) (ic := i3) (id := i4) hcarrier hboundaryInjective
      hboundaryImage hboundaryCcw h12 h23 h34
  linarith

/-- Three interleaved selected rows are impossible when their six named
vertices occur in increasing boundary order.  This is the selected-row form
of the cyclic `541_031_234` three-equality obstruction. -/
theorem false_of_three_selected_rows_interleaved
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (BRow : SelectedFourClass carrier (boundary b))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hd_mem_BRow : boundary d ∈ BRow.support)
    (ha_mem_ERow : boundary a ∈ ERow.support)
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support)
    (hc_mem_FRow : boundary c ∈ FRow.support) : False := by
  have hB := (BRow.support_eq_radius _ hc_mem_BRow).trans
    (BRow.support_eq_radius _ hd_mem_BRow).symm
  have hE := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hd_mem_ERow).symm
  have hF := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hc_mem_FRow).symm
  have hKadef := dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      (hab.trans (hbc.trans hcd)) hde hef
  have hKbcdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      hbc hcd (hde.trans hef)
  simp only [dist_comm] at hB hE hF hKadef hKbcdf
  linarith

/-- Decreasing-index companion of
`false_of_three_selected_rows_interleaved`. -/
theorem false_of_three_selected_rows_interleaved_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (BRow : SelectedFourClass carrier (boundary b))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hd_mem_BRow : boundary d ∈ BRow.support)
    (ha_mem_ERow : boundary a ∈ ERow.support)
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support)
    (hc_mem_FRow : boundary c ∈ FRow.support) : False := by
  have hB := (BRow.support_eq_radius _ hc_mem_BRow).trans
    (BRow.support_eq_radius _ hd_mem_BRow).symm
  have hE := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hd_mem_ERow).symm
  have hF := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hc_mem_FRow).symm
  have hKfeda := dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      hfe hed (hdc.trans (hcb.trans hba))
  have hKfdcb := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hcarrier hboundaryInjective hboundaryImage hboundaryCcw
      (hfe.trans hed) hdc hcb
  simp only [dist_comm] at hB hE hF hKfeda hKfdcb
  linarith

/-- Cyclic-shift form of the increasing interleaved selected-row consumer. -/
theorem false_of_three_selected_rows_interleaved_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hd_mem_BRow : boundary (d + cut) ∈ BRow.support)
    (ha_mem_ERow : boundary (a + cut) ∈ ERow.support)
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (ha_mem_FRow : boundary (a + cut) ∈ FRow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_three_selected_rows_interleaved hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundaryInjective cut)
    (by simpa only [shifted] using
      (image_univ_cyclicShift boundary cut).trans hboundaryImage)
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundaryInjective hboundaryCcw cut)
    hab hbc hcd hde hef BRow ERow FRow
    hc_mem_BRow hd_mem_BRow ha_mem_ERow hd_mem_ERow ha_mem_FRow hc_mem_FRow

/-- Cyclic-shift form of the decreasing interleaved selected-row consumer. -/
theorem false_of_three_selected_rows_interleaved_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = carrier)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hd_mem_BRow : boundary (d + cut) ∈ BRow.support)
    (ha_mem_ERow : boundary (a + cut) ∈ ERow.support)
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (ha_mem_FRow : boundary (a + cut) ∈ FRow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_three_selected_rows_interleaved_of_decreasing hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundaryInjective cut)
    (by simpa only [shifted] using
      (image_univ_cyclicShift boundary cut).trans hboundaryImage)
    (by simpa only [shifted] using
      isCcwConvexPolygon_cyclicShift hboundaryInjective hboundaryCcw cut)
    hba hcb hdc hed hfe BRow ERow FRow
    hc_mem_BRow hd_mem_BRow ha_mem_ERow hd_mem_ERow ha_mem_FRow hc_mem_FRow

end CapCrossingKalmansonBridge
end Problem97
