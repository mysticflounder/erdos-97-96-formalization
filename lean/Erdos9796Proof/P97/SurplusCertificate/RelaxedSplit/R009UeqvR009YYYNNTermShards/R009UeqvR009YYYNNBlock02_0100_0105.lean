/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 2:100-105

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_02_0100_0105 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YYYNN_coefficient_02_0100 : Poly :=
[
  term ((15810300 : Rat) / 3048283) [(14, 1), (15, 2)]
]

/-- Partial product 100 for generator 2. -/
def rs_R009_ueqv_R009YYYNN_partial_02_0100 : Poly :=
[
  term ((15810300 : Rat) / 3048283) [(0, 2), (14, 1), (15, 2)],
  term ((15810300 : Rat) / 3048283) [(1, 2), (14, 1), (15, 2)],
  term ((-15810300 : Rat) / 3048283) [(10, 2), (14, 1), (15, 2)],
  term ((-15810300 : Rat) / 3048283) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem rs_R009_ueqv_R009YYYNN_partial_02_0100_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_02_0100
        rs_R009_ueqv_R009YYYNN_generator_02_0100_0105 =
      rs_R009_ueqv_R009YYYNN_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YYYNN_coefficient_02_0101 : Poly :=
[
  term ((24974919 : Rat) / 12193132) [(14, 2)]
]

/-- Partial product 101 for generator 2. -/
def rs_R009_ueqv_R009YYYNN_partial_02_0101 : Poly :=
[
  term ((24974919 : Rat) / 12193132) [(0, 2), (14, 2)],
  term ((24974919 : Rat) / 12193132) [(1, 2), (14, 2)],
  term ((-24974919 : Rat) / 12193132) [(10, 2), (14, 2)],
  term ((-24974919 : Rat) / 12193132) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem rs_R009_ueqv_R009YYYNN_partial_02_0101_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_02_0101
        rs_R009_ueqv_R009YYYNN_generator_02_0100_0105 =
      rs_R009_ueqv_R009YYYNN_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YYYNN_coefficient_02_0102 : Poly :=
[
  term ((40718556 : Rat) / 3048283) [(14, 2), (15, 2)]
]

/-- Partial product 102 for generator 2. -/
def rs_R009_ueqv_R009YYYNN_partial_02_0102 : Poly :=
[
  term ((40718556 : Rat) / 3048283) [(0, 2), (14, 2), (15, 2)],
  term ((40718556 : Rat) / 3048283) [(1, 2), (14, 2), (15, 2)],
  term ((-40718556 : Rat) / 3048283) [(10, 2), (14, 2), (15, 2)],
  term ((-40718556 : Rat) / 3048283) [(11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem rs_R009_ueqv_R009YYYNN_partial_02_0102_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_02_0102
        rs_R009_ueqv_R009YYYNN_generator_02_0100_0105 =
      rs_R009_ueqv_R009YYYNN_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YYYNN_coefficient_02_0103 : Poly :=
[
  term ((-246367479 : Rat) / 85351924) [(15, 2)]
]

/-- Partial product 103 for generator 2. -/
def rs_R009_ueqv_R009YYYNN_partial_02_0103 : Poly :=
[
  term ((-246367479 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((-246367479 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((246367479 : Rat) / 85351924) [(10, 2), (15, 2)],
  term ((246367479 : Rat) / 85351924) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem rs_R009_ueqv_R009YYYNN_partial_02_0103_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_02_0103
        rs_R009_ueqv_R009YYYNN_generator_02_0100_0105 =
      rs_R009_ueqv_R009YYYNN_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YYYNN_coefficient_02_0104 : Poly :=
[
  term ((-142964775 : Rat) / 85351924) [(15, 2), (16, 1)]
]

/-- Partial product 104 for generator 2. -/
def rs_R009_ueqv_R009YYYNN_partial_02_0104 : Poly :=
[
  term ((-142964775 : Rat) / 85351924) [(0, 2), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(1, 2), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(10, 2), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem rs_R009_ueqv_R009YYYNN_partial_02_0104_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_02_0104
        rs_R009_ueqv_R009YYYNN_generator_02_0100_0105 =
      rs_R009_ueqv_R009YYYNN_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YYYNN_coefficient_02_0105 : Poly :=
[
  term ((40718556 : Rat) / 3048283) [(15, 4)]
]

/-- Partial product 105 for generator 2. -/
def rs_R009_ueqv_R009YYYNN_partial_02_0105 : Poly :=
[
  term ((40718556 : Rat) / 3048283) [(0, 2), (15, 4)],
  term ((40718556 : Rat) / 3048283) [(1, 2), (15, 4)],
  term ((-40718556 : Rat) / 3048283) [(10, 2), (15, 4)],
  term ((-40718556 : Rat) / 3048283) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem rs_R009_ueqv_R009YYYNN_partial_02_0105_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_02_0105
        rs_R009_ueqv_R009YYYNN_generator_02_0100_0105 =
      rs_R009_ueqv_R009YYYNN_partial_02_0105 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_02_0100_0105 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_02_0100,
  rs_R009_ueqv_R009YYYNN_partial_02_0101,
  rs_R009_ueqv_R009YYYNN_partial_02_0102,
  rs_R009_ueqv_R009YYYNN_partial_02_0103,
  rs_R009_ueqv_R009YYYNN_partial_02_0104,
  rs_R009_ueqv_R009YYYNN_partial_02_0105
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_02_0100_0105 : Poly :=
[
  term ((15810300 : Rat) / 3048283) [(0, 2), (14, 1), (15, 2)],
  term ((24974919 : Rat) / 12193132) [(0, 2), (14, 2)],
  term ((40718556 : Rat) / 3048283) [(0, 2), (14, 2), (15, 2)],
  term ((-246367479 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((-142964775 : Rat) / 85351924) [(0, 2), (15, 2), (16, 1)],
  term ((40718556 : Rat) / 3048283) [(0, 2), (15, 4)],
  term ((15810300 : Rat) / 3048283) [(1, 2), (14, 1), (15, 2)],
  term ((24974919 : Rat) / 12193132) [(1, 2), (14, 2)],
  term ((40718556 : Rat) / 3048283) [(1, 2), (14, 2), (15, 2)],
  term ((-246367479 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((-142964775 : Rat) / 85351924) [(1, 2), (15, 2), (16, 1)],
  term ((40718556 : Rat) / 3048283) [(1, 2), (15, 4)],
  term ((-15810300 : Rat) / 3048283) [(10, 2), (14, 1), (15, 2)],
  term ((-24974919 : Rat) / 12193132) [(10, 2), (14, 2)],
  term ((-40718556 : Rat) / 3048283) [(10, 2), (14, 2), (15, 2)],
  term ((246367479 : Rat) / 85351924) [(10, 2), (15, 2)],
  term ((142964775 : Rat) / 85351924) [(10, 2), (15, 2), (16, 1)],
  term ((-40718556 : Rat) / 3048283) [(10, 2), (15, 4)],
  term ((-15810300 : Rat) / 3048283) [(11, 2), (14, 1), (15, 2)],
  term ((-24974919 : Rat) / 12193132) [(11, 2), (14, 2)],
  term ((-40718556 : Rat) / 3048283) [(11, 2), (14, 2), (15, 2)],
  term ((246367479 : Rat) / 85351924) [(11, 2), (15, 2)],
  term ((142964775 : Rat) / 85351924) [(11, 2), (15, 2), (16, 1)],
  term ((-40718556 : Rat) / 3048283) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 105. -/
theorem rs_R009_ueqv_R009YYYNN_block_02_0100_0105_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_02_0100_0105
      rs_R009_ueqv_R009YYYNN_block_02_0100_0105 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
