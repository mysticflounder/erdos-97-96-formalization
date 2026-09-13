/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_iCountAt_ge_seven_of_four_class_and_extra_pair

/-! Kernel validation of the four-class plus extra-pair local count. -/

open scoped EuclideanGeometry
open Problem97

namespace FourClassExtraPairLocalCountKernelValidation

theorem result
    (A : Finset ℝ²) (p : ℝ²) (T : Finset ℝ²) (u v : ℝ²)
    (hTcard : 4 ≤ T.card)
    (hTsub : T ⊆ A.erase p)
    (hTdist : ∃ r : ℝ, ∀ q ∈ T, dist p q = r)
    (hpair_sub : ({u, v} : Finset ℝ²) ⊆ A.erase p)
    (hpair_card : ({u, v} : Finset ℝ²).card = 2)
    (hpair_dist : ∃ r : ℝ, ∀ q ∈ ({u, v} : Finset ℝ²), dist p q = r)
    (hu_not_mem_T : u ∉ T) :
    7 ≤ iCountAt A p := by
  exact solution A p T u v hTcard hTsub hTdist hpair_sub hpair_card hpair_dist
    hu_not_mem_T

#print axioms result

end FourClassExtraPairLocalCountKernelValidation
