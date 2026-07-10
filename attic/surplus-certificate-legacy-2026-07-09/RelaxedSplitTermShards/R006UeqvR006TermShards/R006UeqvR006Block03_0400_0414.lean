/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 3:400-414

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_03_0400_0414 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(10, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0400 : Poly :=
[
  term ((-192 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 400 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0400 : Poly :=
[
  term ((384 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0400_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0400
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0401 : Poly :=
[
  term ((84 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 401 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0401 : Poly :=
[
  term ((-168 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((84 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((168 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0401_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0401
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0402 : Poly :=
[
  term ((-2961 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 402 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0402 : Poly :=
[
  term ((5922 : Rat) / 25) [(4, 1), (11, 1), (15, 1)],
  term ((-2961 : Rat) / 25) [(4, 2), (11, 1), (15, 1)],
  term ((-2961 : Rat) / 25) [(5, 2), (11, 1), (15, 1)],
  term ((-5922 : Rat) / 25) [(10, 1), (11, 1), (15, 1)],
  term ((2961 : Rat) / 25) [(10, 2), (11, 1), (15, 1)],
  term ((2961 : Rat) / 25) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0402_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0402
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0403 : Poly :=
[
  term ((792 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0403 : Poly :=
[
  term ((-1584 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-792 : Rat) / 25) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-792 : Rat) / 25) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0403_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0403
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0404 : Poly :=
[
  term ((-954 : Rat) / 5) [(11, 2)]
]

/-- Partial product 404 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0404 : Poly :=
[
  term ((1908 : Rat) / 5) [(4, 1), (11, 2)],
  term ((-954 : Rat) / 5) [(4, 2), (11, 2)],
  term ((-954 : Rat) / 5) [(5, 2), (11, 2)],
  term ((-1908 : Rat) / 5) [(10, 1), (11, 2)],
  term ((954 : Rat) / 5) [(10, 2), (11, 2)],
  term ((954 : Rat) / 5) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0404_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0404
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0405 : Poly :=
[
  term (138 : Rat) [(11, 2), (14, 1)]
]

/-- Partial product 405 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0405 : Poly :=
[
  term (-276 : Rat) [(4, 1), (11, 2), (14, 1)],
  term (138 : Rat) [(4, 2), (11, 2), (14, 1)],
  term (138 : Rat) [(5, 2), (11, 2), (14, 1)],
  term (276 : Rat) [(10, 1), (11, 2), (14, 1)],
  term (-138 : Rat) [(10, 2), (11, 2), (14, 1)],
  term (-138 : Rat) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0405_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0405
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0406 : Poly :=
[
  term ((-2 : Rat) / 5) [(11, 2), (16, 1)]
]

/-- Partial product 406 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0406 : Poly :=
[
  term ((4 : Rat) / 5) [(4, 1), (11, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(4, 2), (11, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(5, 2), (11, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(10, 1), (11, 2), (16, 1)],
  term ((2 : Rat) / 5) [(10, 2), (11, 2), (16, 1)],
  term ((2 : Rat) / 5) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0406_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0406
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0407 : Poly :=
[
  term ((-177 : Rat) / 5) [(12, 1)]
]

/-- Partial product 407 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0407 : Poly :=
[
  term ((354 : Rat) / 5) [(4, 1), (12, 1)],
  term ((-177 : Rat) / 5) [(4, 2), (12, 1)],
  term ((-177 : Rat) / 5) [(5, 2), (12, 1)],
  term ((-354 : Rat) / 5) [(10, 1), (12, 1)],
  term ((177 : Rat) / 5) [(10, 2), (12, 1)],
  term ((177 : Rat) / 5) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0407_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0407
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0408 : Poly :=
[
  term ((126 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 408 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0408 : Poly :=
[
  term ((-252 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((126 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((126 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((252 : Rat) / 5) [(10, 1), (12, 1), (14, 1)],
  term ((-126 : Rat) / 5) [(10, 2), (12, 1), (14, 1)],
  term ((-126 : Rat) / 5) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0408_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0408
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0409 : Poly :=
[
  term ((4 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 409 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0409 : Poly :=
[
  term ((-8 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((4 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 5) [(10, 1), (12, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(10, 2), (12, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0409_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0409
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0410 : Poly :=
[
  term ((42 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 410 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0410 : Poly :=
[
  term ((-84 : Rat) / 25) [(4, 1), (13, 1), (15, 1)],
  term ((42 : Rat) / 25) [(4, 2), (13, 1), (15, 1)],
  term ((42 : Rat) / 25) [(5, 2), (13, 1), (15, 1)],
  term ((84 : Rat) / 25) [(10, 1), (13, 1), (15, 1)],
  term ((-42 : Rat) / 25) [(10, 2), (13, 1), (15, 1)],
  term ((-42 : Rat) / 25) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0410_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0410
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0411 : Poly :=
[
  term ((36 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0411 : Poly :=
[
  term ((-72 : Rat) / 25) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 25) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 25) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0411_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0411
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0412 : Poly :=
[
  term ((24 : Rat) / 5) [(13, 2)]
]

/-- Partial product 412 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0412 : Poly :=
[
  term ((-48 : Rat) / 5) [(4, 1), (13, 2)],
  term ((24 : Rat) / 5) [(4, 2), (13, 2)],
  term ((24 : Rat) / 5) [(5, 2), (13, 2)],
  term ((48 : Rat) / 5) [(10, 1), (13, 2)],
  term ((-24 : Rat) / 5) [(10, 2), (13, 2)],
  term ((-24 : Rat) / 5) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0412_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0412
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0413 : Poly :=
[
  term (-6 : Rat) [(14, 1)]
]

/-- Partial product 413 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0413 : Poly :=
[
  term (12 : Rat) [(4, 1), (14, 1)],
  term (-6 : Rat) [(4, 2), (14, 1)],
  term (-6 : Rat) [(5, 2), (14, 1)],
  term (-12 : Rat) [(10, 1), (14, 1)],
  term (6 : Rat) [(10, 2), (14, 1)],
  term (6 : Rat) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0413_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0413
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 3. -/
def rs_R006_ueqv_R006_coefficient_03_0414 : Poly :=
[
  term ((-9 : Rat) / 10) [(16, 1)]
]

/-- Partial product 414 for generator 3. -/
def rs_R006_ueqv_R006_partial_03_0414 : Poly :=
[
  term ((9 : Rat) / 5) [(4, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(4, 2), (16, 1)],
  term ((-9 : Rat) / 10) [(5, 2), (16, 1)],
  term ((-9 : Rat) / 5) [(10, 1), (16, 1)],
  term ((9 : Rat) / 10) [(10, 2), (16, 1)],
  term ((9 : Rat) / 10) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 3. -/
theorem rs_R006_ueqv_R006_partial_03_0414_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_03_0414
        rs_R006_ueqv_R006_generator_03_0400_0414 =
      rs_R006_ueqv_R006_partial_03_0414 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_03_0400_0414 : List Poly :=
[
  rs_R006_ueqv_R006_partial_03_0400,
  rs_R006_ueqv_R006_partial_03_0401,
  rs_R006_ueqv_R006_partial_03_0402,
  rs_R006_ueqv_R006_partial_03_0403,
  rs_R006_ueqv_R006_partial_03_0404,
  rs_R006_ueqv_R006_partial_03_0405,
  rs_R006_ueqv_R006_partial_03_0406,
  rs_R006_ueqv_R006_partial_03_0407,
  rs_R006_ueqv_R006_partial_03_0408,
  rs_R006_ueqv_R006_partial_03_0409,
  rs_R006_ueqv_R006_partial_03_0410,
  rs_R006_ueqv_R006_partial_03_0411,
  rs_R006_ueqv_R006_partial_03_0412,
  rs_R006_ueqv_R006_partial_03_0413,
  rs_R006_ueqv_R006_partial_03_0414
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_03_0400_0414 : Poly :=
[
  term ((384 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((5922 : Rat) / 25) [(4, 1), (11, 1), (15, 1)],
  term ((-1584 : Rat) / 25) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1908 : Rat) / 5) [(4, 1), (11, 2)],
  term (-276 : Rat) [(4, 1), (11, 2), (14, 1)],
  term ((4 : Rat) / 5) [(4, 1), (11, 2), (16, 1)],
  term ((354 : Rat) / 5) [(4, 1), (12, 1)],
  term ((-252 : Rat) / 5) [(4, 1), (12, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((-84 : Rat) / 25) [(4, 1), (13, 1), (15, 1)],
  term ((-72 : Rat) / 25) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (13, 2)],
  term (12 : Rat) [(4, 1), (14, 1)],
  term ((9 : Rat) / 5) [(4, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 5) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2961 : Rat) / 25) [(4, 2), (11, 1), (15, 1)],
  term ((792 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-954 : Rat) / 5) [(4, 2), (11, 2)],
  term (138 : Rat) [(4, 2), (11, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(4, 2), (11, 2), (16, 1)],
  term ((-177 : Rat) / 5) [(4, 2), (12, 1)],
  term ((126 : Rat) / 5) [(4, 2), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((42 : Rat) / 25) [(4, 2), (13, 1), (15, 1)],
  term ((36 : Rat) / 25) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(4, 2), (13, 2)],
  term (-6 : Rat) [(4, 2), (14, 1)],
  term ((-9 : Rat) / 10) [(4, 2), (16, 1)],
  term ((-192 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((84 : Rat) / 5) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2961 : Rat) / 25) [(5, 2), (11, 1), (15, 1)],
  term ((792 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-954 : Rat) / 5) [(5, 2), (11, 2)],
  term (138 : Rat) [(5, 2), (11, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(5, 2), (11, 2), (16, 1)],
  term ((-177 : Rat) / 5) [(5, 2), (12, 1)],
  term ((126 : Rat) / 5) [(5, 2), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((42 : Rat) / 25) [(5, 2), (13, 1), (15, 1)],
  term ((36 : Rat) / 25) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(5, 2), (13, 2)],
  term (-6 : Rat) [(5, 2), (14, 1)],
  term ((-9 : Rat) / 10) [(5, 2), (16, 1)],
  term ((-384 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((168 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5922 : Rat) / 25) [(10, 1), (11, 1), (15, 1)],
  term ((1584 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1908 : Rat) / 5) [(10, 1), (11, 2)],
  term (276 : Rat) [(10, 1), (11, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(10, 1), (11, 2), (16, 1)],
  term ((-354 : Rat) / 5) [(10, 1), (12, 1)],
  term ((252 : Rat) / 5) [(10, 1), (12, 1), (14, 1)],
  term ((8 : Rat) / 5) [(10, 1), (12, 1), (16, 1)],
  term ((84 : Rat) / 25) [(10, 1), (13, 1), (15, 1)],
  term ((72 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(10, 1), (13, 2)],
  term (-12 : Rat) [(10, 1), (14, 1)],
  term ((-9 : Rat) / 5) [(10, 1), (16, 1)],
  term ((192 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((2961 : Rat) / 25) [(10, 2), (11, 1), (15, 1)],
  term ((-792 : Rat) / 25) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((954 : Rat) / 5) [(10, 2), (11, 2)],
  term (-138 : Rat) [(10, 2), (11, 2), (14, 1)],
  term ((2 : Rat) / 5) [(10, 2), (11, 2), (16, 1)],
  term ((177 : Rat) / 5) [(10, 2), (12, 1)],
  term ((-126 : Rat) / 5) [(10, 2), (12, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(10, 2), (12, 1), (16, 1)],
  term ((-42 : Rat) / 25) [(10, 2), (13, 1), (15, 1)],
  term ((-36 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(10, 2), (13, 2)],
  term (6 : Rat) [(10, 2), (14, 1)],
  term ((9 : Rat) / 10) [(10, 2), (16, 1)],
  term ((177 : Rat) / 5) [(11, 2), (12, 1)],
  term ((-126 : Rat) / 5) [(11, 2), (12, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(11, 2), (12, 1), (16, 1)],
  term ((-42 : Rat) / 25) [(11, 2), (13, 1), (15, 1)],
  term ((-36 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(11, 2), (13, 2)],
  term (6 : Rat) [(11, 2), (14, 1)],
  term ((9 : Rat) / 10) [(11, 2), (16, 1)],
  term ((192 : Rat) / 5) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-84 : Rat) / 5) [(11, 3), (13, 1), (16, 1)],
  term ((2961 : Rat) / 25) [(11, 3), (15, 1)],
  term ((-792 : Rat) / 25) [(11, 3), (15, 1), (16, 1)],
  term ((954 : Rat) / 5) [(11, 4)],
  term (-138 : Rat) [(11, 4), (14, 1)],
  term ((2 : Rat) / 5) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 400 through 414. -/
theorem rs_R006_ueqv_R006_block_03_0400_0414_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_03_0400_0414
      rs_R006_ueqv_R006_block_03_0400_0414 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
