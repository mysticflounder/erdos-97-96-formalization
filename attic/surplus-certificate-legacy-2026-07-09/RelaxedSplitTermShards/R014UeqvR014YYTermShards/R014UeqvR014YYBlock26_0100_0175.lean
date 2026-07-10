/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 26:100-175

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_26_0100_0175 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0100 : Poly :=
[
  term ((2 : Rat) / 3) [(3, 2), (9, 1), (11, 1)]
]

/-- Partial product 100 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0100 : Poly :=
[
  term ((4 : Rat) / 3) [(3, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (9, 1), (10, 2), (11, 1)],
  term ((4 : Rat) / 3) [(3, 2), (9, 1), (11, 2), (13, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0100_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0100
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0101 : Poly :=
[
  term ((1 : Rat) / 3) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 101 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0101 : Poly :=
[
  term ((2 : Rat) / 3) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(3, 2), (9, 1), (10, 2), (13, 1)],
  term ((2 : Rat) / 3) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((-1 : Rat) / 3) [(3, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0101_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0101
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0102 : Poly :=
[
  term (2 : Rat) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 102 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0102 : Poly :=
[
  term (4 : Rat) [(3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(3, 2), (9, 1), (10, 2), (15, 1)],
  term (4 : Rat) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term (-2 : Rat) [(3, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0102_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0102
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0103 : Poly :=
[
  term ((-16867 : Rat) / 1155) [(3, 2), (11, 1), (15, 1)]
]

/-- Partial product 103 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0103 : Poly :=
[
  term ((-33734 : Rat) / 1155) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16867 : Rat) / 1155) [(3, 2), (10, 2), (11, 1), (15, 1)],
  term ((-33734 : Rat) / 1155) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((16867 : Rat) / 1155) [(3, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0103_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0103
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0104 : Poly :=
[
  term (20 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0104 : Poly :=
[
  term (40 : Rat) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-20 : Rat) [(3, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (-20 : Rat) [(3, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0104_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0104
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0105 : Poly :=
[
  term ((-16867 : Rat) / 2310) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 105 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0105 : Poly :=
[
  term ((-16867 : Rat) / 1155) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((16867 : Rat) / 2310) [(3, 2), (10, 2), (13, 1), (15, 1)],
  term ((-16867 : Rat) / 1155) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((16867 : Rat) / 2310) [(3, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0105_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0105
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0106 : Poly :=
[
  term (10 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0106 : Poly :=
[
  term (20 : Rat) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(3, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-10 : Rat) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0106_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0106
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0107 : Poly :=
[
  term ((-16867 : Rat) / 385) [(3, 2), (15, 2)]
]

/-- Partial product 107 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0107 : Poly :=
[
  term ((-33734 : Rat) / 385) [(3, 2), (10, 1), (12, 1), (15, 2)],
  term ((16867 : Rat) / 385) [(3, 2), (10, 2), (15, 2)],
  term ((-33734 : Rat) / 385) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((16867 : Rat) / 385) [(3, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0107_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0107
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0108 : Poly :=
[
  term (60 : Rat) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0108 : Poly :=
[
  term (120 : Rat) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term (-60 : Rat) [(3, 2), (10, 2), (15, 2), (16, 1)],
  term (120 : Rat) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-60 : Rat) [(3, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0108_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0108
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0109 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 109 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0109 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0109_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0109
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0110 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 110 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0110 : Poly :=
[
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (10, 2), (15, 1)],
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0110_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0110
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0111 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 111 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0111 : Poly :=
[
  term (-3 : Rat) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0111_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0111
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0112 : Poly :=
[
  term ((86 : Rat) / 3) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 112 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0112 : Poly :=
[
  term ((172 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-86 : Rat) / 3) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term ((172 : Rat) / 3) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-86 : Rat) / 3) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0112_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0112
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0113 : Poly :=
[
  term (-21 : Rat) [(4, 1), (13, 2)]
]

/-- Partial product 113 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0113 : Poly :=
[
  term (-42 : Rat) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term (21 : Rat) [(4, 1), (10, 2), (13, 2)],
  term (-42 : Rat) [(4, 1), (11, 1), (13, 3)],
  term (21 : Rat) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0113_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0113
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0114 : Poly :=
[
  term (3 : Rat) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 114 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0114 : Poly :=
[
  term (6 : Rat) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term (-3 : Rat) [(4, 1), (10, 2), (14, 1), (15, 2)],
  term (6 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term (-3 : Rat) [(4, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0114_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0114
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0115 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (15, 2)]
]

/-- Partial product 115 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0115 : Poly :=
[
  term ((-8 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((4 : Rat) / 3) [(4, 1), (10, 2), (15, 2)],
  term ((-8 : Rat) / 3) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((4 : Rat) / 3) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0115_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0115
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0116 : Poly :=
[
  term ((1 : Rat) / 3) [(5, 1), (7, 1)]
]

/-- Partial product 116 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0116 : Poly :=
[
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-1 : Rat) / 3) [(5, 1), (7, 1), (10, 2)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(5, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0116_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0116
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0117 : Poly :=
[
  term ((21 : Rat) / 2) [(5, 1), (13, 1)]
]

/-- Partial product 117 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0117 : Poly :=
[
  term (21 : Rat) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-21 : Rat) / 2) [(5, 1), (10, 2), (13, 1)],
  term (21 : Rat) [(5, 1), (11, 1), (13, 2)],
  term ((-21 : Rat) / 2) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0117_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0117
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0118 : Poly :=
[
  term ((3 : Rat) / 4) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 118 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0118 : Poly :=
[
  term ((3 : Rat) / 2) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0118_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0118
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0119 : Poly :=
[
  term ((-902081 : Rat) / 4620) [(5, 1), (15, 1)]
]

/-- Partial product 119 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0119 : Poly :=
[
  term ((-902081 : Rat) / 2310) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((902081 : Rat) / 4620) [(5, 1), (10, 2), (15, 1)],
  term ((-902081 : Rat) / 2310) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((902081 : Rat) / 4620) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0119_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0119
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0120 : Poly :=
[
  term ((2 : Rat) / 3) [(7, 1), (9, 1)]
]

/-- Partial product 120 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0120 : Poly :=
[
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (9, 1), (10, 2)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0120_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0120
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0121 : Poly :=
[
  term ((2 : Rat) / 3) [(7, 1), (11, 1)]
]

/-- Partial product 121 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0121 : Poly :=
[
  term ((4 : Rat) / 3) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (10, 2), (11, 1)],
  term ((4 : Rat) / 3) [(7, 1), (11, 2), (13, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0121_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0121
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0122 : Poly :=
[
  term ((-77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 122 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0122 : Poly :=
[
  term ((-77 : Rat) / 30) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((77 : Rat) / 60) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-77 : Rat) / 30) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((77 : Rat) / 60) [(7, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0122_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0122
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0123 : Poly :=
[
  term ((7 : Rat) / 5) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 123 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0123 : Poly :=
[
  term ((14 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-7 : Rat) / 5) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((14 : Rat) / 5) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0123_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0123
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0124 : Poly :=
[
  term ((1 : Rat) / 4) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 124 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0124 : Poly :=
[
  term ((1 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((1 : Rat) / 2) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0124_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0124
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0125 : Poly :=
[
  term ((76 : Rat) / 15) [(7, 1), (13, 1)]
]

/-- Partial product 125 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0125 : Poly :=
[
  term ((152 : Rat) / 15) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-76 : Rat) / 15) [(7, 1), (10, 2), (13, 1)],
  term ((152 : Rat) / 15) [(7, 1), (11, 1), (13, 2)],
  term ((-76 : Rat) / 15) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0125_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0125
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0126 : Poly :=
[
  term ((-629 : Rat) / 60) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 126 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0126 : Poly :=
[
  term ((-629 : Rat) / 30) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((629 : Rat) / 60) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((-629 : Rat) / 30) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((629 : Rat) / 60) [(7, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0126_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0126
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0127 : Poly :=
[
  term (3 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 127 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0127 : Poly :=
[
  term (6 : Rat) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0127_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0127
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0128 : Poly :=
[
  term ((-7 : Rat) / 12) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 128 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0128 : Poly :=
[
  term ((-7 : Rat) / 6) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((7 : Rat) / 12) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-7 : Rat) / 6) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((7 : Rat) / 12) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0128_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0128
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0129 : Poly :=
[
  term ((-11 : Rat) / 4) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 129 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0129 : Poly :=
[
  term ((-11 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((11 : Rat) / 4) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((11 : Rat) / 4) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0129_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0129
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0130 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 130 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0130 : Poly :=
[
  term ((-7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0130_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0130
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0131 : Poly :=
[
  term ((637 : Rat) / 40) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 131 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0131 : Poly :=
[
  term ((637 : Rat) / 20) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-637 : Rat) / 40) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((637 : Rat) / 20) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-637 : Rat) / 40) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0131_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0131
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0132 : Poly :=
[
  term (-3 : Rat) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0132 : Poly :=
[
  term (-6 : Rat) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0132_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0132
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0133 : Poly :=
[
  term ((-3091 : Rat) / 120) [(7, 1), (15, 1)]
]

/-- Partial product 133 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0133 : Poly :=
[
  term ((-3091 : Rat) / 60) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((3091 : Rat) / 120) [(7, 1), (10, 2), (15, 1)],
  term ((-3091 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((3091 : Rat) / 120) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0133_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0133
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0134 : Poly :=
[
  term ((11 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0134 : Poly :=
[
  term (11 : Rat) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term (11 : Rat) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0134_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0134
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0135 : Poly :=
[
  term ((-1 : Rat) / 24) [(8, 1)]
]

/-- Partial product 135 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0135 : Poly :=
[
  term ((-1 : Rat) / 12) [(8, 1), (10, 1), (12, 1)],
  term ((1 : Rat) / 24) [(8, 1), (10, 2)],
  term ((-1 : Rat) / 12) [(8, 1), (11, 1), (13, 1)],
  term ((1 : Rat) / 24) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0135_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0135
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0136 : Poly :=
[
  term ((-1 : Rat) / 6) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 136 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0136 : Poly :=
[
  term ((-1 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1 : Rat) / 6) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 2), (13, 2)],
  term ((1 : Rat) / 6) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0136_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0136
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0137 : Poly :=
[
  term ((1 : Rat) / 3) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 137 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0137 : Poly :=
[
  term ((2 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((2 : Rat) / 3) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0137_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0137
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0138 : Poly :=
[
  term ((-49 : Rat) / 6) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 138 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0138 : Poly :=
[
  term ((-49 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((49 : Rat) / 6) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-49 : Rat) / 3) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((49 : Rat) / 6) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0138_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0138
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0139 : Poly :=
[
  term ((1 : Rat) / 12) [(8, 1), (14, 1)]
]

/-- Partial product 139 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0139 : Poly :=
[
  term ((1 : Rat) / 6) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(8, 1), (10, 2), (14, 1)],
  term ((1 : Rat) / 6) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1 : Rat) / 12) [(8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0139_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0139
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0140 : Poly :=
[
  term (-1 : Rat) [(9, 1), (11, 1)]
]

/-- Partial product 140 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0140 : Poly :=
[
  term (-2 : Rat) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term (1 : Rat) [(9, 1), (10, 2), (11, 1)],
  term (-2 : Rat) [(9, 1), (11, 2), (13, 1)],
  term (1 : Rat) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0140_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0140
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0141 : Poly :=
[
  term ((-1 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 141 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0141 : Poly :=
[
  term ((-2 : Rat) / 3) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 3) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((1 : Rat) / 3) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0141_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0141
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0142 : Poly :=
[
  term ((2 : Rat) / 3) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 142 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0142 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((4 : Rat) / 3) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0142_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0142
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0143 : Poly :=
[
  term ((-37 : Rat) / 12) [(9, 1), (13, 1)]
]

/-- Partial product 143 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0143 : Poly :=
[
  term ((-37 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((37 : Rat) / 12) [(9, 1), (10, 2), (13, 1)],
  term ((-37 : Rat) / 6) [(9, 1), (11, 1), (13, 2)],
  term ((37 : Rat) / 12) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0143_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0143
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0144 : Poly :=
[
  term ((11 : Rat) / 12) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 144 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0144 : Poly :=
[
  term ((11 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((11 : Rat) / 6) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0144_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0144
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0145 : Poly :=
[
  term (-1 : Rat) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 145 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0145 : Poly :=
[
  term (-2 : Rat) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term (1 : Rat) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term (-2 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term (1 : Rat) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0145_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0145
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0146 : Poly :=
[
  term ((-4 : Rat) / 3) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 146 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0146 : Poly :=
[
  term ((-8 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0146_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0146
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0147 : Poly :=
[
  term ((7 : Rat) / 8) [(9, 1), (15, 1)]
]

/-- Partial product 147 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0147 : Poly :=
[
  term ((7 : Rat) / 4) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7 : Rat) / 8) [(9, 1), (10, 2), (15, 1)],
  term ((7 : Rat) / 4) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7 : Rat) / 8) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0147_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0147
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0148 : Poly :=
[
  term (2 : Rat) [(9, 1), (15, 3)]
]

/-- Partial product 148 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0148 : Poly :=
[
  term (4 : Rat) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term (-2 : Rat) [(9, 1), (10, 2), (15, 3)],
  term (4 : Rat) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term (-2 : Rat) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0148_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0148
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0149 : Poly :=
[
  term ((874361 : Rat) / 9240) [(11, 1), (13, 1)]
]

/-- Partial product 149 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0149 : Poly :=
[
  term ((874361 : Rat) / 4620) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-874361 : Rat) / 9240) [(10, 2), (11, 1), (13, 1)],
  term ((874361 : Rat) / 4620) [(11, 2), (13, 2)],
  term ((-874361 : Rat) / 9240) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0149_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0149
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0150 : Poly :=
[
  term ((231337 : Rat) / 27720) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 150 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0150 : Poly :=
[
  term ((231337 : Rat) / 13860) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-231337 : Rat) / 27720) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((231337 : Rat) / 13860) [(11, 2), (13, 2), (14, 1)],
  term ((-231337 : Rat) / 27720) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0150_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0150
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0151 : Poly :=
[
  term ((1 : Rat) / 6) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 151 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0151 : Poly :=
[
  term ((1 : Rat) / 3) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1 : Rat) / 6) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((1 : Rat) / 3) [(11, 2), (13, 2), (15, 2)],
  term ((-1 : Rat) / 6) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0151_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0151
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0152 : Poly :=
[
  term ((11 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 152 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0152 : Poly :=
[
  term ((22 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((22 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11 : Rat) / 5) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0152_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0152
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0153 : Poly :=
[
  term ((-231337 : Rat) / 13860) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 153 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0153 : Poly :=
[
  term ((-231337 : Rat) / 6930) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((231337 : Rat) / 13860) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-231337 : Rat) / 6930) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((231337 : Rat) / 13860) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0153_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0153
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0154 : Poly :=
[
  term ((-391507 : Rat) / 9240) [(11, 1), (15, 1)]
]

/-- Partial product 154 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0154 : Poly :=
[
  term ((-391507 : Rat) / 4620) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((391507 : Rat) / 9240) [(10, 2), (11, 1), (15, 1)],
  term ((-391507 : Rat) / 4620) [(11, 2), (13, 1), (15, 1)],
  term ((391507 : Rat) / 9240) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0154_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0154
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0155 : Poly :=
[
  term (4 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0155 : Poly :=
[
  term (8 : Rat) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0155_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0155
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0156 : Poly :=
[
  term ((-1 : Rat) / 3) [(11, 1), (15, 3)]
]

/-- Partial product 156 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0156 : Poly :=
[
  term ((-2 : Rat) / 3) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((1 : Rat) / 3) [(10, 2), (11, 1), (15, 3)],
  term ((-2 : Rat) / 3) [(11, 2), (13, 1), (15, 3)],
  term ((1 : Rat) / 3) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0156_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0156
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0157 : Poly :=
[
  term ((-12 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 157 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0157 : Poly :=
[
  term ((-24 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 5) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0157_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0157
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0158 : Poly :=
[
  term ((-83099 : Rat) / 3080) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 158 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0158 : Poly :=
[
  term ((-83099 : Rat) / 1540) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((83099 : Rat) / 3080) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-83099 : Rat) / 1540) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((83099 : Rat) / 3080) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0158_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0158
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0159 : Poly :=
[
  term ((72 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0159 : Poly :=
[
  term ((144 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0159_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0159
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0160 : Poly :=
[
  term ((3 : Rat) / 2) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 160 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0160 : Poly :=
[
  term (3 : Rat) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3 : Rat) / 2) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term (3 : Rat) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-3 : Rat) / 2) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0160_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0160
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0161 : Poly :=
[
  term ((509497 : Rat) / 3465) [(13, 1), (15, 1)]
]

/-- Partial product 161 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0161 : Poly :=
[
  term ((1018994 : Rat) / 3465) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-509497 : Rat) / 3465) [(10, 2), (13, 1), (15, 1)],
  term ((1018994 : Rat) / 3465) [(11, 1), (13, 2), (15, 1)],
  term ((-509497 : Rat) / 3465) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0161_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0161
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0162 : Poly :=
[
  term ((-7 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0162 : Poly :=
[
  term ((-14 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 5) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 5) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7 : Rat) / 5) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0162_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0162
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0163 : Poly :=
[
  term ((3 : Rat) / 2) [(13, 1), (15, 3)]
]

/-- Partial product 163 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0163 : Poly :=
[
  term (3 : Rat) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3 : Rat) / 2) [(10, 2), (13, 1), (15, 3)],
  term (3 : Rat) [(11, 1), (13, 2), (15, 3)],
  term ((-3 : Rat) / 2) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0163_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0163
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0164 : Poly :=
[
  term (1 : Rat) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 164 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0164 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term (-1 : Rat) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term (-1 : Rat) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0164_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0164
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0165 : Poly :=
[
  term ((-49 : Rat) / 12) [(13, 2)]
]

/-- Partial product 165 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0165 : Poly :=
[
  term ((-49 : Rat) / 6) [(10, 1), (12, 1), (13, 2)],
  term ((49 : Rat) / 12) [(10, 2), (13, 2)],
  term ((-49 : Rat) / 6) [(11, 1), (13, 3)],
  term ((49 : Rat) / 12) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0165_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0165
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0166 : Poly :=
[
  term ((35 : Rat) / 2) [(13, 2), (14, 1)]
]

/-- Partial product 166 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0166 : Poly :=
[
  term (35 : Rat) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-35 : Rat) / 2) [(10, 2), (13, 2), (14, 1)],
  term (35 : Rat) [(11, 1), (13, 3), (14, 1)],
  term ((-35 : Rat) / 2) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0166_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0166
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0167 : Poly :=
[
  term (3 : Rat) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 167 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0167 : Poly :=
[
  term (6 : Rat) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term (-3 : Rat) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term (-3 : Rat) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0167_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0167
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0168 : Poly :=
[
  term ((-5370569 : Rat) / 110880) [(14, 1)]
]

/-- Partial product 168 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0168 : Poly :=
[
  term ((-5370569 : Rat) / 55440) [(10, 1), (12, 1), (14, 1)],
  term ((5370569 : Rat) / 110880) [(10, 2), (14, 1)],
  term ((-5370569 : Rat) / 55440) [(11, 1), (13, 1), (14, 1)],
  term ((5370569 : Rat) / 110880) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0168_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0168
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0169 : Poly :=
[
  term ((-613 : Rat) / 385) [(14, 1), (15, 2)]
]

/-- Partial product 169 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0169 : Poly :=
[
  term ((-1226 : Rat) / 385) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((613 : Rat) / 385) [(10, 2), (14, 1), (15, 2)],
  term ((-1226 : Rat) / 385) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((613 : Rat) / 385) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0169_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0169
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0170 : Poly :=
[
  term ((-193 : Rat) / 10) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 170 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0170 : Poly :=
[
  term ((-193 : Rat) / 5) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((193 : Rat) / 10) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-193 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((193 : Rat) / 10) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0170_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0170
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0171 : Poly :=
[
  term ((-231337 : Rat) / 55440) [(14, 2)]
]

/-- Partial product 171 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0171 : Poly :=
[
  term ((-231337 : Rat) / 27720) [(10, 1), (12, 1), (14, 2)],
  term ((231337 : Rat) / 55440) [(10, 2), (14, 2)],
  term ((-231337 : Rat) / 27720) [(11, 1), (13, 1), (14, 2)],
  term ((231337 : Rat) / 55440) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0171_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0171
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0172 : Poly :=
[
  term (-3 : Rat) [(14, 2), (15, 2)]
]

/-- Partial product 172 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0172 : Poly :=
[
  term (-6 : Rat) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term (3 : Rat) [(10, 2), (14, 2), (15, 2)],
  term (-6 : Rat) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term (3 : Rat) [(11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0172_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0172
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0173 : Poly :=
[
  term ((-734431 : Rat) / 27720) [(15, 2)]
]

/-- Partial product 173 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0173 : Poly :=
[
  term ((-734431 : Rat) / 13860) [(10, 1), (12, 1), (15, 2)],
  term ((734431 : Rat) / 27720) [(10, 2), (15, 2)],
  term ((-734431 : Rat) / 13860) [(11, 1), (13, 1), (15, 2)],
  term ((734431 : Rat) / 27720) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0173_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0173
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0174 : Poly :=
[
  term ((29 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 174 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0174 : Poly :=
[
  term ((58 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-29 : Rat) / 5) [(10, 2), (15, 2), (16, 1)],
  term ((58 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0174_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0174
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 26. -/
def rs_R014_ueqv_R014YY_coefficient_26_0175 : Poly :=
[
  term (-3 : Rat) [(15, 4)]
]

/-- Partial product 175 for generator 26. -/
def rs_R014_ueqv_R014YY_partial_26_0175 : Poly :=
[
  term (-6 : Rat) [(10, 1), (12, 1), (15, 4)],
  term (3 : Rat) [(10, 2), (15, 4)],
  term (-6 : Rat) [(11, 1), (13, 1), (15, 4)],
  term (3 : Rat) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 26. -/
theorem rs_R014_ueqv_R014YY_partial_26_0175_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_26_0175
        rs_R014_ueqv_R014YY_generator_26_0100_0175 =
      rs_R014_ueqv_R014YY_partial_26_0175 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_26_0100_0175 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_26_0100,
  rs_R014_ueqv_R014YY_partial_26_0101,
  rs_R014_ueqv_R014YY_partial_26_0102,
  rs_R014_ueqv_R014YY_partial_26_0103,
  rs_R014_ueqv_R014YY_partial_26_0104,
  rs_R014_ueqv_R014YY_partial_26_0105,
  rs_R014_ueqv_R014YY_partial_26_0106,
  rs_R014_ueqv_R014YY_partial_26_0107,
  rs_R014_ueqv_R014YY_partial_26_0108,
  rs_R014_ueqv_R014YY_partial_26_0109,
  rs_R014_ueqv_R014YY_partial_26_0110,
  rs_R014_ueqv_R014YY_partial_26_0111,
  rs_R014_ueqv_R014YY_partial_26_0112,
  rs_R014_ueqv_R014YY_partial_26_0113,
  rs_R014_ueqv_R014YY_partial_26_0114,
  rs_R014_ueqv_R014YY_partial_26_0115,
  rs_R014_ueqv_R014YY_partial_26_0116,
  rs_R014_ueqv_R014YY_partial_26_0117,
  rs_R014_ueqv_R014YY_partial_26_0118,
  rs_R014_ueqv_R014YY_partial_26_0119,
  rs_R014_ueqv_R014YY_partial_26_0120,
  rs_R014_ueqv_R014YY_partial_26_0121,
  rs_R014_ueqv_R014YY_partial_26_0122,
  rs_R014_ueqv_R014YY_partial_26_0123,
  rs_R014_ueqv_R014YY_partial_26_0124,
  rs_R014_ueqv_R014YY_partial_26_0125,
  rs_R014_ueqv_R014YY_partial_26_0126,
  rs_R014_ueqv_R014YY_partial_26_0127,
  rs_R014_ueqv_R014YY_partial_26_0128,
  rs_R014_ueqv_R014YY_partial_26_0129,
  rs_R014_ueqv_R014YY_partial_26_0130,
  rs_R014_ueqv_R014YY_partial_26_0131,
  rs_R014_ueqv_R014YY_partial_26_0132,
  rs_R014_ueqv_R014YY_partial_26_0133,
  rs_R014_ueqv_R014YY_partial_26_0134,
  rs_R014_ueqv_R014YY_partial_26_0135,
  rs_R014_ueqv_R014YY_partial_26_0136,
  rs_R014_ueqv_R014YY_partial_26_0137,
  rs_R014_ueqv_R014YY_partial_26_0138,
  rs_R014_ueqv_R014YY_partial_26_0139,
  rs_R014_ueqv_R014YY_partial_26_0140,
  rs_R014_ueqv_R014YY_partial_26_0141,
  rs_R014_ueqv_R014YY_partial_26_0142,
  rs_R014_ueqv_R014YY_partial_26_0143,
  rs_R014_ueqv_R014YY_partial_26_0144,
  rs_R014_ueqv_R014YY_partial_26_0145,
  rs_R014_ueqv_R014YY_partial_26_0146,
  rs_R014_ueqv_R014YY_partial_26_0147,
  rs_R014_ueqv_R014YY_partial_26_0148,
  rs_R014_ueqv_R014YY_partial_26_0149,
  rs_R014_ueqv_R014YY_partial_26_0150,
  rs_R014_ueqv_R014YY_partial_26_0151,
  rs_R014_ueqv_R014YY_partial_26_0152,
  rs_R014_ueqv_R014YY_partial_26_0153,
  rs_R014_ueqv_R014YY_partial_26_0154,
  rs_R014_ueqv_R014YY_partial_26_0155,
  rs_R014_ueqv_R014YY_partial_26_0156,
  rs_R014_ueqv_R014YY_partial_26_0157,
  rs_R014_ueqv_R014YY_partial_26_0158,
  rs_R014_ueqv_R014YY_partial_26_0159,
  rs_R014_ueqv_R014YY_partial_26_0160,
  rs_R014_ueqv_R014YY_partial_26_0161,
  rs_R014_ueqv_R014YY_partial_26_0162,
  rs_R014_ueqv_R014YY_partial_26_0163,
  rs_R014_ueqv_R014YY_partial_26_0164,
  rs_R014_ueqv_R014YY_partial_26_0165,
  rs_R014_ueqv_R014YY_partial_26_0166,
  rs_R014_ueqv_R014YY_partial_26_0167,
  rs_R014_ueqv_R014YY_partial_26_0168,
  rs_R014_ueqv_R014YY_partial_26_0169,
  rs_R014_ueqv_R014YY_partial_26_0170,
  rs_R014_ueqv_R014YY_partial_26_0171,
  rs_R014_ueqv_R014YY_partial_26_0172,
  rs_R014_ueqv_R014YY_partial_26_0173,
  rs_R014_ueqv_R014YY_partial_26_0174,
  rs_R014_ueqv_R014YY_partial_26_0175
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_26_0100_0175 : Poly :=
[
  term ((4 : Rat) / 3) [(3, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((2 : Rat) / 3) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term (4 : Rat) [(3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (9, 1), (10, 2), (11, 1)],
  term ((-1 : Rat) / 3) [(3, 2), (9, 1), (10, 2), (13, 1)],
  term (-2 : Rat) [(3, 2), (9, 1), (10, 2), (15, 1)],
  term (4 : Rat) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term (1 : Rat) [(3, 2), (9, 1), (11, 2), (13, 1)],
  term (-2 : Rat) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2 : Rat) / 3) [(3, 2), (9, 1), (11, 3)],
  term ((-33734 : Rat) / 1155) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (40 : Rat) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 1155) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (20 : Rat) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33734 : Rat) / 385) [(3, 2), (10, 1), (12, 1), (15, 2)],
  term (120 : Rat) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((16867 : Rat) / 1155) [(3, 2), (10, 2), (11, 1), (15, 1)],
  term (-20 : Rat) [(3, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((16867 : Rat) / 2310) [(3, 2), (10, 2), (13, 1), (15, 1)],
  term (-10 : Rat) [(3, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((16867 : Rat) / 385) [(3, 2), (10, 2), (15, 2)],
  term (-60 : Rat) [(3, 2), (10, 2), (15, 2), (16, 1)],
  term ((-33734 : Rat) / 385) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term (120 : Rat) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16867 : Rat) / 1155) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term (20 : Rat) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16867 : Rat) / 770) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term (30 : Rat) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((16867 : Rat) / 385) [(3, 2), (11, 2), (15, 2)],
  term (-60 : Rat) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((16867 : Rat) / 1155) [(3, 2), (11, 3), (15, 1)],
  term (-20 : Rat) [(3, 2), (11, 3), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (10, 2), (13, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (10, 2), (15, 1)],
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (11, 2), (13, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term (-3 : Rat) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((172 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (-42 : Rat) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term (6 : Rat) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((3 : Rat) / 2) [(4, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-86 : Rat) / 3) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term (21 : Rat) [(4, 1), (10, 2), (13, 2)],
  term (-3 : Rat) [(4, 1), (10, 2), (14, 1), (15, 2)],
  term ((4 : Rat) / 3) [(4, 1), (10, 2), (15, 2)],
  term (6 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term (-3 : Rat) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((172 : Rat) / 3) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term (-42 : Rat) [(4, 1), (11, 1), (13, 3)],
  term ((3 : Rat) / 2) [(4, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-86 : Rat) / 3) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term (21 : Rat) [(4, 1), (11, 2), (13, 2)],
  term (-3 : Rat) [(4, 1), (11, 2), (14, 1), (15, 2)],
  term ((4 : Rat) / 3) [(4, 1), (11, 2), (15, 2)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-1 : Rat) / 3) [(5, 1), (7, 1), (10, 2)],
  term ((2 : Rat) / 3) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(5, 1), (7, 1), (11, 2)],
  term (21 : Rat) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((3 : Rat) / 2) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-902081 : Rat) / 2310) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-21 : Rat) / 2) [(5, 1), (10, 2), (13, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((902081 : Rat) / 4620) [(5, 1), (10, 2), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-902081 : Rat) / 2310) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term (21 : Rat) [(5, 1), (11, 1), (13, 2)],
  term ((-21 : Rat) / 2) [(5, 1), (11, 2), (13, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((902081 : Rat) / 4620) [(5, 1), (11, 2), (15, 1)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (9, 1), (10, 2)],
  term ((4 : Rat) / 3) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (9, 1), (11, 2)],
  term ((4 : Rat) / 3) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-77 : Rat) / 30) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((14 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((1 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((152 : Rat) / 15) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-629 : Rat) / 30) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term (6 : Rat) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((637 : Rat) / 20) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3091 : Rat) / 60) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term (11 : Rat) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (10, 2), (11, 1)],
  term ((77 : Rat) / 60) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((-1 : Rat) / 4) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-76 : Rat) / 15) [(7, 1), (10, 2), (13, 1)],
  term ((629 : Rat) / 60) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term (-3 : Rat) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((7 : Rat) / 12) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((11 : Rat) / 4) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((7 : Rat) / 4) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((-637 : Rat) / 40) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term (3 : Rat) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((3091 : Rat) / 120) [(7, 1), (10, 2), (15, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((637 : Rat) / 20) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3091 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term (11 : Rat) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 15) [(7, 1), (11, 1), (13, 2)],
  term ((-629 : Rat) / 30) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term (6 : Rat) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((-56 : Rat) / 15) [(7, 1), (11, 2), (13, 1)],
  term ((629 : Rat) / 60) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term (-3 : Rat) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((203 : Rat) / 60) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((13 : Rat) / 4) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-49 : Rat) / 60) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-637 : Rat) / 40) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term (3 : Rat) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((3091 : Rat) / 120) [(7, 1), (11, 2), (15, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 1), (11, 3)],
  term ((77 : Rat) / 60) [(7, 1), (11, 3), (13, 1), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 3), (15, 2)],
  term ((-1 : Rat) / 4) [(7, 1), (11, 3), (16, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((2 : Rat) / 3) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1 : Rat) / 12) [(8, 1), (10, 1), (12, 1)],
  term ((-49 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 6) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((1 : Rat) / 24) [(8, 1), (10, 2)],
  term ((1 : Rat) / 6) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((49 : Rat) / 6) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 12) [(8, 1), (10, 2), (14, 1)],
  term ((-1 : Rat) / 12) [(8, 1), (11, 1), (13, 1)],
  term ((1 : Rat) / 6) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-49 : Rat) / 3) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((1 : Rat) / 24) [(8, 1), (11, 2)],
  term ((53 : Rat) / 6) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 2), (13, 2)],
  term ((-1 : Rat) / 12) [(8, 1), (11, 2), (14, 1)],
  term ((1 : Rat) / 6) [(8, 1), (11, 3), (13, 1)],
  term ((-1 : Rat) / 3) [(8, 1), (11, 3), (15, 1)],
  term (-2 : Rat) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-37 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((11 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term (-2 : Rat) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 4) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term (4 : Rat) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term (1 : Rat) [(9, 1), (10, 2), (11, 1)],
  term ((1 : Rat) / 3) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((37 : Rat) / 12) [(9, 1), (10, 2), (13, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term (1 : Rat) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((4 : Rat) / 3) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-7 : Rat) / 8) [(9, 1), (10, 2), (15, 1)],
  term (-2 : Rat) [(9, 1), (10, 2), (15, 3)],
  term ((-8 : Rat) / 3) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 4) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-37 : Rat) / 6) [(9, 1), (11, 1), (13, 2)],
  term ((11 : Rat) / 6) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term (-2 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((13 : Rat) / 12) [(9, 1), (11, 2), (13, 1)],
  term ((-11 : Rat) / 12) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((7 : Rat) / 3) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((4 : Rat) / 3) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7 : Rat) / 8) [(9, 1), (11, 2), (15, 1)],
  term (-2 : Rat) [(9, 1), (11, 2), (15, 3)],
  term (1 : Rat) [(9, 1), (11, 3)],
  term ((1 : Rat) / 3) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(9, 1), (11, 3), (15, 2)],
  term ((874361 : Rat) / 4620) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((231337 : Rat) / 13860) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1 : Rat) / 3) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((22 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 6930) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-391507 : Rat) / 4620) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term (8 : Rat) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-24 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-83099 : Rat) / 1540) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((144 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1018994 : Rat) / 3465) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14 : Rat) / 5) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term (2 : Rat) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-49 : Rat) / 6) [(10, 1), (12, 1), (13, 2)],
  term (35 : Rat) [(10, 1), (12, 1), (13, 2), (14, 1)],
  term (6 : Rat) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5370569 : Rat) / 55440) [(10, 1), (12, 1), (14, 1)],
  term ((-1226 : Rat) / 385) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-193 : Rat) / 5) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 27720) [(10, 1), (12, 1), (14, 2)],
  term (-6 : Rat) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-734431 : Rat) / 13860) [(10, 1), (12, 1), (15, 2)],
  term ((58 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(10, 1), (12, 1), (15, 4)],
  term ((-874361 : Rat) / 9240) [(10, 2), (11, 1), (13, 1)],
  term ((-231337 : Rat) / 27720) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1 : Rat) / 6) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-11 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((231337 : Rat) / 13860) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((391507 : Rat) / 9240) [(10, 2), (11, 1), (15, 1)],
  term (-4 : Rat) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(10, 2), (11, 1), (15, 3)],
  term ((12 : Rat) / 5) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((83099 : Rat) / 3080) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-509497 : Rat) / 3465) [(10, 2), (13, 1), (15, 1)],
  term ((7 : Rat) / 5) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(10, 2), (13, 1), (15, 3)],
  term (-1 : Rat) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((49 : Rat) / 12) [(10, 2), (13, 2)],
  term ((-35 : Rat) / 2) [(10, 2), (13, 2), (14, 1)],
  term (-3 : Rat) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((5370569 : Rat) / 110880) [(10, 2), (14, 1)],
  term ((613 : Rat) / 385) [(10, 2), (14, 1), (15, 2)],
  term ((193 : Rat) / 10) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((231337 : Rat) / 55440) [(10, 2), (14, 2)],
  term (3 : Rat) [(10, 2), (14, 2), (15, 2)],
  term ((734431 : Rat) / 27720) [(10, 2), (15, 2)],
  term ((-29 : Rat) / 5) [(10, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(10, 2), (15, 4)],
  term ((-5370569 : Rat) / 55440) [(11, 1), (13, 1), (14, 1)],
  term ((-1226 : Rat) / 385) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-193 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 27720) [(11, 1), (13, 1), (14, 2)],
  term (-6 : Rat) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-734431 : Rat) / 13860) [(11, 1), (13, 1), (15, 2)],
  term ((58 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(11, 1), (13, 1), (15, 4)],
  term ((-83099 : Rat) / 1540) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((144 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((1018994 : Rat) / 3465) [(11, 1), (13, 2), (15, 1)],
  term ((-14 : Rat) / 5) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 2), (15, 3)],
  term (2 : Rat) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-49 : Rat) / 6) [(11, 1), (13, 3)],
  term (35 : Rat) [(11, 1), (13, 3), (14, 1)],
  term (6 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-25351 : Rat) / 3960) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3212509 : Rat) / 13860) [(11, 2), (13, 1), (15, 1)],
  term ((47 : Rat) / 5) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13 : Rat) / 6) [(11, 2), (13, 1), (15, 3)],
  term ((-29 : Rat) / 5) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((148871 : Rat) / 770) [(11, 2), (13, 2)],
  term ((-11213 : Rat) / 13860) [(11, 2), (13, 2), (14, 1)],
  term ((1 : Rat) / 3) [(11, 2), (13, 2), (15, 2)],
  term ((7 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((5370569 : Rat) / 110880) [(11, 2), (14, 1)],
  term ((613 : Rat) / 385) [(11, 2), (14, 1), (15, 2)],
  term ((193 : Rat) / 10) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((231337 : Rat) / 55440) [(11, 2), (14, 2)],
  term (3 : Rat) [(11, 2), (14, 2), (15, 2)],
  term ((734431 : Rat) / 27720) [(11, 2), (15, 2)],
  term ((-29 : Rat) / 5) [(11, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(11, 2), (15, 4)],
  term ((-874361 : Rat) / 9240) [(11, 3), (13, 1)],
  term ((-231337 : Rat) / 27720) [(11, 3), (13, 1), (14, 1)],
  term ((-1 : Rat) / 6) [(11, 3), (13, 1), (15, 2)],
  term ((-11 : Rat) / 5) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((231337 : Rat) / 13860) [(11, 3), (14, 1), (15, 1)],
  term ((391507 : Rat) / 9240) [(11, 3), (15, 1)],
  term (-4 : Rat) [(11, 3), (15, 1), (16, 1)],
  term ((1 : Rat) / 3) [(11, 3), (15, 3)],
  term ((12 : Rat) / 5) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 100 through 175. -/
theorem rs_R014_ueqv_R014YY_block_26_0100_0175_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_26_0100_0175
      rs_R014_ueqv_R014YY_block_26_0100_0175 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
