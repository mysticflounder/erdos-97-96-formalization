/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 2:100-190

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0100 : Poly :=
[
  term ((2 : Rat) / 3) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 100 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0100 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((2 : Rat) / 3) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-2 : Rat) / 3) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((-2 : Rat) / 3) [(3, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0100_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0100
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0101 : Poly :=
[
  term (-12 : Rat) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 101 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0101 : Poly :=
[
  term (-12 : Rat) [(0, 2), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (12 : Rat) [(3, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term (12 : Rat) [(3, 1), (9, 1), (10, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0101_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0101
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0102 : Poly :=
[
  term (15 : Rat) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 102 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0102 : Poly :=
[
  term (15 : Rat) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term (15 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term (-15 : Rat) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term (-15 : Rat) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0102_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0102
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0103 : Poly :=
[
  term ((20 : Rat) / 3) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 103 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0103 : Poly :=
[
  term ((20 : Rat) / 3) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((20 : Rat) / 3) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-20 : Rat) / 3) [(3, 1), (10, 1), (11, 3)],
  term ((-20 : Rat) / 3) [(3, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0103_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0103
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0104 : Poly :=
[
  term (-24 : Rat) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 104 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0104 : Poly :=
[
  term (-24 : Rat) [(0, 2), (3, 1), (10, 1), (11, 1), (14, 1)],
  term (-24 : Rat) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (11, 3), (14, 1)],
  term (24 : Rat) [(3, 1), (10, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0104_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0104
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0105 : Poly :=
[
  term ((-32 : Rat) / 3) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 105 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0105 : Poly :=
[
  term ((-32 : Rat) / 3) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((32 : Rat) / 3) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((32 : Rat) / 3) [(3, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0105_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0105
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0106 : Poly :=
[
  term (48 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 106 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0106 : Poly :=
[
  term (48 : Rat) [(0, 2), (3, 1), (10, 1), (13, 1), (14, 1)],
  term (48 : Rat) [(1, 2), (3, 1), (10, 1), (13, 1), (14, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term (-48 : Rat) [(3, 1), (10, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0106_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0106
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0107 : Poly :=
[
  term ((40 : Rat) / 3) [(3, 1), (10, 2), (13, 1)]
]

/-- Partial product 107 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0107 : Poly :=
[
  term ((40 : Rat) / 3) [(0, 2), (3, 1), (10, 2), (13, 1)],
  term ((40 : Rat) / 3) [(1, 2), (3, 1), (10, 2), (13, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (10, 2), (11, 2), (13, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (10, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0107_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0107
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0108 : Poly :=
[
  term (-48 : Rat) [(3, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 108 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0108 : Poly :=
[
  term (-48 : Rat) [(0, 2), (3, 1), (10, 2), (13, 1), (14, 1)],
  term (-48 : Rat) [(1, 2), (3, 1), (10, 2), (13, 1), (14, 1)],
  term (48 : Rat) [(3, 1), (10, 2), (11, 2), (13, 1), (14, 1)],
  term (48 : Rat) [(3, 1), (10, 4), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0108_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0108
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0109 : Poly :=
[
  term ((-5 : Rat) / 3) [(3, 1), (11, 1)]
]

/-- Partial product 109 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0109 : Poly :=
[
  term ((-5 : Rat) / 3) [(0, 2), (3, 1), (11, 1)],
  term ((-5 : Rat) / 3) [(1, 2), (3, 1), (11, 1)],
  term ((5 : Rat) / 3) [(3, 1), (10, 2), (11, 1)],
  term ((5 : Rat) / 3) [(3, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0109_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0109
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0110 : Poly :=
[
  term (6 : Rat) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 110 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0110 : Poly :=
[
  term (6 : Rat) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term (-6 : Rat) [(3, 1), (10, 2), (11, 1), (14, 1)],
  term (-6 : Rat) [(3, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0110_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0110
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0111 : Poly :=
[
  term ((-4 : Rat) / 3) [(3, 1), (13, 1)]
]

/-- Partial product 111 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0111 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 2), (3, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (3, 1), (13, 1)],
  term ((4 : Rat) / 3) [(3, 1), (10, 2), (13, 1)],
  term ((4 : Rat) / 3) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0111_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0111
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0112 : Poly :=
[
  term (-10 : Rat) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 112 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0112 : Poly :=
[
  term (-10 : Rat) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term (-10 : Rat) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term (10 : Rat) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term (10 : Rat) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0112_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0112
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0113 : Poly :=
[
  term ((3 : Rat) / 2) [(3, 1), (15, 1)]
]

/-- Partial product 113 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0113 : Poly :=
[
  term ((3 : Rat) / 2) [(0, 2), (3, 1), (15, 1)],
  term ((3 : Rat) / 2) [(1, 2), (3, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (10, 2), (15, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0113_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0113
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0114 : Poly :=
[
  term (-96 : Rat) [(4, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 114 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0114 : Poly :=
[
  term (-96 : Rat) [(0, 2), (4, 1), (9, 1), (10, 1), (11, 1)],
  term (-96 : Rat) [(1, 2), (4, 1), (9, 1), (10, 1), (11, 1)],
  term (96 : Rat) [(4, 1), (9, 1), (10, 1), (11, 3)],
  term (96 : Rat) [(4, 1), (9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0114_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0114
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0115 : Poly :=
[
  term (54 : Rat) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 115 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0115 : Poly :=
[
  term (54 : Rat) [(0, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term (54 : Rat) [(1, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term (-54 : Rat) [(4, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term (-54 : Rat) [(4, 1), (9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0115_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0115
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0116 : Poly :=
[
  term (80 : Rat) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 116 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0116 : Poly :=
[
  term (80 : Rat) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0116_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0116
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0117 : Poly :=
[
  term ((-215 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 117 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0117 : Poly :=
[
  term ((-215 : Rat) / 3) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-215 : Rat) / 3) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((215 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((215 : Rat) / 3) [(4, 1), (9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0117_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0117
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0118 : Poly :=
[
  term ((21 : Rat) / 2) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0118 : Poly :=
[
  term ((21 : Rat) / 2) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((21 : Rat) / 2) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21 : Rat) / 2) [(4, 1), (9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0118_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0118
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0119 : Poly :=
[
  term (18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1)]
]

/-- Partial product 119 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0119 : Poly :=
[
  term (18 : Rat) [(0, 2), (4, 1), (9, 1), (10, 2), (11, 1)],
  term (18 : Rat) [(1, 2), (4, 1), (9, 1), (10, 2), (11, 1)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 3)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 4), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0119_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0119
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0120 : Poly :=
[
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (13, 1)]
]

/-- Partial product 120 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0120 : Poly :=
[
  term (-12 : Rat) [(0, 2), (4, 1), (9, 1), (10, 2), (13, 1)],
  term (-12 : Rat) [(1, 2), (4, 1), (9, 1), (10, 2), (13, 1)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (11, 2), (13, 1)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0120_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0120
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0121 : Poly :=
[
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (15, 1)]
]

/-- Partial product 121 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0121 : Poly :=
[
  term (12 : Rat) [(0, 2), (4, 1), (9, 1), (10, 2), (15, 1)],
  term (12 : Rat) [(1, 2), (4, 1), (9, 1), (10, 2), (15, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0121_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0121
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0122 : Poly :=
[
  term (55 : Rat) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 122 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0122 : Poly :=
[
  term (55 : Rat) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term (55 : Rat) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term (-55 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1)],
  term (-55 : Rat) [(4, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0122_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0122
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0123 : Poly :=
[
  term ((-68 : Rat) / 3) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 123 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0123 : Poly :=
[
  term ((-68 : Rat) / 3) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-68 : Rat) / 3) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((68 : Rat) / 3) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((68 : Rat) / 3) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0123_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0123
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0124 : Poly :=
[
  term ((-208 : Rat) / 3) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 124 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0124 : Poly :=
[
  term ((-208 : Rat) / 3) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-208 : Rat) / 3) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((208 : Rat) / 3) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((208 : Rat) / 3) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0124_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0124
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0125 : Poly :=
[
  term ((127 : Rat) / 2) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 125 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0125 : Poly :=
[
  term ((127 : Rat) / 2) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((127 : Rat) / 2) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-127 : Rat) / 2) [(4, 1), (9, 1), (10, 2), (15, 1)],
  term ((-127 : Rat) / 2) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0125_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0125
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0126 : Poly :=
[
  term (-15 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0126 : Poly :=
[
  term (-15 : Rat) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (15 : Rat) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0126_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0126
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0127 : Poly :=
[
  term (-48 : Rat) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 127 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0127 : Poly :=
[
  term (-48 : Rat) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term (-48 : Rat) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term (48 : Rat) [(5, 1), (10, 1), (11, 3)],
  term (48 : Rat) [(5, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0127_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0127
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0128 : Poly :=
[
  term (27 : Rat) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 128 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0128 : Poly :=
[
  term (27 : Rat) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term (27 : Rat) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term (-27 : Rat) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term (-27 : Rat) [(5, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0128_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0128
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0129 : Poly :=
[
  term (40 : Rat) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 129 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0129 : Poly :=
[
  term (40 : Rat) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term (40 : Rat) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term (-40 : Rat) [(5, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0129_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0129
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0130 : Poly :=
[
  term ((-215 : Rat) / 6) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 130 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0130 : Poly :=
[
  term ((-215 : Rat) / 6) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-215 : Rat) / 6) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((215 : Rat) / 6) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((215 : Rat) / 6) [(5, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0130_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0130
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0131 : Poly :=
[
  term ((21 : Rat) / 4) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0131 : Poly :=
[
  term ((21 : Rat) / 4) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((21 : Rat) / 4) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21 : Rat) / 4) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21 : Rat) / 4) [(5, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0131_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0131
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0132 : Poly :=
[
  term (9 : Rat) [(5, 1), (10, 2), (11, 1)]
]

/-- Partial product 132 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0132 : Poly :=
[
  term (9 : Rat) [(0, 2), (5, 1), (10, 2), (11, 1)],
  term (9 : Rat) [(1, 2), (5, 1), (10, 2), (11, 1)],
  term (-9 : Rat) [(5, 1), (10, 2), (11, 3)],
  term (-9 : Rat) [(5, 1), (10, 4), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0132_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0132
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0133 : Poly :=
[
  term (-6 : Rat) [(5, 1), (10, 2), (13, 1)]
]

/-- Partial product 133 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0133 : Poly :=
[
  term (-6 : Rat) [(0, 2), (5, 1), (10, 2), (13, 1)],
  term (-6 : Rat) [(1, 2), (5, 1), (10, 2), (13, 1)],
  term (6 : Rat) [(5, 1), (10, 2), (11, 2), (13, 1)],
  term (6 : Rat) [(5, 1), (10, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0133_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0133
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0134 : Poly :=
[
  term (6 : Rat) [(5, 1), (10, 2), (15, 1)]
]

/-- Partial product 134 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0134 : Poly :=
[
  term (6 : Rat) [(0, 2), (5, 1), (10, 2), (15, 1)],
  term (6 : Rat) [(1, 2), (5, 1), (10, 2), (15, 1)],
  term (-6 : Rat) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term (-6 : Rat) [(5, 1), (10, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0134_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0134
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0135 : Poly :=
[
  term ((55 : Rat) / 2) [(5, 1), (11, 1)]
]

/-- Partial product 135 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0135 : Poly :=
[
  term ((55 : Rat) / 2) [(0, 2), (5, 1), (11, 1)],
  term ((55 : Rat) / 2) [(1, 2), (5, 1), (11, 1)],
  term ((-55 : Rat) / 2) [(5, 1), (10, 2), (11, 1)],
  term ((-55 : Rat) / 2) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0135_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0135
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0136 : Poly :=
[
  term ((-34 : Rat) / 3) [(5, 1), (13, 1)]
]

/-- Partial product 136 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0136 : Poly :=
[
  term ((-34 : Rat) / 3) [(0, 2), (5, 1), (13, 1)],
  term ((-34 : Rat) / 3) [(1, 2), (5, 1), (13, 1)],
  term ((34 : Rat) / 3) [(5, 1), (10, 2), (13, 1)],
  term ((34 : Rat) / 3) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0136_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0136
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0137 : Poly :=
[
  term ((-104 : Rat) / 3) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 137 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0137 : Poly :=
[
  term ((-104 : Rat) / 3) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-104 : Rat) / 3) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((104 : Rat) / 3) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((104 : Rat) / 3) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0137_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0137
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0138 : Poly :=
[
  term ((127 : Rat) / 4) [(5, 1), (15, 1)]
]

/-- Partial product 138 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0138 : Poly :=
[
  term ((127 : Rat) / 4) [(0, 2), (5, 1), (15, 1)],
  term ((127 : Rat) / 4) [(1, 2), (5, 1), (15, 1)],
  term ((-127 : Rat) / 4) [(5, 1), (10, 2), (15, 1)],
  term ((-127 : Rat) / 4) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0138_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0138
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0139 : Poly :=
[
  term ((-15 : Rat) / 2) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0139 : Poly :=
[
  term ((-15 : Rat) / 2) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0139_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0139
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0140 : Poly :=
[
  term (-3 : Rat) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0140 : Poly :=
[
  term (-3 : Rat) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0140_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0140
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0141 : Poly :=
[
  term (-8 : Rat) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 141 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0141 : Poly :=
[
  term (-8 : Rat) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term (8 : Rat) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0141_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0141
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0142 : Poly :=
[
  term ((11 : Rat) / 2) [(7, 1), (15, 1)]
]

/-- Partial product 142 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0142 : Poly :=
[
  term ((11 : Rat) / 2) [(0, 2), (7, 1), (15, 1)],
  term ((11 : Rat) / 2) [(1, 2), (7, 1), (15, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (10, 2), (15, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0142_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0142
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0143 : Poly :=
[
  term ((19 : Rat) / 4) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0143 : Poly :=
[
  term ((19 : Rat) / 4) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 4) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0143_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0143
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0144 : Poly :=
[
  term ((105 : Rat) / 2) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 144 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0144 : Poly :=
[
  term ((105 : Rat) / 2) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((105 : Rat) / 2) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-105 : Rat) / 2) [(9, 1), (10, 1), (11, 3)],
  term ((-105 : Rat) / 2) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0144_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0144
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0145 : Poly :=
[
  term (-12 : Rat) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 145 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0145 : Poly :=
[
  term (-12 : Rat) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term (-12 : Rat) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term (12 : Rat) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term (12 : Rat) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0145_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0145
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0146 : Poly :=
[
  term (-40 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 146 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0146 : Poly :=
[
  term (-40 : Rat) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term (40 : Rat) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term (40 : Rat) [(9, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0146_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0146
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0147 : Poly :=
[
  term ((941 : Rat) / 12) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 147 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0147 : Poly :=
[
  term ((941 : Rat) / 12) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((941 : Rat) / 12) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-941 : Rat) / 12) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-941 : Rat) / 12) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0147_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0147
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0148 : Poly :=
[
  term ((-129 : Rat) / 8) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0148 : Poly :=
[
  term ((-129 : Rat) / 8) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-129 : Rat) / 8) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((129 : Rat) / 8) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((129 : Rat) / 8) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0148_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0148
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0149 : Poly :=
[
  term (-9 : Rat) [(9, 1), (10, 2), (11, 1)]
]

/-- Partial product 149 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0149 : Poly :=
[
  term (-9 : Rat) [(0, 2), (9, 1), (10, 2), (11, 1)],
  term (-9 : Rat) [(1, 2), (9, 1), (10, 2), (11, 1)],
  term (9 : Rat) [(9, 1), (10, 2), (11, 3)],
  term (9 : Rat) [(9, 1), (10, 4), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0149_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0149
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0150 : Poly :=
[
  term (3 : Rat) [(9, 1), (10, 2), (13, 1)]
]

/-- Partial product 150 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0150 : Poly :=
[
  term (3 : Rat) [(0, 2), (9, 1), (10, 2), (13, 1)],
  term (3 : Rat) [(1, 2), (9, 1), (10, 2), (13, 1)],
  term (-3 : Rat) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term (-3 : Rat) [(9, 1), (10, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0150_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0150
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0151 : Poly :=
[
  term (-21 : Rat) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 151 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0151 : Poly :=
[
  term (-21 : Rat) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term (-21 : Rat) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term (21 : Rat) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term (21 : Rat) [(9, 1), (10, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0151_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0151
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0152 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0152 : Poly :=
[
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0152_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0152
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0153 : Poly :=
[
  term ((-97 : Rat) / 2) [(9, 1), (11, 1)]
]

/-- Partial product 153 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0153 : Poly :=
[
  term ((-97 : Rat) / 2) [(0, 2), (9, 1), (11, 1)],
  term ((-97 : Rat) / 2) [(1, 2), (9, 1), (11, 1)],
  term ((97 : Rat) / 2) [(9, 1), (10, 2), (11, 1)],
  term ((97 : Rat) / 2) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0153_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0153
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0154 : Poly :=
[
  term ((19 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 154 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0154 : Poly :=
[
  term ((19 : Rat) / 3) [(0, 2), (9, 1), (13, 1)],
  term ((19 : Rat) / 3) [(1, 2), (9, 1), (13, 1)],
  term ((-19 : Rat) / 3) [(9, 1), (10, 2), (13, 1)],
  term ((-19 : Rat) / 3) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0154_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0154
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0155 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 155 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0155 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((4 : Rat) / 3) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0155_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0155
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0156 : Poly :=
[
  term ((232 : Rat) / 3) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 156 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0156 : Poly :=
[
  term ((232 : Rat) / 3) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((232 : Rat) / 3) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-232 : Rat) / 3) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-232 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0156_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0156
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0157 : Poly :=
[
  term ((-509 : Rat) / 6) [(9, 1), (15, 1)]
]

/-- Partial product 157 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0157 : Poly :=
[
  term ((-509 : Rat) / 6) [(0, 2), (9, 1), (15, 1)],
  term ((-509 : Rat) / 6) [(1, 2), (9, 1), (15, 1)],
  term ((509 : Rat) / 6) [(9, 1), (10, 2), (15, 1)],
  term ((509 : Rat) / 6) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0157_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0157
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0158 : Poly :=
[
  term ((107 : Rat) / 8) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0158 : Poly :=
[
  term ((107 : Rat) / 8) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 8) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-107 : Rat) / 8) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-107 : Rat) / 8) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0158_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0158
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0159 : Poly :=
[
  term ((17 : Rat) / 4) [(10, 1)]
]

/-- Partial product 159 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0159 : Poly :=
[
  term ((17 : Rat) / 4) [(0, 2), (10, 1)],
  term ((17 : Rat) / 4) [(1, 2), (10, 1)],
  term ((-17 : Rat) / 4) [(10, 1), (11, 2)],
  term ((-17 : Rat) / 4) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0159_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0159
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0160 : Poly :=
[
  term ((-447 : Rat) / 2) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 160 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0160 : Poly :=
[
  term ((-447 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-447 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((447 : Rat) / 2) [(10, 1), (11, 3), (13, 1)],
  term ((447 : Rat) / 2) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0160_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0160
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0161 : Poly :=
[
  term (-80 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 161 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0161 : Poly :=
[
  term (-80 : Rat) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term (80 : Rat) [(10, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0161_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0161
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0162 : Poly :=
[
  term ((134 : Rat) / 3) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 162 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0162 : Poly :=
[
  term ((134 : Rat) / 3) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((134 : Rat) / 3) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-134 : Rat) / 3) [(10, 1), (11, 3), (15, 1)],
  term ((-134 : Rat) / 3) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0162_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0162
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0163 : Poly :=
[
  term ((-3 : Rat) / 2) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0163 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((3 : Rat) / 2) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0163_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0163
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0164 : Poly :=
[
  term ((177 : Rat) / 2) [(10, 1), (11, 2)]
]

/-- Partial product 164 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0164 : Poly :=
[
  term ((177 : Rat) / 2) [(0, 2), (10, 1), (11, 2)],
  term ((177 : Rat) / 2) [(1, 2), (10, 1), (11, 2)],
  term ((-177 : Rat) / 2) [(10, 1), (11, 4)],
  term ((-177 : Rat) / 2) [(10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0164_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0164
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0165 : Poly :=
[
  term (160 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 165 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0165 : Poly :=
[
  term (160 : Rat) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(10, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0165_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0165
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0166 : Poly :=
[
  term ((-1331 : Rat) / 12) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 166 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0166 : Poly :=
[
  term ((-1331 : Rat) / 12) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1331 : Rat) / 12) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((1331 : Rat) / 12) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((1331 : Rat) / 12) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0166_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0166
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0167 : Poly :=
[
  term ((111 : Rat) / 8) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0167 : Poly :=
[
  term ((111 : Rat) / 8) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((111 : Rat) / 8) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 8) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 8) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0167_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0167
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0168 : Poly :=
[
  term (81 : Rat) [(10, 1), (13, 2)]
]

/-- Partial product 168 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0168 : Poly :=
[
  term (81 : Rat) [(0, 2), (10, 1), (13, 2)],
  term (81 : Rat) [(1, 2), (10, 1), (13, 2)],
  term (-81 : Rat) [(10, 1), (11, 2), (13, 2)],
  term (-81 : Rat) [(10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0168_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0168
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0169 : Poly :=
[
  term ((-3 : Rat) / 2) [(10, 2)]
]

/-- Partial product 169 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0169 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 2), (10, 2)],
  term ((-3 : Rat) / 2) [(1, 2), (10, 2)],
  term ((3 : Rat) / 2) [(10, 2), (11, 2)],
  term ((3 : Rat) / 2) [(10, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0169_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0169
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0170 : Poly :=
[
  term (216 : Rat) [(10, 2), (11, 1), (13, 1)]
]

/-- Partial product 170 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0170 : Poly :=
[
  term (216 : Rat) [(0, 2), (10, 2), (11, 1), (13, 1)],
  term (216 : Rat) [(1, 2), (10, 2), (11, 1), (13, 1)],
  term (-216 : Rat) [(10, 2), (11, 3), (13, 1)],
  term (-216 : Rat) [(10, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0170_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0170
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0171 : Poly :=
[
  term (-12 : Rat) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 171 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0171 : Poly :=
[
  term (-12 : Rat) [(0, 2), (10, 2), (11, 1), (15, 1)],
  term (-12 : Rat) [(1, 2), (10, 2), (11, 1), (15, 1)],
  term (12 : Rat) [(10, 2), (11, 3), (15, 1)],
  term (12 : Rat) [(10, 4), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0171_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0171
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0172 : Poly :=
[
  term (-18 : Rat) [(10, 2), (11, 2)]
]

/-- Partial product 172 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0172 : Poly :=
[
  term (-18 : Rat) [(0, 2), (10, 2), (11, 2)],
  term (-18 : Rat) [(1, 2), (10, 2), (11, 2)],
  term (18 : Rat) [(10, 2), (11, 4)],
  term (18 : Rat) [(10, 4), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0172_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0172
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0173 : Poly :=
[
  term (-160 : Rat) [(10, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 173 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0173 : Poly :=
[
  term (-160 : Rat) [(0, 2), (10, 2), (13, 1), (14, 1), (15, 1)],
  term (-160 : Rat) [(1, 2), (10, 2), (13, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(10, 4), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0173_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0173
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0174 : Poly :=
[
  term ((367 : Rat) / 3) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 174 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0174 : Poly :=
[
  term ((367 : Rat) / 3) [(0, 2), (10, 2), (13, 1), (15, 1)],
  term ((367 : Rat) / 3) [(1, 2), (10, 2), (13, 1), (15, 1)],
  term ((-367 : Rat) / 3) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-367 : Rat) / 3) [(10, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0174_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0174
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0175 : Poly :=
[
  term ((-15 : Rat) / 2) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0175 : Poly :=
[
  term ((-15 : Rat) / 2) [(0, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(1, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 2) [(10, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0175_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0175
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0176 : Poly :=
[
  term (-117 : Rat) [(10, 2), (13, 2)]
]

/-- Partial product 176 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0176 : Poly :=
[
  term (-117 : Rat) [(0, 2), (10, 2), (13, 2)],
  term (-117 : Rat) [(1, 2), (10, 2), (13, 2)],
  term (117 : Rat) [(10, 2), (11, 2), (13, 2)],
  term (117 : Rat) [(10, 4), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0176_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0176
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0177 : Poly :=
[
  term (-36 : Rat) [(10, 3), (11, 1), (13, 1)]
]

/-- Partial product 177 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0177 : Poly :=
[
  term (-36 : Rat) [(0, 2), (10, 3), (11, 1), (13, 1)],
  term (-36 : Rat) [(1, 2), (10, 3), (11, 1), (13, 1)],
  term (36 : Rat) [(10, 3), (11, 3), (13, 1)],
  term (36 : Rat) [(10, 5), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0177_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0177
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0178 : Poly :=
[
  term (-24 : Rat) [(10, 3), (13, 1), (15, 1)]
]

/-- Partial product 178 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0178 : Poly :=
[
  term (-24 : Rat) [(0, 2), (10, 3), (13, 1), (15, 1)],
  term (-24 : Rat) [(1, 2), (10, 3), (13, 1), (15, 1)],
  term (24 : Rat) [(10, 3), (11, 2), (13, 1), (15, 1)],
  term (24 : Rat) [(10, 5), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0178_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0178
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0179 : Poly :=
[
  term (24 : Rat) [(10, 3), (13, 2)]
]

/-- Partial product 179 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0179 : Poly :=
[
  term (24 : Rat) [(0, 2), (10, 3), (13, 2)],
  term (24 : Rat) [(1, 2), (10, 3), (13, 2)],
  term (-24 : Rat) [(10, 3), (11, 2), (13, 2)],
  term (-24 : Rat) [(10, 5), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0179_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0179
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0180 : Poly :=
[
  term ((69 : Rat) / 2) [(11, 1), (13, 1)]
]

/-- Partial product 180 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0180 : Poly :=
[
  term ((69 : Rat) / 2) [(0, 2), (11, 1), (13, 1)],
  term ((69 : Rat) / 2) [(1, 2), (11, 1), (13, 1)],
  term ((-69 : Rat) / 2) [(10, 2), (11, 1), (13, 1)],
  term ((-69 : Rat) / 2) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0180_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0180
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0181 : Poly :=
[
  term (20 : Rat) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 181 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0181 : Poly :=
[
  term (20 : Rat) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term (20 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term (-20 : Rat) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term (-20 : Rat) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0181_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0181
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0182 : Poly :=
[
  term ((-89 : Rat) / 12) [(11, 1), (15, 1)]
]

/-- Partial product 182 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0182 : Poly :=
[
  term ((-89 : Rat) / 12) [(0, 2), (11, 1), (15, 1)],
  term ((-89 : Rat) / 12) [(1, 2), (11, 1), (15, 1)],
  term ((89 : Rat) / 12) [(10, 2), (11, 1), (15, 1)],
  term ((89 : Rat) / 12) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0182_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0182
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0183 : Poly :=
[
  term ((-15 : Rat) / 8) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0183 : Poly :=
[
  term ((-15 : Rat) / 8) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 8) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 8) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 8) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0183_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0183
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0184 : Poly :=
[
  term (-27 : Rat) [(11, 2)]
]

/-- Partial product 184 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0184 : Poly :=
[
  term (-27 : Rat) [(0, 2), (11, 2)],
  term (-27 : Rat) [(1, 2), (11, 2)],
  term (27 : Rat) [(10, 2), (11, 2)],
  term (27 : Rat) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0184_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0184
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0185 : Poly :=
[
  term ((-112 : Rat) / 3) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 185 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0185 : Poly :=
[
  term ((-112 : Rat) / 3) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-112 : Rat) / 3) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((112 : Rat) / 3) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((112 : Rat) / 3) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0185_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0185
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0186 : Poly :=
[
  term ((97 : Rat) / 3) [(13, 1), (15, 1)]
]

/-- Partial product 186 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0186 : Poly :=
[
  term ((97 : Rat) / 3) [(0, 2), (13, 1), (15, 1)],
  term ((97 : Rat) / 3) [(1, 2), (13, 1), (15, 1)],
  term ((-97 : Rat) / 3) [(10, 2), (13, 1), (15, 1)],
  term ((-97 : Rat) / 3) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0186_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0186
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0187 : Poly :=
[
  term ((-51 : Rat) / 8) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0187 : Poly :=
[
  term ((-51 : Rat) / 8) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-51 : Rat) / 8) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 8) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 8) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0187_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0187
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0188 : Poly :=
[
  term ((8 : Rat) / 3) [(13, 2)]
]

/-- Partial product 188 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0188 : Poly :=
[
  term ((8 : Rat) / 3) [(0, 2), (13, 2)],
  term ((8 : Rat) / 3) [(1, 2), (13, 2)],
  term ((-8 : Rat) / 3) [(10, 2), (13, 2)],
  term ((-8 : Rat) / 3) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0188_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0188
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0189 : Poly :=
[
  term ((1 : Rat) / 6) [(14, 1)]
]

/-- Partial product 189 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0189 : Poly :=
[
  term ((1 : Rat) / 6) [(0, 2), (14, 1)],
  term ((1 : Rat) / 6) [(1, 2), (14, 1)],
  term ((-1 : Rat) / 6) [(10, 2), (14, 1)],
  term ((-1 : Rat) / 6) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0189_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0189
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYYNY_coefficient_02_0190 : Poly :=
[
  term ((4 : Rat) / 3) [(15, 2)]
]

/-- Partial product 190 for generator 2. -/
def rs_R009_ueqv_R009NYYNY_partial_02_0190 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 2), (15, 2)],
  term ((4 : Rat) / 3) [(1, 2), (15, 2)],
  term ((-4 : Rat) / 3) [(10, 2), (15, 2)],
  term ((-4 : Rat) / 3) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 2. -/
theorem rs_R009_ueqv_R009NYYNY_partial_02_0190_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_02_0190
        rs_R009_ueqv_R009NYYNY_generator_02_0100_0190 =
      rs_R009_ueqv_R009NYYNY_partial_02_0190 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_02_0100_0190 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_02_0100,
  rs_R009_ueqv_R009NYYNY_partial_02_0101,
  rs_R009_ueqv_R009NYYNY_partial_02_0102,
  rs_R009_ueqv_R009NYYNY_partial_02_0103,
  rs_R009_ueqv_R009NYYNY_partial_02_0104,
  rs_R009_ueqv_R009NYYNY_partial_02_0105,
  rs_R009_ueqv_R009NYYNY_partial_02_0106,
  rs_R009_ueqv_R009NYYNY_partial_02_0107,
  rs_R009_ueqv_R009NYYNY_partial_02_0108,
  rs_R009_ueqv_R009NYYNY_partial_02_0109,
  rs_R009_ueqv_R009NYYNY_partial_02_0110,
  rs_R009_ueqv_R009NYYNY_partial_02_0111,
  rs_R009_ueqv_R009NYYNY_partial_02_0112,
  rs_R009_ueqv_R009NYYNY_partial_02_0113,
  rs_R009_ueqv_R009NYYNY_partial_02_0114,
  rs_R009_ueqv_R009NYYNY_partial_02_0115,
  rs_R009_ueqv_R009NYYNY_partial_02_0116,
  rs_R009_ueqv_R009NYYNY_partial_02_0117,
  rs_R009_ueqv_R009NYYNY_partial_02_0118,
  rs_R009_ueqv_R009NYYNY_partial_02_0119,
  rs_R009_ueqv_R009NYYNY_partial_02_0120,
  rs_R009_ueqv_R009NYYNY_partial_02_0121,
  rs_R009_ueqv_R009NYYNY_partial_02_0122,
  rs_R009_ueqv_R009NYYNY_partial_02_0123,
  rs_R009_ueqv_R009NYYNY_partial_02_0124,
  rs_R009_ueqv_R009NYYNY_partial_02_0125,
  rs_R009_ueqv_R009NYYNY_partial_02_0126,
  rs_R009_ueqv_R009NYYNY_partial_02_0127,
  rs_R009_ueqv_R009NYYNY_partial_02_0128,
  rs_R009_ueqv_R009NYYNY_partial_02_0129,
  rs_R009_ueqv_R009NYYNY_partial_02_0130,
  rs_R009_ueqv_R009NYYNY_partial_02_0131,
  rs_R009_ueqv_R009NYYNY_partial_02_0132,
  rs_R009_ueqv_R009NYYNY_partial_02_0133,
  rs_R009_ueqv_R009NYYNY_partial_02_0134,
  rs_R009_ueqv_R009NYYNY_partial_02_0135,
  rs_R009_ueqv_R009NYYNY_partial_02_0136,
  rs_R009_ueqv_R009NYYNY_partial_02_0137,
  rs_R009_ueqv_R009NYYNY_partial_02_0138,
  rs_R009_ueqv_R009NYYNY_partial_02_0139,
  rs_R009_ueqv_R009NYYNY_partial_02_0140,
  rs_R009_ueqv_R009NYYNY_partial_02_0141,
  rs_R009_ueqv_R009NYYNY_partial_02_0142,
  rs_R009_ueqv_R009NYYNY_partial_02_0143,
  rs_R009_ueqv_R009NYYNY_partial_02_0144,
  rs_R009_ueqv_R009NYYNY_partial_02_0145,
  rs_R009_ueqv_R009NYYNY_partial_02_0146,
  rs_R009_ueqv_R009NYYNY_partial_02_0147,
  rs_R009_ueqv_R009NYYNY_partial_02_0148,
  rs_R009_ueqv_R009NYYNY_partial_02_0149,
  rs_R009_ueqv_R009NYYNY_partial_02_0150,
  rs_R009_ueqv_R009NYYNY_partial_02_0151,
  rs_R009_ueqv_R009NYYNY_partial_02_0152,
  rs_R009_ueqv_R009NYYNY_partial_02_0153,
  rs_R009_ueqv_R009NYYNY_partial_02_0154,
  rs_R009_ueqv_R009NYYNY_partial_02_0155,
  rs_R009_ueqv_R009NYYNY_partial_02_0156,
  rs_R009_ueqv_R009NYYNY_partial_02_0157,
  rs_R009_ueqv_R009NYYNY_partial_02_0158,
  rs_R009_ueqv_R009NYYNY_partial_02_0159,
  rs_R009_ueqv_R009NYYNY_partial_02_0160,
  rs_R009_ueqv_R009NYYNY_partial_02_0161,
  rs_R009_ueqv_R009NYYNY_partial_02_0162,
  rs_R009_ueqv_R009NYYNY_partial_02_0163,
  rs_R009_ueqv_R009NYYNY_partial_02_0164,
  rs_R009_ueqv_R009NYYNY_partial_02_0165,
  rs_R009_ueqv_R009NYYNY_partial_02_0166,
  rs_R009_ueqv_R009NYYNY_partial_02_0167,
  rs_R009_ueqv_R009NYYNY_partial_02_0168,
  rs_R009_ueqv_R009NYYNY_partial_02_0169,
  rs_R009_ueqv_R009NYYNY_partial_02_0170,
  rs_R009_ueqv_R009NYYNY_partial_02_0171,
  rs_R009_ueqv_R009NYYNY_partial_02_0172,
  rs_R009_ueqv_R009NYYNY_partial_02_0173,
  rs_R009_ueqv_R009NYYNY_partial_02_0174,
  rs_R009_ueqv_R009NYYNY_partial_02_0175,
  rs_R009_ueqv_R009NYYNY_partial_02_0176,
  rs_R009_ueqv_R009NYYNY_partial_02_0177,
  rs_R009_ueqv_R009NYYNY_partial_02_0178,
  rs_R009_ueqv_R009NYYNY_partial_02_0179,
  rs_R009_ueqv_R009NYYNY_partial_02_0180,
  rs_R009_ueqv_R009NYYNY_partial_02_0181,
  rs_R009_ueqv_R009NYYNY_partial_02_0182,
  rs_R009_ueqv_R009NYYNY_partial_02_0183,
  rs_R009_ueqv_R009NYYNY_partial_02_0184,
  rs_R009_ueqv_R009NYYNY_partial_02_0185,
  rs_R009_ueqv_R009NYYNY_partial_02_0186,
  rs_R009_ueqv_R009NYYNY_partial_02_0187,
  rs_R009_ueqv_R009NYYNY_partial_02_0188,
  rs_R009_ueqv_R009NYYNY_partial_02_0189,
  rs_R009_ueqv_R009NYYNY_partial_02_0190
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_02_0100_0190 : Poly :=
[
  term ((2 : Rat) / 3) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term (-12 : Rat) [(0, 2), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (15 : Rat) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((20 : Rat) / 3) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term (-24 : Rat) [(0, 2), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term (48 : Rat) [(0, 2), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((40 : Rat) / 3) [(0, 2), (3, 1), (10, 2), (13, 1)],
  term (-48 : Rat) [(0, 2), (3, 1), (10, 2), (13, 1), (14, 1)],
  term ((-5 : Rat) / 3) [(0, 2), (3, 1), (11, 1)],
  term (6 : Rat) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(0, 2), (3, 1), (13, 1)],
  term (-10 : Rat) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((3 : Rat) / 2) [(0, 2), (3, 1), (15, 1)],
  term (-96 : Rat) [(0, 2), (4, 1), (9, 1), (10, 1), (11, 1)],
  term (54 : Rat) [(0, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term (80 : Rat) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-215 : Rat) / 3) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((21 : Rat) / 2) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 2), (4, 1), (9, 1), (10, 2), (11, 1)],
  term (-12 : Rat) [(0, 2), (4, 1), (9, 1), (10, 2), (13, 1)],
  term (12 : Rat) [(0, 2), (4, 1), (9, 1), (10, 2), (15, 1)],
  term (55 : Rat) [(0, 2), (4, 1), (9, 1), (11, 1)],
  term ((-68 : Rat) / 3) [(0, 2), (4, 1), (9, 1), (13, 1)],
  term ((-208 : Rat) / 3) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((127 : Rat) / 2) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term (-15 : Rat) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term (27 : Rat) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term (40 : Rat) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-215 : Rat) / 6) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((21 : Rat) / 4) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(0, 2), (5, 1), (10, 2), (11, 1)],
  term (-6 : Rat) [(0, 2), (5, 1), (10, 2), (13, 1)],
  term (6 : Rat) [(0, 2), (5, 1), (10, 2), (15, 1)],
  term ((55 : Rat) / 2) [(0, 2), (5, 1), (11, 1)],
  term ((-34 : Rat) / 3) [(0, 2), (5, 1), (13, 1)],
  term ((-104 : Rat) / 3) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((127 : Rat) / 4) [(0, 2), (5, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 2) [(0, 2), (7, 1), (15, 1)],
  term ((19 : Rat) / 4) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((105 : Rat) / 2) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term (-12 : Rat) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term (-40 : Rat) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((941 : Rat) / 12) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-129 : Rat) / 8) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(0, 2), (9, 1), (10, 2), (11, 1)],
  term (3 : Rat) [(0, 2), (9, 1), (10, 2), (13, 1)],
  term (-21 : Rat) [(0, 2), (9, 1), (10, 2), (15, 1)],
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-97 : Rat) / 2) [(0, 2), (9, 1), (11, 1)],
  term ((19 : Rat) / 3) [(0, 2), (9, 1), (13, 1)],
  term ((4 : Rat) / 3) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((232 : Rat) / 3) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-509 : Rat) / 6) [(0, 2), (9, 1), (15, 1)],
  term ((107 : Rat) / 8) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 4) [(0, 2), (10, 1)],
  term ((-447 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term (-80 : Rat) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((134 : Rat) / 3) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 2) [(0, 2), (10, 1), (11, 2)],
  term (160 : Rat) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1331 : Rat) / 12) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((111 : Rat) / 8) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (81 : Rat) [(0, 2), (10, 1), (13, 2)],
  term ((-3 : Rat) / 2) [(0, 2), (10, 2)],
  term (216 : Rat) [(0, 2), (10, 2), (11, 1), (13, 1)],
  term (-12 : Rat) [(0, 2), (10, 2), (11, 1), (15, 1)],
  term (-18 : Rat) [(0, 2), (10, 2), (11, 2)],
  term (-160 : Rat) [(0, 2), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((367 : Rat) / 3) [(0, 2), (10, 2), (13, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(0, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (-117 : Rat) [(0, 2), (10, 2), (13, 2)],
  term (-36 : Rat) [(0, 2), (10, 3), (11, 1), (13, 1)],
  term (-24 : Rat) [(0, 2), (10, 3), (13, 1), (15, 1)],
  term (24 : Rat) [(0, 2), (10, 3), (13, 2)],
  term ((69 : Rat) / 2) [(0, 2), (11, 1), (13, 1)],
  term (20 : Rat) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 12) [(0, 2), (11, 1), (15, 1)],
  term ((-15 : Rat) / 8) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(0, 2), (11, 2)],
  term ((-112 : Rat) / 3) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((97 : Rat) / 3) [(0, 2), (13, 1), (15, 1)],
  term ((-51 : Rat) / 8) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(0, 2), (13, 2)],
  term ((1 : Rat) / 6) [(0, 2), (14, 1)],
  term ((4 : Rat) / 3) [(0, 2), (15, 2)],
  term ((2 : Rat) / 3) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (9, 1), (10, 1), (14, 1)],
  term (15 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((20 : Rat) / 3) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term (-24 : Rat) [(1, 2), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-32 : Rat) / 3) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term (48 : Rat) [(1, 2), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((40 : Rat) / 3) [(1, 2), (3, 1), (10, 2), (13, 1)],
  term (-48 : Rat) [(1, 2), (3, 1), (10, 2), (13, 1), (14, 1)],
  term ((-5 : Rat) / 3) [(1, 2), (3, 1), (11, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (3, 1), (13, 1)],
  term (-10 : Rat) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((3 : Rat) / 2) [(1, 2), (3, 1), (15, 1)],
  term (-96 : Rat) [(1, 2), (4, 1), (9, 1), (10, 1), (11, 1)],
  term (54 : Rat) [(1, 2), (4, 1), (9, 1), (10, 1), (13, 1)],
  term (80 : Rat) [(1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-215 : Rat) / 3) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((21 : Rat) / 2) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(1, 2), (4, 1), (9, 1), (10, 2), (11, 1)],
  term (-12 : Rat) [(1, 2), (4, 1), (9, 1), (10, 2), (13, 1)],
  term (12 : Rat) [(1, 2), (4, 1), (9, 1), (10, 2), (15, 1)],
  term (55 : Rat) [(1, 2), (4, 1), (9, 1), (11, 1)],
  term ((-68 : Rat) / 3) [(1, 2), (4, 1), (9, 1), (13, 1)],
  term ((-208 : Rat) / 3) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((127 : Rat) / 2) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term (-15 : Rat) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term (27 : Rat) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term (40 : Rat) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-215 : Rat) / 6) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((21 : Rat) / 4) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(1, 2), (5, 1), (10, 2), (11, 1)],
  term (-6 : Rat) [(1, 2), (5, 1), (10, 2), (13, 1)],
  term (6 : Rat) [(1, 2), (5, 1), (10, 2), (15, 1)],
  term ((55 : Rat) / 2) [(1, 2), (5, 1), (11, 1)],
  term ((-34 : Rat) / 3) [(1, 2), (5, 1), (13, 1)],
  term ((-104 : Rat) / 3) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((127 : Rat) / 4) [(1, 2), (5, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 2) [(1, 2), (7, 1), (15, 1)],
  term ((19 : Rat) / 4) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((105 : Rat) / 2) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term (-12 : Rat) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term (-40 : Rat) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((941 : Rat) / 12) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-129 : Rat) / 8) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 2), (9, 1), (10, 2), (11, 1)],
  term (3 : Rat) [(1, 2), (9, 1), (10, 2), (13, 1)],
  term (-21 : Rat) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-97 : Rat) / 2) [(1, 2), (9, 1), (11, 1)],
  term ((19 : Rat) / 3) [(1, 2), (9, 1), (13, 1)],
  term ((4 : Rat) / 3) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((232 : Rat) / 3) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-509 : Rat) / 6) [(1, 2), (9, 1), (15, 1)],
  term ((107 : Rat) / 8) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 4) [(1, 2), (10, 1)],
  term ((-447 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term (-80 : Rat) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((134 : Rat) / 3) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((177 : Rat) / 2) [(1, 2), (10, 1), (11, 2)],
  term (160 : Rat) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1331 : Rat) / 12) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((111 : Rat) / 8) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (81 : Rat) [(1, 2), (10, 1), (13, 2)],
  term ((-3 : Rat) / 2) [(1, 2), (10, 2)],
  term (216 : Rat) [(1, 2), (10, 2), (11, 1), (13, 1)],
  term (-12 : Rat) [(1, 2), (10, 2), (11, 1), (15, 1)],
  term (-18 : Rat) [(1, 2), (10, 2), (11, 2)],
  term (-160 : Rat) [(1, 2), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((367 : Rat) / 3) [(1, 2), (10, 2), (13, 1), (15, 1)],
  term ((-15 : Rat) / 2) [(1, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (-117 : Rat) [(1, 2), (10, 2), (13, 2)],
  term (-36 : Rat) [(1, 2), (10, 3), (11, 1), (13, 1)],
  term (-24 : Rat) [(1, 2), (10, 3), (13, 1), (15, 1)],
  term (24 : Rat) [(1, 2), (10, 3), (13, 2)],
  term ((69 : Rat) / 2) [(1, 2), (11, 1), (13, 1)],
  term (20 : Rat) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 12) [(1, 2), (11, 1), (15, 1)],
  term ((-15 : Rat) / 8) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(1, 2), (11, 2)],
  term ((-112 : Rat) / 3) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((97 : Rat) / 3) [(1, 2), (13, 1), (15, 1)],
  term ((-51 : Rat) / 8) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(1, 2), (13, 2)],
  term ((1 : Rat) / 6) [(1, 2), (14, 1)],
  term ((4 : Rat) / 3) [(1, 2), (15, 2)],
  term ((-2 : Rat) / 3) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term (12 : Rat) [(3, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term (-15 : Rat) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((-2 : Rat) / 3) [(3, 1), (9, 1), (10, 3)],
  term (12 : Rat) [(3, 1), (9, 1), (10, 3), (14, 1)],
  term (-15 : Rat) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((32 : Rat) / 3) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term (-48 : Rat) [(3, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-20 : Rat) / 3) [(3, 1), (10, 1), (11, 3)],
  term (24 : Rat) [(3, 1), (10, 1), (11, 3), (14, 1)],
  term ((5 : Rat) / 3) [(3, 1), (10, 2), (11, 1)],
  term (-6 : Rat) [(3, 1), (10, 2), (11, 1), (14, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (10, 2), (11, 2), (13, 1)],
  term (48 : Rat) [(3, 1), (10, 2), (11, 2), (13, 1), (14, 1)],
  term ((4 : Rat) / 3) [(3, 1), (10, 2), (13, 1)],
  term (10 : Rat) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (10, 2), (15, 1)],
  term ((-20 : Rat) / 3) [(3, 1), (10, 3), (11, 1)],
  term (24 : Rat) [(3, 1), (10, 3), (11, 1), (14, 1)],
  term ((32 : Rat) / 3) [(3, 1), (10, 3), (13, 1)],
  term (-48 : Rat) [(3, 1), (10, 3), (13, 1), (14, 1)],
  term ((-40 : Rat) / 3) [(3, 1), (10, 4), (13, 1)],
  term (48 : Rat) [(3, 1), (10, 4), (13, 1), (14, 1)],
  term ((4 : Rat) / 3) [(3, 1), (11, 2), (13, 1)],
  term (10 : Rat) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (11, 2), (15, 1)],
  term ((5 : Rat) / 3) [(3, 1), (11, 3)],
  term (-6 : Rat) [(3, 1), (11, 3), (14, 1)],
  term (-54 : Rat) [(4, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((215 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-21 : Rat) / 2) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (96 : Rat) [(4, 1), (9, 1), (10, 1), (11, 3)],
  term (-55 : Rat) [(4, 1), (9, 1), (10, 2), (11, 1)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 2), (11, 2), (13, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 2), (11, 3)],
  term ((68 : Rat) / 3) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((208 : Rat) / 3) [(4, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-127 : Rat) / 2) [(4, 1), (9, 1), (10, 2), (15, 1)],
  term (15 : Rat) [(4, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (96 : Rat) [(4, 1), (9, 1), (10, 3), (11, 1)],
  term (-54 : Rat) [(4, 1), (9, 1), (10, 3), (13, 1)],
  term (-80 : Rat) [(4, 1), (9, 1), (10, 3), (14, 1), (15, 1)],
  term ((215 : Rat) / 3) [(4, 1), (9, 1), (10, 3), (15, 1)],
  term ((-21 : Rat) / 2) [(4, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term (-18 : Rat) [(4, 1), (9, 1), (10, 4), (11, 1)],
  term (12 : Rat) [(4, 1), (9, 1), (10, 4), (13, 1)],
  term (-12 : Rat) [(4, 1), (9, 1), (10, 4), (15, 1)],
  term ((68 : Rat) / 3) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((208 : Rat) / 3) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-127 : Rat) / 2) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term (15 : Rat) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term (-55 : Rat) [(4, 1), (9, 1), (11, 3)],
  term (-27 : Rat) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term (-40 : Rat) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((215 : Rat) / 6) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-21 : Rat) / 4) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(5, 1), (10, 1), (11, 3)],
  term ((-55 : Rat) / 2) [(5, 1), (10, 2), (11, 1)],
  term (6 : Rat) [(5, 1), (10, 2), (11, 2), (13, 1)],
  term (-6 : Rat) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term (-9 : Rat) [(5, 1), (10, 2), (11, 3)],
  term ((34 : Rat) / 3) [(5, 1), (10, 2), (13, 1)],
  term ((104 : Rat) / 3) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-127 : Rat) / 4) [(5, 1), (10, 2), (15, 1)],
  term ((15 : Rat) / 2) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(5, 1), (10, 3), (11, 1)],
  term (-27 : Rat) [(5, 1), (10, 3), (13, 1)],
  term (-40 : Rat) [(5, 1), (10, 3), (14, 1), (15, 1)],
  term ((215 : Rat) / 6) [(5, 1), (10, 3), (15, 1)],
  term ((-21 : Rat) / 4) [(5, 1), (10, 3), (15, 1), (16, 1)],
  term (-9 : Rat) [(5, 1), (10, 4), (11, 1)],
  term (6 : Rat) [(5, 1), (10, 4), (13, 1)],
  term (-6 : Rat) [(5, 1), (10, 4), (15, 1)],
  term ((34 : Rat) / 3) [(5, 1), (11, 2), (13, 1)],
  term ((104 : Rat) / 3) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-127 : Rat) / 4) [(5, 1), (11, 2), (15, 1)],
  term ((15 : Rat) / 2) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-55 : Rat) / 2) [(5, 1), (11, 3)],
  term (3 : Rat) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (10, 2), (15, 1)],
  term ((-19 : Rat) / 4) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 2), (15, 1)],
  term ((-19 : Rat) / 4) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term (40 : Rat) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-941 : Rat) / 12) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((129 : Rat) / 8) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-105 : Rat) / 2) [(9, 1), (10, 1), (11, 3)],
  term ((97 : Rat) / 2) [(9, 1), (10, 2), (11, 1)],
  term (-3 : Rat) [(9, 1), (10, 2), (11, 2), (13, 1)],
  term (21 : Rat) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (10, 2), (11, 3)],
  term ((-19 : Rat) / 3) [(9, 1), (10, 2), (13, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-232 : Rat) / 3) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((509 : Rat) / 6) [(9, 1), (10, 2), (15, 1)],
  term ((-107 : Rat) / 8) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-105 : Rat) / 2) [(9, 1), (10, 3), (11, 1)],
  term (12 : Rat) [(9, 1), (10, 3), (13, 1)],
  term (40 : Rat) [(9, 1), (10, 3), (14, 1), (15, 1)],
  term ((-941 : Rat) / 12) [(9, 1), (10, 3), (15, 1)],
  term ((129 : Rat) / 8) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (10, 4), (11, 1)],
  term (-3 : Rat) [(9, 1), (10, 4), (13, 1)],
  term (21 : Rat) [(9, 1), (10, 4), (15, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (10, 4), (15, 1), (16, 1)],
  term ((-19 : Rat) / 3) [(9, 1), (11, 2), (13, 1)],
  term ((-4 : Rat) / 3) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-232 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((509 : Rat) / 6) [(9, 1), (11, 2), (15, 1)],
  term ((-107 : Rat) / 8) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((97 : Rat) / 2) [(9, 1), (11, 3)],
  term ((-17 : Rat) / 4) [(10, 1), (11, 2)],
  term (-160 : Rat) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1331 : Rat) / 12) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-111 : Rat) / 8) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (-81 : Rat) [(10, 1), (11, 2), (13, 2)],
  term ((447 : Rat) / 2) [(10, 1), (11, 3), (13, 1)],
  term (80 : Rat) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-134 : Rat) / 3) [(10, 1), (11, 3), (15, 1)],
  term ((3 : Rat) / 2) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-177 : Rat) / 2) [(10, 1), (11, 4)],
  term ((-69 : Rat) / 2) [(10, 2), (11, 1), (13, 1)],
  term (-20 : Rat) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((89 : Rat) / 12) [(10, 2), (11, 1), (15, 1)],
  term ((15 : Rat) / 8) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 2) [(10, 2), (11, 2)],
  term (160 : Rat) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-367 : Rat) / 3) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((15 : Rat) / 2) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (117 : Rat) [(10, 2), (11, 2), (13, 2)],
  term (-216 : Rat) [(10, 2), (11, 3), (13, 1)],
  term (12 : Rat) [(10, 2), (11, 3), (15, 1)],
  term (18 : Rat) [(10, 2), (11, 4)],
  term ((112 : Rat) / 3) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-97 : Rat) / 3) [(10, 2), (13, 1), (15, 1)],
  term ((51 : Rat) / 8) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(10, 2), (13, 2)],
  term ((-1 : Rat) / 6) [(10, 2), (14, 1)],
  term ((-4 : Rat) / 3) [(10, 2), (15, 2)],
  term ((-17 : Rat) / 4) [(10, 3)],
  term ((447 : Rat) / 2) [(10, 3), (11, 1), (13, 1)],
  term (80 : Rat) [(10, 3), (11, 1), (14, 1), (15, 1)],
  term ((-134 : Rat) / 3) [(10, 3), (11, 1), (15, 1)],
  term ((3 : Rat) / 2) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-177 : Rat) / 2) [(10, 3), (11, 2)],
  term (24 : Rat) [(10, 3), (11, 2), (13, 1), (15, 1)],
  term (-24 : Rat) [(10, 3), (11, 2), (13, 2)],
  term (36 : Rat) [(10, 3), (11, 3), (13, 1)],
  term (-160 : Rat) [(10, 3), (13, 1), (14, 1), (15, 1)],
  term ((1331 : Rat) / 12) [(10, 3), (13, 1), (15, 1)],
  term ((-111 : Rat) / 8) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term (-81 : Rat) [(10, 3), (13, 2)],
  term ((3 : Rat) / 2) [(10, 4)],
  term (-216 : Rat) [(10, 4), (11, 1), (13, 1)],
  term (12 : Rat) [(10, 4), (11, 1), (15, 1)],
  term (18 : Rat) [(10, 4), (11, 2)],
  term (160 : Rat) [(10, 4), (13, 1), (14, 1), (15, 1)],
  term ((-367 : Rat) / 3) [(10, 4), (13, 1), (15, 1)],
  term ((15 : Rat) / 2) [(10, 4), (13, 1), (15, 1), (16, 1)],
  term (117 : Rat) [(10, 4), (13, 2)],
  term (36 : Rat) [(10, 5), (11, 1), (13, 1)],
  term (24 : Rat) [(10, 5), (13, 1), (15, 1)],
  term (-24 : Rat) [(10, 5), (13, 2)],
  term ((112 : Rat) / 3) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-97 : Rat) / 3) [(11, 2), (13, 1), (15, 1)],
  term ((51 : Rat) / 8) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(11, 2), (13, 2)],
  term ((-1 : Rat) / 6) [(11, 2), (14, 1)],
  term ((-4 : Rat) / 3) [(11, 2), (15, 2)],
  term ((-69 : Rat) / 2) [(11, 3), (13, 1)],
  term (-20 : Rat) [(11, 3), (14, 1), (15, 1)],
  term ((89 : Rat) / 12) [(11, 3), (15, 1)],
  term ((15 : Rat) / 8) [(11, 3), (15, 1), (16, 1)],
  term (27 : Rat) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 190. -/
theorem rs_R009_ueqv_R009NYYNY_block_02_0100_0190_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_02_0100_0190
      rs_R009_ueqv_R009NYYNY_block_02_0100_0190 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
