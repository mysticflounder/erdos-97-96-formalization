/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 22:1100-1199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_22_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1100 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 2)]
]

/-- Partial product 1100 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1100 : Poly :=
[
  term ((144 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 2)],
  term ((-288 : Rat) / 35) [(2, 1), (8, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1100_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1100
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1101 : Poly :=
[
  term ((288 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1101 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1101 : Poly :=
[
  term ((576 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1101_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1101
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1102 : Poly :=
[
  term ((9216 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1102 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1102 : Poly :=
[
  term ((18432 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9216 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1102_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1102
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1103 : Poly :=
[
  term ((-3072 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1103 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1103 : Poly :=
[
  term ((-6144 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1103_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1103
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1104 : Poly :=
[
  term ((2736 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1104 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1104 : Poly :=
[
  term ((5472 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2736 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1104_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1104
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1105 : Poly :=
[
  term ((-912 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1105 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1105 : Poly :=
[
  term ((-1824 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1105_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1105
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1106 : Poly :=
[
  term ((-3744 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1106 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1106 : Poly :=
[
  term ((-7488 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((3744 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1106_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1106
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1107 : Poly :=
[
  term ((1248 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1107 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1107 : Poly :=
[
  term ((2496 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1107_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1107
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1108 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (8, 1), (13, 2)]
]

/-- Partial product 1108 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1108 : Poly :=
[
  term ((-288 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 2)],
  term ((144 : Rat) / 35) [(2, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1108_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1108
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1109 : Poly :=
[
  term ((-864 : Rat) / 5) [(2, 1), (8, 2), (11, 1), (15, 1)]
]

/-- Partial product 1109 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1109 : Poly :=
[
  term ((-1728 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((864 : Rat) / 5) [(2, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1109_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1109
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1110 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1110 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1110 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1110_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1110
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1111 : Poly :=
[
  term ((1728 : Rat) / 5) [(2, 1), (8, 2), (13, 1), (15, 1)]
]

/-- Partial product 1111 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1111 : Poly :=
[
  term ((3456 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(2, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1111_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1111
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1112 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1112 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1112 : Poly :=
[
  term ((-1152 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1112_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1112
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1113 : Poly :=
[
  term ((-13248 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1113 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1113 : Poly :=
[
  term ((13248 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-26496 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1113_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1113
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1114 : Poly :=
[
  term ((4416 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1114 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1114 : Poly :=
[
  term ((-4416 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8832 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1114_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1114
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1115 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1115 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1115 : Poly :=
[
  term ((144 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1115_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1115
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1116 : Poly :=
[
  term ((-3744 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1116 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1116 : Poly :=
[
  term ((3744 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7488 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1116_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1116
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1117 : Poly :=
[
  term ((1248 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1117 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1117 : Poly :=
[
  term ((-1248 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2496 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1117_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1117
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1118 : Poly :=
[
  term ((144 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1118 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1118 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((288 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1118_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1118
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1119 : Poly :=
[
  term ((10368 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 1119 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1119 : Poly :=
[
  term ((-10368 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((20736 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1119_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1119
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1120 : Poly :=
[
  term ((-3456 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1120 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1120 : Poly :=
[
  term ((3456 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1120_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1120
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1121 : Poly :=
[
  term ((2736 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1121 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1121 : Poly :=
[
  term ((-2736 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((5472 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1121_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1121
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1122 : Poly :=
[
  term ((-912 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1122 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1122 : Poly :=
[
  term ((912 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1122_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1122
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1123 : Poly :=
[
  term ((-10368 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1123 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1123 : Poly :=
[
  term ((-20736 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1123_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1123
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1124 : Poly :=
[
  term ((3456 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1124 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1124 : Poly :=
[
  term ((6912 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1124_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1124
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1125 : Poly :=
[
  term ((-16992 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1125 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1125 : Poly :=
[
  term ((-33984 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((16992 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1125_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1125
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1126 : Poly :=
[
  term ((5664 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1126 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1126 : Poly :=
[
  term ((11328 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5664 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1126_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1126
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1127 : Poly :=
[
  term ((13248 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 1127 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1127 : Poly :=
[
  term ((26496 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-13248 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1127_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1127
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1128 : Poly :=
[
  term ((-4416 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1128 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1128 : Poly :=
[
  term ((-8832 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1128_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1128
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1129 : Poly :=
[
  term ((13248 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 1129 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1129 : Poly :=
[
  term ((26496 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-13248 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1129_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1129
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1130 : Poly :=
[
  term ((-4416 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1130 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1130 : Poly :=
[
  term ((-8832 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1130_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1130
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1131 : Poly :=
[
  term ((-72 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1131 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1131 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((72 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1131_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1131
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1132 : Poly :=
[
  term ((-2304 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1132 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1132 : Poly :=
[
  term ((-4608 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2304 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1132_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1132
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1133 : Poly :=
[
  term ((768 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1133 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1133 : Poly :=
[
  term ((1536 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1133_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1133
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1134 : Poly :=
[
  term ((5184 : Rat) / 5) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1134 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1134 : Poly :=
[
  term ((10368 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-5184 : Rat) / 5) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1134_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1134
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1135 : Poly :=
[
  term ((-1728 : Rat) / 5) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1135 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1135 : Poly :=
[
  term ((-3456 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1135_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1135
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1136 : Poly :=
[
  term ((-444 : Rat) / 35) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 1136 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1136 : Poly :=
[
  term ((-888 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((444 : Rat) / 35) [(2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1136_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1136
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1137 : Poly :=
[
  term ((144 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1137 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1137 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1137_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1137
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1138 : Poly :=
[
  term ((-48 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1138 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1138 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1138_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1138
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1139 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1139 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1139 : Poly :=
[
  term ((48 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1139_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1139
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1140 : Poly :=
[
  term ((5184 : Rat) / 5) [(2, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 1140 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1140 : Poly :=
[
  term ((10368 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-5184 : Rat) / 5) [(2, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1140_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1140
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1141 : Poly :=
[
  term ((-1728 : Rat) / 5) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1141 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1141 : Poly :=
[
  term ((-3456 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1141_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1141
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1142 : Poly :=
[
  term (792 : Rat) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 1142 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1142 : Poly :=
[
  term (1584 : Rat) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term (-792 : Rat) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1142_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1142
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1143 : Poly :=
[
  term (-264 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1143 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1143 : Poly :=
[
  term (-528 : Rat) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (264 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1143_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1143
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1144 : Poly :=
[
  term ((-3456 : Rat) / 5) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1144 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1144 : Poly :=
[
  term ((3456 : Rat) / 5) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-6912 : Rat) / 5) [(2, 1), (9, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1144_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1144
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1145 : Poly :=
[
  term ((1152 : Rat) / 5) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1145 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1145 : Poly :=
[
  term ((-1152 : Rat) / 5) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 5) [(2, 1), (9, 2), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1145_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1145
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1146 : Poly :=
[
  term ((-1728 : Rat) / 5) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 1146 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1146 : Poly :=
[
  term ((-3456 : Rat) / 5) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1146_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1146
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1147 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1147 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1147 : Poly :=
[
  term ((1152 : Rat) / 5) [(2, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1147_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1147
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1148 : Poly :=
[
  term ((-1728 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1148 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1148 : Poly :=
[
  term ((1728 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(2, 1), (10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1148_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1148
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1149 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1149 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1149 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1149_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1149
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1150 : Poly :=
[
  term ((5616 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1150 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1150 : Poly :=
[
  term ((-5616 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((11232 : Rat) / 25) [(2, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1150_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1150
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1151 : Poly :=
[
  term ((-1632 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1151 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1151 : Poly :=
[
  term ((1632 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3264 : Rat) / 25) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1151_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1151
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1152 : Poly :=
[
  term ((-72 : Rat) / 35) [(2, 1), (10, 1), (13, 2)]
]

/-- Partial product 1152 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1152 : Poly :=
[
  term ((72 : Rat) / 35) [(2, 1), (10, 1), (13, 2)],
  term ((-144 : Rat) / 35) [(2, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1152_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1152
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1153 : Poly :=
[
  term ((72 : Rat) / 35) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1153 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1153 : Poly :=
[
  term ((144 : Rat) / 35) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1153_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1153
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1154 : Poly :=
[
  term ((3024 : Rat) / 25) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1154 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1154 : Poly :=
[
  term ((6048 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3024 : Rat) / 25) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1154_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1154
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1155 : Poly :=
[
  term ((-1248 : Rat) / 25) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1155 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1155 : Poly :=
[
  term ((-2496 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1248 : Rat) / 25) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1155_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1155
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1156 : Poly :=
[
  term ((1728 : Rat) / 5) [(2, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1156 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1156 : Poly :=
[
  term ((3456 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1728 : Rat) / 5) [(2, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1156_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1156
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1157 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1157 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1157 : Poly :=
[
  term ((-1152 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1157_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1157
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1158 : Poly :=
[
  term ((144 : Rat) / 35) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 1158 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1158 : Poly :=
[
  term ((288 : Rat) / 35) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1158_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1158
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1159 : Poly :=
[
  term ((-1008 : Rat) / 5) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 1159 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1159 : Poly :=
[
  term ((-2016 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((1008 : Rat) / 5) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1159_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1159
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1160 : Poly :=
[
  term ((312 : Rat) / 5) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1160 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1160 : Poly :=
[
  term ((624 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-312 : Rat) / 5) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1160_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1160
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1161 : Poly :=
[
  term ((6 : Rat) / 5) [(2, 1), (12, 1)]
]

/-- Partial product 1161 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1161 : Poly :=
[
  term ((12 : Rat) / 5) [(2, 1), (10, 1), (12, 1)],
  term ((-6 : Rat) / 5) [(2, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1161_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1161
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1162 : Poly :=
[
  term ((-4608 : Rat) / 25) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1162 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1162 : Poly :=
[
  term ((-9216 : Rat) / 25) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4608 : Rat) / 25) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1162_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1162
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1163 : Poly :=
[
  term ((1476 : Rat) / 25) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1163 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1163 : Poly :=
[
  term ((2952 : Rat) / 25) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1476 : Rat) / 25) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1163_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1163
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1164 : Poly :=
[
  term ((-36 : Rat) / 35) [(2, 1), (12, 1), (13, 2)]
]

/-- Partial product 1164 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1164 : Poly :=
[
  term ((-72 : Rat) / 35) [(2, 1), (10, 1), (12, 1), (13, 2)],
  term ((36 : Rat) / 35) [(2, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1164_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1164
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1165 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (12, 1), (14, 1)]
]

/-- Partial product 1165 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1165 : Poly :=
[
  term ((-48 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(2, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1165_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1165
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1166 : Poly :=
[
  term ((-6 : Rat) / 5) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 1166 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1166 : Poly :=
[
  term ((-12 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((6 : Rat) / 5) [(2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1166_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1166
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1167 : Poly :=
[
  term ((504 : Rat) / 5) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 1167 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1167 : Poly :=
[
  term ((1008 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-504 : Rat) / 5) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1167_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1167
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1168 : Poly :=
[
  term ((-156 : Rat) / 5) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1168 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1168 : Poly :=
[
  term ((-312 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((156 : Rat) / 5) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1168_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1168
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1169 : Poly :=
[
  term ((-72 : Rat) / 35) [(2, 1), (13, 2)]
]

/-- Partial product 1169 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1169 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (10, 1), (13, 2)],
  term ((72 : Rat) / 35) [(2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1169_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1169
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1170 : Poly :=
[
  term ((-63 : Rat) / 5) [(2, 1), (14, 1)]
]

/-- Partial product 1170 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1170 : Poly :=
[
  term ((-126 : Rat) / 5) [(2, 1), (10, 1), (14, 1)],
  term ((63 : Rat) / 5) [(2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1170_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1170
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1171 : Poly :=
[
  term ((-4 : Rat) / 5) [(2, 1), (16, 1)]
]

/-- Partial product 1171 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1171 : Poly :=
[
  term ((-8 : Rat) / 5) [(2, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 5) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1171_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1171
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1172 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 2), (9, 1), (15, 1)]
]

/-- Partial product 1172 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1172 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1172_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1172
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1173 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1173 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1173 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1173_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1173
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1174 : Poly :=
[
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 1174 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1174 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1174_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1174
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1175 : Poly :=
[
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1175 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1175 : Poly :=
[
  term ((-192 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1175_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1175
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1176 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1176 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1176 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1176_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1176
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1177 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1177 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1177 : Poly :=
[
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((192 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1177_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1177
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1178 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 1178 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1178 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1178_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1178
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1179 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1179 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1179 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1179_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1179
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1180 : Poly :=
[
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1180 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1180 : Poly :=
[
  term ((-192 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1180_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1180
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1181 : Poly :=
[
  term ((24 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 1181 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1181 : Poly :=
[
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-24 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1181_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1181
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1182 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 1182 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1182 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1182_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1182
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1183 : Poly :=
[
  term ((-48 : Rat) / 35) [(3, 1), (5, 1), (12, 1), (13, 2)]
]

/-- Partial product 1183 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1183 : Poly :=
[
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2)],
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1183_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1183
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1184 : Poly :=
[
  term ((-48 : Rat) / 35) [(3, 1), (5, 1), (13, 2)]
]

/-- Partial product 1184 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1184 : Poly :=
[
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1184_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1184
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1185 : Poly :=
[
  term ((-216 : Rat) / 5) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 1185 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1185 : Poly :=
[
  term ((216 : Rat) / 5) [(3, 1), (6, 1), (7, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1185_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1185
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1186 : Poly :=
[
  term ((888 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 1186 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1186 : Poly :=
[
  term ((1776 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-888 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1186_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1186
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1187 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1187 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1187 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1187_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1187
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1188 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1188 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1188 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1188_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1188
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1189 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1189 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1189 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1189_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1189
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1190 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 1190 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1190 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1190_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1190
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1191 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1191 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1191 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1191_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1191
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1192 : Poly :=
[
  term ((6 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (14, 1)]
]

/-- Partial product 1192 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1192 : Poly :=
[
  term ((12 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1192_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1192
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1193 : Poly :=
[
  term ((18 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1193 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1193 : Poly :=
[
  term ((36 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1193_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1193
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1194 : Poly :=
[
  term ((44 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 1194 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1194 : Poly :=
[
  term ((88 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-44 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1194_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1194
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1195 : Poly :=
[
  term (288 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 1195 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1195 : Poly :=
[
  term (576 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term (-288 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1195_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1195
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1196 : Poly :=
[
  term (144 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1196 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1196 : Poly :=
[
  term (288 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term (-144 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1196_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1196
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1197 : Poly :=
[
  term (-48 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1197 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1197 : Poly :=
[
  term (-96 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1197_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1197
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1198 : Poly :=
[
  term (-96 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1198 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1198 : Poly :=
[
  term (-192 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term (96 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1198_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1198
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 22. -/
def rs_R006_ueqv_R006_coefficient_22_1199 : Poly :=
[
  term ((-3744 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 1199 for generator 22. -/
def rs_R006_ueqv_R006_partial_22_1199 : Poly :=
[
  term ((-7488 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((3744 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 22. -/
theorem rs_R006_ueqv_R006_partial_22_1199_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_22_1199
        rs_R006_ueqv_R006_generator_22_1100_1199 =
      rs_R006_ueqv_R006_partial_22_1199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_22_1100_1199 : List Poly :=
[
  rs_R006_ueqv_R006_partial_22_1100,
  rs_R006_ueqv_R006_partial_22_1101,
  rs_R006_ueqv_R006_partial_22_1102,
  rs_R006_ueqv_R006_partial_22_1103,
  rs_R006_ueqv_R006_partial_22_1104,
  rs_R006_ueqv_R006_partial_22_1105,
  rs_R006_ueqv_R006_partial_22_1106,
  rs_R006_ueqv_R006_partial_22_1107,
  rs_R006_ueqv_R006_partial_22_1108,
  rs_R006_ueqv_R006_partial_22_1109,
  rs_R006_ueqv_R006_partial_22_1110,
  rs_R006_ueqv_R006_partial_22_1111,
  rs_R006_ueqv_R006_partial_22_1112,
  rs_R006_ueqv_R006_partial_22_1113,
  rs_R006_ueqv_R006_partial_22_1114,
  rs_R006_ueqv_R006_partial_22_1115,
  rs_R006_ueqv_R006_partial_22_1116,
  rs_R006_ueqv_R006_partial_22_1117,
  rs_R006_ueqv_R006_partial_22_1118,
  rs_R006_ueqv_R006_partial_22_1119,
  rs_R006_ueqv_R006_partial_22_1120,
  rs_R006_ueqv_R006_partial_22_1121,
  rs_R006_ueqv_R006_partial_22_1122,
  rs_R006_ueqv_R006_partial_22_1123,
  rs_R006_ueqv_R006_partial_22_1124,
  rs_R006_ueqv_R006_partial_22_1125,
  rs_R006_ueqv_R006_partial_22_1126,
  rs_R006_ueqv_R006_partial_22_1127,
  rs_R006_ueqv_R006_partial_22_1128,
  rs_R006_ueqv_R006_partial_22_1129,
  rs_R006_ueqv_R006_partial_22_1130,
  rs_R006_ueqv_R006_partial_22_1131,
  rs_R006_ueqv_R006_partial_22_1132,
  rs_R006_ueqv_R006_partial_22_1133,
  rs_R006_ueqv_R006_partial_22_1134,
  rs_R006_ueqv_R006_partial_22_1135,
  rs_R006_ueqv_R006_partial_22_1136,
  rs_R006_ueqv_R006_partial_22_1137,
  rs_R006_ueqv_R006_partial_22_1138,
  rs_R006_ueqv_R006_partial_22_1139,
  rs_R006_ueqv_R006_partial_22_1140,
  rs_R006_ueqv_R006_partial_22_1141,
  rs_R006_ueqv_R006_partial_22_1142,
  rs_R006_ueqv_R006_partial_22_1143,
  rs_R006_ueqv_R006_partial_22_1144,
  rs_R006_ueqv_R006_partial_22_1145,
  rs_R006_ueqv_R006_partial_22_1146,
  rs_R006_ueqv_R006_partial_22_1147,
  rs_R006_ueqv_R006_partial_22_1148,
  rs_R006_ueqv_R006_partial_22_1149,
  rs_R006_ueqv_R006_partial_22_1150,
  rs_R006_ueqv_R006_partial_22_1151,
  rs_R006_ueqv_R006_partial_22_1152,
  rs_R006_ueqv_R006_partial_22_1153,
  rs_R006_ueqv_R006_partial_22_1154,
  rs_R006_ueqv_R006_partial_22_1155,
  rs_R006_ueqv_R006_partial_22_1156,
  rs_R006_ueqv_R006_partial_22_1157,
  rs_R006_ueqv_R006_partial_22_1158,
  rs_R006_ueqv_R006_partial_22_1159,
  rs_R006_ueqv_R006_partial_22_1160,
  rs_R006_ueqv_R006_partial_22_1161,
  rs_R006_ueqv_R006_partial_22_1162,
  rs_R006_ueqv_R006_partial_22_1163,
  rs_R006_ueqv_R006_partial_22_1164,
  rs_R006_ueqv_R006_partial_22_1165,
  rs_R006_ueqv_R006_partial_22_1166,
  rs_R006_ueqv_R006_partial_22_1167,
  rs_R006_ueqv_R006_partial_22_1168,
  rs_R006_ueqv_R006_partial_22_1169,
  rs_R006_ueqv_R006_partial_22_1170,
  rs_R006_ueqv_R006_partial_22_1171,
  rs_R006_ueqv_R006_partial_22_1172,
  rs_R006_ueqv_R006_partial_22_1173,
  rs_R006_ueqv_R006_partial_22_1174,
  rs_R006_ueqv_R006_partial_22_1175,
  rs_R006_ueqv_R006_partial_22_1176,
  rs_R006_ueqv_R006_partial_22_1177,
  rs_R006_ueqv_R006_partial_22_1178,
  rs_R006_ueqv_R006_partial_22_1179,
  rs_R006_ueqv_R006_partial_22_1180,
  rs_R006_ueqv_R006_partial_22_1181,
  rs_R006_ueqv_R006_partial_22_1182,
  rs_R006_ueqv_R006_partial_22_1183,
  rs_R006_ueqv_R006_partial_22_1184,
  rs_R006_ueqv_R006_partial_22_1185,
  rs_R006_ueqv_R006_partial_22_1186,
  rs_R006_ueqv_R006_partial_22_1187,
  rs_R006_ueqv_R006_partial_22_1188,
  rs_R006_ueqv_R006_partial_22_1189,
  rs_R006_ueqv_R006_partial_22_1190,
  rs_R006_ueqv_R006_partial_22_1191,
  rs_R006_ueqv_R006_partial_22_1192,
  rs_R006_ueqv_R006_partial_22_1193,
  rs_R006_ueqv_R006_partial_22_1194,
  rs_R006_ueqv_R006_partial_22_1195,
  rs_R006_ueqv_R006_partial_22_1196,
  rs_R006_ueqv_R006_partial_22_1197,
  rs_R006_ueqv_R006_partial_22_1198,
  rs_R006_ueqv_R006_partial_22_1199
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_22_1100_1199 : Poly :=
[
  term ((576 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((18432 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6144 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1824 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7488 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2496 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(2, 1), (8, 1), (10, 1), (13, 2)],
  term ((-288 : Rat) / 35) [(2, 1), (8, 1), (10, 2), (13, 2)],
  term ((-288 : Rat) / 35) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9216 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((3072 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2736 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((912 : Rat) / 5) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3744 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(2, 1), (8, 1), (13, 2)],
  term ((-1728 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(2, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((576 : Rat) / 5) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20736 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((6912 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20736 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((6912 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26496 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8832 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((26496 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8832 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((288 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10368 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-3456 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1032 : Rat) / 35) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((288 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((5184 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26496 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((8832 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-7488 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((2496 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((20736 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-6912 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((5472 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1824 : Rat) / 5) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((10368 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((16992 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5664 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((4416 : Rat) / 5) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((2304 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-768 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((444 : Rat) / 35) [(2, 1), (9, 1), (13, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term (-792 : Rat) [(2, 1), (9, 1), (15, 1)],
  term (264 : Rat) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(2, 1), (9, 2), (10, 2), (13, 1), (15, 1)],
  term ((2304 : Rat) / 5) [(2, 1), (9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((6048 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2496 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1152 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2016 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((624 : Rat) / 5) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(2, 1), (10, 1), (12, 1)],
  term ((-576 : Rat) / 25) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((72 : Rat) / 25) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(2, 1), (10, 1), (12, 1), (13, 2)],
  term ((-48 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-576 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((72 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(2, 1), (10, 1), (13, 2)],
  term ((-126 : Rat) / 5) [(2, 1), (10, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(2, 1), (10, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(2, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11232 : Rat) / 25) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-3264 : Rat) / 25) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(2, 1), (10, 2), (13, 2)],
  term ((-72 : Rat) / 35) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3024 : Rat) / 25) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((1248 : Rat) / 25) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((576 : Rat) / 5) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(2, 1), (11, 1), (13, 1)],
  term ((1008 : Rat) / 5) [(2, 1), (11, 1), (15, 1)],
  term ((-312 : Rat) / 5) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(2, 1), (12, 1)],
  term ((4608 : Rat) / 25) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1476 : Rat) / 25) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 35) [(2, 1), (12, 1), (13, 2)],
  term ((24 : Rat) / 5) [(2, 1), (12, 1), (14, 1)],
  term ((6 : Rat) / 5) [(2, 1), (12, 1), (16, 1)],
  term ((-504 : Rat) / 5) [(2, 1), (13, 1), (15, 1)],
  term ((156 : Rat) / 5) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 35) [(2, 1), (13, 2)],
  term ((63 : Rat) / 5) [(2, 1), (14, 1)],
  term ((4 : Rat) / 5) [(2, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (12, 2), (13, 1)],
  term ((192 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((192 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (10, 2), (13, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1)],
  term ((-24 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((192 : Rat) / 35) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (13, 2)],
  term ((216 : Rat) / 5) [(3, 1), (6, 1), (7, 1)],
  term ((1776 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-888 : Rat) / 35) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1)],
  term ((12 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((36 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((88 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-18 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-44 : Rat) / 5) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term (576 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term (288 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term (-96 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term (-192 : Rat) [(3, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-7488 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term (-288 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term (-144 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term (48 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((3744 : Rat) / 5) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 1100 through 1199. -/
theorem rs_R006_ueqv_R006_block_22_1100_1199_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_22_1100_1199
      rs_R006_ueqv_R006_block_22_1100_1199 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
