import Erdos9796Proof.P97.Census554.MECStraddlingRowCore

/-!
# `(4,5,6)` residual adapter for the MEC straddling-row core

The finite labels map as follows:

* `0,1,2` are the Moser vertices `v1,v2,v3`;
* `3` is the center of the residual row `3:{0,7,10,11}`;
* `10` is the lower-chain row point; and
* `7` is the upper/closing-chain row point.

The four row equalities reduce to
`|01| = |12| = |03| = |3,10| = |3,7|`.  The circumscribed MEC packet supplies
the boundary circle, disk containment, and nonobtuseness at label `1`.
Only the indicated cyclic orientations remain as explicit order inputs.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace Census554
namespace Residual456MECProducerAdapter

open EqualityCore

/-- The three residual rows centered at labels `0`, `1`, and `3` construct the
four equality-closure edges consumed by `MECStraddlingRowCore`. -/
def core_of_three_residual_rows
    {α : Type*} {rowPattern : RowPattern α} {o a p s x y : α}
    (hoa : o ≠ a)
    (ha_o : a ∈ rowPattern o) (hs_o : s ∈ rowPattern o)
    (ho_a : o ∈ rowPattern a) (hp_a : p ∈ rowPattern a)
    (ho_s : o ∈ rowPattern s) (hx_s : x ∈ rowPattern s)
    (hy_s : y ∈ rowPattern s) : MECStraddlingRowCore.Core rowPattern where
  o := o
  a := a
  p := p
  s := s
  x := x
  y := y
  hoa := hoa
  oa_ap := EdgeClosure.trans (EdgeClosure.flip o a)
    (EdgeClosure.row a o p ho_a hp_a)
  oa_os := EdgeClosure.row o a s ha_o hs_o
  oa_sx := EdgeClosure.trans (EdgeClosure.row o a s ha_o hs_o)
    (EdgeClosure.trans (EdgeClosure.flip o s)
      (EdgeClosure.row s o x ho_s hx_s))
  oa_sy := EdgeClosure.trans (EdgeClosure.row o a s ha_o hs_o)
    (EdgeClosure.trans (EdgeClosure.flip o s)
      (EdgeClosure.row s o y ho_s hy_s))

/-- The exact `(4,5,6)` residual/MEC consumer after mapping labels
`0,1,2,3,10,7` to the ambient carrier. -/
theorem false_of_residual456_mec
    {A : Finset ℝ²} {M : MoserTriangle A}
    (P : CircumscribedMECPacket A M)
    {label3 label10 label7 : ℝ²}
    (h10A : label10 ∈ A)
    (h7A : label7 ∈ A)
    (h01_12 : dist M.v1 M.v2 = dist M.v2 M.v3)
    (h01_03 : dist M.v1 M.v2 = dist M.v1 label3)
    (h01_3_10 : dist M.v1 M.v2 = dist label3 label10)
    (h01_3_7 : dist M.v1 M.v2 = dist label3 label7)
    (h012 : 0 < signedArea2 M.v1 M.v2 M.v3)
    (h013 : 0 < signedArea2 M.v1 M.v2 label3)
    (h0_10_3 : 0 < signedArea2 M.v1 label10 label3)
    (h037 : 0 < signedArea2 M.v1 label3 label7) : False := by
  have hboundary01 : dist M.v1 P.center = dist M.v2 P.center := by
    simpa only [dist_eq_norm] using
      P.moser_on_boundary_1.trans P.moser_on_boundary_2.symm
  have hboundary02 : dist M.v1 P.center = dist M.v3 P.center := by
    simpa only [dist_eq_norm] using
      P.moser_on_boundary_1.trans P.moser_on_boundary_3.symm
  have h10disk : dist label10 P.center ≤ dist M.v1 P.center := by
    calc
      dist label10 P.center = ‖label10 - P.center‖ := dist_eq_norm _ _
      _ ≤ P.radius := P.disk_contains_A label10 h10A
      _ = ‖M.v1 - P.center‖ := P.moser_on_boundary_1.symm
      _ = dist M.v1 P.center := (dist_eq_norm _ _).symm
  have h7disk : dist label7 P.center ≤ dist M.v1 P.center := by
    calc
      dist label7 P.center = ‖label7 - P.center‖ := dist_eq_norm _ _
      _ ≤ P.radius := P.disk_contains_A label7 h7A
      _ = ‖M.v1 - P.center‖ := P.moser_on_boundary_1.symm
      _ = dist M.v1 P.center := (dist_eq_norm _ _).symm
  exact MECStraddlingRowCore.metric_orientation_incompatibility
    M.v12_ne h01_12 h01_03 h01_3_10 h01_3_7
    hboundary01 hboundary02 h10disk h7disk P.inner_at_v2
    h012 h013 h0_10_3 h037

#print axioms false_of_residual456_mec
#print axioms core_of_three_residual_rows

end Residual456MECProducerAdapter
end Census554
end Problem97
