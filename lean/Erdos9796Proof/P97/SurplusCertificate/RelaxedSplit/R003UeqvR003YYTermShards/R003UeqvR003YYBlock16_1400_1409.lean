/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 16:1400-1409

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_16_1400_1409 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1400 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1400 : Poly :=
[
  term ((-12 : Rat) / 5) [(12, 2), (16, 1)]
]

/-- Partial product 1400 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1400 : Poly :=
[
  term ((-24 : Rat) / 5) [(6, 1), (12, 2), (16, 1)],
  term ((12 : Rat) / 5) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1400 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1400
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1400 := by
  native_decide

/-- Coefficient term 1401 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1401 : Poly :=
[
  term ((-6 : Rat) / 5) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1401 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1401 : Poly :=
[
  term ((-12 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((6 : Rat) / 5) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1401 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1401
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1401 := by
  native_decide

/-- Coefficient term 1402 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1402 : Poly :=
[
  term ((137737 : Rat) / 8400) [(13, 1), (15, 1)]
]

/-- Partial product 1402 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1402 : Poly :=
[
  term ((137737 : Rat) / 4200) [(6, 1), (13, 1), (15, 1)],
  term ((-137737 : Rat) / 8400) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1402 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1402
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1402 := by
  native_decide

/-- Coefficient term 1403 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1403 : Poly :=
[
  term ((-863 : Rat) / 560) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1403 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1403 : Poly :=
[
  term ((-863 : Rat) / 280) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((863 : Rat) / 560) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1403 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1403
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1403 := by
  native_decide

/-- Coefficient term 1404 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1404 : Poly :=
[
  term ((-529458 : Rat) / 53375) [(13, 2)]
]

/-- Partial product 1404 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1404 : Poly :=
[
  term ((-1058916 : Rat) / 53375) [(6, 1), (13, 2)],
  term ((529458 : Rat) / 53375) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1404 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1404
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1404 := by
  native_decide

/-- Coefficient term 1405 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1405 : Poly :=
[
  term ((-889352 : Rat) / 53375) [(13, 2), (14, 1)]
]

/-- Partial product 1405 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1405 : Poly :=
[
  term ((-1778704 : Rat) / 53375) [(6, 1), (13, 2), (14, 1)],
  term ((889352 : Rat) / 53375) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1405 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1405
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1405 := by
  native_decide

/-- Coefficient term 1406 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1406 : Poly :=
[
  term ((1376 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1406 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1406 : Poly :=
[
  term ((2752 : Rat) / 35) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1376 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1406 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1406
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1406 := by
  native_decide

/-- Coefficient term 1407 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1407 : Poly :=
[
  term ((-1118 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 1407 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1407 : Poly :=
[
  term ((-2236 : Rat) / 35) [(6, 1), (13, 2), (16, 1)],
  term ((1118 : Rat) / 35) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1407 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1407
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1407 := by
  native_decide

/-- Coefficient term 1408 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1408 : Poly :=
[
  term ((141 : Rat) / 5) [(14, 1)]
]

/-- Partial product 1408 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1408 : Poly :=
[
  term ((282 : Rat) / 5) [(6, 1), (14, 1)],
  term ((-141 : Rat) / 5) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1408 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1408
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1408 := by
  native_decide

/-- Coefficient term 1409 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1409 : Poly :=
[
  term ((-3 : Rat) / 10) [(16, 1)]
]

/-- Partial product 1409 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1409 : Poly :=
[
  term ((-3 : Rat) / 5) [(6, 1), (16, 1)],
  term ((3 : Rat) / 10) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1409 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1409
        rs_R003_ueqv_R003YY_generator_16_1400_1409 =
      rs_R003_ueqv_R003YY_partial_16_1409 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_16_1400_1409 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_16_1400,
  rs_R003_ueqv_R003YY_partial_16_1401,
  rs_R003_ueqv_R003YY_partial_16_1402,
  rs_R003_ueqv_R003YY_partial_16_1403,
  rs_R003_ueqv_R003YY_partial_16_1404,
  rs_R003_ueqv_R003YY_partial_16_1405,
  rs_R003_ueqv_R003YY_partial_16_1406,
  rs_R003_ueqv_R003YY_partial_16_1407,
  rs_R003_ueqv_R003YY_partial_16_1408,
  rs_R003_ueqv_R003YY_partial_16_1409
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_16_1400_1409 : Poly :=
[
  term ((-24 : Rat) / 5) [(6, 1), (12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((137737 : Rat) / 4200) [(6, 1), (13, 1), (15, 1)],
  term ((-863 : Rat) / 280) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1058916 : Rat) / 53375) [(6, 1), (13, 2)],
  term ((-1778704 : Rat) / 53375) [(6, 1), (13, 2), (14, 1)],
  term ((2752 : Rat) / 35) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2236 : Rat) / 35) [(6, 1), (13, 2), (16, 1)],
  term ((282 : Rat) / 5) [(6, 1), (14, 1)],
  term ((-3 : Rat) / 5) [(6, 1), (16, 1)],
  term ((12 : Rat) / 5) [(12, 2), (16, 1)],
  term ((6 : Rat) / 5) [(13, 1), (14, 1), (15, 1)],
  term ((-137737 : Rat) / 8400) [(13, 1), (15, 1)],
  term ((863 : Rat) / 560) [(13, 1), (15, 1), (16, 1)],
  term ((529458 : Rat) / 53375) [(13, 2)],
  term ((889352 : Rat) / 53375) [(13, 2), (14, 1)],
  term ((-1376 : Rat) / 35) [(13, 2), (14, 1), (16, 1)],
  term ((1118 : Rat) / 35) [(13, 2), (16, 1)],
  term ((-141 : Rat) / 5) [(14, 1)],
  term ((3 : Rat) / 10) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 1400 through 1409. -/
theorem rs_R003_ueqv_R003YY_block_16_1400_1409_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_16_1400_1409
      rs_R003_ueqv_R003YY_block_16_1400_1409 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
