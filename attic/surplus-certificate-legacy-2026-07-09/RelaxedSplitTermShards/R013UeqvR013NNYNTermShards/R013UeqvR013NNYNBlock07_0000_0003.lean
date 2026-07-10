/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 7:0-3

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_07_0000_0003 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (4, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013NNYN_coefficient_07_0000 : Poly :=
[
  term ((-1440 : Rat) / 103) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R013_ueqv_R013NNYN_partial_07_0000 : Poly :=
[
  term ((2880 : Rat) / 103) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R013_ueqv_R013NNYN_partial_07_0000_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_07_0000
        rs_R013_ueqv_R013NNYN_generator_07_0000_0003 =
      rs_R013_ueqv_R013NNYN_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013NNYN_coefficient_07_0001 : Poly :=
[
  term ((1584 : Rat) / 103) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R013_ueqv_R013NNYN_partial_07_0001 : Poly :=
[
  term ((-3168 : Rat) / 103) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((3168 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3168 : Rat) / 103) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3168 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R013_ueqv_R013NNYN_partial_07_0001_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_07_0001
        rs_R013_ueqv_R013NNYN_generator_07_0000_0003 =
      rs_R013_ueqv_R013NNYN_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013NNYN_coefficient_07_0002 : Poly :=
[
  term ((1440 : Rat) / 103) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R013_ueqv_R013NNYN_partial_07_0002 : Poly :=
[
  term ((-2880 : Rat) / 103) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R013_ueqv_R013NNYN_partial_07_0002_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_07_0002
        rs_R013_ueqv_R013NNYN_generator_07_0000_0003 =
      rs_R013_ueqv_R013NNYN_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013NNYN_coefficient_07_0003 : Poly :=
[
  term ((-1584 : Rat) / 103) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R013_ueqv_R013NNYN_partial_07_0003 : Poly :=
[
  term ((3168 : Rat) / 103) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3168 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((3168 : Rat) / 103) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3168 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R013_ueqv_R013NNYN_partial_07_0003_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_07_0003
        rs_R013_ueqv_R013NNYN_generator_07_0000_0003 =
      rs_R013_ueqv_R013NNYN_partial_07_0003 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_07_0000_0003 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_07_0000,
  rs_R013_ueqv_R013NNYN_partial_07_0001,
  rs_R013_ueqv_R013NNYN_partial_07_0002,
  rs_R013_ueqv_R013NNYN_partial_07_0003
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_07_0000_0003 : Poly :=
[
  term ((2880 : Rat) / 103) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3168 : Rat) / 103) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((3168 : Rat) / 103) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((3168 : Rat) / 103) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3168 : Rat) / 103) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3168 : Rat) / 103) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((3168 : Rat) / 103) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2880 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((3168 : Rat) / 103) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((2880 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3168 : Rat) / 103) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 103) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1584 : Rat) / 103) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 103) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((1584 : Rat) / 103) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 3. -/
theorem rs_R013_ueqv_R013NNYN_block_07_0000_0003_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_07_0000_0003
      rs_R013_ueqv_R013NNYN_block_07_0000_0003 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
