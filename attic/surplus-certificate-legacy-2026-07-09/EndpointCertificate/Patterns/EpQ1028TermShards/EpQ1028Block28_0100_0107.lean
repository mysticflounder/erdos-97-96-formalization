/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 28:100-107

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_28_0100_0107 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0100 : Poly :=
[
  term (-2 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 100 for generator 28. -/
def ep_Q1_028_partial_28_0100 : Poly :=
[
  term (4 : Rat) [(0, 1), (9, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (9, 2), (16, 1)],
  term (-4 : Rat) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(2, 2), (9, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem ep_Q1_028_partial_28_0100_valid :
    mulPoly ep_Q1_028_coefficient_28_0100
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0101 : Poly :=
[
  term (3 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 28. -/
def ep_Q1_028_partial_28_0101 : Poly :=
[
  term (-6 : Rat) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem ep_Q1_028_partial_28_0101_valid :
    mulPoly ep_Q1_028_coefficient_28_0101
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0102 : Poly :=
[
  term (6 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 102 for generator 28. -/
def ep_Q1_028_partial_28_0102 : Poly :=
[
  term (-12 : Rat) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (12 : Rat) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (11, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem ep_Q1_028_partial_28_0102_valid :
    mulPoly ep_Q1_028_coefficient_28_0102
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0103 : Poly :=
[
  term (-7 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 103 for generator 28. -/
def ep_Q1_028_partial_28_0103 : Poly :=
[
  term (14 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term (-7 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (14 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-14 : Rat) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term (7 : Rat) [(2, 2), (12, 1), (16, 1)],
  term (-14 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem ep_Q1_028_partial_28_0103_valid :
    mulPoly ep_Q1_028_coefficient_28_0103
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0104 : Poly :=
[
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 28. -/
def ep_Q1_028_partial_28_0104 : Poly :=
[
  term (6 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem ep_Q1_028_partial_28_0104_valid :
    mulPoly ep_Q1_028_coefficient_28_0104
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0105 : Poly :=
[
  term (6 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 105 for generator 28. -/
def ep_Q1_028_partial_28_0105 : Poly :=
[
  term (-12 : Rat) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem ep_Q1_028_partial_28_0105_valid :
    mulPoly ep_Q1_028_coefficient_28_0105
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0106 : Poly :=
[
  term ((11 : Rat) / 2) [(14, 1), (16, 1)]
]

/-- Partial product 106 for generator 28. -/
def ep_Q1_028_partial_28_0106 : Poly :=
[
  term (-11 : Rat) [(0, 1), (14, 2), (16, 1)],
  term ((11 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term (-11 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term (11 : Rat) [(2, 1), (14, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(2, 2), (14, 1), (16, 1)],
  term (11 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem ep_Q1_028_partial_28_0106_valid :
    mulPoly ep_Q1_028_coefficient_28_0106
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def ep_Q1_028_coefficient_28_0107 : Poly :=
[
  term ((3 : Rat) / 4) [(16, 1)]
]

/-- Partial product 107 for generator 28. -/
def ep_Q1_028_partial_28_0107 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(1, 2), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(2, 2), (16, 1)],
  term ((3 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem ep_Q1_028_partial_28_0107_valid :
    mulPoly ep_Q1_028_coefficient_28_0107
        ep_Q1_028_generator_28_0100_0107 =
      ep_Q1_028_partial_28_0107 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_28_0100_0107 : List Poly :=
[
  ep_Q1_028_partial_28_0100,
  ep_Q1_028_partial_28_0101,
  ep_Q1_028_partial_28_0102,
  ep_Q1_028_partial_28_0103,
  ep_Q1_028_partial_28_0104,
  ep_Q1_028_partial_28_0105,
  ep_Q1_028_partial_28_0106,
  ep_Q1_028_partial_28_0107
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_28_0100_0107 : Poly :=
[
  term (4 : Rat) [(0, 1), (9, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term (14 : Rat) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (14, 1), (16, 1)],
  term (-11 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (3 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (-7 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (13, 2), (16, 1)],
  term ((11 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (14 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term (-11 : Rat) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (9, 2), (16, 1)],
  term (3 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (-7 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (13, 2), (16, 1)],
  term ((11 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(1, 2), (16, 1)],
  term (-4 : Rat) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term (-14 : Rat) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (14, 1), (16, 1)],
  term (11 : Rat) [(2, 1), (14, 2), (16, 1)],
  term (2 : Rat) [(2, 2), (9, 2), (16, 1)],
  term (-3 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (11, 2), (16, 1)],
  term (7 : Rat) [(2, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (13, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(2, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(2, 2), (16, 1)],
  term (-4 : Rat) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term (-14 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (11 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(3, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 2), (9, 2), (16, 1)],
  term (-3 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (11, 2), (16, 1)],
  term (7 : Rat) [(3, 2), (12, 1), (16, 1)],
  term (3 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (13, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(3, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 107. -/
theorem ep_Q1_028_block_28_0100_0107_valid :
    checkProductSumEq ep_Q1_028_partials_28_0100_0107
      ep_Q1_028_block_28_0100_0107 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
