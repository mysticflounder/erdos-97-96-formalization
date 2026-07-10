/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NNNN, term block 11:100-111

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NNNNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
def rs_R005_ueqv_R005NNNN_generator_11_0100_0111 : Poly :=
[
  term (2 : Rat) [(2, 1), (8, 1)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0100 : Poly :=
[
  term ((-20 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0100 : Poly :=
[
  term ((-40 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0100_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0100
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0101 : Poly :=
[
  term ((269 : Rat) / 56) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0101 : Poly :=
[
  term ((269 : Rat) / 28) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 28) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0101_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0101
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0102 : Poly :=
[
  term ((-24 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 102 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0102 : Poly :=
[
  term ((-48 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0102_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0102
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0103 : Poly :=
[
  term ((-80 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0103 : Poly :=
[
  term ((-160 : Rat) / 7) [(2, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0103_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0103
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0104 : Poly :=
[
  term ((10 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0104 : Poly :=
[
  term ((20 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0104_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0104
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0105 : Poly :=
[
  term ((61 : Rat) / 112) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0105 : Poly :=
[
  term ((61 : Rat) / 56) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 56) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0105_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0105
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0106 : Poly :=
[
  term ((12 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 106 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0106 : Poly :=
[
  term ((24 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0106_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0106
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0107 : Poly :=
[
  term ((-41 : Rat) / 112) [(13, 2), (16, 1)]
]

/-- Partial product 107 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0107 : Poly :=
[
  term ((-41 : Rat) / 56) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 56) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((41 : Rat) / 112) [(8, 2), (13, 2), (16, 1)],
  term ((41 : Rat) / 112) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0107_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0107
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0108 : Poly :=
[
  term ((-18 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0108 : Poly :=
[
  term ((-36 : Rat) / 7) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0108_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0108
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0109 : Poly :=
[
  term ((-53 : Rat) / 28) [(14, 1), (16, 1)]
]

/-- Partial product 109 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0109 : Poly :=
[
  term ((-53 : Rat) / 14) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-53 : Rat) / 14) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((53 : Rat) / 28) [(8, 2), (14, 1), (16, 1)],
  term ((53 : Rat) / 28) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0109_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0109
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0110 : Poly :=
[
  term ((-69 : Rat) / 14) [(15, 2), (16, 1)]
]

/-- Partial product 110 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0110 : Poly :=
[
  term ((-69 : Rat) / 7) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-69 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((69 : Rat) / 14) [(8, 2), (15, 2), (16, 1)],
  term ((69 : Rat) / 14) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0110_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0110
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 11. -/
def rs_R005_ueqv_R005NNNN_coefficient_11_0111 : Poly :=
[
  term ((35 : Rat) / 16) [(16, 1)]
]

/-- Partial product 111 for generator 11. -/
def rs_R005_ueqv_R005NNNN_partial_11_0111 : Poly :=
[
  term ((35 : Rat) / 8) [(2, 1), (8, 1), (16, 1)],
  term ((35 : Rat) / 8) [(3, 1), (9, 1), (16, 1)],
  term ((-35 : Rat) / 16) [(8, 2), (16, 1)],
  term ((-35 : Rat) / 16) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 11. -/
theorem rs_R005_ueqv_R005NNNN_partial_11_0111_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_11_0111
        rs_R005_ueqv_R005NNNN_generator_11_0100_0111 =
      rs_R005_ueqv_R005NNNN_partial_11_0111 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NNNN_partials_11_0100_0111 : List Poly :=
[
  rs_R005_ueqv_R005NNNN_partial_11_0100,
  rs_R005_ueqv_R005NNNN_partial_11_0101,
  rs_R005_ueqv_R005NNNN_partial_11_0102,
  rs_R005_ueqv_R005NNNN_partial_11_0103,
  rs_R005_ueqv_R005NNNN_partial_11_0104,
  rs_R005_ueqv_R005NNNN_partial_11_0105,
  rs_R005_ueqv_R005NNNN_partial_11_0106,
  rs_R005_ueqv_R005NNNN_partial_11_0107,
  rs_R005_ueqv_R005NNNN_partial_11_0108,
  rs_R005_ueqv_R005NNNN_partial_11_0109,
  rs_R005_ueqv_R005NNNN_partial_11_0110,
  rs_R005_ueqv_R005NNNN_partial_11_0111
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NNNN_block_11_0100_0111 : Poly :=
[
  term ((-40 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 28) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 56) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 56) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-53 : Rat) / 14) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-69 : Rat) / 7) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((35 : Rat) / 8) [(2, 1), (8, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 28) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 56) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 56) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-53 : Rat) / 14) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-69 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((35 : Rat) / 8) [(3, 1), (9, 1), (16, 1)],
  term ((20 : Rat) / 7) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 112) [(8, 2), (13, 2), (16, 1)],
  term ((18 : Rat) / 7) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((53 : Rat) / 28) [(8, 2), (14, 1), (16, 1)],
  term ((69 : Rat) / 14) [(8, 2), (15, 2), (16, 1)],
  term ((-35 : Rat) / 16) [(8, 2), (16, 1)],
  term ((20 : Rat) / 7) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 112) [(9, 2), (13, 2), (16, 1)],
  term ((18 : Rat) / 7) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((53 : Rat) / 28) [(9, 2), (14, 1), (16, 1)],
  term ((69 : Rat) / 14) [(9, 2), (15, 2), (16, 1)],
  term ((-35 : Rat) / 16) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 100 through 111. -/
theorem rs_R005_ueqv_R005NNNN_block_11_0100_0111_valid :
    checkProductSumEq rs_R005_ueqv_R005NNNN_partials_11_0100_0111
      rs_R005_ueqv_R005NNNN_block_11_0100_0111 = true := by
  native_decide

end R005UeqvR005NNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
