/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.FivePointEuclideanObstruction

/-!
# Three-equality Kalmanson schemas

This module records four irreducible three-equality contradictions from the
672-core equality-only CEGAR audit.  Each theorem is cardinality-independent:
it assumes only that the displayed vertices occur in the stated order in one
strictly convex CCW boundary enumeration.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

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

end CapCrossingKalmansonBridge
end Problem97
