/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 4:100-116

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_04_0100_0116 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0100 : Poly :=
[
  term ((-16432 : Rat) / 25) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 100 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0100 : Poly :=
[
  term ((32864 : Rat) / 25) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-16432 : Rat) / 25) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-16432 : Rat) / 25) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-32864 : Rat) / 25) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((16432 : Rat) / 25) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((16432 : Rat) / 25) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0100_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0100
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0101 : Poly :=
[
  term ((-896 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0101 : Poly :=
[
  term ((1792 : Rat) / 25) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0101_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0101
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0102 : Poly :=
[
  term ((-12108 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0102 : Poly :=
[
  term ((24216 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12108 : Rat) / 25) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12108 : Rat) / 25) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24216 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12108 : Rat) / 25) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((12108 : Rat) / 25) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0102_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0102
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0103 : Poly :=
[
  term ((-12072 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0103 : Poly :=
[
  term ((24144 : Rat) / 25) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12072 : Rat) / 25) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-12072 : Rat) / 25) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-24144 : Rat) / 25) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((12072 : Rat) / 25) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((12072 : Rat) / 25) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0103_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0103
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0104 : Poly :=
[
  term ((-2176 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0104 : Poly :=
[
  term ((4352 : Rat) / 25) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2176 : Rat) / 25) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2176 : Rat) / 25) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4352 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2176 : Rat) / 25) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2176 : Rat) / 25) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0104_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0104
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0105 : Poly :=
[
  term ((-33124 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0105 : Poly :=
[
  term ((66248 : Rat) / 25) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33124 : Rat) / 25) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33124 : Rat) / 25) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66248 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33124 : Rat) / 25) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((33124 : Rat) / 25) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0105_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0105
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0106 : Poly :=
[
  term ((46362 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0106 : Poly :=
[
  term ((-92724 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((46362 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((46362 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((92724 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46362 : Rat) / 25) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46362 : Rat) / 25) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0106_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0106
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0107 : Poly :=
[
  term ((-93112 : Rat) / 75) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 107 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0107 : Poly :=
[
  term ((186224 : Rat) / 75) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-93112 : Rat) / 75) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-93112 : Rat) / 75) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-186224 : Rat) / 75) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((93112 : Rat) / 75) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((93112 : Rat) / 75) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0107_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0107
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0108 : Poly :=
[
  term ((1792 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0108 : Poly :=
[
  term ((-3584 : Rat) / 25) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0108_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0108
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0109 : Poly :=
[
  term ((15004 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0109 : Poly :=
[
  term ((-30008 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15004 : Rat) / 25) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15004 : Rat) / 25) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((30008 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15004 : Rat) / 25) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15004 : Rat) / 25) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0109_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0109
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0110 : Poly :=
[
  term ((6168 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0110 : Poly :=
[
  term ((-12336 : Rat) / 25) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6168 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((6168 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((12336 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6168 : Rat) / 25) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6168 : Rat) / 25) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0110_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0110
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0111 : Poly :=
[
  term ((-71116 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 111 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0111 : Poly :=
[
  term ((142232 : Rat) / 25) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-71116 : Rat) / 25) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-71116 : Rat) / 25) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-142232 : Rat) / 25) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((71116 : Rat) / 25) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((71116 : Rat) / 25) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0111_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0111
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0112 : Poly :=
[
  term ((259466 : Rat) / 75) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0112 : Poly :=
[
  term ((-518932 : Rat) / 75) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((259466 : Rat) / 75) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((259466 : Rat) / 75) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((518932 : Rat) / 75) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-259466 : Rat) / 75) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-259466 : Rat) / 75) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0112_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0112
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0113 : Poly :=
[
  term (-1 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 113 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0113 : Poly :=
[
  term (2 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(7, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(12, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0113_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0113
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0114 : Poly :=
[
  term (-12 : Rat) [(14, 2), (16, 1)]
]

/-- Partial product 114 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0114 : Poly :=
[
  term (24 : Rat) [(6, 1), (14, 2), (16, 1)],
  term (-12 : Rat) [(6, 2), (14, 2), (16, 1)],
  term (-12 : Rat) [(7, 2), (14, 2), (16, 1)],
  term (-24 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (12 : Rat) [(12, 2), (14, 2), (16, 1)],
  term (12 : Rat) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0114_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0114
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0115 : Poly :=
[
  term ((-28616 : Rat) / 75) [(15, 2), (16, 1)]
]

/-- Partial product 115 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0115 : Poly :=
[
  term ((57232 : Rat) / 75) [(6, 1), (15, 2), (16, 1)],
  term ((-28616 : Rat) / 75) [(6, 2), (15, 2), (16, 1)],
  term ((-28616 : Rat) / 75) [(7, 2), (15, 2), (16, 1)],
  term ((-57232 : Rat) / 75) [(12, 1), (15, 2), (16, 1)],
  term ((28616 : Rat) / 75) [(12, 2), (15, 2), (16, 1)],
  term ((28616 : Rat) / 75) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0115_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0115
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YY_coefficient_04_0116 : Poly :=
[
  term ((104 : Rat) / 25) [(15, 4), (16, 1)]
]

/-- Partial product 116 for generator 4. -/
def rs_R010_ueqv_R010YY_partial_04_0116 : Poly :=
[
  term ((-208 : Rat) / 25) [(6, 1), (15, 4), (16, 1)],
  term ((104 : Rat) / 25) [(6, 2), (15, 4), (16, 1)],
  term ((104 : Rat) / 25) [(7, 2), (15, 4), (16, 1)],
  term ((208 : Rat) / 25) [(12, 1), (15, 4), (16, 1)],
  term ((-104 : Rat) / 25) [(12, 2), (15, 4), (16, 1)],
  term ((-104 : Rat) / 25) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 4. -/
theorem rs_R010_ueqv_R010YY_partial_04_0116_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_04_0116
        rs_R010_ueqv_R010YY_generator_04_0100_0116 =
      rs_R010_ueqv_R010YY_partial_04_0116 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_04_0100_0116 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_04_0100,
  rs_R010_ueqv_R010YY_partial_04_0101,
  rs_R010_ueqv_R010YY_partial_04_0102,
  rs_R010_ueqv_R010YY_partial_04_0103,
  rs_R010_ueqv_R010YY_partial_04_0104,
  rs_R010_ueqv_R010YY_partial_04_0105,
  rs_R010_ueqv_R010YY_partial_04_0106,
  rs_R010_ueqv_R010YY_partial_04_0107,
  rs_R010_ueqv_R010YY_partial_04_0108,
  rs_R010_ueqv_R010YY_partial_04_0109,
  rs_R010_ueqv_R010YY_partial_04_0110,
  rs_R010_ueqv_R010YY_partial_04_0111,
  rs_R010_ueqv_R010YY_partial_04_0112,
  rs_R010_ueqv_R010YY_partial_04_0113,
  rs_R010_ueqv_R010YY_partial_04_0114,
  rs_R010_ueqv_R010YY_partial_04_0115,
  rs_R010_ueqv_R010YY_partial_04_0116
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_04_0100_0116 : Poly :=
[
  term ((32864 : Rat) / 25) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((24216 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((24144 : Rat) / 25) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((4352 : Rat) / 25) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((66248 : Rat) / 25) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92724 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((186224 : Rat) / 75) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3584 : Rat) / 25) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-30008 : Rat) / 25) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12336 : Rat) / 25) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((142232 : Rat) / 25) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-518932 : Rat) / 75) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (14, 2), (16, 1)],
  term ((57232 : Rat) / 75) [(6, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 25) [(6, 1), (15, 4), (16, 1)],
  term ((-16432 : Rat) / 25) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-896 : Rat) / 25) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12108 : Rat) / 25) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12072 : Rat) / 25) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2176 : Rat) / 25) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33124 : Rat) / 25) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((46362 : Rat) / 25) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-93112 : Rat) / 75) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((15004 : Rat) / 25) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6168 : Rat) / 25) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-71116 : Rat) / 25) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((259466 : Rat) / 75) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(6, 2), (14, 1), (16, 1)],
  term (-12 : Rat) [(6, 2), (14, 2), (16, 1)],
  term ((-28616 : Rat) / 75) [(6, 2), (15, 2), (16, 1)],
  term ((104 : Rat) / 25) [(6, 2), (15, 4), (16, 1)],
  term ((-16432 : Rat) / 25) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-896 : Rat) / 25) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12108 : Rat) / 25) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12072 : Rat) / 25) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2176 : Rat) / 25) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33124 : Rat) / 25) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((46362 : Rat) / 25) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-93112 : Rat) / 75) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((1792 : Rat) / 25) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((15004 : Rat) / 25) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6168 : Rat) / 25) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-71116 : Rat) / 25) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((259466 : Rat) / 75) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(7, 2), (14, 1), (16, 1)],
  term (-12 : Rat) [(7, 2), (14, 2), (16, 1)],
  term ((-28616 : Rat) / 75) [(7, 2), (15, 2), (16, 1)],
  term ((104 : Rat) / 25) [(7, 2), (15, 4), (16, 1)],
  term ((-32864 : Rat) / 25) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((16432 : Rat) / 25) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((16432 : Rat) / 25) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1792 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24216 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24144 : Rat) / 25) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((12108 : Rat) / 25) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((12072 : Rat) / 25) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((12072 : Rat) / 25) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((12108 : Rat) / 25) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4352 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-66248 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((92724 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-186224 : Rat) / 75) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((2176 : Rat) / 25) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((33124 : Rat) / 25) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46362 : Rat) / 25) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((93112 : Rat) / 75) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((33124 : Rat) / 25) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46362 : Rat) / 25) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((93112 : Rat) / 75) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((2176 : Rat) / 25) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((30008 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12336 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142232 : Rat) / 25) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((518932 : Rat) / 75) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(12, 1), (14, 2), (16, 1)],
  term ((-57232 : Rat) / 75) [(12, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 25) [(12, 1), (15, 4), (16, 1)],
  term ((-15004 : Rat) / 25) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6168 : Rat) / 25) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((71116 : Rat) / 25) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-259466 : Rat) / 75) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(12, 2), (14, 1), (16, 1)],
  term (12 : Rat) [(12, 2), (14, 2), (16, 1)],
  term ((28616 : Rat) / 75) [(12, 2), (15, 2), (16, 1)],
  term ((-104 : Rat) / 25) [(12, 2), (15, 4), (16, 1)],
  term ((-259466 : Rat) / 75) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (12 : Rat) [(13, 2), (14, 2), (16, 1)],
  term ((28616 : Rat) / 75) [(13, 2), (15, 2), (16, 1)],
  term ((-104 : Rat) / 25) [(13, 2), (15, 4), (16, 1)],
  term ((-15004 : Rat) / 25) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-6168 : Rat) / 25) [(13, 3), (15, 1), (16, 1)],
  term ((71116 : Rat) / 25) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 116. -/
theorem rs_R010_ueqv_R010YY_block_04_0100_0116_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_04_0100_0116
      rs_R010_ueqv_R010YY_block_04_0100_0116 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
