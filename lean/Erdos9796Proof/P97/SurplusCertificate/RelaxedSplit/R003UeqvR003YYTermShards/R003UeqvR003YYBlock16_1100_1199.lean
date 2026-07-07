/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 16:1100-1199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_16_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1100 : Poly :=
[
  term ((-4608 : Rat) / 1525) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1100 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1100 : Poly :=
[
  term ((-9216 : Rat) / 1525) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((4608 : Rat) / 1525) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1100_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1100
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1101 : Poly :=
[
  term ((41472 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1101 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1101 : Poly :=
[
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1101_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1101
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1102 : Poly :=
[
  term ((12672 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 1102 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1102 : Poly :=
[
  term ((25344 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-12672 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1102_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1102
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1103 : Poly :=
[
  term ((-10368 : Rat) / 7625) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 1103 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1103 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((10368 : Rat) / 7625) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1103_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1103
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1104 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)]
]

/-- Partial product 1104 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1104 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 3)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1104_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1104
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1105 : Poly :=
[
  term ((65832 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1105 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1105 : Poly :=
[
  term ((-65832 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((131664 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1105_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1105
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1106 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 1), (6, 1), (10, 1), (13, 2)]
]

/-- Partial product 1106 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1106 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 1), (6, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1106_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1106
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1107 : Poly :=
[
  term ((-2496 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1107 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1107 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4992 : Rat) / 10675) [(4, 1), (6, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1107_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1107
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1108 : Poly :=
[
  term ((1872 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1108 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1108 : Poly :=
[
  term ((-1872 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((3744 : Rat) / 10675) [(4, 1), (6, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1108_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1108
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1109 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 1), (6, 1), (13, 2), (14, 1)]
]

/-- Partial product 1109 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1109 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (6, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1109_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1109
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1110 : Poly :=
[
  term ((-1248 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1110 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1110 : Poly :=
[
  term ((-2496 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1248 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1110_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1110
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1111 : Poly :=
[
  term ((27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1111 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1111 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1111_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1111
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1112 : Poly :=
[
  term ((5472 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 1112 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1112 : Poly :=
[
  term ((10944 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1112_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1112
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1113 : Poly :=
[
  term ((2496 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 1113 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1113 : Poly :=
[
  term ((4992 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 2)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1113_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1113
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1114 : Poly :=
[
  term ((6528 : Rat) / 7625) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1114 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1114 : Poly :=
[
  term ((13056 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-6528 : Rat) / 7625) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1114_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1114
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1115 : Poly :=
[
  term ((-22164 : Rat) / 53375) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 1115 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1115 : Poly :=
[
  term ((-44328 : Rat) / 53375) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((22164 : Rat) / 53375) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1115_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1115
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1116 : Poly :=
[
  term ((-4872 : Rat) / 7625) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1116 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1116 : Poly :=
[
  term ((-9744 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((4872 : Rat) / 7625) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1116_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1116
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1117 : Poly :=
[
  term ((-12 : Rat) / 5) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1117 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1117 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1117_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1117
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1118 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 1118 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1118 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1118_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1118
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1119 : Poly :=
[
  term ((367104 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1119 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1119 : Poly :=
[
  term ((734208 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-367104 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1119_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1119
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1120 : Poly :=
[
  term ((-231936 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1120 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1120 : Poly :=
[
  term ((-463872 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((231936 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1120_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1120
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1121 : Poly :=
[
  term ((-12672 : Rat) / 427) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1121 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1121 : Poly :=
[
  term ((-25344 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((12672 : Rat) / 427) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1121_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1121
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1122 : Poly :=
[
  term ((-139968 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1122 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1122 : Poly :=
[
  term ((-279936 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((139968 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1122_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1122
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1123 : Poly :=
[
  term ((-108096 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 1123 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1123 : Poly :=
[
  term ((-216192 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((108096 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1123_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1123
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1124 : Poly :=
[
  term ((1056 : Rat) / 427) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 1124 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1124 : Poly :=
[
  term ((2112 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-1056 : Rat) / 427) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1124_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1124
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1125 : Poly :=
[
  term ((85464 : Rat) / 10675) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1125 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1125 : Poly :=
[
  term ((170928 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-85464 : Rat) / 10675) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1125_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1125
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1126 : Poly :=
[
  term ((151968 : Rat) / 53375) [(4, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1126 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1126 : Poly :=
[
  term ((303936 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-151968 : Rat) / 53375) [(4, 1), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1126_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1126
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1127 : Poly :=
[
  term ((91608 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 1127 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1127 : Poly :=
[
  term ((183216 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-91608 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1127_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1127
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1128 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (9, 2)]
]

/-- Partial product 1128 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1128 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (9, 2)],
  term ((-12 : Rat) / 5) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1128_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1128
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1129 : Poly :=
[
  term ((232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1129 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1129 : Poly :=
[
  term ((464256 : Rat) / 10675) [(4, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1129_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1129
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1130 : Poly :=
[
  term ((-12 : Rat) / 5) [(4, 1), (9, 2), (14, 1)]
]

/-- Partial product 1130 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1130 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1130_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1130
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1131 : Poly :=
[
  term ((528 : Rat) / 427) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1131 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1131 : Poly :=
[
  term ((1056 : Rat) / 427) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1131_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1131
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1132 : Poly :=
[
  term ((-52032 : Rat) / 10675) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 1132 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1132 : Poly :=
[
  term ((-104064 : Rat) / 10675) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((52032 : Rat) / 10675) [(4, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1132_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1132
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1133 : Poly :=
[
  term ((-18192 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1133 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1133 : Poly :=
[
  term ((-36384 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((18192 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1133_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1133
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1134 : Poly :=
[
  term ((4992 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1134 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1134 : Poly :=
[
  term ((9984 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-4992 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1134_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1134
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1135 : Poly :=
[
  term ((41472 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 1135 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1135 : Poly :=
[
  term ((82944 : Rat) / 53375) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-41472 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1135_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1135
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1136 : Poly :=
[
  term ((153408 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)]
]

/-- Partial product 1136 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1136 : Poly :=
[
  term ((306816 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (13, 3)],
  term ((-153408 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1136_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1136
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1137 : Poly :=
[
  term ((54048 : Rat) / 10675) [(4, 1), (11, 2), (13, 2)]
]

/-- Partial product 1137 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1137 : Poly :=
[
  term ((108096 : Rat) / 10675) [(4, 1), (6, 1), (11, 2), (13, 2)],
  term ((-54048 : Rat) / 10675) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1137_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1137
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1138 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (12, 1)]
]

/-- Partial product 1138 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1138 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1138_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1138
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1139 : Poly :=
[
  term ((-699312 : Rat) / 53375) [(4, 1), (12, 1), (13, 2)]
]

/-- Partial product 1139 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1139 : Poly :=
[
  term ((-1398624 : Rat) / 53375) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((699312 : Rat) / 53375) [(4, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1139_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1139
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1140 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1140 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1140 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1140_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1140
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1141 : Poly :=
[
  term ((-12 : Rat) / 5) [(4, 1), (12, 1), (14, 1)]
]

/-- Partial product 1141 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1141 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1141_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1141
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1142 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1142 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1142 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1142_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1142
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1143 : Poly :=
[
  term ((-34164 : Rat) / 7625) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 1143 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1143 : Poly :=
[
  term ((-68328 : Rat) / 7625) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((34164 : Rat) / 7625) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1143_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1143
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1144 : Poly :=
[
  term ((263772 : Rat) / 53375) [(4, 1), (13, 2)]
]

/-- Partial product 1144 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1144 : Poly :=
[
  term ((527544 : Rat) / 53375) [(4, 1), (6, 1), (13, 2)],
  term ((-263772 : Rat) / 53375) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1144_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1144
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1145 : Poly :=
[
  term ((20112 : Rat) / 7625) [(4, 1), (13, 2), (14, 1)]
]

/-- Partial product 1145 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1145 : Poly :=
[
  term ((40224 : Rat) / 7625) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-20112 : Rat) / 7625) [(4, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1145_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1145
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1146 : Poly :=
[
  term ((9 : Rat) / 5) [(4, 1), (14, 1)]
]

/-- Partial product 1146 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1146 : Poly :=
[
  term ((18 : Rat) / 5) [(4, 1), (6, 1), (14, 1)],
  term ((-9 : Rat) / 5) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1146_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1146
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1147 : Poly :=
[
  term ((6 : Rat) / 5) [(4, 1), (15, 2)]
]

/-- Partial product 1147 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1147 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (6, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1147_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1147
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1148 : Poly :=
[
  term ((2304 : Rat) / 1525) [(4, 2), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1148 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1148 : Poly :=
[
  term ((-2304 : Rat) / 1525) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((4608 : Rat) / 1525) [(4, 2), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1148_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1148
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1149 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1149 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1149 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1149_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1149
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1150 : Poly :=
[
  term ((41472 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1150 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1150 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1150_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1150
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1151 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1151 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1151 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1151_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1151
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1152 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 1152 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1152 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1152_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1152
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1153 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 1153 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1153 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1153_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1153
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1154 : Poly :=
[
  term ((-36864 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1154 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1154 : Poly :=
[
  term ((-73728 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1154_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1154
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1155 : Poly :=
[
  term ((12672 : Rat) / 7625) [(4, 2), (7, 1), (13, 1)]
]

/-- Partial product 1155 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1155 : Poly :=
[
  term ((25344 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((-12672 : Rat) / 7625) [(4, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1155_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1155
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1156 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 2), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1156 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1156 : Poly :=
[
  term ((41472 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1156_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1156
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1157 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1157 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1157 : Poly :=
[
  term ((663552 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-331776 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1157_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1157
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1158 : Poly :=
[
  term ((165888 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1158 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1158 : Poly :=
[
  term ((331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1158_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1158
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1159 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 1159 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1159 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1159_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1159
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1160 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 1160 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1160 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1160_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1160
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1161 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1161 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1161 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1161_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1161
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1162 : Poly :=
[
  term ((-101376 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1162 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1162 : Poly :=
[
  term ((-202752 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((101376 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1162_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1162
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1163 : Poly :=
[
  term ((-2304 : Rat) / 1525) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 1163 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1163 : Poly :=
[
  term ((-4608 : Rat) / 1525) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((2304 : Rat) / 1525) [(4, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1163_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1163
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1164 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1164 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1164 : Poly :=
[
  term ((-331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1164_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1164
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1165 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1165 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1165 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1165_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1165
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1166 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)]
]

/-- Partial product 1166 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1166 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (6, 1), (10, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1166_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1166
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1167 : Poly :=
[
  term ((-96768 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1167 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1167 : Poly :=
[
  term ((-193536 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((96768 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1167_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1167
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1168 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1168 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1168 : Poly :=
[
  term ((221184 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1168_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1168
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1169 : Poly :=
[
  term ((-55296 : Rat) / 1525) [(4, 2), (11, 1), (13, 3)]
]

/-- Partial product 1169 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1169 : Poly :=
[
  term ((-110592 : Rat) / 1525) [(4, 2), (6, 1), (11, 1), (13, 3)],
  term ((55296 : Rat) / 1525) [(4, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1169_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1169
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1170 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)]
]

/-- Partial product 1170 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1170 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (11, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1170_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1170
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1171 : Poly :=
[
  term ((41472 : Rat) / 1525) [(4, 2), (12, 1), (13, 2)]
]

/-- Partial product 1171 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1171 : Poly :=
[
  term ((82944 : Rat) / 1525) [(4, 2), (6, 1), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 1525) [(4, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1171_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1171
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1172 : Poly :=
[
  term ((-10368 : Rat) / 7625) [(4, 2), (13, 1), (15, 1)]
]

/-- Partial product 1172 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1172 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(4, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1172_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1172
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1173 : Poly :=
[
  term ((-65664 : Rat) / 7625) [(4, 2), (13, 2)]
]

/-- Partial product 1173 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1173 : Poly :=
[
  term ((-131328 : Rat) / 7625) [(4, 2), (6, 1), (13, 2)],
  term ((65664 : Rat) / 7625) [(4, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1173_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1173
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1174 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 2), (13, 2), (14, 1)]
]

/-- Partial product 1174 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1174 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(4, 2), (6, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1174_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1174
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1175 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (13, 1)]
]

/-- Partial product 1175 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1175 : Poly :=
[
  term ((5472 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (6, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1175_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1175
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1176 : Poly :=
[
  term ((-6528 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 1176 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1176 : Poly :=
[
  term ((6528 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-13056 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1176_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1176
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1177 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1177 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1177 : Poly :=
[
  term ((20736 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1177_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1177
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1178 : Poly :=
[
  term ((-1536 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1178 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1178 : Poly :=
[
  term ((1536 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)],
  term ((-3072 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1178_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1178
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1179 : Poly :=
[
  term ((4872 : Rat) / 7625) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 1179 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1179 : Poly :=
[
  term ((-4872 : Rat) / 7625) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((9744 : Rat) / 7625) [(5, 1), (6, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1179_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1179
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1180 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 1180 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1180 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1180_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1180
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1181 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 1181 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1181 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1181_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1181
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1182 : Poly :=
[
  term ((21888 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1182 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1182 : Poly :=
[
  term ((43776 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1182_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1182
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1183 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1183 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1183 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1183_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1183
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1184 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 1184 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1184 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1184_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1184
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1185 : Poly :=
[
  term ((65664 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 1185 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1185 : Poly :=
[
  term ((131328 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((-65664 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1185_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1185
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1186 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1186 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1186 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1186_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1186
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1187 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 2)]
]

/-- Partial product 1187 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1187 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1187_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1187
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1188 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 1188 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1188 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1188_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1188
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1189 : Poly :=
[
  term ((29184 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 1189 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1189 : Poly :=
[
  term ((58368 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (13, 2)],
  term ((-29184 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1189_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1189
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1190 : Poly :=
[
  term ((-47424 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 1190 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1190 : Poly :=
[
  term ((-94848 : Rat) / 7625) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((47424 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1190_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1190
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1191 : Poly :=
[
  term ((10944 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1191 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1191 : Poly :=
[
  term ((21888 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1191_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1191
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1192 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1192 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1192 : Poly :=
[
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1192_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1192
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1193 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 1193 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1193 : Poly :=
[
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (11, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1193_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1193
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1194 : Poly :=
[
  term ((-39204 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1194 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1194 : Poly :=
[
  term ((-78408 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((39204 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1194_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1194
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1195 : Poly :=
[
  term ((34788 : Rat) / 7625) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1195 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1195 : Poly :=
[
  term ((69576 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-34788 : Rat) / 7625) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1195_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1195
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1196 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1196 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1196 : Poly :=
[
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1196_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1196
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1197 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 1197 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1197 : Poly :=
[
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1197_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1197
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1198 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 1198 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1198 : Poly :=
[
  term ((-82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((41472 : Rat) / 7625) [(5, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1198_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1198
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1199 : Poly :=
[
  term ((41472 : Rat) / 7625) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1199 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1199 : Poly :=
[
  term ((82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1199_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1199
        rs_R003_ueqv_R003YY_generator_16_1100_1199 =
      rs_R003_ueqv_R003YY_partial_16_1199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_16_1100_1199 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_16_1100,
  rs_R003_ueqv_R003YY_partial_16_1101,
  rs_R003_ueqv_R003YY_partial_16_1102,
  rs_R003_ueqv_R003YY_partial_16_1103,
  rs_R003_ueqv_R003YY_partial_16_1104,
  rs_R003_ueqv_R003YY_partial_16_1105,
  rs_R003_ueqv_R003YY_partial_16_1106,
  rs_R003_ueqv_R003YY_partial_16_1107,
  rs_R003_ueqv_R003YY_partial_16_1108,
  rs_R003_ueqv_R003YY_partial_16_1109,
  rs_R003_ueqv_R003YY_partial_16_1110,
  rs_R003_ueqv_R003YY_partial_16_1111,
  rs_R003_ueqv_R003YY_partial_16_1112,
  rs_R003_ueqv_R003YY_partial_16_1113,
  rs_R003_ueqv_R003YY_partial_16_1114,
  rs_R003_ueqv_R003YY_partial_16_1115,
  rs_R003_ueqv_R003YY_partial_16_1116,
  rs_R003_ueqv_R003YY_partial_16_1117,
  rs_R003_ueqv_R003YY_partial_16_1118,
  rs_R003_ueqv_R003YY_partial_16_1119,
  rs_R003_ueqv_R003YY_partial_16_1120,
  rs_R003_ueqv_R003YY_partial_16_1121,
  rs_R003_ueqv_R003YY_partial_16_1122,
  rs_R003_ueqv_R003YY_partial_16_1123,
  rs_R003_ueqv_R003YY_partial_16_1124,
  rs_R003_ueqv_R003YY_partial_16_1125,
  rs_R003_ueqv_R003YY_partial_16_1126,
  rs_R003_ueqv_R003YY_partial_16_1127,
  rs_R003_ueqv_R003YY_partial_16_1128,
  rs_R003_ueqv_R003YY_partial_16_1129,
  rs_R003_ueqv_R003YY_partial_16_1130,
  rs_R003_ueqv_R003YY_partial_16_1131,
  rs_R003_ueqv_R003YY_partial_16_1132,
  rs_R003_ueqv_R003YY_partial_16_1133,
  rs_R003_ueqv_R003YY_partial_16_1134,
  rs_R003_ueqv_R003YY_partial_16_1135,
  rs_R003_ueqv_R003YY_partial_16_1136,
  rs_R003_ueqv_R003YY_partial_16_1137,
  rs_R003_ueqv_R003YY_partial_16_1138,
  rs_R003_ueqv_R003YY_partial_16_1139,
  rs_R003_ueqv_R003YY_partial_16_1140,
  rs_R003_ueqv_R003YY_partial_16_1141,
  rs_R003_ueqv_R003YY_partial_16_1142,
  rs_R003_ueqv_R003YY_partial_16_1143,
  rs_R003_ueqv_R003YY_partial_16_1144,
  rs_R003_ueqv_R003YY_partial_16_1145,
  rs_R003_ueqv_R003YY_partial_16_1146,
  rs_R003_ueqv_R003YY_partial_16_1147,
  rs_R003_ueqv_R003YY_partial_16_1148,
  rs_R003_ueqv_R003YY_partial_16_1149,
  rs_R003_ueqv_R003YY_partial_16_1150,
  rs_R003_ueqv_R003YY_partial_16_1151,
  rs_R003_ueqv_R003YY_partial_16_1152,
  rs_R003_ueqv_R003YY_partial_16_1153,
  rs_R003_ueqv_R003YY_partial_16_1154,
  rs_R003_ueqv_R003YY_partial_16_1155,
  rs_R003_ueqv_R003YY_partial_16_1156,
  rs_R003_ueqv_R003YY_partial_16_1157,
  rs_R003_ueqv_R003YY_partial_16_1158,
  rs_R003_ueqv_R003YY_partial_16_1159,
  rs_R003_ueqv_R003YY_partial_16_1160,
  rs_R003_ueqv_R003YY_partial_16_1161,
  rs_R003_ueqv_R003YY_partial_16_1162,
  rs_R003_ueqv_R003YY_partial_16_1163,
  rs_R003_ueqv_R003YY_partial_16_1164,
  rs_R003_ueqv_R003YY_partial_16_1165,
  rs_R003_ueqv_R003YY_partial_16_1166,
  rs_R003_ueqv_R003YY_partial_16_1167,
  rs_R003_ueqv_R003YY_partial_16_1168,
  rs_R003_ueqv_R003YY_partial_16_1169,
  rs_R003_ueqv_R003YY_partial_16_1170,
  rs_R003_ueqv_R003YY_partial_16_1171,
  rs_R003_ueqv_R003YY_partial_16_1172,
  rs_R003_ueqv_R003YY_partial_16_1173,
  rs_R003_ueqv_R003YY_partial_16_1174,
  rs_R003_ueqv_R003YY_partial_16_1175,
  rs_R003_ueqv_R003YY_partial_16_1176,
  rs_R003_ueqv_R003YY_partial_16_1177,
  rs_R003_ueqv_R003YY_partial_16_1178,
  rs_R003_ueqv_R003YY_partial_16_1179,
  rs_R003_ueqv_R003YY_partial_16_1180,
  rs_R003_ueqv_R003YY_partial_16_1181,
  rs_R003_ueqv_R003YY_partial_16_1182,
  rs_R003_ueqv_R003YY_partial_16_1183,
  rs_R003_ueqv_R003YY_partial_16_1184,
  rs_R003_ueqv_R003YY_partial_16_1185,
  rs_R003_ueqv_R003YY_partial_16_1186,
  rs_R003_ueqv_R003YY_partial_16_1187,
  rs_R003_ueqv_R003YY_partial_16_1188,
  rs_R003_ueqv_R003YY_partial_16_1189,
  rs_R003_ueqv_R003YY_partial_16_1190,
  rs_R003_ueqv_R003YY_partial_16_1191,
  rs_R003_ueqv_R003YY_partial_16_1192,
  rs_R003_ueqv_R003YY_partial_16_1193,
  rs_R003_ueqv_R003YY_partial_16_1194,
  rs_R003_ueqv_R003YY_partial_16_1195,
  rs_R003_ueqv_R003YY_partial_16_1196,
  rs_R003_ueqv_R003YY_partial_16_1197,
  rs_R003_ueqv_R003YY_partial_16_1198,
  rs_R003_ueqv_R003YY_partial_16_1199
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_16_1100_1199 : Poly :=
[
  term ((-9216 : Rat) / 1525) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((25344 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((331776 : Rat) / 7625) [(4, 1), (5, 1), (6, 1), (13, 3)],
  term ((4608 : Rat) / 1525) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12672 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)],
  term ((10368 : Rat) / 7625) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-165888 : Rat) / 7625) [(4, 1), (5, 1), (13, 3)],
  term ((-2496 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((4992 : Rat) / 10675) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 2)],
  term ((13056 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-44328 : Rat) / 53375) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-9744 : Rat) / 7625) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((734208 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-463872 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-25344 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-279936 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-216192 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((2112 : Rat) / 427) [(4, 1), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((170928 : Rat) / 10675) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((303936 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((117384 : Rat) / 53375) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (9, 2)],
  term ((464256 : Rat) / 10675) [(4, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (9, 2), (14, 1)],
  term ((1056 : Rat) / 427) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-326784 : Rat) / 53375) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-33888 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((9984 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((10512 : Rat) / 7625) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((306816 : Rat) / 10675) [(4, 1), (6, 1), (11, 1), (13, 3)],
  term ((108096 : Rat) / 10675) [(4, 1), (6, 1), (11, 2), (13, 2)],
  term ((24 : Rat) / 5) [(4, 1), (6, 1), (12, 1)],
  term ((-1398624 : Rat) / 53375) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (6, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-68328 : Rat) / 7625) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((527544 : Rat) / 53375) [(4, 1), (6, 1), (13, 2)],
  term ((19488 : Rat) / 7625) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((18 : Rat) / 5) [(4, 1), (6, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (6, 1), (15, 2)],
  term ((131664 : Rat) / 53375) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 1), (6, 2), (10, 1), (13, 2)],
  term ((-4992 : Rat) / 10675) [(4, 1), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((3744 : Rat) / 10675) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 1), (6, 2), (13, 2), (14, 1)],
  term ((1248 : Rat) / 10675) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-2496 : Rat) / 10675) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-6528 : Rat) / 7625) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((22164 : Rat) / 53375) [(4, 1), (7, 1), (13, 1)],
  term ((4872 : Rat) / 7625) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (7, 1), (15, 1)],
  term ((-367104 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((231936 : Rat) / 53375) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((12672 : Rat) / 427) [(4, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((139968 : Rat) / 10675) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((108096 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-1056 : Rat) / 427) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((-85464 : Rat) / 10675) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-151968 : Rat) / 53375) [(4, 1), (9, 1), (12, 2), (13, 1)],
  term ((-91608 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (9, 2)],
  term ((-232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((12 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((-528 : Rat) / 427) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((52032 : Rat) / 10675) [(4, 1), (10, 1), (13, 2)],
  term ((18192 : Rat) / 10675) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4992 : Rat) / 10675) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)],
  term ((-153408 : Rat) / 10675) [(4, 1), (11, 1), (13, 3)],
  term ((-54048 : Rat) / 10675) [(4, 1), (11, 2), (13, 2)],
  term ((-12 : Rat) / 5) [(4, 1), (12, 1)],
  term ((699312 : Rat) / 53375) [(4, 1), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 1), (12, 1), (13, 2), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((34164 : Rat) / 7625) [(4, 1), (13, 1), (15, 1)],
  term ((-263772 : Rat) / 53375) [(4, 1), (13, 2)],
  term ((-20112 : Rat) / 7625) [(4, 1), (13, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(4, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(4, 1), (15, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (11, 1), (13, 2)],
  term ((-73728 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((25344 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((663552 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 1), (13, 2)],
  term ((110592 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-202752 : Rat) / 7625) [(4, 2), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-6912 : Rat) / 1525) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(4, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (6, 1), (10, 1), (13, 2)],
  term ((-27648 : Rat) / 1525) [(4, 2), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 1525) [(4, 2), (6, 1), (11, 1), (13, 3)],
  term ((-55296 : Rat) / 7625) [(4, 2), (6, 1), (11, 2), (13, 2)],
  term ((82944 : Rat) / 1525) [(4, 2), (6, 1), (12, 1), (13, 2)],
  term ((-20736 : Rat) / 7625) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-131328 : Rat) / 7625) [(4, 2), (6, 1), (13, 2)],
  term ((-82944 : Rat) / 7625) [(4, 2), (6, 1), (13, 2), (14, 1)],
  term ((4608 : Rat) / 1525) [(4, 2), (6, 2), (9, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (12, 1), (13, 1)],
  term ((82944 : Rat) / 7625) [(4, 2), (6, 2), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((36864 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-12672 : Rat) / 7625) [(4, 2), (7, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-331776 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((101376 : Rat) / 7625) [(4, 2), (9, 1), (12, 2), (13, 1)],
  term ((2304 : Rat) / 1525) [(4, 2), (9, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (10, 1), (13, 2)],
  term ((96768 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (11, 1), (12, 2), (13, 1)],
  term ((55296 : Rat) / 1525) [(4, 2), (11, 1), (13, 3)],
  term ((27648 : Rat) / 7625) [(4, 2), (11, 2), (13, 2)],
  term ((-41472 : Rat) / 1525) [(4, 2), (12, 1), (13, 2)],
  term ((10368 : Rat) / 7625) [(4, 2), (13, 1), (15, 1)],
  term ((65664 : Rat) / 7625) [(4, 2), (13, 2)],
  term ((41472 : Rat) / 7625) [(4, 2), (13, 2), (14, 1)],
  term ((43776 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((131328 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (9, 1), (12, 2), (14, 1)],
  term ((58368 : Rat) / 7625) [(5, 1), (6, 1), (9, 1), (13, 2)],
  term ((-94848 : Rat) / 7625) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((21888 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-16416 : Rat) / 7625) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (6, 1), (11, 1), (13, 2)],
  term ((-14376 : Rat) / 1525) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((90312 : Rat) / 7625) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((82944 : Rat) / 7625) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)],
  term ((-4872 : Rat) / 7625) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (15, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-13056 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (6, 2), (12, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7625) [(5, 1), (6, 2), (13, 1)],
  term ((9744 : Rat) / 7625) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (6, 2), (15, 1)],
  term ((-21888 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (9, 1), (12, 1)],
  term ((-65664 : Rat) / 7625) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((12 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 2)],
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (14, 1)],
  term ((-29184 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)],
  term ((47424 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (11, 1), (13, 2)],
  term ((39204 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)],
  term ((-34788 : Rat) / 7625) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (12, 1), (15, 1)],
  term ((41472 : Rat) / 7625) [(5, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 1100 through 1199. -/
theorem rs_R003_ueqv_R003YY_block_16_1100_1199_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_16_1100_1199
      rs_R003_ueqv_R003YY_block_16_1100_1199 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
