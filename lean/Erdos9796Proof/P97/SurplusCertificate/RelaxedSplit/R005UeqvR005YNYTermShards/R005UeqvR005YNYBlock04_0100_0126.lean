/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 4:100-126

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_04_0100_0126 : Poly :=
[
  term (-2 : Rat) [(2, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0100 : Poly :=
[
  term ((1903541 : Rat) / 52486) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0100 : Poly :=
[
  term ((-1903541 : Rat) / 26243) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((1903541 : Rat) / 52486) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((1903541 : Rat) / 52486) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((1903541 : Rat) / 26243) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1903541 : Rat) / 52486) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1903541 : Rat) / 52486) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0100_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0100
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0101 : Poly :=
[
  term ((448440 : Rat) / 3749) [(9, 1), (13, 3), (16, 1)]
]

/-- Partial product 101 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0101 : Poly :=
[
  term ((-896880 : Rat) / 3749) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((448440 : Rat) / 3749) [(2, 2), (9, 1), (13, 3), (16, 1)],
  term ((448440 : Rat) / 3749) [(3, 2), (9, 1), (13, 3), (16, 1)],
  term ((896880 : Rat) / 3749) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (12, 2), (13, 3), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0101_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0101
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0102 : Poly :=
[
  term ((-2916600 : Rat) / 26243) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0102 : Poly :=
[
  term ((5833200 : Rat) / 26243) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2916600 : Rat) / 26243) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2916600 : Rat) / 26243) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5833200 : Rat) / 26243) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2916600 : Rat) / 26243) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2916600 : Rat) / 26243) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0102_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0102
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0103 : Poly :=
[
  term ((182637 : Rat) / 3749) [(9, 2), (16, 1)]
]

/-- Partial product 103 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0103 : Poly :=
[
  term ((-365274 : Rat) / 3749) [(2, 1), (9, 2), (16, 1)],
  term ((182637 : Rat) / 3749) [(2, 2), (9, 2), (16, 1)],
  term ((182637 : Rat) / 3749) [(3, 2), (9, 2), (16, 1)],
  term ((365274 : Rat) / 3749) [(9, 2), (12, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 2), (12, 2), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0103_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0103
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0104 : Poly :=
[
  term ((-156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0104 : Poly :=
[
  term ((156561 : Rat) / 1141) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0104_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0104
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0105 : Poly :=
[
  term ((3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 105 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0105 : Poly :=
[
  term ((-3083749 : Rat) / 26243) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 52486) [(2, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 52486) [(3, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 4), (16, 1)],
  term ((3083749 : Rat) / 26243) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0105_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0105
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0106 : Poly :=
[
  term ((-2567561 : Rat) / 26243) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 106 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0106 : Poly :=
[
  term ((5135122 : Rat) / 26243) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(10, 1), (12, 2), (16, 1)],
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0106_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0106
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0107 : Poly :=
[
  term ((156561 : Rat) / 4564) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0107 : Poly :=
[
  term ((-156561 : Rat) / 2282) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156561 : Rat) / 4564) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-156561 : Rat) / 4564) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0107_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0107
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0108 : Poly :=
[
  term ((7182631 : Rat) / 209944) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 108 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0108 : Poly :=
[
  term ((-7182631 : Rat) / 104972) [(2, 1), (10, 1), (13, 2), (16, 1)],
  term ((7182631 : Rat) / 209944) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((7182631 : Rat) / 209944) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((7182631 : Rat) / 104972) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7182631 : Rat) / 209944) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-7182631 : Rat) / 209944) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0108_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0108
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0109 : Poly :=
[
  term ((-1663163 : Rat) / 104972) [(10, 1), (16, 1)]
]

/-- Partial product 109 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0109 : Poly :=
[
  term ((1663163 : Rat) / 52486) [(2, 1), (10, 1), (16, 1)],
  term ((-1663163 : Rat) / 104972) [(2, 2), (10, 1), (16, 1)],
  term ((-1663163 : Rat) / 104972) [(3, 2), (10, 1), (16, 1)],
  term ((-1663163 : Rat) / 52486) [(10, 1), (12, 1), (16, 1)],
  term ((1663163 : Rat) / 104972) [(10, 1), (12, 2), (16, 1)],
  term ((1663163 : Rat) / 104972) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0109_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0109
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0110 : Poly :=
[
  term ((3083749 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 110 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0110 : Poly :=
[
  term ((-3083749 : Rat) / 104972) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 209944) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 209944) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((3083749 : Rat) / 104972) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0110_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0110
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0111 : Poly :=
[
  term ((5226672 : Rat) / 26243) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0111 : Poly :=
[
  term ((-10453344 : Rat) / 26243) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10453344 : Rat) / 26243) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0111_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0111
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0112 : Poly :=
[
  term ((-3731363 : Rat) / 18256) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0112 : Poly :=
[
  term ((3731363 : Rat) / 9128) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3731363 : Rat) / 18256) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3731363 : Rat) / 18256) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3731363 : Rat) / 9128) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3731363 : Rat) / 18256) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3731363 : Rat) / 18256) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0112_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0112
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0113 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0113 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0113_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0113
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0114 : Poly :=
[
  term ((-3083749 : Rat) / 52486) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 114 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0114 : Poly :=
[
  term ((3083749 : Rat) / 26243) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(2, 2), (11, 1), (13, 3), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(3, 2), (11, 1), (13, 3), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((3083749 : Rat) / 52486) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((3083749 : Rat) / 52486) [(11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0114_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0114
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0115 : Poly :=
[
  term ((1487208 : Rat) / 3749) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0115 : Poly :=
[
  term ((-2974416 : Rat) / 3749) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1487208 : Rat) / 3749) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1487208 : Rat) / 3749) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((2974416 : Rat) / 3749) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1487208 : Rat) / 3749) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1487208 : Rat) / 3749) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0115_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0115
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0116 : Poly :=
[
  term ((-89964 : Rat) / 3749) [(11, 2), (16, 1)]
]

