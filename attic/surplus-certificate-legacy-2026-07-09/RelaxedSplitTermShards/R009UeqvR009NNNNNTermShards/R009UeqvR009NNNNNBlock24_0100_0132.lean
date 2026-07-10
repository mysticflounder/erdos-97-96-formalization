/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 24:100-132

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0100 : Poly :=
[
  term ((-421007 : Rat) / 7068) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0100 : Poly :=
[
  term ((421007 : Rat) / 3534) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-421007 : Rat) / 7068) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((421007 : Rat) / 3534) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-421007 : Rat) / 7068) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-421007 : Rat) / 3534) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((421007 : Rat) / 7068) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((421007 : Rat) / 7068) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-421007 : Rat) / 3534) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0100
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0101 : Poly :=
[
  term ((3948 : Rat) / 589) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0101 : Poly :=
[
  term ((-7896 : Rat) / 589) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((3948 : Rat) / 589) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-7896 : Rat) / 589) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((3948 : Rat) / 589) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3948 : Rat) / 589) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((7896 : Rat) / 589) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0101
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0102 : Poly :=
[
  term ((456 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0102 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0102
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0103 : Poly :=
[
  term ((106063 : Rat) / 1767) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0103 : Poly :=
[
  term ((-212126 : Rat) / 1767) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((106063 : Rat) / 1767) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-212126 : Rat) / 1767) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((106063 : Rat) / 1767) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((212126 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((212126 : Rat) / 1767) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-106063 : Rat) / 1767) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-106063 : Rat) / 1767) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0103
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0104 : Poly :=
[
  term ((19 : Rat) / 2) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0104 : Poly :=
[
  term (-19 : Rat) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((19 : Rat) / 2) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term (-19 : Rat) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((19 : Rat) / 2) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term (19 : Rat) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term (19 : Rat) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0104
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0105 : Poly :=
[
  term ((71333 : Rat) / 2356) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0105 : Poly :=
[
  term ((-71333 : Rat) / 1178) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((71333 : Rat) / 2356) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-71333 : Rat) / 1178) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((71333 : Rat) / 2356) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((71333 : Rat) / 1178) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((71333 : Rat) / 1178) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-71333 : Rat) / 2356) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-71333 : Rat) / 2356) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0105
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0106 : Poly :=
[
  term ((18400 : Rat) / 1767) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 106 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0106 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 2), (8, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0106
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0107 : Poly :=
[
  term ((114 : Rat) / 31) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0107 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0107
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0108 : Poly :=
[
  term ((41029 : Rat) / 1767) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0108 : Poly :=
[
  term ((-82058 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0108
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0109 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 109 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0109 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0109
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0110 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 110 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0110 : Poly :=
[
  term ((73600 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-73600 : Rat) / 1767) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0110
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0111 : Poly :=
[
  term ((18400 : Rat) / 1767) [(8, 1), (16, 1)]
]

/-- Partial product 111 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0111 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 2), (8, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (8, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (14, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0111
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0112 : Poly :=
[
  term ((456 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0112 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((912 : Rat) / 31) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0112
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0113 : Poly :=
[
  term ((113740 : Rat) / 1767) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0113 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((227480 : Rat) / 1767) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((227480 : Rat) / 1767) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0113
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0114 : Poly :=
[
  term ((-7977 : Rat) / 1178) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0114 : Poly :=
[
  term ((7977 : Rat) / 589) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7977 : Rat) / 1178) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7977 : Rat) / 589) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7977 : Rat) / 1178) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7977 : Rat) / 589) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7977 : Rat) / 1178) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7977 : Rat) / 1178) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7977 : Rat) / 589) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0114
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0115 : Poly :=
[
  term ((36800 : Rat) / 1767) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 115 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0115 : Poly :=
[
  term ((-73600 : Rat) / 1767) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 1), (14, 3), (16, 1)],
  term ((73600 : Rat) / 1767) [(10, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0115
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0116 : Poly :=
[
  term ((-218809 : Rat) / 7068) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0116 : Poly :=
[
  term ((218809 : Rat) / 3534) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-218809 : Rat) / 7068) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((218809 : Rat) / 3534) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-218809 : Rat) / 7068) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-218809 : Rat) / 3534) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((218809 : Rat) / 7068) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((218809 : Rat) / 7068) [(10, 1), (15, 4), (16, 1)],
  term ((-218809 : Rat) / 3534) [(10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0116
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0117 : Poly :=
[
  term ((-13960 : Rat) / 589) [(10, 1), (16, 1)]
]

/-- Partial product 117 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0117 : Poly :=
[
  term ((27920 : Rat) / 589) [(0, 1), (10, 2), (16, 1)],
  term ((-13960 : Rat) / 589) [(0, 2), (10, 1), (16, 1)],
  term ((27920 : Rat) / 589) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13960 : Rat) / 589) [(1, 2), (10, 1), (16, 1)],
  term ((-27920 : Rat) / 589) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((13960 : Rat) / 589) [(10, 1), (14, 2), (16, 1)],
  term ((13960 : Rat) / 589) [(10, 1), (15, 2), (16, 1)],
  term ((-27920 : Rat) / 589) [(10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0117
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0118 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(10, 2), (16, 1)]
]

/-- Partial product 118 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0118 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (10, 3), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (10, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (10, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(10, 2), (14, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(10, 2), (15, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0118
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0119 : Poly :=
[
  term ((3412 : Rat) / 589) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0119 : Poly :=
[
  term ((-6824 : Rat) / 589) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3412 : Rat) / 589) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3412 : Rat) / 589) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6824 : Rat) / 589) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3412 : Rat) / 589) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((6824 : Rat) / 589) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0119
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0120 : Poly :=
[
  term ((-570 : Rat) / 31) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0120 : Poly :=
[
  term ((1140 : Rat) / 31) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((570 : Rat) / 31) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((570 : Rat) / 31) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1140 : Rat) / 31) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0120
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0121 : Poly :=
[
  term ((-56401 : Rat) / 589) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0121 : Poly :=
[
  term ((112802 : Rat) / 589) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56401 : Rat) / 589) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((112802 : Rat) / 589) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-56401 : Rat) / 589) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-112802 : Rat) / 589) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((56401 : Rat) / 589) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((56401 : Rat) / 589) [(11, 1), (15, 3), (16, 1)],
  term ((-112802 : Rat) / 589) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0121
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0122 : Poly :=
[
  term ((-13496 : Rat) / 1767) [(11, 2), (16, 1)]
]

