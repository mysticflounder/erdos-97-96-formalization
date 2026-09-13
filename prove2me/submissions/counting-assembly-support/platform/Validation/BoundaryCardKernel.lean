/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-/

import Solutions.Sol_Problem97_boundary_card_ge_three_of_K4

/-! Kernel validation of the minimum-enclosing-circle boundary interface. -/

open Problem97
open scoped EuclideanGeometry

namespace BoundaryCardKernelValidation

theorem result {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    3 ≤ (A.filter (fun p =>
      dist p (Problem97.MEC.mec A hne).center = (Problem97.MEC.mec A hne).radius)).card := by
  exact solution hne hconv hK4

#print axioms result

end BoundaryCardKernelValidation
