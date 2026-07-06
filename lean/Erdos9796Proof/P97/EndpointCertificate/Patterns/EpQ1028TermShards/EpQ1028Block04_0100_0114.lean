/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 4:100-114

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_04_0100_0114 : Poly :=
[
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0100 : Poly :=
[
  term ((-176 : Rat) / 3) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 4. -/
def ep_Q1_028_partial_04_0100 : Poly :=
[
  term ((-176 : Rat) / 3) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem ep_Q1_028_partial_04_0100_valid :
    mulPoly ep_Q1_028_coefficient_04_0100
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0101 : Poly :=
[
  term ((704 : Rat) / 3) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 101 for generator 4. -/
def ep_Q1_028_partial_04_0101 : Poly :=
[
  term ((704 : Rat) / 3) [(6, 2), (7, 2), (13, 2), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (10, 2), (13, 2), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (11, 2), (13, 2), (16, 1)],
  term ((704 : Rat) / 3) [(7, 4), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem ep_Q1_028_partial_04_0101_valid :
    mulPoly ep_Q1_028_coefficient_04_0101
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0102 : Poly :=
[
  term ((-176 : Rat) / 3) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 4. -/
def ep_Q1_028_partial_04_0102 : Poly :=
[
  term ((-176 : Rat) / 3) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem ep_Q1_028_partial_04_0102_valid :
    mulPoly ep_Q1_028_coefficient_04_0102
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0103 : Poly :=
[
  term ((32 : Rat) / 15) [(7, 2), (16, 1)]
]

/-- Partial product 103 for generator 4. -/
def ep_Q1_028_partial_04_0103 : Poly :=
[
  term ((32 : Rat) / 15) [(6, 2), (7, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 2), (10, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 2), (11, 2), (16, 1)],
  term ((32 : Rat) / 15) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem ep_Q1_028_partial_04_0103_valid :
    mulPoly ep_Q1_028_coefficient_04_0103
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0104 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 4. -/
def ep_Q1_028_partial_04_0104 : Poly :=
[
  term ((9 : Rat) / 2) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((9 : Rat) / 2) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem ep_Q1_028_partial_04_0104_valid :
    mulPoly ep_Q1_028_coefficient_04_0104
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0105 : Poly :=
[
  term (-13 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 4. -/
def ep_Q1_028_partial_04_0105 : Poly :=
[
  term (-13 : Rat) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term (-13 : Rat) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term (13 : Rat) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term (13 : Rat) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem ep_Q1_028_partial_04_0105_valid :
    mulPoly ep_Q1_028_coefficient_04_0105
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0106 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 4. -/
def ep_Q1_028_partial_04_0106 : Poly :=
[
  term ((9 : Rat) / 2) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem ep_Q1_028_partial_04_0106_valid :
    mulPoly ep_Q1_028_coefficient_04_0106
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0107 : Poly :=
[
  term (6 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 107 for generator 4. -/
def ep_Q1_028_partial_04_0107 : Poly :=
[
  term (6 : Rat) [(6, 2), (9, 2), (16, 1)],
  term (6 : Rat) [(7, 2), (9, 2), (16, 1)],
  term (-6 : Rat) [(9, 2), (10, 2), (16, 1)],
  term (-6 : Rat) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem ep_Q1_028_partial_04_0107_valid :
    mulPoly ep_Q1_028_coefficient_04_0107
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0108 : Poly :=
[
  term ((3 : Rat) / 2) [(10, 1), (16, 1)]
]

/-- Partial product 108 for generator 4. -/
def ep_Q1_028_partial_04_0108 : Poly :=
[
  term ((3 : Rat) / 2) [(6, 2), (10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 2), (10, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 1), (11, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem ep_Q1_028_partial_04_0108_valid :
    mulPoly ep_Q1_028_coefficient_04_0108
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0109 : Poly :=
[
  term (-12 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 4. -/
def ep_Q1_028_partial_04_0109 : Poly :=
[
  term (-12 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem ep_Q1_028_partial_04_0109_valid :
    mulPoly ep_Q1_028_coefficient_04_0109
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0110 : Poly :=
[
  term (6 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 4. -/
def ep_Q1_028_partial_04_0110 : Poly :=
[
  term (6 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem ep_Q1_028_partial_04_0110_valid :
    mulPoly ep_Q1_028_coefficient_04_0110
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0111 : Poly :=
[
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 4. -/
def ep_Q1_028_partial_04_0111 : Poly :=
[
  term (3 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem ep_Q1_028_partial_04_0111_valid :
    mulPoly ep_Q1_028_coefficient_04_0111
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0112 : Poly :=
[
  term (-12 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 112 for generator 4. -/
def ep_Q1_028_partial_04_0112 : Poly :=
[
  term (-12 : Rat) [(6, 2), (13, 2), (16, 1)],
  term (-12 : Rat) [(7, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(10, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem ep_Q1_028_partial_04_0112_valid :
    mulPoly ep_Q1_028_coefficient_04_0112
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0113 : Poly :=
[
  term (3 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 113 for generator 4. -/
def ep_Q1_028_partial_04_0113 : Poly :=
[
  term (3 : Rat) [(6, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(7, 2), (15, 2), (16, 1)],
  term (-3 : Rat) [(10, 2), (15, 2), (16, 1)],
  term (-3 : Rat) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem ep_Q1_028_partial_04_0113_valid :
    mulPoly ep_Q1_028_coefficient_04_0113
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def ep_Q1_028_coefficient_04_0114 : Poly :=
[
  term ((-13 : Rat) / 4) [(16, 1)]
]

/-- Partial product 114 for generator 4. -/
def ep_Q1_028_partial_04_0114 : Poly :=
[
  term ((-13 : Rat) / 4) [(6, 2), (16, 1)],
  term ((-13 : Rat) / 4) [(7, 2), (16, 1)],
  term ((13 : Rat) / 4) [(10, 2), (16, 1)],
  term ((13 : Rat) / 4) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem ep_Q1_028_partial_04_0114_valid :
    mulPoly ep_Q1_028_coefficient_04_0114
        ep_Q1_028_generator_04_0100_0114 =
      ep_Q1_028_partial_04_0114 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_04_0100_0114 : List Poly :=
[
  ep_Q1_028_partial_04_0100,
  ep_Q1_028_partial_04_0101,
  ep_Q1_028_partial_04_0102,
  ep_Q1_028_partial_04_0103,
  ep_Q1_028_partial_04_0104,
  ep_Q1_028_partial_04_0105,
  ep_Q1_028_partial_04_0106,
  ep_Q1_028_partial_04_0107,
  ep_Q1_028_partial_04_0108,
  ep_Q1_028_partial_04_0109,
  ep_Q1_028_partial_04_0110,
  ep_Q1_028_partial_04_0111,
  ep_Q1_028_partial_04_0112,
  ep_Q1_028_partial_04_0113,
  ep_Q1_028_partial_04_0114
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_04_0100_0114 : Poly :=
[
  term ((-176 : Rat) / 3) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 3) [(6, 2), (7, 2), (13, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 15) [(6, 2), (7, 2), (16, 1)],
  term ((9 : Rat) / 2) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term (-13 : Rat) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 2) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(6, 2), (9, 2), (16, 1)],
  term ((3 : Rat) / 2) [(6, 2), (10, 1), (16, 1)],
  term (-12 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 2), (13, 2), (16, 1)],
  term (3 : Rat) [(6, 2), (15, 2), (16, 1)],
  term ((-13 : Rat) / 4) [(6, 2), (16, 1)],
  term ((9 : Rat) / 2) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term (-13 : Rat) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 2) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 2), (9, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 2), (10, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (10, 2), (13, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 2), (10, 2), (16, 1)],
  term (-12 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (11, 2), (13, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 2), (11, 2), (16, 1)],
  term (3 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 2), (13, 2), (16, 1)],
  term (3 : Rat) [(7, 2), (15, 2), (16, 1)],
  term ((-13 : Rat) / 4) [(7, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 4), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 4), (13, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 4), (15, 2), (16, 1)],
  term ((32 : Rat) / 15) [(7, 4), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term (13 : Rat) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term (13 : Rat) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (11, 3), (16, 1)],
  term (-6 : Rat) [(9, 2), (10, 2), (16, 1)],
  term (-6 : Rat) [(9, 2), (11, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 1), (11, 2), (16, 1)],
  term (12 : Rat) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(10, 2), (13, 2), (16, 1)],
  term (-3 : Rat) [(10, 2), (15, 2), (16, 1)],
  term ((13 : Rat) / 4) [(10, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 3), (16, 1)],
  term (-3 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 2), (13, 2), (16, 1)],
  term (-3 : Rat) [(11, 2), (15, 2), (16, 1)],
  term ((13 : Rat) / 4) [(11, 2), (16, 1)],
  term (12 : Rat) [(11, 3), (13, 1), (16, 1)],
  term (-6 : Rat) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 114. -/
theorem ep_Q1_028_block_04_0100_0114_valid :
    checkProductSumEq ep_Q1_028_partials_04_0100_0114
      ep_Q1_028_block_04_0100_0114 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
