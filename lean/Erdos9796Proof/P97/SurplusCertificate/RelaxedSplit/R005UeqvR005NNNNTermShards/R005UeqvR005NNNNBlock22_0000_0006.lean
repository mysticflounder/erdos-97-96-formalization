/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NNNN, term block 22:0-6

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NNNNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
def rs_R005_ueqv_R005NNNN_generator_22_0000_0006 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NNNN_coefficient_22_0000 : Poly :=
[
  term ((-24 : Rat) / 7) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 22. -/
def rs_R005_ueqv_R005NNNN_partial_22_0000 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R005_ueqv_R005NNNN_partial_22_0000_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_22_0000
        rs_R005_ueqv_R005NNNN_generator_22_0000_0006 =
      rs_R005_ueqv_R005NNNN_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NNNN_coefficient_22_0001 : Poly :=
[
  term ((6 : Rat) / 7) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R005_ueqv_R005NNNN_partial_22_0001 : Poly :=
[
  term ((-12 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R005_ueqv_R005NNNN_partial_22_0001_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_22_0001
        rs_R005_ueqv_R005NNNN_generator_22_0000_0006 =
      rs_R005_ueqv_R005NNNN_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NNNN_coefficient_22_0002 : Poly :=
[
  term ((4 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 2 for generator 22. -/
def rs_R005_ueqv_R005NNNN_partial_22_0002 : Poly :=
[
  term ((-8 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((4 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((8 : Rat) / 7) [(4, 1), (10, 2), (16, 1)],
  term ((-4 : Rat) / 7) [(4, 2), (10, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem rs_R005_ueqv_R005NNNN_partial_22_0002_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_22_0002
        rs_R005_ueqv_R005NNNN_generator_22_0000_0006 =
      rs_R005_ueqv_R005NNNN_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NNNN_coefficient_22_0003 : Poly :=
[
  term ((-15 : Rat) / 7) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 22. -/
def rs_R005_ueqv_R005NNNN_partial_22_0003 : Poly :=
[
  term ((30 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem rs_R005_ueqv_R005NNNN_partial_22_0003_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_22_0003
        rs_R005_ueqv_R005NNNN_generator_22_0000_0006 =
      rs_R005_ueqv_R005NNNN_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NNNN_coefficient_22_0004 : Poly :=
[
  term ((18 : Rat) / 7) [(14, 1), (16, 1)]
]

/-- Partial product 4 for generator 22. -/
def rs_R005_ueqv_R005NNNN_partial_22_0004 : Poly :=
[
  term ((-36 : Rat) / 7) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((18 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((18 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((36 : Rat) / 7) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(4, 2), (14, 1), (16, 1)],
  term ((36 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem rs_R005_ueqv_R005NNNN_partial_22_0004_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_22_0004
        rs_R005_ueqv_R005NNNN_generator_22_0000_0006 =
      rs_R005_ueqv_R005NNNN_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NNNN_coefficient_22_0005 : Poly :=
[
  term ((3 : Rat) / 7) [(15, 2), (16, 1)]
]

/-- Partial product 5 for generator 22. -/
def rs_R005_ueqv_R005NNNN_partial_22_0005 : Poly :=
[
  term ((-6 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((6 : Rat) / 7) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 2), (15, 2), (16, 1)],
  term ((6 : Rat) / 7) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 7) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem rs_R005_ueqv_R005NNNN_partial_22_0005_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_22_0005
        rs_R005_ueqv_R005NNNN_generator_22_0000_0006 =
      rs_R005_ueqv_R005NNNN_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005NNNN_coefficient_22_0006 : Poly :=
[
  term ((-18 : Rat) / 7) [(16, 1)]
]

/-- Partial product 6 for generator 22. -/
def rs_R005_ueqv_R005NNNN_partial_22_0006 : Poly :=
[
  term ((36 : Rat) / 7) [(0, 1), (10, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (11, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(4, 1), (10, 1), (16, 1)],
  term ((18 : Rat) / 7) [(4, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((18 : Rat) / 7) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem rs_R005_ueqv_R005NNNN_partial_22_0006_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_22_0006
        rs_R005_ueqv_R005NNNN_generator_22_0000_0006 =
      rs_R005_ueqv_R005NNNN_partial_22_0006 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NNNN_partials_22_0000_0006 : List Poly :=
[
  rs_R005_ueqv_R005NNNN_partial_22_0000,
  rs_R005_ueqv_R005NNNN_partial_22_0001,
  rs_R005_ueqv_R005NNNN_partial_22_0002,
  rs_R005_ueqv_R005NNNN_partial_22_0003,
  rs_R005_ueqv_R005NNNN_partial_22_0004,
  rs_R005_ueqv_R005NNNN_partial_22_0005,
  rs_R005_ueqv_R005NNNN_partial_22_0006
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NNNN_block_22_0000_0006 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(0, 1), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (11, 1), (16, 1)],
  term ((30 : Rat) / 7) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 7) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(4, 1), (10, 1), (16, 1)],
  term ((8 : Rat) / 7) [(4, 1), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(4, 2), (10, 1), (16, 1)],
  term ((15 : Rat) / 7) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(4, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(4, 2), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(4, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((36 : Rat) / 7) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 7) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(5, 1), (11, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(5, 2), (10, 1), (16, 1)],
  term ((15 : Rat) / 7) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(5, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(5, 2), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 6. -/
theorem rs_R005_ueqv_R005NNNN_block_22_0000_0006_valid :
    checkProductSumEq rs_R005_ueqv_R005NNNN_partials_22_0000_0006
      rs_R005_ueqv_R005NNNN_block_22_0000_0006 = true := by
  native_decide

end R005UeqvR005NNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
