/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_iCountAt_ge_ten_of_five_equidistant

/-! Kernel validation of the five-equidistant-neighbor local-count lower bound. -/

open scoped EuclideanGeometry
open Problem97

namespace FiveEquidistantLocalCountKernelValidation

theorem result
    (A : Finset ℝ²) (p : ℝ²) (S : Finset ℝ²)
    (hScard : 5 ≤ S.card)
    (hSsub : S ⊆ A.erase p)
    (hSdist : ∃ r : ℝ, ∀ q ∈ S, dist p q = r) :
    10 ≤ iCountAt A p := by
  exact solution A p S hScard hSsub hSdist

#print axioms result

end FiveEquidistantLocalCountKernelValidation
