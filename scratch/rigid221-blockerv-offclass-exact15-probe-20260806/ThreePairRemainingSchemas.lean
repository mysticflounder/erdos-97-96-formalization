import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

/-- The three equal-shell relations `012`, `102`, and `301` contradict the
strict Kalmanson inequality on four increasing convex-boundary vertices. -/
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

/-- The three equal-shell relations `012`, `123`, and `413` contradict three
strict Kalmanson inequalities on five increasing convex-boundary vertices. -/
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

#print axioms false_of_four_ccw_three_shell_equalities_012_102_301
#print axioms false_of_five_ccw_three_shell_equalities_012_123_413

end CapCrossingKalmansonBridge
end Problem97
