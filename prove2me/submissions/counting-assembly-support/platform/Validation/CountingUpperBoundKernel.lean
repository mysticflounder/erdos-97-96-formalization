/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna
-/

import Solutions.Sol_Problem97_counterexample_card_ge_nine_of_iCount_upper_bound

/-! Kernel validation of the conditional counting reducer. -/

open scoped EuclideanGeometry
open Problem97

namespace CountingUpperBoundKernelValidation

theorem result
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hup : (iCount A : ℝ) ≤ ((11 : ℝ) * A.card ^ 2 - 18 * A.card) / 12) :
    9 ≤ A.card := by
  exact solution hne hconv hK4 hup

#print axioms result

end CountingUpperBoundKernelValidation
