/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 16:100-110

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0100 : Poly :=
[
  term ((361 : Rat) / 186) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0100 : Poly :=
[
  term ((361 : Rat) / 93) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0100
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0101 : Poly :=
[
  term ((137 : Rat) / 93) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 101 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0101 : Poly :=
[
  term ((274 : Rat) / 93) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-137 : Rat) / 93) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0101
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0102 : Poly :=
[
  term ((131 : Rat) / 186) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0102 : Poly :=
[
  term ((131 : Rat) / 93) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131 : Rat) / 186) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0102
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0103 : Poly :=
[
  term ((-361 : Rat) / 372) [(10, 1), (16, 1)]
]

/-- Partial product 103 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0103 : Poly :=
[
  term ((-361 : Rat) / 186) [(6, 1), (10, 1), (16, 1)],
  term ((361 : Rat) / 372) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0103
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0104 : Poly :=
[
  term ((61 : Rat) / 31) [(10, 2), (16, 1)]
]

/-- Partial product 104 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0104 : Poly :=
[
  term ((122 : Rat) / 31) [(6, 1), (10, 2), (16, 1)],
  term ((-61 : Rat) / 31) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0104
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0105 : Poly :=
[
  term ((51 : Rat) / 31) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0105 : Poly :=
[
  term ((102 : Rat) / 31) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51 : Rat) / 31) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0105
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0106 : Poly :=
[
  term ((131 : Rat) / 372) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0106 : Poly :=
[
  term ((131 : Rat) / 186) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-131 : Rat) / 372) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0106
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0107 : Poly :=
[
  term ((371 : Rat) / 372) [(11, 2), (16, 1)]
]

/-- Partial product 107 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0107 : Poly :=
[
  term ((371 : Rat) / 186) [(6, 1), (11, 2), (16, 1)],
  term ((-371 : Rat) / 372) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0107
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0108 : Poly :=
[
  term ((-107 : Rat) / 124) [(12, 1), (16, 1)]
]

/-- Partial product 108 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0108 : Poly :=
[
  term ((-107 : Rat) / 62) [(6, 1), (12, 1), (16, 1)],
  term ((107 : Rat) / 124) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0108
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0109 : Poly :=
[
  term ((50 : Rat) / 93) [(12, 2), (16, 1)]
]

/-- Partial product 109 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0109 : Poly :=
[
  term ((100 : Rat) / 93) [(6, 1), (12, 2), (16, 1)],
  term ((-50 : Rat) / 93) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0109
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNNY_coefficient_16_0110 : Poly :=
[
  term ((-50 : Rat) / 93) [(13, 2), (16, 1)]
]

/-- Partial product 110 for generator 16. -/
def rs_R009_ueqv_R009NNNNY_partial_16_0110 : Poly :=
[
  term ((-100 : Rat) / 93) [(6, 1), (13, 2), (16, 1)],
  term ((50 : Rat) / 93) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem rs_R009_ueqv_R009NNNNY_partial_16_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_16_0110
        rs_R009_ueqv_R009NNNNY_generator_16_0100_0110 =
      rs_R009_ueqv_R009NNNNY_partial_16_0110 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_16_0100_0110 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_16_0100,
  rs_R009_ueqv_R009NNNNY_partial_16_0101,
  rs_R009_ueqv_R009NNNNY_partial_16_0102,
  rs_R009_ueqv_R009NNNNY_partial_16_0103,
  rs_R009_ueqv_R009NNNNY_partial_16_0104,
  rs_R009_ueqv_R009NNNNY_partial_16_0105,
  rs_R009_ueqv_R009NNNNY_partial_16_0106,
  rs_R009_ueqv_R009NNNNY_partial_16_0107,
  rs_R009_ueqv_R009NNNNY_partial_16_0108,
  rs_R009_ueqv_R009NNNNY_partial_16_0109,
  rs_R009_ueqv_R009NNNNY_partial_16_0110
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_16_0100_0110 : Poly :=
[
  term ((361 : Rat) / 93) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((274 : Rat) / 93) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((131 : Rat) / 93) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(6, 1), (10, 1), (16, 1)],
  term ((122 : Rat) / 31) [(6, 1), (10, 2), (16, 1)],
  term ((102 : Rat) / 31) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131 : Rat) / 186) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((371 : Rat) / 186) [(6, 1), (11, 2), (16, 1)],
  term ((-107 : Rat) / 62) [(6, 1), (12, 1), (16, 1)],
  term ((100 : Rat) / 93) [(6, 1), (12, 2), (16, 1)],
  term ((-100 : Rat) / 93) [(6, 1), (13, 2), (16, 1)],
  term ((-361 : Rat) / 186) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-137 : Rat) / 93) [(10, 1), (12, 1), (16, 1)],
  term ((-131 : Rat) / 186) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 372) [(10, 1), (16, 1)],
  term ((-61 : Rat) / 31) [(10, 2), (16, 1)],
  term ((-51 : Rat) / 31) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131 : Rat) / 372) [(11, 1), (13, 1), (16, 1)],
  term ((-371 : Rat) / 372) [(11, 2), (16, 1)],
  term ((107 : Rat) / 124) [(12, 1), (16, 1)],
  term ((-50 : Rat) / 93) [(12, 2), (16, 1)],
  term ((50 : Rat) / 93) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 110. -/
theorem rs_R009_ueqv_R009NNNNY_block_16_0100_0110_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_16_0100_0110
      rs_R009_ueqv_R009NNNNY_block_16_0100_0110 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
