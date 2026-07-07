/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 9:400-432

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_09_0400_0432 : Poly :=
[
  term (2 : Rat) [(0, 1), (8, 1)],
  term (2 : Rat) [(1, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0400 : Poly :=
[
  term ((865264 : Rat) / 53375) [(10, 1), (13, 2)]
]

/-- Partial product 400 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0400 : Poly :=
[
  term ((1730528 : Rat) / 53375) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((1730528 : Rat) / 53375) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-865264 : Rat) / 53375) [(8, 2), (10, 1), (13, 2)],
  term ((-865264 : Rat) / 53375) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0400
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0401 : Poly :=
[
  term ((-768 : Rat) / 35) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 401 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0401 : Poly :=
[
  term ((-1536 : Rat) / 35) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-1536 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((768 : Rat) / 35) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((768 : Rat) / 35) [(9, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0401
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0402 : Poly :=
[
  term ((256 : Rat) / 35) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 402 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0402 : Poly :=
[
  term ((512 : Rat) / 35) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-256 : Rat) / 35) [(9, 2), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0402
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0403 : Poly :=
[
  term ((-208 : Rat) / 35) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 403 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0403 : Poly :=
[
  term ((-416 : Rat) / 35) [(0, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-416 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((208 : Rat) / 35) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((208 : Rat) / 35) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0403
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0404 : Poly :=
[
  term ((28600896 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 404 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0404 : Poly :=
[
  term ((57201792 : Rat) / 53375) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((57201792 : Rat) / 53375) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-28600896 : Rat) / 53375) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-28600896 : Rat) / 53375) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0404
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0405 : Poly :=
[
  term ((-4608 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 405 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0405 : Poly :=
[
  term ((-9216 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9216 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4608 : Rat) / 7) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4608 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0405
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0406 : Poly :=
[
  term ((1536 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 406 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0406 : Poly :=
[
  term ((3072 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3072 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 7) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0406
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0407 : Poly :=
[
  term ((-1248 : Rat) / 7) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 407 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0407 : Poly :=
[
  term ((-2496 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2496 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1248 : Rat) / 7) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1248 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0407
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0408 : Poly :=
[
  term ((6863 : Rat) / 70) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 408 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0408 : Poly :=
[
  term ((6863 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((6863 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6863 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6863 : Rat) / 70) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0408
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0409 : Poly :=
[
  term ((-1047 : Rat) / 70) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0409 : Poly :=
[
  term ((-1047 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1047 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1047 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1047 : Rat) / 70) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0409
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0410 : Poly :=
[
  term ((-7826724 : Rat) / 10675) [(11, 1), (13, 1)]
]

/-- Partial product 410 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0410 : Poly :=
[
  term ((-15653448 : Rat) / 10675) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-15653448 : Rat) / 10675) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((7826724 : Rat) / 10675) [(8, 2), (11, 1), (13, 1)],
  term ((7826724 : Rat) / 10675) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0410_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0410
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0411 : Poly :=
[
  term ((28992 : Rat) / 35) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 411 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0411 : Poly :=
[
  term ((57984 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((57984 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-28992 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-28992 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0411_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0411
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0412 : Poly :=
[
  term ((-6976 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 412 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0412 : Poly :=
[
  term ((-13952 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13952 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6976 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6976 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0412_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0412
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0413 : Poly :=
[
  term ((5668 : Rat) / 35) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 413 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0413 : Poly :=
[
  term ((11336 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((11336 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5668 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5668 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0413_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0413
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0414 : Poly :=
[
  term ((-45313 : Rat) / 420) [(11, 1), (15, 1)]
]

/-- Partial product 414 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0414 : Poly :=
[
  term ((-45313 : Rat) / 210) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-45313 : Rat) / 210) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((45313 : Rat) / 420) [(8, 2), (11, 1), (15, 1)],
  term ((45313 : Rat) / 420) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0414_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0414
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0415 : Poly :=
[
  term ((439 : Rat) / 28) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0415 : Poly :=
[
  term ((439 : Rat) / 14) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((439 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-439 : Rat) / 28) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-439 : Rat) / 28) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0415_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0415
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0416 : Poly :=
[
  term ((-9209 : Rat) / 35) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 416 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0416 : Poly :=
[
  term ((-18418 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-18418 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((9209 : Rat) / 35) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((9209 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0416_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0416
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0417 : Poly :=
[
  term ((1137 : Rat) / 35) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 417 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0417 : Poly :=
[
  term ((2274 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2274 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 35) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0417_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0417
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0418 : Poly :=
[
  term ((-376224 : Rat) / 875) [(11, 2), (13, 2)]
]

/-- Partial product 418 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0418 : Poly :=
[
  term ((-752448 : Rat) / 875) [(0, 1), (8, 1), (11, 2), (13, 2)],
  term ((-752448 : Rat) / 875) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((376224 : Rat) / 875) [(8, 2), (11, 2), (13, 2)],
  term ((376224 : Rat) / 875) [(9, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0418_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0418
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0419 : Poly :=
[
  term ((18432 : Rat) / 35) [(11, 2), (13, 2), (14, 1)]
]

/-- Partial product 419 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0419 : Poly :=
[
  term ((36864 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 2), (14, 1)],
  term ((36864 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-18432 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1)],
  term ((-18432 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0419_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0419
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0420 : Poly :=
[
  term ((-6144 : Rat) / 35) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 420 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0420 : Poly :=
[
  term ((-12288 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((6144 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((6144 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0420_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0420
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0421 : Poly :=
[
  term ((4992 : Rat) / 35) [(11, 2), (13, 2), (16, 1)]
]

/-- Partial product 421 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0421 : Poly :=
[
  term ((9984 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((9984 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-4992 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (16, 1)],
  term ((-4992 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0421_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0421
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0422 : Poly :=
[
  term (172 : Rat) [(12, 1)]
]

/-- Partial product 422 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0422 : Poly :=
[
  term (344 : Rat) [(0, 1), (8, 1), (12, 1)],
  term (344 : Rat) [(1, 1), (9, 1), (12, 1)],
  term (-172 : Rat) [(8, 2), (12, 1)],
  term (-172 : Rat) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0422_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0422
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0423 : Poly :=
[
  term ((-772 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 423 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0423 : Poly :=
[
  term ((-1544 : Rat) / 5) [(0, 1), (8, 1), (12, 1), (14, 1)],
  term ((-1544 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((772 : Rat) / 5) [(8, 2), (12, 1), (14, 1)],
  term ((772 : Rat) / 5) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0423_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0423
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0424 : Poly :=
[
  term ((1 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 424 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0424 : Poly :=
[
  term ((2 : Rat) / 5) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((2 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(8, 2), (12, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0424_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0424
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0425 : Poly :=
[
  term ((5789 : Rat) / 300) [(13, 1), (15, 1)]
]

/-- Partial product 425 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0425 : Poly :=
[
  term ((5789 : Rat) / 150) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((5789 : Rat) / 150) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5789 : Rat) / 300) [(8, 2), (13, 1), (15, 1)],
  term ((-5789 : Rat) / 300) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0425_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0425
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0426 : Poly :=
[
  term ((-67 : Rat) / 20) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0426 : Poly :=
[
  term ((-67 : Rat) / 10) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67 : Rat) / 10) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((67 : Rat) / 20) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((67 : Rat) / 20) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0426_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0426
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0427 : Poly :=
[
  term ((712408 : Rat) / 7625) [(13, 2)]
]

/-- Partial product 427 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0427 : Poly :=
[
  term ((1424816 : Rat) / 7625) [(0, 1), (8, 1), (13, 2)],
  term ((1424816 : Rat) / 7625) [(1, 1), (9, 1), (13, 2)],
  term ((-712408 : Rat) / 7625) [(8, 2), (13, 2)],
  term ((-712408 : Rat) / 7625) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0427_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0427
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0428 : Poly :=
[
  term ((-576 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 428 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0428 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((576 : Rat) / 5) [(8, 2), (13, 2), (14, 1)],
  term ((576 : Rat) / 5) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0428_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0428
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0429 : Poly :=
[
  term ((192 : Rat) / 5) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 429 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0429 : Poly :=
[
  term ((384 : Rat) / 5) [(0, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0429_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0429
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0430 : Poly :=
[
  term ((-156 : Rat) / 5) [(13, 2), (16, 1)]
]

/-- Partial product 430 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0430 : Poly :=
[
  term ((-312 : Rat) / 5) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-312 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((156 : Rat) / 5) [(8, 2), (13, 2), (16, 1)],
  term ((156 : Rat) / 5) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0430_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0430
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0431 : Poly :=
[
  term ((796 : Rat) / 5) [(14, 1)]
]

/-- Partial product 431 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0431 : Poly :=
[
  term ((1592 : Rat) / 5) [(0, 1), (8, 1), (14, 1)],
  term ((1592 : Rat) / 5) [(1, 1), (9, 1), (14, 1)],
  term ((-796 : Rat) / 5) [(8, 2), (14, 1)],
  term ((-796 : Rat) / 5) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0431_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0431
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003YY_coefficient_09_0432 : Poly :=
[
  term ((-1 : Rat) / 5) [(16, 1)]
]

/-- Partial product 432 for generator 9. -/
def rs_R003_ueqv_R003YY_partial_09_0432 : Poly :=
[
  term ((-2 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term ((1 : Rat) / 5) [(8, 2), (16, 1)],
  term ((1 : Rat) / 5) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 9. -/
theorem rs_R003_ueqv_R003YY_partial_09_0432_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_09_0432
        rs_R003_ueqv_R003YY_generator_09_0400_0432 =
      rs_R003_ueqv_R003YY_partial_09_0432 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_09_0400_0432 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_09_0400,
  rs_R003_ueqv_R003YY_partial_09_0401,
  rs_R003_ueqv_R003YY_partial_09_0402,
  rs_R003_ueqv_R003YY_partial_09_0403,
  rs_R003_ueqv_R003YY_partial_09_0404,
  rs_R003_ueqv_R003YY_partial_09_0405,
  rs_R003_ueqv_R003YY_partial_09_0406,
  rs_R003_ueqv_R003YY_partial_09_0407,
  rs_R003_ueqv_R003YY_partial_09_0408,
  rs_R003_ueqv_R003YY_partial_09_0409,
  rs_R003_ueqv_R003YY_partial_09_0410,
  rs_R003_ueqv_R003YY_partial_09_0411,
  rs_R003_ueqv_R003YY_partial_09_0412,
  rs_R003_ueqv_R003YY_partial_09_0413,
  rs_R003_ueqv_R003YY_partial_09_0414,
  rs_R003_ueqv_R003YY_partial_09_0415,
  rs_R003_ueqv_R003YY_partial_09_0416,
  rs_R003_ueqv_R003YY_partial_09_0417,
  rs_R003_ueqv_R003YY_partial_09_0418,
  rs_R003_ueqv_R003YY_partial_09_0419,
  rs_R003_ueqv_R003YY_partial_09_0420,
  rs_R003_ueqv_R003YY_partial_09_0421,
  rs_R003_ueqv_R003YY_partial_09_0422,
  rs_R003_ueqv_R003YY_partial_09_0423,
  rs_R003_ueqv_R003YY_partial_09_0424,
  rs_R003_ueqv_R003YY_partial_09_0425,
  rs_R003_ueqv_R003YY_partial_09_0426,
  rs_R003_ueqv_R003YY_partial_09_0427,
  rs_R003_ueqv_R003YY_partial_09_0428,
  rs_R003_ueqv_R003YY_partial_09_0429,
  rs_R003_ueqv_R003YY_partial_09_0430,
  rs_R003_ueqv_R003YY_partial_09_0431,
  rs_R003_ueqv_R003YY_partial_09_0432
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_09_0400_0432 : Poly :=
[
  term ((1730528 : Rat) / 53375) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((-1536 : Rat) / 35) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((512 : Rat) / 35) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(0, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((57201792 : Rat) / 53375) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9216 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((6863 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1047 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15653448 : Rat) / 10675) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((57984 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-13952 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11336 : Rat) / 35) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-45313 : Rat) / 210) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((439 : Rat) / 14) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18418 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(0, 1), (8, 1), (11, 2), (13, 2)],
  term ((36864 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(0, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term (344 : Rat) [(0, 1), (8, 1), (12, 1)],
  term ((-1544 : Rat) / 5) [(0, 1), (8, 1), (12, 1), (14, 1)],
  term ((2 : Rat) / 5) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((5789 : Rat) / 150) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-67 : Rat) / 10) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1424816 : Rat) / 7625) [(0, 1), (8, 1), (13, 2)],
  term ((-1152 : Rat) / 5) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((384 : Rat) / 5) [(0, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-312 : Rat) / 5) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((1592 : Rat) / 5) [(0, 1), (8, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(0, 1), (8, 1), (16, 1)],
  term ((1730528 : Rat) / 53375) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-1536 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((512 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((57201792 : Rat) / 53375) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9216 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((6863 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1047 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15653448 : Rat) / 10675) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((57984 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-13952 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11336 : Rat) / 35) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-45313 : Rat) / 210) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((439 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18418 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((36864 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term (344 : Rat) [(1, 1), (9, 1), (12, 1)],
  term ((-1544 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((2 : Rat) / 5) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((5789 : Rat) / 150) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-67 : Rat) / 10) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1424816 : Rat) / 7625) [(1, 1), (9, 1), (13, 2)],
  term ((-1152 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((384 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-312 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((1592 : Rat) / 5) [(1, 1), (9, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(1, 1), (9, 1), (16, 1)],
  term ((-865264 : Rat) / 53375) [(8, 2), (10, 1), (13, 2)],
  term ((768 : Rat) / 35) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((-256 : Rat) / 35) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-28600896 : Rat) / 53375) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((4608 : Rat) / 7) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 7) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6863 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((1047 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7826724 : Rat) / 10675) [(8, 2), (11, 1), (13, 1)],
  term ((-28992 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((6976 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5668 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((45313 : Rat) / 420) [(8, 2), (11, 1), (15, 1)],
  term ((-439 : Rat) / 28) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((9209 : Rat) / 35) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1137 : Rat) / 35) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((376224 : Rat) / 875) [(8, 2), (11, 2), (13, 2)],
  term ((-18432 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1)],
  term ((6144 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-4992 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (16, 1)],
  term (-172 : Rat) [(8, 2), (12, 1)],
  term ((772 : Rat) / 5) [(8, 2), (12, 1), (14, 1)],
  term ((-1 : Rat) / 5) [(8, 2), (12, 1), (16, 1)],
  term ((-5789 : Rat) / 300) [(8, 2), (13, 1), (15, 1)],
  term ((67 : Rat) / 20) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-712408 : Rat) / 7625) [(8, 2), (13, 2)],
  term ((576 : Rat) / 5) [(8, 2), (13, 2), (14, 1)],
  term ((-192 : Rat) / 5) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((156 : Rat) / 5) [(8, 2), (13, 2), (16, 1)],
  term ((-796 : Rat) / 5) [(8, 2), (14, 1)],
  term ((1 : Rat) / 5) [(8, 2), (16, 1)],
  term ((-865264 : Rat) / 53375) [(9, 2), (10, 1), (13, 2)],
  term ((768 : Rat) / 35) [(9, 2), (10, 1), (13, 2), (14, 1)],
  term ((-256 : Rat) / 35) [(9, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-28600896 : Rat) / 53375) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((4608 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6863 : Rat) / 70) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1047 : Rat) / 70) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7826724 : Rat) / 10675) [(9, 2), (11, 1), (13, 1)],
  term ((-28992 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((6976 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5668 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((45313 : Rat) / 420) [(9, 2), (11, 1), (15, 1)],
  term ((-439 : Rat) / 28) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((9209 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1137 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((376224 : Rat) / 875) [(9, 2), (11, 2), (13, 2)],
  term ((-18432 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1)],
  term ((6144 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-4992 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term (-172 : Rat) [(9, 2), (12, 1)],
  term ((772 : Rat) / 5) [(9, 2), (12, 1), (14, 1)],
  term ((-1 : Rat) / 5) [(9, 2), (12, 1), (16, 1)],
  term ((-5789 : Rat) / 300) [(9, 2), (13, 1), (15, 1)],
  term ((67 : Rat) / 20) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-712408 : Rat) / 7625) [(9, 2), (13, 2)],
  term ((576 : Rat) / 5) [(9, 2), (13, 2), (14, 1)],
  term ((-192 : Rat) / 5) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((156 : Rat) / 5) [(9, 2), (13, 2), (16, 1)],
  term ((-796 : Rat) / 5) [(9, 2), (14, 1)],
  term ((1 : Rat) / 5) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 400 through 432. -/
theorem rs_R003_ueqv_R003YY_block_09_0400_0432_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_09_0400_0432
      rs_R003_ueqv_R003YY_block_09_0400_0432 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
