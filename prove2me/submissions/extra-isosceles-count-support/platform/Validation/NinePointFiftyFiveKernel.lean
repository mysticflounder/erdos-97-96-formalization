/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven

/-! Kernel validation of the nine-point, one-excess-apex lower bound. -/

open scoped EuclideanGeometry
open Problem97

namespace NinePointFiftyFiveKernelValidation

theorem result {A : Finset ℝ²} (hcard : A.card = 9)
    (hK4 : HasNEquidistantProperty 4 A) {p : ℝ²} (hpA : p ∈ A)
    (hpExtra : 7 ≤ iCountAt A p) :
    55 ≤ iCount A := by
  exact solution hcard hK4 hpA hpExtra

#print axioms result

end NinePointFiftyFiveKernelValidation
