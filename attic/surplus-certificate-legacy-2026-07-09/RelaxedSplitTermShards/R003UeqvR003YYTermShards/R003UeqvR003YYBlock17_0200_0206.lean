/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 17:200-206

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_17_0200_0206 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003YY_coefficient_17_0200 : Poly :=
[
  term ((867 : Rat) / 140) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 17. -/
def rs_R003_ueqv_R003YY_partial_17_0200 : Poly :=
[
  term ((867 : Rat) / 70) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-867 : Rat) / 140) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((867 : Rat) / 70) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-867 : Rat) / 140) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 17. -/
theorem rs_R003_ueqv_R003YY_partial_17_0200_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_17_0200
        rs_R003_ueqv_R003YY_generator_17_0200_0206 =
      rs_R003_ueqv_R003YY_partial_17_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003YY_coefficient_17_0201 : Poly :=
[
  term (137 : Rat) [(12, 1)]
]

/-- Partial product 201 for generator 17. -/
def rs_R003_ueqv_R003YY_partial_17_0201 : Poly :=
[
  term (274 : Rat) [(2, 1), (6, 1), (12, 1)],
  term (-137 : Rat) [(2, 2), (12, 1)],
  term (274 : Rat) [(3, 1), (7, 1), (12, 1)],
  term (-137 : Rat) [(3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 17. -/
theorem rs_R003_ueqv_R003YY_partial_17_0201_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_17_0201
        rs_R003_ueqv_R003YY_generator_17_0200_0206 =
      rs_R003_ueqv_R003YY_partial_17_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003YY_coefficient_17_0202 : Poly :=
[
  term ((-668 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 202 for generator 17. -/
def rs_R003_ueqv_R003YY_partial_17_0202 : Poly :=
[
  term ((-1336 : Rat) / 5) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((668 : Rat) / 5) [(2, 2), (12, 1), (14, 1)],
  term ((-1336 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((668 : Rat) / 5) [(3, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 17. -/
theorem rs_R003_ueqv_R003YY_partial_17_0202_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_17_0202
        rs_R003_ueqv_R003YY_generator_17_0200_0206 =
      rs_R003_ueqv_R003YY_partial_17_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003YY_coefficient_17_0203 : Poly :=
[
  term ((1 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 203 for generator 17. -/
def rs_R003_ueqv_R003YY_partial_17_0203 : Poly :=
[
  term ((2 : Rat) / 5) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(2, 2), (12, 1), (16, 1)],
  term ((2 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 17. -/
theorem rs_R003_ueqv_R003YY_partial_17_0203_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_17_0203
        rs_R003_ueqv_R003YY_generator_17_0200_0206 =
      rs_R003_ueqv_R003YY_partial_17_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003YY_coefficient_17_0204 : Poly :=
[
  term ((-12 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 204 for generator 17. -/
def rs_R003_ueqv_R003YY_partial_17_0204 : Poly :=
[
  term ((-24 : Rat) / 25) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((12 : Rat) / 25) [(2, 2), (13, 1), (15, 1)],
  term ((-24 : Rat) / 25) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((12 : Rat) / 25) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 17. -/
theorem rs_R003_ueqv_R003YY_partial_17_0204_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_17_0204
        rs_R003_ueqv_R003YY_generator_17_0200_0206 =
      rs_R003_ueqv_R003YY_partial_17_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003YY_coefficient_17_0205 : Poly :=
[
  term (92 : Rat) [(14, 1)]
]

/-- Partial product 205 for generator 17. -/
def rs_R003_ueqv_R003YY_partial_17_0205 : Poly :=
[
  term (184 : Rat) [(2, 1), (6, 1), (14, 1)],
  term (-92 : Rat) [(2, 2), (14, 1)],
  term (184 : Rat) [(3, 1), (7, 1), (14, 1)],
  term (-92 : Rat) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 17. -/
theorem rs_R003_ueqv_R003YY_partial_17_0205_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_17_0205
        rs_R003_ueqv_R003YY_generator_17_0200_0206 =
      rs_R003_ueqv_R003YY_partial_17_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003YY_coefficient_17_0206 : Poly :=
[
  term ((-2 : Rat) / 5) [(16, 1)]
]

/-- Partial product 206 for generator 17. -/
def rs_R003_ueqv_R003YY_partial_17_0206 : Poly :=
[
  term ((-4 : Rat) / 5) [(2, 1), (6, 1), (16, 1)],
  term ((2 : Rat) / 5) [(2, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(3, 1), (7, 1), (16, 1)],
  term ((2 : Rat) / 5) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 17. -/
theorem rs_R003_ueqv_R003YY_partial_17_0206_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_17_0206
        rs_R003_ueqv_R003YY_generator_17_0200_0206 =
      rs_R003_ueqv_R003YY_partial_17_0206 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_17_0200_0206 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_17_0200,
  rs_R003_ueqv_R003YY_partial_17_0201,
  rs_R003_ueqv_R003YY_partial_17_0202,
  rs_R003_ueqv_R003YY_partial_17_0203,
  rs_R003_ueqv_R003YY_partial_17_0204,
  rs_R003_ueqv_R003YY_partial_17_0205,
  rs_R003_ueqv_R003YY_partial_17_0206
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_17_0200_0206 : Poly :=
[
  term ((867 : Rat) / 70) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (274 : Rat) [(2, 1), (6, 1), (12, 1)],
  term ((-1336 : Rat) / 5) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((2 : Rat) / 5) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-24 : Rat) / 25) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term (184 : Rat) [(2, 1), (6, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(2, 1), (6, 1), (16, 1)],
  term ((-867 : Rat) / 140) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (-137 : Rat) [(2, 2), (12, 1)],
  term ((668 : Rat) / 5) [(2, 2), (12, 1), (14, 1)],
  term ((-1 : Rat) / 5) [(2, 2), (12, 1), (16, 1)],
  term ((12 : Rat) / 25) [(2, 2), (13, 1), (15, 1)],
  term (-92 : Rat) [(2, 2), (14, 1)],
  term ((2 : Rat) / 5) [(2, 2), (16, 1)],
  term ((867 : Rat) / 70) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (274 : Rat) [(3, 1), (7, 1), (12, 1)],
  term ((-1336 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((2 : Rat) / 5) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-24 : Rat) / 25) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term (184 : Rat) [(3, 1), (7, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(3, 1), (7, 1), (16, 1)],
  term ((-867 : Rat) / 140) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (-137 : Rat) [(3, 2), (12, 1)],
  term ((668 : Rat) / 5) [(3, 2), (12, 1), (14, 1)],
  term ((-1 : Rat) / 5) [(3, 2), (12, 1), (16, 1)],
  term ((12 : Rat) / 25) [(3, 2), (13, 1), (15, 1)],
  term (-92 : Rat) [(3, 2), (14, 1)],
  term ((2 : Rat) / 5) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 200 through 206. -/
theorem rs_R003_ueqv_R003YY_block_17_0200_0206_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_17_0200_0206
      rs_R003_ueqv_R003YY_block_17_0200_0206 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
