/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 4:400-461

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_04_0400_0461 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0400 : Poly :=
[
  term ((16013 : Rat) / 420) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 400 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0400 : Poly :=
[
  term ((-16013 : Rat) / 210) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((16013 : Rat) / 420) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((16013 : Rat) / 420) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((16013 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16013 : Rat) / 420) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-16013 : Rat) / 420) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0400
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0401 : Poly :=
[
  term ((-631 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0401 : Poly :=
[
  term ((631 : Rat) / 70) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-631 : Rat) / 140) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-631 : Rat) / 140) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-631 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((631 : Rat) / 140) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((631 : Rat) / 140) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0401
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0402 : Poly :=
[
  term ((1232 : Rat) / 5) [(9, 1), (11, 1)]
]

/-- Partial product 402 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0402 : Poly :=
[
  term ((-2464 : Rat) / 5) [(4, 1), (9, 1), (11, 1)],
  term ((1232 : Rat) / 5) [(4, 2), (9, 1), (11, 1)],
  term ((1232 : Rat) / 5) [(5, 2), (9, 1), (11, 1)],
  term ((2464 : Rat) / 5) [(9, 1), (11, 1), (12, 1)],
  term ((-1232 : Rat) / 5) [(9, 1), (11, 1), (12, 2)],
  term ((-1232 : Rat) / 5) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0402
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0403 : Poly :=
[
  term ((53201 : Rat) / 105) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 403 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0403 : Poly :=
[
  term ((-106402 : Rat) / 105) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((53201 : Rat) / 105) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((53201 : Rat) / 105) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((106402 : Rat) / 105) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-53201 : Rat) / 105) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-53201 : Rat) / 105) [(9, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0403
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0404 : Poly :=
[
  term ((-2179 : Rat) / 35) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0404 : Poly :=
[
  term ((4358 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2179 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2179 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4358 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2179 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2179 : Rat) / 35) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0404
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0405 : Poly :=
[
  term ((42016928 : Rat) / 53375) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 405 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0405 : Poly :=
[
  term ((-84033856 : Rat) / 53375) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((42016928 : Rat) / 53375) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((42016928 : Rat) / 53375) [(5, 2), (9, 1), (11, 1), (13, 2)],
  term ((84033856 : Rat) / 53375) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-42016928 : Rat) / 53375) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((-42016928 : Rat) / 53375) [(9, 1), (11, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0405
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0406 : Poly :=
[
  term ((-33792 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 406 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0406 : Poly :=
[
  term ((67584 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-33792 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-33792 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-67584 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((33792 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1)],
  term ((33792 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0406
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0407 : Poly :=
[
  term ((11264 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 407 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0407 : Poly :=
[
  term ((-22528 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((11264 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((11264 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((22528 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-11264 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-11264 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0407
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0408 : Poly :=
[
  term ((-9152 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 408 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0408 : Poly :=
[
  term ((18304 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-9152 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-9152 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-18304 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((9152 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((9152 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0408
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0409 : Poly :=
[
  term ((-1152 : Rat) / 5) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 409 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0409 : Poly :=
[
  term ((2304 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2304 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((1152 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0409
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0410 : Poly :=
[
  term ((16241648 : Rat) / 53375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 410 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0410 : Poly :=
[
  term ((-32483296 : Rat) / 53375) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((16241648 : Rat) / 53375) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((16241648 : Rat) / 53375) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((32483296 : Rat) / 53375) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-16241648 : Rat) / 53375) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-16241648 : Rat) / 53375) [(9, 1), (11, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0410_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0410
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0411 : Poly :=
[
  term ((-13056 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 411 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0411 : Poly :=
[
  term ((26112 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-13056 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-13056 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-26112 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((13056 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1)],
  term ((13056 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0411_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0411
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0412 : Poly :=
[
  term ((4352 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 412 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0412 : Poly :=
[
  term ((-8704 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4352 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4352 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((8704 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4352 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4352 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0412_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0412
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0413 : Poly :=
[
  term ((-3536 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 413 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0413 : Poly :=
[
  term ((7072 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7072 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0413_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0413
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0414 : Poly :=
[
  term ((4898 : Rat) / 105) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 414 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0414 : Poly :=
[
  term ((-9796 : Rat) / 105) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((4898 : Rat) / 105) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((4898 : Rat) / 105) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((9796 : Rat) / 105) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4898 : Rat) / 105) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4898 : Rat) / 105) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0414_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0414
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0415 : Poly :=
[
  term ((-262 : Rat) / 35) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0415 : Poly :=
[
  term ((524 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-262 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-262 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-524 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((262 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((262 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0415_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0415
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0416 : Poly :=
[
  term ((-4690208 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 416 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0416 : Poly :=
[
  term ((9380416 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-4690208 : Rat) / 53375) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-4690208 : Rat) / 53375) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((4690208 : Rat) / 53375) [(9, 1), (12, 1), (13, 3)],
  term ((-9380416 : Rat) / 53375) [(9, 1), (12, 2), (13, 1)],
  term ((4690208 : Rat) / 53375) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0416_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0416
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0417 : Poly :=
[
  term ((768 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 417 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0417 : Poly :=
[
  term ((-1536 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 7) [(9, 1), (12, 1), (13, 3), (14, 1)],
  term ((1536 : Rat) / 7) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-768 : Rat) / 7) [(9, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0417_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0417
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0418 : Poly :=
[
  term ((-256 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 418 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0418 : Poly :=
[
  term ((512 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 7) [(9, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 7) [(9, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0418_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0418
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0419 : Poly :=
[
  term ((208 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 419 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0419 : Poly :=
[
  term ((-416 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((416 : Rat) / 7) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(9, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0419_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0419
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0420 : Poly :=
[
  term ((14096 : Rat) / 525) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 420 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0420 : Poly :=
[
  term ((-28192 : Rat) / 525) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((14096 : Rat) / 525) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((14096 : Rat) / 525) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-14096 : Rat) / 525) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((28192 : Rat) / 525) [(9, 1), (12, 2), (15, 1)],
  term ((-14096 : Rat) / 525) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0420_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0420
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0421 : Poly :=
[
  term ((8 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0421 : Poly :=
[
  term ((-16 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0421_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0421
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0422 : Poly :=
[
  term ((20640504 : Rat) / 53375) [(9, 1), (13, 1)]
]

/-- Partial product 422 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0422 : Poly :=
[
  term ((-41281008 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)],
  term ((20640504 : Rat) / 53375) [(4, 2), (9, 1), (13, 1)],
  term ((20640504 : Rat) / 53375) [(5, 2), (9, 1), (13, 1)],
  term ((41281008 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)],
  term ((-20640504 : Rat) / 53375) [(9, 1), (12, 2), (13, 1)],
  term ((-20640504 : Rat) / 53375) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0422_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0422
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0423 : Poly :=
[
  term ((-12412 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 423 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0423 : Poly :=
[
  term ((24824 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-12412 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-12412 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-24824 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((12412 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((12412 : Rat) / 35) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0423_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0423
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0424 : Poly :=
[
  term ((64 : Rat) / 7) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 424 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0424 : Poly :=
[
  term ((-128 : Rat) / 7) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 7) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 7) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0424_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0424
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0425 : Poly :=
[
  term ((-92 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 425 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0425 : Poly :=
[
  term ((184 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-92 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-92 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-184 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((92 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((92 : Rat) / 35) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0425_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0425
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0426 : Poly :=
[
  term ((-11077 : Rat) / 4200) [(9, 1), (15, 1)]
]

/-- Partial product 426 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0426 : Poly :=
[
  term ((11077 : Rat) / 2100) [(4, 1), (9, 1), (15, 1)],
  term ((-11077 : Rat) / 4200) [(4, 2), (9, 1), (15, 1)],
  term ((-11077 : Rat) / 4200) [(5, 2), (9, 1), (15, 1)],
  term ((-11077 : Rat) / 2100) [(9, 1), (12, 1), (15, 1)],
  term ((11077 : Rat) / 4200) [(9, 1), (12, 2), (15, 1)],
  term ((11077 : Rat) / 4200) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0426_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0426
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0427 : Poly :=
[
  term ((-269 : Rat) / 280) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0427 : Poly :=
[
  term ((269 : Rat) / 140) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 280) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 280) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-269 : Rat) / 140) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((269 : Rat) / 280) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((269 : Rat) / 280) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0427_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0427
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0428 : Poly :=
[
  term ((-12 : Rat) / 5) [(9, 2)]
]

/-- Partial product 428 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0428 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (9, 2)],
  term ((-12 : Rat) / 5) [(4, 2), (9, 2)],
  term ((-12 : Rat) / 5) [(5, 2), (9, 2)],
  term ((-24 : Rat) / 5) [(9, 2), (12, 1)],
  term ((12 : Rat) / 5) [(9, 2), (12, 2)],
  term ((12 : Rat) / 5) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0428_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0428
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0429 : Poly :=
[
  term ((12 : Rat) / 5) [(9, 2), (14, 1)]
]

/-- Partial product 429 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0429 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((12 : Rat) / 5) [(4, 2), (9, 2), (14, 1)],
  term ((12 : Rat) / 5) [(5, 2), (9, 2), (14, 1)],
  term ((24 : Rat) / 5) [(9, 2), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(9, 2), (12, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0429_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0429
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0430 : Poly :=
[
  term ((616 : Rat) / 5) [(10, 1)]
]

/-- Partial product 430 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0430 : Poly :=
[
  term ((-1232 : Rat) / 5) [(4, 1), (10, 1)],
  term ((616 : Rat) / 5) [(4, 2), (10, 1)],
  term ((616 : Rat) / 5) [(5, 2), (10, 1)],
  term ((1232 : Rat) / 5) [(10, 1), (12, 1)],
  term ((-616 : Rat) / 5) [(10, 1), (12, 2)],
  term ((-616 : Rat) / 5) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0430_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0430
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0431 : Poly :=
[
  term ((8120824 : Rat) / 53375) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 431 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0431 : Poly :=
[
  term ((-16241648 : Rat) / 53375) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((8120824 : Rat) / 53375) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((8120824 : Rat) / 53375) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((16241648 : Rat) / 53375) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-8120824 : Rat) / 53375) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-8120824 : Rat) / 53375) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0431_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0431
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0432 : Poly :=
[
  term ((-6528 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 432 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0432 : Poly :=
[
  term ((13056 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-6528 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-6528 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-13056 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6528 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((6528 : Rat) / 35) [(10, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0432_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0432
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0433 : Poly :=
[
  term ((2176 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 433 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0433 : Poly :=
[
  term ((-4352 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2176 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2176 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4352 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2176 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2176 : Rat) / 35) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0433_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0433
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0434 : Poly :=
[
  term ((-1768 : Rat) / 35) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 434 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0434 : Poly :=
[
  term ((3536 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0434_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0434
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0435 : Poly :=
[
  term ((2449 : Rat) / 105) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 435 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0435 : Poly :=
[
  term ((-4898 : Rat) / 105) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((2449 : Rat) / 105) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((2449 : Rat) / 105) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((4898 : Rat) / 105) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2449 : Rat) / 105) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2449 : Rat) / 105) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0435_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0435
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0436 : Poly :=
[
  term ((-131 : Rat) / 35) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0436 : Poly :=
[
  term ((262 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-131 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-131 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-262 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((131 : Rat) / 35) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0436_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0436
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0437 : Poly :=
[
  term ((-576 : Rat) / 5) [(10, 1), (14, 1)]
]

/-- Partial product 437 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0437 : Poly :=
[
  term ((1152 : Rat) / 5) [(4, 1), (10, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(4, 2), (10, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(5, 2), (10, 1), (14, 1)],
  term ((-1152 : Rat) / 5) [(10, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(10, 1), (12, 2), (14, 1)],
  term ((576 : Rat) / 5) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0437_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0437
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0438 : Poly :=
[
  term ((77648 : Rat) / 2135) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 438 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0438 : Poly :=
[
  term ((-155296 : Rat) / 2135) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((77648 : Rat) / 2135) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((77648 : Rat) / 2135) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-77648 : Rat) / 2135) [(11, 1), (12, 1), (13, 3)],
  term ((155296 : Rat) / 2135) [(11, 1), (12, 2), (13, 1)],
  term ((-77648 : Rat) / 2135) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0438_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0438
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0439 : Poly :=
[
  term ((-1536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 439 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0439 : Poly :=
[
  term ((3072 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1)],
  term ((-3072 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0439_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0439
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0440 : Poly :=
[
  term ((512 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 440 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0440 : Poly :=
[
  term ((-1024 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((1024 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0440_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0440
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0441 : Poly :=
[
  term ((-416 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 441 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0441 : Poly :=
[
  term ((832 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-832 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((416 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0441_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0441
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0442 : Poly :=
[
  term ((2053 : Rat) / 210) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 442 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0442 : Poly :=
[
  term ((-2053 : Rat) / 105) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((2053 : Rat) / 210) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((2053 : Rat) / 210) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2053 : Rat) / 210) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((2053 : Rat) / 105) [(11, 1), (12, 2), (15, 1)],
  term ((-2053 : Rat) / 210) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0442_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0442
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0443 : Poly :=
[
  term ((-19 : Rat) / 14) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0443 : Poly :=
[
  term ((19 : Rat) / 7) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 14) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 14) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 14) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((19 : Rat) / 14) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0443_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0443
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0444 : Poly :=
[
  term ((1398444 : Rat) / 53375) [(11, 1), (13, 1)]
]

/-- Partial product 444 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0444 : Poly :=
[
  term ((-2796888 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)],
  term ((1398444 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((1398444 : Rat) / 53375) [(5, 2), (11, 1), (13, 1)],
  term ((2796888 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)],
  term ((-1398444 : Rat) / 53375) [(11, 1), (12, 2), (13, 1)],
  term ((-1398444 : Rat) / 53375) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0444_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0444
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0445 : Poly :=
[
  term ((-1152 : Rat) / 35) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 445 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0445 : Poly :=
[
  term ((2304 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2304 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((1152 : Rat) / 35) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0445_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0445
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0446 : Poly :=
[
  term ((384 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 446 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0446 : Poly :=
[
  term ((-768 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0446_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0446
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0447 : Poly :=
[
  term ((-312 : Rat) / 35) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 447 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0447 : Poly :=
[
  term ((624 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-312 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-312 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((312 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((312 : Rat) / 35) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0447_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0447
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0448 : Poly :=
[
  term ((3187 : Rat) / 280) [(11, 1), (15, 1)]
]

/-- Partial product 448 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0448 : Poly :=
[
  term ((-3187 : Rat) / 140) [(4, 1), (11, 1), (15, 1)],
  term ((3187 : Rat) / 280) [(4, 2), (11, 1), (15, 1)],
  term ((3187 : Rat) / 280) [(5, 2), (11, 1), (15, 1)],
  term ((3187 : Rat) / 140) [(11, 1), (12, 1), (15, 1)],
  term ((-3187 : Rat) / 280) [(11, 1), (12, 2), (15, 1)],
  term ((-3187 : Rat) / 280) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0448_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0448
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0449 : Poly :=
[
  term ((-411 : Rat) / 280) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0449 : Poly :=
[
  term ((411 : Rat) / 140) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-411 : Rat) / 280) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-411 : Rat) / 280) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-411 : Rat) / 140) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((411 : Rat) / 280) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((411 : Rat) / 280) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0449_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0449
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0450 : Poly :=
[
  term ((274 : Rat) / 5) [(12, 1)]
]

/-- Partial product 450 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0450 : Poly :=
[
  term ((-548 : Rat) / 5) [(4, 1), (12, 1)],
  term ((274 : Rat) / 5) [(4, 2), (12, 1)],
  term ((274 : Rat) / 5) [(5, 2), (12, 1)],
  term ((-274 : Rat) / 5) [(12, 1), (13, 2)],
  term ((548 : Rat) / 5) [(12, 2)],
  term ((-274 : Rat) / 5) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0450_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0450
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0451 : Poly :=
[
  term ((10368 : Rat) / 7625) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 451 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0451 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 7625) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(12, 1), (13, 3), (15, 1)],
  term ((20736 : Rat) / 7625) [(12, 2), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 7625) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0451_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0451
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0452 : Poly :=
[
  term ((-254 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 452 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0452 : Poly :=
[
  term ((508 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((-254 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((-254 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((254 : Rat) / 5) [(12, 1), (13, 2), (14, 1)],
  term ((-508 : Rat) / 5) [(12, 2), (14, 1)],
  term ((254 : Rat) / 5) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0452_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0452
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0453 : Poly :=
[
  term ((-20490037 : Rat) / 640500) [(13, 1), (15, 1)]
]

/-- Partial product 453 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0453 : Poly :=
[
  term ((20490037 : Rat) / 320250) [(4, 1), (13, 1), (15, 1)],
  term ((-20490037 : Rat) / 640500) [(4, 2), (13, 1), (15, 1)],
  term ((-20490037 : Rat) / 640500) [(5, 2), (13, 1), (15, 1)],
  term ((-20490037 : Rat) / 320250) [(12, 1), (13, 1), (15, 1)],
  term ((20490037 : Rat) / 640500) [(12, 2), (13, 1), (15, 1)],
  term ((20490037 : Rat) / 640500) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0453_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0453
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0454 : Poly :=
[
  term ((523 : Rat) / 140) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0454 : Poly :=
[
  term ((-523 : Rat) / 70) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((523 : Rat) / 140) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((523 : Rat) / 140) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((523 : Rat) / 70) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 140) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 140) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0454_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0454
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0455 : Poly :=
[
  term ((-2920564 : Rat) / 53375) [(13, 2)]
]

/-- Partial product 455 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0455 : Poly :=
[
  term ((5841128 : Rat) / 53375) [(4, 1), (13, 2)],
  term ((-2920564 : Rat) / 53375) [(4, 2), (13, 2)],
  term ((-2920564 : Rat) / 53375) [(5, 2), (13, 2)],
  term ((-5841128 : Rat) / 53375) [(12, 1), (13, 2)],
  term ((2920564 : Rat) / 53375) [(12, 2), (13, 2)],
  term ((2920564 : Rat) / 53375) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0455_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0455
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0456 : Poly :=
[
  term ((2304 : Rat) / 35) [(13, 2), (14, 1)]
]

/-- Partial product 456 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0456 : Poly :=
[
  term ((-4608 : Rat) / 35) [(4, 1), (13, 2), (14, 1)],
  term ((2304 : Rat) / 35) [(4, 2), (13, 2), (14, 1)],
  term ((2304 : Rat) / 35) [(5, 2), (13, 2), (14, 1)],
  term ((4608 : Rat) / 35) [(12, 1), (13, 2), (14, 1)],
  term ((-2304 : Rat) / 35) [(12, 2), (13, 2), (14, 1)],
  term ((-2304 : Rat) / 35) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0456_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0456
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0457 : Poly :=
[
  term ((-768 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 457 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0457 : Poly :=
[
  term ((1536 : Rat) / 35) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-768 : Rat) / 35) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-768 : Rat) / 35) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0457_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0457
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0458 : Poly :=
[
  term ((624 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 458 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0458 : Poly :=
[
  term ((-1248 : Rat) / 35) [(4, 1), (13, 2), (16, 1)],
  term ((624 : Rat) / 35) [(4, 2), (13, 2), (16, 1)],
  term ((624 : Rat) / 35) [(5, 2), (13, 2), (16, 1)],
  term ((1248 : Rat) / 35) [(12, 1), (13, 2), (16, 1)],
  term ((-624 : Rat) / 35) [(12, 2), (13, 2), (16, 1)],
  term ((-624 : Rat) / 35) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0458_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0458
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0459 : Poly :=
[
  term ((-141 : Rat) / 5) [(14, 1)]
]

/-- Partial product 459 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0459 : Poly :=
[
  term ((282 : Rat) / 5) [(4, 1), (14, 1)],
  term ((-141 : Rat) / 5) [(4, 2), (14, 1)],
  term ((-141 : Rat) / 5) [(5, 2), (14, 1)],
  term ((-282 : Rat) / 5) [(12, 1), (14, 1)],
  term ((141 : Rat) / 5) [(12, 2), (14, 1)],
  term ((141 : Rat) / 5) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0459_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0459
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0460 : Poly :=
[
  term ((-6 : Rat) / 5) [(15, 2)]
]

/-- Partial product 460 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0460 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(4, 2), (15, 2)],
  term ((-6 : Rat) / 5) [(5, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(12, 1), (15, 2)],
  term ((6 : Rat) / 5) [(12, 2), (15, 2)],
  term ((6 : Rat) / 5) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0460_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0460
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003YY_coefficient_04_0461 : Poly :=
[
  term ((3 : Rat) / 10) [(16, 1)]
]

/-- Partial product 461 for generator 4. -/
def rs_R003_ueqv_R003YY_partial_04_0461 : Poly :=
[
  term ((-3 : Rat) / 5) [(4, 1), (16, 1)],
  term ((3 : Rat) / 10) [(4, 2), (16, 1)],
  term ((3 : Rat) / 10) [(5, 2), (16, 1)],
  term ((3 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-3 : Rat) / 10) [(12, 2), (16, 1)],
  term ((-3 : Rat) / 10) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 4. -/
theorem rs_R003_ueqv_R003YY_partial_04_0461_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_04_0461
        rs_R003_ueqv_R003YY_generator_04_0400_0461 =
      rs_R003_ueqv_R003YY_partial_04_0461 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_04_0400_0461 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_04_0400,
  rs_R003_ueqv_R003YY_partial_04_0401,
  rs_R003_ueqv_R003YY_partial_04_0402,
  rs_R003_ueqv_R003YY_partial_04_0403,
  rs_R003_ueqv_R003YY_partial_04_0404,
  rs_R003_ueqv_R003YY_partial_04_0405,
  rs_R003_ueqv_R003YY_partial_04_0406,
  rs_R003_ueqv_R003YY_partial_04_0407,
  rs_R003_ueqv_R003YY_partial_04_0408,
  rs_R003_ueqv_R003YY_partial_04_0409,
  rs_R003_ueqv_R003YY_partial_04_0410,
  rs_R003_ueqv_R003YY_partial_04_0411,
  rs_R003_ueqv_R003YY_partial_04_0412,
  rs_R003_ueqv_R003YY_partial_04_0413,
  rs_R003_ueqv_R003YY_partial_04_0414,
  rs_R003_ueqv_R003YY_partial_04_0415,
  rs_R003_ueqv_R003YY_partial_04_0416,
  rs_R003_ueqv_R003YY_partial_04_0417,
  rs_R003_ueqv_R003YY_partial_04_0418,
  rs_R003_ueqv_R003YY_partial_04_0419,
  rs_R003_ueqv_R003YY_partial_04_0420,
  rs_R003_ueqv_R003YY_partial_04_0421,
  rs_R003_ueqv_R003YY_partial_04_0422,
  rs_R003_ueqv_R003YY_partial_04_0423,
  rs_R003_ueqv_R003YY_partial_04_0424,
  rs_R003_ueqv_R003YY_partial_04_0425,
  rs_R003_ueqv_R003YY_partial_04_0426,
  rs_R003_ueqv_R003YY_partial_04_0427,
  rs_R003_ueqv_R003YY_partial_04_0428,
  rs_R003_ueqv_R003YY_partial_04_0429,
  rs_R003_ueqv_R003YY_partial_04_0430,
  rs_R003_ueqv_R003YY_partial_04_0431,
  rs_R003_ueqv_R003YY_partial_04_0432,
  rs_R003_ueqv_R003YY_partial_04_0433,
  rs_R003_ueqv_R003YY_partial_04_0434,
  rs_R003_ueqv_R003YY_partial_04_0435,
  rs_R003_ueqv_R003YY_partial_04_0436,
  rs_R003_ueqv_R003YY_partial_04_0437,
  rs_R003_ueqv_R003YY_partial_04_0438,
  rs_R003_ueqv_R003YY_partial_04_0439,
  rs_R003_ueqv_R003YY_partial_04_0440,
  rs_R003_ueqv_R003YY_partial_04_0441,
  rs_R003_ueqv_R003YY_partial_04_0442,
  rs_R003_ueqv_R003YY_partial_04_0443,
  rs_R003_ueqv_R003YY_partial_04_0444,
  rs_R003_ueqv_R003YY_partial_04_0445,
  rs_R003_ueqv_R003YY_partial_04_0446,
  rs_R003_ueqv_R003YY_partial_04_0447,
  rs_R003_ueqv_R003YY_partial_04_0448,
  rs_R003_ueqv_R003YY_partial_04_0449,
  rs_R003_ueqv_R003YY_partial_04_0450,
  rs_R003_ueqv_R003YY_partial_04_0451,
  rs_R003_ueqv_R003YY_partial_04_0452,
  rs_R003_ueqv_R003YY_partial_04_0453,
  rs_R003_ueqv_R003YY_partial_04_0454,
  rs_R003_ueqv_R003YY_partial_04_0455,
  rs_R003_ueqv_R003YY_partial_04_0456,
  rs_R003_ueqv_R003YY_partial_04_0457,
  rs_R003_ueqv_R003YY_partial_04_0458,
  rs_R003_ueqv_R003YY_partial_04_0459,
  rs_R003_ueqv_R003YY_partial_04_0460,
  rs_R003_ueqv_R003YY_partial_04_0461
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_04_0400_0461 : Poly :=
[
  term ((-16013 : Rat) / 210) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((631 : Rat) / 70) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 5) [(4, 1), (9, 1), (11, 1)],
  term ((-106402 : Rat) / 105) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((4358 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84033856 : Rat) / 53375) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((67584 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-22528 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((18304 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((2304 : Rat) / 5) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-32483296 : Rat) / 53375) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((26112 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-8704 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((7072 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-9796 : Rat) / 105) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((524 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((9380416 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-28192 : Rat) / 525) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41281008 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)],
  term ((24824 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 7) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((184 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((11077 : Rat) / 2100) [(4, 1), (9, 1), (15, 1)],
  term ((269 : Rat) / 140) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(4, 1), (9, 2)],
  term ((-24 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((-1232 : Rat) / 5) [(4, 1), (10, 1)],
  term ((-16241648 : Rat) / 53375) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((13056 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4352 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4898 : Rat) / 105) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((262 : Rat) / 35) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(4, 1), (10, 1), (14, 1)],
  term ((-155296 : Rat) / 2135) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((3072 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2053 : Rat) / 105) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((19 : Rat) / 7) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2796888 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)],
  term ((2304 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3187 : Rat) / 140) [(4, 1), (11, 1), (15, 1)],
  term ((411 : Rat) / 140) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-548 : Rat) / 5) [(4, 1), (12, 1)],
  term ((-20736 : Rat) / 7625) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((508 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((20490037 : Rat) / 320250) [(4, 1), (13, 1), (15, 1)],
  term ((-523 : Rat) / 70) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((5841128 : Rat) / 53375) [(4, 1), (13, 2)],
  term ((-4608 : Rat) / 35) [(4, 1), (13, 2), (14, 1)],
  term ((1536 : Rat) / 35) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(4, 1), (13, 2), (16, 1)],
  term ((282 : Rat) / 5) [(4, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 1), (15, 2)],
  term ((-3 : Rat) / 5) [(4, 1), (16, 1)],
  term ((16013 : Rat) / 420) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-631 : Rat) / 140) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(4, 2), (9, 1), (11, 1)],
  term ((53201 : Rat) / 105) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2179 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((42016928 : Rat) / 53375) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-33792 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((11264 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9152 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 5) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((16241648 : Rat) / 53375) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-13056 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((4352 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((4898 : Rat) / 105) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((-262 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4690208 : Rat) / 53375) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((14096 : Rat) / 525) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((8 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((20640504 : Rat) / 53375) [(4, 2), (9, 1), (13, 1)],
  term ((-12412 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((64 : Rat) / 7) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-92 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-11077 : Rat) / 4200) [(4, 2), (9, 1), (15, 1)],
  term ((-269 : Rat) / 280) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (9, 2)],
  term ((12 : Rat) / 5) [(4, 2), (9, 2), (14, 1)],
  term ((616 : Rat) / 5) [(4, 2), (10, 1)],
  term ((8120824 : Rat) / 53375) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-6528 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2176 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2449 : Rat) / 105) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-131 : Rat) / 35) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(4, 2), (10, 1), (14, 1)],
  term ((77648 : Rat) / 2135) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2053 : Rat) / 210) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-19 : Rat) / 14) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1398444 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((-1152 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((3187 : Rat) / 280) [(4, 2), (11, 1), (15, 1)],
  term ((-411 : Rat) / 280) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((274 : Rat) / 5) [(4, 2), (12, 1)],
  term ((10368 : Rat) / 7625) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-254 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((-20490037 : Rat) / 640500) [(4, 2), (13, 1), (15, 1)],
  term ((523 : Rat) / 140) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2920564 : Rat) / 53375) [(4, 2), (13, 2)],
  term ((2304 : Rat) / 35) [(4, 2), (13, 2), (14, 1)],
  term ((-768 : Rat) / 35) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((624 : Rat) / 35) [(4, 2), (13, 2), (16, 1)],
  term ((-141 : Rat) / 5) [(4, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(4, 2), (15, 2)],
  term ((3 : Rat) / 10) [(4, 2), (16, 1)],
  term ((16013 : Rat) / 420) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-631 : Rat) / 140) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(5, 2), (9, 1), (11, 1)],
  term ((53201 : Rat) / 105) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2179 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((42016928 : Rat) / 53375) [(5, 2), (9, 1), (11, 1), (13, 2)],
  term ((-33792 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((11264 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9152 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 5) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((16241648 : Rat) / 53375) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((-13056 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((4352 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((4898 : Rat) / 105) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((-262 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4690208 : Rat) / 53375) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((14096 : Rat) / 525) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((8 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((20640504 : Rat) / 53375) [(5, 2), (9, 1), (13, 1)],
  term ((-12412 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((64 : Rat) / 7) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-92 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-11077 : Rat) / 4200) [(5, 2), (9, 1), (15, 1)],
  term ((-269 : Rat) / 280) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (9, 2)],
  term ((12 : Rat) / 5) [(5, 2), (9, 2), (14, 1)],
  term ((616 : Rat) / 5) [(5, 2), (10, 1)],
  term ((8120824 : Rat) / 53375) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-6528 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2176 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1768 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2449 : Rat) / 105) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-131 : Rat) / 35) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(5, 2), (10, 1), (14, 1)],
  term ((77648 : Rat) / 2135) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2053 : Rat) / 210) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-19 : Rat) / 14) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1398444 : Rat) / 53375) [(5, 2), (11, 1), (13, 1)],
  term ((-1152 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((3187 : Rat) / 280) [(5, 2), (11, 1), (15, 1)],
  term ((-411 : Rat) / 280) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((274 : Rat) / 5) [(5, 2), (12, 1)],
  term ((10368 : Rat) / 7625) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-254 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((-20490037 : Rat) / 640500) [(5, 2), (13, 1), (15, 1)],
  term ((523 : Rat) / 140) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2920564 : Rat) / 53375) [(5, 2), (13, 2)],
  term ((2304 : Rat) / 35) [(5, 2), (13, 2), (14, 1)],
  term ((-768 : Rat) / 35) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((624 : Rat) / 35) [(5, 2), (13, 2), (16, 1)],
  term ((-141 : Rat) / 5) [(5, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(5, 2), (15, 2)],
  term ((3 : Rat) / 10) [(5, 2), (16, 1)],
  term ((16013 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-631 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16013 : Rat) / 420) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((631 : Rat) / 140) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16013 : Rat) / 420) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((631 : Rat) / 140) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2464 : Rat) / 5) [(9, 1), (11, 1), (12, 1)],
  term ((106402 : Rat) / 105) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4358 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((84033856 : Rat) / 53375) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-67584 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((22528 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-18304 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2304 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1232 : Rat) / 5) [(9, 1), (11, 1), (12, 2)],
  term ((-53201 : Rat) / 105) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((2179 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42016928 : Rat) / 53375) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((33792 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1)],
  term ((-11264 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((9152 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((1152 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-1232 : Rat) / 5) [(9, 1), (11, 1), (13, 2)],
  term ((1152 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-53201 : Rat) / 105) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((2179 : Rat) / 35) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-42016928 : Rat) / 53375) [(9, 1), (11, 1), (13, 4)],
  term ((33792 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1)],
  term ((-11264 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1), (16, 1)],
  term ((9152 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (16, 1)],
  term ((32483296 : Rat) / 53375) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-26112 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((8704 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7072 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((9796 : Rat) / 105) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-524 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16241648 : Rat) / 53375) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((13056 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1)],
  term ((-4352 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-4898 : Rat) / 105) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((262 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-4898 : Rat) / 105) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((262 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-16241648 : Rat) / 53375) [(9, 1), (11, 2), (13, 3)],
  term ((13056 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1)],
  term ((-4352 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1), (16, 1)],
  term ((3536 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (16, 1)],
  term ((41281008 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)],
  term ((-24824 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-184 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14096 : Rat) / 525) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-8 : Rat) / 7) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4690208 : Rat) / 53375) [(9, 1), (12, 1), (13, 3)],
  term ((-768 : Rat) / 7) [(9, 1), (12, 1), (13, 3), (14, 1)],
  term ((256 : Rat) / 7) [(9, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-11077 : Rat) / 2100) [(9, 1), (12, 1), (15, 1)],
  term ((-269 : Rat) / 140) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6004184 : Rat) / 10675) [(9, 1), (12, 2), (13, 1)],
  term ((20092 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-576 : Rat) / 7) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2172 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((78871 : Rat) / 1400) [(9, 1), (12, 2), (15, 1)],
  term ((909 : Rat) / 280) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((4690208 : Rat) / 53375) [(9, 1), (12, 3), (13, 1)],
  term ((-768 : Rat) / 7) [(9, 1), (12, 3), (13, 1), (14, 1)],
  term ((256 : Rat) / 7) [(9, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-14096 : Rat) / 525) [(9, 1), (12, 3), (15, 1)],
  term ((-8 : Rat) / 7) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((11077 : Rat) / 4200) [(9, 1), (13, 2), (15, 1)],
  term ((269 : Rat) / 280) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20640504 : Rat) / 53375) [(9, 1), (13, 3)],
  term ((12412 : Rat) / 35) [(9, 1), (13, 3), (14, 1)],
  term ((-64 : Rat) / 7) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((92 : Rat) / 35) [(9, 1), (13, 3), (16, 1)],
  term ((-24 : Rat) / 5) [(9, 2), (12, 1)],
  term ((24 : Rat) / 5) [(9, 2), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(9, 2), (12, 2)],
  term ((-12 : Rat) / 5) [(9, 2), (12, 2), (14, 1)],
  term ((12 : Rat) / 5) [(9, 2), (13, 2)],
  term ((-12 : Rat) / 5) [(9, 2), (13, 2), (14, 1)],
  term ((16241648 : Rat) / 53375) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-13056 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4352 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4898 : Rat) / 105) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-262 : Rat) / 35) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8120824 : Rat) / 53375) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((6528 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2176 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2449 : Rat) / 105) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((131 : Rat) / 35) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2449 : Rat) / 105) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((131 : Rat) / 35) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8120824 : Rat) / 53375) [(10, 1), (11, 1), (13, 3)],
  term ((6528 : Rat) / 35) [(10, 1), (11, 1), (13, 3), (14, 1)],
  term ((-2176 : Rat) / 35) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((1232 : Rat) / 5) [(10, 1), (12, 1)],
  term ((-1152 : Rat) / 5) [(10, 1), (12, 1), (14, 1)],
  term ((-616 : Rat) / 5) [(10, 1), (12, 2)],
  term ((576 : Rat) / 5) [(10, 1), (12, 2), (14, 1)],
  term ((-616 : Rat) / 5) [(10, 1), (13, 2)],
  term ((576 : Rat) / 5) [(10, 1), (13, 2), (14, 1)],
  term ((2796888 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)],
  term ((-2304 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2053 : Rat) / 210) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((19 : Rat) / 14) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-77648 : Rat) / 2135) [(11, 1), (12, 1), (13, 3)],
  term ((1536 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1)],
  term ((-512 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((3187 : Rat) / 140) [(11, 1), (12, 1), (15, 1)],
  term ((-411 : Rat) / 140) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2483956 : Rat) / 53375) [(11, 1), (12, 2), (13, 1)],
  term ((-384 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((128 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((6863 : Rat) / 840) [(11, 1), (12, 2), (15, 1)],
  term ((-349 : Rat) / 280) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-77648 : Rat) / 2135) [(11, 1), (12, 3), (13, 1)],
  term ((1536 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1)],
  term ((-512 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term ((-2053 : Rat) / 210) [(11, 1), (12, 3), (15, 1)],
  term ((19 : Rat) / 14) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-3187 : Rat) / 280) [(11, 1), (13, 2), (15, 1)],
  term ((411 : Rat) / 280) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1398444 : Rat) / 53375) [(11, 1), (13, 3)],
  term ((1152 : Rat) / 35) [(11, 1), (13, 3), (14, 1)],
  term ((-384 : Rat) / 35) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((312 : Rat) / 35) [(11, 1), (13, 3), (16, 1)],
  term ((-20490037 : Rat) / 320250) [(12, 1), (13, 1), (15, 1)],
  term ((523 : Rat) / 70) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8766078 : Rat) / 53375) [(12, 1), (13, 2)],
  term ((6386 : Rat) / 35) [(12, 1), (13, 2), (14, 1)],
  term ((-1536 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(12, 1), (13, 2), (16, 1)],
  term ((-10368 : Rat) / 7625) [(12, 1), (13, 3), (15, 1)],
  term ((-282 : Rat) / 5) [(12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(12, 1), (15, 2)],
  term ((3 : Rat) / 5) [(12, 1), (16, 1)],
  term ((548 : Rat) / 5) [(12, 2)],
  term ((22231861 : Rat) / 640500) [(12, 2), (13, 1), (15, 1)],
  term ((-523 : Rat) / 140) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2920564 : Rat) / 53375) [(12, 2), (13, 2)],
  term ((-2304 : Rat) / 35) [(12, 2), (13, 2), (14, 1)],
  term ((768 : Rat) / 35) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(12, 2), (13, 2), (16, 1)],
  term ((-367 : Rat) / 5) [(12, 2), (14, 1)],
  term ((6 : Rat) / 5) [(12, 2), (15, 2)],
  term ((-3 : Rat) / 10) [(12, 2), (16, 1)],
  term ((-274 : Rat) / 5) [(12, 3)],
  term ((-10368 : Rat) / 7625) [(12, 3), (13, 1), (15, 1)],
  term ((254 : Rat) / 5) [(12, 3), (14, 1)],
  term ((141 : Rat) / 5) [(13, 2), (14, 1)],
  term ((6 : Rat) / 5) [(13, 2), (15, 2)],
  term ((-3 : Rat) / 10) [(13, 2), (16, 1)],
  term ((20490037 : Rat) / 640500) [(13, 3), (15, 1)],
  term ((-523 : Rat) / 140) [(13, 3), (15, 1), (16, 1)],
  term ((2920564 : Rat) / 53375) [(13, 4)],
  term ((-2304 : Rat) / 35) [(13, 4), (14, 1)],
  term ((768 : Rat) / 35) [(13, 4), (14, 1), (16, 1)],
  term ((-624 : Rat) / 35) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 400 through 461. -/
theorem rs_R003_ueqv_R003YY_block_04_0400_0461_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_04_0400_0461
      rs_R003_ueqv_R003YY_block_04_0400_0461 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
