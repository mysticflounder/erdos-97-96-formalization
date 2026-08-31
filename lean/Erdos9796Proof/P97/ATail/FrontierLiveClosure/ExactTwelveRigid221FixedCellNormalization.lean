/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.Geometry.NormalizedFivePointOrientation
import Erdos9796Proof.P97.U2.SimilarityNormalization

/-!
# Similarity ingress for two bounded Rigid221 fixed cells

This module transports the original-space metric and orientation data of the
canonicalized `m0-distinct-s0-i` and `m0-distinct-s0-n` experimental cells through
the orientation-preserving similarity `normSim`.  It deliberately assumes the
three rational normalized coordinates retained by those cells.

The results are bounded fixed-cell incompatibilities.  They do not provide live
or source-universal Rigid221 coverage.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

/-- Original-space data for the common bounded fixed cell is incompatible after
orientation-preserving normalization.  The rational coordinate restrictions are
cell assumptions; every metric and signed-area fact below is transported from the
original points. -/
theorem false_of_fixedCellNormalization
    {O M m1 m2 delta v : ℝ²}
    (hOM : O ≠ M)
    (hm1y : normSim O M m1 1 = -(4 / 5))
    (hm2x : normSim O M m2 0 = 8 / 5)
    (hm2y : normSim O M m2 1 = 4 / 5)
    (hdeltaRadius : dist O delta = dist O v)
    (hvDisk : dist M v ≤ dist M O)
    (hm1Boundary : dist M m1 = dist M O)
    (hdeltaVO : 0 < signedArea2 v delta O)
    (hm1DeltaV : 0 < signedArea2 delta m1 v)
    (hcapProduct :
      signedArea2 v O m1 * signedArea2 m2 O m1 ≤ 0) :
    False := by
  let areaScale : ℝ :=
    ((M 0 - O 0) ^ 2 + (M 1 - O 1) ^ 2)⁻¹
  have hbaseDistPos : 0 < dist O M := dist_pos.mpr hOM
  have hbaseSqEq :
      (M 0 - O 0) ^ 2 + (M 1 - O 1) ^ 2 = dist O M ^ 2 := by
    rw [Problem97.dist_sq_coord]
    ring
  have hareaScalePos : 0 < areaScale := by
    dsimp [areaScale]
    apply inv_pos.mpr
    rw [hbaseSqEq]
    exact sq_pos_of_pos hbaseDistPos
  have hdistScaleNonneg : 0 ≤ (dist O M)⁻¹ :=
    (inv_pos.mpr hbaseDistPos).le
  have hOx : normSim O M O 0 = 0 := by
    rw [normSim_fst]
    rfl
  have hnormalizedRadius :
      dist (normSim O M O) (normSim O M delta) =
        dist (normSim O M O) (normSim O M v) := by
    calc
      dist (normSim O M O) (normSim O M delta) =
          (dist O M)⁻¹ * dist O delta :=
        normSim_dist_image O M hOM O delta
      _ = (dist O M)⁻¹ * dist O v := by rw [hdeltaRadius]
      _ = dist (normSim O M O) (normSim O M v) :=
        (normSim_dist_image O M hOM O v).symm
  have hnormalizedDiskDist :
      dist (normSim O M M) (normSim O M v) ≤
        dist (normSim O M M) (normSim O M O) := by
    calc
      dist (normSim O M M) (normSim O M v) =
          (dist O M)⁻¹ * dist M v :=
        normSim_dist_image O M hOM M v
      _ ≤ (dist O M)⁻¹ * dist M O :=
        mul_le_mul_of_nonneg_left hvDisk hdistScaleNonneg
      _ = dist (normSim O M M) (normSim O M O) :=
        (normSim_dist_image O M hOM M O).symm
  have hnormalizedDiskSq :
      dist (normSim O M M) (normSim O M v) ^ 2 ≤
        dist (normSim O M M) (normSim O M O) ^ 2 := by
    have hsum :
        0 ≤ dist (normSim O M M) (normSim O M v) +
          dist (normSim O M M) (normSim O M O) :=
      add_nonneg dist_nonneg dist_nonneg
    have hproduct := mul_nonneg
      (sub_nonneg.mpr hnormalizedDiskDist)
      hsum
    nlinarith
  have hnormalizedBoundaryDist :
      dist (normSim O M M) (normSim O M m1) =
        dist (normSim O M M) (normSim O M O) := by
    calc
      dist (normSim O M M) (normSim O M m1) =
          (dist O M)⁻¹ * dist M m1 :=
        normSim_dist_image O M hOM M m1
      _ = (dist O M)⁻¹ * dist M O := by rw [hm1Boundary]
      _ = dist (normSim O M M) (normSim O M O) :=
        (normSim_dist_image O M hOM M O).symm
  have hOBoundary :
      dist (!₂[1, 0] : ℝ²) (normSim O M O) ^ 2 = 1 := by
    rw [normSim_fst, Problem97.dist_sq_coord]
    norm_num [pt]
  have hvDiskNormalized :
      dist (!₂[1, 0] : ℝ²) (normSim O M v) ^ 2 ≤ 1 := by
    rw [normSim_snd O M hOM] at hnormalizedDiskSq
    exact hnormalizedDiskSq.trans_eq hOBoundary
  have hm1BoundaryNormalized :
      dist (!₂[1, 0] : ℝ²) (normSim O M m1) ^ 2 = 1 := by
    have hsquare := congrArg (fun x : ℝ ↦ x ^ 2) hnormalizedBoundaryDist
    rw [normSim_snd O M hOM] at hsquare
    exact hsquare.trans hOBoundary
  have hdeltaVONormalized :
      0 < signedArea2 (normSim O M v) (normSim O M delta) (normSim O M O) := by
    rw [signedArea2_normSim O M hOM v delta O]
    exact mul_pos hareaScalePos hdeltaVO
  have hm1DeltaVNormalized :
      0 < signedArea2 (normSim O M delta) (normSim O M m1) (normSim O M v) := by
    rw [signedArea2_normSim O M hOM delta m1 v]
    exact mul_pos hareaScalePos hm1DeltaV
  have hcapProductNormalized :
      signedArea2 (normSim O M v) (normSim O M O) (normSim O M m1) *
        signedArea2 (normSim O M m2) (normSim O M O) (normSim O M m1) ≤ 0 := by
    rw [signedArea2_normSim O M hOM v O m1,
      signedArea2_normSim O M hOM m2 O m1]
    change (areaScale * signedArea2 v O m1) *
      (areaScale * signedArea2 m2 O m1) ≤ 0
    calc
      (areaScale * signedArea2 v O m1) *
          (areaScale * signedArea2 m2 O m1) =
          (areaScale * areaScale) *
            (signedArea2 v O m1 * signedArea2 m2 O m1) := by ring
      _ ≤ 0 := mul_nonpos_of_nonneg_of_nonpos
        (mul_nonneg hareaScalePos.le hareaScalePos.le) hcapProduct
  exact Erdos9796Proof.Geometry.normalizedFivePoint_orientation_incompatibility
    hOx hm1y hm2x hm2y rfl (by rw [← hnormalizedRadius])
    hvDiskNormalized hm1BoundaryNormalized hOBoundary
    hdeltaVONormalized hm1DeltaVNormalized hcapProductNormalized

