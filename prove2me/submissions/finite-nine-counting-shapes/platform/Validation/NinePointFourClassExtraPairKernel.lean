/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Solutions.Sol_Problem97_fifty_five_le_iCount_of_card_nine_K4_of_four_class_and_extra_pair

/-! Kernel validation of the nine-point four-class plus extra-pair bound. -/

open scoped EuclideanGeometry
open Problem97

namespace NinePointFourClassExtraPairKernelValidation

theorem result
    {A : Finset ℝ²}
    (hcard : A.card = 9) (hK4 : HasNEquidistantProperty 4 A)
    {p u v : ℝ²} (hpA : p ∈ A) {T : Finset ℝ²}
    (hTcard : 4 ≤ T.card)
    (hTsub : T ⊆ A.erase p)
    (hTdist : ∃ r : ℝ, ∀ q ∈ T, dist p q = r)
    (hpair_sub : ({u, v} : Finset ℝ²) ⊆ A.erase p)
    (hpair_card : ({u, v} : Finset ℝ²).card = 2)
    (hpair_dist : ∃ r : ℝ, ∀ q ∈ ({u, v} : Finset ℝ²), dist p q = r)
    (hu_not_mem_T : u ∉ T) :
    55 ≤ iCount A := by
  exact solution hcard hK4 hpA hTcard hTsub hTdist hpair_sub hpair_card hpair_dist
    hu_not_mem_T

#print axioms result

end NinePointFourClassExtraPairKernelValidation
