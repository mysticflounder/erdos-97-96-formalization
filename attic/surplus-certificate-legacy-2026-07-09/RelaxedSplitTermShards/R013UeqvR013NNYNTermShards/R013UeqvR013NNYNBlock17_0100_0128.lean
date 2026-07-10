/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 17:100-128

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_17_0100_0128 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0100 : Poly :=
[
  term ((14304 : Rat) / 103) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0100 : Poly :=
[
  term ((28608 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14304 : Rat) / 103) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((28608 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14304 : Rat) / 103) [(5, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0100_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0100
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0101 : Poly :=
[
  term ((-996 : Rat) / 103) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0101 : Poly :=
[
  term ((-1992 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((996 : Rat) / 103) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-1992 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((996 : Rat) / 103) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0101_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0101
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0102 : Poly :=
[
  term ((432 : Rat) / 103) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0102 : Poly :=
[
  term ((864 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 103) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0102_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0102
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0103 : Poly :=
[
  term ((-21696 : Rat) / 103) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 103 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0103 : Poly :=
[
  term ((-43392 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((21696 : Rat) / 103) [(4, 2), (5, 1), (15, 3), (16, 1)],
  term ((-43392 : Rat) / 103) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0103_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0103
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0104 : Poly :=
[
  term ((928 : Rat) / 103) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0104 : Poly :=
[
  term ((1856 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-928 : Rat) / 103) [(4, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1856 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-928 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0104_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0104
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0105 : Poly :=
[
  term ((-928 : Rat) / 103) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 105 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0105 : Poly :=
[
  term ((-1856 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((928 : Rat) / 103) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1856 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((928 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0105_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0105
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0106 : Poly :=
[
  term ((-576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0106 : Poly :=
[
  term ((-1152 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0106_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0106
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0107 : Poly :=
[
  term ((4496 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 107 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0107 : Poly :=
[
  term ((8992 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4496 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((8992 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4496 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0107_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0107
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0108 : Poly :=
[
  term ((-1296 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0108 : Poly :=
[
  term ((-2592 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1296 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2592 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((1296 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0108_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0108
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0109 : Poly :=
[
  term ((-3032 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0109 : Poly :=
[
  term ((-6064 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((3032 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-6064 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((3032 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0109_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0109
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0110 : Poly :=
[
  term ((768 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0110 : Poly :=
[
  term ((1536 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0110_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0110
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0111 : Poly :=
[
  term ((-5460 : Rat) / 103) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0111 : Poly :=
[
  term ((-10920 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10920 : Rat) / 103) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0111_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0111
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0112 : Poly :=
[
  term ((4519 : Rat) / 103) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0112 : Poly :=
[
  term ((9038 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4519 : Rat) / 103) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((9038 : Rat) / 103) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4519 : Rat) / 103) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0112_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0112
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0113 : Poly :=
[
  term ((-3792 : Rat) / 103) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 113 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0113 : Poly :=
[
  term ((-7584 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0113_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0113
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0114 : Poly :=
[
  term ((6600 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0114 : Poly :=
[
  term ((13200 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6600 : Rat) / 103) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((13200 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6600 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0114_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0114
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0115 : Poly :=
[
  term ((3568 : Rat) / 103) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0115 : Poly :=
[
  term ((7136 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7136 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0115_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0115
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0116 : Poly :=
[
  term ((-8536 : Rat) / 103) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0116 : Poly :=
[
  term ((-17072 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8536 : Rat) / 103) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-17072 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((8536 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0116_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0116
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0117 : Poly :=
[
  term ((-1392 : Rat) / 103) [(9, 2), (16, 1)]
]

/-- Partial product 117 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0117 : Poly :=
[
  term ((-2784 : Rat) / 103) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(4, 2), (9, 2), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0117_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0117
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0118 : Poly :=
[
  term ((1152 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0118 : Poly :=
[
  term ((2304 : Rat) / 103) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0118_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0118
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0119 : Poly :=
[
  term ((-1392 : Rat) / 103) [(12, 1), (16, 1)]
]

/-- Partial product 119 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0119 : Poly :=
[
  term ((-2784 : Rat) / 103) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(4, 2), (12, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0119_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0119
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0120 : Poly :=
[
  term ((-4264 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0120 : Poly :=
[
  term ((-8528 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4264 : Rat) / 103) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8528 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4264 : Rat) / 103) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0120_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0120
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0121 : Poly :=
[
  term ((-656 : Rat) / 103) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0121 : Poly :=
[
  term ((-1312 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((656 : Rat) / 103) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1312 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((656 : Rat) / 103) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0121_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0121
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0122 : Poly :=
[
  term ((2592 : Rat) / 103) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 122 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0122 : Poly :=
[
  term ((5184 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2592 : Rat) / 103) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((5184 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2592 : Rat) / 103) [(5, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0122_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0122
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0123 : Poly :=
[
  term ((-1536 : Rat) / 103) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0123 : Poly :=
[
  term ((-3072 : Rat) / 103) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1536 : Rat) / 103) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3072 : Rat) / 103) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1536 : Rat) / 103) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0123_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0123
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0124 : Poly :=
[
  term ((288 : Rat) / 103) [(13, 2), (16, 1)]
]

/-- Partial product 124 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0124 : Poly :=
[
  term ((576 : Rat) / 103) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 2), (13, 2), (16, 1)],
  term ((576 : Rat) / 103) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0124_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0124
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0125 : Poly :=
[
  term ((5496 : Rat) / 103) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0125 : Poly :=
[
  term ((10992 : Rat) / 103) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((10992 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0125_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0125
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0126 : Poly :=
[
  term ((-459 : Rat) / 206) [(14, 1), (16, 1)]
]

/-- Partial product 126 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0126 : Poly :=
[
  term ((-459 : Rat) / 103) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((459 : Rat) / 206) [(4, 2), (14, 1), (16, 1)],
  term ((-459 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((459 : Rat) / 206) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0126_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0126
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0127 : Poly :=
[
  term ((1240 : Rat) / 103) [(15, 2), (16, 1)]
]

/-- Partial product 127 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0127 : Poly :=
[
  term ((2480 : Rat) / 103) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1240 : Rat) / 103) [(4, 2), (15, 2), (16, 1)],
  term ((2480 : Rat) / 103) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1240 : Rat) / 103) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0127_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0127
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 17. -/
def rs_R013_ueqv_R013NNYN_coefficient_17_0128 : Poly :=
[
  term ((1044 : Rat) / 103) [(16, 1)]
]

/-- Partial product 128 for generator 17. -/
def rs_R013_ueqv_R013NNYN_partial_17_0128 : Poly :=
[
  term ((2088 : Rat) / 103) [(4, 1), (6, 1), (16, 1)],
  term ((-1044 : Rat) / 103) [(4, 2), (16, 1)],
  term ((2088 : Rat) / 103) [(5, 1), (7, 1), (16, 1)],
  term ((-1044 : Rat) / 103) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 17. -/
theorem rs_R013_ueqv_R013NNYN_partial_17_0128_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_17_0128
        rs_R013_ueqv_R013NNYN_generator_17_0100_0128 =
      rs_R013_ueqv_R013NNYN_partial_17_0128 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_17_0100_0128 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_17_0100,
  rs_R013_ueqv_R013NNYN_partial_17_0101,
  rs_R013_ueqv_R013NNYN_partial_17_0102,
  rs_R013_ueqv_R013NNYN_partial_17_0103,
  rs_R013_ueqv_R013NNYN_partial_17_0104,
  rs_R013_ueqv_R013NNYN_partial_17_0105,
  rs_R013_ueqv_R013NNYN_partial_17_0106,
  rs_R013_ueqv_R013NNYN_partial_17_0107,
  rs_R013_ueqv_R013NNYN_partial_17_0108,
  rs_R013_ueqv_R013NNYN_partial_17_0109,
  rs_R013_ueqv_R013NNYN_partial_17_0110,
  rs_R013_ueqv_R013NNYN_partial_17_0111,
  rs_R013_ueqv_R013NNYN_partial_17_0112,
  rs_R013_ueqv_R013NNYN_partial_17_0113,
  rs_R013_ueqv_R013NNYN_partial_17_0114,
  rs_R013_ueqv_R013NNYN_partial_17_0115,
  rs_R013_ueqv_R013NNYN_partial_17_0116,
  rs_R013_ueqv_R013NNYN_partial_17_0117,
  rs_R013_ueqv_R013NNYN_partial_17_0118,
  rs_R013_ueqv_R013NNYN_partial_17_0119,
  rs_R013_ueqv_R013NNYN_partial_17_0120,
  rs_R013_ueqv_R013NNYN_partial_17_0121,
  rs_R013_ueqv_R013NNYN_partial_17_0122,
  rs_R013_ueqv_R013NNYN_partial_17_0123,
  rs_R013_ueqv_R013NNYN_partial_17_0124,
  rs_R013_ueqv_R013NNYN_partial_17_0125,
  rs_R013_ueqv_R013NNYN_partial_17_0126,
  rs_R013_ueqv_R013NNYN_partial_17_0127,
  rs_R013_ueqv_R013NNYN_partial_17_0128
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_17_0100_0128 : Poly :=
[
  term ((28608 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1992 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-43392 : Rat) / 103) [(4, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((1856 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1856 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((8992 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6064 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10920 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9038 : Rat) / 103) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((13200 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((7136 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17072 : Rat) / 103) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((2304 : Rat) / 103) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-8528 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1312 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5184 : Rat) / 103) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3072 : Rat) / 103) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((10992 : Rat) / 103) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-459 : Rat) / 103) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((2480 : Rat) / 103) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((2088 : Rat) / 103) [(4, 1), (6, 1), (16, 1)],
  term ((-14304 : Rat) / 103) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((996 : Rat) / 103) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(4, 2), (5, 1), (15, 3), (16, 1)],
  term ((-928 : Rat) / 103) [(4, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((928 : Rat) / 103) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((576 : Rat) / 103) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4496 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1296 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3032 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4519 : Rat) / 103) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6600 : Rat) / 103) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8536 : Rat) / 103) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(4, 2), (9, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(4, 2), (12, 1), (16, 1)],
  term ((4264 : Rat) / 103) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((656 : Rat) / 103) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((1536 : Rat) / 103) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(4, 2), (13, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((459 : Rat) / 206) [(4, 2), (14, 1), (16, 1)],
  term ((-1240 : Rat) / 103) [(4, 2), (15, 2), (16, 1)],
  term ((-1044 : Rat) / 103) [(4, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((13200 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((7136 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17072 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((2304 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-8528 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1312 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5184 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3072 : Rat) / 103) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((10992 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-459 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((2480 : Rat) / 103) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((2088 : Rat) / 103) [(5, 1), (7, 1), (16, 1)],
  term ((1856 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1856 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((8992 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6064 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10920 : Rat) / 103) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((9038 : Rat) / 103) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-928 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((928 : Rat) / 103) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((576 : Rat) / 103) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4496 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((29904 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1040 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3655 : Rat) / 103) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-43392 : Rat) / 103) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((3792 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6600 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8536 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 2), (9, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(5, 2), (12, 1), (16, 1)],
  term ((4264 : Rat) / 103) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((656 : Rat) / 103) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((1536 : Rat) / 103) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(5, 2), (13, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((459 : Rat) / 206) [(5, 2), (14, 1), (16, 1)],
  term ((-1240 : Rat) / 103) [(5, 2), (15, 2), (16, 1)],
  term ((-1044 : Rat) / 103) [(5, 2), (16, 1)],
  term ((-14304 : Rat) / 103) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((996 : Rat) / 103) [(5, 3), (13, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(5, 3), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 100 through 128. -/
theorem rs_R013_ueqv_R013NNYN_block_17_0100_0128_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_17_0100_0128
      rs_R013_ueqv_R013NNYN_block_17_0100_0128 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