/-- Partial product 122 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0122 : Poly :=
[
  term ((26992 : Rat) / 1767) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-13496 : Rat) / 1767) [(0, 2), (11, 2), (16, 1)],
  term ((26992 : Rat) / 1767) [(1, 1), (11, 3), (16, 1)],
  term ((-13496 : Rat) / 1767) [(1, 2), (11, 2), (16, 1)],
  term ((-26992 : Rat) / 1767) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((13496 : Rat) / 1767) [(11, 2), (14, 2), (16, 1)],
  term ((13496 : Rat) / 1767) [(11, 2), (15, 2), (16, 1)],
  term ((-26992 : Rat) / 1767) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0122
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0123 : Poly :=
[
  term ((-342 : Rat) / 31) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0123 : Poly :=
[
  term ((684 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((342 : Rat) / 31) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0123
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0124 : Poly :=
[
  term ((-79151 : Rat) / 1767) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0124 : Poly :=
[
  term ((158302 : Rat) / 1767) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-79151 : Rat) / 1767) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((158302 : Rat) / 1767) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-79151 : Rat) / 1767) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-158302 : Rat) / 1767) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-158302 : Rat) / 1767) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((79151 : Rat) / 1767) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((79151 : Rat) / 1767) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0124
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0125 : Poly :=
[
  term ((-14152 : Rat) / 589) [(12, 1), (16, 1)]
]

/-- Partial product 125 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0125 : Poly :=
[
  term ((28304 : Rat) / 589) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-14152 : Rat) / 589) [(0, 2), (12, 1), (16, 1)],
  term ((28304 : Rat) / 589) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-14152 : Rat) / 589) [(1, 2), (12, 1), (16, 1)],
  term ((-28304 : Rat) / 589) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-28304 : Rat) / 589) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((14152 : Rat) / 589) [(12, 1), (14, 2), (16, 1)],
  term ((14152 : Rat) / 589) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0125
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0126 : Poly :=
[
  term ((18400 : Rat) / 1767) [(12, 2), (16, 1)]
]

/-- Partial product 126 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0126 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 2), (12, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (12, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(12, 2), (14, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0126
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0127 : Poly :=
[
  term ((-98375 : Rat) / 3534) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0127 : Poly :=
[
  term ((98375 : Rat) / 1767) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98375 : Rat) / 3534) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((98375 : Rat) / 1767) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98375 : Rat) / 3534) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98375 : Rat) / 1767) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98375 : Rat) / 1767) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((98375 : Rat) / 3534) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98375 : Rat) / 3534) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0127
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0128 : Poly :=
[
  term ((20555 : Rat) / 1767) [(13, 2), (16, 1)]
]

