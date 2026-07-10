/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 16:100-159

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_16_0100_0159 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0100 : Poly :=
[
  term ((-141120 : Rat) / 41239) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 100 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0100 : Poly :=
[
  term ((-282240 : Rat) / 41239) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((141120 : Rat) / 41239) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0100_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0100
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0101 : Poly :=
[
  term ((14868 : Rat) / 3749) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0101 : Poly :=
[
  term ((29736 : Rat) / 3749) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-14868 : Rat) / 3749) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0101_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0101
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0102 : Poly :=
[
  term ((180969 : Rat) / 7498) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0102 : Poly :=
[
  term ((-180969 : Rat) / 7498) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((180969 : Rat) / 3749) [(6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0102_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0102
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0103 : Poly :=
[
  term ((-448440 : Rat) / 3749) [(6, 1), (9, 1), (13, 3), (16, 1)]
]

/-- Partial product 103 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0103 : Poly :=
[
  term ((448440 : Rat) / 3749) [(6, 1), (9, 1), (13, 3), (16, 1)],
  term ((-896880 : Rat) / 3749) [(6, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0103_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0103
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0104 : Poly :=
[
  term ((-29736 : Rat) / 3749) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0104 : Poly :=
[
  term ((29736 : Rat) / 3749) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59472 : Rat) / 3749) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0104_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0104
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0105 : Poly :=
[
  term ((-180969 : Rat) / 7498) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 105 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0105 : Poly :=
[
  term ((180969 : Rat) / 7498) [(6, 1), (13, 2), (16, 1)],
  term ((-180969 : Rat) / 3749) [(6, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0105_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0105
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0106 : Poly :=
[
  term ((448440 : Rat) / 3749) [(6, 1), (13, 4), (16, 1)]
]

/-- Partial product 106 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0106 : Poly :=
[
  term ((-448440 : Rat) / 3749) [(6, 1), (13, 4), (16, 1)],
  term ((896880 : Rat) / 3749) [(6, 2), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0106_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0106
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0107 : Poly :=
[
  term ((-108889 : Rat) / 26243) [(6, 1), (16, 1)]
]

/-- Partial product 107 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0107 : Poly :=
[
  term ((108889 : Rat) / 26243) [(6, 1), (16, 1)],
  term ((-217778 : Rat) / 26243) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0107_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0107
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0108 : Poly :=
[
  term ((-330153 : Rat) / 7498) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 108 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0108 : Poly :=
[
  term ((-330153 : Rat) / 3749) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((330153 : Rat) / 7498) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0108_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0108
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0109 : Poly :=
[
  term ((448440 : Rat) / 3749) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 109 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0109 : Poly :=
[
  term ((896880 : Rat) / 3749) [(6, 1), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((-448440 : Rat) / 3749) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0109_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0109
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0110 : Poly :=
[
  term ((74592 : Rat) / 3749) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 110 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0110 : Poly :=
[
  term ((149184 : Rat) / 3749) [(6, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-74592 : Rat) / 3749) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0110_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0110
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0111 : Poly :=
[
  term ((2137895 : Rat) / 52486) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0111 : Poly :=
[
  term ((2137895 : Rat) / 26243) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2137895 : Rat) / 52486) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0111_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0111
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0112 : Poly :=
[
  term ((-448440 : Rat) / 3749) [(7, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 112 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0112 : Poly :=
[
  term ((-896880 : Rat) / 3749) [(6, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((448440 : Rat) / 3749) [(7, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0112_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0112
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0113 : Poly :=
[
  term ((-662960 : Rat) / 26243) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0113 : Poly :=
[
  term ((-1325920 : Rat) / 26243) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((662960 : Rat) / 26243) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0113_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0113
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0114 : Poly :=
[
  term ((182637 : Rat) / 3749) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 114 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0114 : Poly :=
[
  term ((365274 : Rat) / 3749) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0114_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0114
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0115 : Poly :=
[
  term ((-182637 : Rat) / 3749) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0115 : Poly :=
[
  term ((-365274 : Rat) / 3749) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0115_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0115
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0116 : Poly :=
[
  term ((5701811 : Rat) / 52486) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 116 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0116 : Poly :=
[
  term ((5701811 : Rat) / 26243) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5701811 : Rat) / 52486) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0116_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0116
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0117 : Poly :=
[
  term ((-7847835 : Rat) / 52486) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0117 : Poly :=
[
  term ((-7847835 : Rat) / 26243) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7847835 : Rat) / 52486) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0117_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0117
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0118 : Poly :=
[
  term ((538128 : Rat) / 3749) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 118 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0118 : Poly :=
[
  term ((1076256 : Rat) / 3749) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-538128 : Rat) / 3749) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0118_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0118
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0119 : Poly :=
[
  term ((-206604 : Rat) / 3749) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 119 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0119 : Poly :=
[
  term ((-413208 : Rat) / 3749) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((206604 : Rat) / 3749) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0119_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0119
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0120 : Poly :=
[
  term ((224220 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 120 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0120 : Poly :=
[
  term ((448440 : Rat) / 3749) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0120_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0120
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0121 : Poly :=
[
  term ((-51708 : Rat) / 3749) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 121 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0121 : Poly :=
[
  term ((-103416 : Rat) / 3749) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((51708 : Rat) / 3749) [(8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0121_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0121
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0122 : Poly :=
[
  term ((5078781 : Rat) / 26243) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0122 : Poly :=
[
  term ((10157562 : Rat) / 26243) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5078781 : Rat) / 26243) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0122_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0122
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0123 : Poly :=
[
  term ((-2339165 : Rat) / 52486) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 123 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0123 : Poly :=
[
  term ((-2339165 : Rat) / 26243) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((2339165 : Rat) / 52486) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0123_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0123
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0124 : Poly :=
[
  term ((-896880 : Rat) / 3749) [(8, 1), (13, 4), (16, 1)]
]

/-- Partial product 124 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0124 : Poly :=
[
  term ((-1793760 : Rat) / 3749) [(6, 1), (8, 1), (13, 4), (16, 1)],
  term ((896880 : Rat) / 3749) [(8, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0124_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0124
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0125 : Poly :=
[
  term ((11067 : Rat) / 14996) [(8, 1), (16, 1)]
]

/-- Partial product 125 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0125 : Poly :=
[
  term ((11067 : Rat) / 7498) [(6, 1), (8, 1), (16, 1)],
  term ((-11067 : Rat) / 14996) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0125_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0125
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0126 : Poly :=
[
  term ((-538128 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 126 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0126 : Poly :=
[
  term ((-1076256 : Rat) / 3749) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((538128 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0126_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0126
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0127 : Poly :=
[
  term ((206604 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 127 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0127 : Poly :=
[
  term ((413208 : Rat) / 3749) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-206604 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0127_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0127
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0128 : Poly :=
[
  term ((-806711 : Rat) / 52486) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 128 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0128 : Poly :=
[
  term ((-806711 : Rat) / 26243) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((806711 : Rat) / 52486) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0128_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0128
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0129 : Poly :=
[
  term ((7847835 : Rat) / 52486) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0129 : Poly :=
[
  term ((7847835 : Rat) / 26243) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7847835 : Rat) / 52486) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0129_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0129
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0130 : Poly :=
[
  term ((-349650 : Rat) / 3749) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 130 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0130 : Poly :=
[
  term ((-699300 : Rat) / 3749) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((349650 : Rat) / 3749) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0130_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0130
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0131 : Poly :=
[
  term ((1139939 : Rat) / 52486) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 131 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0131 : Poly :=
[
  term ((1139939 : Rat) / 26243) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1139939 : Rat) / 52486) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0131_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0131
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0132 : Poly :=
[
  term ((896880 : Rat) / 3749) [(9, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 132 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0132 : Poly :=
[
  term ((1793760 : Rat) / 3749) [(6, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-896880 : Rat) / 3749) [(9, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0132_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0132
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0133 : Poly :=
[
  term ((-6895863 : Rat) / 52486) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0133 : Poly :=
[
  term ((-6895863 : Rat) / 26243) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6895863 : Rat) / 52486) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0133_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0133
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0134 : Poly :=
[
  term ((180969 : Rat) / 14996) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 134 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0134 : Poly :=
[
  term ((180969 : Rat) / 7498) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-180969 : Rat) / 14996) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0134_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0134
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0135 : Poly :=
[
  term ((-224220 : Rat) / 3749) [(9, 1), (13, 3), (16, 1)]
]

/-- Partial product 135 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0135 : Poly :=
[
  term ((-448440 : Rat) / 3749) [(6, 1), (9, 1), (13, 3), (16, 1)],
  term ((224220 : Rat) / 3749) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0135_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0135
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0136 : Poly :=
[
  term ((-182637 : Rat) / 3749) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 136 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0136 : Poly :=
[
  term ((-365274 : Rat) / 3749) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0136_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0136
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0137 : Poly :=
[
  term ((182637 : Rat) / 3749) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 137 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0137 : Poly :=
[
  term ((365274 : Rat) / 3749) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0137_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0137
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0138 : Poly :=
[
  term ((-206604 : Rat) / 3749) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 138 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0138 : Poly :=
[
  term ((-413208 : Rat) / 3749) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((206604 : Rat) / 3749) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0138_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0138
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0139 : Poly :=
[
  term ((538128 : Rat) / 3749) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 139 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0139 : Poly :=
[
  term ((1076256 : Rat) / 3749) [(6, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-538128 : Rat) / 3749) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0139_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0139
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0140 : Poly :=
[
  term ((2049441 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 140 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0140 : Poly :=
[
  term ((2049441 : Rat) / 26243) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0140_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0140
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0141 : Poly :=
[
  term ((452199 : Rat) / 26243) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 141 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0141 : Poly :=
[
  term ((904398 : Rat) / 26243) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-452199 : Rat) / 26243) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0141_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0141
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0142 : Poly :=
[
  term ((-8711082 : Rat) / 26243) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0142 : Poly :=
[
  term ((-17422164 : Rat) / 26243) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8711082 : Rat) / 26243) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0142_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0142
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0143 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 143 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0143 : Poly :=
[
  term ((-2049441 : Rat) / 26243) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0143_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0143
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0144 : Poly :=
[
  term ((47362855 : Rat) / 209944) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 144 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0144 : Poly :=
[
  term ((47362855 : Rat) / 104972) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-47362855 : Rat) / 209944) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0144_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0144
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0145 : Poly :=
[
  term ((-452199 : Rat) / 26243) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 145 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0145 : Poly :=
[
  term ((-904398 : Rat) / 26243) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((452199 : Rat) / 26243) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0145_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0145
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0146 : Poly :=
[
  term ((-1290025 : Rat) / 104972) [(10, 1), (16, 1)]
]

/-- Partial product 146 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0146 : Poly :=
[
  term ((-1290025 : Rat) / 52486) [(6, 1), (10, 1), (16, 1)],
  term ((1290025 : Rat) / 104972) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0146_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0146
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0147 : Poly :=
[
  term ((-15687811 : Rat) / 104972) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0147 : Poly :=
[
  term ((-15687811 : Rat) / 52486) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((15687811 : Rat) / 104972) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0147_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0147
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0148 : Poly :=
[
  term ((623341 : Rat) / 3749) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0148 : Poly :=
[
  term ((1246682 : Rat) / 3749) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-623341 : Rat) / 3749) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0148_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0148
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0149 : Poly :=
[
  term ((-538128 : Rat) / 3749) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 149 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0149 : Poly :=
[
  term ((-1076256 : Rat) / 3749) [(6, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0149_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0149
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0150 : Poly :=
[
  term ((206604 : Rat) / 3749) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 150 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0150 : Poly :=
[
  term ((413208 : Rat) / 3749) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-206604 : Rat) / 3749) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0150_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0150
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0151 : Poly :=
[
  term ((22432791 : Rat) / 419888) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0151 : Poly :=
[
  term ((22432791 : Rat) / 209944) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22432791 : Rat) / 419888) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0151_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0151
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0152 : Poly :=
[
  term ((-12426483 : Rat) / 209944) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 152 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0152 : Poly :=
[
  term ((-12426483 : Rat) / 104972) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((12426483 : Rat) / 209944) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0152_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0152
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0153 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0153 : Poly :=
[
  term ((2049441 : Rat) / 52486) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0153_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0153
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0154 : Poly :=
[
  term ((-1744833 : Rat) / 26243) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0154 : Poly :=
[
  term ((-3489666 : Rat) / 26243) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1744833 : Rat) / 26243) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0154_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0154
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0155 : Poly :=
[
  term ((-110541 : Rat) / 104972) [(12, 1), (16, 1)]
]

/-- Partial product 155 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0155 : Poly :=
[
  term ((-110541 : Rat) / 52486) [(6, 1), (12, 1), (16, 1)],
  term ((110541 : Rat) / 104972) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0155_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0155
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0156 : Poly :=
[
  term ((-14868 : Rat) / 3749) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0156 : Poly :=
[
  term ((-29736 : Rat) / 3749) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((14868 : Rat) / 3749) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0156_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0156
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0157 : Poly :=
[
  term ((-180969 : Rat) / 14996) [(13, 2), (16, 1)]
]

/-- Partial product 157 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0157 : Poly :=
[
  term ((-180969 : Rat) / 7498) [(6, 1), (13, 2), (16, 1)],
  term ((180969 : Rat) / 14996) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0157_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0157
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0158 : Poly :=
[
  term ((224220 : Rat) / 3749) [(13, 4), (16, 1)]
]

/-- Partial product 158 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0158 : Poly :=
[
  term ((448440 : Rat) / 3749) [(6, 1), (13, 4), (16, 1)],
  term ((-224220 : Rat) / 3749) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0158_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0158
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 16. -/
def rs_R005_ueqv_R005YNY_coefficient_16_0159 : Poly :=
[
  term ((-108889 : Rat) / 52486) [(16, 1)]
]

/-- Partial product 159 for generator 16. -/
def rs_R005_ueqv_R005YNY_partial_16_0159 : Poly :=
[
  term ((-108889 : Rat) / 26243) [(6, 1), (16, 1)],
  term ((108889 : Rat) / 52486) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 16. -/
theorem rs_R005_ueqv_R005YNY_partial_16_0159_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_16_0159
        rs_R005_ueqv_R005YNY_generator_16_0100_0159 =
      rs_R005_ueqv_R005YNY_partial_16_0159 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_16_0100_0159 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_16_0100,
  rs_R005_ueqv_R005YNY_partial_16_0101,
  rs_R005_ueqv_R005YNY_partial_16_0102,
  rs_R005_ueqv_R005YNY_partial_16_0103,
  rs_R005_ueqv_R005YNY_partial_16_0104,
  rs_R005_ueqv_R005YNY_partial_16_0105,
  rs_R005_ueqv_R005YNY_partial_16_0106,
  rs_R005_ueqv_R005YNY_partial_16_0107,
  rs_R005_ueqv_R005YNY_partial_16_0108,
  rs_R005_ueqv_R005YNY_partial_16_0109,
  rs_R005_ueqv_R005YNY_partial_16_0110,
  rs_R005_ueqv_R005YNY_partial_16_0111,
  rs_R005_ueqv_R005YNY_partial_16_0112,
  rs_R005_ueqv_R005YNY_partial_16_0113,
  rs_R005_ueqv_R005YNY_partial_16_0114,
  rs_R005_ueqv_R005YNY_partial_16_0115,
  rs_R005_ueqv_R005YNY_partial_16_0116,
  rs_R005_ueqv_R005YNY_partial_16_0117,
  rs_R005_ueqv_R005YNY_partial_16_0118,
  rs_R005_ueqv_R005YNY_partial_16_0119,
  rs_R005_ueqv_R005YNY_partial_16_0120,
  rs_R005_ueqv_R005YNY_partial_16_0121,
  rs_R005_ueqv_R005YNY_partial_16_0122,
  rs_R005_ueqv_R005YNY_partial_16_0123,
  rs_R005_ueqv_R005YNY_partial_16_0124,
  rs_R005_ueqv_R005YNY_partial_16_0125,
  rs_R005_ueqv_R005YNY_partial_16_0126,
  rs_R005_ueqv_R005YNY_partial_16_0127,
  rs_R005_ueqv_R005YNY_partial_16_0128,
  rs_R005_ueqv_R005YNY_partial_16_0129,
  rs_R005_ueqv_R005YNY_partial_16_0130,
  rs_R005_ueqv_R005YNY_partial_16_0131,
  rs_R005_ueqv_R005YNY_partial_16_0132,
  rs_R005_ueqv_R005YNY_partial_16_0133,
  rs_R005_ueqv_R005YNY_partial_16_0134,
  rs_R005_ueqv_R005YNY_partial_16_0135,
  rs_R005_ueqv_R005YNY_partial_16_0136,
  rs_R005_ueqv_R005YNY_partial_16_0137,
  rs_R005_ueqv_R005YNY_partial_16_0138,
  rs_R005_ueqv_R005YNY_partial_16_0139,
  rs_R005_ueqv_R005YNY_partial_16_0140,
  rs_R005_ueqv_R005YNY_partial_16_0141,
  rs_R005_ueqv_R005YNY_partial_16_0142,
  rs_R005_ueqv_R005YNY_partial_16_0143,
  rs_R005_ueqv_R005YNY_partial_16_0144,
  rs_R005_ueqv_R005YNY_partial_16_0145,
  rs_R005_ueqv_R005YNY_partial_16_0146,
  rs_R005_ueqv_R005YNY_partial_16_0147,
  rs_R005_ueqv_R005YNY_partial_16_0148,
  rs_R005_ueqv_R005YNY_partial_16_0149,
  rs_R005_ueqv_R005YNY_partial_16_0150,
  rs_R005_ueqv_R005YNY_partial_16_0151,
  rs_R005_ueqv_R005YNY_partial_16_0152,
  rs_R005_ueqv_R005YNY_partial_16_0153,
  rs_R005_ueqv_R005YNY_partial_16_0154,
  rs_R005_ueqv_R005YNY_partial_16_0155,
  rs_R005_ueqv_R005YNY_partial_16_0156,
  rs_R005_ueqv_R005YNY_partial_16_0157,
  rs_R005_ueqv_R005YNY_partial_16_0158,
  rs_R005_ueqv_R005YNY_partial_16_0159
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_16_0100_0159 : Poly :=
[
  term ((-282240 : Rat) / 41239) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((29736 : Rat) / 3749) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((141120 : Rat) / 41239) [(5, 1), (13, 3), (16, 1)],
  term ((-14868 : Rat) / 3749) [(5, 1), (15, 1), (16, 1)],
  term ((-330153 : Rat) / 3749) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((896880 : Rat) / 3749) [(6, 1), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((149184 : Rat) / 3749) [(6, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((2137895 : Rat) / 26243) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-896880 : Rat) / 3749) [(6, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-1325920 : Rat) / 26243) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((365274 : Rat) / 3749) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-365274 : Rat) / 3749) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((5701811 : Rat) / 26243) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7847835 : Rat) / 26243) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1076256 : Rat) / 3749) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-413208 : Rat) / 3749) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((448440 : Rat) / 3749) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-103416 : Rat) / 3749) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((10157562 : Rat) / 26243) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2339165 : Rat) / 26243) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1793760 : Rat) / 3749) [(6, 1), (8, 1), (13, 4), (16, 1)],
  term ((11067 : Rat) / 7498) [(6, 1), (8, 1), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((413208 : Rat) / 3749) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-806711 : Rat) / 26243) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((7847835 : Rat) / 26243) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-699300 : Rat) / 3749) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1139939 : Rat) / 26243) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1793760 : Rat) / 3749) [(6, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-6895863 : Rat) / 26243) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-365274 : Rat) / 3749) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((365274 : Rat) / 3749) [(6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-413208 : Rat) / 3749) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1076256 : Rat) / 3749) [(6, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((2049441 : Rat) / 26243) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((904398 : Rat) / 26243) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-17422164 : Rat) / 26243) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 26243) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((47362855 : Rat) / 104972) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-904398 : Rat) / 26243) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1290025 : Rat) / 52486) [(6, 1), (10, 1), (16, 1)],
  term ((-15687811 : Rat) / 52486) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1246682 : Rat) / 3749) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(6, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((413208 : Rat) / 3749) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((22432791 : Rat) / 209944) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12426483 : Rat) / 104972) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3489666 : Rat) / 26243) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-110541 : Rat) / 52486) [(6, 1), (12, 1), (16, 1)],
  term ((180969 : Rat) / 3749) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-896880 : Rat) / 3749) [(6, 2), (9, 1), (13, 3), (16, 1)],
  term ((-59472 : Rat) / 3749) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-180969 : Rat) / 3749) [(6, 2), (13, 2), (16, 1)],
  term ((896880 : Rat) / 3749) [(6, 2), (13, 4), (16, 1)],
  term ((-217778 : Rat) / 26243) [(6, 2), (16, 1)],
  term ((330153 : Rat) / 7498) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-448440 : Rat) / 3749) [(7, 1), (8, 1), (13, 3), (16, 1)],
  term ((-74592 : Rat) / 3749) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2137895 : Rat) / 52486) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((662960 : Rat) / 26243) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5701811 : Rat) / 52486) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((7847835 : Rat) / 52486) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((206604 : Rat) / 3749) [(8, 1), (11, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((51708 : Rat) / 3749) [(8, 1), (12, 1), (16, 1)],
  term ((-5078781 : Rat) / 26243) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2339165 : Rat) / 52486) [(8, 1), (13, 2), (16, 1)],
  term ((896880 : Rat) / 3749) [(8, 1), (13, 4), (16, 1)],
  term ((-11067 : Rat) / 14996) [(8, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-206604 : Rat) / 3749) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((806711 : Rat) / 52486) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7847835 : Rat) / 52486) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((349650 : Rat) / 3749) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1139939 : Rat) / 52486) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-896880 : Rat) / 3749) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((6895863 : Rat) / 52486) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-180969 : Rat) / 14996) [(9, 1), (13, 1), (16, 1)],
  term ((224220 : Rat) / 3749) [(9, 1), (13, 3), (16, 1)],
  term ((182637 : Rat) / 3749) [(9, 2), (10, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 2), (12, 1), (16, 1)],
  term ((206604 : Rat) / 3749) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-452199 : Rat) / 26243) [(10, 1), (12, 1), (16, 1)],
  term ((8711082 : Rat) / 26243) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-47362855 : Rat) / 209944) [(10, 1), (13, 2), (16, 1)],
  term ((452199 : Rat) / 26243) [(10, 1), (15, 2), (16, 1)],
  term ((1290025 : Rat) / 104972) [(10, 1), (16, 1)],
  term ((15687811 : Rat) / 104972) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-623341 : Rat) / 3749) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-206604 : Rat) / 3749) [(11, 2), (12, 1), (16, 1)],
  term ((-22432791 : Rat) / 419888) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12426483 : Rat) / 209944) [(12, 1), (13, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1744833 : Rat) / 26243) [(12, 1), (15, 2), (16, 1)],
  term ((110541 : Rat) / 104972) [(12, 1), (16, 1)],
  term ((14868 : Rat) / 3749) [(13, 1), (15, 1), (16, 1)],
  term ((180969 : Rat) / 14996) [(13, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(13, 4), (16, 1)],
  term ((108889 : Rat) / 52486) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 159. -/
theorem rs_R005_ueqv_R005YNY_block_16_0100_0159_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_16_0100_0159
      rs_R005_ueqv_R005YNY_block_16_0100_0159 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
