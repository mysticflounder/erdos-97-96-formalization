/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 10:200-207

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_10_0200_0207 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0200 : Poly :=
[
  term ((-129 : Rat) / 28) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0200 : Poly :=
[
  term ((129 : Rat) / 14) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-129 : Rat) / 28) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((129 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-129 : Rat) / 28) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0200_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0200
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0201 : Poly :=
[
  term ((-649 : Rat) / 5) [(12, 1)]
]

/-- Partial product 201 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0201 : Poly :=
[
  term ((1298 : Rat) / 5) [(0, 1), (2, 1), (12, 1)],
  term ((-649 : Rat) / 5) [(0, 2), (12, 1)],
  term ((1298 : Rat) / 5) [(1, 1), (3, 1), (12, 1)],
  term ((-649 : Rat) / 5) [(1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0201_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0201
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0202 : Poly :=
[
  term ((616 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 202 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0202 : Poly :=
[
  term ((-1232 : Rat) / 5) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((616 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((-1232 : Rat) / 5) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((616 : Rat) / 5) [(1, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0202_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0202
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0203 : Poly :=
[
  term ((-2 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 203 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0203 : Poly :=
[
  term ((4 : Rat) / 5) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((4 : Rat) / 5) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0203_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0203
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0204 : Poly :=
[
  term ((-687 : Rat) / 50) [(13, 1), (15, 1)]
]

/-- Partial product 204 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0204 : Poly :=
[
  term ((687 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-687 : Rat) / 50) [(0, 2), (13, 1), (15, 1)],
  term ((687 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-687 : Rat) / 50) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0204_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0204
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0205 : Poly :=
[
  term ((27 : Rat) / 10) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0205 : Poly :=
[
  term ((-27 : Rat) / 5) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 10) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0205_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0205
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0206 : Poly :=
[
  term ((-362 : Rat) / 5) [(14, 1)]
]

/-- Partial product 206 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0206 : Poly :=
[
  term ((724 : Rat) / 5) [(0, 1), (2, 1), (14, 1)],
  term ((-362 : Rat) / 5) [(0, 2), (14, 1)],
  term ((724 : Rat) / 5) [(1, 1), (3, 1), (14, 1)],
  term ((-362 : Rat) / 5) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0206_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0206
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 10. -/
def rs_R003_ueqv_R003YY_coefficient_10_0207 : Poly :=
[
  term ((4 : Rat) / 5) [(16, 1)]
]

/-- Partial product 207 for generator 10. -/
def rs_R003_ueqv_R003YY_partial_10_0207 : Poly :=
[
  term ((-8 : Rat) / 5) [(0, 1), (2, 1), (16, 1)],
  term ((4 : Rat) / 5) [(0, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (3, 1), (16, 1)],
  term ((4 : Rat) / 5) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 10. -/
theorem rs_R003_ueqv_R003YY_partial_10_0207_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_10_0207
        rs_R003_ueqv_R003YY_generator_10_0200_0207 =
      rs_R003_ueqv_R003YY_partial_10_0207 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_10_0200_0207 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_10_0200,
  rs_R003_ueqv_R003YY_partial_10_0201,
  rs_R003_ueqv_R003YY_partial_10_0202,
  rs_R003_ueqv_R003YY_partial_10_0203,
  rs_R003_ueqv_R003YY_partial_10_0204,
  rs_R003_ueqv_R003YY_partial_10_0205,
  rs_R003_ueqv_R003YY_partial_10_0206,
  rs_R003_ueqv_R003YY_partial_10_0207
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_10_0200_0207 : Poly :=
[
  term ((129 : Rat) / 14) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1298 : Rat) / 5) [(0, 1), (2, 1), (12, 1)],
  term ((-1232 : Rat) / 5) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((687 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-27 : Rat) / 5) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((724 : Rat) / 5) [(0, 1), (2, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(0, 1), (2, 1), (16, 1)],
  term ((-129 : Rat) / 28) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-649 : Rat) / 5) [(0, 2), (12, 1)],
  term ((616 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(0, 2), (12, 1), (16, 1)],
  term ((-687 : Rat) / 50) [(0, 2), (13, 1), (15, 1)],
  term ((27 : Rat) / 10) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-362 : Rat) / 5) [(0, 2), (14, 1)],
  term ((4 : Rat) / 5) [(0, 2), (16, 1)],
  term ((129 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1298 : Rat) / 5) [(1, 1), (3, 1), (12, 1)],
  term ((-1232 : Rat) / 5) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((687 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-27 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((724 : Rat) / 5) [(1, 1), (3, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (3, 1), (16, 1)],
  term ((-129 : Rat) / 28) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-649 : Rat) / 5) [(1, 2), (12, 1)],
  term ((616 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (12, 1), (16, 1)],
  term ((-687 : Rat) / 50) [(1, 2), (13, 1), (15, 1)],
  term ((27 : Rat) / 10) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-362 : Rat) / 5) [(1, 2), (14, 1)],
  term ((4 : Rat) / 5) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 200 through 207. -/
theorem rs_R003_ueqv_R003YY_block_10_0200_0207_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_10_0200_0207
      rs_R003_ueqv_R003YY_block_10_0200_0207 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
