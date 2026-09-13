/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna
-/

import Definitions.Def_Erdos9796Counting_Foundation
import Definitions.Def_Erdos9796Counting_IsoscelesCount
import Theorems.Thm_Problem97_card_ge_five_of_K4
import Theorems.Thm_Problem97_counting_arithmetic

open scoped EuclideanGeometry
open Finset
open Problem97

/-!
# Conditional counting assembly for the nine-point lower bound

This theorem combines the `6 * A.card ≤ iCount A` lower bound with the
quadratic upper bound supplied as a hypothesis. The count convention follows
Dumitrescu's isosceles-count method; that attribution records the source of
the counting strategy and does not assert the upper bound here.
-/

-- PROVE2ME_FORMAL_STATEMENT
theorem Problem97.counterexample_card_ge_nine_of_iCount_upper_bound
    {A : Finset ℝ²} (hne : A.Nonempty) (_hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hup : (iCount A : ℝ) ≤ ((11 : ℝ) * A.card ^ 2 - 18 * A.card) / 12) :
    9 ≤ A.card := by
  sorry
