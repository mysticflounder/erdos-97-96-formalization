/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 28:1100-1158

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1100 : Poly :=
[
  term ((141312 : Rat) / 32699) [(11, 3), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1100 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1100 : Poly :=
[
  term ((-141312 : Rat) / 32699) [(11, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((282624 : Rat) / 32699) [(11, 3), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1100_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1100
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1101 : Poly :=
[
  term ((-372064704 : Rat) / 33189485) [(11, 3), (13, 2), (15, 1)]
]

/-- Partial product 1101 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1101 : Poly :=
[
  term ((-744129408 : Rat) / 33189485) [(11, 3), (13, 2), (14, 1), (15, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1101_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1101
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1102 : Poly :=
[
  term ((70656 : Rat) / 32699) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1102 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1102 : Poly :=
[
  term ((141312 : Rat) / 32699) [(11, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1102_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1102
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1103 : Poly :=
[
  term ((-93016176 : Rat) / 33189485) [(11, 3), (14, 1), (15, 1)]
]

/-- Partial product 1103 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1103 : Poly :=
[
  term ((93016176 : Rat) / 33189485) [(11, 3), (14, 1), (15, 1)],
  term ((-186032352 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1103_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1103
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1104 : Poly :=
[
  term ((17664 : Rat) / 32699) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1104 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1104 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((35328 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1104_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1104
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1105 : Poly :=
[
  term ((-139524264 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 1105 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1105 : Poly :=
[
  term ((-279048528 : Rat) / 33189485) [(11, 3), (14, 1), (15, 1)],
  term ((139524264 : Rat) / 33189485) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1105_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1105
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1106 : Poly :=
[
  term ((26496 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 1106 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1106 : Poly :=
[
  term ((52992 : Rat) / 32699) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-26496 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1106_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1106
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1107 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 1107 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1107 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(11, 3), (14, 1), (15, 3)],
  term ((-124021568 : Rat) / 33189485) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1107_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1107
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1108 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 1108 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1108 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(11, 3), (14, 1), (15, 3), (16, 1)],
  term ((23552 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1108_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1108
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1109 : Poly :=
[
  term ((-119 : Rat) / 64) [(12, 1)]
]

/-- Partial product 1109 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1109 : Poly :=
[
  term ((119 : Rat) / 64) [(12, 1)],
  term ((-119 : Rat) / 32) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1109_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1109
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1110 : Poly :=
[
  term ((-1595609397 : Rat) / 33189485) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1110 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1110 : Poly :=
[
  term ((1595609397 : Rat) / 33189485) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3191218794 : Rat) / 33189485) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1110_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1110
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1111 : Poly :=
[
  term ((318280 : Rat) / 32699) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1111 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1111 : Poly :=
[
  term ((-318280 : Rat) / 32699) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((636560 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1111_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1111
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1112 : Poly :=
[
  term ((2880934558853 : Rat) / 637238112) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1112 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1112 : Poly :=
[
  term ((2880934558853 : Rat) / 318619056) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2880934558853 : Rat) / 637238112) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1112_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1112
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1113 : Poly :=
[
  term ((-342451979 : Rat) / 392388) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1113 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1113 : Poly :=
[
  term ((-342451979 : Rat) / 196194) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((342451979 : Rat) / 392388) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1113_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1113
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1114 : Poly :=
[
  term ((-525959019343 : Rat) / 199136910) [(12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1114 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1114 : Poly :=
[
  term ((-525959019343 : Rat) / 99568455) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((525959019343 : Rat) / 199136910) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1114_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1114
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1115 : Poly :=
[
  term ((49910882 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1115 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1115 : Poly :=
[
  term ((99821764 : Rat) / 98097) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-49910882 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1115_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1115
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1116 : Poly :=
[
  term ((123 : Rat) / 40) [(12, 1), (13, 2)]
]

/-- Partial product 1116 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1116 : Poly :=
[
  term ((-123 : Rat) / 40) [(12, 1), (13, 2)],
  term ((123 : Rat) / 20) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1116_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1116
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1117 : Poly :=
[
  term ((123 : Rat) / 20) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1117 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1117 : Poly :=
[
  term ((-123 : Rat) / 20) [(12, 1), (13, 2), (14, 1)],
  term ((123 : Rat) / 10) [(12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1117_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1117
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1118 : Poly :=
[
  term ((2657672048 : Rat) / 6637897) [(12, 1), (13, 2), (15, 2)]
]

/-- Partial product 1118 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1118 : Poly :=
[
  term ((5315344096 : Rat) / 6637897) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-2657672048 : Rat) / 6637897) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1118_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1118
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1119 : Poly :=
[
  term ((-2541600 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1119 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1119 : Poly :=
[
  term ((-5083200 : Rat) / 32699) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2541600 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1119_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1119
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1120 : Poly :=
[
  term ((469 : Rat) / 160) [(12, 1), (14, 1)]
]

/-- Partial product 1120 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1120 : Poly :=
[
  term ((-469 : Rat) / 160) [(12, 1), (14, 1)],
  term ((469 : Rat) / 80) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1120_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1120
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1121 : Poly :=
[
  term ((-118567508091 : Rat) / 1062063520) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1121 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1121 : Poly :=
[
  term ((118567508091 : Rat) / 1062063520) [(12, 1), (14, 1), (15, 2)],
  term ((-118567508091 : Rat) / 531031760) [(12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1121_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1121
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1122 : Poly :=
[
  term ((2831621 : Rat) / 130796) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1122 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1122 : Poly :=
[
  term ((-2831621 : Rat) / 130796) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2831621 : Rat) / 65398) [(12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1122_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1122
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1123 : Poly :=
[
  term ((-765202063683 : Rat) / 212412704) [(12, 1), (15, 2)]
]

/-- Partial product 1123 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1123 : Poly :=
[
  term ((-765202063683 : Rat) / 106206352) [(12, 1), (14, 1), (15, 2)],
  term ((765202063683 : Rat) / 212412704) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1123_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1123
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1124 : Poly :=
[
  term ((274700011 : Rat) / 392388) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1124 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1124 : Poly :=
[
  term ((274700011 : Rat) / 196194) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-274700011 : Rat) / 392388) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1124_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1124
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1125 : Poly :=
[
  term ((1546339601777 : Rat) / 1593095280) [(12, 1), (15, 4)]
]

/-- Partial product 1125 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1125 : Poly :=
[
  term ((1546339601777 : Rat) / 796547640) [(12, 1), (14, 1), (15, 4)],
  term ((-1546339601777 : Rat) / 1593095280) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1125_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1125
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1126 : Poly :=
[
  term ((-12320261 : Rat) / 65398) [(12, 1), (15, 4), (16, 1)]
]

/-- Partial product 1126 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1126 : Poly :=
[
  term ((-12320261 : Rat) / 32699) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((12320261 : Rat) / 65398) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1126_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1126
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1127 : Poly :=
[
  term ((-579 : Rat) / 80) [(12, 2)]
]

/-- Partial product 1127 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1127 : Poly :=
[
  term ((579 : Rat) / 80) [(12, 2)],
  term ((-579 : Rat) / 40) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1127_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1127
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1128 : Poly :=
[
  term ((-416734466689 : Rat) / 265515880) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1128 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1128 : Poly :=
[
  term ((-416734466689 : Rat) / 132757940) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((416734466689 : Rat) / 265515880) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1128_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1128
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1129 : Poly :=
[
  term ((9891583 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1129 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1129 : Poly :=
[
  term ((19783166 : Rat) / 32699) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9891583 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1129_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1129
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1130 : Poly :=
[
  term ((-123 : Rat) / 80) [(12, 2), (14, 1)]
]

/-- Partial product 1130 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1130 : Poly :=
[
  term ((123 : Rat) / 80) [(12, 2), (14, 1)],
  term ((-123 : Rat) / 40) [(12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1130_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1130
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1131 : Poly :=
[
  term ((38528683419 : Rat) / 27949040) [(12, 2), (15, 2)]
]

/-- Partial product 1131 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1131 : Poly :=
[
  term ((38528683419 : Rat) / 13974520) [(12, 2), (14, 1), (15, 2)],
  term ((-38528683419 : Rat) / 27949040) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1131_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1131
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1132 : Poly :=
[
  term ((-922037 : Rat) / 3442) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1132 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1132 : Poly :=
[
  term ((-922037 : Rat) / 1721) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((922037 : Rat) / 3442) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1132_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1132
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1133 : Poly :=
[
  term ((123 : Rat) / 40) [(12, 3)]
]

/-- Partial product 1133 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1133 : Poly :=
[
  term ((-123 : Rat) / 40) [(12, 3)],
  term ((123 : Rat) / 20) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1133_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1133
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1134 : Poly :=
[
  term ((-372211283533 : Rat) / 455170080) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1134 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1134 : Poly :=
[
  term ((372211283533 : Rat) / 455170080) [(13, 1), (14, 1), (15, 1)],
  term ((-372211283533 : Rat) / 227585040) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1134_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1134
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1135 : Poly :=
[
  term ((61368073 : Rat) / 392388) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1135 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1135 : Poly :=
[
  term ((-61368073 : Rat) / 392388) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61368073 : Rat) / 196194) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1135_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1135
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1136 : Poly :=
[
  term ((-1546339601777 : Rat) / 1593095280) [(13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1136 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1136 : Poly :=
[
  term ((1546339601777 : Rat) / 1593095280) [(13, 1), (14, 1), (15, 3)],
  term ((-1546339601777 : Rat) / 796547640) [(13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1136_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1136
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1137 : Poly :=
[
  term ((12320261 : Rat) / 65398) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1137 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1137 : Poly :=
[
  term ((-12320261 : Rat) / 65398) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((12320261 : Rat) / 32699) [(13, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1137_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1137
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1138 : Poly :=
[
  term ((-9854731693787 : Rat) / 6372381120) [(13, 1), (15, 1)]
]

/-- Partial product 1138 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1138 : Poly :=
[
  term ((-9854731693787 : Rat) / 3186190560) [(13, 1), (14, 1), (15, 1)],
  term ((9854731693787 : Rat) / 6372381120) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1138_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1138
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1139 : Poly :=
[
  term ((234006065 : Rat) / 784776) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1139 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1139 : Poly :=
[
  term ((234006065 : Rat) / 392388) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-234006065 : Rat) / 784776) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1139_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1139
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1140 : Poly :=
[
  term ((1980601675727 : Rat) / 637238112) [(13, 1), (15, 3)]
]

/-- Partial product 1140 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1140 : Poly :=
[
  term ((1980601675727 : Rat) / 318619056) [(13, 1), (14, 1), (15, 3)],
  term ((-1980601675727 : Rat) / 637238112) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1140_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1140
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1141 : Poly :=
[
  term ((-235781005 : Rat) / 392388) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1141 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1141 : Poly :=
[
  term ((-235781005 : Rat) / 196194) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((235781005 : Rat) / 392388) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1141_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1141
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1142 : Poly :=
[
  term ((57 : Rat) / 16) [(13, 2)]
]

/-- Partial product 1142 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1142 : Poly :=
[
  term ((-57 : Rat) / 16) [(13, 2)],
  term ((57 : Rat) / 8) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1142_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1142
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1143 : Poly :=
[
  term ((121 : Rat) / 40) [(13, 2), (14, 1)]
]

/-- Partial product 1143 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1143 : Poly :=
[
  term ((-121 : Rat) / 40) [(13, 2), (14, 1)],
  term ((121 : Rat) / 20) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1143_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1143
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1144 : Poly :=
[
  term ((525959019343 : Rat) / 199136910) [(13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1144 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1144 : Poly :=
[
  term ((-525959019343 : Rat) / 199136910) [(13, 2), (14, 1), (15, 2)],
  term ((525959019343 : Rat) / 99568455) [(13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1144_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1144
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1145 : Poly :=
[
  term ((-49910882 : Rat) / 98097) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1145 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1145 : Poly :=
[
  term ((49910882 : Rat) / 98097) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-99821764 : Rat) / 98097) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1145_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1145
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1146 : Poly :=
[
  term ((-688967661779 : Rat) / 398273820) [(13, 2), (15, 2)]
]

/-- Partial product 1146 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1146 : Poly :=
[
  term ((-688967661779 : Rat) / 199136910) [(13, 2), (14, 1), (15, 2)],
  term ((688967661779 : Rat) / 398273820) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1146_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1146
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1147 : Poly :=
[
  term ((32745155 : Rat) / 98097) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1147 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1147 : Poly :=
[
  term ((65490310 : Rat) / 98097) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-32745155 : Rat) / 98097) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1147_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1147
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1148 : Poly :=
[
  term ((-2657672048 : Rat) / 6637897) [(13, 3), (14, 1), (15, 1)]
]

/-- Partial product 1148 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1148 : Poly :=
[
  term ((2657672048 : Rat) / 6637897) [(13, 3), (14, 1), (15, 1)],
  term ((-5315344096 : Rat) / 6637897) [(13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1148_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1148
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1149 : Poly :=
[
  term ((2541600 : Rat) / 32699) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1149 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1149 : Poly :=
[
  term ((-2541600 : Rat) / 32699) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((5083200 : Rat) / 32699) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1149_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1149
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1150 : Poly :=
[
  term ((-1328836024 : Rat) / 6637897) [(13, 3), (15, 1)]
]

/-- Partial product 1150 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1150 : Poly :=
[
  term ((-2657672048 : Rat) / 6637897) [(13, 3), (14, 1), (15, 1)],
  term ((1328836024 : Rat) / 6637897) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1150_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1150
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1151 : Poly :=
[
  term ((1270800 : Rat) / 32699) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1151 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1151 : Poly :=
[
  term ((2541600 : Rat) / 32699) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1270800 : Rat) / 32699) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1151_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1151
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1152 : Poly :=
[
  term ((11 : Rat) / 80) [(14, 1)]
]

/-- Partial product 1152 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1152 : Poly :=
[
  term ((-11 : Rat) / 80) [(14, 1)],
  term ((11 : Rat) / 40) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1152_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1152
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1153 : Poly :=
[
  term ((868271907191 : Rat) / 1274476224) [(14, 1), (15, 2)]
]

/-- Partial product 1153 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1153 : Poly :=
[
  term ((-868271907191 : Rat) / 1274476224) [(14, 1), (15, 2)],
  term ((868271907191 : Rat) / 637238112) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1153_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1153
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1154 : Poly :=
[
  term ((-34588623 : Rat) / 261592) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1154 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1154 : Poly :=
[
  term ((34588623 : Rat) / 261592) [(14, 1), (15, 2), (16, 1)],
  term ((-34588623 : Rat) / 130796) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1154_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1154
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1155 : Poly :=
[
  term ((4768664022621 : Rat) / 4248254080) [(15, 2)]
]

/-- Partial product 1155 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1155 : Poly :=
[
  term ((4768664022621 : Rat) / 2124127040) [(14, 1), (15, 2)],
  term ((-4768664022621 : Rat) / 4248254080) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1155_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1155
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1156 : Poly :=
[
  term ((-344204041 : Rat) / 1569552) [(15, 2), (16, 1)]
]

/-- Partial product 1156 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1156 : Poly :=
[
  term ((-344204041 : Rat) / 784776) [(14, 1), (15, 2), (16, 1)],
  term ((344204041 : Rat) / 1569552) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1156_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1156
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1157 : Poly :=
[
  term ((-713886046843 : Rat) / 796547640) [(15, 4)]
]

/-- Partial product 1157 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1157 : Poly :=
[
  term ((-713886046843 : Rat) / 398273820) [(14, 1), (15, 4)],
  term ((713886046843 : Rat) / 796547640) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1157_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1157
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_1158 : Poly :=
[
  term ((17064581 : Rat) / 98097) [(15, 4), (16, 1)]
]

/-- Partial product 1158 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_1158 : Poly :=
[
  term ((34129162 : Rat) / 98097) [(14, 1), (15, 4), (16, 1)],
  term ((-17064581 : Rat) / 98097) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_1158_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_1158
        rs_R009_ueqv_R009NYYYY_generator_28_1100_1158 =
      rs_R009_ueqv_R009NYYYY_partial_28_1158 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_28_1100_1158 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_28_1100,
  rs_R009_ueqv_R009NYYYY_partial_28_1101,
  rs_R009_ueqv_R009NYYYY_partial_28_1102,
  rs_R009_ueqv_R009NYYYY_partial_28_1103,
  rs_R009_ueqv_R009NYYYY_partial_28_1104,
  rs_R009_ueqv_R009NYYYY_partial_28_1105,
  rs_R009_ueqv_R009NYYYY_partial_28_1106,
  rs_R009_ueqv_R009NYYYY_partial_28_1107,
  rs_R009_ueqv_R009NYYYY_partial_28_1108,
  rs_R009_ueqv_R009NYYYY_partial_28_1109,
  rs_R009_ueqv_R009NYYYY_partial_28_1110,
  rs_R009_ueqv_R009NYYYY_partial_28_1111,
  rs_R009_ueqv_R009NYYYY_partial_28_1112,
  rs_R009_ueqv_R009NYYYY_partial_28_1113,
  rs_R009_ueqv_R009NYYYY_partial_28_1114,
  rs_R009_ueqv_R009NYYYY_partial_28_1115,
  rs_R009_ueqv_R009NYYYY_partial_28_1116,
  rs_R009_ueqv_R009NYYYY_partial_28_1117,
  rs_R009_ueqv_R009NYYYY_partial_28_1118,
  rs_R009_ueqv_R009NYYYY_partial_28_1119,
  rs_R009_ueqv_R009NYYYY_partial_28_1120,
  rs_R009_ueqv_R009NYYYY_partial_28_1121,
  rs_R009_ueqv_R009NYYYY_partial_28_1122,
  rs_R009_ueqv_R009NYYYY_partial_28_1123,
  rs_R009_ueqv_R009NYYYY_partial_28_1124,
  rs_R009_ueqv_R009NYYYY_partial_28_1125,
  rs_R009_ueqv_R009NYYYY_partial_28_1126,
  rs_R009_ueqv_R009NYYYY_partial_28_1127,
  rs_R009_ueqv_R009NYYYY_partial_28_1128,
  rs_R009_ueqv_R009NYYYY_partial_28_1129,
  rs_R009_ueqv_R009NYYYY_partial_28_1130,
  rs_R009_ueqv_R009NYYYY_partial_28_1131,
  rs_R009_ueqv_R009NYYYY_partial_28_1132,
  rs_R009_ueqv_R009NYYYY_partial_28_1133,
  rs_R009_ueqv_R009NYYYY_partial_28_1134,
  rs_R009_ueqv_R009NYYYY_partial_28_1135,
  rs_R009_ueqv_R009NYYYY_partial_28_1136,
  rs_R009_ueqv_R009NYYYY_partial_28_1137,
  rs_R009_ueqv_R009NYYYY_partial_28_1138,
  rs_R009_ueqv_R009NYYYY_partial_28_1139,
  rs_R009_ueqv_R009NYYYY_partial_28_1140,
  rs_R009_ueqv_R009NYYYY_partial_28_1141,
  rs_R009_ueqv_R009NYYYY_partial_28_1142,
  rs_R009_ueqv_R009NYYYY_partial_28_1143,
  rs_R009_ueqv_R009NYYYY_partial_28_1144,
  rs_R009_ueqv_R009NYYYY_partial_28_1145,
  rs_R009_ueqv_R009NYYYY_partial_28_1146,
  rs_R009_ueqv_R009NYYYY_partial_28_1147,
  rs_R009_ueqv_R009NYYYY_partial_28_1148,
  rs_R009_ueqv_R009NYYYY_partial_28_1149,
  rs_R009_ueqv_R009NYYYY_partial_28_1150,
  rs_R009_ueqv_R009NYYYY_partial_28_1151,
  rs_R009_ueqv_R009NYYYY_partial_28_1152,
  rs_R009_ueqv_R009NYYYY_partial_28_1153,
  rs_R009_ueqv_R009NYYYY_partial_28_1154,
  rs_R009_ueqv_R009NYYYY_partial_28_1155,
  rs_R009_ueqv_R009NYYYY_partial_28_1156,
  rs_R009_ueqv_R009NYYYY_partial_28_1157,
  rs_R009_ueqv_R009NYYYY_partial_28_1158
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_28_1100_1158 : Poly :=
[
  term ((-744129408 : Rat) / 33189485) [(11, 3), (13, 2), (14, 1), (15, 1)],
  term ((282624 : Rat) / 32699) [(11, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (13, 2), (15, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-186032352 : Rat) / 33189485) [(11, 3), (14, 1), (15, 1)],
  term ((35328 : Rat) / 32699) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(11, 3), (14, 1), (15, 3)],
  term ((-47104 : Rat) / 32699) [(11, 3), (14, 1), (15, 3), (16, 1)],
  term ((-186032352 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)],
  term ((35328 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((139524264 : Rat) / 33189485) [(11, 3), (15, 1)],
  term ((-26496 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(11, 3), (15, 3)],
  term ((23552 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((119 : Rat) / 64) [(12, 1)],
  term ((14481262045321 : Rat) / 1593095280) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-344361659 : Rat) / 196194) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-525959019343 : Rat) / 99568455) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((99821764 : Rat) / 98097) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3191218794 : Rat) / 33189485) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((636560 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2880934558853 : Rat) / 637238112) [(12, 1), (13, 1), (15, 1)],
  term ((342451979 : Rat) / 392388) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((525959019343 : Rat) / 199136910) [(12, 1), (13, 1), (15, 3)],
  term ((-49910882 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-123 : Rat) / 40) [(12, 1), (13, 2)],
  term ((5315344096 : Rat) / 6637897) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-5083200 : Rat) / 32699) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((123 : Rat) / 10) [(12, 1), (13, 2), (14, 2)],
  term ((-2657672048 : Rat) / 6637897) [(12, 1), (13, 2), (15, 2)],
  term ((2541600 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-133 : Rat) / 20) [(12, 1), (14, 1)],
  term ((-7533453128739 : Rat) / 1062063520) [(12, 1), (14, 1), (15, 2)],
  term ((540905159 : Rat) / 392388) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1546339601777 : Rat) / 796547640) [(12, 1), (14, 1), (15, 4)],
  term ((-12320261 : Rat) / 32699) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((469 : Rat) / 80) [(12, 1), (14, 2)],
  term ((-118567508091 : Rat) / 531031760) [(12, 1), (14, 2), (15, 2)],
  term ((2831621 : Rat) / 65398) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((765202063683 : Rat) / 212412704) [(12, 1), (15, 2)],
  term ((-274700011 : Rat) / 392388) [(12, 1), (15, 2), (16, 1)],
  term ((-1546339601777 : Rat) / 1593095280) [(12, 1), (15, 4)],
  term ((12320261 : Rat) / 65398) [(12, 1), (15, 4), (16, 1)],
  term ((579 : Rat) / 80) [(12, 2)],
  term ((-416734466689 : Rat) / 132757940) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((19783166 : Rat) / 32699) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416734466689 : Rat) / 265515880) [(12, 2), (13, 1), (15, 1)],
  term ((-9891583 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-207 : Rat) / 16) [(12, 2), (14, 1)],
  term ((38528683419 : Rat) / 13974520) [(12, 2), (14, 1), (15, 2)],
  term ((-922037 : Rat) / 1721) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-123 : Rat) / 40) [(12, 2), (14, 2)],
  term ((-38528683419 : Rat) / 27949040) [(12, 2), (15, 2)],
  term ((922037 : Rat) / 3442) [(12, 2), (15, 2), (16, 1)],
  term ((-123 : Rat) / 40) [(12, 3)],
  term ((123 : Rat) / 20) [(12, 3), (14, 1)],
  term ((-226539147158 : Rat) / 99568455) [(13, 1), (14, 1), (15, 1)],
  term ((43159498 : Rat) / 98097) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((954112331701 : Rat) / 132757940) [(13, 1), (14, 1), (15, 3)],
  term ((-136370894 : Rat) / 98097) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-372211283533 : Rat) / 227585040) [(13, 1), (14, 2), (15, 1)],
  term ((61368073 : Rat) / 196194) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1546339601777 : Rat) / 796547640) [(13, 1), (14, 2), (15, 3)],
  term ((12320261 : Rat) / 32699) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((9854731693787 : Rat) / 6372381120) [(13, 1), (15, 1)],
  term ((-234006065 : Rat) / 784776) [(13, 1), (15, 1), (16, 1)],
  term ((-1980601675727 : Rat) / 637238112) [(13, 1), (15, 3)],
  term ((235781005 : Rat) / 392388) [(13, 1), (15, 3), (16, 1)],
  term ((-57 : Rat) / 16) [(13, 2)],
  term ((41 : Rat) / 10) [(13, 2), (14, 1)],
  term ((-28926825741 : Rat) / 4741355) [(13, 2), (14, 1), (15, 2)],
  term ((38467064 : Rat) / 32699) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((121 : Rat) / 20) [(13, 2), (14, 2)],
  term ((525959019343 : Rat) / 99568455) [(13, 2), (14, 2), (15, 2)],
  term ((-99821764 : Rat) / 98097) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((688967661779 : Rat) / 398273820) [(13, 2), (15, 2)],
  term ((-32745155 : Rat) / 98097) [(13, 2), (15, 2), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(13, 3), (14, 2), (15, 1)],
  term ((5083200 : Rat) / 32699) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 6637897) [(13, 3), (15, 1)],
  term ((-1270800 : Rat) / 32699) [(13, 3), (15, 1), (16, 1)],
  term ((-11 : Rat) / 80) [(14, 1)],
  term ((2491158132977 : Rat) / 1593095280) [(14, 1), (15, 2)],
  term ((-60109543 : Rat) / 196194) [(14, 1), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 398273820) [(14, 1), (15, 4)],
  term ((34129162 : Rat) / 98097) [(14, 1), (15, 4), (16, 1)],
  term ((11 : Rat) / 40) [(14, 2)],
  term ((868271907191 : Rat) / 637238112) [(14, 2), (15, 2)],
  term ((-34588623 : Rat) / 130796) [(14, 2), (15, 2), (16, 1)],
  term ((-4768664022621 : Rat) / 4248254080) [(15, 2)],
  term ((344204041 : Rat) / 1569552) [(15, 2), (16, 1)],
  term ((713886046843 : Rat) / 796547640) [(15, 4)],
  term ((-17064581 : Rat) / 98097) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1100 through 1158. -/
theorem rs_R009_ueqv_R009NYYYY_block_28_1100_1158_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_28_1100_1158
      rs_R009_ueqv_R009NYYYY_block_28_1100_1158 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
