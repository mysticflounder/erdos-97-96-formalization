/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 28:1100-1199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_28_1100_1199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 1100 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1100 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1100 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1100 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1100_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1100
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1101 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1101 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1101 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1101_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1101
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1102 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1102 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1102 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1102_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1102
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1103 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1103 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1103 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 2)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1103_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1103
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1104 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1104 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1104 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1104_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1104
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1105 : Poly :=
[
  term ((-2893600 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1105 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1105 : Poly :=
[
  term ((5787200 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2893600 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1105_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1105
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1106 : Poly :=
[
  term ((93510588 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1106 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1106 : Poly :=
[
  term ((-187021176 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((93510588 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-187021176 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((93510588 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1106_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1106
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1107 : Poly :=
[
  term ((-1446800 : Rat) / 52799) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1107 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1107 : Poly :=
[
  term ((2893600 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1446800 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((2893600 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (8, 1), (15, 2)],
  term ((-1446800 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1107_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1107
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1108 : Poly :=
[
  term ((46755294 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1108 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1108 : Poly :=
[
  term ((-93510588 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((46755294 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-93510588 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((46755294 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1108_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1108
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1109 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1109 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1109 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1109_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1109
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1110 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1110 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1110 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1110_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1110
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1111 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1111 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1111 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1111_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1111
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1112 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1112 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1112 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1112_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1112
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1113 : Poly :=
[
  term ((-2893600 : Rat) / 52799) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 1113 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1113 : Poly :=
[
  term ((5787200 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((5787200 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (10, 1), (15, 2)],
  term ((-2893600 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1113_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1113
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1114 : Poly :=
[
  term ((93510588 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1114 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1114 : Poly :=
[
  term ((-187021176 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((93510588 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-187021176 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((93510588 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1114_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1114
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1115 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1115 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1115 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1115_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1115
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1116 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1116 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1116 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1116_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1116
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1117 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1117 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1117 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1117_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1117
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1118 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1118 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1118 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1118_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1118
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1119 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1119 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1119 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1119_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1119
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1120 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1120 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1120 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1120_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1120
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1121 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1121 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1121 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1121_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1121
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1122 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1122 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1122 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1122_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1122
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1123 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1123 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1123 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 2), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1123_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1123
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1124 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1124 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1124 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1124_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1124
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1125 : Poly :=
[
  term ((-10072000 : Rat) / 158397) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1125 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1125 : Poly :=
[
  term ((20144000 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-10072000 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((20144000 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((-10072000 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1125_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1125
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1126 : Poly :=
[
  term ((126528352 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1126 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1126 : Poly :=
[
  term ((-253056704 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((126528352 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253056704 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((126528352 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1126_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1126
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1127 : Poly :=
[
  term ((1875280 : Rat) / 52799) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 1127 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1127 : Poly :=
[
  term ((-3750560 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((1875280 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((-3750560 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((1875280 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1127_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1127
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1128 : Poly :=
[
  term ((-66011682 : Rat) / 385571) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1128 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1128 : Poly :=
[
  term ((132023364 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66011682 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((132023364 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-66011682 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1128_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1128
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1129 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1129 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1129 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1129_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1129
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1130 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1130 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1130 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1130_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1130
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1131 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1131 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1131 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1131_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1131
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1132 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1132 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1132 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1132_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1132
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1133 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1133 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1133 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1133_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1133
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1134 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1134 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1134 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1134_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1134
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1135 : Poly :=
[
  term ((6059648 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1135 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1135 : Poly :=
[
  term ((-12119296 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((6059648 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-12119296 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((6059648 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1135_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1135
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1136 : Poly :=
[
  term ((-2761512 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1136 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1136 : Poly :=
[
  term ((5523024 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2761512 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5523024 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2761512 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1136_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1136
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1137 : Poly :=
[
  term ((-27020032 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1137 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1137 : Poly :=
[
  term ((54040064 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-27020032 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((54040064 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-27020032 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1137_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1137
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1138 : Poly :=
[
  term ((-70668992 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1138 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1138 : Poly :=
[
  term ((141337984 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70668992 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((141337984 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70668992 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1138_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1138
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1139 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1139 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1139 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1139_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1139
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1140 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1140 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1140 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1140_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1140
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1141 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1141 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1141 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1141_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1141
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1142 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1142 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1142 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1142_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1142
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1143 : Poly :=
[
  term ((-6059648 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1143 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1143 : Poly :=
[
  term ((12119296 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6059648 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-6059648 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1143_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1143
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1144 : Poly :=
[
  term ((2761512 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1144 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1144 : Poly :=
[
  term ((-5523024 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2761512 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5523024 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2761512 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1144_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1144
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1145 : Poly :=
[
  term ((948160 : Rat) / 52799) [(4, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1145 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1145 : Poly :=
[
  term ((-1896320 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((948160 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1896320 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((948160 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1145_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1145
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1146 : Poly :=
[
  term ((-12883404 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1146 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1146 : Poly :=
[
  term ((25766808 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12883404 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((25766808 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-12883404 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1146_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1146
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1147 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1147 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1147 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1147_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1147
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1148 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1148 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1148 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1148_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1148
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1149 : Poly :=
[
  term ((2334720 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1149 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1149 : Poly :=
[
  term ((-4669440 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((2334720 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4669440 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((2334720 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1149_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1149
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1150 : Poly :=
[
  term ((-6874560 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1150 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1150 : Poly :=
[
  term ((13749120 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6874560 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((13749120 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6874560 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1150_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1150
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1151 : Poly :=
[
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1151 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1151 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1151_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1151
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1152 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1152 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1152 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1152_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1152
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1153 : Poly :=
[
  term ((-1167360 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 1153 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1153 : Poly :=
[
  term ((2334720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1167360 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((2334720 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 3)],
  term ((-1167360 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1153_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1153
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1154 : Poly :=
[
  term ((3437280 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1154 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1154 : Poly :=
[
  term ((-6874560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3437280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-6874560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((3437280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1154_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1154
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1155 : Poly :=
[
  term ((-532480 : Rat) / 4281) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1155 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1155 : Poly :=
[
  term ((1064960 : Rat) / 4281) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-532480 : Rat) / 4281) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 4281) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-532480 : Rat) / 4281) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1155_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1155
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1156 : Poly :=
[
  term ((51350080 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1156 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1156 : Poly :=
[
  term ((-102700160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((51350080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-102700160 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((51350080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1156_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1156
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1157 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1157 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1157 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1157_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1157
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1158 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1158 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1158 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1158_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1158
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1159 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1159 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1159 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1159_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1159
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1160 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1160 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1160 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1160_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1160
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1161 : Poly :=
[
  term ((-3891200 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1161 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1161 : Poly :=
[
  term ((7782400 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3891200 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((7782400 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3891200 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1161_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1161
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1162 : Poly :=
[
  term ((11457600 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1162 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1162 : Poly :=
[
  term ((-22915200 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((11457600 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22915200 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11457600 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1162_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1162
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1163 : Poly :=
[
  term ((-1167360 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1163 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1163 : Poly :=
[
  term ((2334720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1167360 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((2334720 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1167360 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1163_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1163
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1164 : Poly :=
[
  term ((3437280 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1164 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1164 : Poly :=
[
  term ((-6874560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3437280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6874560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((3437280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1164_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1164
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1165 : Poly :=
[
  term ((8683520 : Rat) / 158397) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1165 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1165 : Poly :=
[
  term ((-17367040 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((8683520 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-17367040 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((8683520 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1165_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1165
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1166 : Poly :=
[
  term ((-24529280 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1166 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1166 : Poly :=
[
  term ((49058560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24529280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((49058560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-24529280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1166_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1166
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1167 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1167 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1167 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1167_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1167
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1168 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1168 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1168 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1168_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1168
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1169 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1169 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1169 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 2), (15, 2)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 2), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1169_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1169
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1170 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1170 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1170 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1170_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1170
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1171 : Poly :=
[
  term ((1167360 : Rat) / 52799) [(4, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1171 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1171 : Poly :=
[
  term ((-2334720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (14, 2), (15, 2)],
  term ((1167360 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2334720 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 3)],
  term ((1167360 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1171_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1171
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1172 : Poly :=
[
  term ((-3437280 : Rat) / 385571) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1172 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1172 : Poly :=
[
  term ((6874560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3437280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((6874560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3437280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1172_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1172
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1173 : Poly :=
[
  term ((5587136 : Rat) / 52799) [(4, 1), (8, 1), (15, 2)]
]

/-- Partial product 1173 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1173 : Poly :=
[
  term ((-11174272 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((5587136 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (15, 2)],
  term ((-11174272 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (15, 3)],
  term ((5587136 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1173_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1173
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1174 : Poly :=
[
  term ((-28893768 : Rat) / 385571) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1174 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1174 : Poly :=
[
  term ((57787536 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28893768 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((57787536 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (15, 3), (16, 1)],
  term ((-28893768 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1174_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1174
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1175 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1175 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1175 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1175_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1175
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1176 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1176 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1176 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1176_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1176
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1177 : Poly :=
[
  term ((-6059648 : Rat) / 52799) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1177 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1177 : Poly :=
[
  term ((12119296 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6059648 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((12119296 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2)],
  term ((-6059648 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1177_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1177
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1178 : Poly :=
[
  term ((2761512 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1178 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1178 : Poly :=
[
  term ((-5523024 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2761512 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5523024 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((2761512 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1178_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1178
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1179 : Poly :=
[
  term ((9566464 : Rat) / 52799) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1179 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1179 : Poly :=
[
  term ((-19132928 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((9566464 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19132928 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((9566464 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1179_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1179
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1180 : Poly :=
[
  term ((53014272 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1180 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1180 : Poly :=
[
  term ((-106028544 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((53014272 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106028544 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((53014272 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1180_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1180
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1181 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1181 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1181 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1181_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1181
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1182 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1182 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1182 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1182_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1182
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1183 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1183 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1183 : Poly :=
[
  term ((48477184 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((48477184 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 2), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1183_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1183
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1184 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1184 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1184 : Poly :=
[
  term ((-7364032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1184_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1184
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1185 : Poly :=
[
  term ((-51571072 : Rat) / 158397) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1185 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1185 : Poly :=
[
  term ((103142144 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-51571072 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((103142144 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((-51571072 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1185_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1185
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1186 : Poly :=
[
  term ((28032760 : Rat) / 385571) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1186 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1186 : Poly :=
[
  term ((-56065520 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((28032760 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56065520 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((28032760 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1186_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1186
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1187 : Poly :=
[
  term ((5003680 : Rat) / 52799) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 1187 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1187 : Poly :=
[
  term ((-10007360 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((5003680 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-10007360 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((5003680 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1187_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1187
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1188 : Poly :=
[
  term ((-2909784 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1188 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1188 : Poly :=
[
  term ((5819568 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2909784 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5819568 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2909784 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1188_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1188
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1189 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1189 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1189 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1189_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1189
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1190 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1190 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1190 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1190_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1190
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1191 : Poly :=
[
  term ((-2334720 : Rat) / 52799) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1191 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1191 : Poly :=
[
  term ((4669440 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2334720 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((4669440 : Rat) / 52799) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2334720 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1191_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1191
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1192 : Poly :=
[
  term ((6874560 : Rat) / 385571) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1192 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1192 : Poly :=
[
  term ((-13749120 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6874560 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13749120 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((6874560 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1192_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1192
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1193 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(4, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1193 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1193 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (14, 2), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 3)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1193_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1193
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1194 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1194 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1194 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1194_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1194
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1195 : Poly :=
[
  term ((-4021504 : Rat) / 158397) [(4, 1), (10, 1), (15, 2)]
]

/-- Partial product 1195 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1195 : Poly :=
[
  term ((8043008 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-4021504 : Rat) / 158397) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((8043008 : Rat) / 158397) [(1, 1), (4, 1), (10, 1), (15, 3)],
  term ((-4021504 : Rat) / 158397) [(1, 2), (4, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1195_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1195
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1196 : Poly :=
[
  term ((17435848 : Rat) / 385571) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1196 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1196 : Poly :=
[
  term ((-34871696 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((17435848 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-34871696 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((17435848 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1196_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1196
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1197 : Poly :=
[
  term ((532480 : Rat) / 4281) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1197 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1197 : Poly :=
[
  term ((-1064960 : Rat) / 4281) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((532480 : Rat) / 4281) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 4281) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((532480 : Rat) / 4281) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1197_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1197
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1198 : Poly :=
[
  term ((-51350080 : Rat) / 385571) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1198 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1198 : Poly :=
[
  term ((102700160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-51350080 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((102700160 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51350080 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1198_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1198
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 28. -/
def rs_R005_ueqv_R005NYN_coefficient_28_1199 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1199 for generator 28. -/
def rs_R005_ueqv_R005NYN_partial_28_1199 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 28. -/
theorem rs_R005_ueqv_R005NYN_partial_28_1199_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_28_1199
        rs_R005_ueqv_R005NYN_generator_28_1100_1199 =
      rs_R005_ueqv_R005NYN_partial_28_1199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_28_1100_1199 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_28_1100,
  rs_R005_ueqv_R005NYN_partial_28_1101,
  rs_R005_ueqv_R005NYN_partial_28_1102,
  rs_R005_ueqv_R005NYN_partial_28_1103,
  rs_R005_ueqv_R005NYN_partial_28_1104,
  rs_R005_ueqv_R005NYN_partial_28_1105,
  rs_R005_ueqv_R005NYN_partial_28_1106,
  rs_R005_ueqv_R005NYN_partial_28_1107,
  rs_R005_ueqv_R005NYN_partial_28_1108,
  rs_R005_ueqv_R005NYN_partial_28_1109,
  rs_R005_ueqv_R005NYN_partial_28_1110,
  rs_R005_ueqv_R005NYN_partial_28_1111,
  rs_R005_ueqv_R005NYN_partial_28_1112,
  rs_R005_ueqv_R005NYN_partial_28_1113,
  rs_R005_ueqv_R005NYN_partial_28_1114,
  rs_R005_ueqv_R005NYN_partial_28_1115,
  rs_R005_ueqv_R005NYN_partial_28_1116,
  rs_R005_ueqv_R005NYN_partial_28_1117,
  rs_R005_ueqv_R005NYN_partial_28_1118,
  rs_R005_ueqv_R005NYN_partial_28_1119,
  rs_R005_ueqv_R005NYN_partial_28_1120,
  rs_R005_ueqv_R005NYN_partial_28_1121,
  rs_R005_ueqv_R005NYN_partial_28_1122,
  rs_R005_ueqv_R005NYN_partial_28_1123,
  rs_R005_ueqv_R005NYN_partial_28_1124,
  rs_R005_ueqv_R005NYN_partial_28_1125,
  rs_R005_ueqv_R005NYN_partial_28_1126,
  rs_R005_ueqv_R005NYN_partial_28_1127,
  rs_R005_ueqv_R005NYN_partial_28_1128,
  rs_R005_ueqv_R005NYN_partial_28_1129,
  rs_R005_ueqv_R005NYN_partial_28_1130,
  rs_R005_ueqv_R005NYN_partial_28_1131,
  rs_R005_ueqv_R005NYN_partial_28_1132,
  rs_R005_ueqv_R005NYN_partial_28_1133,
  rs_R005_ueqv_R005NYN_partial_28_1134,
  rs_R005_ueqv_R005NYN_partial_28_1135,
  rs_R005_ueqv_R005NYN_partial_28_1136,
  rs_R005_ueqv_R005NYN_partial_28_1137,
  rs_R005_ueqv_R005NYN_partial_28_1138,
  rs_R005_ueqv_R005NYN_partial_28_1139,
  rs_R005_ueqv_R005NYN_partial_28_1140,
  rs_R005_ueqv_R005NYN_partial_28_1141,
  rs_R005_ueqv_R005NYN_partial_28_1142,
  rs_R005_ueqv_R005NYN_partial_28_1143,
  rs_R005_ueqv_R005NYN_partial_28_1144,
  rs_R005_ueqv_R005NYN_partial_28_1145,
  rs_R005_ueqv_R005NYN_partial_28_1146,
  rs_R005_ueqv_R005NYN_partial_28_1147,
  rs_R005_ueqv_R005NYN_partial_28_1148,
  rs_R005_ueqv_R005NYN_partial_28_1149,
  rs_R005_ueqv_R005NYN_partial_28_1150,
  rs_R005_ueqv_R005NYN_partial_28_1151,
  rs_R005_ueqv_R005NYN_partial_28_1152,
  rs_R005_ueqv_R005NYN_partial_28_1153,
  rs_R005_ueqv_R005NYN_partial_28_1154,
  rs_R005_ueqv_R005NYN_partial_28_1155,
  rs_R005_ueqv_R005NYN_partial_28_1156,
  rs_R005_ueqv_R005NYN_partial_28_1157,
  rs_R005_ueqv_R005NYN_partial_28_1158,
  rs_R005_ueqv_R005NYN_partial_28_1159,
  rs_R005_ueqv_R005NYN_partial_28_1160,
  rs_R005_ueqv_R005NYN_partial_28_1161,
  rs_R005_ueqv_R005NYN_partial_28_1162,
  rs_R005_ueqv_R005NYN_partial_28_1163,
  rs_R005_ueqv_R005NYN_partial_28_1164,
  rs_R005_ueqv_R005NYN_partial_28_1165,
  rs_R005_ueqv_R005NYN_partial_28_1166,
  rs_R005_ueqv_R005NYN_partial_28_1167,
  rs_R005_ueqv_R005NYN_partial_28_1168,
  rs_R005_ueqv_R005NYN_partial_28_1169,
  rs_R005_ueqv_R005NYN_partial_28_1170,
  rs_R005_ueqv_R005NYN_partial_28_1171,
  rs_R005_ueqv_R005NYN_partial_28_1172,
  rs_R005_ueqv_R005NYN_partial_28_1173,
  rs_R005_ueqv_R005NYN_partial_28_1174,
  rs_R005_ueqv_R005NYN_partial_28_1175,
  rs_R005_ueqv_R005NYN_partial_28_1176,
  rs_R005_ueqv_R005NYN_partial_28_1177,
  rs_R005_ueqv_R005NYN_partial_28_1178,
  rs_R005_ueqv_R005NYN_partial_28_1179,
  rs_R005_ueqv_R005NYN_partial_28_1180,
  rs_R005_ueqv_R005NYN_partial_28_1181,
  rs_R005_ueqv_R005NYN_partial_28_1182,
  rs_R005_ueqv_R005NYN_partial_28_1183,
  rs_R005_ueqv_R005NYN_partial_28_1184,
  rs_R005_ueqv_R005NYN_partial_28_1185,
  rs_R005_ueqv_R005NYN_partial_28_1186,
  rs_R005_ueqv_R005NYN_partial_28_1187,
  rs_R005_ueqv_R005NYN_partial_28_1188,
  rs_R005_ueqv_R005NYN_partial_28_1189,
  rs_R005_ueqv_R005NYN_partial_28_1190,
  rs_R005_ueqv_R005NYN_partial_28_1191,
  rs_R005_ueqv_R005NYN_partial_28_1192,
  rs_R005_ueqv_R005NYN_partial_28_1193,
  rs_R005_ueqv_R005NYN_partial_28_1194,
  rs_R005_ueqv_R005NYN_partial_28_1195,
  rs_R005_ueqv_R005NYN_partial_28_1196,
  rs_R005_ueqv_R005NYN_partial_28_1197,
  rs_R005_ueqv_R005NYN_partial_28_1198,
  rs_R005_ueqv_R005NYN_partial_28_1199
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_28_1100_1199 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-187021176 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-187021176 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3750560 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((132023364 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((20144000 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-253056704 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((5523024 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((54040064 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((141337984 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1896320 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((25766808 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-5523024 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4669440 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((13749120 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2334720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-6874560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 4281) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-102700160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2334720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6874560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7782400 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-22915200 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17367040 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((49058560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11174272 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((57787536 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2334720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (14, 2), (15, 2)],
  term ((6874560 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((12119296 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5523024 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19132928 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-106028544 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((48477184 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-7364032 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10007360 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((5819568 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((103142144 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-56065520 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4669440 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-13749120 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((8043008 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-34871696 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (10, 1), (14, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 4281) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((102700160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1446800 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((46755294 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10072000 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((126528352 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1875280 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((-66011682 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6059648 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2761512 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27020032 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-70668992 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6059648 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2761512 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((948160 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12883404 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2334720 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-6874560 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1167360 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((3437280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 4281) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((51350080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3891200 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((11457600 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1167360 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((3437280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((8683520 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-24529280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1167360 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-3437280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((5587136 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (15, 2)],
  term ((-28893768 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6059648 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((2761512 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9566464 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((53014272 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51571072 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((28032760 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5003680 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-2909784 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2334720 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((6874560 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4021504 : Rat) / 158397) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((17435848 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((532480 : Rat) / 4281) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-51350080 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 2)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((5787200 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-187021176 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2893600 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (8, 1), (15, 2)],
  term ((-93510588 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((7364032 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((5787200 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (10, 1), (15, 2)],
  term ((-187021176 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (12, 2), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((20144000 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((-253056704 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3750560 : Rat) / 52799) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((132023364 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(1, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3682016 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12119296 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((5523024 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((54040064 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((141337984 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((7364032 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((12119296 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-5523024 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1896320 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((25766808 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4669440 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((13749120 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((2334720 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 3)],
  term ((-6874560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((1064960 : Rat) / 4281) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-102700160 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((18332160 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((7782400 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-22915200 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2334720 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (11, 1), (15, 2)],
  term ((-6874560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17367040 : Rat) / 158397) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((49058560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (12, 2), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-2334720 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 3)],
  term ((6874560 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11174272 : Rat) / 52799) [(1, 1), (4, 1), (8, 1), (15, 3)],
  term ((57787536 : Rat) / 385571) [(1, 1), (4, 1), (8, 1), (15, 3), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((12119296 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2)],
  term ((-5523024 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-19132928 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-106028544 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((48477184 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (12, 2), (15, 2)],
  term ((-7364032 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((103142144 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((-56065520 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10007360 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((5819568 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4669440 : Rat) / 52799) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((-13749120 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((8043008 : Rat) / 158397) [(1, 1), (4, 1), (10, 1), (15, 3)],
  term ((-34871696 : Rat) / 385571) [(1, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1064960 : Rat) / 4281) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((102700160 : Rat) / 385571) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1446800 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((46755294 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10072000 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((126528352 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1875280 : Rat) / 52799) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((-66011682 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6059648 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2761512 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27020032 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-70668992 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6059648 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2761512 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((948160 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-12883404 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2334720 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-6874560 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1167360 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((3437280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 4281) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((51350080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3891200 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((11457600 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1167360 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((3437280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((8683520 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-24529280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (12, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1167360 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-3437280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((5587136 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (15, 2)],
  term ((-28893768 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6059648 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((2761512 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9566464 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((53014272 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51571072 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((28032760 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5003680 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-2909784 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2334720 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((6874560 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4021504 : Rat) / 158397) [(1, 2), (4, 1), (10, 1), (15, 2)],
  term ((17435848 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((532480 : Rat) / 4281) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-51350080 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1100 through 1199. -/
theorem rs_R005_ueqv_R005NYN_block_28_1100_1199_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_28_1100_1199
      rs_R005_ueqv_R005NYN_block_28_1100_1199 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
