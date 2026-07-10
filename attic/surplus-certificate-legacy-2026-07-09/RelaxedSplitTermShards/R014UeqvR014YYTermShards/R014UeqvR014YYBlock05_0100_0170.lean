/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 5:100-170

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_05_0100_0170 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0100 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 100 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0100 : Poly :=
[
  term ((-8 : Rat) / 3) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((4 : Rat) / 3) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((4 : Rat) / 3) [(4, 1), (7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0100_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0100
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0101 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 101 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0101 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(4, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0101_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0101
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0102 : Poly :=
[
  term (28 : Rat) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 102 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0102 : Poly :=
[
  term (-56 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term (28 : Rat) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term (28 : Rat) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term (56 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0102_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0102
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0103 : Poly :=
[
  term (3 : Rat) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 103 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0103 : Poly :=
[
  term (-6 : Rat) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term (6 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0103_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0103
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0104 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 104 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0104 : Poly :=
[
  term ((8 : Rat) / 3) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0104_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0104
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0105 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 105 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0105 : Poly :=
[
  term (3 : Rat) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term (-3 : Rat) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0105_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0105
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0106 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 106 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0106 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0106_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0106
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0107 : Poly :=
[
  term (-21 : Rat) [(4, 1), (13, 2)]
]

/-- Partial product 107 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0107 : Poly :=
[
  term (42 : Rat) [(4, 1), (6, 1), (13, 2)],
  term (-21 : Rat) [(4, 1), (6, 2), (13, 2)],
  term (-21 : Rat) [(4, 1), (7, 2), (13, 2)],
  term (-42 : Rat) [(4, 1), (13, 2), (14, 1)],
  term (21 : Rat) [(4, 1), (13, 2), (14, 2)],
  term (21 : Rat) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0107_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0107
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0108 : Poly :=
[
  term ((150411 : Rat) / 385) [(4, 1), (14, 1)]
]

/-- Partial product 108 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0108 : Poly :=
[
  term ((-300822 : Rat) / 385) [(4, 1), (6, 1), (14, 1)],
  term ((150411 : Rat) / 385) [(4, 1), (6, 2), (14, 1)],
  term ((150411 : Rat) / 385) [(4, 1), (7, 2), (14, 1)],
  term ((-150411 : Rat) / 385) [(4, 1), (14, 1), (15, 2)],
  term ((300822 : Rat) / 385) [(4, 1), (14, 2)],
  term ((-150411 : Rat) / 385) [(4, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0108_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0108
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0109 : Poly :=
[
  term ((-301207 : Rat) / 1540) [(4, 2)]
]

/-- Partial product 109 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0109 : Poly :=
[
  term ((301207 : Rat) / 770) [(4, 2), (6, 1)],
  term ((-301207 : Rat) / 1540) [(4, 2), (6, 2)],
  term ((-301207 : Rat) / 1540) [(4, 2), (7, 2)],
  term ((-301207 : Rat) / 770) [(4, 2), (14, 1)],
  term ((301207 : Rat) / 1540) [(4, 2), (14, 2)],
  term ((301207 : Rat) / 1540) [(4, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0109_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0109
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0110 : Poly :=
[
  term ((-298127 : Rat) / 3080) [(5, 1), (7, 1)]
]

/-- Partial product 110 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0110 : Poly :=
[
  term ((298127 : Rat) / 1540) [(5, 1), (6, 1), (7, 1)],
  term ((-298127 : Rat) / 3080) [(5, 1), (6, 2), (7, 1)],
  term ((-298127 : Rat) / 1540) [(5, 1), (7, 1), (14, 1)],
  term ((298127 : Rat) / 3080) [(5, 1), (7, 1), (14, 2)],
  term ((298127 : Rat) / 3080) [(5, 1), (7, 1), (15, 2)],
  term ((-298127 : Rat) / 3080) [(5, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0110_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0110
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0111 : Poly :=
[
  term ((-8 : Rat) / 3) [(5, 1), (11, 1)]
]

/-- Partial product 111 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0111 : Poly :=
[
  term ((16 : Rat) / 3) [(5, 1), (6, 1), (11, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (6, 2), (11, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (7, 2), (11, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (11, 1), (14, 1)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (14, 2)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0111_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0111
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0112 : Poly :=
[
  term ((7 : Rat) / 2) [(5, 1), (13, 1)]
]

/-- Partial product 112 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0112 : Poly :=
[
  term (-7 : Rat) [(5, 1), (6, 1), (13, 1)],
  term ((7 : Rat) / 2) [(5, 1), (6, 2), (13, 1)],
  term ((7 : Rat) / 2) [(5, 1), (7, 2), (13, 1)],
  term (7 : Rat) [(5, 1), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(5, 1), (13, 1), (14, 2)],
  term ((-7 : Rat) / 2) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0112_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0112
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0113 : Poly :=
[
  term ((-3 : Rat) / 4) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 113 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0113 : Poly :=
[
  term ((3 : Rat) / 2) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((3 : Rat) / 4) [(5, 1), (14, 1), (15, 3)],
  term ((-3 : Rat) / 2) [(5, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 4) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0113_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0113
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0114 : Poly :=
[
  term ((902851 : Rat) / 4620) [(5, 1), (15, 1)]
]

/-- Partial product 114 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0114 : Poly :=
[
  term ((-902851 : Rat) / 2310) [(5, 1), (6, 1), (15, 1)],
  term ((902851 : Rat) / 4620) [(5, 1), (6, 2), (15, 1)],
  term ((902851 : Rat) / 4620) [(5, 1), (7, 2), (15, 1)],
  term ((902851 : Rat) / 2310) [(5, 1), (14, 1), (15, 1)],
  term ((-902851 : Rat) / 4620) [(5, 1), (14, 2), (15, 1)],
  term ((-902851 : Rat) / 4620) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0114_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0114
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0115 : Poly :=
[
  term (3 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 115 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0115 : Poly :=
[
  term (-6 : Rat) [(6, 1), (7, 1), (9, 1)],
  term (3 : Rat) [(6, 2), (7, 1), (9, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (14, 1)],
  term (-3 : Rat) [(7, 1), (9, 1), (14, 2)],
  term (-3 : Rat) [(7, 1), (9, 1), (15, 2)],
  term (3 : Rat) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0115_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0115
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0116 : Poly :=
[
  term ((-98 : Rat) / 15) [(7, 1), (11, 1)]
]

/-- Partial product 116 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0116 : Poly :=
[
  term ((196 : Rat) / 15) [(6, 1), (7, 1), (11, 1)],
  term ((-98 : Rat) / 15) [(6, 2), (7, 1), (11, 1)],
  term ((-196 : Rat) / 15) [(7, 1), (11, 1), (14, 1)],
  term ((98 : Rat) / 15) [(7, 1), (11, 1), (14, 2)],
  term ((98 : Rat) / 15) [(7, 1), (11, 1), (15, 2)],
  term ((-98 : Rat) / 15) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0116_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0116
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0117 : Poly :=
[
  term ((-77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 117 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0117 : Poly :=
[
  term ((77 : Rat) / 30) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-77 : Rat) / 60) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-77 : Rat) / 30) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-77 : Rat) / 60) [(7, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0117_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0117
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0118 : Poly :=
[
  term ((77 : Rat) / 6) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 118 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0118 : Poly :=
[
  term ((-77 : Rat) / 3) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((77 : Rat) / 6) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((-77 : Rat) / 6) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((77 : Rat) / 3) [(7, 1), (11, 1), (14, 2)],
  term ((-77 : Rat) / 6) [(7, 1), (11, 1), (14, 3)],
  term ((77 : Rat) / 6) [(7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0118_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0118
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0119 : Poly :=
[
  term (-3 : Rat) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 119 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0119 : Poly :=
[
  term (6 : Rat) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term (-3 : Rat) [(7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0119_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0119
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0120 : Poly :=
[
  term ((3 : Rat) / 2) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 120 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0120 : Poly :=
[
  term (-3 : Rat) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0120_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0120
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0121 : Poly :=
[
  term ((7 : Rat) / 5) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 121 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0121 : Poly :=
[
  term ((-14 : Rat) / 5) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((7 : Rat) / 5) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((14 : Rat) / 5) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 2), (15, 3)],
  term ((7 : Rat) / 5) [(7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0121_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0121
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0122 : Poly :=
[
  term ((57 : Rat) / 10) [(7, 1), (13, 1)]
]

/-- Partial product 122 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0122 : Poly :=
[
  term ((-57 : Rat) / 5) [(6, 1), (7, 1), (13, 1)],
  term ((57 : Rat) / 10) [(6, 2), (7, 1), (13, 1)],
  term ((57 : Rat) / 5) [(7, 1), (13, 1), (14, 1)],
  term ((-57 : Rat) / 10) [(7, 1), (13, 1), (14, 2)],
  term ((-57 : Rat) / 10) [(7, 1), (13, 1), (15, 2)],
  term ((57 : Rat) / 10) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0122_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0122
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0123 : Poly :=
[
  term ((-77 : Rat) / 12) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 123 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0123 : Poly :=
[
  term ((77 : Rat) / 6) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-77 : Rat) / 12) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((77 : Rat) / 12) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-77 : Rat) / 6) [(7, 1), (13, 1), (14, 2)],
  term ((77 : Rat) / 12) [(7, 1), (13, 1), (14, 3)],
  term ((-77 : Rat) / 12) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0123_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0123
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0124 : Poly :=
[
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 124 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0124 : Poly :=
[
  term (-3 : Rat) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((3 : Rat) / 2) [(7, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0124_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0124
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0125 : Poly :=
[
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 125 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0125 : Poly :=
[
  term (3 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0125_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0125
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0126 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 126 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0126 : Poly :=
[
  term ((7 : Rat) / 2) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-7 : Rat) / 4) [(6, 2), (7, 1), (13, 2), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 2), (15, 3)],
  term ((-7 : Rat) / 4) [(7, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0126_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0126
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0127 : Poly :=
[
  term ((-217 : Rat) / 60) [(7, 1), (15, 1)]
]

/-- Partial product 127 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0127 : Poly :=
[
  term ((217 : Rat) / 30) [(6, 1), (7, 1), (15, 1)],
  term ((-217 : Rat) / 60) [(6, 2), (7, 1), (15, 1)],
  term ((-217 : Rat) / 30) [(7, 1), (14, 1), (15, 1)],
  term ((217 : Rat) / 60) [(7, 1), (14, 2), (15, 1)],
  term ((217 : Rat) / 60) [(7, 1), (15, 3)],
  term ((-217 : Rat) / 60) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0127_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0127
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0128 : Poly :=
[
  term ((3 : Rat) / 4) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0128 : Poly :=
[
  term ((-3 : Rat) / 2) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(7, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 4) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0128_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0128
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0129 : Poly :=
[
  term ((37 : Rat) / 24) [(8, 1)]
]

/-- Partial product 129 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0129 : Poly :=
[
  term ((-37 : Rat) / 12) [(6, 1), (8, 1)],
  term ((37 : Rat) / 24) [(6, 2), (8, 1)],
  term ((37 : Rat) / 24) [(7, 2), (8, 1)],
  term ((37 : Rat) / 12) [(8, 1), (14, 1)],
  term ((-37 : Rat) / 24) [(8, 1), (14, 2)],
  term ((-37 : Rat) / 24) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0129_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0129
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0130 : Poly :=
[
  term ((-1 : Rat) / 6) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 130 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0130 : Poly :=
[
  term ((1 : Rat) / 3) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 6) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((1 : Rat) / 6) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0130_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0130
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0131 : Poly :=
[
  term ((1 : Rat) / 3) [(8, 1), (11, 2)]
]

/-- Partial product 131 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0131 : Poly :=
[
  term ((-2 : Rat) / 3) [(6, 1), (8, 1), (11, 2)],
  term ((1 : Rat) / 3) [(6, 2), (8, 1), (11, 2)],
  term ((1 : Rat) / 3) [(7, 2), (8, 1), (11, 2)],
  term ((2 : Rat) / 3) [(8, 1), (11, 2), (14, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 2), (14, 2)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0131_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0131
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0132 : Poly :=
[
  term ((1 : Rat) / 2) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 132 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0132 : Poly :=
[
  term (-1 : Rat) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 2) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 2) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term (1 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0132_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0132
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0133 : Poly :=
[
  term ((-1 : Rat) / 4) [(8, 1), (14, 1)]
]

/-- Partial product 133 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0133 : Poly :=
[
  term ((1 : Rat) / 2) [(6, 1), (8, 1), (14, 1)],
  term ((-1 : Rat) / 4) [(6, 2), (8, 1), (14, 1)],
  term ((-1 : Rat) / 4) [(7, 2), (8, 1), (14, 1)],
  term ((1 : Rat) / 4) [(8, 1), (14, 1), (15, 2)],
  term ((-1 : Rat) / 2) [(8, 1), (14, 2)],
  term ((1 : Rat) / 4) [(8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0133_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0133
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0134 : Poly :=
[
  term ((11 : Rat) / 8) [(9, 1), (11, 1)]
]

/-- Partial product 134 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0134 : Poly :=
[
  term ((-11 : Rat) / 4) [(6, 1), (9, 1), (11, 1)],
  term ((11 : Rat) / 8) [(6, 2), (9, 1), (11, 1)],
  term ((11 : Rat) / 8) [(7, 2), (9, 1), (11, 1)],
  term ((11 : Rat) / 4) [(9, 1), (11, 1), (14, 1)],
  term ((-11 : Rat) / 8) [(9, 1), (11, 1), (14, 2)],
  term ((-11 : Rat) / 8) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0134_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0134
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0135 : Poly :=
[
  term ((-1 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 135 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0135 : Poly :=
[
  term ((2 : Rat) / 3) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0135_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0135
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0136 : Poly :=
[
  term (-2 : Rat) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 136 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0136 : Poly :=
[
  term (4 : Rat) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term (-2 : Rat) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term (-2 : Rat) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term (-4 : Rat) [(9, 1), (11, 1), (14, 2)],
  term (2 : Rat) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0136_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0136
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0137 : Poly :=
[
  term (2 : Rat) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 137 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0137 : Poly :=
[
  term (-4 : Rat) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term (2 : Rat) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term (2 : Rat) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term (4 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term (-2 : Rat) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term (-2 : Rat) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0137_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0137
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0138 : Poly :=
[
  term ((2 : Rat) / 3) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 138 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0138 : Poly :=
[
  term ((-4 : Rat) / 3) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((2 : Rat) / 3) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((2 : Rat) / 3) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((4 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0138_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0138
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0139 : Poly :=
[
  term ((-11 : Rat) / 8) [(9, 1), (13, 1)]
]

/-- Partial product 139 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0139 : Poly :=
[
  term ((11 : Rat) / 4) [(6, 1), (9, 1), (13, 1)],
  term ((-11 : Rat) / 8) [(6, 2), (9, 1), (13, 1)],
  term ((-11 : Rat) / 8) [(7, 2), (9, 1), (13, 1)],
  term ((-11 : Rat) / 4) [(9, 1), (13, 1), (14, 1)],
  term ((11 : Rat) / 8) [(9, 1), (13, 1), (14, 2)],
  term ((11 : Rat) / 8) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0139_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0139
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0140 : Poly :=
[
  term (1 : Rat) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 140 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0140 : Poly :=
[
  term (-2 : Rat) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term (1 : Rat) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term (1 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term (-1 : Rat) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term (2 : Rat) [(9, 1), (13, 1), (14, 2)],
  term (-1 : Rat) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0140_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0140
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0141 : Poly :=
[
  term (-1 : Rat) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 141 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0141 : Poly :=
[
  term (2 : Rat) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term (-1 : Rat) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term (-1 : Rat) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term (-2 : Rat) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term (1 : Rat) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term (1 : Rat) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0141_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0141
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0142 : Poly :=
[
  term ((1 : Rat) / 2) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 142 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0142 : Poly :=
[
  term (-1 : Rat) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 2) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 2) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (14, 1), (15, 3)],
  term (1 : Rat) [(9, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0142_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0142
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0143 : Poly :=
[
  term ((1 : Rat) / 12) [(9, 1), (15, 1)]
]

/-- Partial product 143 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0143 : Poly :=
[
  term ((-1 : Rat) / 6) [(6, 1), (9, 1), (15, 1)],
  term ((1 : Rat) / 12) [(6, 2), (9, 1), (15, 1)],
  term ((1 : Rat) / 12) [(7, 2), (9, 1), (15, 1)],
  term ((1 : Rat) / 6) [(9, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 12) [(9, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 12) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0143_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0143
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0144 : Poly :=
[
  term ((295047 : Rat) / 3080) [(11, 1), (13, 1)]
]

/-- Partial product 144 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0144 : Poly :=
[
  term ((-295047 : Rat) / 1540) [(6, 1), (11, 1), (13, 1)],
  term ((295047 : Rat) / 3080) [(6, 2), (11, 1), (13, 1)],
  term ((295047 : Rat) / 3080) [(7, 2), (11, 1), (13, 1)],
  term ((295047 : Rat) / 1540) [(11, 1), (13, 1), (14, 1)],
  term ((-295047 : Rat) / 3080) [(11, 1), (13, 1), (14, 2)],
  term ((-295047 : Rat) / 3080) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0144_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0144
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0145 : Poly :=
[
  term ((-350783 : Rat) / 27720) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 145 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0145 : Poly :=
[
  term ((350783 : Rat) / 13860) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-350783 : Rat) / 27720) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-350783 : Rat) / 27720) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((350783 : Rat) / 27720) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-350783 : Rat) / 13860) [(11, 1), (13, 1), (14, 2)],
  term ((350783 : Rat) / 27720) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0145_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0145
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0146 : Poly :=
[
  term ((1 : Rat) / 6) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 146 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0146 : Poly :=
[
  term ((-1 : Rat) / 3) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 6) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 6) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 3) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1 : Rat) / 6) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1 : Rat) / 6) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0146_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0146
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0147 : Poly :=
[
  term ((11 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 147 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0147 : Poly :=
[
  term ((-22 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((22 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11 : Rat) / 5) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0147_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0147
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0148 : Poly :=
[
  term ((-6971 : Rat) / 4620) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 148 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0148 : Poly :=
[
  term ((6971 : Rat) / 2310) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6971 : Rat) / 4620) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-6971 : Rat) / 4620) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((6971 : Rat) / 4620) [(11, 1), (14, 1), (15, 3)],
  term ((-6971 : Rat) / 2310) [(11, 1), (14, 2), (15, 1)],
  term ((6971 : Rat) / 4620) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0148_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0148
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0149 : Poly :=
[
  term (-14 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0149 : Poly :=
[
  term (28 : Rat) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term (-28 : Rat) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term (14 : Rat) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0149_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0149
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0150 : Poly :=
[
  term (-3 : Rat) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 150 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0150 : Poly :=
[
  term (6 : Rat) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(7, 2), (11, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(11, 1), (14, 2), (15, 3)],
  term (-6 : Rat) [(11, 1), (14, 3), (15, 1)],
  term (3 : Rat) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0150_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0150
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0151 : Poly :=
[
  term ((-1279057 : Rat) / 27720) [(11, 1), (15, 1)]
]

/-- Partial product 151 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0151 : Poly :=
[
  term ((1279057 : Rat) / 13860) [(6, 1), (11, 1), (15, 1)],
  term ((-1279057 : Rat) / 27720) [(6, 2), (11, 1), (15, 1)],
  term ((-1279057 : Rat) / 27720) [(7, 2), (11, 1), (15, 1)],
  term ((-1279057 : Rat) / 13860) [(11, 1), (14, 1), (15, 1)],
  term ((1279057 : Rat) / 27720) [(11, 1), (14, 2), (15, 1)],
  term ((1279057 : Rat) / 27720) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0151_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0151
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0152 : Poly :=
[
  term ((27 : Rat) / 10) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0152 : Poly :=
[
  term ((-27 : Rat) / 5) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0152_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0152
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0153 : Poly :=
[
  term (-3 : Rat) [(11, 1), (15, 3)]
]

/-- Partial product 153 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0153 : Poly :=
[
  term (6 : Rat) [(6, 1), (11, 1), (15, 3)],
  term (-3 : Rat) [(6, 2), (11, 1), (15, 3)],
  term (-3 : Rat) [(7, 2), (11, 1), (15, 3)],
  term (-6 : Rat) [(11, 1), (14, 1), (15, 3)],
  term (3 : Rat) [(11, 1), (14, 2), (15, 3)],
  term (3 : Rat) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0153_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0153
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0154 : Poly :=
[
  term ((-311217 : Rat) / 1540) [(11, 2)]
]

/-- Partial product 154 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0154 : Poly :=
[
  term ((311217 : Rat) / 770) [(6, 1), (11, 2)],
  term ((-311217 : Rat) / 1540) [(6, 2), (11, 2)],
  term ((-311217 : Rat) / 1540) [(7, 2), (11, 2)],
  term ((-311217 : Rat) / 770) [(11, 2), (14, 1)],
  term ((311217 : Rat) / 1540) [(11, 2), (14, 2)],
  term ((311217 : Rat) / 1540) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0154_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0154
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0155 : Poly :=
[
  term ((-231337 : Rat) / 13860) [(11, 2), (14, 1)]
]

/-- Partial product 155 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0155 : Poly :=
[
  term ((231337 : Rat) / 6930) [(6, 1), (11, 2), (14, 1)],
  term ((-231337 : Rat) / 13860) [(6, 2), (11, 2), (14, 1)],
  term ((-231337 : Rat) / 13860) [(7, 2), (11, 2), (14, 1)],
  term ((231337 : Rat) / 13860) [(11, 2), (14, 1), (15, 2)],
  term ((-231337 : Rat) / 6930) [(11, 2), (14, 2)],
  term ((231337 : Rat) / 13860) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0155_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0155
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0156 : Poly :=
[
  term ((-1 : Rat) / 3) [(11, 2), (15, 2)]
]

/-- Partial product 156 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0156 : Poly :=
[
  term ((2 : Rat) / 3) [(6, 1), (11, 2), (15, 2)],
  term ((-1 : Rat) / 3) [(6, 2), (11, 2), (15, 2)],
  term ((-1 : Rat) / 3) [(7, 2), (11, 2), (15, 2)],
  term ((-2 : Rat) / 3) [(11, 2), (14, 1), (15, 2)],
  term ((1 : Rat) / 3) [(11, 2), (14, 2), (15, 2)],
  term ((1 : Rat) / 3) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0156_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0156
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0157 : Poly :=
[
  term ((-12 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 157 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0157 : Poly :=
[
  term ((24 : Rat) / 5) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0157_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0157
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0158 : Poly :=
[
  term ((-557 : Rat) / 4620) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 158 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0158 : Poly :=
[
  term ((557 : Rat) / 2310) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-557 : Rat) / 4620) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-557 : Rat) / 4620) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((557 : Rat) / 4620) [(13, 1), (14, 1), (15, 3)],
  term ((-557 : Rat) / 2310) [(13, 1), (14, 2), (15, 1)],
  term ((557 : Rat) / 4620) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0158_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0158
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0159 : Poly :=
[
  term (7 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0159 : Poly :=
[
  term (-14 : Rat) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term (14 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-7 : Rat) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0159_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0159
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0160 : Poly :=
[
  term ((3 : Rat) / 2) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 160 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0160 : Poly :=
[
  term (-3 : Rat) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 2), (15, 3)],
  term (3 : Rat) [(13, 1), (14, 3), (15, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0160_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0160
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0161 : Poly :=
[
  term ((-2884681 : Rat) / 27720) [(13, 1), (15, 1)]
]

/-- Partial product 161 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0161 : Poly :=
[
  term ((2884681 : Rat) / 13860) [(6, 1), (13, 1), (15, 1)],
  term ((-2884681 : Rat) / 27720) [(6, 2), (13, 1), (15, 1)],
  term ((-2884681 : Rat) / 27720) [(7, 2), (13, 1), (15, 1)],
  term ((-2884681 : Rat) / 13860) [(13, 1), (14, 1), (15, 1)],
  term ((2884681 : Rat) / 27720) [(13, 1), (14, 2), (15, 1)],
  term ((2884681 : Rat) / 27720) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0161_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0161
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0162 : Poly :=
[
  term ((-27 : Rat) / 10) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0162 : Poly :=
[
  term ((27 : Rat) / 5) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 10) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0162_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0162
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0163 : Poly :=
[
  term ((3 : Rat) / 2) [(13, 1), (15, 3)]
]

/-- Partial product 163 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0163 : Poly :=
[
  term (-3 : Rat) [(6, 1), (13, 1), (15, 3)],
  term ((3 : Rat) / 2) [(6, 2), (13, 1), (15, 3)],
  term ((3 : Rat) / 2) [(7, 2), (13, 1), (15, 3)],
  term (3 : Rat) [(13, 1), (14, 1), (15, 3)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 2), (15, 3)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0163_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0163
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0164 : Poly :=
[
  term ((7 : Rat) / 4) [(13, 2)]
]

/-- Partial product 164 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0164 : Poly :=
[
  term ((-7 : Rat) / 2) [(6, 1), (13, 2)],
  term ((7 : Rat) / 4) [(6, 2), (13, 2)],
  term ((7 : Rat) / 4) [(7, 2), (13, 2)],
  term ((7 : Rat) / 2) [(13, 2), (14, 1)],
  term ((-7 : Rat) / 4) [(13, 2), (14, 2)],
  term ((-7 : Rat) / 4) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0164_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0164
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0165 : Poly :=
[
  term ((21 : Rat) / 2) [(13, 2), (14, 1)]
]

/-- Partial product 165 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0165 : Poly :=
[
  term (-21 : Rat) [(6, 1), (13, 2), (14, 1)],
  term ((21 : Rat) / 2) [(6, 2), (13, 2), (14, 1)],
  term ((21 : Rat) / 2) [(7, 2), (13, 2), (14, 1)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 1), (15, 2)],
  term (21 : Rat) [(13, 2), (14, 2)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0165_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0165
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0166 : Poly :=
[
  term (3 : Rat) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0166 : Poly :=
[
  term (-6 : Rat) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term (-3 : Rat) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0166_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0166
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0167 : Poly :=
[
  term ((-3938665 : Rat) / 22176) [(14, 1)]
]

/-- Partial product 167 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0167 : Poly :=
[
  term ((3938665 : Rat) / 11088) [(6, 1), (14, 1)],
  term ((-3938665 : Rat) / 22176) [(6, 2), (14, 1)],
  term ((-3938665 : Rat) / 22176) [(7, 2), (14, 1)],
  term ((3938665 : Rat) / 22176) [(14, 1), (15, 2)],
  term ((-3938665 : Rat) / 11088) [(14, 2)],
  term ((3938665 : Rat) / 22176) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0167_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0167
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0168 : Poly :=
[
  term ((-231337 : Rat) / 18480) [(14, 2)]
]

/-- Partial product 168 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0168 : Poly :=
[
  term ((231337 : Rat) / 9240) [(6, 1), (14, 2)],
  term ((-231337 : Rat) / 18480) [(6, 2), (14, 2)],
  term ((-231337 : Rat) / 18480) [(7, 2), (14, 2)],
  term ((231337 : Rat) / 18480) [(14, 2), (15, 2)],
  term ((-231337 : Rat) / 9240) [(14, 3)],
  term ((231337 : Rat) / 18480) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0168_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0168
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0169 : Poly :=
[
  term ((-217051 : Rat) / 18480) [(15, 2)]
]

/-- Partial product 169 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0169 : Poly :=
[
  term ((217051 : Rat) / 9240) [(6, 1), (15, 2)],
  term ((-217051 : Rat) / 18480) [(6, 2), (15, 2)],
  term ((-217051 : Rat) / 18480) [(7, 2), (15, 2)],
  term ((-217051 : Rat) / 9240) [(14, 1), (15, 2)],
  term ((217051 : Rat) / 18480) [(14, 2), (15, 2)],
  term ((217051 : Rat) / 18480) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0169_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0169
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 5. -/
def rs_R014_ueqv_R014YY_coefficient_05_0170 : Poly :=
[
  term ((21 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 170 for generator 5. -/
def rs_R014_ueqv_R014YY_partial_05_0170 : Poly :=
[
  term ((-42 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((21 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term ((21 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term ((42 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((-21 : Rat) / 5) [(14, 2), (15, 2), (16, 1)],
  term ((-21 : Rat) / 5) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 5. -/
theorem rs_R014_ueqv_R014YY_partial_05_0170_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_05_0170
        rs_R014_ueqv_R014YY_generator_05_0100_0170 =
      rs_R014_ueqv_R014YY_partial_05_0170 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_05_0100_0170 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_05_0100,
  rs_R014_ueqv_R014YY_partial_05_0101,
  rs_R014_ueqv_R014YY_partial_05_0102,
  rs_R014_ueqv_R014YY_partial_05_0103,
  rs_R014_ueqv_R014YY_partial_05_0104,
  rs_R014_ueqv_R014YY_partial_05_0105,
  rs_R014_ueqv_R014YY_partial_05_0106,
  rs_R014_ueqv_R014YY_partial_05_0107,
  rs_R014_ueqv_R014YY_partial_05_0108,
  rs_R014_ueqv_R014YY_partial_05_0109,
  rs_R014_ueqv_R014YY_partial_05_0110,
  rs_R014_ueqv_R014YY_partial_05_0111,
  rs_R014_ueqv_R014YY_partial_05_0112,
  rs_R014_ueqv_R014YY_partial_05_0113,
  rs_R014_ueqv_R014YY_partial_05_0114,
  rs_R014_ueqv_R014YY_partial_05_0115,
  rs_R014_ueqv_R014YY_partial_05_0116,
  rs_R014_ueqv_R014YY_partial_05_0117,
  rs_R014_ueqv_R014YY_partial_05_0118,
  rs_R014_ueqv_R014YY_partial_05_0119,
  rs_R014_ueqv_R014YY_partial_05_0120,
  rs_R014_ueqv_R014YY_partial_05_0121,
  rs_R014_ueqv_R014YY_partial_05_0122,
  rs_R014_ueqv_R014YY_partial_05_0123,
  rs_R014_ueqv_R014YY_partial_05_0124,
  rs_R014_ueqv_R014YY_partial_05_0125,
  rs_R014_ueqv_R014YY_partial_05_0126,
  rs_R014_ueqv_R014YY_partial_05_0127,
  rs_R014_ueqv_R014YY_partial_05_0128,
  rs_R014_ueqv_R014YY_partial_05_0129,
  rs_R014_ueqv_R014YY_partial_05_0130,
  rs_R014_ueqv_R014YY_partial_05_0131,
  rs_R014_ueqv_R014YY_partial_05_0132,
  rs_R014_ueqv_R014YY_partial_05_0133,
  rs_R014_ueqv_R014YY_partial_05_0134,
  rs_R014_ueqv_R014YY_partial_05_0135,
  rs_R014_ueqv_R014YY_partial_05_0136,
  rs_R014_ueqv_R014YY_partial_05_0137,
  rs_R014_ueqv_R014YY_partial_05_0138,
  rs_R014_ueqv_R014YY_partial_05_0139,
  rs_R014_ueqv_R014YY_partial_05_0140,
  rs_R014_ueqv_R014YY_partial_05_0141,
  rs_R014_ueqv_R014YY_partial_05_0142,
  rs_R014_ueqv_R014YY_partial_05_0143,
  rs_R014_ueqv_R014YY_partial_05_0144,
  rs_R014_ueqv_R014YY_partial_05_0145,
  rs_R014_ueqv_R014YY_partial_05_0146,
  rs_R014_ueqv_R014YY_partial_05_0147,
  rs_R014_ueqv_R014YY_partial_05_0148,
  rs_R014_ueqv_R014YY_partial_05_0149,
  rs_R014_ueqv_R014YY_partial_05_0150,
  rs_R014_ueqv_R014YY_partial_05_0151,
  rs_R014_ueqv_R014YY_partial_05_0152,
  rs_R014_ueqv_R014YY_partial_05_0153,
  rs_R014_ueqv_R014YY_partial_05_0154,
  rs_R014_ueqv_R014YY_partial_05_0155,
  rs_R014_ueqv_R014YY_partial_05_0156,
  rs_R014_ueqv_R014YY_partial_05_0157,
  rs_R014_ueqv_R014YY_partial_05_0158,
  rs_R014_ueqv_R014YY_partial_05_0159,
  rs_R014_ueqv_R014YY_partial_05_0160,
  rs_R014_ueqv_R014YY_partial_05_0161,
  rs_R014_ueqv_R014YY_partial_05_0162,
  rs_R014_ueqv_R014YY_partial_05_0163,
  rs_R014_ueqv_R014YY_partial_05_0164,
  rs_R014_ueqv_R014YY_partial_05_0165,
  rs_R014_ueqv_R014YY_partial_05_0166,
  rs_R014_ueqv_R014YY_partial_05_0167,
  rs_R014_ueqv_R014YY_partial_05_0168,
  rs_R014_ueqv_R014YY_partial_05_0169,
  rs_R014_ueqv_R014YY_partial_05_0170
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_05_0100_0170 : Poly :=
[
  term ((-8 : Rat) / 3) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((4 : Rat) / 3) [(4, 1), (6, 1), (7, 1), (13, 1)],
  term (-56 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term (-6 : Rat) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 3) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term (3 : Rat) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term (42 : Rat) [(4, 1), (6, 1), (13, 2)],
  term ((-300822 : Rat) / 385) [(4, 1), (6, 1), (14, 1)],
  term ((4 : Rat) / 3) [(4, 1), (6, 2), (7, 1), (11, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (6, 2), (7, 1), (13, 1)],
  term (28 : Rat) [(4, 1), (6, 2), (11, 1), (13, 1)],
  term (3 : Rat) [(4, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((2 : Rat) / 3) [(4, 1), (6, 2), (13, 1), (15, 1)],
  term (-21 : Rat) [(4, 1), (6, 2), (13, 2)],
  term ((150411 : Rat) / 385) [(4, 1), (6, 2), (14, 1)],
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term (28 : Rat) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term (3 : Rat) [(4, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term (-21 : Rat) [(4, 1), (7, 2), (13, 2)],
  term ((150411 : Rat) / 385) [(4, 1), (7, 2), (14, 1)],
  term ((4 : Rat) / 3) [(4, 1), (7, 3), (11, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (7, 3), (13, 1)],
  term (56 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((22 : Rat) / 3) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 3), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (11, 1), (15, 3)],
  term ((4 : Rat) / 3) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((-11 : Rat) / 3) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 3), (15, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (13, 1), (15, 3)],
  term (-42 : Rat) [(4, 1), (13, 2), (14, 1)],
  term (21 : Rat) [(4, 1), (13, 2), (14, 2)],
  term (21 : Rat) [(4, 1), (13, 2), (15, 2)],
  term ((-150411 : Rat) / 385) [(4, 1), (14, 1), (15, 2)],
  term ((300822 : Rat) / 385) [(4, 1), (14, 2)],
  term ((-150411 : Rat) / 385) [(4, 1), (14, 3)],
  term ((301207 : Rat) / 770) [(4, 2), (6, 1)],
  term ((-301207 : Rat) / 1540) [(4, 2), (6, 2)],
  term ((-301207 : Rat) / 1540) [(4, 2), (7, 2)],
  term ((-301207 : Rat) / 770) [(4, 2), (14, 1)],
  term ((301207 : Rat) / 1540) [(4, 2), (14, 2)],
  term ((301207 : Rat) / 1540) [(4, 2), (15, 2)],
  term ((298127 : Rat) / 1540) [(5, 1), (6, 1), (7, 1)],
  term ((16 : Rat) / 3) [(5, 1), (6, 1), (11, 1)],
  term (-7 : Rat) [(5, 1), (6, 1), (13, 1)],
  term ((3 : Rat) / 2) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-902851 : Rat) / 2310) [(5, 1), (6, 1), (15, 1)],
  term ((-298127 : Rat) / 3080) [(5, 1), (6, 2), (7, 1)],
  term ((-8 : Rat) / 3) [(5, 1), (6, 2), (11, 1)],
  term ((7 : Rat) / 2) [(5, 1), (6, 2), (13, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((902851 : Rat) / 4620) [(5, 1), (6, 2), (15, 1)],
  term ((-298127 : Rat) / 1540) [(5, 1), (7, 1), (14, 1)],
  term ((298127 : Rat) / 3080) [(5, 1), (7, 1), (14, 2)],
  term ((298127 : Rat) / 3080) [(5, 1), (7, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(5, 1), (7, 2), (11, 1)],
  term ((7 : Rat) / 2) [(5, 1), (7, 2), (13, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((902851 : Rat) / 4620) [(5, 1), (7, 2), (15, 1)],
  term ((-298127 : Rat) / 3080) [(5, 1), (7, 3)],
  term ((-16 : Rat) / 3) [(5, 1), (11, 1), (14, 1)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (14, 2)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (15, 2)],
  term (7 : Rat) [(5, 1), (13, 1), (14, 1)],
  term ((-7 : Rat) / 2) [(5, 1), (13, 1), (14, 2)],
  term ((-7 : Rat) / 2) [(5, 1), (13, 1), (15, 2)],
  term ((902851 : Rat) / 2310) [(5, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 4) [(5, 1), (14, 1), (15, 3)],
  term ((-909781 : Rat) / 4620) [(5, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 4) [(5, 1), (14, 3), (15, 1)],
  term ((-902851 : Rat) / 4620) [(5, 1), (15, 3)],
  term (-6 : Rat) [(6, 1), (7, 1), (9, 1)],
  term ((196 : Rat) / 15) [(6, 1), (7, 1), (11, 1)],
  term ((77 : Rat) / 30) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-77 : Rat) / 3) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term (6 : Rat) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-57 : Rat) / 5) [(6, 1), (7, 1), (13, 1)],
  term ((77 : Rat) / 6) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term (-3 : Rat) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((7 : Rat) / 2) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((217 : Rat) / 30) [(6, 1), (7, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 12) [(6, 1), (8, 1)],
  term ((1 : Rat) / 3) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (8, 1), (11, 2)],
  term (-1 : Rat) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 2) [(6, 1), (8, 1), (14, 1)],
  term ((-11 : Rat) / 4) [(6, 1), (9, 1), (11, 1)],
  term ((2 : Rat) / 3) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term (-4 : Rat) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((11 : Rat) / 4) [(6, 1), (9, 1), (13, 1)],
  term (-2 : Rat) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term (2 : Rat) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term (-1 : Rat) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(6, 1), (9, 1), (15, 1)],
  term ((-295047 : Rat) / 1540) [(6, 1), (11, 1), (13, 1)],
  term ((350783 : Rat) / 13860) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-22 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6971 : Rat) / 2310) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term (28 : Rat) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((1279057 : Rat) / 13860) [(6, 1), (11, 1), (15, 1)],
  term ((-27 : Rat) / 5) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(6, 1), (11, 1), (15, 3)],
  term ((311217 : Rat) / 770) [(6, 1), (11, 2)],
  term ((231337 : Rat) / 6930) [(6, 1), (11, 2), (14, 1)],
  term ((2 : Rat) / 3) [(6, 1), (11, 2), (15, 2)],
  term ((24 : Rat) / 5) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((557 : Rat) / 2310) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term (-14 : Rat) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((2884681 : Rat) / 13860) [(6, 1), (13, 1), (15, 1)],
  term ((27 : Rat) / 5) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(6, 1), (13, 1), (15, 3)],
  term ((-7 : Rat) / 2) [(6, 1), (13, 2)],
  term (-21 : Rat) [(6, 1), (13, 2), (14, 1)],
  term (-6 : Rat) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((3938665 : Rat) / 11088) [(6, 1), (14, 1)],
  term ((231337 : Rat) / 9240) [(6, 1), (14, 2)],
  term ((217051 : Rat) / 9240) [(6, 1), (15, 2)],
  term ((-42 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(6, 2), (7, 1), (9, 1)],
  term ((-98 : Rat) / 15) [(6, 2), (7, 1), (11, 1)],
  term ((-77 : Rat) / 60) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((77 : Rat) / 6) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term (-3 : Rat) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((7 : Rat) / 5) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((57 : Rat) / 10) [(6, 2), (7, 1), (13, 1)],
  term ((-77 : Rat) / 12) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((3 : Rat) / 2) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(6, 2), (7, 1), (13, 2), (15, 1)],
  term ((-217 : Rat) / 60) [(6, 2), (7, 1), (15, 1)],
  term ((3 : Rat) / 4) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 24) [(6, 2), (8, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((1 : Rat) / 3) [(6, 2), (8, 1), (11, 2)],
  term ((1 : Rat) / 2) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 4) [(6, 2), (8, 1), (14, 1)],
  term ((11 : Rat) / 8) [(6, 2), (9, 1), (11, 1)],
  term ((-1 : Rat) / 3) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term (-2 : Rat) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term (2 : Rat) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((2 : Rat) / 3) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-11 : Rat) / 8) [(6, 2), (9, 1), (13, 1)],
  term (1 : Rat) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term (-1 : Rat) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 2) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 12) [(6, 2), (9, 1), (15, 1)],
  term ((295047 : Rat) / 3080) [(6, 2), (11, 1), (13, 1)],
  term ((-350783 : Rat) / 27720) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 6) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((11 : Rat) / 5) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6971 : Rat) / 4620) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term (-14 : Rat) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1279057 : Rat) / 27720) [(6, 2), (11, 1), (15, 1)],
  term ((27 : Rat) / 10) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(6, 2), (11, 1), (15, 3)],
  term ((-311217 : Rat) / 1540) [(6, 2), (11, 2)],
  term ((-231337 : Rat) / 13860) [(6, 2), (11, 2), (14, 1)],
  term ((-1 : Rat) / 3) [(6, 2), (11, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-557 : Rat) / 4620) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term (7 : Rat) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2884681 : Rat) / 27720) [(6, 2), (13, 1), (15, 1)],
  term ((-27 : Rat) / 10) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(6, 2), (13, 1), (15, 3)],
  term ((7 : Rat) / 4) [(6, 2), (13, 2)],
  term ((21 : Rat) / 2) [(6, 2), (13, 2), (14, 1)],
  term (3 : Rat) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3938665 : Rat) / 22176) [(6, 2), (14, 1)],
  term ((-231337 : Rat) / 18480) [(6, 2), (14, 2)],
  term ((-217051 : Rat) / 18480) [(6, 2), (15, 2)],
  term ((21 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(7, 1), (9, 1), (14, 1)],
  term (-3 : Rat) [(7, 1), (9, 1), (14, 2)],
  term (-3 : Rat) [(7, 1), (9, 1), (15, 2)],
  term ((-77 : Rat) / 30) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-196 : Rat) / 15) [(7, 1), (11, 1), (14, 1)],
  term ((-77 : Rat) / 6) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((161 : Rat) / 5) [(7, 1), (11, 1), (14, 2)],
  term ((-15 : Rat) / 2) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-77 : Rat) / 6) [(7, 1), (11, 1), (14, 3)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((98 : Rat) / 15) [(7, 1), (11, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((14 : Rat) / 5) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 2), (15, 3)],
  term ((57 : Rat) / 5) [(7, 1), (13, 1), (14, 1)],
  term ((77 : Rat) / 12) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-278 : Rat) / 15) [(7, 1), (13, 1), (14, 2)],
  term ((9 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((77 : Rat) / 12) [(7, 1), (13, 1), (14, 3)],
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((-57 : Rat) / 10) [(7, 1), (13, 1), (15, 2)],
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 2), (15, 3)],
  term ((-217 : Rat) / 30) [(7, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((217 : Rat) / 60) [(7, 1), (14, 2), (15, 1)],
  term ((-3 : Rat) / 4) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((217 : Rat) / 60) [(7, 1), (15, 3)],
  term ((-3 : Rat) / 4) [(7, 1), (15, 3), (16, 1)],
  term ((37 : Rat) / 24) [(7, 2), (8, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((1 : Rat) / 3) [(7, 2), (8, 1), (11, 2)],
  term ((1 : Rat) / 2) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1 : Rat) / 4) [(7, 2), (8, 1), (14, 1)],
  term ((11 : Rat) / 8) [(7, 2), (9, 1), (11, 1)],
  term ((-1 : Rat) / 3) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term (-2 : Rat) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term (2 : Rat) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((2 : Rat) / 3) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-11 : Rat) / 8) [(7, 2), (9, 1), (13, 1)],
  term (1 : Rat) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term (-1 : Rat) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 2) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 12) [(7, 2), (9, 1), (15, 1)],
  term ((295047 : Rat) / 3080) [(7, 2), (11, 1), (13, 1)],
  term ((-350783 : Rat) / 27720) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 6) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((11 : Rat) / 5) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6971 : Rat) / 4620) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term (-14 : Rat) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1279057 : Rat) / 27720) [(7, 2), (11, 1), (15, 1)],
  term ((27 : Rat) / 10) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 2), (11, 1), (15, 3)],
  term ((-311217 : Rat) / 1540) [(7, 2), (11, 2)],
  term ((-231337 : Rat) / 13860) [(7, 2), (11, 2), (14, 1)],
  term ((-1 : Rat) / 3) [(7, 2), (11, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-557 : Rat) / 4620) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term (7 : Rat) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2884681 : Rat) / 27720) [(7, 2), (13, 1), (15, 1)],
  term ((-27 : Rat) / 10) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 2), (13, 1), (15, 3)],
  term ((7 : Rat) / 4) [(7, 2), (13, 2)],
  term ((21 : Rat) / 2) [(7, 2), (13, 2), (14, 1)],
  term (3 : Rat) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3938665 : Rat) / 22176) [(7, 2), (14, 1)],
  term ((-231337 : Rat) / 18480) [(7, 2), (14, 2)],
  term ((-217051 : Rat) / 18480) [(7, 2), (15, 2)],
  term ((21 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(7, 3), (9, 1)],
  term ((-98 : Rat) / 15) [(7, 3), (11, 1)],
  term ((-77 : Rat) / 60) [(7, 3), (11, 1), (13, 1), (15, 1)],
  term ((77 : Rat) / 6) [(7, 3), (11, 1), (14, 1)],
  term (-3 : Rat) [(7, 3), (11, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(7, 3), (11, 1), (16, 1)],
  term ((7 : Rat) / 5) [(7, 3), (11, 2), (15, 1)],
  term ((57 : Rat) / 10) [(7, 3), (13, 1)],
  term ((-77 : Rat) / 12) [(7, 3), (13, 1), (14, 1)],
  term ((3 : Rat) / 2) [(7, 3), (13, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 3), (13, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(7, 3), (13, 2), (15, 1)],
  term ((-217 : Rat) / 60) [(7, 3), (15, 1)],
  term ((3 : Rat) / 4) [(7, 3), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 6) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((1 : Rat) / 6) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((2 : Rat) / 3) [(8, 1), (11, 2), (14, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 2), (14, 2)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 2), (15, 2)],
  term (1 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 2) [(8, 1), (13, 1), (15, 3)],
  term ((37 : Rat) / 12) [(8, 1), (14, 1)],
  term ((1 : Rat) / 4) [(8, 1), (14, 1), (15, 2)],
  term ((-49 : Rat) / 24) [(8, 1), (14, 2)],
  term ((1 : Rat) / 4) [(8, 1), (14, 3)],
  term ((-37 : Rat) / 24) [(8, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((11 : Rat) / 4) [(9, 1), (11, 1), (14, 1)],
  term (6 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-43 : Rat) / 8) [(9, 1), (11, 1), (14, 2)],
  term (-2 : Rat) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term (2 : Rat) [(9, 1), (11, 1), (14, 3)],
  term ((-11 : Rat) / 8) [(9, 1), (11, 1), (15, 2)],
  term (-2 : Rat) [(9, 1), (11, 1), (15, 4)],
  term ((4 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 2), (15, 3)],
  term ((-11 : Rat) / 4) [(9, 1), (13, 1), (14, 1)],
  term (-3 : Rat) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((27 : Rat) / 8) [(9, 1), (13, 1), (14, 2)],
  term (1 : Rat) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term (-1 : Rat) [(9, 1), (13, 1), (14, 3)],
  term ((11 : Rat) / 8) [(9, 1), (13, 1), (15, 2)],
  term (1 : Rat) [(9, 1), (13, 1), (15, 4)],
  term ((1 : Rat) / 6) [(9, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (14, 1), (15, 3)],
  term ((11 : Rat) / 12) [(9, 1), (14, 2), (15, 1)],
  term ((-1 : Rat) / 2) [(9, 1), (14, 3), (15, 1)],
  term ((-1 : Rat) / 12) [(9, 1), (15, 3)],
  term ((295047 : Rat) / 1540) [(11, 1), (13, 1), (14, 1)],
  term ((360023 : Rat) / 27720) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((22 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3356989 : Rat) / 27720) [(11, 1), (13, 1), (14, 2)],
  term ((-1 : Rat) / 6) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-11 : Rat) / 5) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((350783 : Rat) / 27720) [(11, 1), (13, 1), (14, 3)],
  term ((-295047 : Rat) / 3080) [(11, 1), (13, 1), (15, 2)],
  term ((-1 : Rat) / 6) [(11, 1), (13, 1), (15, 4)],
  term ((-11 : Rat) / 5) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1279057 : Rat) / 13860) [(11, 1), (14, 1), (15, 1)],
  term ((27 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20749 : Rat) / 4620) [(11, 1), (14, 1), (15, 3)],
  term (14 : Rat) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((239081 : Rat) / 5544) [(11, 1), (14, 2), (15, 1)],
  term ((-307 : Rat) / 10) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 1), (14, 2), (15, 3)],
  term ((-20749 : Rat) / 4620) [(11, 1), (14, 3), (15, 1)],
  term (14 : Rat) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (14, 4), (15, 1)],
  term ((1279057 : Rat) / 27720) [(11, 1), (15, 3)],
  term ((-27 : Rat) / 10) [(11, 1), (15, 3), (16, 1)],
  term (3 : Rat) [(11, 1), (15, 5)],
  term ((-311217 : Rat) / 770) [(11, 2), (14, 1)],
  term ((222097 : Rat) / 13860) [(11, 2), (14, 1), (15, 2)],
  term ((-24 : Rat) / 5) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2338279 : Rat) / 13860) [(11, 2), (14, 2)],
  term ((1 : Rat) / 3) [(11, 2), (14, 2), (15, 2)],
  term ((12 : Rat) / 5) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((231337 : Rat) / 13860) [(11, 2), (14, 3)],
  term ((311217 : Rat) / 1540) [(11, 2), (15, 2)],
  term ((1 : Rat) / 3) [(11, 2), (15, 4)],
  term ((12 : Rat) / 5) [(11, 2), (15, 4), (16, 1)],
  term ((-2884681 : Rat) / 13860) [(13, 1), (14, 1), (15, 1)],
  term ((-27 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14417 : Rat) / 4620) [(13, 1), (14, 1), (15, 3)],
  term (-7 : Rat) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2877997 : Rat) / 27720) [(13, 1), (14, 2), (15, 1)],
  term ((167 : Rat) / 10) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (14, 2), (15, 3)],
  term ((14417 : Rat) / 4620) [(13, 1), (14, 3), (15, 1)],
  term (-7 : Rat) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (14, 4), (15, 1)],
  term ((2884681 : Rat) / 27720) [(13, 1), (15, 3)],
  term ((27 : Rat) / 10) [(13, 1), (15, 3), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 1), (15, 5)],
  term ((7 : Rat) / 2) [(13, 2), (14, 1)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 1), (15, 2)],
  term (6 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((77 : Rat) / 4) [(13, 2), (14, 2)],
  term (-3 : Rat) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-21 : Rat) / 2) [(13, 2), (14, 3)],
  term ((-7 : Rat) / 4) [(13, 2), (15, 2)],
  term (-3 : Rat) [(13, 2), (15, 4), (16, 1)],
  term ((17088713 : Rat) / 110880) [(14, 1), (15, 2)],
  term ((42 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((-3938665 : Rat) / 11088) [(14, 2)],
  term ((112097 : Rat) / 4620) [(14, 2), (15, 2)],
  term ((-21 : Rat) / 5) [(14, 2), (15, 2), (16, 1)],
  term ((16917281 : Rat) / 110880) [(14, 3)],
  term ((231337 : Rat) / 18480) [(14, 4)],
  term ((217051 : Rat) / 18480) [(15, 4)],
  term ((-21 : Rat) / 5) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 170. -/
theorem rs_R014_ueqv_R014YY_block_05_0100_0170_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_05_0100_0170
      rs_R014_ueqv_R014YY_block_05_0100_0170 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
