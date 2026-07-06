/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 27:100-109

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_27_0100_0109 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0100 : Poly :=
[
  term (11 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 27. -/
def ep_Q1_028_partial_27_0100 : Poly :=
[
  term (-22 : Rat) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (11 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term (-22 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (11 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem ep_Q1_028_partial_27_0100_valid :
    mulPoly ep_Q1_028_coefficient_27_0100
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0101 : Poly :=
[
  term (9 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 27. -/
def ep_Q1_028_partial_27_0101 : Poly :=
[
  term (-18 : Rat) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem ep_Q1_028_partial_27_0101_valid :
    mulPoly ep_Q1_028_coefficient_27_0101
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0102 : Poly :=
[
  term (2 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 102 for generator 27. -/
def ep_Q1_028_partial_27_0102 : Poly :=
[
  term (-4 : Rat) [(0, 1), (9, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem ep_Q1_028_partial_27_0102_valid :
    mulPoly ep_Q1_028_coefficient_27_0102
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0103 : Poly :=
[
  term (-3 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 27. -/
def ep_Q1_028_partial_27_0103 : Poly :=
[
  term (6 : Rat) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem ep_Q1_028_partial_27_0103_valid :
    mulPoly ep_Q1_028_coefficient_27_0103
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0104 : Poly :=
[
  term (-6 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 104 for generator 27. -/
def ep_Q1_028_partial_27_0104 : Poly :=
[
  term (12 : Rat) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem ep_Q1_028_partial_27_0104_valid :
    mulPoly ep_Q1_028_coefficient_27_0104
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0105 : Poly :=
[
  term (7 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 105 for generator 27. -/
def ep_Q1_028_partial_27_0105 : Poly :=
[
  term (-14 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term (7 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem ep_Q1_028_partial_27_0105_valid :
    mulPoly ep_Q1_028_coefficient_27_0105
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0106 : Poly :=
[
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 27. -/
def ep_Q1_028_partial_27_0106 : Poly :=
[
  term (-6 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem ep_Q1_028_partial_27_0106_valid :
    mulPoly ep_Q1_028_coefficient_27_0106
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0107 : Poly :=
[
  term (-6 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 107 for generator 27. -/
def ep_Q1_028_partial_27_0107 : Poly :=
[
  term (12 : Rat) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem ep_Q1_028_partial_27_0107_valid :
    mulPoly ep_Q1_028_coefficient_27_0107
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0108 : Poly :=
[
  term ((-11 : Rat) / 2) [(14, 1), (16, 1)]
]

/-- Partial product 108 for generator 27. -/
def ep_Q1_028_partial_27_0108 : Poly :=
[
  term (11 : Rat) [(0, 1), (14, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term (11 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem ep_Q1_028_partial_27_0108_valid :
    mulPoly ep_Q1_028_coefficient_27_0108
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def ep_Q1_028_coefficient_27_0109 : Poly :=
[
  term ((1 : Rat) / 4) [(16, 1)]
]

/-- Partial product 109 for generator 27. -/
def ep_Q1_028_partial_27_0109 : Poly :=
[
  term ((-1 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(0, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 4) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem ep_Q1_028_partial_27_0109_valid :
    mulPoly ep_Q1_028_coefficient_27_0109
        ep_Q1_028_generator_27_0100_0109 =
      ep_Q1_028_partial_27_0109 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_27_0100_0109 : List Poly :=
[
  ep_Q1_028_partial_27_0100,
  ep_Q1_028_partial_27_0101,
  ep_Q1_028_partial_27_0102,
  ep_Q1_028_partial_27_0103,
  ep_Q1_028_partial_27_0104,
  ep_Q1_028_partial_27_0105,
  ep_Q1_028_partial_27_0106,
  ep_Q1_028_partial_27_0107,
  ep_Q1_028_partial_27_0108,
  ep_Q1_028_partial_27_0109
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_27_0100_0109 : Poly :=
[
  term (-22 : Rat) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (9, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term (-14 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (11 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (11 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (-3 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (7 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (13, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(0, 2), (16, 1)],
  term (-22 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (-14 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term (11 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (11 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (9, 2), (16, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (7 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (13, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 4) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 109. -/
theorem ep_Q1_028_block_27_0100_0109_valid :
    checkProductSumEq ep_Q1_028_partials_27_0100_0109
      ep_Q1_028_block_27_0100_0109 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
