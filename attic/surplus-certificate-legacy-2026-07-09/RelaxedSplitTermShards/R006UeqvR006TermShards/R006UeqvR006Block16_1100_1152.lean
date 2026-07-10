/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 16:1100-1152

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_16_1100_1152 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1100 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1100 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1100 : Poly :=
[
  term ((-288 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1100_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1100
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1101 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 1101 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1101 : Poly :=
[
  term ((1728 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1101_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1101
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1102 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1102 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1102 : Poly :=
[
  term ((-576 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1102_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1102
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1103 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 1103 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1103 : Poly :=
[
  term ((1728 : Rat) / 5) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1103_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1103
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1104 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1104 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1104 : Poly :=
[
  term ((-576 : Rat) / 5) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1104_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1104
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1105 : Poly :=
[
  term ((576 : Rat) / 7) [(9, 2), (13, 2)]
]

/-- Partial product 1105 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1105 : Poly :=
[
  term ((1152 : Rat) / 7) [(6, 1), (9, 2), (13, 2)],
  term ((-576 : Rat) / 7) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1105_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1105
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1106 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 2), (13, 2), (14, 1)]
]

/-- Partial product 1106 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1106 : Poly :=
[
  term ((-1728 : Rat) / 5) [(6, 1), (9, 2), (13, 2), (14, 1)],
  term ((864 : Rat) / 5) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1106_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1106
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1107 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1107 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1107 : Poly :=
[
  term ((576 : Rat) / 5) [(6, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1107_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1107
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1108 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 2), (13, 2), (16, 1)]
]

/-- Partial product 1108 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1108 : Poly :=
[
  term ((-288 : Rat) / 5) [(6, 1), (9, 2), (13, 2), (16, 1)],
  term ((144 : Rat) / 5) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1108_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1108
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1109 : Poly :=
[
  term ((11016 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1109 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1109 : Poly :=
[
  term ((22032 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-11016 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1109_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1109
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1110 : Poly :=
[
  term ((-1776 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1110 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1110 : Poly :=
[
  term ((-3552 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1776 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1110_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1110
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1111 : Poly :=
[
  term ((288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1111 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1111 : Poly :=
[
  term ((576 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1111_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1111
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1112 : Poly :=
[
  term ((-144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1112 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1112 : Poly :=
[
  term ((-288 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1112_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1112
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1113 : Poly :=
[
  term ((4779 : Rat) / 25) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1113 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1113 : Poly :=
[
  term ((9558 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4779 : Rat) / 25) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1113_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1113
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1114 : Poly :=
[
  term ((-1698 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1114 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1114 : Poly :=
[
  term ((-3396 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1698 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1114_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1114
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1115 : Poly :=
[
  term ((2988 : Rat) / 35) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1115 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1115 : Poly :=
[
  term ((5976 : Rat) / 35) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-2988 : Rat) / 35) [(11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1115_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1115
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1116 : Poly :=
[
  term ((-864 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1116 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1116 : Poly :=
[
  term ((-1728 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1116_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1116
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1117 : Poly :=
[
  term ((288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1117 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1117 : Poly :=
[
  term ((576 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1117_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1117
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1118 : Poly :=
[
  term ((-144 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1118 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1118 : Poly :=
[
  term ((-288 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1118_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1118
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1119 : Poly :=
[
  term ((4062 : Rat) / 25) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1119 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1119 : Poly :=
[
  term ((8124 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4062 : Rat) / 25) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1119_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1119
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1120 : Poly :=
[
  term ((-1284 : Rat) / 25) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1120 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1120 : Poly :=
[
  term ((-2568 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1284 : Rat) / 25) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1120_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1120
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1121 : Poly :=
[
  term ((864 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 1121 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1121 : Poly :=
[
  term ((1728 : Rat) / 35) [(6, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 35) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1121_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1121
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1122 : Poly :=
[
  term ((327 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1122 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1122 : Poly :=
[
  term ((654 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-327 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1122_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1122
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1123 : Poly :=
[
  term (-48 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1123 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1123 : Poly :=
[
  term (-96 : Rat) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1123_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1123
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1124 : Poly :=
[
  term (23 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1124 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1124 : Poly :=
[
  term (46 : Rat) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term (-23 : Rat) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1124_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1124
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1125 : Poly :=
[
  term ((-3462 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 1125 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1125 : Poly :=
[
  term ((-6924 : Rat) / 25) [(6, 1), (11, 1), (15, 1)],
  term ((3462 : Rat) / 25) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1125_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1125
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1126 : Poly :=
[
  term ((1224 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1126 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1126 : Poly :=
[
  term ((2448 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1126_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1126
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1127 : Poly :=
[
  term ((-3 : Rat) / 5) [(11, 2)]
]

/-- Partial product 1127 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1127 : Poly :=
[
  term ((-6 : Rat) / 5) [(6, 1), (11, 2)],
  term ((3 : Rat) / 5) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1127_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1127
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1128 : Poly :=
[
  term ((-954 : Rat) / 5) [(11, 2), (12, 1)]
]

/-- Partial product 1128 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1128 : Poly :=
[
  term ((-1908 : Rat) / 5) [(6, 1), (11, 2), (12, 1)],
  term ((954 : Rat) / 5) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1128_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1128
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1129 : Poly :=
[
  term ((726 : Rat) / 5) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 1129 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1129 : Poly :=
[
  term ((1452 : Rat) / 5) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term ((-726 : Rat) / 5) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1129_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1129
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1130 : Poly :=
[
  term (2 : Rat) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1130 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1130 : Poly :=
[
  term (4 : Rat) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1130_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1130
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1131 : Poly :=
[
  term ((-6 : Rat) / 5) [(11, 2), (14, 1)]
]

/-- Partial product 1131 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1131 : Poly :=
[
  term ((-12 : Rat) / 5) [(6, 1), (11, 2), (14, 1)],
  term ((6 : Rat) / 5) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1131_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1131
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1132 : Poly :=
[
  term ((-3 : Rat) / 5) [(11, 2), (16, 1)]
]

/-- Partial product 1132 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1132 : Poly :=
[
  term ((-6 : Rat) / 5) [(6, 1), (11, 2), (16, 1)],
  term ((3 : Rat) / 5) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1132_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1132
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1133 : Poly :=
[
  term ((813 : Rat) / 10) [(12, 1)]
]

/-- Partial product 1133 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1133 : Poly :=
[
  term ((813 : Rat) / 5) [(6, 1), (12, 1)],
  term ((-813 : Rat) / 10) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1133_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1133
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1134 : Poly :=
[
  term ((-6609 : Rat) / 25) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1134 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1134 : Poly :=
[
  term ((-13218 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((6609 : Rat) / 25) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1134_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1134
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1135 : Poly :=
[
  term ((2118 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1135 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1135 : Poly :=
[
  term ((4236 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2118 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1135_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1135
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1136 : Poly :=
[
  term ((-4626 : Rat) / 35) [(12, 1), (13, 2)]
]

/-- Partial product 1136 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1136 : Poly :=
[
  term ((-9252 : Rat) / 35) [(6, 1), (12, 1), (13, 2)],
  term ((4626 : Rat) / 35) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1136_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1136
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1137 : Poly :=
[
  term ((1296 : Rat) / 5) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1137 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1137 : Poly :=
[
  term ((2592 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1296 : Rat) / 5) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1137_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1137
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1138 : Poly :=
[
  term ((-432 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1138 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1138 : Poly :=
[
  term ((-864 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((432 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1138_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1138
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1139 : Poly :=
[
  term ((216 : Rat) / 5) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1139 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1139 : Poly :=
[
  term ((432 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-216 : Rat) / 5) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1139_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1139
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1140 : Poly :=
[
  term ((-339 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 1140 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1140 : Poly :=
[
  term ((-678 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((339 : Rat) / 5) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1140_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1140
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1141 : Poly :=
[
  term ((-6 : Rat) / 5) [(12, 1), (15, 2)]
]

/-- Partial product 1141 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1141 : Poly :=
[
  term ((-12 : Rat) / 5) [(6, 1), (12, 1), (15, 2)],
  term ((6 : Rat) / 5) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1141_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1141
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1142 : Poly :=
[
  term ((-288 : Rat) / 5) [(12, 2)]
]

/-- Partial product 1142 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1142 : Poly :=
[
  term ((-576 : Rat) / 5) [(6, 1), (12, 2)],
  term ((288 : Rat) / 5) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1142_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1142
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1143 : Poly :=
[
  term ((228 : Rat) / 5) [(12, 2), (14, 1)]
]

/-- Partial product 1143 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1143 : Poly :=
[
  term ((456 : Rat) / 5) [(6, 1), (12, 2), (14, 1)],
  term ((-228 : Rat) / 5) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1143_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1143
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1144 : Poly :=
[
  term ((-6 : Rat) / 5) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1144 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1144 : Poly :=
[
  term ((-12 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((6 : Rat) / 5) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1144_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1144
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1145 : Poly :=
[
  term ((7263 : Rat) / 50) [(13, 1), (15, 1)]
]

/-- Partial product 1145 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1145 : Poly :=
[
  term ((7263 : Rat) / 25) [(6, 1), (13, 1), (15, 1)],
  term ((-7263 : Rat) / 50) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1145_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1145
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1146 : Poly :=
[
  term ((-1113 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1146 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1146 : Poly :=
[
  term ((-2226 : Rat) / 25) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1113 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1146_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1146
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1147 : Poly :=
[
  term ((444 : Rat) / 35) [(13, 2)]
]

/-- Partial product 1147 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1147 : Poly :=
[
  term ((888 : Rat) / 35) [(6, 1), (13, 2)],
  term ((-444 : Rat) / 35) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1147_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1147
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1148 : Poly :=
[
  term (-96 : Rat) [(13, 2), (14, 1)]
]

/-- Partial product 1148 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1148 : Poly :=
[
  term (-192 : Rat) [(6, 1), (13, 2), (14, 1)],
  term (96 : Rat) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1148_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1148
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1149 : Poly :=
[
  term (48 : Rat) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1149 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1149 : Poly :=
[
  term (96 : Rat) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term (-48 : Rat) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1149_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1149
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1150 : Poly :=
[
  term (-24 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 1150 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1150 : Poly :=
[
  term (-48 : Rat) [(6, 1), (13, 2), (16, 1)],
  term (24 : Rat) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1150_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1150
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1151 : Poly :=
[
  term ((99 : Rat) / 10) [(14, 1)]
]

/-- Partial product 1151 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1151 : Poly :=
[
  term ((99 : Rat) / 5) [(6, 1), (14, 1)],
  term ((-99 : Rat) / 10) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1151_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1151
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_1152 : Poly :=
[
  term ((-3 : Rat) / 20) [(16, 1)]
]

/-- Partial product 1152 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_1152 : Poly :=
[
  term ((-3 : Rat) / 10) [(6, 1), (16, 1)],
  term ((3 : Rat) / 20) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_1152_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_1152
        rs_R006_ueqv_R006_generator_16_1100_1152 =
      rs_R006_ueqv_R006_partial_16_1152 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_16_1100_1152 : List Poly :=
[
  rs_R006_ueqv_R006_partial_16_1100,
  rs_R006_ueqv_R006_partial_16_1101,
  rs_R006_ueqv_R006_partial_16_1102,
  rs_R006_ueqv_R006_partial_16_1103,
  rs_R006_ueqv_R006_partial_16_1104,
  rs_R006_ueqv_R006_partial_16_1105,
  rs_R006_ueqv_R006_partial_16_1106,
  rs_R006_ueqv_R006_partial_16_1107,
  rs_R006_ueqv_R006_partial_16_1108,
  rs_R006_ueqv_R006_partial_16_1109,
  rs_R006_ueqv_R006_partial_16_1110,
  rs_R006_ueqv_R006_partial_16_1111,
  rs_R006_ueqv_R006_partial_16_1112,
  rs_R006_ueqv_R006_partial_16_1113,
  rs_R006_ueqv_R006_partial_16_1114,
  rs_R006_ueqv_R006_partial_16_1115,
  rs_R006_ueqv_R006_partial_16_1116,
  rs_R006_ueqv_R006_partial_16_1117,
  rs_R006_ueqv_R006_partial_16_1118,
  rs_R006_ueqv_R006_partial_16_1119,
  rs_R006_ueqv_R006_partial_16_1120,
  rs_R006_ueqv_R006_partial_16_1121,
  rs_R006_ueqv_R006_partial_16_1122,
  rs_R006_ueqv_R006_partial_16_1123,
  rs_R006_ueqv_R006_partial_16_1124,
  rs_R006_ueqv_R006_partial_16_1125,
  rs_R006_ueqv_R006_partial_16_1126,
  rs_R006_ueqv_R006_partial_16_1127,
  rs_R006_ueqv_R006_partial_16_1128,
  rs_R006_ueqv_R006_partial_16_1129,
  rs_R006_ueqv_R006_partial_16_1130,
  rs_R006_ueqv_R006_partial_16_1131,
  rs_R006_ueqv_R006_partial_16_1132,
  rs_R006_ueqv_R006_partial_16_1133,
  rs_R006_ueqv_R006_partial_16_1134,
  rs_R006_ueqv_R006_partial_16_1135,
  rs_R006_ueqv_R006_partial_16_1136,
  rs_R006_ueqv_R006_partial_16_1137,
  rs_R006_ueqv_R006_partial_16_1138,
  rs_R006_ueqv_R006_partial_16_1139,
  rs_R006_ueqv_R006_partial_16_1140,
  rs_R006_ueqv_R006_partial_16_1141,
  rs_R006_ueqv_R006_partial_16_1142,
  rs_R006_ueqv_R006_partial_16_1143,
  rs_R006_ueqv_R006_partial_16_1144,
  rs_R006_ueqv_R006_partial_16_1145,
  rs_R006_ueqv_R006_partial_16_1146,
  rs_R006_ueqv_R006_partial_16_1147,
  rs_R006_ueqv_R006_partial_16_1148,
  rs_R006_ueqv_R006_partial_16_1149,
  rs_R006_ueqv_R006_partial_16_1150,
  rs_R006_ueqv_R006_partial_16_1151,
  rs_R006_ueqv_R006_partial_16_1152
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_16_1100_1152 : Poly :=
[
  term ((-288 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(6, 1), (9, 2), (13, 2)],
  term ((-1728 : Rat) / 5) [(6, 1), (9, 2), (13, 2), (14, 1)],
  term ((576 : Rat) / 5) [(6, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 1), (9, 2), (13, 2), (16, 1)],
  term ((22032 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3552 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((9558 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3396 : Rat) / 25) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5976 : Rat) / 35) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1728 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((8124 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2568 : Rat) / 25) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(6, 1), (11, 1), (13, 1)],
  term ((654 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (46 : Rat) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6924 : Rat) / 25) [(6, 1), (11, 1), (15, 1)],
  term ((2448 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (11, 2)],
  term ((-1908 : Rat) / 5) [(6, 1), (11, 2), (12, 1)],
  term ((1452 : Rat) / 5) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term (4 : Rat) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (11, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (11, 2), (16, 1)],
  term ((813 : Rat) / 5) [(6, 1), (12, 1)],
  term ((-13218 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((4236 : Rat) / 25) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9252 : Rat) / 35) [(6, 1), (12, 1), (13, 2)],
  term ((2592 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((432 : Rat) / 5) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-678 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (12, 1), (15, 2)],
  term ((-576 : Rat) / 5) [(6, 1), (12, 2)],
  term ((456 : Rat) / 5) [(6, 1), (12, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((7263 : Rat) / 25) [(6, 1), (13, 1), (15, 1)],
  term ((-2226 : Rat) / 25) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((888 : Rat) / 35) [(6, 1), (13, 2)],
  term (-192 : Rat) [(6, 1), (13, 2), (14, 1)],
  term (96 : Rat) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term (-48 : Rat) [(6, 1), (13, 2), (16, 1)],
  term ((99 : Rat) / 5) [(6, 1), (14, 1)],
  term ((-3 : Rat) / 10) [(6, 1), (16, 1)],
  term ((144 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 2), (11, 1), (15, 1)],
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 2), (13, 1), (15, 1)],
  term ((288 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 7) [(9, 2), (13, 2)],
  term ((864 : Rat) / 5) [(9, 2), (13, 2), (14, 1)],
  term ((-288 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(9, 2), (13, 2), (16, 1)],
  term ((-11016 : Rat) / 35) [(11, 1), (12, 1), (13, 1)],
  term ((1776 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4779 : Rat) / 25) [(11, 1), (12, 1), (15, 1)],
  term ((1698 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2988 : Rat) / 35) [(11, 1), (12, 2), (13, 1)],
  term ((864 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4062 : Rat) / 25) [(11, 1), (12, 2), (15, 1)],
  term ((1284 : Rat) / 25) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(11, 1), (13, 1)],
  term ((-327 : Rat) / 5) [(11, 1), (13, 1), (14, 1)],
  term (48 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term (-23 : Rat) [(11, 1), (13, 1), (16, 1)],
  term ((3462 : Rat) / 25) [(11, 1), (15, 1)],
  term ((-1224 : Rat) / 25) [(11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 5) [(11, 2)],
  term ((954 : Rat) / 5) [(11, 2), (12, 1)],
  term ((-726 : Rat) / 5) [(11, 2), (12, 1), (14, 1)],
  term (-2 : Rat) [(11, 2), (12, 1), (16, 1)],
  term ((6 : Rat) / 5) [(11, 2), (14, 1)],
  term ((3 : Rat) / 5) [(11, 2), (16, 1)],
  term ((-813 : Rat) / 10) [(12, 1)],
  term ((6609 : Rat) / 25) [(12, 1), (13, 1), (15, 1)],
  term ((-2118 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4626 : Rat) / 35) [(12, 1), (13, 2)],
  term ((-1296 : Rat) / 5) [(12, 1), (13, 2), (14, 1)],
  term ((432 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(12, 1), (13, 2), (16, 1)],
  term ((339 : Rat) / 5) [(12, 1), (14, 1)],
  term ((6 : Rat) / 5) [(12, 1), (15, 2)],
  term ((288 : Rat) / 5) [(12, 2)],
  term ((-228 : Rat) / 5) [(12, 2), (14, 1)],
  term ((6 : Rat) / 5) [(13, 1), (14, 1), (15, 1)],
  term ((-7263 : Rat) / 50) [(13, 1), (15, 1)],
  term ((1113 : Rat) / 25) [(13, 1), (15, 1), (16, 1)],
  term ((-444 : Rat) / 35) [(13, 2)],
  term (96 : Rat) [(13, 2), (14, 1)],
  term (-48 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (24 : Rat) [(13, 2), (16, 1)],
  term ((-99 : Rat) / 10) [(14, 1)],
  term ((3 : Rat) / 20) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 1100 through 1152. -/
theorem rs_R006_ueqv_R006_block_16_1100_1152_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_16_1100_1152
      rs_R006_ueqv_R006_block_16_1100_1152 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
