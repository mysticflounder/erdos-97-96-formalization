/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_six_mul_card_add_one_le_iCount_of_K4_of_iCountAt_ge_seven

/-! Kernel validation of the strict total isosceles-count lower bound. -/

open scoped EuclideanGeometry
open Problem97

namespace ExtraApexCountKernelValidation

theorem result {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    {p : ℝ²} (hpA : p ∈ A) (hpExtra : 7 ≤ iCountAt A p) :
    6 * A.card + 1 ≤ iCount A := by
  exact solution hK4 hpA hpExtra

#print axioms result

end ExtraApexCountKernelValidation
