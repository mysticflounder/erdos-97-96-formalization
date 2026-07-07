/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 21:100-110

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_21_0100_0110 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0100 : Poly :=
[
  term ((20 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0100 : Poly :=
[
  term ((-40 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((20 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((20 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((40 : Rat) / 7) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(6, 2), (10, 1), (16, 1)],
  term ((40 : Rat) / 7) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0100_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0100
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0101 : Poly :=
[
  term ((64 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0101 : Poly :=
[
  term ((-128 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0101_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0101
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0102 : Poly :=
[
  term (-3 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0102 : Poly :=
[
  term (6 : Rat) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0102_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0102
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0103 : Poly :=
[
  term ((-9 : Rat) / 56) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0103 : Poly :=
[
  term ((9 : Rat) / 28) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 56) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 56) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 28) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 56) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 28) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 56) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0103_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0103
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0104 : Poly :=
[
  term ((-24 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 104 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0104 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(7, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0104_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0104
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0105 : Poly :=
[
  term ((-80 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0105 : Poly :=
[
  term ((160 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(7, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0105_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0105
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0106 : Poly :=
[
  term ((16 : Rat) / 7) [(11, 2), (16, 1)]
]

/-- Partial product 106 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0106 : Poly :=
[
  term ((-32 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((16 : Rat) / 7) [(0, 2), (11, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((16 : Rat) / 7) [(1, 2), (11, 2), (16, 1)],
  term ((32 : Rat) / 7) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(6, 2), (11, 2), (16, 1)],
  term ((32 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0106_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0106
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0107 : Poly :=
[
  term ((53 : Rat) / 56) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0107 : Poly :=
[
  term ((-53 : Rat) / 28) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((53 : Rat) / 56) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((53 : Rat) / 56) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((53 : Rat) / 28) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53 : Rat) / 56) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((53 : Rat) / 28) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53 : Rat) / 56) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0107_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0107
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0108 : Poly :=
[
  term ((41 : Rat) / 56) [(13, 2), (16, 1)]
]

/-- Partial product 108 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0108 : Poly :=
[
  term ((-41 : Rat) / 28) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((41 : Rat) / 56) [(0, 2), (13, 2), (16, 1)],
  term ((-41 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((41 : Rat) / 56) [(1, 2), (13, 2), (16, 1)],
  term ((41 : Rat) / 28) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 56) [(6, 2), (13, 2), (16, 1)],
  term ((41 : Rat) / 28) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 56) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0108_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0108
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0109 : Poly :=
[
  term ((-6 : Rat) / 7) [(14, 1), (16, 1)]
]

/-- Partial product 109 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0109 : Poly :=
[
  term ((12 : Rat) / 7) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 7) [(6, 2), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 7) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0109_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0109
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def rs_R011_ueqv_R011NNNY_coefficient_21_0110 : Poly :=
[
  term ((-17 : Rat) / 14) [(16, 1)]
]

/-- Partial product 110 for generator 21. -/
def rs_R011_ueqv_R011NNNY_partial_21_0110 : Poly :=
[
  term ((17 : Rat) / 7) [(0, 1), (8, 1), (16, 1)],
  term ((-17 : Rat) / 14) [(0, 2), (16, 1)],
  term ((17 : Rat) / 7) [(1, 1), (9, 1), (16, 1)],
  term ((-17 : Rat) / 14) [(1, 2), (16, 1)],
  term ((-17 : Rat) / 7) [(6, 1), (8, 1), (16, 1)],
  term ((17 : Rat) / 14) [(6, 2), (16, 1)],
  term ((-17 : Rat) / 7) [(7, 1), (9, 1), (16, 1)],
  term ((17 : Rat) / 14) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem rs_R011_ueqv_R011NNNY_partial_21_0110_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_21_0110
        rs_R011_ueqv_R011NNNY_generator_21_0100_0110 =
      rs_R011_ueqv_R011NNNY_partial_21_0110 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_21_0100_0110 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_21_0100,
  rs_R011_ueqv_R011NNNY_partial_21_0101,
  rs_R011_ueqv_R011NNNY_partial_21_0102,
  rs_R011_ueqv_R011NNNY_partial_21_0103,
  rs_R011_ueqv_R011NNNY_partial_21_0104,
  rs_R011_ueqv_R011NNNY_partial_21_0105,
  rs_R011_ueqv_R011NNNY_partial_21_0106,
  rs_R011_ueqv_R011NNNY_partial_21_0107,
  rs_R011_ueqv_R011NNNY_partial_21_0108,
  rs_R011_ueqv_R011NNNY_partial_21_0109,
  rs_R011_ueqv_R011NNNY_partial_21_0110
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_21_0100_0110 : Poly :=
[
  term ((-40 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 28) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((-53 : Rat) / 28) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 28) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((17 : Rat) / 7) [(0, 1), (8, 1), (16, 1)],
  term ((20 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9 : Rat) / 56) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(0, 2), (11, 2), (16, 1)],
  term ((53 : Rat) / 56) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 56) [(0, 2), (13, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((-17 : Rat) / 14) [(0, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-53 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((17 : Rat) / 7) [(1, 1), (9, 1), (16, 1)],
  term ((20 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9 : Rat) / 56) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(1, 2), (11, 2), (16, 1)],
  term ((53 : Rat) / 56) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 56) [(1, 2), (13, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((-17 : Rat) / 14) [(1, 2), (16, 1)],
  term ((40 : Rat) / 7) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((128 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9 : Rat) / 28) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((53 : Rat) / 28) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 28) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(6, 1), (8, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(6, 2), (10, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 56) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(6, 2), (11, 2), (16, 1)],
  term ((-53 : Rat) / 56) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 56) [(6, 2), (13, 2), (16, 1)],
  term ((6 : Rat) / 7) [(6, 2), (14, 1), (16, 1)],
  term ((17 : Rat) / 14) [(6, 2), (16, 1)],
  term ((40 : Rat) / 7) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((128 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9 : Rat) / 28) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((53 : Rat) / 28) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 28) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(7, 1), (9, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(7, 2), (10, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 56) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(7, 2), (11, 2), (16, 1)],
  term ((-53 : Rat) / 56) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 56) [(7, 2), (13, 2), (16, 1)],
  term ((6 : Rat) / 7) [(7, 2), (14, 1), (16, 1)],
  term ((17 : Rat) / 14) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 110. -/
theorem rs_R011_ueqv_R011NNNY_block_21_0100_0110_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_21_0100_0110
      rs_R011_ueqv_R011NNNY_block_21_0100_0110 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
