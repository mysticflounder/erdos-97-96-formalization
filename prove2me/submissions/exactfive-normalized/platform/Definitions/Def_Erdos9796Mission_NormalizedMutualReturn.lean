/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796Mission

/-!
# Coordinate points for the normalized mutual-return configuration

This definition is the coordinate constructor used by the affine chart in
`ExactFiveMutualReturnChord`.
-/

open scoped EuclideanGeometry

namespace Erdos9796Mission

/-- The point with coordinates `(x, y)` in the Euclidean plane. -/
noncomputable def planePoint (x y : ℝ) : Plane :=
  EuclideanSpace.single 0 x + EuclideanSpace.single 1 y

end Erdos9796Mission
