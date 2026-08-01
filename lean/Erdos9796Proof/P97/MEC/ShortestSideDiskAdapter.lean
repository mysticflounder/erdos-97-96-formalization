/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.Geometry.ShortestSideBiEquidistance
import Erdos9796Proof.P97.MEC.Basic

/-!
# MEC closed-disk adapters for the normalized shortest-side argument

The shortest-side obstruction consumes a squared coordinate inequality, while
the MEC API exposes disk containment as a distance inequality.  This file is
the one-way bridge between those interfaces.  It does not perform the
geometric normalization or assert any Problem 97 closure.
-/

open scoped EuclideanGeometry

namespace Problem97.MEC

/-- Coordinate form of the closed disk supplied by `mecSphere`. -/
theorem mecSphere_closedDisk_coord
    (A : Finset ℝ²) (hA : A.Nonempty) {p : ℝ²} (hp : p ∈ A) :
    (p 0 - (mecSphere A hA).center 0) ^ 2 +
        (p 1 - (mecSphere A hA).center 1) ^ 2 ≤
      (mecSphere A hA).radius ^ 2 := by
  have hdist := dist_mecSphere_center_le A hA hp
  have hradius := mecSphere_radius_nn A hA
  have hdist_nonneg : 0 ≤ dist p (mecSphere A hA).center := dist_nonneg
  have hsq : dist p (mecSphere A hA).center ^ 2 ≤
      (mecSphere A hA).radius ^ 2 := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hdist)
      (add_nonneg hdist_nonneg hradius)]
  rw [Problem97.dist_sq_coord] at hsq
  exact hsq

/-- The below-axis normalized disk inequality consumed by the shortest-side
obstruction.  The coordinate equalities are hypotheses so this adapter does
not choose, or claim, a normalization for the ambient configuration. -/
theorem mecSphere_closedDisk_coord_normalized_below
    (A : Finset ℝ²) (hA : A.Nonempty) {p : ℝ²} (hp : p ∈ A)
    {ξ t h R : ℝ}
    (hp0 : p 0 = ξ)
    (hp1 : p 1 = -t)
    (hcenter0 : (mecSphere A hA).center 0 = 0)
    (hcenter1 : (mecSphere A hA).center 1 = h)
    (hradius : (mecSphere A hA).radius = R) :
    ξ ^ 2 + (t + h) ^ 2 ≤ R ^ 2 := by
  have hcoord := mecSphere_closedDisk_coord A hA hp
  rw [hp0, hp1, hcenter0, hcenter1, hradius] at hcoord
  nlinarith [hcoord]

end Problem97.MEC
