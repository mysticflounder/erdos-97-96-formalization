/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 5:100-152

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_05_0100_0152 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0100 : Poly :=
[
  term ((2736 : Rat) / 103) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0100 : Poly :=
[
  term ((-5472 : Rat) / 103) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((2736 : Rat) / 103) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((2736 : Rat) / 103) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((5472 : Rat) / 103) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 103) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 103) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0100_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0100
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0101 : Poly :=
[
  term ((-2681 : Rat) / 206) [(4, 1), (16, 1)]
]

/-- Partial product 101 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0101 : Poly :=
[
  term ((2681 : Rat) / 103) [(4, 1), (6, 1), (16, 1)],
  term ((-2681 : Rat) / 206) [(4, 1), (6, 2), (16, 1)],
  term ((-2681 : Rat) / 206) [(4, 1), (7, 2), (16, 1)],
  term ((-2681 : Rat) / 103) [(4, 1), (14, 1), (16, 1)],
  term ((2681 : Rat) / 206) [(4, 1), (14, 2), (16, 1)],
  term ((2681 : Rat) / 206) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0101_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0101
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0102 : Poly :=
[
  term ((7584 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 102 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0102 : Poly :=
[
  term ((-15168 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0102_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0102
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0103 : Poly :=
[
  term ((-11376 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 103 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0103 : Poly :=
[
  term ((22752 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-22752 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0103_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0103
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0104 : Poly :=
[
  term ((-10848 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0104 : Poly :=
[
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0104_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0104
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0105 : Poly :=
[
  term ((16272 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0105 : Poly :=
[
  term ((-32544 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((32544 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0105_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0105
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0106 : Poly :=
[
  term ((7152 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0106 : Poly :=
[
  term ((-14304 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7152 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((14304 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7152 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7152 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((7152 : Rat) / 103) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0106_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0106
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0107 : Poly :=
[
  term ((-10848 : Rat) / 103) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0107 : Poly :=
[
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0107_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0107
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0108 : Poly :=
[
  term ((-459 : Rat) / 103) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 108 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0108 : Poly :=
[
  term ((918 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-459 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-918 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((459 : Rat) / 103) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((459 : Rat) / 103) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-459 : Rat) / 103) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0108_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0108
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0109 : Poly :=
[
  term ((-15168 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0109 : Poly :=
[
  term ((30336 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-30336 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0109_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0109
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0110 : Poly :=
[
  term ((7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0110 : Poly :=
[
  term ((-15168 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0110_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0110
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0111 : Poly :=
[
  term ((21696 : Rat) / 103) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0111 : Poly :=
[
  term ((-43392 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((43392 : Rat) / 103) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0111_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0111
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0112 : Poly :=
[
  term ((-10848 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0112 : Poly :=
[
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0112_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0112
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0113 : Poly :=
[
  term ((-1856 : Rat) / 103) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 113 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0113 : Poly :=
[
  term ((3712 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1856 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-1856 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-3712 : Rat) / 103) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1856 : Rat) / 103) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((1856 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0113_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0113
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0114 : Poly :=
[
  term ((11376 : Rat) / 103) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0114 : Poly :=
[
  term ((-22752 : Rat) / 103) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((22752 : Rat) / 103) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0114_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0114
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0115 : Poly :=
[
  term ((-16272 : Rat) / 103) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0115 : Poly :=
[
  term ((32544 : Rat) / 103) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-32544 : Rat) / 103) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0115_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0115
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0116 : Poly :=
[
  term ((-1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 116 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0116 : Poly :=
[
  term ((2304 : Rat) / 103) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2304 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0116_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0116
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0117 : Poly :=
[
  term ((7584 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 117 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0117 : Poly :=
[
  term ((-15168 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0117_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0117
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0118 : Poly :=
[
  term ((-14304 : Rat) / 103) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0118 : Poly :=
[
  term ((28608 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14304 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14304 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-28608 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14304 : Rat) / 103) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((14304 : Rat) / 103) [(5, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0118_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0118
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0119 : Poly :=
[
  term ((4640 : Rat) / 103) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0119 : Poly :=
[
  term ((-9280 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((4640 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((4640 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((9280 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4640 : Rat) / 103) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4640 : Rat) / 103) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0119_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0119
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0120 : Poly :=
[
  term ((-10848 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0120 : Poly :=
[
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0120_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0120
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0121 : Poly :=
[
  term ((-4440 : Rat) / 103) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0121 : Poly :=
[
  term ((8880 : Rat) / 103) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4440 : Rat) / 103) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4440 : Rat) / 103) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8880 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((4440 : Rat) / 103) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((4440 : Rat) / 103) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0121_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0121
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0122 : Poly :=
[
  term ((21696 : Rat) / 103) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 122 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0122 : Poly :=
[
  term ((-43392 : Rat) / 103) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((43392 : Rat) / 103) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0122_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0122
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0123 : Poly :=
[
  term ((15168 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0123 : Poly :=
[
  term ((-30336 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((30336 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0123_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0123
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0124 : Poly :=
[
  term ((-21696 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0124 : Poly :=
[
  term ((43392 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-43392 : Rat) / 103) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0124_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0124
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0125 : Poly :=
[
  term ((-928 : Rat) / 103) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 125 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0125 : Poly :=
[
  term ((1856 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-928 : Rat) / 103) [(6, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((928 : Rat) / 103) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1856 : Rat) / 103) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((928 : Rat) / 103) [(7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-928 : Rat) / 103) [(7, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0125_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0125
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0126 : Poly :=
[
  term ((1392 : Rat) / 103) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 126 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0126 : Poly :=
[
  term ((-2784 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((2784 : Rat) / 103) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1392 : Rat) / 103) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0126_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0126
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0127 : Poly :=
[
  term ((576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 127 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0127 : Poly :=
[
  term ((-1152 : Rat) / 103) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 103) [(7, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0127_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0127
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0128 : Poly :=
[
  term ((-4496 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 128 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0128 : Poly :=
[
  term ((8992 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4496 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((4496 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8992 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((4496 : Rat) / 103) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((-4496 : Rat) / 103) [(7, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0128_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0128
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0129 : Poly :=
[
  term ((1296 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0129 : Poly :=
[
  term ((-2592 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1296 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2592 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1296 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1296 : Rat) / 103) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((1296 : Rat) / 103) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0129_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0129
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0130 : Poly :=
[
  term ((3108 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0130 : Poly :=
[
  term ((-6216 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((3108 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((6216 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3108 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3108 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3108 : Rat) / 103) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0130_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0130
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0131 : Poly :=
[
  term ((-768 : Rat) / 103) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0131 : Poly :=
[
  term ((1536 : Rat) / 103) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 103) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0131_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0131
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0132 : Poly :=
[
  term ((5460 : Rat) / 103) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0132 : Poly :=
[
  term ((-10920 : Rat) / 103) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5460 : Rat) / 103) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((10920 : Rat) / 103) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5460 : Rat) / 103) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0132_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0132
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0133 : Poly :=
[
  term ((-5539 : Rat) / 103) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0133 : Poly :=
[
  term ((11078 : Rat) / 103) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5539 : Rat) / 103) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11078 : Rat) / 103) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5539 : Rat) / 103) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((5539 : Rat) / 103) [(7, 1), (15, 3), (16, 1)],
  term ((-5539 : Rat) / 103) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0133_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0133
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0134 : Poly :=
[
  term ((288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 134 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0134 : Poly :=
[
  term ((-576 : Rat) / 103) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 103) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0134_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0134
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0135 : Poly :=
[
  term ((3792 : Rat) / 103) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 135 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0135 : Poly :=
[
  term ((-7584 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3792 : Rat) / 103) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7584 : Rat) / 103) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3792 : Rat) / 103) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0135_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0135
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0136 : Poly :=
[
  term ((-3300 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 136 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0136 : Poly :=
[
  term ((6600 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3300 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3300 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-6600 : Rat) / 103) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3300 : Rat) / 103) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((3300 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0136_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0136
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0137 : Poly :=
[
  term ((-3568 : Rat) / 103) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0137 : Poly :=
[
  term ((7136 : Rat) / 103) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3568 : Rat) / 103) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7136 : Rat) / 103) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3568 : Rat) / 103) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0137_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0137
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0138 : Poly :=
[
  term ((4268 : Rat) / 103) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0138 : Poly :=
[
  term ((-8536 : Rat) / 103) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4268 : Rat) / 103) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((4268 : Rat) / 103) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((8536 : Rat) / 103) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4268 : Rat) / 103) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4268 : Rat) / 103) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0138_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0138
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0139 : Poly :=
[
  term ((1392 : Rat) / 103) [(9, 2), (16, 1)]
]

/-- Partial product 139 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0139 : Poly :=
[
  term ((-2784 : Rat) / 103) [(6, 1), (9, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(6, 2), (9, 2), (16, 1)],
  term ((1392 : Rat) / 103) [(7, 2), (9, 2), (16, 1)],
  term ((2784 : Rat) / 103) [(9, 2), (14, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(9, 2), (14, 2), (16, 1)],
  term ((-1392 : Rat) / 103) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0139_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0139
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0140 : Poly :=
[
  term ((-576 : Rat) / 103) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0140 : Poly :=
[
  term ((1152 : Rat) / 103) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0140_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0140
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0141 : Poly :=
[
  term ((624 : Rat) / 103) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 141 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0141 : Poly :=
[
  term ((-1248 : Rat) / 103) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 103) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 103) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 103) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1248 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0141_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0141
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0142 : Poly :=
[
  term ((-216 : Rat) / 103) [(12, 1), (16, 1)]
]

/-- Partial product 142 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0142 : Poly :=
[
  term ((432 : Rat) / 103) [(6, 1), (12, 1), (16, 1)],
  term ((-216 : Rat) / 103) [(6, 2), (12, 1), (16, 1)],
  term ((-216 : Rat) / 103) [(7, 2), (12, 1), (16, 1)],
  term ((-432 : Rat) / 103) [(12, 1), (14, 1), (16, 1)],
  term ((216 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((216 : Rat) / 103) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0142_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0142
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0143 : Poly :=
[
  term ((4696 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0143 : Poly :=
[
  term ((-9392 : Rat) / 103) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4696 : Rat) / 103) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4696 : Rat) / 103) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4696 : Rat) / 103) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((9392 : Rat) / 103) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4696 : Rat) / 103) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0143_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0143
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0144 : Poly :=
[
  term ((2464 : Rat) / 103) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0144 : Poly :=
[
  term ((-4928 : Rat) / 103) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2464 : Rat) / 103) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((2464 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((4928 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 103) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 103) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0144_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0144
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0145 : Poly :=
[
  term ((-2592 : Rat) / 103) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 145 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0145 : Poly :=
[
  term ((5184 : Rat) / 103) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2592 : Rat) / 103) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2592 : Rat) / 103) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5184 : Rat) / 103) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2592 : Rat) / 103) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((2592 : Rat) / 103) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0145_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0145
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0146 : Poly :=
[
  term ((-768 : Rat) / 103) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 146 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0146 : Poly :=
[
  term ((1536 : Rat) / 103) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1536 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((768 : Rat) / 103) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0146_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0146
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0147 : Poly :=
[
  term ((1536 : Rat) / 103) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 147 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0147 : Poly :=
[
  term ((-3072 : Rat) / 103) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1536 : Rat) / 103) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((1536 : Rat) / 103) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((3072 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1536 : Rat) / 103) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1536 : Rat) / 103) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0147_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0147
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0148 : Poly :=
[
  term ((-864 : Rat) / 103) [(13, 2), (16, 1)]
]

/-- Partial product 148 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0148 : Poly :=
[
  term ((1728 : Rat) / 103) [(6, 1), (13, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(6, 2), (13, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(7, 2), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 103) [(13, 2), (14, 1), (16, 1)],
  term ((864 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((864 : Rat) / 103) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0148_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0148
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0149 : Poly :=
[
  term ((-5496 : Rat) / 103) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0149 : Poly :=
[
  term ((10992 : Rat) / 103) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((5496 : Rat) / 103) [(14, 1), (15, 4), (16, 1)],
  term ((-10992 : Rat) / 103) [(14, 2), (15, 2), (16, 1)],
  term ((5496 : Rat) / 103) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0149_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0149
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0150 : Poly :=
[
  term ((-575 : Rat) / 206) [(14, 1), (16, 1)]
]

/-- Partial product 150 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0150 : Poly :=
[
  term ((575 : Rat) / 103) [(6, 1), (14, 1), (16, 1)],
  term ((-575 : Rat) / 206) [(6, 2), (14, 1), (16, 1)],
  term ((-575 : Rat) / 206) [(7, 2), (14, 1), (16, 1)],
  term ((575 : Rat) / 206) [(14, 1), (15, 2), (16, 1)],
  term ((-575 : Rat) / 103) [(14, 2), (16, 1)],
  term ((575 : Rat) / 206) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0150_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0150
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0151 : Poly :=
[
  term ((-1252 : Rat) / 103) [(15, 2), (16, 1)]
]

/-- Partial product 151 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0151 : Poly :=
[
  term ((2504 : Rat) / 103) [(6, 1), (15, 2), (16, 1)],
  term ((-1252 : Rat) / 103) [(6, 2), (15, 2), (16, 1)],
  term ((-1252 : Rat) / 103) [(7, 2), (15, 2), (16, 1)],
  term ((-2504 : Rat) / 103) [(14, 1), (15, 2), (16, 1)],
  term ((1252 : Rat) / 103) [(14, 2), (15, 2), (16, 1)],
  term ((1252 : Rat) / 103) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0151_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0151
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def rs_R013_ueqv_R013NNYN_coefficient_05_0152 : Poly :=
[
  term (8 : Rat) [(16, 1)]
]

/-- Partial product 152 for generator 5. -/
def rs_R013_ueqv_R013NNYN_partial_05_0152 : Poly :=
[
  term (-16 : Rat) [(6, 1), (16, 1)],
  term (8 : Rat) [(6, 2), (16, 1)],
  term (8 : Rat) [(7, 2), (16, 1)],
  term (16 : Rat) [(14, 1), (16, 1)],
  term (-8 : Rat) [(14, 2), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem rs_R013_ueqv_R013NNYN_partial_05_0152_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_05_0152
        rs_R013_ueqv_R013NNYN_generator_05_0100_0152 =
      rs_R013_ueqv_R013NNYN_partial_05_0152 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_05_0100_0152 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_05_0100,
  rs_R013_ueqv_R013NNYN_partial_05_0101,
  rs_R013_ueqv_R013NNYN_partial_05_0102,
  rs_R013_ueqv_R013NNYN_partial_05_0103,
  rs_R013_ueqv_R013NNYN_partial_05_0104,
  rs_R013_ueqv_R013NNYN_partial_05_0105,
  rs_R013_ueqv_R013NNYN_partial_05_0106,
  rs_R013_ueqv_R013NNYN_partial_05_0107,
  rs_R013_ueqv_R013NNYN_partial_05_0108,
  rs_R013_ueqv_R013NNYN_partial_05_0109,
  rs_R013_ueqv_R013NNYN_partial_05_0110,
  rs_R013_ueqv_R013NNYN_partial_05_0111,
  rs_R013_ueqv_R013NNYN_partial_05_0112,
  rs_R013_ueqv_R013NNYN_partial_05_0113,
  rs_R013_ueqv_R013NNYN_partial_05_0114,
  rs_R013_ueqv_R013NNYN_partial_05_0115,
  rs_R013_ueqv_R013NNYN_partial_05_0116,
  rs_R013_ueqv_R013NNYN_partial_05_0117,
  rs_R013_ueqv_R013NNYN_partial_05_0118,
  rs_R013_ueqv_R013NNYN_partial_05_0119,
  rs_R013_ueqv_R013NNYN_partial_05_0120,
  rs_R013_ueqv_R013NNYN_partial_05_0121,
  rs_R013_ueqv_R013NNYN_partial_05_0122,
  rs_R013_ueqv_R013NNYN_partial_05_0123,
  rs_R013_ueqv_R013NNYN_partial_05_0124,
  rs_R013_ueqv_R013NNYN_partial_05_0125,
  rs_R013_ueqv_R013NNYN_partial_05_0126,
  rs_R013_ueqv_R013NNYN_partial_05_0127,
  rs_R013_ueqv_R013NNYN_partial_05_0128,
  rs_R013_ueqv_R013NNYN_partial_05_0129,
  rs_R013_ueqv_R013NNYN_partial_05_0130,
  rs_R013_ueqv_R013NNYN_partial_05_0131,
  rs_R013_ueqv_R013NNYN_partial_05_0132,
  rs_R013_ueqv_R013NNYN_partial_05_0133,
  rs_R013_ueqv_R013NNYN_partial_05_0134,
  rs_R013_ueqv_R013NNYN_partial_05_0135,
  rs_R013_ueqv_R013NNYN_partial_05_0136,
  rs_R013_ueqv_R013NNYN_partial_05_0137,
  rs_R013_ueqv_R013NNYN_partial_05_0138,
  rs_R013_ueqv_R013NNYN_partial_05_0139,
  rs_R013_ueqv_R013NNYN_partial_05_0140,
  rs_R013_ueqv_R013NNYN_partial_05_0141,
  rs_R013_ueqv_R013NNYN_partial_05_0142,
  rs_R013_ueqv_R013NNYN_partial_05_0143,
  rs_R013_ueqv_R013NNYN_partial_05_0144,
  rs_R013_ueqv_R013NNYN_partial_05_0145,
  rs_R013_ueqv_R013NNYN_partial_05_0146,
  rs_R013_ueqv_R013NNYN_partial_05_0147,
  rs_R013_ueqv_R013NNYN_partial_05_0148,
  rs_R013_ueqv_R013NNYN_partial_05_0149,
  rs_R013_ueqv_R013NNYN_partial_05_0150,
  rs_R013_ueqv_R013NNYN_partial_05_0151,
  rs_R013_ueqv_R013NNYN_partial_05_0152
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_05_0100_0152 : Poly :=
[
  term ((-5472 : Rat) / 103) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((2681 : Rat) / 103) [(4, 1), (6, 1), (16, 1)],
  term ((2736 : Rat) / 103) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2681 : Rat) / 206) [(4, 1), (6, 2), (16, 1)],
  term ((2736 : Rat) / 103) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-2681 : Rat) / 206) [(4, 1), (7, 2), (16, 1)],
  term ((5472 : Rat) / 103) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2681 : Rat) / 103) [(4, 1), (14, 1), (16, 1)],
  term ((-2736 : Rat) / 103) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((2681 : Rat) / 206) [(4, 1), (14, 2), (16, 1)],
  term ((2681 : Rat) / 206) [(4, 1), (15, 2), (16, 1)],
  term ((-2736 : Rat) / 103) [(4, 1), (15, 4), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((22752 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32544 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14304 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((918 : Rat) / 103) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((30336 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43392 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((3712 : Rat) / 103) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-22752 : Rat) / 103) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((32544 : Rat) / 103) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((2304 : Rat) / 103) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((28608 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9280 : Rat) / 103) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((8880 : Rat) / 103) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-43392 : Rat) / 103) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((7152 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-459 : Rat) / 103) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1856 : Rat) / 103) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14304 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 103) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4440 : Rat) / 103) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22752 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((26544 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32544 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-37968 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((14304 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7152 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7152 : Rat) / 103) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-918 : Rat) / 103) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((459 : Rat) / 103) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((459 : Rat) / 103) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1856 : Rat) / 103) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((11376 : Rat) / 103) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-16272 : Rat) / 103) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-14304 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 103) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4440 : Rat) / 103) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((7584 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (13, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((7152 : Rat) / 103) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-10848 : Rat) / 103) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-459 : Rat) / 103) [(5, 1), (7, 3), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-37920 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((-3712 : Rat) / 103) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((54240 : Rat) / 103) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((1856 : Rat) / 103) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)],
  term ((1856 : Rat) / 103) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((22752 : Rat) / 103) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-11376 : Rat) / 103) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-32544 : Rat) / 103) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((16272 : Rat) / 103) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-2304 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36192 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9280 : Rat) / 103) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((14304 : Rat) / 103) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((10528 : Rat) / 103) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7584 : Rat) / 103) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((-4640 : Rat) / 103) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((14304 : Rat) / 103) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-8880 : Rat) / 103) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((54240 : Rat) / 103) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-17256 : Rat) / 103) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (14, 2), (15, 3), (16, 1)],
  term ((10848 : Rat) / 103) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((4440 : Rat) / 103) [(5, 1), (15, 3), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 1), (15, 5), (16, 1)],
  term ((-30336 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((43392 : Rat) / 103) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((15168 : Rat) / 103) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-21696 : Rat) / 103) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((30336 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-15168 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43392 : Rat) / 103) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((21696 : Rat) / 103) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((1856 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-1152 : Rat) / 103) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((8992 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6216 : Rat) / 103) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10920 : Rat) / 103) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((11078 : Rat) / 103) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7584 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6600 : Rat) / 103) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((7136 : Rat) / 103) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8536 : Rat) / 103) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2784 : Rat) / 103) [(6, 1), (9, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 103) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((432 : Rat) / 103) [(6, 1), (12, 1), (16, 1)],
  term ((-9392 : Rat) / 103) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4928 : Rat) / 103) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5184 : Rat) / 103) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((1536 : Rat) / 103) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3072 : Rat) / 103) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1728 : Rat) / 103) [(6, 1), (13, 2), (16, 1)],
  term ((10992 : Rat) / 103) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((575 : Rat) / 103) [(6, 1), (14, 1), (16, 1)],
  term ((2504 : Rat) / 103) [(6, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(6, 1), (16, 1)],
  term ((-928 : Rat) / 103) [(6, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((576 : Rat) / 103) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4496 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1296 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3108 : Rat) / 103) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5539 : Rat) / 103) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 103) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3300 : Rat) / 103) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4268 : Rat) / 103) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(6, 2), (9, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-216 : Rat) / 103) [(6, 2), (12, 1), (16, 1)],
  term ((4696 : Rat) / 103) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2464 : Rat) / 103) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 103) [(6, 2), (13, 2), (14, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(6, 2), (13, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-575 : Rat) / 206) [(6, 2), (14, 1), (16, 1)],
  term ((-1252 : Rat) / 103) [(6, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(6, 2), (16, 1)],
  term ((928 : Rat) / 103) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2784 : Rat) / 103) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3248 : Rat) / 103) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((928 : Rat) / 103) [(7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-1392 : Rat) / 103) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1152 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((7088 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6216 : Rat) / 103) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1296 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-12100 : Rat) / 103) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((4496 : Rat) / 103) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((-3108 : Rat) / 103) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1296 : Rat) / 103) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1536 : Rat) / 103) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 103) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-11078 : Rat) / 103) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5460 : Rat) / 103) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((16459 : Rat) / 103) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5460 : Rat) / 103) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((5539 : Rat) / 103) [(7, 1), (15, 3), (16, 1)],
  term ((288 : Rat) / 103) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3792 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3300 : Rat) / 103) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3568 : Rat) / 103) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4268 : Rat) / 103) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(7, 2), (9, 2), (16, 1)],
  term ((-576 : Rat) / 103) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((624 : Rat) / 103) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-216 : Rat) / 103) [(7, 2), (12, 1), (16, 1)],
  term ((4696 : Rat) / 103) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2464 : Rat) / 103) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 103) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((1536 : Rat) / 103) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-864 : Rat) / 103) [(7, 2), (13, 2), (16, 1)],
  term ((-5496 : Rat) / 103) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-575 : Rat) / 206) [(7, 2), (14, 1), (16, 1)],
  term ((-1252 : Rat) / 103) [(7, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(7, 2), (16, 1)],
  term ((-928 : Rat) / 103) [(7, 3), (9, 1), (14, 1), (16, 1)],
  term ((1392 : Rat) / 103) [(7, 3), (9, 1), (16, 1)],
  term ((576 : Rat) / 103) [(7, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4496 : Rat) / 103) [(7, 3), (13, 1), (14, 1), (16, 1)],
  term ((1296 : Rat) / 103) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((3108 : Rat) / 103) [(7, 3), (13, 1), (16, 1)],
  term ((-768 : Rat) / 103) [(7, 3), (13, 2), (15, 1), (16, 1)],
  term ((5460 : Rat) / 103) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5539 : Rat) / 103) [(7, 3), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 103) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3792 : Rat) / 103) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6600 : Rat) / 103) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((10884 : Rat) / 103) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3792 : Rat) / 103) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((3300 : Rat) / 103) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((8536 : Rat) / 103) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3568 : Rat) / 103) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11404 : Rat) / 103) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3568 : Rat) / 103) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-4268 : Rat) / 103) [(9, 1), (15, 3), (16, 1)],
  term ((2784 : Rat) / 103) [(9, 2), (14, 1), (16, 1)],
  term ((-1392 : Rat) / 103) [(9, 2), (14, 2), (16, 1)],
  term ((-1392 : Rat) / 103) [(9, 2), (15, 2), (16, 1)],
  term ((-1152 : Rat) / 103) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 103) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-624 : Rat) / 103) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-432 : Rat) / 103) [(12, 1), (14, 1), (16, 1)],
  term ((1464 : Rat) / 103) [(12, 1), (14, 2), (16, 1)],
  term ((-624 : Rat) / 103) [(12, 1), (14, 3), (16, 1)],
  term ((216 : Rat) / 103) [(12, 1), (15, 2), (16, 1)],
  term ((4928 : Rat) / 103) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9880 : Rat) / 103) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((6928 : Rat) / 103) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2592 : Rat) / 103) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-4696 : Rat) / 103) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 103) [(13, 1), (15, 3), (16, 1)],
  term ((2592 : Rat) / 103) [(13, 1), (15, 5), (16, 1)],
  term ((3840 : Rat) / 103) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1728 : Rat) / 103) [(13, 2), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 103) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-672 : Rat) / 103) [(13, 2), (14, 2), (16, 1)],
  term ((768 : Rat) / 103) [(13, 2), (14, 3), (16, 1)],
  term ((864 : Rat) / 103) [(13, 2), (15, 2), (16, 1)],
  term ((-1536 : Rat) / 103) [(13, 2), (15, 4), (16, 1)],
  term ((-4433 : Rat) / 206) [(14, 1), (15, 2), (16, 1)],
  term ((5496 : Rat) / 103) [(14, 1), (15, 4), (16, 1)],
  term (16 : Rat) [(14, 1), (16, 1)],
  term ((-9740 : Rat) / 103) [(14, 2), (15, 2), (16, 1)],
  term ((-1399 : Rat) / 103) [(14, 2), (16, 1)],
  term ((5496 : Rat) / 103) [(14, 3), (15, 2), (16, 1)],
  term ((575 : Rat) / 206) [(14, 3), (16, 1)],
  term (-8 : Rat) [(15, 2), (16, 1)],
  term ((1252 : Rat) / 103) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 152. -/
theorem rs_R013_ueqv_R013NNYN_block_05_0100_0152_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_05_0100_0152
      rs_R013_ueqv_R013NNYN_block_05_0100_0152 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
