/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-/

import Solutions.Sol_Problem97_not_collinear_of_K4

/-! Kernel validation of the four-witness non-collinearity interface. -/

open Problem97
open scoped EuclideanGeometry

namespace NotCollinearKernelValidation

theorem result {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    ¬ Collinear ℝ (A : Set ℝ²) := by
  exact solution hne hconv hK4

#print axioms result

end NotCollinearKernelValidation