/-- Partial product 128 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0128 : Poly :=
[
  term ((-41110 : Rat) / 1767) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((20555 : Rat) / 1767) [(0, 2), (13, 2), (16, 1)],
  term ((-41110 : Rat) / 1767) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((20555 : Rat) / 1767) [(1, 2), (13, 2), (16, 1)],
  term ((41110 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((41110 : Rat) / 1767) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20555 : Rat) / 1767) [(13, 2), (14, 2), (16, 1)],
  term ((-20555 : Rat) / 1767) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0128
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0129 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0129 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((18400 : Rat) / 1767) [(14, 1), (15, 4), (16, 1)],
  term ((18400 : Rat) / 1767) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0129_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0129
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0130 : Poly :=
[
  term ((904 : Rat) / 93) [(14, 1), (16, 1)]
]

/-- Partial product 130 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0130 : Poly :=
[
  term ((-1808 : Rat) / 93) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((904 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((-1808 : Rat) / 93) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((904 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((1808 : Rat) / 93) [(10, 1), (14, 2), (16, 1)],
  term ((1808 : Rat) / 93) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(14, 1), (15, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0130_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0130
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0131 : Poly :=
[
  term ((611213 : Rat) / 7068) [(15, 2), (16, 1)]
]

/-- Partial product 131 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0131 : Poly :=
[
  term ((-611213 : Rat) / 3534) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((611213 : Rat) / 7068) [(0, 2), (15, 2), (16, 1)],
  term ((-611213 : Rat) / 3534) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((611213 : Rat) / 7068) [(1, 2), (15, 2), (16, 1)],
  term ((611213 : Rat) / 3534) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((611213 : Rat) / 3534) [(11, 1), (15, 3), (16, 1)],
  term ((-611213 : Rat) / 7068) [(14, 2), (15, 2), (16, 1)],
  term ((-611213 : Rat) / 7068) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0131_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0131
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNN_coefficient_24_0132 : Poly :=
[
  term ((17272 : Rat) / 1767) [(16, 1)]
]

/-- Partial product 132 for generator 24. -/
def rs_R009_ueqv_R009NNNNN_partial_24_0132 : Poly :=
[
  term ((-34544 : Rat) / 1767) [(0, 1), (10, 1), (16, 1)],
  term ((17272 : Rat) / 1767) [(0, 2), (16, 1)],
  term ((-34544 : Rat) / 1767) [(1, 1), (11, 1), (16, 1)],
  term ((17272 : Rat) / 1767) [(1, 2), (16, 1)],
  term ((34544 : Rat) / 1767) [(10, 1), (14, 1), (16, 1)],
  term ((34544 : Rat) / 1767) [(11, 1), (15, 1), (16, 1)],
  term ((-17272 : Rat) / 1767) [(14, 2), (16, 1)],
  term ((-17272 : Rat) / 1767) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNN_partial_24_0132_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_24_0132
        rs_R009_ueqv_R009NNNNN_generator_24_0100_0132 =
      rs_R009_ueqv_R009NNNNN_partial_24_0132 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_24_0100_0132 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_24_0100,
  rs_R009_ueqv_R009NNNNN_partial_24_0101,
  rs_R009_ueqv_R009NNNNN_partial_24_0102,
  rs_R009_ueqv_R009NNNNN_partial_24_0103,
  rs_R009_ueqv_R009NNNNN_partial_24_0104,
  rs_R009_ueqv_R009NNNNN_partial_24_0105,
  rs_R009_ueqv_R009NNNNN_partial_24_0106,
  rs_R009_ueqv_R009NNNNN_partial_24_0107,
  rs_R009_ueqv_R009NNNNN_partial_24_0108,
  rs_R009_ueqv_R009NNNNN_partial_24_0109,
  rs_R009_ueqv_R009NNNNN_partial_24_0110,
  rs_R009_ueqv_R009NNNNN_partial_24_0111,
  rs_R009_ueqv_R009NNNNN_partial_24_0112,
  rs_R009_ueqv_R009NNNNN_partial_24_0113,
  rs_R009_ueqv_R009NNNNN_partial_24_0114,
  rs_R009_ueqv_R009NNNNN_partial_24_0115,
  rs_R009_ueqv_R009NNNNN_partial_24_0116,
  rs_R009_ueqv_R009NNNNN_partial_24_0117,
  rs_R009_ueqv_R009NNNNN_partial_24_0118,
  rs_R009_ueqv_R009NNNNN_partial_24_0119,
  rs_R009_ueqv_R009NNNNN_partial_24_0120,
  rs_R009_ueqv_R009NNNNN_partial_24_0121,
  rs_R009_ueqv_R009NNNNN_partial_24_0122,
  rs_R009_ueqv_R009NNNNN_partial_24_0123,
  rs_R009_ueqv_R009NNNNN_partial_24_0124,
  rs_R009_ueqv_R009NNNNN_partial_24_0125,
  rs_R009_ueqv_R009NNNNN_partial_24_0126,
  rs_R009_ueqv_R009NNNNN_partial_24_0127,
  rs_R009_ueqv_R009NNNNN_partial_24_0128,
  rs_R009_ueqv_R009NNNNN_partial_24_0129,
  rs_R009_ueqv_R009NNNNN_partial_24_0130,
  rs_R009_ueqv_R009NNNNN_partial_24_0131,
  rs_R009_ueqv_R009NNNNN_partial_24_0132
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_24_0100_0132 : Poly :=
[
  term ((-7896 : Rat) / 589) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-212126 : Rat) / 1767) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-19 : Rat) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-71333 : Rat) / 1178) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((421007 : Rat) / 3534) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((-6824 : Rat) / 589) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((112802 : Rat) / 589) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((26992 : Rat) / 1767) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((684 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((158302 : Rat) / 1767) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((28304 : Rat) / 589) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((98375 : Rat) / 1767) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41110 : Rat) / 1767) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1808 : Rat) / 93) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-611213 : Rat) / 3534) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-34544 : Rat) / 1767) [(0, 1), (10, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((7977 : Rat) / 589) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((218809 : Rat) / 3534) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((27920 : Rat) / 589) [(0, 1), (10, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 1), (10, 3), (16, 1)],
  term ((-421007 : Rat) / 7068) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3948 : Rat) / 589) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((106063 : Rat) / 1767) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 2) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((71333 : Rat) / 2356) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 2), (8, 1), (10, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 2), (8, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7977 : Rat) / 1178) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-218809 : Rat) / 7068) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13960 : Rat) / 589) [(0, 2), (10, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (10, 2), (16, 1)],
  term ((3412 : Rat) / 589) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-56401 : Rat) / 589) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13496 : Rat) / 1767) [(0, 2), (11, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79151 : Rat) / 1767) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-14152 : Rat) / 589) [(0, 2), (12, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(0, 2), (12, 2), (16, 1)],
  term ((-98375 : Rat) / 3534) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((20555 : Rat) / 1767) [(0, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((904 : Rat) / 93) [(0, 2), (14, 1), (16, 1)],
  term ((611213 : Rat) / 7068) [(0, 2), (15, 2), (16, 1)],
  term ((17272 : Rat) / 1767) [(0, 2), (16, 1)],
  term ((421007 : Rat) / 3534) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-212126 : Rat) / 1767) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-19 : Rat) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-71333 : Rat) / 1178) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7896 : Rat) / 589) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((73600 : Rat) / 1767) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((7977 : Rat) / 589) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73600 : Rat) / 1767) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((218809 : Rat) / 3534) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((27920 : Rat) / 589) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((684 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((158302 : Rat) / 1767) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((28304 : Rat) / 589) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((98375 : Rat) / 1767) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41110 : Rat) / 1767) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1808 : Rat) / 93) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-611213 : Rat) / 3534) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-34544 : Rat) / 1767) [(1, 1), (11, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((112802 : Rat) / 589) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((26992 : Rat) / 1767) [(1, 1), (11, 3), (16, 1)],
  term ((-421007 : Rat) / 7068) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3948 : Rat) / 589) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((106063 : Rat) / 1767) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 2) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((71333 : Rat) / 2356) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (8, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7977 : Rat) / 1178) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-218809 : Rat) / 7068) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13960 : Rat) / 589) [(1, 2), (10, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (10, 2), (16, 1)],
  term ((3412 : Rat) / 589) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-56401 : Rat) / 589) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13496 : Rat) / 1767) [(1, 2), (11, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79151 : Rat) / 1767) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-14152 : Rat) / 589) [(1, 2), (12, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 2), (12, 2), (16, 1)],
  term ((-98375 : Rat) / 3534) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((20555 : Rat) / 1767) [(1, 2), (13, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((904 : Rat) / 93) [(1, 2), (14, 1), (16, 1)],
  term ((611213 : Rat) / 7068) [(1, 2), (15, 2), (16, 1)],
  term ((17272 : Rat) / 1767) [(1, 2), (16, 1)],
  term ((7896 : Rat) / 589) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-421007 : Rat) / 3534) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((912 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((212126 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (19 : Rat) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((71333 : Rat) / 1178) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((421007 : Rat) / 7068) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((421007 : Rat) / 7068) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-421007 : Rat) / 3534) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((212126 : Rat) / 1767) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (19 : Rat) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((63437 : Rat) / 1178) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((7896 : Rat) / 589) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-106063 : Rat) / 1767) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-106063 : Rat) / 1767) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19 : Rat) / 2) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-71333 : Rat) / 2356) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-71333 : Rat) / 2356) [(7, 1), (15, 3), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-92000 : Rat) / 1767) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-73600 : Rat) / 1767) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (14, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(8, 1), (14, 3), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (15, 2), (16, 1)],
  term ((6824 : Rat) / 589) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16641 : Rat) / 589) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-264806 : Rat) / 1767) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27920 : Rat) / 589) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-148763 : Rat) / 1178) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((912 : Rat) / 31) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26992 : Rat) / 1767) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-158302 : Rat) / 1767) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28304 : Rat) / 589) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-98375 : Rat) / 1767) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7977 : Rat) / 1178) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7977 : Rat) / 1178) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((41110 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((537613 : Rat) / 3534) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((34544 : Rat) / 1767) [(10, 1), (14, 1), (16, 1)],
  term ((71609 : Rat) / 7068) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((76232 : Rat) / 1767) [(10, 1), (14, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 1), (14, 3), (16, 1)],
  term ((13960 : Rat) / 589) [(10, 1), (15, 2), (16, 1)],
  term ((218809 : Rat) / 7068) [(10, 1), (15, 4), (16, 1)],
  term ((912 : Rat) / 31) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7977 : Rat) / 589) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-218809 : Rat) / 3534) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-27920 : Rat) / 589) [(10, 2), (14, 1), (16, 1)],
  term ((92000 : Rat) / 1767) [(10, 2), (14, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(10, 2), (15, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(10, 3), (14, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3412 : Rat) / 589) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28304 : Rat) / 589) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-168538 : Rat) / 1767) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((36800 : Rat) / 1767) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((570 : Rat) / 31) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-65885 : Rat) / 1767) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((41110 : Rat) / 1767) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1808 : Rat) / 93) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((56401 : Rat) / 589) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((34544 : Rat) / 1767) [(11, 1), (15, 1), (16, 1)],
  term ((949619 : Rat) / 3534) [(11, 1), (15, 3), (16, 1)],
  term ((6824 : Rat) / 589) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1140 : Rat) / 31) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((13496 : Rat) / 1767) [(11, 2), (14, 2), (16, 1)],
  term ((-324910 : Rat) / 1767) [(11, 2), (15, 2), (16, 1)],
  term ((-26992 : Rat) / 1767) [(11, 3), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((79151 : Rat) / 1767) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((14152 : Rat) / 589) [(12, 1), (14, 2), (16, 1)],
  term ((14152 : Rat) / 589) [(12, 1), (15, 2), (16, 1)],
  term ((79151 : Rat) / 1767) [(12, 1), (15, 4), (16, 1)],
  term ((-18400 : Rat) / 1767) [(12, 2), (14, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(12, 2), (15, 2), (16, 1)],
  term ((98375 : Rat) / 3534) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98375 : Rat) / 3534) [(13, 1), (15, 3), (16, 1)],
  term ((-20555 : Rat) / 1767) [(13, 2), (14, 2), (16, 1)],
  term ((-20555 : Rat) / 1767) [(13, 2), (15, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(14, 1), (15, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(14, 1), (15, 4), (16, 1)],
  term ((-611213 : Rat) / 7068) [(14, 2), (15, 2), (16, 1)],
  term ((-17272 : Rat) / 1767) [(14, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(14, 3), (15, 2), (16, 1)],
  term ((-904 : Rat) / 93) [(14, 3), (16, 1)],
  term ((-17272 : Rat) / 1767) [(15, 2), (16, 1)],
  term ((-611213 : Rat) / 7068) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 100 through 132. -/
theorem rs_R009_ueqv_R009NNNNN_block_24_0100_0132_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_24_0100_0132
      rs_R009_ueqv_R009NNNNN_block_24_0100_0132 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
