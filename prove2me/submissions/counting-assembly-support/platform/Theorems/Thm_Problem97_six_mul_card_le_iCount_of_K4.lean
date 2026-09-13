/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Definitions.Def_Erdos9796Counting_Foundation
import Definitions.Def_Erdos9796Counting_IsoscelesCount
import Theorems.Thm_Problem97_iCountAt_ge_six_of_K4

open scoped EuclideanGeometry
open Problem97

/-!
# Total isosceles count lower bound under the four-equidistant property

This is the Dumitrescu counting lower bound: four equidistant neighbors at
each vertex force six isosceles pairs at that vertex, and summing over the
vertices gives `6 * A.card ≤ iCount A`. The counting convention is the one
used by Dumitrescu (2006), with equilateral triangles counted three times.

The statement is rehosted from
`Erdos9796Proof.P97.IsoscelesCount` at source commit
`bd8528ea10a12da2c84a10cc5897e36681c2e75d`.
-/

-- PROVE2ME_FORMAL_STATEMENT
theorem Problem97.six_mul_card_le_iCount_of_K4 {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) : 6 * A.card ≤ iCount A := by sorry