/-- Partial product 116 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0116 : Poly :=
[
  term ((179928 : Rat) / 3749) [(2, 1), (11, 2), (16, 1)],
  term ((-89964 : Rat) / 3749) [(2, 2), (11, 2), (16, 1)],
  term ((-89964 : Rat) / 3749) [(3, 2), (11, 2), (16, 1)],
  term ((-179928 : Rat) / 3749) [(11, 2), (12, 1), (16, 1)],
  term ((89964 : Rat) / 3749) [(11, 2), (12, 2), (16, 1)],
  term ((89964 : Rat) / 3749) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0116_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0116
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0117 : Poly :=
[
  term ((1298911 : Rat) / 104972) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0117 : Poly :=
[
  term ((-1298911 : Rat) / 52486) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1298911 : Rat) / 104972) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1298911 : Rat) / 104972) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1298911 : Rat) / 52486) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0117_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0117
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0118 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0118 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(2, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(3, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 4), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 52486) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0118_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0118
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0119 : Poly :=
[
  term ((9583233 : Rat) / 209944) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 119 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0119 : Poly :=
[
  term ((-9583233 : Rat) / 104972) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((9583233 : Rat) / 209944) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((9583233 : Rat) / 209944) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(12, 1), (13, 4), (16, 1)],
  term ((9583233 : Rat) / 104972) [(12, 2), (13, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0119_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0119
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0120 : Poly :=
[
  term ((227404 : Rat) / 26243) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0120 : Poly :=
[
  term ((-454808 : Rat) / 26243) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((454808 : Rat) / 26243) [(12, 2), (15, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0120_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0120
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0121 : Poly :=
[
  term ((20859 : Rat) / 1141) [(12, 1), (16, 1)]
]

/-- Partial product 121 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0121 : Poly :=
[
  term ((-41718 : Rat) / 1141) [(2, 1), (12, 1), (16, 1)],
  term ((20859 : Rat) / 1141) [(2, 2), (12, 1), (16, 1)],
  term ((20859 : Rat) / 1141) [(3, 2), (12, 1), (16, 1)],
  term ((-20859 : Rat) / 1141) [(12, 1), (13, 2), (16, 1)],
  term ((41718 : Rat) / 1141) [(12, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0121_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0121
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0122 : Poly :=
[
  term ((146267 : Rat) / 2608) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0122 : Poly :=
[
  term ((-146267 : Rat) / 1304) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((146267 : Rat) / 2608) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((146267 : Rat) / 2608) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((146267 : Rat) / 1304) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146267 : Rat) / 2608) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-146267 : Rat) / 2608) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0122_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0122
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0123 : Poly :=
[
  term ((-2665205 : Rat) / 839776) [(13, 2), (16, 1)]
]

/-- Partial product 123 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0123 : Poly :=
[
  term ((2665205 : Rat) / 419888) [(2, 1), (13, 2), (16, 1)],
  term ((-2665205 : Rat) / 839776) [(2, 2), (13, 2), (16, 1)],
  term ((-2665205 : Rat) / 839776) [(3, 2), (13, 2), (16, 1)],
  term ((-2665205 : Rat) / 419888) [(12, 1), (13, 2), (16, 1)],
  term ((2665205 : Rat) / 839776) [(12, 2), (13, 2), (16, 1)],
  term ((2665205 : Rat) / 839776) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0123_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0123
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0124 : Poly :=
[
  term ((3083749 : Rat) / 104972) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0124 : Poly :=
[
  term ((-3083749 : Rat) / 52486) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 52486) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0124_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0124
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0125 : Poly :=
[
  term ((-13950837 : Rat) / 104972) [(15, 2), (16, 1)]
]

/-- Partial product 125 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0125 : Poly :=
[
  term ((13950837 : Rat) / 52486) [(2, 1), (15, 2), (16, 1)],
  term ((-13950837 : Rat) / 104972) [(2, 2), (15, 2), (16, 1)],
  term ((-13950837 : Rat) / 104972) [(3, 2), (15, 2), (16, 1)],
  term ((-13950837 : Rat) / 52486) [(12, 1), (15, 2), (16, 1)],
  term ((13950837 : Rat) / 104972) [(12, 2), (15, 2), (16, 1)],
  term ((13950837 : Rat) / 104972) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0125_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0125
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 4. -/
def rs_R005_ueqv_R005YNY_coefficient_04_0126 : Poly :=
[
  term ((5770179 : Rat) / 419888) [(16, 1)]
]

/-- Partial product 126 for generator 4. -/
def rs_R005_ueqv_R005YNY_partial_04_0126 : Poly :=
[
  term ((-5770179 : Rat) / 209944) [(2, 1), (16, 1)],
  term ((5770179 : Rat) / 419888) [(2, 2), (16, 1)],
  term ((5770179 : Rat) / 419888) [(3, 2), (16, 1)],
  term ((5770179 : Rat) / 209944) [(12, 1), (16, 1)],
  term ((-5770179 : Rat) / 419888) [(12, 2), (16, 1)],
  term ((-5770179 : Rat) / 419888) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 4. -/
theorem rs_R005_ueqv_R005YNY_partial_04_0126_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_04_0126
        rs_R005_ueqv_R005YNY_generator_04_0100_0126 =
      rs_R005_ueqv_R005YNY_partial_04_0126 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_04_0100_0126 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_04_0100,
  rs_R005_ueqv_R005YNY_partial_04_0101,
  rs_R005_ueqv_R005YNY_partial_04_0102,
  rs_R005_ueqv_R005YNY_partial_04_0103,
  rs_R005_ueqv_R005YNY_partial_04_0104,
  rs_R005_ueqv_R005YNY_partial_04_0105,
  rs_R005_ueqv_R005YNY_partial_04_0106,
  rs_R005_ueqv_R005YNY_partial_04_0107,
  rs_R005_ueqv_R005YNY_partial_04_0108,
  rs_R005_ueqv_R005YNY_partial_04_0109,
  rs_R005_ueqv_R005YNY_partial_04_0110,
  rs_R005_ueqv_R005YNY_partial_04_0111,
  rs_R005_ueqv_R005YNY_partial_04_0112,
  rs_R005_ueqv_R005YNY_partial_04_0113,
  rs_R005_ueqv_R005YNY_partial_04_0114,
  rs_R005_ueqv_R005YNY_partial_04_0115,
  rs_R005_ueqv_R005YNY_partial_04_0116,
  rs_R005_ueqv_R005YNY_partial_04_0117,
  rs_R005_ueqv_R005YNY_partial_04_0118,
  rs_R005_ueqv_R005YNY_partial_04_0119,
  rs_R005_ueqv_R005YNY_partial_04_0120,
  rs_R005_ueqv_R005YNY_partial_04_0121,
  rs_R005_ueqv_R005YNY_partial_04_0122,
  rs_R005_ueqv_R005YNY_partial_04_0123,
  rs_R005_ueqv_R005YNY_partial_04_0124,
  rs_R005_ueqv_R005YNY_partial_04_0125,
  rs_R005_ueqv_R005YNY_partial_04_0126
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_04_0100_0126 : Poly :=
[
  term ((-1903541 : Rat) / 26243) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-896880 : Rat) / 3749) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((5833200 : Rat) / 26243) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-365274 : Rat) / 3749) [(2, 1), (9, 2), (16, 1)],
  term ((156561 : Rat) / 1141) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((5135122 : Rat) / 26243) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7182631 : Rat) / 104972) [(2, 1), (10, 1), (13, 2), (16, 1)],
  term ((1663163 : Rat) / 52486) [(2, 1), (10, 1), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10453344 : Rat) / 26243) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3731363 : Rat) / 9128) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2974416 : Rat) / 3749) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((179928 : Rat) / 3749) [(2, 1), (11, 2), (16, 1)],
  term ((-1298911 : Rat) / 52486) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 104972) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-454808 : Rat) / 26243) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41718 : Rat) / 1141) [(2, 1), (12, 1), (16, 1)],
  term ((-146267 : Rat) / 1304) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((2665205 : Rat) / 419888) [(2, 1), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((13950837 : Rat) / 52486) [(2, 1), (15, 2), (16, 1)],
  term ((-5770179 : Rat) / 209944) [(2, 1), (16, 1)],
  term ((1903541 : Rat) / 52486) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(2, 2), (9, 1), (13, 3), (16, 1)],
  term ((-2916600 : Rat) / 26243) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(2, 2), (9, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 52486) [(2, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7182631 : Rat) / 209944) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1663163 : Rat) / 104972) [(2, 2), (10, 1), (16, 1)],
  term ((3083749 : Rat) / 209944) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3731363 : Rat) / 18256) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(2, 2), (11, 1), (13, 3), (16, 1)],
  term ((1487208 : Rat) / 3749) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89964 : Rat) / 3749) [(2, 2), (11, 2), (16, 1)],
  term ((1298911 : Rat) / 104972) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(2, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 209944) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((20859 : Rat) / 1141) [(2, 2), (12, 1), (16, 1)],
  term ((146267 : Rat) / 2608) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2665205 : Rat) / 839776) [(2, 2), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 104972) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term ((-13950837 : Rat) / 104972) [(2, 2), (15, 2), (16, 1)],
  term ((5770179 : Rat) / 419888) [(2, 2), (16, 1)],
  term ((1903541 : Rat) / 52486) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(3, 2), (9, 1), (13, 3), (16, 1)],
  term ((-2916600 : Rat) / 26243) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((182637 : Rat) / 3749) [(3, 2), (9, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 52486) [(3, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((156561 : Rat) / 4564) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7182631 : Rat) / 209944) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1663163 : Rat) / 104972) [(3, 2), (10, 1), (16, 1)],
  term ((3083749 : Rat) / 209944) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3731363 : Rat) / 18256) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(3, 2), (11, 1), (13, 3), (16, 1)],
  term ((1487208 : Rat) / 3749) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89964 : Rat) / 3749) [(3, 2), (11, 2), (16, 1)],
  term ((1298911 : Rat) / 104972) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(3, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 209944) [(3, 2), (12, 1), (13, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((20859 : Rat) / 1141) [(3, 2), (12, 1), (16, 1)],
  term ((146267 : Rat) / 2608) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2665205 : Rat) / 839776) [(3, 2), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 104972) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((-13950837 : Rat) / 104972) [(3, 2), (15, 2), (16, 1)],
  term ((5770179 : Rat) / 419888) [(3, 2), (16, 1)],
  term ((1903541 : Rat) / 26243) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((896880 : Rat) / 3749) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-5833200 : Rat) / 26243) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1903541 : Rat) / 52486) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (12, 2), (13, 3), (16, 1)],
  term ((2916600 : Rat) / 26243) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2916600 : Rat) / 26243) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1903541 : Rat) / 52486) [(9, 1), (13, 3), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (13, 5), (16, 1)],
  term ((365274 : Rat) / 3749) [(9, 2), (12, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 2), (12, 2), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 2), (13, 2), (16, 1)],
  term ((-156561 : Rat) / 1141) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((156561 : Rat) / 2282) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17452875 : Rat) / 104972) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 4), (16, 1)],
  term ((-1663163 : Rat) / 52486) [(10, 1), (12, 1), (16, 1)],
  term ((-156561 : Rat) / 4564) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17487361 : Rat) / 209944) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-18877325 : Rat) / 104972) [(10, 1), (12, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 3), (13, 2), (16, 1)],
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 3), (16, 1)],
  term ((1663163 : Rat) / 104972) [(10, 1), (13, 2), (16, 1)],
  term ((-156561 : Rat) / 4564) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7182631 : Rat) / 209944) [(10, 1), (13, 4), (16, 1)],
  term ((-3731363 : Rat) / 9128) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8403903 : Rat) / 52486) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27753741 : Rat) / 209944) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((2974416 : Rat) / 3749) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((14022335 : Rat) / 59984) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 52486) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((42888 : Rat) / 26243) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1487208 : Rat) / 3749) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3731363 : Rat) / 18256) [(11, 1), (13, 3), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 52486) [(11, 1), (13, 5), (16, 1)],
  term ((-179928 : Rat) / 3749) [(11, 2), (12, 1), (16, 1)],
  term ((89964 : Rat) / 3749) [(11, 2), (12, 2), (16, 1)],
  term ((89964 : Rat) / 3749) [(11, 2), (13, 2), (16, 1)],
  term ((146267 : Rat) / 1304) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1477331 : Rat) / 59984) [(12, 1), (13, 2), (16, 1)],
  term ((4868587 : Rat) / 104972) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 4), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(12, 1), (13, 4), (16, 1)],
  term ((-13950837 : Rat) / 52486) [(12, 1), (15, 2), (16, 1)],
  term ((5770179 : Rat) / 209944) [(12, 1), (16, 1)],
  term ((-13157699 : Rat) / 419888) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((79331069 : Rat) / 839776) [(12, 2), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((2252867 : Rat) / 14996) [(12, 2), (15, 2), (16, 1)],
  term ((9582045 : Rat) / 419888) [(12, 2), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 3), (13, 2), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(12, 3), (13, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 3), (15, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(12, 3), (16, 1)],
  term ((13950837 : Rat) / 104972) [(13, 2), (15, 2), (16, 1)],
  term ((-5770179 : Rat) / 419888) [(13, 2), (16, 1)],
  term ((-146267 : Rat) / 2608) [(13, 3), (15, 1), (16, 1)],
  term ((2665205 : Rat) / 839776) [(13, 4), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 126. -/
theorem rs_R005_ueqv_R005YNY_block_04_0100_0126_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_04_0100_0126
      rs_R005_ueqv_R005YNY_block_04_0100_0126 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
