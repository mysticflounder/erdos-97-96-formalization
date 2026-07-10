/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 7:0-3

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_07_0000_0003 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (6, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011NNNY_coefficient_07_0000 : Poly :=
[
  term ((12 : Rat) / 7) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R011_ueqv_R011NNNY_partial_07_0000 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R011_ueqv_R011NNNY_partial_07_0000_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_07_0000
        rs_R011_ueqv_R011NNNY_generator_07_0000_0003 =
      rs_R011_ueqv_R011NNNY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011NNNY_coefficient_07_0001 : Poly :=
[
  term ((-24 : Rat) / 7) [(9, 2), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R011_ueqv_R011NNNY_partial_07_0001 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 2), (9, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 2), (9, 2), (16, 1)],
  term ((24 : Rat) / 7) [(6, 2), (9, 2), (16, 1)],
  term ((24 : Rat) / 7) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R011_ueqv_R011NNNY_partial_07_0001_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_07_0001
        rs_R011_ueqv_R011NNNY_generator_07_0000_0003 =
      rs_R011_ueqv_R011NNNY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011NNNY_coefficient_07_0002 : Poly :=
[
  term ((-12 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R011_ueqv_R011NNNY_partial_07_0002 : Poly :=
[
  term ((24 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R011_ueqv_R011NNNY_partial_07_0002_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_07_0002
        rs_R011_ueqv_R011NNNY_generator_07_0000_0003 =
      rs_R011_ueqv_R011NNNY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R011_ueqv_R011NNNY_coefficient_07_0003 : Poly :=
[
  term ((24 : Rat) / 7) [(11, 2), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R011_ueqv_R011NNNY_partial_07_0003 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((24 : Rat) / 7) [(2, 2), (11, 2), (16, 1)],
  term ((24 : Rat) / 7) [(3, 2), (11, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(6, 2), (11, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R011_ueqv_R011NNNY_partial_07_0003_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_07_0003
        rs_R011_ueqv_R011NNNY_generator_07_0000_0003 =
      rs_R011_ueqv_R011NNNY_partial_07_0003 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_07_0000_0003 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_07_0000,
  rs_R011_ueqv_R011NNNY_partial_07_0001,
  rs_R011_ueqv_R011NNNY_partial_07_0002,
  rs_R011_ueqv_R011NNNY_partial_07_0003
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_07_0000_0003 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((12 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 2), (9, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(2, 2), (11, 2), (16, 1)],
  term ((12 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 2), (9, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 2), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(6, 2), (9, 2), (16, 1)],
  term ((12 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(6, 2), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(7, 2), (9, 2), (16, 1)],
  term ((12 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 3. -/
theorem rs_R011_ueqv_R011NNNY_block_07_0000_0003_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_07_0000_0003
      rs_R011_ueqv_R011NNNY_block_07_0000_0003 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
