/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 21:400-465

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_21_0400_0465 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0400 : Poly :=
[
  term ((128 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 400 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0400 : Poly :=
[
  term ((256 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((256 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0400
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0401 : Poly :=
[
  term ((-104 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 401 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0401 : Poly :=
[
  term ((-208 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-208 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0401
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0402 : Poly :=
[
  term ((-1277 : Rat) / 12) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 402 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0402 : Poly :=
[
  term ((-1277 : Rat) / 6) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1277 : Rat) / 12) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1277 : Rat) / 12) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-1277 : Rat) / 6) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0402
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0403 : Poly :=
[
  term ((227 : Rat) / 20) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0403 : Poly :=
[
  term ((227 : Rat) / 10) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-227 : Rat) / 20) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-227 : Rat) / 20) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((227 : Rat) / 10) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0403
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0404 : Poly :=
[
  term ((2053 : Rat) / 105) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 404 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0404 : Poly :=
[
  term ((4106 : Rat) / 105) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2053 : Rat) / 105) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2053 : Rat) / 105) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((4106 : Rat) / 105) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0404
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0405 : Poly :=
[
  term ((-19 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0405 : Poly :=
[
  term ((-38 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 7) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 7) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0405
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0406 : Poly :=
[
  term ((155296 : Rat) / 2135) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 406 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0406 : Poly :=
[
  term ((310592 : Rat) / 2135) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-155296 : Rat) / 2135) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((-155296 : Rat) / 2135) [(9, 1), (11, 1), (13, 4)],
  term ((310592 : Rat) / 2135) [(9, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0406
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0407 : Poly :=
[
  term ((-3072 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 407 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0407 : Poly :=
[
  term ((-6144 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((3072 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1)],
  term ((3072 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1)],
  term ((-6144 : Rat) / 35) [(9, 2), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0407
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0408 : Poly :=
[
  term ((1024 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 408 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0408 : Poly :=
[
  term ((2048 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1), (16, 1)],
  term ((2048 : Rat) / 35) [(9, 2), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0408
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0409 : Poly :=
[
  term ((-832 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 409 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0409 : Poly :=
[
  term ((-1664 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((832 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((832 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (16, 1)],
  term ((-1664 : Rat) / 35) [(9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0409
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0410 : Poly :=
[
  term ((1718352 : Rat) / 10675) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 410 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0410 : Poly :=
[
  term ((3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-1718352 : Rat) / 10675) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-1718352 : Rat) / 10675) [(9, 1), (11, 2), (13, 3)],
  term ((3436704 : Rat) / 10675) [(9, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0410_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0410
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0411 : Poly :=
[
  term ((-6912 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 411 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0411 : Poly :=
[
  term ((-13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((6912 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1)],
  term ((6912 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1)],
  term ((-13824 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0411_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0411
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0412 : Poly :=
[
  term ((2304 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 412 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0412 : Poly :=
[
  term ((4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0412_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0412
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0413 : Poly :=
[
  term ((-1872 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 413 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0413 : Poly :=
[
  term ((-3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (16, 1)],
  term ((-3744 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0413_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0413
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0414 : Poly :=
[
  term ((-1437 : Rat) / 35) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 414 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0414 : Poly :=
[
  term ((-2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1437 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((1437 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-2874 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0414_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0414
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0415 : Poly :=
[
  term ((117 : Rat) / 35) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0415 : Poly :=
[
  term ((234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-117 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-117 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((234 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0415_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0415
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0416 : Poly :=
[
  term ((5913704 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 416 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0416 : Poly :=
[
  term ((11827408 : Rat) / 53375) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-5913704 : Rat) / 53375) [(9, 1), (12, 1), (13, 3)],
  term ((-5913704 : Rat) / 53375) [(9, 1), (12, 3), (13, 1)],
  term ((11827408 : Rat) / 53375) [(9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0416_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0416
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0417 : Poly :=
[
  term ((-4608 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 417 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0417 : Poly :=
[
  term ((-9216 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((4608 : Rat) / 35) [(9, 1), (12, 1), (13, 3), (14, 1)],
  term ((4608 : Rat) / 35) [(9, 1), (12, 3), (13, 1), (14, 1)],
  term ((-9216 : Rat) / 35) [(9, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0417_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0417
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0418 : Poly :=
[
  term ((1536 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 418 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0418 : Poly :=
[
  term ((3072 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((3072 : Rat) / 35) [(9, 2), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0418_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0418
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0419 : Poly :=
[
  term ((-1248 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 419 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0419 : Poly :=
[
  term ((-2496 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((1248 : Rat) / 35) [(9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0419_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0419
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0420 : Poly :=
[
  term ((13873 : Rat) / 210) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 420 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0420 : Poly :=
[
  term ((13873 : Rat) / 105) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-13873 : Rat) / 210) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-13873 : Rat) / 210) [(9, 1), (12, 3), (15, 1)],
  term ((13873 : Rat) / 105) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0420_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0420
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0421 : Poly :=
[
  term ((-523 : Rat) / 70) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0421 : Poly :=
[
  term ((-523 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((523 : Rat) / 70) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((523 : Rat) / 70) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-523 : Rat) / 35) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0421_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0421
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0422 : Poly :=
[
  term ((221772 : Rat) / 10675) [(9, 1), (13, 1)]
]

/-- Partial product 422 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0422 : Poly :=
[
  term ((443544 : Rat) / 10675) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-221772 : Rat) / 10675) [(9, 1), (12, 2), (13, 1)],
  term ((-221772 : Rat) / 10675) [(9, 1), (13, 3)],
  term ((443544 : Rat) / 10675) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0422_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0422
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0423 : Poly :=
[
  term ((92 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 423 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0423 : Poly :=
[
  term ((184 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-92 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-92 : Rat) / 35) [(9, 1), (13, 3), (14, 1)],
  term ((184 : Rat) / 35) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0423_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0423
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0424 : Poly :=
[
  term ((-1216 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 424 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0424 : Poly :=
[
  term ((-2432 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1216 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1216 : Rat) / 35) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2432 : Rat) / 35) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0424_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0424
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0425 : Poly :=
[
  term ((988 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 425 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0425 : Poly :=
[
  term ((1976 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-988 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-988 : Rat) / 35) [(9, 1), (13, 3), (16, 1)],
  term ((1976 : Rat) / 35) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0425_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0425
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0426 : Poly :=
[
  term ((183403 : Rat) / 4200) [(9, 1), (15, 1)]
]

/-- Partial product 426 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0426 : Poly :=
[
  term ((183403 : Rat) / 2100) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-183403 : Rat) / 4200) [(9, 1), (12, 2), (15, 1)],
  term ((-183403 : Rat) / 4200) [(9, 1), (13, 2), (15, 1)],
  term ((183403 : Rat) / 2100) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0426_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0426
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0427 : Poly :=
[
  term ((-1229 : Rat) / 280) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0427 : Poly :=
[
  term ((-1229 : Rat) / 140) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1229 : Rat) / 280) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1229 : Rat) / 280) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1229 : Rat) / 140) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0427_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0427
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0428 : Poly :=
[
  term ((-1732 : Rat) / 5) [(9, 2)]
]

/-- Partial product 428 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0428 : Poly :=
[
  term ((-3464 : Rat) / 5) [(8, 1), (9, 2), (12, 1)],
  term ((1732 : Rat) / 5) [(9, 2), (12, 2)],
  term ((1732 : Rat) / 5) [(9, 2), (13, 2)],
  term ((-3464 : Rat) / 5) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0428_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0428
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0429 : Poly :=
[
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 429 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0429 : Poly :=
[
  term ((-91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(9, 2), (11, 1), (12, 2), (13, 1)],
  term ((45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 3)],
  term ((-91722048 : Rat) / 53375) [(9, 3), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0429_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0429
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0430 : Poly :=
[
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 430 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0430 : Poly :=
[
  term ((73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(9, 2), (11, 1), (13, 3), (14, 1)],
  term ((73728 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0430_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0430
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0431 : Poly :=
[
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 431 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0431 : Poly :=
[
  term ((-24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(9, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-24576 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0431_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0431
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0432 : Poly :=
[
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 432 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0432 : Poly :=
[
  term ((19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((19968 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0432_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0432
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0433 : Poly :=
[
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 433 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0433 : Poly :=
[
  term ((-4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((2096 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-4192 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0433_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0433
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0434 : Poly :=
[
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0434 : Poly :=
[
  term ((2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2784 : Rat) / 35) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0434_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0434
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0435 : Poly :=
[
  term ((1568 : Rat) / 5) [(9, 2), (14, 1)]
]

/-- Partial product 435 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0435 : Poly :=
[
  term ((3136 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-1568 : Rat) / 5) [(9, 2), (12, 2), (14, 1)],
  term ((-1568 : Rat) / 5) [(9, 2), (13, 2), (14, 1)],
  term ((3136 : Rat) / 5) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0435_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0435
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0436 : Poly :=
[
  term ((-2 : Rat) / 5) [(9, 2), (16, 1)]
]

/-- Partial product 436 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0436 : Poly :=
[
  term ((-4 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((2 : Rat) / 5) [(9, 2), (12, 2), (16, 1)],
  term ((2 : Rat) / 5) [(9, 2), (13, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0436_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0436
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0437 : Poly :=
[
  term ((479144 : Rat) / 7625) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 437 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0437 : Poly :=
[
  term ((958288 : Rat) / 7625) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((958288 : Rat) / 7625) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-479144 : Rat) / 7625) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-479144 : Rat) / 7625) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0437_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0437
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0438 : Poly :=
[
  term ((-384 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 438 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0438 : Poly :=
[
  term ((-768 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((384 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((384 : Rat) / 5) [(10, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0438_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0438
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0439 : Poly :=
[
  term ((128 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 439 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0439 : Poly :=
[
  term ((256 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0439_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0439
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0440 : Poly :=
[
  term ((-104 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 440 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0440 : Poly :=
[
  term ((-208 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((104 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((104 : Rat) / 5) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0440_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0440
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0441 : Poly :=
[
  term ((3247 : Rat) / 30) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 441 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0441 : Poly :=
[
  term ((3247 : Rat) / 15) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3247 : Rat) / 15) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3247 : Rat) / 30) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3247 : Rat) / 30) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0441_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0441
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0442 : Poly :=
[
  term ((-25 : Rat) / 2) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 442 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0442 : Poly :=
[
  term (-25 : Rat) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-25 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25 : Rat) / 2) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((25 : Rat) / 2) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0442_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0442
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0443 : Poly :=
[
  term ((-21008464 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 443 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0443 : Poly :=
[
  term ((-42016928 : Rat) / 53375) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-42016928 : Rat) / 53375) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((21008464 : Rat) / 53375) [(11, 1), (12, 1), (13, 3)],
  term ((21008464 : Rat) / 53375) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0443_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0443
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0444 : Poly :=
[
  term ((16896 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 444 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0444 : Poly :=
[
  term ((33792 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((33792 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-16896 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1)],
  term ((-16896 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0444_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0444
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0445 : Poly :=
[
  term ((-5632 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 445 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0445 : Poly :=
[
  term ((-11264 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11264 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((5632 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((5632 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0445_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0445
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0446 : Poly :=
[
  term ((4576 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 446 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0446 : Poly :=
[
  term ((9152 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((9152 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4576 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4576 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0446_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0446
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0447 : Poly :=
[
  term ((-53201 : Rat) / 210) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 447 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0447 : Poly :=
[
  term ((-53201 : Rat) / 105) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-53201 : Rat) / 105) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((53201 : Rat) / 210) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((53201 : Rat) / 210) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0447_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0447
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0448 : Poly :=
[
  term ((2179 : Rat) / 70) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0448 : Poly :=
[
  term ((2179 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2179 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2179 : Rat) / 70) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2179 : Rat) / 70) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0448_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0448
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0449 : Poly :=
[
  term ((21541644 : Rat) / 53375) [(11, 1), (13, 1)]
]

/-- Partial product 449 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0449 : Poly :=
[
  term ((43083288 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((43083288 : Rat) / 53375) [(9, 1), (11, 1), (13, 2)],
  term ((-21541644 : Rat) / 53375) [(11, 1), (12, 2), (13, 1)],
  term ((-21541644 : Rat) / 53375) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0449_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0449
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0450 : Poly :=
[
  term ((-3456 : Rat) / 7) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 450 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0450 : Poly :=
[
  term ((-6912 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6912 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((3456 : Rat) / 7) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0450_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0450
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0451 : Poly :=
[
  term ((1152 : Rat) / 7) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 451 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0451 : Poly :=
[
  term ((2304 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0451_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0451
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0452 : Poly :=
[
  term ((-936 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 452 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0452 : Poly :=
[
  term ((-1872 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((936 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((936 : Rat) / 7) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0452_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0452
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0453 : Poly :=
[
  term ((58011 : Rat) / 280) [(11, 1), (15, 1)]
]

/-- Partial product 453 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0453 : Poly :=
[
  term ((58011 : Rat) / 140) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((58011 : Rat) / 140) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-58011 : Rat) / 280) [(11, 1), (12, 2), (15, 1)],
  term ((-58011 : Rat) / 280) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0453_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0453
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0454 : Poly :=
[
  term ((-7299 : Rat) / 280) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0454 : Poly :=
[
  term ((-7299 : Rat) / 140) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7299 : Rat) / 140) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7299 : Rat) / 280) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7299 : Rat) / 280) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0454_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0454
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0455 : Poly :=
[
  term ((-908 : Rat) / 5) [(12, 1)]
]

/-- Partial product 455 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0455 : Poly :=
[
  term ((-1816 : Rat) / 5) [(8, 1), (12, 2)],
  term ((-1816 : Rat) / 5) [(9, 1), (12, 1), (13, 1)],
  term ((908 : Rat) / 5) [(12, 1), (13, 2)],
  term ((908 : Rat) / 5) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0455_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0455
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0456 : Poly :=
[
  term ((818 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 456 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0456 : Poly :=
[
  term ((1636 : Rat) / 5) [(8, 1), (12, 2), (14, 1)],
  term ((1636 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-818 : Rat) / 5) [(12, 1), (13, 2), (14, 1)],
  term ((-818 : Rat) / 5) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0456_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0456
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0457 : Poly :=
[
  term ((-12 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 457 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0457 : Poly :=
[
  term ((-24 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(12, 1), (13, 2), (16, 1)],
  term ((12 : Rat) / 5) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0457_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0457
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0458 : Poly :=
[
  term ((7048 : Rat) / 525) [(13, 1), (15, 1)]
]

/-- Partial product 458 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0458 : Poly :=
[
  term ((14096 : Rat) / 525) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((14096 : Rat) / 525) [(9, 1), (13, 2), (15, 1)],
  term ((-7048 : Rat) / 525) [(12, 2), (13, 1), (15, 1)],
  term ((-7048 : Rat) / 525) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0458_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0458
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0459 : Poly :=
[
  term ((4 : Rat) / 7) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0459 : Poly :=
[
  term ((8 : Rat) / 7) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0459_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0459
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0460 : Poly :=
[
  term ((-2345104 : Rat) / 53375) [(13, 2)]
]

/-- Partial product 460 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0460 : Poly :=
[
  term ((-4690208 : Rat) / 53375) [(8, 1), (12, 1), (13, 2)],
  term ((-4690208 : Rat) / 53375) [(9, 1), (13, 3)],
  term ((2345104 : Rat) / 53375) [(12, 2), (13, 2)],
  term ((2345104 : Rat) / 53375) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0460_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0460
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0461 : Poly :=
[
  term ((384 : Rat) / 7) [(13, 2), (14, 1)]
]

/-- Partial product 461 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0461 : Poly :=
[
  term ((768 : Rat) / 7) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((768 : Rat) / 7) [(9, 1), (13, 3), (14, 1)],
  term ((-384 : Rat) / 7) [(12, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 7) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0461_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0461
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0462 : Poly :=
[
  term ((-128 : Rat) / 7) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 462 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0462 : Poly :=
[
  term ((-256 : Rat) / 7) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((128 : Rat) / 7) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 7) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0462_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0462
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0463 : Poly :=
[
  term ((104 : Rat) / 7) [(13, 2), (16, 1)]
]

/-- Partial product 463 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0463 : Poly :=
[
  term ((208 : Rat) / 7) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((208 : Rat) / 7) [(9, 1), (13, 3), (16, 1)],
  term ((-104 : Rat) / 7) [(12, 2), (13, 2), (16, 1)],
  term ((-104 : Rat) / 7) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0463_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0463
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0464 : Poly :=
[
  term ((-827 : Rat) / 5) [(14, 1)]
]

/-- Partial product 464 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0464 : Poly :=
[
  term ((-1654 : Rat) / 5) [(8, 1), (12, 1), (14, 1)],
  term ((-1654 : Rat) / 5) [(9, 1), (13, 1), (14, 1)],
  term ((827 : Rat) / 5) [(12, 2), (14, 1)],
  term ((827 : Rat) / 5) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0464_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0464
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003YY_coefficient_21_0465 : Poly :=
[
  term ((3 : Rat) / 2) [(16, 1)]
]

/-- Partial product 465 for generator 21. -/
def rs_R003_ueqv_R003YY_partial_21_0465 : Poly :=
[
  term (3 : Rat) [(8, 1), (12, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(12, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 21. -/
theorem rs_R003_ueqv_R003YY_partial_21_0465_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_21_0465
        rs_R003_ueqv_R003YY_generator_21_0400_0465 =
      rs_R003_ueqv_R003YY_partial_21_0465 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_21_0400_0465 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_21_0400,
  rs_R003_ueqv_R003YY_partial_21_0401,
  rs_R003_ueqv_R003YY_partial_21_0402,
  rs_R003_ueqv_R003YY_partial_21_0403,
  rs_R003_ueqv_R003YY_partial_21_0404,
  rs_R003_ueqv_R003YY_partial_21_0405,
  rs_R003_ueqv_R003YY_partial_21_0406,
  rs_R003_ueqv_R003YY_partial_21_0407,
  rs_R003_ueqv_R003YY_partial_21_0408,
  rs_R003_ueqv_R003YY_partial_21_0409,
  rs_R003_ueqv_R003YY_partial_21_0410,
  rs_R003_ueqv_R003YY_partial_21_0411,
  rs_R003_ueqv_R003YY_partial_21_0412,
  rs_R003_ueqv_R003YY_partial_21_0413,
  rs_R003_ueqv_R003YY_partial_21_0414,
  rs_R003_ueqv_R003YY_partial_21_0415,
  rs_R003_ueqv_R003YY_partial_21_0416,
  rs_R003_ueqv_R003YY_partial_21_0417,
  rs_R003_ueqv_R003YY_partial_21_0418,
  rs_R003_ueqv_R003YY_partial_21_0419,
  rs_R003_ueqv_R003YY_partial_21_0420,
  rs_R003_ueqv_R003YY_partial_21_0421,
  rs_R003_ueqv_R003YY_partial_21_0422,
  rs_R003_ueqv_R003YY_partial_21_0423,
  rs_R003_ueqv_R003YY_partial_21_0424,
  rs_R003_ueqv_R003YY_partial_21_0425,
  rs_R003_ueqv_R003YY_partial_21_0426,
  rs_R003_ueqv_R003YY_partial_21_0427,
  rs_R003_ueqv_R003YY_partial_21_0428,
  rs_R003_ueqv_R003YY_partial_21_0429,
  rs_R003_ueqv_R003YY_partial_21_0430,
  rs_R003_ueqv_R003YY_partial_21_0431,
  rs_R003_ueqv_R003YY_partial_21_0432,
  rs_R003_ueqv_R003YY_partial_21_0433,
  rs_R003_ueqv_R003YY_partial_21_0434,
  rs_R003_ueqv_R003YY_partial_21_0435,
  rs_R003_ueqv_R003YY_partial_21_0436,
  rs_R003_ueqv_R003YY_partial_21_0437,
  rs_R003_ueqv_R003YY_partial_21_0438,
  rs_R003_ueqv_R003YY_partial_21_0439,
  rs_R003_ueqv_R003YY_partial_21_0440,
  rs_R003_ueqv_R003YY_partial_21_0441,
  rs_R003_ueqv_R003YY_partial_21_0442,
  rs_R003_ueqv_R003YY_partial_21_0443,
  rs_R003_ueqv_R003YY_partial_21_0444,
  rs_R003_ueqv_R003YY_partial_21_0445,
  rs_R003_ueqv_R003YY_partial_21_0446,
  rs_R003_ueqv_R003YY_partial_21_0447,
  rs_R003_ueqv_R003YY_partial_21_0448,
  rs_R003_ueqv_R003YY_partial_21_0449,
  rs_R003_ueqv_R003YY_partial_21_0450,
  rs_R003_ueqv_R003YY_partial_21_0451,
  rs_R003_ueqv_R003YY_partial_21_0452,
  rs_R003_ueqv_R003YY_partial_21_0453,
  rs_R003_ueqv_R003YY_partial_21_0454,
  rs_R003_ueqv_R003YY_partial_21_0455,
  rs_R003_ueqv_R003YY_partial_21_0456,
  rs_R003_ueqv_R003YY_partial_21_0457,
  rs_R003_ueqv_R003YY_partial_21_0458,
  rs_R003_ueqv_R003YY_partial_21_0459,
  rs_R003_ueqv_R003YY_partial_21_0460,
  rs_R003_ueqv_R003YY_partial_21_0461,
  rs_R003_ueqv_R003YY_partial_21_0462,
  rs_R003_ueqv_R003YY_partial_21_0463,
  rs_R003_ueqv_R003YY_partial_21_0464,
  rs_R003_ueqv_R003YY_partial_21_0465
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_21_0400_0465 : Poly :=
[
  term ((256 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1277 : Rat) / 6) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((227 : Rat) / 10) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4106 : Rat) / 105) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-38 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((310592 : Rat) / 2135) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-6144 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((443544 : Rat) / 10675) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((184 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2432 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1976 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((183403 : Rat) / 2100) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1229 : Rat) / 140) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((11827408 : Rat) / 53375) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-9216 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((3072 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((13873 : Rat) / 105) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-523 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3464 : Rat) / 5) [(8, 1), (9, 2), (12, 1)],
  term ((3136 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((958288 : Rat) / 7625) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-768 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3247 : Rat) / 15) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (-25 : Rat) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43083288 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6912 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2304 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((58011 : Rat) / 140) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7299 : Rat) / 140) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42016928 : Rat) / 53375) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((33792 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-11264 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((9152 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-53201 : Rat) / 105) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((2179 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((14096 : Rat) / 525) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 7) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4690208 : Rat) / 53375) [(8, 1), (12, 1), (13, 2)],
  term ((768 : Rat) / 7) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-256 : Rat) / 7) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1654 : Rat) / 5) [(8, 1), (12, 1), (14, 1)],
  term (3 : Rat) [(8, 1), (12, 1), (16, 1)],
  term ((-1816 : Rat) / 5) [(8, 1), (12, 2)],
  term ((1636 : Rat) / 5) [(8, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((3247 : Rat) / 15) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-25 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((958288 : Rat) / 7625) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-768 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((256 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-128 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((1277 : Rat) / 12) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-227 : Rat) / 20) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1277 : Rat) / 12) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-227 : Rat) / 20) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-53201 : Rat) / 105) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2179 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42016928 : Rat) / 53375) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((33792 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-11264 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((9152 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2053 : Rat) / 105) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((19 : Rat) / 7) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-155296 : Rat) / 2135) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((3072 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1)],
  term ((-1024 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(9, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((58011 : Rat) / 140) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7299 : Rat) / 140) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((43083288 : Rat) / 53375) [(9, 1), (11, 1), (13, 2)],
  term ((-6912 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((2304 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2053 : Rat) / 105) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((19 : Rat) / 7) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-155296 : Rat) / 2135) [(9, 1), (11, 1), (13, 4)],
  term ((3072 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1)],
  term ((-1024 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(9, 1), (11, 1), (13, 4), (16, 1)],
  term ((-1718352 : Rat) / 10675) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((6912 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((1437 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-117 : Rat) / 35) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((1437 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-117 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1718352 : Rat) / 10675) [(9, 1), (11, 2), (13, 3)],
  term ((6912 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1)],
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(9, 1), (11, 2), (13, 3), (16, 1)],
  term ((-1816 : Rat) / 5) [(9, 1), (12, 1), (13, 1)],
  term ((1636 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13873 : Rat) / 210) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((523 : Rat) / 70) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5913704 : Rat) / 53375) [(9, 1), (12, 1), (13, 3)],
  term ((4608 : Rat) / 35) [(9, 1), (12, 1), (13, 3), (14, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-221772 : Rat) / 10675) [(9, 1), (12, 2), (13, 1)],
  term ((-92 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((1216 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-988 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-183403 : Rat) / 4200) [(9, 1), (12, 2), (15, 1)],
  term ((1229 : Rat) / 280) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5913704 : Rat) / 53375) [(9, 1), (12, 3), (13, 1)],
  term ((4608 : Rat) / 35) [(9, 1), (12, 3), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-13873 : Rat) / 210) [(9, 1), (12, 3), (15, 1)],
  term ((523 : Rat) / 70) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1654 : Rat) / 5) [(9, 1), (13, 1), (14, 1)],
  term (3 : Rat) [(9, 1), (13, 1), (16, 1)],
  term ((-4709 : Rat) / 280) [(9, 1), (13, 2), (15, 1)],
  term ((1549 : Rat) / 280) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5799068 : Rat) / 53375) [(9, 1), (13, 3)],
  term ((3748 : Rat) / 35) [(9, 1), (13, 3), (14, 1)],
  term ((-64 : Rat) / 35) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((52 : Rat) / 35) [(9, 1), (13, 3), (16, 1)],
  term ((-1277 : Rat) / 6) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((227 : Rat) / 10) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((45861024 : Rat) / 53375) [(9, 2), (11, 1), (12, 2), (13, 1)],
  term ((-36864 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1392 : Rat) / 35) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5078 : Rat) / 15) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-226 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7660832 : Rat) / 7625) [(9, 2), (11, 1), (13, 3)],
  term ((-6144 : Rat) / 5) [(9, 2), (11, 1), (13, 3), (14, 1)],
  term ((2048 : Rat) / 5) [(9, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 5) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-2874 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((234 : Rat) / 35) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3436704 : Rat) / 10675) [(9, 2), (11, 2), (13, 2)],
  term ((-13824 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1)],
  term ((4608 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((13873 : Rat) / 105) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-523 : Rat) / 35) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11827408 : Rat) / 53375) [(9, 2), (12, 1), (13, 2)],
  term ((-9216 : Rat) / 35) [(9, 2), (12, 1), (13, 2), (14, 1)],
  term ((3072 : Rat) / 35) [(9, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(9, 2), (12, 1), (13, 2), (16, 1)],
  term ((1732 : Rat) / 5) [(9, 2), (12, 2)],
  term ((-1568 : Rat) / 5) [(9, 2), (12, 2), (14, 1)],
  term ((2 : Rat) / 5) [(9, 2), (12, 2), (16, 1)],
  term ((183403 : Rat) / 2100) [(9, 2), (13, 1), (15, 1)],
  term ((-1229 : Rat) / 140) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4141364 : Rat) / 10675) [(9, 2), (13, 2)],
  term ((-10792 : Rat) / 35) [(9, 2), (13, 2), (14, 1)],
  term ((-2432 : Rat) / 35) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((398 : Rat) / 7) [(9, 2), (13, 2), (16, 1)],
  term ((-4192 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91722048 : Rat) / 53375) [(9, 3), (11, 1), (13, 2)],
  term ((73728 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1)],
  term ((-24576 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-3464 : Rat) / 5) [(9, 3), (13, 1)],
  term ((3136 : Rat) / 5) [(9, 3), (13, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(9, 3), (13, 1), (16, 1)],
  term ((-479144 : Rat) / 7625) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((384 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-128 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3247 : Rat) / 30) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((25 : Rat) / 2) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3247 : Rat) / 30) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((25 : Rat) / 2) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-479144 : Rat) / 7625) [(10, 1), (11, 1), (13, 3)],
  term ((384 : Rat) / 5) [(10, 1), (11, 1), (13, 3), (14, 1)],
  term ((-128 : Rat) / 5) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((53201 : Rat) / 210) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2179 : Rat) / 70) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((21008464 : Rat) / 53375) [(11, 1), (12, 1), (13, 3)],
  term ((-16896 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1)],
  term ((5632 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-4576 : Rat) / 35) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-21541644 : Rat) / 53375) [(11, 1), (12, 2), (13, 1)],
  term ((3456 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((936 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-58011 : Rat) / 280) [(11, 1), (12, 2), (15, 1)],
  term ((7299 : Rat) / 280) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((21008464 : Rat) / 53375) [(11, 1), (12, 3), (13, 1)],
  term ((-16896 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1)],
  term ((5632 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-4576 : Rat) / 35) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term ((53201 : Rat) / 210) [(11, 1), (12, 3), (15, 1)],
  term ((-2179 : Rat) / 70) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-58011 : Rat) / 280) [(11, 1), (13, 2), (15, 1)],
  term ((7299 : Rat) / 280) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21541644 : Rat) / 53375) [(11, 1), (13, 3)],
  term ((3456 : Rat) / 7) [(11, 1), (13, 3), (14, 1)],
  term ((-1152 : Rat) / 7) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((936 : Rat) / 7) [(11, 1), (13, 3), (16, 1)],
  term ((908 : Rat) / 5) [(12, 1), (13, 2)],
  term ((-818 : Rat) / 5) [(12, 1), (13, 2), (14, 1)],
  term ((12 : Rat) / 5) [(12, 1), (13, 2), (16, 1)],
  term ((-7048 : Rat) / 525) [(12, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 7) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2345104 : Rat) / 53375) [(12, 2), (13, 2)],
  term ((-384 : Rat) / 7) [(12, 2), (13, 2), (14, 1)],
  term ((128 : Rat) / 7) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(12, 2), (13, 2), (16, 1)],
  term ((827 : Rat) / 5) [(12, 2), (14, 1)],
  term ((-3 : Rat) / 2) [(12, 2), (16, 1)],
  term ((908 : Rat) / 5) [(12, 3)],
  term ((-818 : Rat) / 5) [(12, 3), (14, 1)],
  term ((12 : Rat) / 5) [(12, 3), (16, 1)],
  term ((827 : Rat) / 5) [(13, 2), (14, 1)],
  term ((-3 : Rat) / 2) [(13, 2), (16, 1)],
  term ((-7048 : Rat) / 525) [(13, 3), (15, 1)],
  term ((-4 : Rat) / 7) [(13, 3), (15, 1), (16, 1)],
  term ((2345104 : Rat) / 53375) [(13, 4)],
  term ((-384 : Rat) / 7) [(13, 4), (14, 1)],
  term ((128 : Rat) / 7) [(13, 4), (14, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 400 through 465. -/
theorem rs_R003_ueqv_R003YY_block_21_0400_0465_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_21_0400_0465
      rs_R003_ueqv_R003YY_block_21_0400_0465 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
