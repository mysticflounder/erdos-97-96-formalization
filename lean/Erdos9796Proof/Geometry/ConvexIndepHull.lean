/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.Geometry.FivePointCircleIsosceles
import FormalConjecturesForMathlib.Geometry.«2d»

/-!
# Convex-hull exclusions from convex independence

These helpers isolate the direct consequence of
`EuclideanGeometry.ConvexIndep`: a point of a convex-independent set cannot
belong to the convex hull of any subset of the remaining points.  The finite
specialization is convenient for explicit configurations such as triangles.
-/

open scoped EuclideanGeometry

namespace Erdos9796Proof.Geometry

/-- A point of a convex-independent set is excluded from the convex hull of
any set contained in the other points. -/
theorem convexIndep_not_mem_convexHull_of_subset_diff
    {A S : Set Plane} (hA : EuclideanGeometry.ConvexIndep A) {w : Plane}
    (hw : w ∈ A) (hS : S ⊆ A \ {w}) :
    w ∉ convexHull ℝ S := by
  intro hwS
  exact hA w hw (convexHull_mono hS hwS)

/-- Finite-set specialization of
`convexIndep_not_mem_convexHull_of_subset_diff`. -/
theorem convexIndep_not_mem_convexHull_of_finset_subset_diff
    {A : Set Plane} (hA : EuclideanGeometry.ConvexIndep A) {w : Plane}
    (hw : w ∈ A) {T : Finset Plane}
    (hT : (T : Set Plane) ⊆ A \ {w}) :
    w ∉ convexHull ℝ (T : Set Plane) :=
  convexIndep_not_mem_convexHull_of_subset_diff hA hw hT

end Erdos9796Proof.Geometry
