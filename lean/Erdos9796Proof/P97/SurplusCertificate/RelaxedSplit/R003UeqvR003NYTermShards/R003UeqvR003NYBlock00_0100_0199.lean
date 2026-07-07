/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 0:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 0 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_00_0100_0199 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0100 : Poly :=
[
  term ((-84 : Rat) / 13) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0100 : Poly :=
[
  term ((-84 : Rat) / 13) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 13) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 13) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0100_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0100
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0101 : Poly :=
[
  term ((4020 : Rat) / 299) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 101 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0101 : Poly :=
[
  term ((4020 : Rat) / 299) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((-4020 : Rat) / 299) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((-4020 : Rat) / 299) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((4020 : Rat) / 299) [(0, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0101_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0101
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0102 : Poly :=
[
  term ((3262 : Rat) / 299) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 102 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0102 : Poly :=
[
  term ((3262 : Rat) / 299) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-3262 : Rat) / 299) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-3262 : Rat) / 299) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((3262 : Rat) / 299) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0102_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0102
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0103 : Poly :=
[
  term ((-840 : Rat) / 299) [(0, 1), (14, 2), (16, 1)]
]

/-- Partial product 103 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0103 : Poly :=
[
  term ((-840 : Rat) / 299) [(0, 1), (1, 2), (14, 2), (16, 1)],
  term ((840 : Rat) / 299) [(0, 1), (2, 2), (14, 2), (16, 1)],
  term ((840 : Rat) / 299) [(0, 1), (3, 2), (14, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0103_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0103
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0104 : Poly :=
[
  term ((-660 : Rat) / 299) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0104 : Poly :=
[
  term ((-660 : Rat) / 299) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0104_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0104
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0105 : Poly :=
[
  term ((-1252 : Rat) / 299) [(0, 1), (16, 1)]
]

/-- Partial product 105 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0105 : Poly :=
[
  term ((-1252 : Rat) / 299) [(0, 1), (1, 2), (16, 1)],
  term ((1252 : Rat) / 299) [(0, 1), (2, 2), (16, 1)],
  term ((1252 : Rat) / 299) [(0, 1), (3, 2), (16, 1)],
  term ((-1252 : Rat) / 299) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0105_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0105
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0106 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0106 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 2), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (3, 3), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 4), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0106_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0106
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0107 : Poly :=
[
  term ((-720 : Rat) / 299) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0107 : Poly :=
[
  term ((-720 : Rat) / 299) [(0, 2), (1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 2), (2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 2), (3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 4), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0107_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0107
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0108 : Poly :=
[
  term ((360 : Rat) / 299) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0108 : Poly :=
[
  term ((360 : Rat) / 299) [(0, 2), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 2), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 4), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0108_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0108
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0109 : Poly :=
[
  term ((-1320 : Rat) / 299) [(0, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 109 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0109 : Poly :=
[
  term ((-1320 : Rat) / 299) [(0, 2), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 4), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0109_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0109
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0110 : Poly :=
[
  term ((-360 : Rat) / 299) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0110 : Poly :=
[
  term ((-360 : Rat) / 299) [(0, 2), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0110_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0110
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0111 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0111 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 2), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 4), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0111_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0111
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0112 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0112 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 2), (1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 4), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0112_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0112
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0113 : Poly :=
[
  term ((-1680 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0113 : Poly :=
[
  term ((-1680 : Rat) / 299) [(0, 2), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(0, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0113_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0113
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0114 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 2), (11, 2), (16, 1)]
]

/-- Partial product 114 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0114 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 2), (1, 2), (11, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 2), (11, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (3, 2), (11, 2), (16, 1)],
  term ((240 : Rat) / 299) [(0, 4), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0114_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0114
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0115 : Poly :=
[
  term ((-6120 : Rat) / 299) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0115 : Poly :=
[
  term ((-6120 : Rat) / 299) [(0, 2), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((6120 : Rat) / 299) [(0, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((6120 : Rat) / 299) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6120 : Rat) / 299) [(0, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0115_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0115
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0116 : Poly :=
[
  term ((660 : Rat) / 299) [(0, 2), (14, 1), (16, 1)]
]

/-- Partial product 116 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0116 : Poly :=
[
  term ((660 : Rat) / 299) [(0, 2), (1, 2), (14, 1), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((660 : Rat) / 299) [(0, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0116_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0116
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0117 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0117 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (2, 2), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0117_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0117
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0118 : Poly :=
[
  term ((-660 : Rat) / 299) [(0, 2), (16, 1)]
]

/-- Partial product 118 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0118 : Poly :=
[
  term ((-660 : Rat) / 299) [(0, 2), (1, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 2), (2, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 2), (3, 2), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0118_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0118
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0119 : Poly :=
[
  term ((-1980 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (16, 1)]
]

/-- Partial product 119 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0119 : Poly :=
[
  term ((-1980 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((1980 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (9, 1), (16, 1)],
  term ((1980 : Rat) / 299) [(1, 1), (2, 3), (9, 1), (16, 1)],
  term ((-1980 : Rat) / 299) [(1, 3), (2, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0119_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0119
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0120 : Poly :=
[
  term ((360 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 120 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0120 : Poly :=
[
  term ((360 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 1), (2, 3), (11, 1), (16, 1)],
  term ((360 : Rat) / 299) [(1, 3), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0120_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0120
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0121 : Poly :=
[
  term ((-1800 : Rat) / 299) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0121 : Poly :=
[
  term ((-1800 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 3), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0121_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0121
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0122 : Poly :=
[
  term ((1620 : Rat) / 299) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0122 : Poly :=
[
  term ((1620 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-1620 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((-1620 : Rat) / 299) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((1620 : Rat) / 299) [(1, 3), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0122_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0122
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0123 : Poly :=
[
  term ((-1080 : Rat) / 299) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0123 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 1), (2, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 3), (2, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0123_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0123
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0124 : Poly :=
[
  term ((1968 : Rat) / 299) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0124 : Poly :=
[
  term ((1968 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-1968 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1968 : Rat) / 299) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((1968 : Rat) / 299) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0124_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0124
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0125 : Poly :=
[
  term ((1800 : Rat) / 299) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0125 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 2), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 2), (3, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 4), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 3), (2, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0125_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0125
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0126 : Poly :=
[
  term ((108 : Rat) / 13) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 126 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0126 : Poly :=
[
  term ((108 : Rat) / 13) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(1, 1), (3, 3), (16, 1)],
  term ((108 : Rat) / 13) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0126_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0126
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0127 : Poly :=
[
  term ((42 : Rat) / 13) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 127 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0127 : Poly :=
[
  term ((42 : Rat) / 13) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-42 : Rat) / 13) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-42 : Rat) / 13) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((42 : Rat) / 13) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0127_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0127
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0128 : Poly :=
[
  term ((-1884 : Rat) / 299) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 128 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0128 : Poly :=
[
  term ((-1884 : Rat) / 299) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((1884 : Rat) / 299) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((1884 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1884 : Rat) / 299) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0128_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0128
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0129 : Poly :=
[
  term ((24 : Rat) / 13) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0129 : Poly :=
[
  term ((24 : Rat) / 13) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0129_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0129
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0130 : Poly :=
[
  term ((72 : Rat) / 13) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0130 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0130_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0130
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0131 : Poly :=
[
  term ((-480 : Rat) / 299) [(2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 131 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0131 : Poly :=
[
  term ((-480 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0131_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0131
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0132 : Poly :=
[
  term ((480 : Rat) / 299) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 132 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0132 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (8, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0132_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0132
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0133 : Poly :=
[
  term ((240 : Rat) / 299) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 133 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0133 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0133_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0133
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0134 : Poly :=
[
  term ((-240 : Rat) / 299) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 134 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0134 : Poly :=
[
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0134_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0134
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0135 : Poly :=
[
  term ((1680 : Rat) / 299) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 135 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0135 : Poly :=
[
  term ((1680 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (3, 3), (7, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 3), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0135_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0135
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0136 : Poly :=
[
  term ((480 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 136 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0136 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0136_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0136
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0137 : Poly :=
[
  term ((-240 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 137 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0137 : Poly :=
[
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (11, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0137_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0137
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0138 : Poly :=
[
  term ((7200 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 138 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0138 : Poly :=
[
  term ((7200 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0138_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0138
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0139 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 139 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0139 : Poly :=
[
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0139_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0139
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0140 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0140 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0140_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0140
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0141 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0141 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0141_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0141
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0142 : Poly :=
[
  term ((-1920 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 142 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0142 : Poly :=
[
  term ((-1920 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 1), (3, 3), (9, 1), (14, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 3), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0142_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0142
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0143 : Poly :=
[
  term ((84 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 143 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0143 : Poly :=
[
  term ((84 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((84 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-84 : Rat) / 299) [(2, 1), (3, 3), (9, 1), (16, 1)],
  term ((-84 : Rat) / 299) [(2, 3), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0143_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0143
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0144 : Poly :=
[
  term ((-240 : Rat) / 299) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 144 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0144 : Poly :=
[
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (3, 3), (11, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 3), (3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0144_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0144
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0145 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0145 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0145_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0145
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0146 : Poly :=
[
  term ((-7200 : Rat) / 299) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 146 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0146 : Poly :=
[
  term ((-7200 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (3, 3), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 3), (3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0146_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0146
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0147 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0147 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (3, 3), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 3), (3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0147_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0147
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0148 : Poly :=
[
  term ((5820 : Rat) / 299) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0148 : Poly :=
[
  term ((5820 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((5820 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-5820 : Rat) / 299) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((-5820 : Rat) / 299) [(2, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0148_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0148
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0149 : Poly :=
[
  term ((-8640 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0149 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0149_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0149
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0150 : Poly :=
[
  term ((8640 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0150 : Poly :=
[
  term ((8640 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0150_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0150
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0151 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0151 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0151_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0151
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0152 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0152 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0152_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0152
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0153 : Poly :=
[
  term ((12960 : Rat) / 299) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0153 : Poly :=
[
  term ((12960 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((12960 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12960 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12960 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0153_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0153
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0154 : Poly :=
[
  term ((960 : Rat) / 299) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 154 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0154 : Poly :=
[
  term ((960 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((960 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0154_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0154
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0155 : Poly :=
[
  term ((-480 : Rat) / 299) [(2, 1), (5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0155 : Poly :=
[
  term ((-480 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0155_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0155
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0156 : Poly :=
[
  term ((-720 : Rat) / 299) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0156 : Poly :=
[
  term ((-720 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0156_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0156
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0157 : Poly :=
[
  term ((-6720 : Rat) / 299) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0157 : Poly :=
[
  term ((-6720 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6720 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((6720 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((6720 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0157_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0157
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0158 : Poly :=
[
  term ((-8640 : Rat) / 299) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0158 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0158_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0158
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0159 : Poly :=
[
  term ((1320 : Rat) / 299) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 159 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0159 : Poly :=
[
  term ((1320 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 3), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0159_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0159
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0160 : Poly :=
[
  term ((360 : Rat) / 299) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0160 : Poly :=
[
  term ((360 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 3), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0160_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0160
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0161 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0161 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0161_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0161
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0162 : Poly :=
[
  term ((8640 : Rat) / 299) [(2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0162 : Poly :=
[
  term ((8640 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 3), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0162_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0162
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0163 : Poly :=
[
  term ((-8640 : Rat) / 299) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0163 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0163_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0163
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0164 : Poly :=
[
  term ((-34560 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0164 : Poly :=
[
  term ((-34560 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34560 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((34560 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((34560 : Rat) / 299) [(2, 3), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0164_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0164
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0165 : Poly :=
[
  term ((36720 : Rat) / 299) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0165 : Poly :=
[
  term ((36720 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((36720 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-36720 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-36720 : Rat) / 299) [(2, 3), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0165_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0165
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0166 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0166 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0166_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0166
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0167 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0167 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0167_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0167
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0168 : Poly :=
[
  term ((-2462 : Rat) / 299) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 168 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0168 : Poly :=
[
  term ((-2462 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (16, 1)],
  term ((-2462 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((2462 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (16, 1)],
  term ((2462 : Rat) / 299) [(2, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0168_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0168
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0169 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0169 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 3), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0169_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0169
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0170 : Poly :=
[
  term ((1080 : Rat) / 299) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0170 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0170_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0170
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0171 : Poly :=
[
  term ((-12960 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0171 : Poly :=
[
  term ((-12960 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12960 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12960 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12960 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0171_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0171
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0172 : Poly :=
[
  term ((-960 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 172 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0172 : Poly :=
[
  term ((-960 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((960 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((960 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0172_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0172
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0173 : Poly :=
[
  term ((1440 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 173 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0173 : Poly :=
[
  term ((1440 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0173_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0173
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0174 : Poly :=
[
  term ((7080 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0174 : Poly :=
[
  term ((7080 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7080 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7080 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7080 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0174_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0174
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0175 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0175 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0175_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0175
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0176 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0176 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 3), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0176_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0176
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0177 : Poly :=
[
  term ((-7200 : Rat) / 299) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 177 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0177 : Poly :=
[
  term ((-7200 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 3), (8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0177_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0177
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0178 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 178 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0178 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0178_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0178
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0179 : Poly :=
[
  term ((840 : Rat) / 299) [(2, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 179 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0179 : Poly :=
[
  term ((840 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 3), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0179_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0179
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0180 : Poly :=
[
  term ((-964 : Rat) / 299) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 180 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0180 : Poly :=
[
  term ((-964 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (16, 1)],
  term ((-964 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (16, 1)],
  term ((964 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (16, 1)],
  term ((964 : Rat) / 299) [(2, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0180_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0180
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0181 : Poly :=
[
  term ((-1920 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 181 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0181 : Poly :=
[
  term ((-1920 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 3), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0181_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0181
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0182 : Poly :=
[
  term ((124 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 182 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0182 : Poly :=
[
  term ((124 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((124 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-124 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-124 : Rat) / 299) [(2, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0182_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0182
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0183 : Poly :=
[
  term ((7200 : Rat) / 299) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 183 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0183 : Poly :=
[
  term ((7200 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0183_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0183
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0184 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 184 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0184 : Poly :=
[
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 3), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0184_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0184
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0185 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0185 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0185_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0185
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0186 : Poly :=
[
  term ((2160 : Rat) / 13) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0186 : Poly :=
[
  term ((2160 : Rat) / 13) [(0, 2), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 13) [(1, 2), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 13) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 13) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0186_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0186
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0187 : Poly :=
[
  term ((576 : Rat) / 13) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 187 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0187 : Poly :=
[
  term ((576 : Rat) / 13) [(0, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 13) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 13) [(2, 1), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 13) [(2, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0187_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0187
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0188 : Poly :=
[
  term ((-1272 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 188 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0188 : Poly :=
[
  term ((-1272 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1272 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((1272 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((1272 : Rat) / 299) [(2, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0188_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0188
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0189 : Poly :=
[
  term ((6120 : Rat) / 299) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0189 : Poly :=
[
  term ((6120 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6120 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6120 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6120 : Rat) / 299) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0189_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0189
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0190 : Poly :=
[
  term ((-45360 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0190 : Poly :=
[
  term ((-45360 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-45360 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((45360 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((45360 : Rat) / 299) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0190_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0190
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0191 : Poly :=
[
  term ((480 : Rat) / 299) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 191 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0191 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 2), (2, 1), (9, 2), (16, 1)],
  term ((480 : Rat) / 299) [(1, 2), (2, 1), (9, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (3, 2), (9, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0191_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0191
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0192 : Poly :=
[
  term ((360 : Rat) / 23) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 192 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0192 : Poly :=
[
  term ((360 : Rat) / 23) [(0, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((360 : Rat) / 23) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(2, 1), (3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(2, 3), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0192_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0192
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0193 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0193 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0193_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0193
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0194 : Poly :=
[
  term ((360 : Rat) / 13) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0194 : Poly :=
[
  term ((360 : Rat) / 13) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 13) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 13) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 13) [(2, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0194_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0194
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0195 : Poly :=
[
  term ((-1320 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 195 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0195 : Poly :=
[
  term ((-1320 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0195_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0195
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0196 : Poly :=
[
  term ((-72 : Rat) / 23) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 196 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0196 : Poly :=
[
  term ((-72 : Rat) / 23) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 23) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 23) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 23) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0196_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0196
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0197 : Poly :=
[
  term ((-2224 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0197 : Poly :=
[
  term ((-2224 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2224 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((2224 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((2224 : Rat) / 299) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0197_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0197
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0198 : Poly :=
[
  term ((240 : Rat) / 299) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 198 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0198 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 2), (2, 1), (11, 2), (12, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 2), (2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (3, 2), (11, 2), (12, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 3), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0198_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0198
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 0. -/
def rs_R003_ueqv_R003NY_coefficient_00_0199 : Poly :=
[
  term ((840 : Rat) / 299) [(2, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 199 for generator 0. -/
def rs_R003_ueqv_R003NY_partial_00_0199 : Poly :=
[
  term ((840 : Rat) / 299) [(0, 2), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(1, 2), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 0. -/
theorem rs_R003_ueqv_R003NY_partial_00_0199_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_00_0199
        rs_R003_ueqv_R003NY_generator_00_0100_0199 =
      rs_R003_ueqv_R003NY_partial_00_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_00_0100_0199 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_00_0100,
  rs_R003_ueqv_R003NY_partial_00_0101,
  rs_R003_ueqv_R003NY_partial_00_0102,
  rs_R003_ueqv_R003NY_partial_00_0103,
  rs_R003_ueqv_R003NY_partial_00_0104,
  rs_R003_ueqv_R003NY_partial_00_0105,
  rs_R003_ueqv_R003NY_partial_00_0106,
  rs_R003_ueqv_R003NY_partial_00_0107,
  rs_R003_ueqv_R003NY_partial_00_0108,
  rs_R003_ueqv_R003NY_partial_00_0109,
  rs_R003_ueqv_R003NY_partial_00_0110,
  rs_R003_ueqv_R003NY_partial_00_0111,
  rs_R003_ueqv_R003NY_partial_00_0112,
  rs_R003_ueqv_R003NY_partial_00_0113,
  rs_R003_ueqv_R003NY_partial_00_0114,
  rs_R003_ueqv_R003NY_partial_00_0115,
  rs_R003_ueqv_R003NY_partial_00_0116,
  rs_R003_ueqv_R003NY_partial_00_0117,
  rs_R003_ueqv_R003NY_partial_00_0118,
  rs_R003_ueqv_R003NY_partial_00_0119,
  rs_R003_ueqv_R003NY_partial_00_0120,
  rs_R003_ueqv_R003NY_partial_00_0121,
  rs_R003_ueqv_R003NY_partial_00_0122,
  rs_R003_ueqv_R003NY_partial_00_0123,
  rs_R003_ueqv_R003NY_partial_00_0124,
  rs_R003_ueqv_R003NY_partial_00_0125,
  rs_R003_ueqv_R003NY_partial_00_0126,
  rs_R003_ueqv_R003NY_partial_00_0127,
  rs_R003_ueqv_R003NY_partial_00_0128,
  rs_R003_ueqv_R003NY_partial_00_0129,
  rs_R003_ueqv_R003NY_partial_00_0130,
  rs_R003_ueqv_R003NY_partial_00_0131,
  rs_R003_ueqv_R003NY_partial_00_0132,
  rs_R003_ueqv_R003NY_partial_00_0133,
  rs_R003_ueqv_R003NY_partial_00_0134,
  rs_R003_ueqv_R003NY_partial_00_0135,
  rs_R003_ueqv_R003NY_partial_00_0136,
  rs_R003_ueqv_R003NY_partial_00_0137,
  rs_R003_ueqv_R003NY_partial_00_0138,
  rs_R003_ueqv_R003NY_partial_00_0139,
  rs_R003_ueqv_R003NY_partial_00_0140,
  rs_R003_ueqv_R003NY_partial_00_0141,
  rs_R003_ueqv_R003NY_partial_00_0142,
  rs_R003_ueqv_R003NY_partial_00_0143,
  rs_R003_ueqv_R003NY_partial_00_0144,
  rs_R003_ueqv_R003NY_partial_00_0145,
  rs_R003_ueqv_R003NY_partial_00_0146,
  rs_R003_ueqv_R003NY_partial_00_0147,
  rs_R003_ueqv_R003NY_partial_00_0148,
  rs_R003_ueqv_R003NY_partial_00_0149,
  rs_R003_ueqv_R003NY_partial_00_0150,
  rs_R003_ueqv_R003NY_partial_00_0151,
  rs_R003_ueqv_R003NY_partial_00_0152,
  rs_R003_ueqv_R003NY_partial_00_0153,
  rs_R003_ueqv_R003NY_partial_00_0154,
  rs_R003_ueqv_R003NY_partial_00_0155,
  rs_R003_ueqv_R003NY_partial_00_0156,
  rs_R003_ueqv_R003NY_partial_00_0157,
  rs_R003_ueqv_R003NY_partial_00_0158,
  rs_R003_ueqv_R003NY_partial_00_0159,
  rs_R003_ueqv_R003NY_partial_00_0160,
  rs_R003_ueqv_R003NY_partial_00_0161,
  rs_R003_ueqv_R003NY_partial_00_0162,
  rs_R003_ueqv_R003NY_partial_00_0163,
  rs_R003_ueqv_R003NY_partial_00_0164,
  rs_R003_ueqv_R003NY_partial_00_0165,
  rs_R003_ueqv_R003NY_partial_00_0166,
  rs_R003_ueqv_R003NY_partial_00_0167,
  rs_R003_ueqv_R003NY_partial_00_0168,
  rs_R003_ueqv_R003NY_partial_00_0169,
  rs_R003_ueqv_R003NY_partial_00_0170,
  rs_R003_ueqv_R003NY_partial_00_0171,
  rs_R003_ueqv_R003NY_partial_00_0172,
  rs_R003_ueqv_R003NY_partial_00_0173,
  rs_R003_ueqv_R003NY_partial_00_0174,
  rs_R003_ueqv_R003NY_partial_00_0175,
  rs_R003_ueqv_R003NY_partial_00_0176,
  rs_R003_ueqv_R003NY_partial_00_0177,
  rs_R003_ueqv_R003NY_partial_00_0178,
  rs_R003_ueqv_R003NY_partial_00_0179,
  rs_R003_ueqv_R003NY_partial_00_0180,
  rs_R003_ueqv_R003NY_partial_00_0181,
  rs_R003_ueqv_R003NY_partial_00_0182,
  rs_R003_ueqv_R003NY_partial_00_0183,
  rs_R003_ueqv_R003NY_partial_00_0184,
  rs_R003_ueqv_R003NY_partial_00_0185,
  rs_R003_ueqv_R003NY_partial_00_0186,
  rs_R003_ueqv_R003NY_partial_00_0187,
  rs_R003_ueqv_R003NY_partial_00_0188,
  rs_R003_ueqv_R003NY_partial_00_0189,
  rs_R003_ueqv_R003NY_partial_00_0190,
  rs_R003_ueqv_R003NY_partial_00_0191,
  rs_R003_ueqv_R003NY_partial_00_0192,
  rs_R003_ueqv_R003NY_partial_00_0193,
  rs_R003_ueqv_R003NY_partial_00_0194,
  rs_R003_ueqv_R003NY_partial_00_0195,
  rs_R003_ueqv_R003NY_partial_00_0196,
  rs_R003_ueqv_R003NY_partial_00_0197,
  rs_R003_ueqv_R003NY_partial_00_0198,
  rs_R003_ueqv_R003NY_partial_00_0199
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_00_0100_0199 : Poly :=
[
  term ((-84 : Rat) / 13) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((4020 : Rat) / 299) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((3262 : Rat) / 299) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 1), (1, 2), (14, 2), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-1252 : Rat) / 299) [(0, 1), (1, 2), (16, 1)],
  term ((84 : Rat) / 13) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4020 : Rat) / 299) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((-3262 : Rat) / 299) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(0, 1), (2, 2), (14, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((1252 : Rat) / 299) [(0, 1), (2, 2), (16, 1)],
  term ((84 : Rat) / 13) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4020 : Rat) / 299) [(0, 1), (3, 2), (13, 2), (16, 1)],
  term ((-3262 : Rat) / 299) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(0, 1), (3, 2), (14, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((1252 : Rat) / 299) [(0, 1), (3, 2), (16, 1)],
  term ((-1980 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((1620 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((1968 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((108 : Rat) / 13) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((42 : Rat) / 13) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-1884 : Rat) / 299) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 2), (1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 2), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 2), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(0, 2), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 2), (1, 2), (11, 2), (16, 1)],
  term ((-6120 : Rat) / 299) [(0, 2), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((660 : Rat) / 299) [(0, 2), (1, 2), (14, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 2), (1, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((5820 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((12960 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6720 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34560 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((36720 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2462 : Rat) / 299) [(0, 2), (2, 1), (6, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12960 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((7080 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((840 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-964 : Rat) / 299) [(0, 2), (2, 1), (8, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((124 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 13) [(0, 2), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 13) [(0, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1272 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((6120 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45360 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 2), (2, 1), (9, 2), (16, 1)],
  term ((360 : Rat) / 23) [(0, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 13) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 23) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2224 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 2), (2, 1), (11, 2), (12, 1), (16, 1)],
  term ((840 : Rat) / 299) [(0, 2), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 2), (2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 2), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 2), (11, 2), (16, 1)],
  term ((6120 : Rat) / 299) [(0, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 2), (2, 2), (14, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (2, 2), (15, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 2), (2, 2), (16, 1)],
  term ((720 : Rat) / 299) [(0, 2), (3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (3, 2), (11, 2), (16, 1)],
  term ((6120 : Rat) / 299) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((660 : Rat) / 299) [(0, 2), (3, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (3, 3), (15, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((4020 : Rat) / 299) [(0, 3), (13, 2), (16, 1)],
  term ((3262 : Rat) / 299) [(0, 3), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 3), (14, 2), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 3), (15, 2), (16, 1)],
  term ((-1252 : Rat) / 299) [(0, 3), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 4), (3, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 4), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 4), (5, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 4), (9, 1), (11, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 4), (9, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 4), (11, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 4), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(0, 4), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 4), (11, 2), (16, 1)],
  term ((-6120 : Rat) / 299) [(0, 4), (13, 1), (15, 1), (16, 1)],
  term ((660 : Rat) / 299) [(0, 4), (14, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 4), (15, 2), (16, 1)],
  term ((-660 : Rat) / 299) [(0, 4), (16, 1)],
  term ((1980 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (9, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (11, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1620 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (13, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1968 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(1, 1), (2, 2), (3, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 2), (3, 2), (15, 1), (16, 1)],
  term ((-42 : Rat) / 13) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((1884 : Rat) / 299) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((1980 : Rat) / 299) [(1, 1), (2, 3), (9, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 1), (2, 3), (11, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1620 : Rat) / 299) [(1, 1), (2, 3), (13, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 1), (2, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1968 : Rat) / 299) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 4), (15, 1), (16, 1)],
  term ((-42 : Rat) / 13) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((1884 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-108 : Rat) / 13) [(1, 1), (3, 3), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((5820 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((12960 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6720 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34560 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((36720 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2462 : Rat) / 299) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12960 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((7080 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((840 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-964 : Rat) / 299) [(1, 2), (2, 1), (8, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((124 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 13) [(1, 2), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 13) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1272 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((6120 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45360 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 2), (2, 1), (9, 2), (16, 1)],
  term ((360 : Rat) / 23) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 13) [(1, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 23) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2224 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 2), (2, 1), (11, 2), (12, 1), (16, 1)],
  term ((840 : Rat) / 299) [(1, 2), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1980 : Rat) / 299) [(1, 3), (2, 1), (9, 1), (16, 1)],
  term ((360 : Rat) / 299) [(1, 3), (2, 1), (11, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 3), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((1620 : Rat) / 299) [(1, 3), (2, 1), (13, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 3), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((1968 : Rat) / 299) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 3), (2, 2), (15, 1), (16, 1)],
  term ((108 : Rat) / 13) [(1, 3), (3, 1), (16, 1)],
  term ((42 : Rat) / 13) [(1, 3), (9, 1), (16, 1)],
  term ((-1884 : Rat) / 299) [(1, 3), (11, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 3), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-12960 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((6720 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((34560 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36720 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2462 : Rat) / 299) [(2, 1), (3, 2), (6, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((12960 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7080 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (13, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (14, 1), (16, 1)],
  term ((964 : Rat) / 299) [(2, 1), (3, 2), (8, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-124 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 13) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 13) [(2, 1), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1272 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-6120 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((45360 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (3, 2), (9, 2), (16, 1)],
  term ((-360 : Rat) / 23) [(2, 1), (3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 13) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 23) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((2224 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (3, 2), (11, 2), (12, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (8, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (3, 3), (5, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (3, 3), (7, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 3), (8, 1), (15, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 1), (3, 3), (9, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 299) [(2, 1), (3, 3), (9, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (3, 3), (11, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 3), (12, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (3, 3), (13, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5820 : Rat) / 299) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 3), (3, 1), (5, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 3), (3, 1), (7, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 3), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 299) [(2, 3), (3, 1), (9, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 3), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 3), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 3), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5820 : Rat) / 299) [(2, 3), (3, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 3), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-12960 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((6720 : Rat) / 299) [(2, 3), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 3), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(2, 3), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (5, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 3), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 3), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((34560 : Rat) / 299) [(2, 3), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36720 : Rat) / 299) [(2, 3), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2462 : Rat) / 299) [(2, 3), (6, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 3), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((12960 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7080 : Rat) / 299) [(2, 3), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 3), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 3), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (8, 1), (13, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 3), (8, 1), (14, 1), (16, 1)],
  term ((964 : Rat) / 299) [(2, 3), (8, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(2, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-124 : Rat) / 299) [(2, 3), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 3), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 13) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 13) [(2, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1272 : Rat) / 299) [(2, 3), (9, 1), (13, 1), (16, 1)],
  term ((-6120 : Rat) / 299) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((45360 : Rat) / 299) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 3), (9, 2), (16, 1)],
  term ((-360 : Rat) / 23) [(2, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 13) [(2, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 23) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((2224 : Rat) / 299) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 3), (11, 2), (12, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(2, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 100 through 199. -/
theorem rs_R003_ueqv_R003NY_block_00_0100_0199_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_00_0100_0199
      rs_R003_ueqv_R003NY_block_00_0100_0199 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
