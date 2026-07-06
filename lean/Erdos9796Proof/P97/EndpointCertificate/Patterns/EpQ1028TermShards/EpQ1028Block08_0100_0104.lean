/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 8:100-104

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 8 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_08_0100_0104 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 8. -/
def ep_Q1_028_coefficient_08_0100 : Poly :=
[
  term (-7 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 100 for generator 8. -/
def ep_Q1_028_partial_08_0100 : Poly :=
[
  term (14 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (-7 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-7 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-14 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (7 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (7 : Rat) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 8. -/
theorem ep_Q1_028_partial_08_0100_valid :
    mulPoly ep_Q1_028_coefficient_08_0100
        ep_Q1_028_generator_08_0100_0104 =
      ep_Q1_028_partial_08_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 8. -/
def ep_Q1_028_coefficient_08_0101 : Poly :=
[
  term (-1 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 8. -/
def ep_Q1_028_partial_08_0101 : Poly :=
[
  term (2 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 8. -/
theorem ep_Q1_028_partial_08_0101_valid :
    mulPoly ep_Q1_028_coefficient_08_0101
        ep_Q1_028_generator_08_0100_0104 =
      ep_Q1_028_partial_08_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 8. -/
def ep_Q1_028_coefficient_08_0102 : Poly :=
[
  term (6 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 102 for generator 8. -/
def ep_Q1_028_partial_08_0102 : Poly :=
[
  term (-12 : Rat) [(0, 1), (13, 2), (16, 1)],
  term (6 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (6 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (12 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (-6 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 8. -/
theorem ep_Q1_028_partial_08_0102_valid :
    mulPoly ep_Q1_028_coefficient_08_0102
        ep_Q1_028_generator_08_0100_0104 =
      ep_Q1_028_partial_08_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 8. -/
def ep_Q1_028_coefficient_08_0103 : Poly :=
[
  term ((-13 : Rat) / 2) [(14, 1), (16, 1)]
]

/-- Partial product 103 for generator 8. -/
def ep_Q1_028_partial_08_0103 : Poly :=
[
  term (13 : Rat) [(0, 1), (14, 1), (16, 1)],
  term ((-13 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term ((-13 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term ((13 : Rat) / 2) [(14, 1), (15, 2), (16, 1)],
  term (-13 : Rat) [(14, 2), (16, 1)],
  term ((13 : Rat) / 2) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 8. -/
theorem ep_Q1_028_partial_08_0103_valid :
    mulPoly ep_Q1_028_coefficient_08_0103
        ep_Q1_028_generator_08_0100_0104 =
      ep_Q1_028_partial_08_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 8. -/
def ep_Q1_028_coefficient_08_0104 : Poly :=
[
  term ((19 : Rat) / 4) [(16, 1)]
]

/-- Partial product 104 for generator 8. -/
def ep_Q1_028_partial_08_0104 : Poly :=
[
  term ((-19 : Rat) / 2) [(0, 1), (16, 1)],
  term ((19 : Rat) / 4) [(0, 2), (16, 1)],
  term ((19 : Rat) / 4) [(1, 2), (16, 1)],
  term ((19 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(14, 2), (16, 1)],
  term ((-19 : Rat) / 4) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 8. -/
theorem ep_Q1_028_partial_08_0104_valid :
    mulPoly ep_Q1_028_coefficient_08_0104
        ep_Q1_028_generator_08_0100_0104 =
      ep_Q1_028_partial_08_0104 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_08_0100_0104 : List Poly :=
[
  ep_Q1_028_partial_08_0100,
  ep_Q1_028_partial_08_0101,
  ep_Q1_028_partial_08_0102,
  ep_Q1_028_partial_08_0103,
  ep_Q1_028_partial_08_0104
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_08_0100_0104 : Poly :=
[
  term (14 : Rat) [(0, 1), (12, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (13, 2), (16, 1)],
  term (13 : Rat) [(0, 1), (14, 1), (16, 1)],
  term ((-19 : Rat) / 2) [(0, 1), (16, 1)],
  term (-7 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (13, 2), (16, 1)],
  term ((-13 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term ((19 : Rat) / 4) [(0, 2), (16, 1)],
  term (-7 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (13, 2), (16, 1)],
  term ((-13 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term ((19 : Rat) / 4) [(1, 2), (16, 1)],
  term (-14 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (7 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (7 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (-6 : Rat) [(13, 2), (15, 2), (16, 1)],
  term ((13 : Rat) / 2) [(14, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-71 : Rat) / 4) [(14, 2), (16, 1)],
  term ((13 : Rat) / 2) [(14, 3), (16, 1)],
  term ((-19 : Rat) / 4) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 100 through 104. -/
theorem ep_Q1_028_block_08_0100_0104_valid :
    checkProductSumEq ep_Q1_028_partials_08_0100_0104
      ep_Q1_028_block_08_0100_0104 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
