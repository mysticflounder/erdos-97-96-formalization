/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 25:100-130

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_25_0100_0130 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0100 : Poly :=
[
  term ((-435309 : Rat) / 3749) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 100 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0100 : Poly :=
[
  term ((870618 : Rat) / 3749) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-435309 : Rat) / 3749) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((870618 : Rat) / 3749) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-435309 : Rat) / 3749) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0100_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0100
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0101 : Poly :=
[
  term ((112110 : Rat) / 3749) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0101 : Poly :=
[
  term ((-224220 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((112110 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-224220 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((112110 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0101_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0101
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0102 : Poly :=
[
  term ((85659 : Rat) / 3749) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0102 : Poly :=
[
  term ((-171318 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-171318 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0102_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0102
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0103 : Poly :=
[
  term ((334001 : Rat) / 52486) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 103 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0103 : Poly :=
[
  term ((-334001 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((334001 : Rat) / 52486) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-334001 : Rat) / 26243) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((334001 : Rat) / 52486) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0103_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0103
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0104 : Poly :=
[
  term ((448440 : Rat) / 3749) [(9, 1), (13, 3), (16, 1)]
]

/-- Partial product 104 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0104 : Poly :=
[
  term ((-896880 : Rat) / 3749) [(0, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((448440 : Rat) / 3749) [(0, 2), (9, 1), (13, 3), (16, 1)],
  term ((-896880 : Rat) / 3749) [(1, 1), (9, 1), (13, 4), (16, 1)],
  term ((448440 : Rat) / 3749) [(1, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0104_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0104
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0105 : Poly :=
[
  term ((-3516213 : Rat) / 26243) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0105 : Poly :=
[
  term ((7032426 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3516213 : Rat) / 26243) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((7032426 : Rat) / 26243) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3516213 : Rat) / 26243) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0105_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0105
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0106 : Poly :=
[
  term ((182637 : Rat) / 3749) [(9, 2), (16, 1)]
]

/-- Partial product 106 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0106 : Poly :=
[
  term ((-365274 : Rat) / 3749) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(0, 2), (9, 2), (16, 1)],
  term ((-365274 : Rat) / 3749) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0106_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0106
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0107 : Poly :=
[
  term ((-156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0107 : Poly :=
[
  term ((156561 : Rat) / 1141) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((156561 : Rat) / 1141) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0107_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0107
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0108 : Poly :=
[
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 108 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0108 : Poly :=
[
  term ((3083749 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(0, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0108_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0108
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0109 : Poly :=
[
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 109 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0109 : Poly :=
[
  term ((-5135122 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((2567561 : Rat) / 26243) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((2567561 : Rat) / 26243) [(1, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0109_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0109
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0110 : Poly :=
[
  term ((156561 : Rat) / 4564) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0110 : Poly :=
[
  term ((-156561 : Rat) / 2282) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0110_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0110
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0111 : Poly :=
[
  term ((19517627 : Rat) / 209944) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 111 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0111 : Poly :=
[
  term ((-19517627 : Rat) / 104972) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((19517627 : Rat) / 209944) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-19517627 : Rat) / 104972) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((19517627 : Rat) / 209944) [(1, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0111_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0111
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0112 : Poly :=
[
  term ((-1480063 : Rat) / 104972) [(10, 1), (16, 1)]
]

/-- Partial product 112 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0112 : Poly :=
[
  term ((1480063 : Rat) / 52486) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1480063 : Rat) / 104972) [(0, 2), (10, 1), (16, 1)],
  term ((1480063 : Rat) / 52486) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1480063 : Rat) / 104972) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0112_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0112
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0113 : Poly :=
[
  term ((-3083749 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 113 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0113 : Poly :=
[
  term ((3083749 : Rat) / 104972) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0113_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0113
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0114 : Poly :=
[
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0114 : Poly :=
[
  term ((10453344 : Rat) / 26243) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10453344 : Rat) / 26243) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0114_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0114
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0115 : Poly :=
[
  term ((-3414669 : Rat) / 59984) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0115 : Poly :=
[
  term ((3414669 : Rat) / 29992) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3414669 : Rat) / 59984) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((3414669 : Rat) / 29992) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3414669 : Rat) / 59984) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0115_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0115
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0116 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0116 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0116_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0116
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0117 : Poly :=
[
  term ((-3083749 : Rat) / 52486) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 117 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0117 : Poly :=
[
  term ((3083749 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(0, 2), (11, 1), (13, 3), (16, 1)],
  term ((3083749 : Rat) / 26243) [(1, 1), (11, 1), (13, 4), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(1, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0117_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0117
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0118 : Poly :=
[
  term ((8668232 : Rat) / 26243) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0118 : Poly :=
[
  term ((-17336464 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8668232 : Rat) / 26243) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17336464 : Rat) / 26243) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8668232 : Rat) / 26243) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0118_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0118
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0119 : Poly :=
[
  term ((-89964 : Rat) / 3749) [(11, 2), (16, 1)]
]

/-- Partial product 119 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0119 : Poly :=
[
  term ((179928 : Rat) / 3749) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-89964 : Rat) / 3749) [(0, 2), (11, 2), (16, 1)],
  term ((179928 : Rat) / 3749) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-89964 : Rat) / 3749) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0119_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0119
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0120 : Poly :=
[
  term ((-1298911 : Rat) / 104972) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0120 : Poly :=
[
  term ((1298911 : Rat) / 52486) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1298911 : Rat) / 52486) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0120_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0120
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0121 : Poly :=
[
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0121 : Poly :=
[
  term ((2049441 : Rat) / 52486) [(0, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(0, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(1, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(1, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0121_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0121
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0122 : Poly :=
[
  term ((-9583233 : Rat) / 209944) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 122 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0122 : Poly :=
[
  term ((9583233 : Rat) / 104972) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((9583233 : Rat) / 104972) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(1, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0122_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0122
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0123 : Poly :=
[
  term ((-227404 : Rat) / 26243) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0123 : Poly :=
[
  term ((454808 : Rat) / 26243) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((454808 : Rat) / 26243) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0123_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0123
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0124 : Poly :=
[
  term ((-20859 : Rat) / 1141) [(12, 1), (16, 1)]
]

/-- Partial product 124 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0124 : Poly :=
[
  term ((41718 : Rat) / 1141) [(0, 1), (12, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(0, 2), (12, 1), (16, 1)],
  term ((41718 : Rat) / 1141) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20859 : Rat) / 1141) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0124_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0124
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0125 : Poly :=
[
  term ((14806839 : Rat) / 419888) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0125 : Poly :=
[
  term ((-14806839 : Rat) / 209944) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14806839 : Rat) / 419888) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14806839 : Rat) / 209944) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((14806839 : Rat) / 419888) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0125_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0125
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0126 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0126 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(1, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0126_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0126
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0127 : Poly :=
[
  term ((35667727 : Rat) / 839776) [(13, 2), (16, 1)]
]

/-- Partial product 127 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0127 : Poly :=
[
  term ((-35667727 : Rat) / 419888) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((35667727 : Rat) / 839776) [(0, 2), (13, 2), (16, 1)],
  term ((-35667727 : Rat) / 419888) [(1, 1), (13, 3), (16, 1)],
  term ((35667727 : Rat) / 839776) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0127_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0127
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0128 : Poly :=
[
  term ((3083749 : Rat) / 104972) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0128 : Poly :=
[
  term ((-3083749 : Rat) / 52486) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(1, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0128_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0128
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0129 : Poly :=
[
  term ((-867475 : Rat) / 14996) [(15, 2), (16, 1)]
]

/-- Partial product 129 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0129 : Poly :=
[
  term ((867475 : Rat) / 7498) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-867475 : Rat) / 14996) [(0, 2), (15, 2), (16, 1)],
  term ((867475 : Rat) / 7498) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-867475 : Rat) / 14996) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0129_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0129
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005YNY_coefficient_25_0130 : Poly :=
[
  term ((-15612269 : Rat) / 419888) [(16, 1)]
]

/-- Partial product 130 for generator 25. -/
def rs_R005_ueqv_R005YNY_partial_25_0130 : Poly :=
[
  term ((15612269 : Rat) / 209944) [(0, 1), (12, 1), (16, 1)],
  term ((-15612269 : Rat) / 419888) [(0, 2), (16, 1)],
  term ((15612269 : Rat) / 209944) [(1, 1), (13, 1), (16, 1)],
  term ((-15612269 : Rat) / 419888) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 25. -/
theorem rs_R005_ueqv_R005YNY_partial_25_0130_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_25_0130
        rs_R005_ueqv_R005YNY_generator_25_0100_0130 =
      rs_R005_ueqv_R005YNY_partial_25_0130 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_25_0100_0130 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_25_0100,
  rs_R005_ueqv_R005YNY_partial_25_0101,
  rs_R005_ueqv_R005YNY_partial_25_0102,
  rs_R005_ueqv_R005YNY_partial_25_0103,
  rs_R005_ueqv_R005YNY_partial_25_0104,
  rs_R005_ueqv_R005YNY_partial_25_0105,
  rs_R005_ueqv_R005YNY_partial_25_0106,
  rs_R005_ueqv_R005YNY_partial_25_0107,
  rs_R005_ueqv_R005YNY_partial_25_0108,
  rs_R005_ueqv_R005YNY_partial_25_0109,
  rs_R005_ueqv_R005YNY_partial_25_0110,
  rs_R005_ueqv_R005YNY_partial_25_0111,
  rs_R005_ueqv_R005YNY_partial_25_0112,
  rs_R005_ueqv_R005YNY_partial_25_0113,
  rs_R005_ueqv_R005YNY_partial_25_0114,
  rs_R005_ueqv_R005YNY_partial_25_0115,
  rs_R005_ueqv_R005YNY_partial_25_0116,
  rs_R005_ueqv_R005YNY_partial_25_0117,
  rs_R005_ueqv_R005YNY_partial_25_0118,
  rs_R005_ueqv_R005YNY_partial_25_0119,
  rs_R005_ueqv_R005YNY_partial_25_0120,
  rs_R005_ueqv_R005YNY_partial_25_0121,
  rs_R005_ueqv_R005YNY_partial_25_0122,
  rs_R005_ueqv_R005YNY_partial_25_0123,
  rs_R005_ueqv_R005YNY_partial_25_0124,
  rs_R005_ueqv_R005YNY_partial_25_0125,
  rs_R005_ueqv_R005YNY_partial_25_0126,
  rs_R005_ueqv_R005YNY_partial_25_0127,
  rs_R005_ueqv_R005YNY_partial_25_0128,
  rs_R005_ueqv_R005YNY_partial_25_0129,
  rs_R005_ueqv_R005YNY_partial_25_0130
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_25_0100_0130 : Poly :=
[
  term ((870618 : Rat) / 3749) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-334001 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-896880 : Rat) / 3749) [(0, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((7032426 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-224220 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-171318 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-365274 : Rat) / 3749) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((156561 : Rat) / 1141) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19517627 : Rat) / 104972) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((1480063 : Rat) / 52486) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((3414669 : Rat) / 29992) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-17336464 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((10453344 : Rat) / 26243) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((179928 : Rat) / 3749) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14806839 : Rat) / 209944) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(0, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-35667727 : Rat) / 419888) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((867475 : Rat) / 7498) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((15612269 : Rat) / 209944) [(0, 1), (12, 1), (16, 1)],
  term ((1298911 : Rat) / 52486) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(0, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 104972) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((454808 : Rat) / 26243) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((41718 : Rat) / 1141) [(0, 1), (12, 2), (16, 1)],
  term ((-435309 : Rat) / 3749) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((112110 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((334001 : Rat) / 52486) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(0, 2), (9, 1), (13, 3), (16, 1)],
  term ((-3516213 : Rat) / 26243) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(0, 2), (9, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(0, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((2567561 : Rat) / 26243) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((19517627 : Rat) / 209944) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1480063 : Rat) / 104972) [(0, 2), (10, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3414669 : Rat) / 59984) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(0, 2), (11, 1), (13, 3), (16, 1)],
  term ((8668232 : Rat) / 26243) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89964 : Rat) / 3749) [(0, 2), (11, 2), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(0, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(0, 2), (12, 1), (16, 1)],
  term ((14806839 : Rat) / 419888) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((35667727 : Rat) / 839776) [(0, 2), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 104972) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((-867475 : Rat) / 14996) [(0, 2), (15, 2), (16, 1)],
  term ((-15612269 : Rat) / 419888) [(0, 2), (16, 1)],
  term ((870618 : Rat) / 3749) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-171318 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-224220 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((7032426 : Rat) / 26243) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-334001 : Rat) / 26243) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-896880 : Rat) / 3749) [(1, 1), (9, 1), (13, 4), (16, 1)],
  term ((-365274 : Rat) / 3749) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((156561 : Rat) / 1141) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((1480063 : Rat) / 52486) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19517627 : Rat) / 104972) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((10453344 : Rat) / 26243) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-17336464 : Rat) / 26243) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3414669 : Rat) / 29992) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(1, 1), (11, 1), (13, 4), (16, 1)],
  term ((179928 : Rat) / 3749) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((454808 : Rat) / 26243) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((41718 : Rat) / 1141) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((1298911 : Rat) / 52486) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(1, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 104972) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((867475 : Rat) / 7498) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((15612269 : Rat) / 209944) [(1, 1), (13, 1), (16, 1)],
  term ((-14806839 : Rat) / 209944) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-35667727 : Rat) / 419888) [(1, 1), (13, 3), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((-435309 : Rat) / 3749) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((112110 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((334001 : Rat) / 52486) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(1, 2), (9, 1), (13, 3), (16, 1)],
  term ((-3516213 : Rat) / 26243) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(1, 2), (9, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((2567561 : Rat) / 26243) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((19517627 : Rat) / 209944) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1480063 : Rat) / 104972) [(1, 2), (10, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3414669 : Rat) / 59984) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(1, 2), (11, 1), (13, 3), (16, 1)],
  term ((8668232 : Rat) / 26243) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89964 : Rat) / 3749) [(1, 2), (11, 2), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(1, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(1, 2), (12, 1), (16, 1)],
  term ((14806839 : Rat) / 419888) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((35667727 : Rat) / 839776) [(1, 2), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 104972) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((-867475 : Rat) / 14996) [(1, 2), (15, 2), (16, 1)],
  term ((-15612269 : Rat) / 419888) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 100 through 130. -/
theorem rs_R005_ueqv_R005YNY_block_25_0100_0130_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_25_0100_0130
      rs_R005_ueqv_R005YNY_block_25_0100_0130 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
