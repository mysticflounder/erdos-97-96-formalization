/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 12:100-115

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_12_0100_0115 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0100 : Poly :=
[
  term (14 : Rat) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 100 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0100 : Poly :=
[
  term (28 : Rat) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (28 : Rat) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term (-14 : Rat) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term (-14 : Rat) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0100_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0100
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0101 : Poly :=
[
  term (6 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0101 : Poly :=
[
  term (12 : Rat) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (-6 : Rat) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0101_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0101
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0102 : Poly :=
[
  term ((-64153 : Rat) / 4620) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 102 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0102 : Poly :=
[
  term ((-64153 : Rat) / 2310) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-64153 : Rat) / 2310) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((64153 : Rat) / 4620) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((64153 : Rat) / 4620) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0102_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0102
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0103 : Poly :=
[
  term (12 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0103 : Poly :=
[
  term (24 : Rat) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0103_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0103
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0104 : Poly :=
[
  term ((11831 : Rat) / 6160) [(11, 1), (15, 1)]
]

/-- Partial product 104 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0104 : Poly :=
[
  term ((11831 : Rat) / 3080) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((11831 : Rat) / 3080) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11831 : Rat) / 6160) [(11, 1), (12, 2), (15, 1)],
  term ((-11831 : Rat) / 6160) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0104_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0104
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0105 : Poly :=
[
  term ((5 : Rat) / 4) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0105 : Poly :=
[
  term ((5 : Rat) / 2) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0105_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0105
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0106 : Poly :=
[
  term (2 : Rat) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0106 : Poly :=
[
  term (4 : Rat) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0106_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0106
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0107 : Poly :=
[
  term ((64153 : Rat) / 9240) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 107 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0107 : Poly :=
[
  term ((64153 : Rat) / 4620) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((64153 : Rat) / 4620) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-64153 : Rat) / 9240) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-64153 : Rat) / 9240) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0107_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0107
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0108 : Poly :=
[
  term (-6 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0108 : Poly :=
[
  term (-12 : Rat) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0108_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0108
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0109 : Poly :=
[
  term ((2573 : Rat) / 1680) [(13, 1), (15, 1)]
]

/-- Partial product 109 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0109 : Poly :=
[
  term ((2573 : Rat) / 840) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((2573 : Rat) / 840) [(3, 1), (13, 2), (15, 1)],
  term ((-2573 : Rat) / 1680) [(12, 2), (13, 1), (15, 1)],
  term ((-2573 : Rat) / 1680) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0109_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0109
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0110 : Poly :=
[
  term ((-29 : Rat) / 4) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0110 : Poly :=
[
  term ((-29 : Rat) / 2) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29 : Rat) / 2) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((29 : Rat) / 4) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((29 : Rat) / 4) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0110_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0110
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0111 : Poly :=
[
  term (-7 : Rat) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0111 : Poly :=
[
  term (-14 : Rat) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term (-14 : Rat) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term (7 : Rat) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term (7 : Rat) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0111_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0111
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0112 : Poly :=
[
  term (-7 : Rat) [(13, 2), (14, 1)]
]

/-- Partial product 112 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0112 : Poly :=
[
  term (-14 : Rat) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term (-14 : Rat) [(3, 1), (13, 3), (14, 1)],
  term (7 : Rat) [(12, 2), (13, 2), (14, 1)],
  term (7 : Rat) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0112_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0112
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0113 : Poly :=
[
  term ((7 : Rat) / 2) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0113 : Poly :=
[
  term (7 : Rat) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (7 : Rat) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0113_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0113
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0114 : Poly :=
[
  term ((-64153 : Rat) / 18480) [(15, 2)]
]

/-- Partial product 114 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0114 : Poly :=
[
  term ((-64153 : Rat) / 9240) [(2, 1), (12, 1), (15, 2)],
  term ((-64153 : Rat) / 9240) [(3, 1), (13, 1), (15, 2)],
  term ((64153 : Rat) / 18480) [(12, 2), (15, 2)],
  term ((64153 : Rat) / 18480) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0114_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0114
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def rs_R014_ueqv_R014YY_coefficient_12_0115 : Poly :=
[
  term ((3 : Rat) / 2) [(15, 2), (16, 1)]
]

/-- Partial product 115 for generator 12. -/
def rs_R014_ueqv_R014YY_partial_12_0115 : Poly :=
[
  term (3 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(12, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem rs_R014_ueqv_R014YY_partial_12_0115_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_12_0115
        rs_R014_ueqv_R014YY_generator_12_0100_0115 =
      rs_R014_ueqv_R014YY_partial_12_0115 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_12_0100_0115 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_12_0100,
  rs_R014_ueqv_R014YY_partial_12_0101,
  rs_R014_ueqv_R014YY_partial_12_0102,
  rs_R014_ueqv_R014YY_partial_12_0103,
  rs_R014_ueqv_R014YY_partial_12_0104,
  rs_R014_ueqv_R014YY_partial_12_0105,
  rs_R014_ueqv_R014YY_partial_12_0106,
  rs_R014_ueqv_R014YY_partial_12_0107,
  rs_R014_ueqv_R014YY_partial_12_0108,
  rs_R014_ueqv_R014YY_partial_12_0109,
  rs_R014_ueqv_R014YY_partial_12_0110,
  rs_R014_ueqv_R014YY_partial_12_0111,
  rs_R014_ueqv_R014YY_partial_12_0112,
  rs_R014_ueqv_R014YY_partial_12_0113,
  rs_R014_ueqv_R014YY_partial_12_0114,
  rs_R014_ueqv_R014YY_partial_12_0115
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_12_0100_0115 : Poly :=
[
  term (28 : Rat) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (12 : Rat) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64153 : Rat) / 2310) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11831 : Rat) / 3080) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((5 : Rat) / 2) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((64153 : Rat) / 4620) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2573 : Rat) / 840) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-29 : Rat) / 2) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term (-14 : Rat) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term (7 : Rat) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64153 : Rat) / 9240) [(2, 1), (12, 1), (15, 2)],
  term (3 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-64153 : Rat) / 2310) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (24 : Rat) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11831 : Rat) / 3080) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((5 : Rat) / 2) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term (7 : Rat) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64153 : Rat) / 9240) [(3, 1), (13, 1), (15, 2)],
  term (3 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((64153 : Rat) / 4620) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term (-12 : Rat) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2573 : Rat) / 840) [(3, 1), (13, 2), (15, 1)],
  term ((-29 : Rat) / 2) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (-14 : Rat) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term (-14 : Rat) [(3, 1), (13, 3), (14, 1)],
  term (-14 : Rat) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term (-6 : Rat) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((64153 : Rat) / 4620) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term (-12 : Rat) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11831 : Rat) / 6160) [(11, 1), (12, 2), (15, 1)],
  term ((-5 : Rat) / 4) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((64153 : Rat) / 4620) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term (-12 : Rat) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11831 : Rat) / 6160) [(11, 1), (13, 2), (15, 1)],
  term ((-5 : Rat) / 4) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (-14 : Rat) [(11, 1), (13, 3), (14, 1)],
  term (-6 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-64153 : Rat) / 9240) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2573 : Rat) / 1680) [(12, 2), (13, 1), (15, 1)],
  term ((29 : Rat) / 4) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term (7 : Rat) [(12, 2), (13, 2), (14, 1)],
  term ((-7 : Rat) / 2) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((64153 : Rat) / 18480) [(12, 2), (15, 2)],
  term ((-3 : Rat) / 2) [(12, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((64153 : Rat) / 18480) [(13, 2), (15, 2)],
  term ((-3 : Rat) / 2) [(13, 2), (15, 2), (16, 1)],
  term ((-64153 : Rat) / 9240) [(13, 3), (14, 1), (15, 1)],
  term (6 : Rat) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2573 : Rat) / 1680) [(13, 3), (15, 1)],
  term ((29 : Rat) / 4) [(13, 3), (15, 1), (16, 1)],
  term (7 : Rat) [(13, 3), (15, 3), (16, 1)],
  term (7 : Rat) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 115. -/
theorem rs_R014_ueqv_R014YY_block_12_0100_0115_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_12_0100_0115
      rs_R014_ueqv_R014YY_block_12_0100_0115 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
