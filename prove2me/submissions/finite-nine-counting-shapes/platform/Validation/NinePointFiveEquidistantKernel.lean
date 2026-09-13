/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_fifty_five_le_iCount_of_card_nine_K4_of_five_equidistant

/-! Kernel validation of the nine-point five-equidistant-shape lower bound. -/

open scoped EuclideanGeometry
open Problem97

namespace NinePointFiveEquidistantKernelValidation

theorem result {A : Finset ℝ²}
    (hcard : A.card = 9) (hK4 : HasNEquidistantProperty 4 A)
    {p : ℝ²} (hpA : p ∈ A) {S : Finset ℝ²}
    (hScard : 5 ≤ S.card)
    (hSsub : S ⊆ A.erase p)
    (hSdist : ∃ r : ℝ, ∀ q ∈ S, dist p q = r) :
    55 ≤ iCount A := by
  exact solution hcard hK4 hpA hScard hSsub hSdist

#print axioms result

end NinePointFiveEquidistantKernelValidation
