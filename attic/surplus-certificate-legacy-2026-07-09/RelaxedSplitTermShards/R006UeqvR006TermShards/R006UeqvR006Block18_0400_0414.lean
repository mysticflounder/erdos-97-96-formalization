/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 18:400-414

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_18_0400_0414 : Poly :=
[
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0400 : Poly :=
[
  term (348 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 400 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0400 : Poly :=
[
  term (696 : Rat) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (696 : Rat) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term (-348 : Rat) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term (-348 : Rat) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0400_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0400
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0401 : Poly :=
[
  term ((-552 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0401 : Poly :=
[
  term ((-1104 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((552 : Rat) / 5) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((552 : Rat) / 5) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0401_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0401
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0402 : Poly :=
[
  term ((1224 : Rat) / 7) [(12, 1), (13, 2)]
]

/-- Partial product 402 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0402 : Poly :=
[
  term ((2448 : Rat) / 7) [(6, 1), (10, 1), (12, 1), (13, 2)],
  term ((2448 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1224 : Rat) / 7) [(10, 2), (12, 1), (13, 2)],
  term ((-1224 : Rat) / 7) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0402_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0402
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0403 : Poly :=
[
  term ((-1728 : Rat) / 5) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 403 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0403 : Poly :=
[
  term ((-3456 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-3456 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((1728 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((1728 : Rat) / 5) [(11, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0403_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0403
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0404 : Poly :=
[
  term ((576 : Rat) / 5) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 404 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0404 : Poly :=
[
  term ((1152 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(11, 2), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0404_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0404
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0405 : Poly :=
[
  term ((-288 : Rat) / 5) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 405 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0405 : Poly :=
[
  term ((-576 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 5) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0405_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0405
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0406 : Poly :=
[
  term ((-6 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 406 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0406 : Poly :=
[
  term ((-12 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((6 : Rat) / 5) [(10, 2), (12, 1), (14, 1)],
  term ((6 : Rat) / 5) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0406_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0406
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0407 : Poly :=
[
  term ((-14403 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 407 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0407 : Poly :=
[
  term ((-28806 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-28806 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((14403 : Rat) / 25) [(10, 2), (13, 1), (15, 1)],
  term ((14403 : Rat) / 25) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0407_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0407
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0408 : Poly :=
[
  term ((4626 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0408 : Poly :=
[
  term ((9252 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9252 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4626 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4626 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0408_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0408
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0409 : Poly :=
[
  term ((-1200 : Rat) / 7) [(13, 2)]
]

/-- Partial product 409 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0409 : Poly :=
[
  term ((-2400 : Rat) / 7) [(6, 1), (10, 1), (13, 2)],
  term ((-2400 : Rat) / 7) [(7, 1), (11, 1), (13, 2)],
  term ((1200 : Rat) / 7) [(10, 2), (13, 2)],
  term ((1200 : Rat) / 7) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0409_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0409
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0410 : Poly :=
[
  term ((2424 : Rat) / 5) [(13, 2), (14, 1)]
]

/-- Partial product 410 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0410 : Poly :=
[
  term ((4848 : Rat) / 5) [(6, 1), (10, 1), (13, 2), (14, 1)],
  term ((4848 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2424 : Rat) / 5) [(10, 2), (13, 2), (14, 1)],
  term ((-2424 : Rat) / 5) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0410_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0410
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0411 : Poly :=
[
  term (-192 : Rat) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 411 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0411 : Poly :=
[
  term (-384 : Rat) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (-384 : Rat) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term (192 : Rat) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term (192 : Rat) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0411_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0411
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0412 : Poly :=
[
  term (96 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 412 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0412 : Poly :=
[
  term (192 : Rat) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term (192 : Rat) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term (-96 : Rat) [(10, 2), (13, 2), (16, 1)],
  term (-96 : Rat) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0412_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0412
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0413 : Poly :=
[
  term ((18 : Rat) / 5) [(14, 1)]
]

/-- Partial product 413 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0413 : Poly :=
[
  term ((36 : Rat) / 5) [(6, 1), (10, 1), (14, 1)],
  term ((36 : Rat) / 5) [(7, 1), (11, 1), (14, 1)],
  term ((-18 : Rat) / 5) [(10, 2), (14, 1)],
  term ((-18 : Rat) / 5) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0413_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0413
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 18. -/
def rs_R006_ueqv_R006_coefficient_18_0414 : Poly :=
[
  term ((3 : Rat) / 10) [(16, 1)]
]

/-- Partial product 414 for generator 18. -/
def rs_R006_ueqv_R006_partial_18_0414 : Poly :=
[
  term ((3 : Rat) / 5) [(6, 1), (10, 1), (16, 1)],
  term ((3 : Rat) / 5) [(7, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 10) [(10, 2), (16, 1)],
  term ((-3 : Rat) / 10) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 18. -/
theorem rs_R006_ueqv_R006_partial_18_0414_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_18_0414
        rs_R006_ueqv_R006_generator_18_0400_0414 =
      rs_R006_ueqv_R006_partial_18_0414 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_18_0400_0414 : List Poly :=
[
  rs_R006_ueqv_R006_partial_18_0400,
  rs_R006_ueqv_R006_partial_18_0401,
  rs_R006_ueqv_R006_partial_18_0402,
  rs_R006_ueqv_R006_partial_18_0403,
  rs_R006_ueqv_R006_partial_18_0404,
  rs_R006_ueqv_R006_partial_18_0405,
  rs_R006_ueqv_R006_partial_18_0406,
  rs_R006_ueqv_R006_partial_18_0407,
  rs_R006_ueqv_R006_partial_18_0408,
  rs_R006_ueqv_R006_partial_18_0409,
  rs_R006_ueqv_R006_partial_18_0410,
  rs_R006_ueqv_R006_partial_18_0411,
  rs_R006_ueqv_R006_partial_18_0412,
  rs_R006_ueqv_R006_partial_18_0413,
  rs_R006_ueqv_R006_partial_18_0414
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_18_0400_0414 : Poly :=
[
  term (696 : Rat) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1104 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2448 : Rat) / 7) [(6, 1), (10, 1), (12, 1), (13, 2)],
  term ((-3456 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((1152 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (10, 1), (12, 1), (14, 1)],
  term ((-28806 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((9252 : Rat) / 25) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2400 : Rat) / 7) [(6, 1), (10, 1), (13, 2)],
  term ((4848 : Rat) / 5) [(6, 1), (10, 1), (13, 2), (14, 1)],
  term (-384 : Rat) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (192 : Rat) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 5) [(6, 1), (10, 1), (14, 1)],
  term ((3 : Rat) / 5) [(6, 1), (10, 1), (16, 1)],
  term (696 : Rat) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1104 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2448 : Rat) / 7) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-3456 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((1152 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-28806 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((9252 : Rat) / 25) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2400 : Rat) / 7) [(7, 1), (11, 1), (13, 2)],
  term ((4848 : Rat) / 5) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term (-384 : Rat) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term (192 : Rat) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 5) [(7, 1), (11, 1), (14, 1)],
  term ((3 : Rat) / 5) [(7, 1), (11, 1), (16, 1)],
  term (-348 : Rat) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((552 : Rat) / 5) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 7) [(10, 2), (12, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(10, 2), (12, 1), (13, 2), (16, 1)],
  term ((6 : Rat) / 5) [(10, 2), (12, 1), (14, 1)],
  term ((14403 : Rat) / 25) [(10, 2), (13, 1), (15, 1)],
  term ((-4626 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1200 : Rat) / 7) [(10, 2), (13, 2)],
  term ((-2424 : Rat) / 5) [(10, 2), (13, 2), (14, 1)],
  term (192 : Rat) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(10, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(10, 2), (14, 1)],
  term ((-3 : Rat) / 10) [(10, 2), (16, 1)],
  term (-348 : Rat) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((552 : Rat) / 5) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 7) [(11, 2), (12, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(11, 2), (12, 1), (13, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((6 : Rat) / 5) [(11, 2), (12, 1), (14, 1)],
  term ((14403 : Rat) / 25) [(11, 2), (13, 1), (15, 1)],
  term ((-4626 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1200 : Rat) / 7) [(11, 2), (13, 2)],
  term ((-2424 : Rat) / 5) [(11, 2), (13, 2), (14, 1)],
  term (192 : Rat) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(11, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(11, 2), (14, 1)],
  term ((-3 : Rat) / 10) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 400 through 414. -/
theorem rs_R006_ueqv_R006_block_18_0400_0414_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_18_0400_0414
      rs_R006_ueqv_R006_block_18_0400_0414 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