/-- Compatibility-only corollary for the bounded experimental cell
`m0-distinct-s0-i`.  Its mathematical interface is identical to the
`m0-distinct-s0-n` corollary because the verified common core drops every
branch-only assertion.  This does not claim live or source-universal coverage. -/
theorem false_of_m0DistinctS0I_fixedCell
    {O M m1 m2 delta v : ℝ²}
    (hOM : O ≠ M)
    (hm1y : normSim O M m1 1 = -(4 / 5))
    (hm2x : normSim O M m2 0 = 8 / 5)
    (hm2y : normSim O M m2 1 = 4 / 5)
    (hdeltaRadius : dist O delta = dist O v)
    (hvDisk : dist M v ≤ dist M O)
    (hm1Boundary : dist M m1 = dist M O)
    (hdeltaVO : 0 < signedArea2 v delta O)
    (hm1DeltaV : 0 < signedArea2 delta m1 v)
    (hcapProduct :
      signedArea2 v O m1 * signedArea2 m2 O m1 ≤ 0) :
    False :=
  false_of_fixedCellNormalization hOM hm1y hm2x hm2y hdeltaRadius
    hvDisk hm1Boundary hdeltaVO hm1DeltaV hcapProduct

/-- Compatibility-only corollary for the bounded experimental cell
`m0-distinct-s0-n`.  Its mathematical interface is identical to the
`m0-distinct-s0-i` corollary because the verified common core drops every
branch-only assertion.  This does not claim live or source-universal coverage. -/
theorem false_of_m0DistinctS0N_fixedCell
    {O M m1 m2 delta v : ℝ²}
    (hOM : O ≠ M)
    (hm1y : normSim O M m1 1 = -(4 / 5))
    (hm2x : normSim O M m2 0 = 8 / 5)
    (hm2y : normSim O M m2 1 = 4 / 5)
    (hdeltaRadius : dist O delta = dist O v)
    (hvDisk : dist M v ≤ dist M O)
    (hm1Boundary : dist M m1 = dist M O)
    (hdeltaVO : 0 < signedArea2 v delta O)
    (hm1DeltaV : 0 < signedArea2 delta m1 v)
    (hcapProduct :
      signedArea2 v O m1 * signedArea2 m2 O m1 ≤ 0) :
    False :=
  false_of_fixedCellNormalization hOM hm1y hm2x hm2y hdeltaRadius
    hvDisk hm1Boundary hdeltaVO hm1DeltaV hcapProduct

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
