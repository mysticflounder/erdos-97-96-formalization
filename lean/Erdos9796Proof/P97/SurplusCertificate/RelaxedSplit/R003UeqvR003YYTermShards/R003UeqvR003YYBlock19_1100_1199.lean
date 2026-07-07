/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:1100-1199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1100 : Poly :=
[
  term ((-513 : Rat) / 70) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1100 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1100 : Poly :=
[
  term ((-513 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((513 : Rat) / 70) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1100_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1100
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1101 : Poly :=
[
  term ((5518972 : Rat) / 53375) [(1, 1), (13, 1)]
]

/-- Partial product 1101 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1101 : Poly :=
[
  term ((11037944 : Rat) / 53375) [(1, 1), (8, 1), (13, 1)],
  term ((-5518972 : Rat) / 53375) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1101_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1101
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1102 : Poly :=
[
  term ((-4472 : Rat) / 35) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 1102 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1102 : Poly :=
[
  term ((-8944 : Rat) / 35) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((4472 : Rat) / 35) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1102_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1102
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1103 : Poly :=
[
  term ((1472 : Rat) / 35) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1103 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1103 : Poly :=
[
  term ((2944 : Rat) / 35) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1472 : Rat) / 35) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1103_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1103
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1104 : Poly :=
[
  term ((-1203 : Rat) / 35) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 1104 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1104 : Poly :=
[
  term ((-2406 : Rat) / 35) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((1203 : Rat) / 35) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1104_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1104
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1105 : Poly :=
[
  term ((-4629 : Rat) / 140) [(1, 1), (15, 1)]
]

/-- Partial product 1105 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1105 : Poly :=
[
  term ((-4629 : Rat) / 70) [(1, 1), (8, 1), (15, 1)],
  term ((4629 : Rat) / 140) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1105_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1105
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1106 : Poly :=
[
  term ((113 : Rat) / 28) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1106 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1106 : Poly :=
[
  term ((113 : Rat) / 14) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 28) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1106_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1106
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1107 : Poly :=
[
  term ((-344 : Rat) / 5) [(1, 2)]
]

/-- Partial product 1107 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1107 : Poly :=
[
  term ((344 : Rat) / 5) [(1, 2)],
  term ((-688 : Rat) / 5) [(1, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1107_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1107
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1108 : Poly :=
[
  term ((-576 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 1108 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1108 : Poly :=
[
  term ((-1152 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((576 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1108_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1108
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1109 : Poly :=
[
  term ((192 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1109 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1109 : Poly :=
[
  term ((384 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1109_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1109
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1110 : Poly :=
[
  term ((576 : Rat) / 7) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1110 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1110 : Poly :=
[
  term ((-576 : Rat) / 7) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((1152 : Rat) / 7) [(1, 2), (2, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1110_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1110
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1111 : Poly :=
[
  term ((-192 : Rat) / 7) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1111 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1111 : Poly :=
[
  term ((192 : Rat) / 7) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 2), (2, 1), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1111_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1111
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1112 : Poly :=
[
  term ((-4608 : Rat) / 35) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1112 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1112 : Poly :=
[
  term ((-9216 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((4608 : Rat) / 35) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1112_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1112
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1113 : Poly :=
[
  term ((1536 : Rat) / 35) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1113 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1113 : Poly :=
[
  term ((3072 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1113_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1113
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1114 : Poly :=
[
  term ((3168 : Rat) / 35) [(1, 2), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 1114 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1114 : Poly :=
[
  term ((6336 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3168 : Rat) / 35) [(1, 2), (2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1114_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1114
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1115 : Poly :=
[
  term ((-1056 : Rat) / 35) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1115 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1115 : Poly :=
[
  term ((-2112 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1056 : Rat) / 35) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1115_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1115
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1116 : Poly :=
[
  term ((288 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1)]
]

/-- Partial product 1116 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1116 : Poly :=
[
  term ((576 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-288 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1116_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1116
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1117 : Poly :=
[
  term ((144 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 1117 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1117 : Poly :=
[
  term ((288 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-144 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1117_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1117
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1118 : Poly :=
[
  term ((-48 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1118 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1118 : Poly :=
[
  term ((-96 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1118_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1118
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1119 : Poly :=
[
  term ((-96 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 1119 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1119 : Poly :=
[
  term ((-192 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1119_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1119
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1120 : Poly :=
[
  term (54 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 1120 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1120 : Poly :=
[
  term (108 : Rat) [(1, 2), (3, 1), (6, 1), (8, 1), (15, 1)],
  term (-54 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1120_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1120
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1121 : Poly :=
[
  term (-6 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1121 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1121 : Poly :=
[
  term (-12 : Rat) [(1, 2), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1121_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1121
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1122 : Poly :=
[
  term ((-288 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1)]
]

/-- Partial product 1122 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1122 : Poly :=
[
  term ((288 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((-576 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1122_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1122
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1123 : Poly :=
[
  term ((-144 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1123 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1123 : Poly :=
[
  term ((144 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-288 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1123_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1123
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1124 : Poly :=
[
  term ((48 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1124 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1124 : Poly :=
[
  term ((-48 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1124_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1124
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1125 : Poly :=
[
  term ((96 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1125 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1125 : Poly :=
[
  term ((-96 : Rat) / 7) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1125_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1125
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1126 : Poly :=
[
  term (-54 : Rat) [(1, 2), (3, 1), (8, 1), (15, 1)]
]

/-- Partial product 1126 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1126 : Poly :=
[
  term (54 : Rat) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term (-108 : Rat) [(1, 2), (3, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1126_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1126
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1127 : Poly :=
[
  term (6 : Rat) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1127 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1127 : Poly :=
[
  term (-6 : Rat) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (3, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1127_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1127
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1128 : Poly :=
[
  term ((2304 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1)]
]

/-- Partial product 1128 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1128 : Poly :=
[
  term ((4608 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2304 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1128_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1128
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1129 : Poly :=
[
  term ((1152 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1129 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1129 : Poly :=
[
  term ((2304 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1152 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1129_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1129
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1130 : Poly :=
[
  term ((-384 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1130 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1130 : Poly :=
[
  term ((-768 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1130_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1130
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1131 : Poly :=
[
  term ((-768 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1131 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1131 : Poly :=
[
  term ((-1536 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((768 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1131_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1131
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1132 : Poly :=
[
  term ((324 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1)]
]

/-- Partial product 1132 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1132 : Poly :=
[
  term ((648 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-324 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1132_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1132
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1133 : Poly :=
[
  term ((-36 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1133 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1133 : Poly :=
[
  term ((-72 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1133_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1133
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1134 : Poly :=
[
  term ((-1584 : Rat) / 35) [(1, 2), (3, 1), (11, 1)]
]

/-- Partial product 1134 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1134 : Poly :=
[
  term ((-3168 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((1584 : Rat) / 35) [(1, 2), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1134_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1134
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1135 : Poly :=
[
  term ((-792 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 1135 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1135 : Poly :=
[
  term ((-1584 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((792 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1135_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1135
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1136 : Poly :=
[
  term ((264 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1136 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1136 : Poly :=
[
  term ((528 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1136_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1136
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1137 : Poly :=
[
  term ((528 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1137 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1137 : Poly :=
[
  term ((1056 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-528 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1137_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1137
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1138 : Poly :=
[
  term ((-189 : Rat) / 5) [(1, 2), (3, 1), (15, 1)]
]

/-- Partial product 1138 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1138 : Poly :=
[
  term ((-378 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((189 : Rat) / 5) [(1, 2), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1138_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1138
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1139 : Poly :=
[
  term ((21 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1139 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1139 : Poly :=
[
  term ((42 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1139_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1139
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1140 : Poly :=
[
  term ((-9216 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1140 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1140 : Poly :=
[
  term ((-18432 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((9216 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1140_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1140
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1141 : Poly :=
[
  term ((9216 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1141 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1141 : Poly :=
[
  term ((-9216 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((18432 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1141_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1141
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1142 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1142 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1142 : Poly :=
[
  term ((-110592 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1142_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1142
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1143 : Poly :=
[
  term ((32256 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1)]
]

/-- Partial product 1143 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1143 : Poly :=
[
  term ((64512 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((-32256 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1143_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1143
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1144 : Poly :=
[
  term ((-43584 : Rat) / 10675) [(1, 2), (4, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1144 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1144 : Poly :=
[
  term ((-87168 : Rat) / 10675) [(1, 2), (4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((43584 : Rat) / 10675) [(1, 2), (4, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1144_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1144
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1145 : Poly :=
[
  term ((43584 : Rat) / 10675) [(1, 2), (4, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1145 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1145 : Poly :=
[
  term ((-43584 : Rat) / 10675) [(1, 2), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((87168 : Rat) / 10675) [(1, 2), (4, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1145_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1145
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1146 : Poly :=
[
  term ((-2112 : Rat) / 427) [(1, 2), (4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1146 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1146 : Poly :=
[
  term ((-4224 : Rat) / 427) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((2112 : Rat) / 427) [(1, 2), (4, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1146_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1146
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1147 : Poly :=
[
  term ((31008 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (13, 1)]
]

/-- Partial product 1147 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1147 : Poly :=
[
  term ((62016 : Rat) / 10675) [(1, 2), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-31008 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1147_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1147
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1148 : Poly :=
[
  term ((55296 : Rat) / 7625) [(1, 2), (4, 2), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1148 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1148 : Poly :=
[
  term ((110592 : Rat) / 7625) [(1, 2), (4, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1148_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1148
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1149 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1149 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1149 : Poly :=
[
  term ((55296 : Rat) / 7625) [(1, 2), (4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(1, 2), (4, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1149_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1149
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1150 : Poly :=
[
  term ((55296 : Rat) / 7625) [(1, 2), (4, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1150 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1150 : Poly :=
[
  term ((110592 : Rat) / 7625) [(1, 2), (4, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1150_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1150
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1151 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (13, 1)]
]

/-- Partial product 1151 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1151 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (8, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1151_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1151
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1152 : Poly :=
[
  term ((1824 : Rat) / 1525) [(1, 2), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 1152 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1152 : Poly :=
[
  term ((3648 : Rat) / 1525) [(1, 2), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-1824 : Rat) / 1525) [(1, 2), (5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1152_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1152
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1153 : Poly :=
[
  term ((-1824 : Rat) / 1525) [(1, 2), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 1153 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1153 : Poly :=
[
  term ((1824 : Rat) / 1525) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((-3648 : Rat) / 1525) [(1, 2), (5, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1153_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1153
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1154 : Poly :=
[
  term ((10944 : Rat) / 7625) [(1, 2), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1154 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1154 : Poly :=
[
  term ((21888 : Rat) / 7625) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(1, 2), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1154_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1154
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1155 : Poly :=
[
  term ((-6384 : Rat) / 7625) [(1, 2), (5, 1), (13, 1)]
]

/-- Partial product 1155 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1155 : Poly :=
[
  term ((-12768 : Rat) / 7625) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((6384 : Rat) / 7625) [(1, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1155_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1155
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1156 : Poly :=
[
  term ((544 : Rat) / 5) [(1, 2), (6, 1)]
]

/-- Partial product 1156 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1156 : Poly :=
[
  term ((-544 : Rat) / 5) [(1, 2), (6, 1)],
  term ((1088 : Rat) / 5) [(1, 2), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1156_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1156
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1157 : Poly :=
[
  term ((4785968 : Rat) / 53375) [(1, 2), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1157 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1157 : Poly :=
[
  term ((9571936 : Rat) / 53375) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-4785968 : Rat) / 53375) [(1, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1157_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1157
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1158 : Poly :=
[
  term ((-768 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1158 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1158 : Poly :=
[
  term ((-1536 : Rat) / 7) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1158_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1158
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1159 : Poly :=
[
  term ((256 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1159 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1159 : Poly :=
[
  term ((512 : Rat) / 7) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1159_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1159
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1160 : Poly :=
[
  term ((-208 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1160 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1160 : Poly :=
[
  term ((-416 : Rat) / 7) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1160_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1160
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1161 : Poly :=
[
  term ((5543 : Rat) / 105) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 1161 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1161 : Poly :=
[
  term ((11086 : Rat) / 105) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-5543 : Rat) / 105) [(1, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1161_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1161
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1162 : Poly :=
[
  term ((-229 : Rat) / 35) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1162 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1162 : Poly :=
[
  term ((-458 : Rat) / 35) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((229 : Rat) / 35) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1162_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1162
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1163 : Poly :=
[
  term (-104 : Rat) [(1, 2), (6, 1), (14, 1)]
]

/-- Partial product 1163 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1163 : Poly :=
[
  term (-208 : Rat) [(1, 2), (6, 1), (8, 1), (14, 1)],
  term (104 : Rat) [(1, 2), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1163_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1163
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1164 : Poly :=
[
  term ((2 : Rat) / 5) [(1, 2), (6, 1), (16, 1)]
]

/-- Partial product 1164 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1164 : Poly :=
[
  term ((4 : Rat) / 5) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1164_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1164
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1165 : Poly :=
[
  term ((-544 : Rat) / 5) [(1, 2), (8, 1)]
]

/-- Partial product 1165 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1165 : Poly :=
[
  term ((544 : Rat) / 5) [(1, 2), (8, 1)],
  term ((-1088 : Rat) / 5) [(1, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1165_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1165
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1166 : Poly :=
[
  term ((-4785968 : Rat) / 53375) [(1, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1166 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1166 : Poly :=
[
  term ((4785968 : Rat) / 53375) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-9571936 : Rat) / 53375) [(1, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1166_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1166
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1167 : Poly :=
[
  term ((768 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1167 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1167 : Poly :=
[
  term ((-768 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7) [(1, 2), (8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1167_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1167
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1168 : Poly :=
[
  term ((-256 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1168 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1168 : Poly :=
[
  term ((256 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(1, 2), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1168_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1168
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1169 : Poly :=
[
  term ((208 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1169 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1169 : Poly :=
[
  term ((-208 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 7) [(1, 2), (8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1169_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1169
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1170 : Poly :=
[
  term ((-5543 : Rat) / 105) [(1, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1170 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1170 : Poly :=
[
  term ((5543 : Rat) / 105) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-11086 : Rat) / 105) [(1, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1170_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1170
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1171 : Poly :=
[
  term ((229 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1171 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1171 : Poly :=
[
  term ((-229 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((458 : Rat) / 35) [(1, 2), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1171_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1171
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1172 : Poly :=
[
  term (104 : Rat) [(1, 2), (8, 1), (14, 1)]
]

/-- Partial product 1172 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1172 : Poly :=
[
  term (-104 : Rat) [(1, 2), (8, 1), (14, 1)],
  term (208 : Rat) [(1, 2), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1172_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1172
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1173 : Poly :=
[
  term ((-2 : Rat) / 5) [(1, 2), (8, 1), (16, 1)]
]

/-- Partial product 1173 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1173 : Poly :=
[
  term ((2 : Rat) / 5) [(1, 2), (8, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1173_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1173
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1174 : Poly :=
[
  term ((616 : Rat) / 5) [(1, 2), (10, 1)]
]

/-- Partial product 1174 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1174 : Poly :=
[
  term ((1232 : Rat) / 5) [(1, 2), (8, 1), (10, 1)],
  term ((-616 : Rat) / 5) [(1, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1174_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1174
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1175 : Poly :=
[
  term ((125408 : Rat) / 875) [(1, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1175 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1175 : Poly :=
[
  term ((250816 : Rat) / 875) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-125408 : Rat) / 875) [(1, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1175_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1175
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1176 : Poly :=
[
  term ((-6144 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1176 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1176 : Poly :=
[
  term ((-12288 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((6144 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1176_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1176
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1177 : Poly :=
[
  term ((2048 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1177 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1177 : Poly :=
[
  term ((4096 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1177_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1177
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1178 : Poly :=
[
  term ((-1664 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1178 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1178 : Poly :=
[
  term ((-3328 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1178_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1178
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1179 : Poly :=
[
  term ((9209 : Rat) / 105) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1179 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1179 : Poly :=
[
  term ((18418 : Rat) / 105) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9209 : Rat) / 105) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1179_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1179
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1180 : Poly :=
[
  term ((-379 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1180 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1180 : Poly :=
[
  term ((-758 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1180_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1180
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1181 : Poly :=
[
  term ((-576 : Rat) / 5) [(1, 2), (10, 1), (14, 1)]
]

/-- Partial product 1181 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1181 : Poly :=
[
  term ((-1152 : Rat) / 5) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((576 : Rat) / 5) [(1, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1181_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1181
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1182 : Poly :=
[
  term ((-5256904 : Rat) / 53375) [(1, 2), (11, 1), (13, 1)]
]

/-- Partial product 1182 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1182 : Poly :=
[
  term ((-10513808 : Rat) / 53375) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((5256904 : Rat) / 53375) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1182_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1182
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1183 : Poly :=
[
  term ((4224 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1183 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1183 : Poly :=
[
  term ((8448 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4224 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1183_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1183
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1184 : Poly :=
[
  term ((-1408 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1184 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1184 : Poly :=
[
  term ((-2816 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1184_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1184
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1185 : Poly :=
[
  term ((1144 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1185 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1185 : Poly :=
[
  term ((2288 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1185_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1185
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1186 : Poly :=
[
  term ((-2575 : Rat) / 42) [(1, 2), (11, 1), (15, 1)]
]

/-- Partial product 1186 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1186 : Poly :=
[
  term ((-2575 : Rat) / 21) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((2575 : Rat) / 42) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1186_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1186
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1187 : Poly :=
[
  term ((529 : Rat) / 70) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1187 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1187 : Poly :=
[
  term ((529 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-529 : Rat) / 70) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1187_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1187
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1188 : Poly :=
[
  term ((316 : Rat) / 5) [(1, 2), (14, 1)]
]

/-- Partial product 1188 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1188 : Poly :=
[
  term ((632 : Rat) / 5) [(1, 2), (8, 1), (14, 1)],
  term ((-316 : Rat) / 5) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1188_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1188
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1189 : Poly :=
[
  term ((1 : Rat) / 5) [(1, 2), (16, 1)]
]

/-- Partial product 1189 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1189 : Poly :=
[
  term ((2 : Rat) / 5) [(1, 2), (8, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1189_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1189
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1190 : Poly :=
[
  term ((66 : Rat) / 5) [(2, 1)]
]

/-- Partial product 1190 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1190 : Poly :=
[
  term ((-66 : Rat) / 5) [(2, 1)],
  term ((132 : Rat) / 5) [(2, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1190_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1190
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1191 : Poly :=
[
  term ((1728 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 1191 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1191 : Poly :=
[
  term ((3456 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1728 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1191_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1191
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1192 : Poly :=
[
  term ((-576 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1192 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1192 : Poly :=
[
  term ((-1152 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1192_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1192
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1193 : Poly :=
[
  term ((-3456 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1193 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1193 : Poly :=
[
  term ((-6912 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((3456 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1193_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1193
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1194 : Poly :=
[
  term ((1152 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1194 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1194 : Poly :=
[
  term ((2304 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1194_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1194
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1195 : Poly :=
[
  term ((5184 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1195 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1195 : Poly :=
[
  term ((10368 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5184 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1195_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1195
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1196 : Poly :=
[
  term ((-1728 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1196 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1196 : Poly :=
[
  term ((-3456 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1196_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1196
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1197 : Poly :=
[
  term ((3456 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1197 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1197 : Poly :=
[
  term ((-3456 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((6912 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1197_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1197
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1198 : Poly :=
[
  term ((-1152 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1198 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1198 : Poly :=
[
  term ((1152 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1198_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1198
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1199 : Poly :=
[
  term ((-5184 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1199 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1199 : Poly :=
[
  term ((5184 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-10368 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1199_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1199
        rs_R003_ueqv_R003YY_generator_19_1100_1199 =
      rs_R003_ueqv_R003YY_partial_19_1199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_1100_1199 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_1100,
  rs_R003_ueqv_R003YY_partial_19_1101,
  rs_R003_ueqv_R003YY_partial_19_1102,
  rs_R003_ueqv_R003YY_partial_19_1103,
  rs_R003_ueqv_R003YY_partial_19_1104,
  rs_R003_ueqv_R003YY_partial_19_1105,
  rs_R003_ueqv_R003YY_partial_19_1106,
  rs_R003_ueqv_R003YY_partial_19_1107,
  rs_R003_ueqv_R003YY_partial_19_1108,
  rs_R003_ueqv_R003YY_partial_19_1109,
  rs_R003_ueqv_R003YY_partial_19_1110,
  rs_R003_ueqv_R003YY_partial_19_1111,
  rs_R003_ueqv_R003YY_partial_19_1112,
  rs_R003_ueqv_R003YY_partial_19_1113,
  rs_R003_ueqv_R003YY_partial_19_1114,
  rs_R003_ueqv_R003YY_partial_19_1115,
  rs_R003_ueqv_R003YY_partial_19_1116,
  rs_R003_ueqv_R003YY_partial_19_1117,
  rs_R003_ueqv_R003YY_partial_19_1118,
  rs_R003_ueqv_R003YY_partial_19_1119,
  rs_R003_ueqv_R003YY_partial_19_1120,
  rs_R003_ueqv_R003YY_partial_19_1121,
  rs_R003_ueqv_R003YY_partial_19_1122,
  rs_R003_ueqv_R003YY_partial_19_1123,
  rs_R003_ueqv_R003YY_partial_19_1124,
  rs_R003_ueqv_R003YY_partial_19_1125,
  rs_R003_ueqv_R003YY_partial_19_1126,
  rs_R003_ueqv_R003YY_partial_19_1127,
  rs_R003_ueqv_R003YY_partial_19_1128,
  rs_R003_ueqv_R003YY_partial_19_1129,
  rs_R003_ueqv_R003YY_partial_19_1130,
  rs_R003_ueqv_R003YY_partial_19_1131,
  rs_R003_ueqv_R003YY_partial_19_1132,
  rs_R003_ueqv_R003YY_partial_19_1133,
  rs_R003_ueqv_R003YY_partial_19_1134,
  rs_R003_ueqv_R003YY_partial_19_1135,
  rs_R003_ueqv_R003YY_partial_19_1136,
  rs_R003_ueqv_R003YY_partial_19_1137,
  rs_R003_ueqv_R003YY_partial_19_1138,
  rs_R003_ueqv_R003YY_partial_19_1139,
  rs_R003_ueqv_R003YY_partial_19_1140,
  rs_R003_ueqv_R003YY_partial_19_1141,
  rs_R003_ueqv_R003YY_partial_19_1142,
  rs_R003_ueqv_R003YY_partial_19_1143,
  rs_R003_ueqv_R003YY_partial_19_1144,
  rs_R003_ueqv_R003YY_partial_19_1145,
  rs_R003_ueqv_R003YY_partial_19_1146,
  rs_R003_ueqv_R003YY_partial_19_1147,
  rs_R003_ueqv_R003YY_partial_19_1148,
  rs_R003_ueqv_R003YY_partial_19_1149,
  rs_R003_ueqv_R003YY_partial_19_1150,
  rs_R003_ueqv_R003YY_partial_19_1151,
  rs_R003_ueqv_R003YY_partial_19_1152,
  rs_R003_ueqv_R003YY_partial_19_1153,
  rs_R003_ueqv_R003YY_partial_19_1154,
  rs_R003_ueqv_R003YY_partial_19_1155,
  rs_R003_ueqv_R003YY_partial_19_1156,
  rs_R003_ueqv_R003YY_partial_19_1157,
  rs_R003_ueqv_R003YY_partial_19_1158,
  rs_R003_ueqv_R003YY_partial_19_1159,
  rs_R003_ueqv_R003YY_partial_19_1160,
  rs_R003_ueqv_R003YY_partial_19_1161,
  rs_R003_ueqv_R003YY_partial_19_1162,
  rs_R003_ueqv_R003YY_partial_19_1163,
  rs_R003_ueqv_R003YY_partial_19_1164,
  rs_R003_ueqv_R003YY_partial_19_1165,
  rs_R003_ueqv_R003YY_partial_19_1166,
  rs_R003_ueqv_R003YY_partial_19_1167,
  rs_R003_ueqv_R003YY_partial_19_1168,
  rs_R003_ueqv_R003YY_partial_19_1169,
  rs_R003_ueqv_R003YY_partial_19_1170,
  rs_R003_ueqv_R003YY_partial_19_1171,
  rs_R003_ueqv_R003YY_partial_19_1172,
  rs_R003_ueqv_R003YY_partial_19_1173,
  rs_R003_ueqv_R003YY_partial_19_1174,
  rs_R003_ueqv_R003YY_partial_19_1175,
  rs_R003_ueqv_R003YY_partial_19_1176,
  rs_R003_ueqv_R003YY_partial_19_1177,
  rs_R003_ueqv_R003YY_partial_19_1178,
  rs_R003_ueqv_R003YY_partial_19_1179,
  rs_R003_ueqv_R003YY_partial_19_1180,
  rs_R003_ueqv_R003YY_partial_19_1181,
  rs_R003_ueqv_R003YY_partial_19_1182,
  rs_R003_ueqv_R003YY_partial_19_1183,
  rs_R003_ueqv_R003YY_partial_19_1184,
  rs_R003_ueqv_R003YY_partial_19_1185,
  rs_R003_ueqv_R003YY_partial_19_1186,
  rs_R003_ueqv_R003YY_partial_19_1187,
  rs_R003_ueqv_R003YY_partial_19_1188,
  rs_R003_ueqv_R003YY_partial_19_1189,
  rs_R003_ueqv_R003YY_partial_19_1190,
  rs_R003_ueqv_R003YY_partial_19_1191,
  rs_R003_ueqv_R003YY_partial_19_1192,
  rs_R003_ueqv_R003YY_partial_19_1193,
  rs_R003_ueqv_R003YY_partial_19_1194,
  rs_R003_ueqv_R003YY_partial_19_1195,
  rs_R003_ueqv_R003YY_partial_19_1196,
  rs_R003_ueqv_R003YY_partial_19_1197,
  rs_R003_ueqv_R003YY_partial_19_1198,
  rs_R003_ueqv_R003YY_partial_19_1199
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_1100_1199 : Poly :=
[
  term ((-513 : Rat) / 35) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11037944 : Rat) / 53375) [(1, 1), (8, 1), (13, 1)],
  term ((-8944 : Rat) / 35) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((2944 : Rat) / 35) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2406 : Rat) / 35) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-4629 : Rat) / 70) [(1, 1), (8, 1), (15, 1)],
  term ((113 : Rat) / 14) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((513 : Rat) / 70) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5518972 : Rat) / 53375) [(1, 1), (13, 1)],
  term ((4472 : Rat) / 35) [(1, 1), (13, 1), (14, 1)],
  term ((-1472 : Rat) / 35) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((1203 : Rat) / 35) [(1, 1), (13, 1), (16, 1)],
  term ((4629 : Rat) / 140) [(1, 1), (15, 1)],
  term ((-113 : Rat) / 28) [(1, 1), (15, 1), (16, 1)],
  term ((344 : Rat) / 5) [(1, 2)],
  term ((-1152 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((384 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-192 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9216 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((3072 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1152 : Rat) / 35) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 7) [(1, 2), (2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-384 : Rat) / 7) [(1, 2), (2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1536 : Rat) / 35) [(1, 2), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3168 : Rat) / 35) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((1056 : Rat) / 35) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((288 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term (108 : Rat) [(1, 2), (3, 1), (6, 1), (8, 1), (15, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-144 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((48 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term (-54 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((2304 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((648 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((-864 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((288 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((12 : Rat) / 5) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1)],
  term ((-288 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1), (14, 1)],
  term ((96 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 2), (3, 1), (8, 2), (11, 1), (16, 1)],
  term (-108 : Rat) [(1, 2), (3, 1), (8, 2), (15, 1)],
  term (12 : Rat) [(1, 2), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-1152 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((384 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(1, 2), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-324 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((36 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 35) [(1, 2), (3, 1), (11, 1)],
  term ((792 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-264 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-528 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((189 : Rat) / 5) [(1, 2), (3, 1), (15, 1)],
  term ((-21 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-18432 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((9216 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((18432 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((18432 : Rat) / 1525) [(1, 2), (4, 1), (5, 1), (8, 2), (13, 1)],
  term ((55296 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((-32256 : Rat) / 7625) [(1, 2), (4, 1), (5, 1), (13, 1)],
  term ((-87168 : Rat) / 10675) [(1, 2), (4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((43584 : Rat) / 10675) [(1, 2), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-4224 : Rat) / 427) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((18432 : Rat) / 10675) [(1, 2), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((87168 : Rat) / 10675) [(1, 2), (4, 1), (8, 2), (11, 1), (13, 1)],
  term ((2112 : Rat) / 427) [(1, 2), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-31008 : Rat) / 10675) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(1, 2), (4, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (6, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(1, 2), (4, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(1, 2), (4, 2), (8, 2), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(1, 2), (4, 2), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(1, 2), (4, 2), (11, 1), (13, 1)],
  term ((3648 : Rat) / 1525) [(1, 2), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-1824 : Rat) / 1525) [(1, 2), (5, 1), (6, 1), (13, 1)],
  term ((21888 : Rat) / 7625) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-3648 : Rat) / 7625) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((-3648 : Rat) / 1525) [(1, 2), (5, 1), (8, 2), (13, 1)],
  term ((-10944 : Rat) / 7625) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((6384 : Rat) / 7625) [(1, 2), (5, 1), (13, 1)],
  term ((-544 : Rat) / 5) [(1, 2), (6, 1)],
  term ((1088 : Rat) / 5) [(1, 2), (6, 1), (8, 1)],
  term ((9571936 : Rat) / 53375) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(1, 2), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((11086 : Rat) / 105) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-458 : Rat) / 35) [(1, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (-208 : Rat) [(1, 2), (6, 1), (8, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-4785968 : Rat) / 53375) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((768 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5543 : Rat) / 105) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((229 : Rat) / 35) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (104 : Rat) [(1, 2), (6, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (6, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (8, 1)],
  term ((1232 : Rat) / 5) [(1, 2), (8, 1), (10, 1)],
  term ((250816 : Rat) / 875) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-12288 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((4096 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3328 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((18418 : Rat) / 105) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-758 : Rat) / 35) [(1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(1, 2), (8, 1), (10, 1), (14, 1)],
  term ((-1145568 : Rat) / 10675) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((4608 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2444 : Rat) / 35) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((60 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 5) [(1, 2), (8, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 2), (8, 1), (16, 1)],
  term ((-1088 : Rat) / 5) [(1, 2), (8, 2)],
  term ((-9571936 : Rat) / 53375) [(1, 2), (8, 2), (11, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(1, 2), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(1, 2), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(1, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11086 : Rat) / 105) [(1, 2), (8, 2), (11, 1), (15, 1)],
  term ((458 : Rat) / 35) [(1, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term (208 : Rat) [(1, 2), (8, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(1, 2), (8, 2), (16, 1)],
  term ((-616 : Rat) / 5) [(1, 2), (10, 1)],
  term ((-125408 : Rat) / 875) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((6144 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2048 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 105) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((379 : Rat) / 35) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 2), (10, 1), (14, 1)],
  term ((5256904 : Rat) / 53375) [(1, 2), (11, 1), (13, 1)],
  term ((-4224 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((1408 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((2575 : Rat) / 42) [(1, 2), (11, 1), (15, 1)],
  term ((-529 : Rat) / 70) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-316 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-1 : Rat) / 5) [(1, 2), (16, 1)],
  term ((-66 : Rat) / 5) [(2, 1)],
  term ((3456 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1152 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((576 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2304 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10368 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3456 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1152 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((1728 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1152 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5184 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((6912 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2304 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10368 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((132 : Rat) / 5) [(2, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1100 through 1199. -/
theorem rs_R003_ueqv_R003YY_block_19_1100_1199_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_1100_1199
      rs_R003_ueqv_R003YY_block_19_1100_1199 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
