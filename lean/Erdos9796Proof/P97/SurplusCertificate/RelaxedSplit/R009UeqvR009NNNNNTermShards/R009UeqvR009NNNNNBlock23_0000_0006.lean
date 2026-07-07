/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 23:0-6

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 23 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NNNNN_coefficient_23_0000 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 23. -/
def rs_R009_ueqv_R009NNNNN_partial_23_0000 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 2), (11, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem rs_R009_ueqv_R009NNNNN_partial_23_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_23_0000
        rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 =
      rs_R009_ueqv_R009NNNNN_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NNNNN_coefficient_23_0001 : Poly :=
[
  term ((2364 : Rat) / 589) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 1 for generator 23. -/
def rs_R009_ueqv_R009NNNNN_partial_23_0001 : Poly :=
[
  term ((-4728 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem rs_R009_ueqv_R009NNNNN_partial_23_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_23_0001
        rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 =
      rs_R009_ueqv_R009NNNNN_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NNNNN_coefficient_23_0002 : Poly :=
[
  term ((2364 : Rat) / 589) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 23. -/
def rs_R009_ueqv_R009NNNNN_partial_23_0002 : Poly :=
[
  term ((-4728 : Rat) / 589) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem rs_R009_ueqv_R009NNNNN_partial_23_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_23_0002
        rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 =
      rs_R009_ueqv_R009NNNNN_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NNNNN_coefficient_23_0003 : Poly :=
[
  term ((114 : Rat) / 31) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 23. -/
def rs_R009_ueqv_R009NNNNN_partial_23_0003 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem rs_R009_ueqv_R009NNNNN_partial_23_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_23_0003
        rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 =
      rs_R009_ueqv_R009NNNNN_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NNNNN_coefficient_23_0004 : Poly :=
[
  term ((41029 : Rat) / 1767) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 23. -/
def rs_R009_ueqv_R009NNNNN_partial_23_0004 : Poly :=
[
  term ((-82058 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem rs_R009_ueqv_R009NNNNN_partial_23_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_23_0004
        rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 =
      rs_R009_ueqv_R009NNNNN_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NNNNN_coefficient_23_0005 : Poly :=
[
  term ((114 : Rat) / 31) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 23. -/
def rs_R009_ueqv_R009NNNNN_partial_23_0005 : Poly :=
[
  term ((-228 : Rat) / 31) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem rs_R009_ueqv_R009NNNNN_partial_23_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_23_0005
        rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 =
      rs_R009_ueqv_R009NNNNN_partial_23_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 23. -/
def rs_R009_ueqv_R009NNNNN_coefficient_23_0006 : Poly :=
[
  term ((41029 : Rat) / 1767) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 23. -/
def rs_R009_ueqv_R009NNNNN_partial_23_0006 : Poly :=
[
  term ((-82058 : Rat) / 1767) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 23. -/
theorem rs_R009_ueqv_R009NNNNN_partial_23_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_23_0006
        rs_R009_ueqv_R009NNNNN_generator_23_0000_0006 =
      rs_R009_ueqv_R009NNNNN_partial_23_0006 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_23_0000_0006 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_23_0000,
  rs_R009_ueqv_R009NNNNN_partial_23_0001,
  rs_R009_ueqv_R009NNNNN_partial_23_0002,
  rs_R009_ueqv_R009NNNNN_partial_23_0003,
  rs_R009_ueqv_R009NNNNN_partial_23_0004,
  rs_R009_ueqv_R009NNNNN_partial_23_0005,
  rs_R009_ueqv_R009NNNNN_partial_23_0006
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_23_0000_0006 : Poly :=
[
  term ((36800 : Rat) / 1767) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((2364 : Rat) / 589) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((114 : Rat) / 31) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((41029 : Rat) / 1767) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(1, 2), (11, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(1, 3), (11, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2364 : Rat) / 589) [(3, 1), (9, 3), (16, 1)],
  term ((228 : Rat) / 31) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(9, 3), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 6. -/
theorem rs_R009_ueqv_R009NNNNN_block_23_0000_0006_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_23_0000_0006
      rs_R009_ueqv_R009NNNNN_block_23_0000_0006 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
