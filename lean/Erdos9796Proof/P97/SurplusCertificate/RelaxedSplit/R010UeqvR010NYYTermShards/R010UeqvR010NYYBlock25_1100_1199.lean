/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 25:1100-1199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_25_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1100 : Poly :=
[
  term ((262673491014887 : Rat) / 1278359066951232) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1100 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1100 : Poly :=
[
  term ((262673491014887 : Rat) / 639179533475616) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-262673491014887 : Rat) / 1278359066951232) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1100_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1100
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1101 : Poly :=
[
  term ((3957595883125165719 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1101 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1101 : Poly :=
[
  term ((3957595883125165719 : Rat) / 23862702583089664) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3957595883125165719 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1101_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1101
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1102 : Poly :=
[
  term ((4669386214254033709 : Rat) / 286352430997075968) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1102 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1102 : Poly :=
[
  term ((4669386214254033709 : Rat) / 143176215498537984) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4669386214254033709 : Rat) / 286352430997075968) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1102_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1102
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1103 : Poly :=
[
  term ((167015408479822159 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1103 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1103 : Poly :=
[
  term ((167015408479822159 : Rat) / 2982837822886208) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-167015408479822159 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1103_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1103
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1104 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1104 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1104 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1104_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1104
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1105 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1105 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1105 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 131617718934853928) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1105_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1105
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1106 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1106 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1106 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1106_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1106
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1107 : Poly :=
[
  term ((-23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1107 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1107 : Poly :=
[
  term ((-23088038262747441 : Rat) / 186427363930388) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1107_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1107
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1108 : Poly :=
[
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1108 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1108 : Poly :=
[
  term ((1952880645780243182111 : Rat) / 12635301017745977088) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1108_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1108
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1109 : Poly :=
[
  term ((28593968989313602614325 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1109 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1109 : Poly :=
[
  term ((28593968989313602614325 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28593968989313602614325 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1109_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1109
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1110 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 1110 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1110 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1110_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1110
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1111 : Poly :=
[
  term ((104711860146981725 : Rat) / 5965675645772416) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1111 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1111 : Poly :=
[
  term ((104711860146981725 : Rat) / 2982837822886208) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 5965675645772416) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1111_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1111
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1112 : Poly :=
[
  term ((148618339734873 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1112 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1112 : Poly :=
[
  term ((148618339734873 : Rat) / 852239377967488) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-148618339734873 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1112_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1112
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1113 : Poly :=
[
  term ((790370787803414481 : Rat) / 47725405166179328) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1113 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1113 : Poly :=
[
  term ((790370787803414481 : Rat) / 23862702583089664) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-790370787803414481 : Rat) / 47725405166179328) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1113_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1113
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1114 : Poly :=
[
  term ((-12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 1114 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1114 : Poly :=
[
  term ((-12189839642686807 : Rat) / 5113436267804928) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1114_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1114
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1115 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)]
]

/-- Partial product 1115 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1115 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1115_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1115
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1116 : Poly :=
[
  term ((1006155787278076888097 : Rat) / 12635301017745977088) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1116 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1116 : Poly :=
[
  term ((-1006155787278076888097 : Rat) / 12635301017745977088) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1006155787278076888097 : Rat) / 6317650508872988544) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1116_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1116
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1117 : Poly :=
[
  term ((-2362877370809801204651 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1117 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1117 : Poly :=
[
  term ((-2362877370809801204651 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2362877370809801204651 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1117_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1117
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1118 : Poly :=
[
  term ((-101644522824340659 : Rat) / 11931351291544832) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1118 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1118 : Poly :=
[
  term ((-101644522824340659 : Rat) / 5965675645772416) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 11931351291544832) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1118_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1118
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1119 : Poly :=
[
  term ((-4242570429073431245729 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1119 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1119 : Poly :=
[
  term ((-4242570429073431245729 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4242570429073431245729 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1119_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1119
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1120 : Poly :=
[
  term ((-3857480708782319794471 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1120 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1120 : Poly :=
[
  term ((-3857480708782319794471 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3857480708782319794471 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1120_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1120
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1121 : Poly :=
[
  term ((1234724681917854108621 : Rat) / 4813448006760372224) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1121 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1121 : Poly :=
[
  term ((1234724681917854108621 : Rat) / 2406724003380186112) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1234724681917854108621 : Rat) / 4813448006760372224) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1121_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1121
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1122 : Poly :=
[
  term ((1150030796077686731 : Rat) / 23862702583089664) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1122 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1122 : Poly :=
[
  term ((1150030796077686731 : Rat) / 11931351291544832) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1150030796077686731 : Rat) / 23862702583089664) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1122_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1122
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1123 : Poly :=
[
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1123 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1123 : Poly :=
[
  term ((-833860523506862349991 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((833860523506862349991 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1123_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1123
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1124 : Poly :=
[
  term ((-65855947153978413377 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1124 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1124 : Poly :=
[
  term ((-65855947153978413377 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((65855947153978413377 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1124_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1124
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1125 : Poly :=
[
  term ((34020392351833734492559 : Rat) / 151623612212951725056) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1125 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1125 : Poly :=
[
  term ((34020392351833734492559 : Rat) / 75811806106475862528) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-34020392351833734492559 : Rat) / 151623612212951725056) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1125_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1125
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1126 : Poly :=
[
  term ((-148984597459078057437 : Rat) / 2105883502957662848) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 1126 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1126 : Poly :=
[
  term ((-148984597459078057437 : Rat) / 1052941751478831424) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((148984597459078057437 : Rat) / 2105883502957662848) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1126_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1126
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1127 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

/-- Partial product 1127 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1127 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1127_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1127
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1128 : Poly :=
[
  term ((16307084115370483 : Rat) / 1255931714899456) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1128 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1128 : Poly :=
[
  term ((-16307084115370483 : Rat) / 1255931714899456) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((16307084115370483 : Rat) / 627965857449728) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1128_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1128
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1129 : Poly :=
[
  term ((-45043032468617529 : Rat) / 23862702583089664) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1129 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1129 : Poly :=
[
  term ((-45043032468617529 : Rat) / 11931351291544832) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45043032468617529 : Rat) / 23862702583089664) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1129_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1129
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1130 : Poly :=
[
  term ((-13678579747479021 : Rat) / 745709455721552) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1130 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1130 : Poly :=
[
  term ((-13678579747479021 : Rat) / 372854727860776) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13678579747479021 : Rat) / 745709455721552) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1130_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1130
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1131 : Poly :=
[
  term ((-16549472857713853 : Rat) / 1491418911443104) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1131 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1131 : Poly :=
[
  term ((-16549472857713853 : Rat) / 745709455721552) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((16549472857713853 : Rat) / 1491418911443104) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1131_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1131
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1132 : Poly :=
[
  term ((-1366513052354917 : Rat) / 4382945372404224) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 1132 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1132 : Poly :=
[
  term ((-1366513052354917 : Rat) / 2191472686202112) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1366513052354917 : Rat) / 4382945372404224) [(8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1132_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1132
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1133 : Poly :=
[
  term ((10919697092052990877 : Rat) / 143176215498537984) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1133 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1133 : Poly :=
[
  term ((10919697092052990877 : Rat) / 71588107749268992) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10919697092052990877 : Rat) / 143176215498537984) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1133_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1133
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1134 : Poly :=
[
  term ((-135928594573005967 : Rat) / 61361235213659136) [(8, 1), (16, 1)]
]

/-- Partial product 1134 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1134 : Poly :=
[
  term ((-135928594573005967 : Rat) / 30680617606829568) [(8, 1), (12, 1), (16, 1)],
  term ((135928594573005967 : Rat) / 61361235213659136) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1134_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1134
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1135 : Poly :=
[
  term ((3157579497405045811529 : Rat) / 37905903053237931264) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1135 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1135 : Poly :=
[
  term ((3157579497405045811529 : Rat) / 18952951526618965632) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3157579497405045811529 : Rat) / 37905903053237931264) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1135_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1135
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1136 : Poly :=
[
  term ((-8939487312665387828669 : Rat) / 18952951526618965632) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1136 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1136 : Poly :=
[
  term ((-8939487312665387828669 : Rat) / 9476475763309482816) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8939487312665387828669 : Rat) / 18952951526618965632) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1136_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1136
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1137 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(8, 2), (11, 2), (16, 1)]
]

/-- Partial product 1137 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1137 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(8, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1137_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1137
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1138 : Poly :=
[
  term ((328267947403827685 : Rat) / 23862702583089664) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1138 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1138 : Poly :=
[
  term ((328267947403827685 : Rat) / 11931351291544832) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-328267947403827685 : Rat) / 23862702583089664) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1138_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1138
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1139 : Poly :=
[
  term ((-1067342596938727105 : Rat) / 11931351291544832) [(8, 2), (15, 2), (16, 1)]
]

/-- Partial product 1139 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1139 : Poly :=
[
  term ((-1067342596938727105 : Rat) / 5965675645772416) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1067342596938727105 : Rat) / 11931351291544832) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1139_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1139
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1140 : Poly :=
[
  term ((-71367716807167 : Rat) / 1704478755934976) [(8, 2), (16, 1)]
]

/-- Partial product 1140 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1140 : Poly :=
[
  term ((-71367716807167 : Rat) / 852239377967488) [(8, 2), (12, 1), (16, 1)],
  term ((71367716807167 : Rat) / 1704478755934976) [(8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1140_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1140
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1141 : Poly :=
[
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1141 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1141 : Poly :=
[
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1141_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1141
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1142 : Poly :=
[
  term ((492169649747748573677 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1142 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1142 : Poly :=
[
  term ((492169649747748573677 : Rat) / 3158825254436494272) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-492169649747748573677 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1142_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1142
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1143 : Poly :=
[
  term ((-1278297466422359 : Rat) / 852239377967488) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1143 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1143 : Poly :=
[
  term ((-1278297466422359 : Rat) / 426119688983744) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1278297466422359 : Rat) / 852239377967488) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1143_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1143
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1144 : Poly :=
[
  term ((-109611124979453847 : Rat) / 5965675645772416) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1144 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1144 : Poly :=
[
  term ((109611124979453847 : Rat) / 5965675645772416) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-109611124979453847 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1144_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1144
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1145 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1145 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1145 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1145_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1145
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1146 : Poly :=
[
  term ((140671224290850835 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1146 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1146 : Poly :=
[
  term ((140671224290850835 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140671224290850835 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1146_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1146
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1147 : Poly :=
[
  term ((-34068655273291496675 : Rat) / 2406724003380186112) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1147 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1147 : Poly :=
[
  term ((34068655273291496675 : Rat) / 2406724003380186112) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-34068655273291496675 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1147_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1147
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1148 : Poly :=
[
  term ((11126242500098293990585 : Rat) / 151623612212951725056) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1148 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1148 : Poly :=
[
  term ((-11126242500098293990585 : Rat) / 151623612212951725056) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((11126242500098293990585 : Rat) / 75811806106475862528) [(9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1148_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1148
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1149 : Poly :=
[
  term ((831591756276317723175 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1149 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1149 : Poly :=
[
  term ((831591756276317723175 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-831591756276317723175 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1149_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1149
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1150 : Poly :=
[
  term ((-6190816732064373132803 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1150 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1150 : Poly :=
[
  term ((-6190816732064373132803 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6190816732064373132803 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1150_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1150
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1151 : Poly :=
[
  term ((-1691429934055992412881 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1151 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1151 : Poly :=
[
  term ((-1691429934055992412881 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1691429934055992412881 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1151_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1151
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1152 : Poly :=
[
  term ((-93772329361347369197399 : Rat) / 303247224425903450112) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1152 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1152 : Poly :=
[
  term ((-93772329361347369197399 : Rat) / 151623612212951725056) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((93772329361347369197399 : Rat) / 303247224425903450112) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1152_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1152
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1153 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 1153 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1153 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1153_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1153
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1154 : Poly :=
[
  term ((-3646839033887667160349 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1154 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1154 : Poly :=
[
  term ((-3646839033887667160349 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3646839033887667160349 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1154_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1154
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1155 : Poly :=
[
  term ((-11632455151420795756481 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1155 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1155 : Poly :=
[
  term ((-11632455151420795756481 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((11632455151420795756481 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1155_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1155
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1156 : Poly :=
[
  term ((-134291696325819849583 : Rat) / 6317650508872988544) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1156 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1156 : Poly :=
[
  term ((134291696325819849583 : Rat) / 6317650508872988544) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-134291696325819849583 : Rat) / 3158825254436494272) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1156_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1156
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1157 : Poly :=
[
  term ((565277130855222650825 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1157 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1157 : Poly :=
[
  term ((565277130855222650825 : Rat) / 6317650508872988544) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-565277130855222650825 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1157_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1157
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1158 : Poly :=
[
  term ((-2117482746457135531 : Rat) / 225630375316892448) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1158 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1158 : Poly :=
[
  term ((-2117482746457135531 : Rat) / 112815187658446224) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((2117482746457135531 : Rat) / 225630375316892448) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1158_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1158
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1159 : Poly :=
[
  term ((-32577554069235555812521 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1159 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1159 : Poly :=
[
  term ((-32577554069235555812521 : Rat) / 75811806106475862528) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32577554069235555812521 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1159_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1159
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1160 : Poly :=
[
  term ((-38222419553948976178489 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1160 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1160 : Poly :=
[
  term ((-38222419553948976178489 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((38222419553948976178489 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1160_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1160
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1161 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)]
]

/-- Partial product 1161 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1161 : Poly :=
[
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(9, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1161_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1161
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1162 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (16, 1)]
]

/-- Partial product 1162 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1162 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1162_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1162
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1163 : Poly :=
[
  term ((896479259948281321 : Rat) / 47725405166179328) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1163 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1163 : Poly :=
[
  term ((-896479259948281321 : Rat) / 47725405166179328) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((896479259948281321 : Rat) / 23862702583089664) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1163_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1163
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1164 : Poly :=
[
  term ((-82233025518182213 : Rat) / 23862702583089664) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1164 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1164 : Poly :=
[
  term ((82233025518182213 : Rat) / 23862702583089664) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-82233025518182213 : Rat) / 11931351291544832) [(9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1164_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1164
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1165 : Poly :=
[
  term ((-18633701460115571 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1165 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1165 : Poly :=
[
  term ((-18633701460115571 : Rat) / 23862702583089664) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((18633701460115571 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1165_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1165
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1166 : Poly :=
[
  term ((2971329079268371 : Rat) / 2556718133902464) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1166 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1166 : Poly :=
[
  term ((2971329079268371 : Rat) / 1278359066951232) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2971329079268371 : Rat) / 2556718133902464) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1166_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1166
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1167 : Poly :=
[
  term ((-3335998494186481 : Rat) / 111118521923584) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1167 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1167 : Poly :=
[
  term ((-3335998494186481 : Rat) / 55559260961792) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3335998494186481 : Rat) / 111118521923584) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1167_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1167
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1168 : Poly :=
[
  term ((117234746817023 : Rat) / 182622723850176) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1168 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1168 : Poly :=
[
  term ((117234746817023 : Rat) / 91311361925088) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-117234746817023 : Rat) / 182622723850176) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1168_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1168
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1169 : Poly :=
[
  term ((-811057588969155571 : Rat) / 11931351291544832) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1169 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1169 : Poly :=
[
  term ((-811057588969155571 : Rat) / 5965675645772416) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((811057588969155571 : Rat) / 11931351291544832) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1169_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1169
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1170 : Poly :=
[
  term ((183099752496479997 : Rat) / 47725405166179328) [(9, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1170 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1170 : Poly :=
[
  term ((183099752496479997 : Rat) / 23862702583089664) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1170_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1170
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1171 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1171 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1171 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1171_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1171
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1172 : Poly :=
[
  term ((-15997040872112841173 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1172 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1172 : Poly :=
[
  term ((-15997040872112841173 : Rat) / 286352430997075968) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((15997040872112841173 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1172_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1172
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1173 : Poly :=
[
  term ((1592281722158390133 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1173 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1173 : Poly :=
[
  term ((1592281722158390133 : Rat) / 47725405166179328) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1592281722158390133 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1173_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1173
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1174 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1174 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1174 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1174_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1174
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1175 : Poly :=
[
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1175 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1175 : Poly :=
[
  term ((-349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1175_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1175
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1176 : Poly :=
[
  term ((-1049842464101169 : Rat) / 852239377967488) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 1176 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1176 : Poly :=
[
  term ((-1049842464101169 : Rat) / 426119688983744) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((1049842464101169 : Rat) / 852239377967488) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1176_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1176
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1177 : Poly :=
[
  term ((112402568318320084549 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1177 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1177 : Poly :=
[
  term ((-112402568318320084549 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((112402568318320084549 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1177_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1177
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1178 : Poly :=
[
  term ((115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1178 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1178 : Poly :=
[
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1178_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1178
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1179 : Poly :=
[
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1179 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1179 : Poly :=
[
  term ((447111482668512639503 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1179_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1179
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1180 : Poly :=
[
  term ((-13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1180 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1180 : Poly :=
[
  term ((-13135307637040010281 : Rat) / 2105883502957662848) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1180_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1180
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1181 : Poly :=
[
  term ((-1240877362871189278637 : Rat) / 16847068023661302784) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1181 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1181 : Poly :=
[
  term ((-1240877362871189278637 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1240877362871189278637 : Rat) / 16847068023661302784) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1181_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1181
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1182 : Poly :=
[
  term ((126987861646459264193 : Rat) / 4211767005915325696) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1182 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1182 : Poly :=
[
  term ((-126987861646459264193 : Rat) / 4211767005915325696) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1182_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1182
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1183 : Poly :=
[
  term ((100911032203905998999 : Rat) / 6317650508872988544) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1183 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1183 : Poly :=
[
  term ((100911032203905998999 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-100911032203905998999 : Rat) / 6317650508872988544) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1183_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1183
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1184 : Poly :=
[
  term ((854379961495825550651 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (16, 1)]
]

/-- Partial product 1184 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1184 : Poly :=
[
  term ((854379961495825550651 : Rat) / 12635301017745977088) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-854379961495825550651 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1184_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1184
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1185 : Poly :=
[
  term ((37052508790115989 : Rat) / 1704478755934976) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1185 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1185 : Poly :=
[
  term ((-37052508790115989 : Rat) / 1704478755934976) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1185_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1185
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1186 : Poly :=
[
  term ((-262673491014887 : Rat) / 1278359066951232) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 1186 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1186 : Poly :=
[
  term ((262673491014887 : Rat) / 1278359066951232) [(9, 2), (12, 1), (16, 1)],
  term ((-262673491014887 : Rat) / 639179533475616) [(9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1186_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1186
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1187 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1187 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1187 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1187_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1187
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1188 : Poly :=
[
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1188 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1188 : Poly :=
[
  term ((255006898652461167 : Rat) / 5965675645772416) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1188_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1188
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1189 : Poly :=
[
  term ((-37052508790115989 : Rat) / 852239377967488) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1189 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1189 : Poly :=
[
  term ((-37052508790115989 : Rat) / 426119688983744) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1189_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1189
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1190 : Poly :=
[
  term ((2100536428160717 : Rat) / 2556718133902464) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1190 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1190 : Poly :=
[
  term ((2100536428160717 : Rat) / 1278359066951232) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2100536428160717 : Rat) / 2556718133902464) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1190_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1190
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1191 : Poly :=
[
  term ((-998184785938730035 : Rat) / 23862702583089664) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1191 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1191 : Poly :=
[
  term ((-998184785938730035 : Rat) / 11931351291544832) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((998184785938730035 : Rat) / 23862702583089664) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1191_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1191
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1192 : Poly :=
[
  term ((-2624180410273733 : Rat) / 5113436267804928) [(9, 2), (16, 1)]
]

/-- Partial product 1192 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1192 : Poly :=
[
  term ((-2624180410273733 : Rat) / 2556718133902464) [(9, 2), (12, 1), (16, 1)],
  term ((2624180410273733 : Rat) / 5113436267804928) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1192_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1192
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1193 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1193 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1193 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1193_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1193
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1194 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1194 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1194 : Poly :=
[
  term ((41469041122357166957 : Rat) / 131617718934853928) [(9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1194_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1194
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1195 : Poly :=
[
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 3), (11, 1), (16, 1)]
]

/-- Partial product 1195 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1195 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1195_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1195
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1196 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1196 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1196 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1196_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1196
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1197 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1197 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1197 : Poly :=
[
  term ((23088038262747441 : Rat) / 186427363930388) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1197_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1197
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1198 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1198 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1198 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1198_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1198
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_1199 : Poly :=
[
  term ((475978823129930696075 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1199 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_1199 : Poly :=
[
  term ((-475978823129930696075 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((475978823129930696075 : Rat) / 3158825254436494272) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_1199_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_1199
        rs_R010_ueqv_R010NYY_generator_25_1100_1199 =
      rs_R010_ueqv_R010NYY_partial_25_1199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_25_1100_1199 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_25_1100,
  rs_R010_ueqv_R010NYY_partial_25_1101,
  rs_R010_ueqv_R010NYY_partial_25_1102,
  rs_R010_ueqv_R010NYY_partial_25_1103,
  rs_R010_ueqv_R010NYY_partial_25_1104,
  rs_R010_ueqv_R010NYY_partial_25_1105,
  rs_R010_ueqv_R010NYY_partial_25_1106,
  rs_R010_ueqv_R010NYY_partial_25_1107,
  rs_R010_ueqv_R010NYY_partial_25_1108,
  rs_R010_ueqv_R010NYY_partial_25_1109,
  rs_R010_ueqv_R010NYY_partial_25_1110,
  rs_R010_ueqv_R010NYY_partial_25_1111,
  rs_R010_ueqv_R010NYY_partial_25_1112,
  rs_R010_ueqv_R010NYY_partial_25_1113,
  rs_R010_ueqv_R010NYY_partial_25_1114,
  rs_R010_ueqv_R010NYY_partial_25_1115,
  rs_R010_ueqv_R010NYY_partial_25_1116,
  rs_R010_ueqv_R010NYY_partial_25_1117,
  rs_R010_ueqv_R010NYY_partial_25_1118,
  rs_R010_ueqv_R010NYY_partial_25_1119,
  rs_R010_ueqv_R010NYY_partial_25_1120,
  rs_R010_ueqv_R010NYY_partial_25_1121,
  rs_R010_ueqv_R010NYY_partial_25_1122,
  rs_R010_ueqv_R010NYY_partial_25_1123,
  rs_R010_ueqv_R010NYY_partial_25_1124,
  rs_R010_ueqv_R010NYY_partial_25_1125,
  rs_R010_ueqv_R010NYY_partial_25_1126,
  rs_R010_ueqv_R010NYY_partial_25_1127,
  rs_R010_ueqv_R010NYY_partial_25_1128,
  rs_R010_ueqv_R010NYY_partial_25_1129,
  rs_R010_ueqv_R010NYY_partial_25_1130,
  rs_R010_ueqv_R010NYY_partial_25_1131,
  rs_R010_ueqv_R010NYY_partial_25_1132,
  rs_R010_ueqv_R010NYY_partial_25_1133,
  rs_R010_ueqv_R010NYY_partial_25_1134,
  rs_R010_ueqv_R010NYY_partial_25_1135,
  rs_R010_ueqv_R010NYY_partial_25_1136,
  rs_R010_ueqv_R010NYY_partial_25_1137,
  rs_R010_ueqv_R010NYY_partial_25_1138,
  rs_R010_ueqv_R010NYY_partial_25_1139,
  rs_R010_ueqv_R010NYY_partial_25_1140,
  rs_R010_ueqv_R010NYY_partial_25_1141,
  rs_R010_ueqv_R010NYY_partial_25_1142,
  rs_R010_ueqv_R010NYY_partial_25_1143,
  rs_R010_ueqv_R010NYY_partial_25_1144,
  rs_R010_ueqv_R010NYY_partial_25_1145,
  rs_R010_ueqv_R010NYY_partial_25_1146,
  rs_R010_ueqv_R010NYY_partial_25_1147,
  rs_R010_ueqv_R010NYY_partial_25_1148,
  rs_R010_ueqv_R010NYY_partial_25_1149,
  rs_R010_ueqv_R010NYY_partial_25_1150,
  rs_R010_ueqv_R010NYY_partial_25_1151,
  rs_R010_ueqv_R010NYY_partial_25_1152,
  rs_R010_ueqv_R010NYY_partial_25_1153,
  rs_R010_ueqv_R010NYY_partial_25_1154,
  rs_R010_ueqv_R010NYY_partial_25_1155,
  rs_R010_ueqv_R010NYY_partial_25_1156,
  rs_R010_ueqv_R010NYY_partial_25_1157,
  rs_R010_ueqv_R010NYY_partial_25_1158,
  rs_R010_ueqv_R010NYY_partial_25_1159,
  rs_R010_ueqv_R010NYY_partial_25_1160,
  rs_R010_ueqv_R010NYY_partial_25_1161,
  rs_R010_ueqv_R010NYY_partial_25_1162,
  rs_R010_ueqv_R010NYY_partial_25_1163,
  rs_R010_ueqv_R010NYY_partial_25_1164,
  rs_R010_ueqv_R010NYY_partial_25_1165,
  rs_R010_ueqv_R010NYY_partial_25_1166,
  rs_R010_ueqv_R010NYY_partial_25_1167,
  rs_R010_ueqv_R010NYY_partial_25_1168,
  rs_R010_ueqv_R010NYY_partial_25_1169,
  rs_R010_ueqv_R010NYY_partial_25_1170,
  rs_R010_ueqv_R010NYY_partial_25_1171,
  rs_R010_ueqv_R010NYY_partial_25_1172,
  rs_R010_ueqv_R010NYY_partial_25_1173,
  rs_R010_ueqv_R010NYY_partial_25_1174,
  rs_R010_ueqv_R010NYY_partial_25_1175,
  rs_R010_ueqv_R010NYY_partial_25_1176,
  rs_R010_ueqv_R010NYY_partial_25_1177,
  rs_R010_ueqv_R010NYY_partial_25_1178,
  rs_R010_ueqv_R010NYY_partial_25_1179,
  rs_R010_ueqv_R010NYY_partial_25_1180,
  rs_R010_ueqv_R010NYY_partial_25_1181,
  rs_R010_ueqv_R010NYY_partial_25_1182,
  rs_R010_ueqv_R010NYY_partial_25_1183,
  rs_R010_ueqv_R010NYY_partial_25_1184,
  rs_R010_ueqv_R010NYY_partial_25_1185,
  rs_R010_ueqv_R010NYY_partial_25_1186,
  rs_R010_ueqv_R010NYY_partial_25_1187,
  rs_R010_ueqv_R010NYY_partial_25_1188,
  rs_R010_ueqv_R010NYY_partial_25_1189,
  rs_R010_ueqv_R010NYY_partial_25_1190,
  rs_R010_ueqv_R010NYY_partial_25_1191,
  rs_R010_ueqv_R010NYY_partial_25_1192,
  rs_R010_ueqv_R010NYY_partial_25_1193,
  rs_R010_ueqv_R010NYY_partial_25_1194,
  rs_R010_ueqv_R010NYY_partial_25_1195,
  rs_R010_ueqv_R010NYY_partial_25_1196,
  rs_R010_ueqv_R010NYY_partial_25_1197,
  rs_R010_ueqv_R010NYY_partial_25_1198,
  rs_R010_ueqv_R010NYY_partial_25_1199
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_25_1100_1199 : Poly :=
[
  term ((262673491014887 : Rat) / 639179533475616) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3957595883125165719 : Rat) / 23862702583089664) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4669386214254033709 : Rat) / 143176215498537984) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((167015408479822159 : Rat) / 2982837822886208) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-262673491014887 : Rat) / 1278359066951232) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3957595883125165719 : Rat) / 47725405166179328) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4669386214254033709 : Rat) / 286352430997075968) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-167015408479822159 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 131617718934853928) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 186427363930388) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((1952880645780243182111 : Rat) / 12635301017745977088) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((28593968989313602614325 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-28593968989313602614325 : Rat) / 303247224425903450112) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((104711860146981725 : Rat) / 2982837822886208) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((148618339734873 : Rat) / 852239377967488) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((790370787803414481 : Rat) / 23862702583089664) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12189839642686807 : Rat) / 5113436267804928) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 5965675645772416) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148618339734873 : Rat) / 1704478755934976) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-790370787803414481 : Rat) / 47725405166179328) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((12189839642686807 : Rat) / 10226872535609856) [(8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)],
  term ((-2362877370809801204651 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-101644522824340659 : Rat) / 5965675645772416) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4242570429073431245729 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3857480708782319794471 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21904595171162628728653 : Rat) / 50541204070983908352) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1150030796077686731 : Rat) / 11931351291544832) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1006155787278076888097 : Rat) / 6317650508872988544) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2362877370809801204651 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((101644522824340659 : Rat) / 11931351291544832) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4242570429073431245729 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3857480708782319794471 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1234724681917854108621 : Rat) / 4813448006760372224) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1150030796077686731 : Rat) / 23862702583089664) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-833860523506862349991 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65855947153978413377 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((34020392351833734492559 : Rat) / 75811806106475862528) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-148984597459078057437 : Rat) / 1052941751478831424) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((833860523506862349991 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((65855947153978413377 : Rat) / 25270602035491954176) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-34020392351833734492559 : Rat) / 151623612212951725056) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((148984597459078057437 : Rat) / 2105883502957662848) [(8, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-45043032468617529 : Rat) / 11931351291544832) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13678579747479021 : Rat) / 372854727860776) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16549472857713853 : Rat) / 745709455721552) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1366513052354917 : Rat) / 2191472686202112) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((4995096648738436673 : Rat) / 35794053874634496) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-135928594573005967 : Rat) / 30680617606829568) [(8, 1), (12, 1), (16, 1)],
  term ((16307084115370483 : Rat) / 627965857449728) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((45043032468617529 : Rat) / 23862702583089664) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13678579747479021 : Rat) / 745709455721552) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((16549472857713853 : Rat) / 1491418911443104) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1366513052354917 : Rat) / 4382945372404224) [(8, 1), (14, 1), (16, 1)],
  term ((-10919697092052990877 : Rat) / 143176215498537984) [(8, 1), (15, 2), (16, 1)],
  term ((135928594573005967 : Rat) / 61361235213659136) [(8, 1), (16, 1)],
  term ((3157579497405045811529 : Rat) / 18952951526618965632) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8939487312665387828669 : Rat) / 9476475763309482816) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3157579497405045811529 : Rat) / 37905903053237931264) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((8939487312665387828669 : Rat) / 18952951526618965632) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 2105883502957662848) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(8, 2), (11, 2), (16, 1)],
  term ((328267947403827685 : Rat) / 11931351291544832) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1067342596938727105 : Rat) / 5965675645772416) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-71367716807167 : Rat) / 852239377967488) [(8, 2), (12, 1), (16, 1)],
  term ((-328267947403827685 : Rat) / 23862702583089664) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1067342596938727105 : Rat) / 11931351291544832) [(8, 2), (15, 2), (16, 1)],
  term ((71367716807167 : Rat) / 1704478755934976) [(8, 2), (16, 1)],
  term ((492169649747748573677 : Rat) / 3158825254436494272) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1877072492831531603975 : Rat) / 25270602035491954176) [(9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-492169649747748573677 : Rat) / 6317650508872988544) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1278297466422359 : Rat) / 852239377967488) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((140671224290850835 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((109611124979453847 : Rat) / 5965675645772416) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-109611124979453847 : Rat) / 2982837822886208) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-140671224290850835 : Rat) / 5965675645772416) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((831591756276317723175 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6190816732064373132803 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1691429934055992412881 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-93772329361347369197399 : Rat) / 151623612212951725056) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3169877860061586206899 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-149197066363180337770669 : Rat) / 606494448851806900224) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-34068655273291496675 : Rat) / 1203362001690093056) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((11126242500098293990585 : Rat) / 75811806106475862528) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-831591756276317723175 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6190816732064373132803 : Rat) / 202164816283935633408) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1691429934055992412881 : Rat) / 33694136047322605568) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((93772329361347369197399 : Rat) / 303247224425903450112) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((3646839033887667160349 : Rat) / 67388272094645211136) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11632455151420795756481 : Rat) / 134776544189290422272) [(9, 1), (11, 1), (16, 1)],
  term ((565277130855222650825 : Rat) / 6317650508872988544) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2117482746457135531 : Rat) / 112815187658446224) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-32577554069235555812521 : Rat) / 75811806106475862528) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34999418842129299788497 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-134291696325819849583 : Rat) / 3158825254436494272) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-565277130855222650825 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2117482746457135531 : Rat) / 225630375316892448) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((32577554069235555812521 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((38222419553948976178489 : Rat) / 303247224425903450112) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(9, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(9, 1), (11, 3), (16, 1)],
  term ((-18633701460115571 : Rat) / 23862702583089664) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2971329079268371 : Rat) / 1278359066951232) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3335998494186481 : Rat) / 55559260961792) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((117234746817023 : Rat) / 91311361925088) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-811057588969155571 : Rat) / 5965675645772416) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((183099752496479997 : Rat) / 23862702583089664) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21375916431802529099 : Rat) / 286352430997075968) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1756747773194754559 : Rat) / 47725405166179328) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((896479259948281321 : Rat) / 23862702583089664) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-82233025518182213 : Rat) / 11931351291544832) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((18633701460115571 : Rat) / 47725405166179328) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2971329079268371 : Rat) / 2556718133902464) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3335998494186481 : Rat) / 111118521923584) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-117234746817023 : Rat) / 182622723850176) [(9, 1), (13, 1), (16, 1)],
  term ((811057588969155571 : Rat) / 11931351291544832) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-183099752496479997 : Rat) / 47725405166179328) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((15997040872112841173 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)],
  term ((-1592281722158390133 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (12, 2), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((1049842464101169 : Rat) / 852239377967488) [(9, 2), (10, 1), (16, 1)],
  term ((115359153689655303847 : Rat) / 2105883502957662848) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13135307637040010281 : Rat) / 2105883502957662848) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-676639965594754681593 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((112402568318320084549 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-115359153689655303847 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1240877362871189278637 : Rat) / 16847068023661302784) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((100911032203905998999 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((59177047069555969759 : Rat) / 1579412627218247136) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((126987861646459264193 : Rat) / 2105883502957662848) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-100911032203905998999 : Rat) / 6317650508872988544) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-854379961495825550651 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 5965675645772416) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37052508790115989 : Rat) / 426119688983744) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2100536428160717 : Rat) / 1278359066951232) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 313982928724864) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2098833428243959 : Rat) / 2556718133902464) [(9, 2), (12, 1), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-262673491014887 : Rat) / 639179533475616) [(9, 2), (12, 2), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2100536428160717 : Rat) / 2556718133902464) [(9, 2), (14, 1), (16, 1)],
  term ((998184785938730035 : Rat) / 23862702583089664) [(9, 2), (15, 2), (16, 1)],
  term ((2624180410273733 : Rat) / 5113436267804928) [(9, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 131617718934853928) [(9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (12, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 3), (11, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 186427363930388) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 3), (15, 1), (16, 1)],
  term ((-475978823129930696075 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((475978823129930696075 : Rat) / 3158825254436494272) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1100 through 1199. -/
theorem rs_R010_ueqv_R010NYY_block_25_1100_1199_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_25_1100_1199
      rs_R010_ueqv_R010NYY_block_25_1100_1199 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
