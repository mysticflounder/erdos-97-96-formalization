import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Boundary-indexed `012/124/314` Kalmanson obstruction

This scratch module checks that the generic Kalmanson inequalities apply directly to the
arbitrary `Fin B.n` boundary enumeration carried by `BoundaryIndexing A`.
-/

open scoped Convex EuclideanGeometry

namespace Problem97.Census554.GeneralCarrierBridge

/-- The `012/124/314` Kalmanson obstruction for an arbitrary boundary indexing. -/
theorem false_of_boundaryIndexing_five_shell_equalities_012_124_314
    {A : Finset ℝ²} (hA : ConvexIndep A) (B : BoundaryIndexing A)
    {i0 i1 i2 i3 i4 : Fin B.n}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (h012 : dist (B.boundary i0) (B.boundary i1) = dist (B.boundary i0) (B.boundary i2))
    (h124 : dist (B.boundary i1) (B.boundary i2) = dist (B.boundary i1) (B.boundary i4))
    (h314 : dist (B.boundary i3) (B.boundary i1) = dist (B.boundary i3) (B.boundary i4)) :
    False := by
  have hK2_0123 :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw hA
      B.boundary_injective B.boundary_image B.boundary_ccw h01 h12 h23
  have hK1_0124 :=
    CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA
      B.boundary_injective B.boundary_image B.boundary_ccw h01 h12 (h23.trans h34)
  have hK1_0234 :=
    CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA
      B.boundary_injective B.boundary_image B.boundary_ccw (h01.trans h12) h23 h34
  have h314' :
      dist (B.boundary i1) (B.boundary i3) = dist (B.boundary i3) (B.boundary i4) := by
    simpa only [dist_comm (B.boundary i3) (B.boundary i1)] using h314
  linarith

#print axioms false_of_boundaryIndexing_five_shell_equalities_012_124_314

end Problem97.Census554.GeneralCarrierBridge
