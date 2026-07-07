/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NNNN, term block 20:100-110

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NNNNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
def rs_R005_ueqv_R005NNNN_generator_20_0100_0110 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (8, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0100 : Poly :=
[
  term ((-269 : Rat) / 56) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0100 : Poly :=
[
  term ((269 : Rat) / 28) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 28) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 56) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 28) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 56) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0100_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0100
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0101 : Poly :=
[
  term ((24 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 101 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0101 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0101_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0101
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0102 : Poly :=
[
  term ((80 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0102 : Poly :=
[
  term ((-160 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(2, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0102_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0102
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0103 : Poly :=
[
  term ((-10 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0103 : Poly :=
[
  term ((20 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0103_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0103
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0104 : Poly :=
[
  term ((-61 : Rat) / 112) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0104 : Poly :=
[
  term ((61 : Rat) / 56) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 56) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 56) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 112) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 56) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 112) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0104_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0104
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0105 : Poly :=
[
  term ((-12 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 105 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0105 : Poly :=
[
  term ((24 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0105_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0105
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0106 : Poly :=
[
  term ((41 : Rat) / 112) [(13, 2), (16, 1)]
]

/-- Partial product 106 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0106 : Poly :=
[
  term ((-41 : Rat) / 56) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((41 : Rat) / 112) [(0, 2), (13, 2), (16, 1)],
  term ((-41 : Rat) / 56) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((41 : Rat) / 112) [(1, 2), (13, 2), (16, 1)],
  term ((41 : Rat) / 56) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 112) [(2, 2), (13, 2), (16, 1)],
  term ((41 : Rat) / 56) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 112) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0106_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0106
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0107 : Poly :=
[
  term ((18 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0107 : Poly :=
[
  term ((-36 : Rat) / 7) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0107_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0107
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0108 : Poly :=
[
  term ((3 : Rat) / 4) [(14, 1), (16, 1)]
]

/-- Partial product 108 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0108 : Poly :=
[
  term ((-3 : Rat) / 2) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(0, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 4) [(1, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(2, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0108_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0108
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0109 : Poly :=
[
  term ((19 : Rat) / 14) [(15, 2), (16, 1)]
]

/-- Partial product 109 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0109 : Poly :=
[
  term ((-19 : Rat) / 7) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 14) [(0, 2), (15, 2), (16, 1)],
  term ((-19 : Rat) / 7) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 14) [(1, 2), (15, 2), (16, 1)],
  term ((19 : Rat) / 7) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 14) [(2, 2), (15, 2), (16, 1)],
  term ((19 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 14) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0109_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0109
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005NNNN_coefficient_20_0110 : Poly :=
[
  term ((-3 : Rat) / 4) [(16, 1)]
]

/-- Partial product 110 for generator 20. -/
def rs_R005_ueqv_R005NNNN_partial_20_0110 : Poly :=
[
  term ((3 : Rat) / 2) [(0, 1), (8, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(0, 2), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (9, 1), (16, 1)],
  term ((-3 : Rat) / 4) [(1, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (8, 1), (16, 1)],
  term ((3 : Rat) / 4) [(2, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 4) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 20. -/
theorem rs_R005_ueqv_R005NNNN_partial_20_0110_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_20_0110
        rs_R005_ueqv_R005NNNN_generator_20_0100_0110 =
      rs_R005_ueqv_R005NNNN_partial_20_0110 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NNNN_partials_20_0100_0110 : List Poly :=
[
  rs_R005_ueqv_R005NNNN_partial_20_0100,
  rs_R005_ueqv_R005NNNN_partial_20_0101,
  rs_R005_ueqv_R005NNNN_partial_20_0102,
  rs_R005_ueqv_R005NNNN_partial_20_0103,
  rs_R005_ueqv_R005NNNN_partial_20_0104,
  rs_R005_ueqv_R005NNNN_partial_20_0105,
  rs_R005_ueqv_R005NNNN_partial_20_0106,
  rs_R005_ueqv_R005NNNN_partial_20_0107,
  rs_R005_ueqv_R005NNNN_partial_20_0108,
  rs_R005_ueqv_R005NNNN_partial_20_0109,
  rs_R005_ueqv_R005NNNN_partial_20_0110
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NNNN_block_20_0100_0110 : Poly :=
[
  term ((269 : Rat) / 28) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 56) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 56) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(0, 1), (8, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 112) [(0, 2), (13, 2), (16, 1)],
  term ((18 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 4) [(0, 2), (14, 1), (16, 1)],
  term ((19 : Rat) / 14) [(0, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(0, 2), (16, 1)],
  term ((269 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 56) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 56) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(1, 1), (9, 1), (16, 1)],
  term ((-269 : Rat) / 56) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 112) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 112) [(1, 2), (13, 2), (16, 1)],
  term ((18 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 4) [(1, 2), (14, 1), (16, 1)],
  term ((19 : Rat) / 14) [(1, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(1, 2), (16, 1)],
  term ((-269 : Rat) / 28) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(2, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(2, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 56) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 56) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 7) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((19 : Rat) / 7) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (8, 1), (16, 1)],
  term ((269 : Rat) / 56) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((10 : Rat) / 7) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 112) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 112) [(2, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(2, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 14) [(2, 2), (15, 2), (16, 1)],
  term ((3 : Rat) / 4) [(2, 2), (16, 1)],
  term ((-269 : Rat) / 28) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61 : Rat) / 56) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 56) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((19 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(3, 1), (9, 1), (16, 1)],
  term ((269 : Rat) / 56) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((10 : Rat) / 7) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61 : Rat) / 112) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 112) [(3, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(3, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 14) [(3, 2), (15, 2), (16, 1)],
  term ((3 : Rat) / 4) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 100 through 110. -/
theorem rs_R005_ueqv_R005NNNN_block_20_0100_0110_valid :
    checkProductSumEq rs_R005_ueqv_R005NNNN_partials_20_0100_0110
      rs_R005_ueqv_R005NNNN_block_20_0100_0110 = true := by
  native_decide

end R005UeqvR005NNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
