/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_six_mul_card_le_iCount_of_K4

/-! Kernel validation of the total six-times-cardinality lower bound. -/

open scoped EuclideanGeometry
open Problem97

namespace SixMulCardKernelValidation

theorem result {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) : 6 * A.card ≤ iCount A := by
  exact solution hK4

#print axioms result

end SixMulCardKernelValidation
