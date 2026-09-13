/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Definitions.Def_Erdos9796Counting_Foundation
import Definitions.Def_Erdos9796Counting_IsoscelesCount

open scoped EuclideanGeometry
open Problem97

/-!
# Nine-point total isosceles count lower bound from one excess apex

In a nine-point configuration with four equidistant neighbors at every
vertex, one vertex contributing at least seven isosceles pairs forces the
total isosceles count to be at least `55`.

The statement is rehosted from
`Erdos9796Proof.P97.IsoscelesCount` at source commit
`bd8528ea10a12da2c84a10cc5897e36681c2e75d`.

The counting method is attributed to Dumitrescu (2006); the Lean
formalization is by Adam McKenna.
-/

-- PROVE2ME_FORMAL_STATEMENT
theorem Problem97.fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven
    {A : Finset ℝ²} (hcard : A.card = 9) (hK4 : HasNEquidistantProperty 4 A)
    {p : ℝ²} (hpA : p ∈ A) (hpExtra : 7 ≤ iCountAt A p) :
    55 ≤ iCount A := by sorry
