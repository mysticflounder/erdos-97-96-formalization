/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 26:100-147

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_26_0100_0147 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0100 : Poly :=
[
  term ((42144 : Rat) / 599) [(7, 1), (15, 1)]
]

/-- Partial product 100 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0100 : Poly :=
[
  term ((84288 : Rat) / 599) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-42144 : Rat) / 599) [(7, 1), (8, 2), (15, 1)],
  term ((84288 : Rat) / 599) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-42144 : Rat) / 599) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0100_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0100
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0101 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(7, 1), (15, 3)]
]

/-- Partial product 101 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0101 : Poly :=
[
  term ((-9695232 : Rat) / 2995) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((4847616 : Rat) / 2995) [(7, 1), (8, 2), (15, 3)],
  term ((-9695232 : Rat) / 2995) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((4847616 : Rat) / 2995) [(7, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0101_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0101
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0102 : Poly :=
[
  term ((1068 : Rat) / 5) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 102 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0102 : Poly :=
[
  term ((2136 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1068 : Rat) / 5) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((2136 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1068 : Rat) / 5) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0102_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0102
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0103 : Poly :=
[
  term ((1362 : Rat) / 599) [(8, 1)]
]

/-- Partial product 103 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0103 : Poly :=
[
  term ((2724 : Rat) / 599) [(8, 1), (9, 1), (13, 1)],
  term ((-1362 : Rat) / 599) [(8, 1), (9, 2)],
  term ((2724 : Rat) / 599) [(8, 2), (12, 1)],
  term ((-1362 : Rat) / 599) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0103_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0103
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0104 : Poly :=
[
  term ((-1124928 : Rat) / 2995) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 104 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0104 : Poly :=
[
  term ((-2249856 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((1124928 : Rat) / 2995) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-2249856 : Rat) / 2995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((1124928 : Rat) / 2995) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0104_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0104
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0105 : Poly :=
[
  term ((1570176 : Rat) / 599) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 105 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0105 : Poly :=
[
  term ((3140352 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1570176 : Rat) / 599) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((3140352 : Rat) / 599) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1570176 : Rat) / 599) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0105_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0105
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0106 : Poly :=
[
  term ((-132 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0106 : Poly :=
[
  term ((-264 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 5) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-264 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 5) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0106_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0106
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0107 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(8, 1), (11, 2)]
]

/-- Partial product 107 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0107 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(8, 1), (9, 2), (11, 2)],
  term ((-642816 : Rat) / 2995) [(8, 2), (11, 2), (12, 1)],
  term ((321408 : Rat) / 2995) [(8, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0107_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0107
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0108 : Poly :=
[
  term ((1301184 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 108 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0108 : Poly :=
[
  term ((2602368 : Rat) / 2995) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-1301184 : Rat) / 2995) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((2602368 : Rat) / 2995) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1301184 : Rat) / 2995) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0108_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0108
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0109 : Poly :=
[
  term ((-262 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0109 : Poly :=
[
  term ((-524 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((262 : Rat) / 5) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-524 : Rat) / 5) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((262 : Rat) / 5) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0109_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0109
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0110 : Poly :=
[
  term ((-8458368 : Rat) / 2995) [(8, 1), (15, 2)]
]

/-- Partial product 110 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0110 : Poly :=
[
  term ((-16916736 : Rat) / 2995) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((8458368 : Rat) / 2995) [(8, 1), (9, 2), (15, 2)],
  term ((-16916736 : Rat) / 2995) [(8, 2), (12, 1), (15, 2)],
  term ((8458368 : Rat) / 2995) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0110_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0110
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0111 : Poly :=
[
  term ((1924 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0111 : Poly :=
[
  term ((3848 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1924 : Rat) / 5) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((3848 : Rat) / 5) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1924 : Rat) / 5) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0111_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0111
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0112 : Poly :=
[
  term ((-294624 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 112 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0112 : Poly :=
[
  term ((-589248 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((294624 : Rat) / 2995) [(8, 2), (9, 1), (11, 1)],
  term ((-589248 : Rat) / 2995) [(9, 2), (11, 1), (13, 1)],
  term ((294624 : Rat) / 2995) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0112_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0112
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0113 : Poly :=
[
  term ((123840 : Rat) / 599) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 113 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0113 : Poly :=
[
  term ((247680 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-123840 : Rat) / 599) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-123840 : Rat) / 599) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0113_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0113
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0114 : Poly :=
[
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0114 : Poly :=
[
  term ((-144 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0114_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0114
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0115 : Poly :=
[
  term ((-247680 : Rat) / 599) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 115 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0115 : Poly :=
[
  term ((-495360 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((247680 : Rat) / 599) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-495360 : Rat) / 599) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((247680 : Rat) / 599) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0115_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0115
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0116 : Poly :=
[
  term ((144 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0116 : Poly :=
[
  term ((288 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0116_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0116
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0117 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 117 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0117 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((321408 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (13, 2)],
  term ((321408 : Rat) / 2995) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0117_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0117
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0118 : Poly :=
[
  term ((642816 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 118 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0118 : Poly :=
[
  term ((1285632 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((1285632 : Rat) / 2995) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0118_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0118
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0119 : Poly :=
[
  term ((2724 : Rat) / 599) [(9, 1), (13, 1)]
]

/-- Partial product 119 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0119 : Poly :=
[
  term ((5448 : Rat) / 599) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2724 : Rat) / 599) [(8, 2), (9, 1), (13, 1)],
  term ((5448 : Rat) / 599) [(9, 2), (13, 2)],
  term ((-2724 : Rat) / 599) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0119_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0119
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0120 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 120 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0120 : Poly :=
[
  term ((-262656 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-262656 : Rat) / 2995) [(9, 2), (13, 2), (15, 2)],
  term ((131328 : Rat) / 2995) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0120_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0120
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0121 : Poly :=
[
  term ((-16 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0121 : Poly :=
[
  term ((-32 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0121_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0121
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0122 : Poly :=
[
  term ((241272 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 122 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0122 : Poly :=
[
  term ((482544 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-241272 : Rat) / 2995) [(8, 2), (9, 1), (15, 1)],
  term ((482544 : Rat) / 2995) [(9, 2), (13, 1), (15, 1)],
  term ((-241272 : Rat) / 2995) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0122_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0122
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0123 : Poly :=
[
  term ((-81 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0123 : Poly :=
[
  term ((-162 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 5) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0123_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0123
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0124 : Poly :=
[
  term ((262656 : Rat) / 2995) [(9, 1), (15, 3)]
]

/-- Partial product 124 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0124 : Poly :=
[
  term ((525312 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-262656 : Rat) / 2995) [(8, 2), (9, 1), (15, 3)],
  term ((525312 : Rat) / 2995) [(9, 2), (13, 1), (15, 3)],
  term ((-262656 : Rat) / 2995) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0124_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0124
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0125 : Poly :=
[
  term ((32 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 125 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0125 : Poly :=
[
  term ((64 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 5) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 5) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 5) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0125_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0125
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0126 : Poly :=
[
  term ((-964224 : Rat) / 2995) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 126 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0126 : Poly :=
[
  term ((-1928448 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((964224 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-1928448 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((964224 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0126_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0126
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0127 : Poly :=
[
  term ((642816 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 127 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0127 : Poly :=
[
  term ((1285632 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0127_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0127
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0128 : Poly :=
[
  term ((1045152 : Rat) / 2995) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 128 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0128 : Poly :=
[
  term ((2090304 : Rat) / 2995) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((2090304 : Rat) / 2995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0128_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0128
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0129 : Poly :=
[
  term ((-206 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0129 : Poly :=
[
  term ((-412 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((206 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-412 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((206 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0129_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0129
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0130 : Poly :=
[
  term ((-711648 : Rat) / 2995) [(10, 1), (15, 2)]
]

/-- Partial product 130 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0130 : Poly :=
[
  term ((-1423296 : Rat) / 2995) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((711648 : Rat) / 2995) [(8, 2), (10, 1), (15, 2)],
  term ((-1423296 : Rat) / 2995) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((711648 : Rat) / 2995) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0130_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0130
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0131 : Poly :=
[
  term ((154 : Rat) / 5) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0131 : Poly :=
[
  term ((308 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-154 : Rat) / 5) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((308 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154 : Rat) / 5) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0131_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0131
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0132 : Poly :=
[
  term ((517824 : Rat) / 2995) [(11, 1), (13, 1)]
]

/-- Partial product 132 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0132 : Poly :=
[
  term ((1035648 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-517824 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)],
  term ((1035648 : Rat) / 2995) [(9, 1), (11, 1), (13, 2)],
  term ((-517824 : Rat) / 2995) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0132_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0132
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0133 : Poly :=
[
  term ((-283872 : Rat) / 599) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 133 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0133 : Poly :=
[
  term ((-567744 : Rat) / 599) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((283872 : Rat) / 599) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-567744 : Rat) / 599) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((283872 : Rat) / 599) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0133_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0133
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0134 : Poly :=
[
  term (80 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 134 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0134 : Poly :=
[
  term (160 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-80 : Rat) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (160 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (-80 : Rat) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0134_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0134
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0135 : Poly :=
[
  term ((-6337104 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 135 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0135 : Poly :=
[
  term ((-12674208 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((6337104 : Rat) / 2995) [(8, 2), (11, 1), (15, 1)],
  term ((-12674208 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6337104 : Rat) / 2995) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0135_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0135
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0136 : Poly :=
[
  term ((384 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0136 : Poly :=
[
  term ((768 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0136_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0136
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0137 : Poly :=
[
  term ((3428256 : Rat) / 2995) [(11, 1), (15, 3)]
]

/-- Partial product 137 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0137 : Poly :=
[
  term ((6856512 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-3428256 : Rat) / 2995) [(8, 2), (11, 1), (15, 3)],
  term ((6856512 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3428256 : Rat) / 2995) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0137_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0137
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0138 : Poly :=
[
  term ((-668 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 138 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0138 : Poly :=
[
  term ((-1336 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((668 : Rat) / 5) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1336 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((668 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0138_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0138
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0139 : Poly :=
[
  term ((1312416 : Rat) / 2995) [(11, 2)]
]

/-- Partial product 139 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0139 : Poly :=
[
  term ((2624832 : Rat) / 2995) [(8, 1), (11, 2), (12, 1)],
  term ((-1312416 : Rat) / 2995) [(8, 2), (11, 2)],
  term ((2624832 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)],
  term ((-1312416 : Rat) / 2995) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0139_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0139
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0140 : Poly :=
[
  term ((267840 : Rat) / 599) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 140 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0140 : Poly :=
[
  term ((535680 : Rat) / 599) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-267840 : Rat) / 599) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((535680 : Rat) / 599) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-267840 : Rat) / 599) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0140_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0140
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0141 : Poly :=
[
  term ((-8627904 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 141 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0141 : Poly :=
[
  term ((-17255808 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((8627904 : Rat) / 2995) [(8, 2), (11, 2), (15, 2)],
  term ((-17255808 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((8627904 : Rat) / 2995) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0141_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0141
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0142 : Poly :=
[
  term ((1896 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0142 : Poly :=
[
  term ((3792 : Rat) / 5) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 5) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((3792 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 5) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0142_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0142
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0143 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(11, 3), (15, 1)]
]

/-- Partial product 143 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0143 : Poly :=
[
  term ((11570688 : Rat) / 2995) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(8, 2), (11, 3), (15, 1)],
  term ((11570688 : Rat) / 2995) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0143_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0143
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0144 : Poly :=
[
  term ((-524872 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 144 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0144 : Poly :=
[
  term ((-1049744 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((524872 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)],
  term ((-1049744 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)],
  term ((524872 : Rat) / 2995) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0144_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0144
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0145 : Poly :=
[
  term ((91 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0145 : Poly :=
[
  term ((182 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-91 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0145_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0145
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0146 : Poly :=
[
  term ((5203268 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 146 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0146 : Poly :=
[
  term ((10406536 : Rat) / 2995) [(8, 1), (12, 1), (15, 2)],
  term ((-5203268 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((10406536 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)],
  term ((-5203268 : Rat) / 2995) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0146_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0146
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYN_coefficient_26_0147 : Poly :=
[
  term ((-1179 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 147 for generator 26. -/
def rs_R010_ueqv_R010NYN_partial_26_0147 : Poly :=
[
  term ((-2358 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1179 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((-2358 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1179 : Rat) / 5) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 26. -/
theorem rs_R010_ueqv_R010NYN_partial_26_0147_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_26_0147
        rs_R010_ueqv_R010NYN_generator_26_0100_0147 =
      rs_R010_ueqv_R010NYN_partial_26_0147 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_26_0100_0147 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_26_0100,
  rs_R010_ueqv_R010NYN_partial_26_0101,
  rs_R010_ueqv_R010NYN_partial_26_0102,
  rs_R010_ueqv_R010NYN_partial_26_0103,
  rs_R010_ueqv_R010NYN_partial_26_0104,
  rs_R010_ueqv_R010NYN_partial_26_0105,
  rs_R010_ueqv_R010NYN_partial_26_0106,
  rs_R010_ueqv_R010NYN_partial_26_0107,
  rs_R010_ueqv_R010NYN_partial_26_0108,
  rs_R010_ueqv_R010NYN_partial_26_0109,
  rs_R010_ueqv_R010NYN_partial_26_0110,
  rs_R010_ueqv_R010NYN_partial_26_0111,
  rs_R010_ueqv_R010NYN_partial_26_0112,
  rs_R010_ueqv_R010NYN_partial_26_0113,
  rs_R010_ueqv_R010NYN_partial_26_0114,
  rs_R010_ueqv_R010NYN_partial_26_0115,
  rs_R010_ueqv_R010NYN_partial_26_0116,
  rs_R010_ueqv_R010NYN_partial_26_0117,
  rs_R010_ueqv_R010NYN_partial_26_0118,
  rs_R010_ueqv_R010NYN_partial_26_0119,
  rs_R010_ueqv_R010NYN_partial_26_0120,
  rs_R010_ueqv_R010NYN_partial_26_0121,
  rs_R010_ueqv_R010NYN_partial_26_0122,
  rs_R010_ueqv_R010NYN_partial_26_0123,
  rs_R010_ueqv_R010NYN_partial_26_0124,
  rs_R010_ueqv_R010NYN_partial_26_0125,
  rs_R010_ueqv_R010NYN_partial_26_0126,
  rs_R010_ueqv_R010NYN_partial_26_0127,
  rs_R010_ueqv_R010NYN_partial_26_0128,
  rs_R010_ueqv_R010NYN_partial_26_0129,
  rs_R010_ueqv_R010NYN_partial_26_0130,
  rs_R010_ueqv_R010NYN_partial_26_0131,
  rs_R010_ueqv_R010NYN_partial_26_0132,
  rs_R010_ueqv_R010NYN_partial_26_0133,
  rs_R010_ueqv_R010NYN_partial_26_0134,
  rs_R010_ueqv_R010NYN_partial_26_0135,
  rs_R010_ueqv_R010NYN_partial_26_0136,
  rs_R010_ueqv_R010NYN_partial_26_0137,
  rs_R010_ueqv_R010NYN_partial_26_0138,
  rs_R010_ueqv_R010NYN_partial_26_0139,
  rs_R010_ueqv_R010NYN_partial_26_0140,
  rs_R010_ueqv_R010NYN_partial_26_0141,
  rs_R010_ueqv_R010NYN_partial_26_0142,
  rs_R010_ueqv_R010NYN_partial_26_0143,
  rs_R010_ueqv_R010NYN_partial_26_0144,
  rs_R010_ueqv_R010NYN_partial_26_0145,
  rs_R010_ueqv_R010NYN_partial_26_0146,
  rs_R010_ueqv_R010NYN_partial_26_0147
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_26_0100_0147 : Poly :=
[
  term ((84288 : Rat) / 599) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-9695232 : Rat) / 2995) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((2136 : Rat) / 5) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-42144 : Rat) / 599) [(7, 1), (8, 2), (15, 1)],
  term ((4847616 : Rat) / 2995) [(7, 1), (8, 2), (15, 3)],
  term ((-1068 : Rat) / 5) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((84288 : Rat) / 599) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-9695232 : Rat) / 2995) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((2136 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-42144 : Rat) / 599) [(7, 1), (9, 2), (15, 1)],
  term ((4847616 : Rat) / 2995) [(7, 1), (9, 2), (15, 3)],
  term ((-1068 : Rat) / 5) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-589248 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((247680 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-495360 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((288 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3140352 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-264 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2249856 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-642816 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((1285632 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((5448 : Rat) / 599) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-262656 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-32 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((482544 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((525312 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((64 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((2724 : Rat) / 599) [(8, 1), (9, 1), (13, 1)],
  term ((-16916736 : Rat) / 2995) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((3848 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2602368 : Rat) / 2995) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-524 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1362 : Rat) / 599) [(8, 1), (9, 2)],
  term ((1124928 : Rat) / 2995) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-1570176 : Rat) / 599) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((132 : Rat) / 5) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(8, 1), (9, 2), (11, 2)],
  term ((-1301184 : Rat) / 2995) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((262 : Rat) / 5) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((8458368 : Rat) / 2995) [(8, 1), (9, 2), (15, 2)],
  term ((-1924 : Rat) / 5) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1928448 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1285632 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2090304 : Rat) / 2995) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-412 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1423296 : Rat) / 2995) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((308 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1035648 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-567744 : Rat) / 599) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term (160 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12674208 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((768 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6856512 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-1336 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((2624832 : Rat) / 2995) [(8, 1), (11, 2), (12, 1)],
  term ((535680 : Rat) / 599) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-17255808 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((3792 : Rat) / 5) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((11570688 : Rat) / 2995) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1049744 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((182 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10406536 : Rat) / 2995) [(8, 1), (12, 1), (15, 2)],
  term ((-2358 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((294624 : Rat) / 2995) [(8, 2), (9, 1), (11, 1)],
  term ((-123840 : Rat) / 599) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((72 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((247680 : Rat) / 599) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((321408 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((-642816 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2724 : Rat) / 599) [(8, 2), (9, 1), (13, 1)],
  term ((131328 : Rat) / 2995) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-241272 : Rat) / 2995) [(8, 2), (9, 1), (15, 1)],
  term ((81 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-262656 : Rat) / 2995) [(8, 2), (9, 1), (15, 3)],
  term ((-32 : Rat) / 5) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((964224 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-642816 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((206 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((711648 : Rat) / 2995) [(8, 2), (10, 1), (15, 2)],
  term ((-154 : Rat) / 5) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2249856 : Rat) / 2995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((3140352 : Rat) / 599) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-264 : Rat) / 5) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-517824 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)],
  term ((283872 : Rat) / 599) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term (-80 : Rat) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6337104 : Rat) / 2995) [(8, 2), (11, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3428256 : Rat) / 2995) [(8, 2), (11, 1), (15, 3)],
  term ((668 : Rat) / 5) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1312416 : Rat) / 2995) [(8, 2), (11, 2)],
  term ((-642816 : Rat) / 2995) [(8, 2), (11, 2), (12, 1)],
  term ((-267840 : Rat) / 599) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((8627904 : Rat) / 2995) [(8, 2), (11, 2), (15, 2)],
  term ((-1896 : Rat) / 5) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(8, 2), (11, 3), (15, 1)],
  term ((2724 : Rat) / 599) [(8, 2), (12, 1)],
  term ((2602368 : Rat) / 2995) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-524 : Rat) / 5) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16916736 : Rat) / 2995) [(8, 2), (12, 1), (15, 2)],
  term ((3848 : Rat) / 5) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((524872 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)],
  term ((-91 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5203268 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((1179 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((-1362 : Rat) / 599) [(8, 3)],
  term ((1124928 : Rat) / 2995) [(8, 3), (11, 1), (13, 1)],
  term ((-1570176 : Rat) / 599) [(8, 3), (11, 1), (15, 1)],
  term ((132 : Rat) / 5) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(8, 3), (11, 2)],
  term ((-1301184 : Rat) / 2995) [(8, 3), (13, 1), (15, 1)],
  term ((262 : Rat) / 5) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((8458368 : Rat) / 2995) [(8, 3), (15, 2)],
  term ((-1924 : Rat) / 5) [(8, 3), (15, 2), (16, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1928448 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-1423296 : Rat) / 2995) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((308 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2090304 : Rat) / 2995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-412 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12674208 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((768 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856512 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1336 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1035648 : Rat) / 2995) [(9, 1), (11, 1), (13, 2)],
  term ((-567744 : Rat) / 599) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term (160 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2624832 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)],
  term ((-17255808 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((3792 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((535680 : Rat) / 599) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((11570688 : Rat) / 2995) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((10406536 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)],
  term ((-2358 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1049744 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)],
  term ((182 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((964224 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((206 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((711648 : Rat) / 2995) [(9, 2), (10, 1), (15, 2)],
  term ((-154 : Rat) / 5) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1107072 : Rat) / 2995) [(9, 2), (11, 1), (13, 1)],
  term ((-211488 : Rat) / 599) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-112 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6337104 : Rat) / 2995) [(9, 2), (11, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3428256 : Rat) / 2995) [(9, 2), (11, 1), (15, 3)],
  term ((668 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1312416 : Rat) / 2995) [(9, 2), (11, 2)],
  term ((-53568 : Rat) / 2995) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (13, 2)],
  term ((8627904 : Rat) / 2995) [(9, 2), (11, 2), (15, 2)],
  term ((-1896 : Rat) / 5) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(9, 2), (11, 3), (15, 1)],
  term ((1007416 : Rat) / 2995) [(9, 2), (13, 1), (15, 1)],
  term ((-253 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((525312 : Rat) / 2995) [(9, 2), (13, 1), (15, 3)],
  term ((64 : Rat) / 5) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((5448 : Rat) / 599) [(9, 2), (13, 2)],
  term ((-262656 : Rat) / 2995) [(9, 2), (13, 2), (15, 2)],
  term ((-32 : Rat) / 5) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5203268 : Rat) / 2995) [(9, 2), (15, 2)],
  term ((1179 : Rat) / 5) [(9, 2), (15, 2), (16, 1)],
  term ((294624 : Rat) / 2995) [(9, 3), (11, 1)],
  term ((-123840 : Rat) / 599) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((72 : Rat) / 5) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((247680 : Rat) / 599) [(9, 3), (11, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((321408 : Rat) / 2995) [(9, 3), (11, 2), (13, 1)],
  term ((-642816 : Rat) / 2995) [(9, 3), (11, 2), (15, 1)],
  term ((-2724 : Rat) / 599) [(9, 3), (13, 1)],
  term ((131328 : Rat) / 2995) [(9, 3), (13, 1), (15, 2)],
  term ((16 : Rat) / 5) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-241272 : Rat) / 2995) [(9, 3), (15, 1)],
  term ((81 : Rat) / 5) [(9, 3), (15, 1), (16, 1)],
  term ((-262656 : Rat) / 2995) [(9, 3), (15, 3)],
  term ((-32 : Rat) / 5) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 100 through 147. -/
theorem rs_R010_ueqv_R010NYN_block_26_0100_0147_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_26_0100_0147
      rs_R010_ueqv_R010NYN_block_26_0100_0147 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
