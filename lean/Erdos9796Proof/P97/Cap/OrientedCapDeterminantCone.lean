/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.Geometry.EqualRadiusDeterminantCone
import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.Moser.NonDeg

/-!
# Oriented cap ingress to the equal-radius determinant cone

This module connects the cap-region Thales inequality to the invariant
equal-radius determinant obstruction.  The bridge is coordinate-free: a point
in an MEC cap has the radial supporting inequality for that cap's support
chord.  A positive orientation of the cap apex then turns the orientation-free
cap product into the single signed-area inequality consumed by the determinant
kernel.

The support chord matters.  Membership in the cap opposite `v1` controls the
chord `v2 v3`; it does not control either neighboring chord.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97

private theorem inner_eq_coords (u w : ℝ²) :
    ⟪u, w⟫_ℝ = u 0 * w 0 + u 1 * w 1 := by
  rw [PiLp.inner_apply]
  simp [Fin.sum_univ_two, mul_comm (u _) (w _)]

/-- The radial projection defect at one endpoint of a chord is exactly the
inner product of the two chord vectors based at the test point. -/
private theorem dist_sq_sub_inner_eq_chord_inner (O m v : ℝ²) :
    dist O v ^ 2 - ⟪m - O, v - O⟫_ℝ = ⟪O - v, m - v⟫_ℝ := by
  simp only [dist_sq_coord, inner_eq_coords, PiLp.sub_apply]
  ring

/-- A point in the closed cap opposite `apex` satisfies the radial supporting
inequality for the cap's support chord `O m`.

This is the radial form of `inner_nonpos_of_cap_region_thales`. -/
theorem radialSupport_of_cap_region_thales
    {C apex O m v : ℝ²} {r : ℝ}
    (hapexBoundary : ‖apex - C‖ = r)
    (hOBoundary : ‖O - C‖ = r)
    (hmBoundary : ‖m - C‖ = r)
    (hvDisk : ‖v - C‖ ≤ r)
    (hnonobtuseApex : 0 ≤ ⟪O - apex, m - apex⟫_ℝ)
    (hvCap : OnArcOpposite apex O m v)
    (hNonDeg : signedArea2 apex O m ≠ 0)
    (hOm : O ≠ m) :
    dist O v ^ 2 ≤ ⟪m - O, v - O⟫_ℝ := by
  have hinner : ⟪O - v, m - v⟫_ℝ ≤ 0 :=
    inner_nonpos_of_cap_region_thales hapexBoundary hOBoundary hmBoundary
      hvDisk hnonobtuseApex hvCap hNonDeg hOm
  rw [← sub_nonpos, dist_sq_sub_inner_eq_chord_inner]
  exact hinner

namespace CircumscribedMECPacket

variable {A : Finset ℝ²} {M : MoserTriangle A}

/-- Packet-level radial support for a point of `A` in the cap opposite
`M.v1`.  The resulting support chord is exactly `M.v2 M.v3`. -/
theorem radialSupport_of_onArcOpposite
    (P : CircumscribedMECPacket A M) {v : ℝ²}
    (hvA : v ∈ A)
    (hvCap : OnArcOpposite M.v1 M.v2 M.v3 v) :
    dist M.v2 v ^ 2 ≤ ⟪M.v3 - M.v2, v - M.v2⟫_ℝ := by
  have h1 : dist M.v1 P.center = P.radius := by
    simpa only [dist_eq_norm] using P.moser_on_boundary_1
  have h2 : dist M.v2 P.center = P.radius := by
    simpa only [dist_eq_norm] using P.moser_on_boundary_2
  have h3 : dist M.v3 P.center = P.radius := by
    simpa only [dist_eq_norm] using P.moser_on_boundary_3
  have hNonDeg : signedArea2 M.v1 M.v2 M.v3 ≠ 0 :=
    MEC.signedArea2_ne_zero_of_three_dist_eq h1 h2 h3
      M.v12_ne M.v23_ne M.v13_ne
  exact radialSupport_of_cap_region_thales P.moser_on_boundary_1
    P.moser_on_boundary_2 P.moser_on_boundary_3
    (P.disk_contains_A v hvA) P.inner_at_v1 hvCap hNonDeg M.v23_ne

/-- An oriented MEC cap is incompatible with an equal-radius determinant
cone.  Besides packet data, the only cap inputs are membership on the side
opposite `M.v1` and a choice of positive orientation for the Moser triangle.

The base point of the determinant cone is `M.v2`, and its radial support
endpoint is `M.v3`. -/
theorem false_of_equalRadius_detCone_of_onArcOpposite
    (P : CircumscribedMECPacket A M) {delta v : ℝ²}
    (hvA : v ∈ A)
    (hvCap : OnArcOpposite M.v1 M.v2 M.v3 v)
    (hOrientation : 0 < signedArea2 M.v1 M.v2 M.v3)
    (hEqSq : dist M.v2 delta ^ 2 = dist M.v2 v ^ 2)
    (hFirst : signedArea2 M.v2 delta v < 0)
    (hSecond : 0 < signedArea2 delta M.v3 v) :
    False := by
  have hRadialSupport :
      dist M.v2 v ^ 2 ≤ ⟪M.v3 - M.v2, v - M.v2⟫_ℝ :=
    P.radialSupport_of_onArcOpposite hvA hvCap
  have hCapProduct :
      signedArea2 M.v2 M.v3 v * signedArea2 M.v1 M.v2 M.v3 ≤ 0 := by
    have hCyclic :
        signedArea2 v M.v2 M.v3 = signedArea2 M.v2 M.v3 v := by
      simp only [signedArea2]
      ring
    change signedArea2 v M.v2 M.v3 * signedArea2 M.v1 M.v2 M.v3 ≤ 0 at hvCap
    rwa [hCyclic] at hvCap
  have hCapTurn : signedArea2 M.v2 M.v3 v ≤ 0 := by
    by_contra hnot
    have hpositive : 0 < signedArea2 M.v2 M.v3 v := lt_of_not_ge hnot
    have hproductPositive :
        0 < signedArea2 M.v2 M.v3 v * signedArea2 M.v1 M.v2 M.v3 :=
      mul_pos hpositive hOrientation
    exact (not_lt_of_ge hCapProduct) hproductPositive
  exact Erdos9796Proof.Geometry.false_of_equalRadius_detCone
    hEqSq hFirst hCapTurn hRadialSupport hSecond

end CircumscribedMECPacket
end Problem97
