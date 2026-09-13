/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_iCountAt_ge_choose_two_of_equidistant_subset

/-! Kernel validation of the equidistant-subset local-count lower bound. -/

open scoped EuclideanGeometry
open Problem97

namespace ChooseTwoEquidistantKernelValidation

theorem result
    (A : Finset ℝ²) (p : ℝ²) (S : Finset ℝ²)
    (hSsub : S ⊆ A.erase p)
    (hSdist : ∃ r : ℝ, ∀ q ∈ S, dist p q = r) :
    S.card.choose 2 ≤ iCountAt A p := by
  exact solution A p S hSsub hSdist

#print axioms result

end ChooseTwoEquidistantKernelValidation
