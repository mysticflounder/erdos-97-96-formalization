/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 4:400-414

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_04_0400_0414 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0400 : Poly :=
[
  term ((-1781136 : Rat) / 2995) [(11, 2), (14, 1)]
]

/-- Partial product 400 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0400 : Poly :=
[
  term ((3562272 : Rat) / 2995) [(6, 1), (11, 2), (14, 1)],
  term ((-1781136 : Rat) / 2995) [(6, 2), (11, 2), (14, 1)],
  term ((-1781136 : Rat) / 2995) [(7, 2), (11, 2), (14, 1)],
  term ((-3562272 : Rat) / 2995) [(11, 2), (12, 1), (14, 1)],
  term ((1781136 : Rat) / 2995) [(11, 2), (12, 2), (14, 1)],
  term ((1781136 : Rat) / 2995) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0400_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0400
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0401 : Poly :=
[
  term ((-3242592 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 401 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0401 : Poly :=
[
  term ((6485184 : Rat) / 2995) [(6, 1), (11, 2), (15, 2)],
  term ((-3242592 : Rat) / 2995) [(6, 2), (11, 2), (15, 2)],
  term ((-3242592 : Rat) / 2995) [(7, 2), (11, 2), (15, 2)],
  term ((-6485184 : Rat) / 2995) [(11, 2), (12, 1), (15, 2)],
  term ((3242592 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((3242592 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0401_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0401
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0402 : Poly :=
[
  term ((948 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 402 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0402 : Poly :=
[
  term ((-1896 : Rat) / 5) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((948 : Rat) / 5) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((948 : Rat) / 5) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-948 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-948 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0402_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0402
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0403 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(11, 3), (15, 1)]
]

/-- Partial product 403 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0403 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(6, 1), (11, 3), (15, 1)],
  term ((2892672 : Rat) / 2995) [(6, 2), (11, 3), (15, 1)],
  term ((2892672 : Rat) / 2995) [(7, 2), (11, 3), (15, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (12, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (12, 2), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0403_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0403
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0404 : Poly :=
[
  term ((-205376 : Rat) / 2995) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 404 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0404 : Poly :=
[
  term ((410752 : Rat) / 2995) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-205376 : Rat) / 2995) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-205376 : Rat) / 2995) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-410752 : Rat) / 2995) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((205376 : Rat) / 2995) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((205376 : Rat) / 2995) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0404_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0404
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0405 : Poly :=
[
  term ((33 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0405 : Poly :=
[
  term ((-66 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 5) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((66 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 5) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 5) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0405_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0405
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0406 : Poly :=
[
  term ((-475792 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 406 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0406 : Poly :=
[
  term ((951584 : Rat) / 2995) [(6, 1), (13, 1), (15, 1)],
  term ((-475792 : Rat) / 2995) [(6, 2), (13, 1), (15, 1)],
  term ((-475792 : Rat) / 2995) [(7, 2), (13, 1), (15, 1)],
  term ((-951584 : Rat) / 2995) [(12, 1), (13, 1), (15, 1)],
  term ((475792 : Rat) / 2995) [(12, 2), (13, 1), (15, 1)],
  term ((475792 : Rat) / 2995) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0406_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0406
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0407 : Poly :=
[
  term ((96 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0407 : Poly :=
[
  term ((-192 : Rat) / 5) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0407_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0407
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0408 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(13, 1), (15, 3)]
]

/-- Partial product 408 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0408 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(6, 1), (13, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(6, 2), (13, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(7, 2), (13, 1), (15, 3)],
  term ((4847616 : Rat) / 2995) [(12, 1), (13, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(12, 2), (13, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0408_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0408
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0409 : Poly :=
[
  term ((-534 : Rat) / 5) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 409 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0409 : Poly :=
[
  term ((1068 : Rat) / 5) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1068 : Rat) / 5) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0409_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0409
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0410 : Poly :=
[
  term ((10123 : Rat) / 599) [(14, 1)]
]

/-- Partial product 410 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0410 : Poly :=
[
  term ((-20246 : Rat) / 599) [(6, 1), (14, 1)],
  term ((10123 : Rat) / 599) [(6, 2), (14, 1)],
  term ((10123 : Rat) / 599) [(7, 2), (14, 1)],
  term ((20246 : Rat) / 599) [(12, 1), (14, 1)],
  term ((-10123 : Rat) / 599) [(12, 2), (14, 1)],
  term ((-10123 : Rat) / 599) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0410_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0410
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0411 : Poly :=
[
  term ((-1211904 : Rat) / 2995) [(14, 1), (15, 2)]
]

/-- Partial product 411 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0411 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(6, 1), (14, 1), (15, 2)],
  term ((-1211904 : Rat) / 2995) [(6, 2), (14, 1), (15, 2)],
  term ((-1211904 : Rat) / 2995) [(7, 2), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((1211904 : Rat) / 2995) [(12, 2), (14, 1), (15, 2)],
  term ((1211904 : Rat) / 2995) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0411_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0411
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0412 : Poly :=
[
  term ((267 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 412 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0412 : Poly :=
[
  term ((-534 : Rat) / 5) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((267 : Rat) / 5) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((267 : Rat) / 5) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-267 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-267 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0412_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0412
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0413 : Poly :=
[
  term ((4123958 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 413 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0413 : Poly :=
[
  term ((-8247916 : Rat) / 2995) [(6, 1), (15, 2)],
  term ((4123958 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((4123958 : Rat) / 2995) [(7, 2), (15, 2)],
  term ((8247916 : Rat) / 2995) [(12, 1), (15, 2)],
  term ((-4123958 : Rat) / 2995) [(12, 2), (15, 2)],
  term ((-4123958 : Rat) / 2995) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0413_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0413
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYN_coefficient_04_0414 : Poly :=
[
  term ((-1833 : Rat) / 10) [(15, 2), (16, 1)]
]

/-- Partial product 414 for generator 4. -/
def rs_R010_ueqv_R010NYN_partial_04_0414 : Poly :=
[
  term ((1833 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((-1833 : Rat) / 10) [(6, 2), (15, 2), (16, 1)],
  term ((-1833 : Rat) / 10) [(7, 2), (15, 2), (16, 1)],
  term ((-1833 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((1833 : Rat) / 10) [(12, 2), (15, 2), (16, 1)],
  term ((1833 : Rat) / 10) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 4. -/
theorem rs_R010_ueqv_R010NYN_partial_04_0414_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_04_0414
        rs_R010_ueqv_R010NYN_generator_04_0400_0414 =
      rs_R010_ueqv_R010NYN_partial_04_0414 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_04_0400_0414 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_04_0400,
  rs_R010_ueqv_R010NYN_partial_04_0401,
  rs_R010_ueqv_R010NYN_partial_04_0402,
  rs_R010_ueqv_R010NYN_partial_04_0403,
  rs_R010_ueqv_R010NYN_partial_04_0404,
  rs_R010_ueqv_R010NYN_partial_04_0405,
  rs_R010_ueqv_R010NYN_partial_04_0406,
  rs_R010_ueqv_R010NYN_partial_04_0407,
  rs_R010_ueqv_R010NYN_partial_04_0408,
  rs_R010_ueqv_R010NYN_partial_04_0409,
  rs_R010_ueqv_R010NYN_partial_04_0410,
  rs_R010_ueqv_R010NYN_partial_04_0411,
  rs_R010_ueqv_R010NYN_partial_04_0412,
  rs_R010_ueqv_R010NYN_partial_04_0413,
  rs_R010_ueqv_R010NYN_partial_04_0414
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_04_0400_0414 : Poly :=
[
  term ((3562272 : Rat) / 2995) [(6, 1), (11, 2), (14, 1)],
  term ((6485184 : Rat) / 2995) [(6, 1), (11, 2), (15, 2)],
  term ((-1896 : Rat) / 5) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(6, 1), (11, 3), (15, 1)],
  term ((410752 : Rat) / 2995) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-66 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((951584 : Rat) / 2995) [(6, 1), (13, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4847616 : Rat) / 2995) [(6, 1), (13, 1), (15, 3)],
  term ((1068 : Rat) / 5) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-20246 : Rat) / 599) [(6, 1), (14, 1)],
  term ((2423808 : Rat) / 2995) [(6, 1), (14, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8247916 : Rat) / 2995) [(6, 1), (15, 2)],
  term ((1833 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((-1781136 : Rat) / 2995) [(6, 2), (11, 2), (14, 1)],
  term ((-3242592 : Rat) / 2995) [(6, 2), (11, 2), (15, 2)],
  term ((948 : Rat) / 5) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((2892672 : Rat) / 2995) [(6, 2), (11, 3), (15, 1)],
  term ((-205376 : Rat) / 2995) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((33 : Rat) / 5) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475792 : Rat) / 2995) [(6, 2), (13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((2423808 : Rat) / 2995) [(6, 2), (13, 1), (15, 3)],
  term ((-534 : Rat) / 5) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((10123 : Rat) / 599) [(6, 2), (14, 1)],
  term ((-1211904 : Rat) / 2995) [(6, 2), (14, 1), (15, 2)],
  term ((267 : Rat) / 5) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((4123958 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((-1833 : Rat) / 10) [(6, 2), (15, 2), (16, 1)],
  term ((-1781136 : Rat) / 2995) [(7, 2), (11, 2), (14, 1)],
  term ((-3242592 : Rat) / 2995) [(7, 2), (11, 2), (15, 2)],
  term ((948 : Rat) / 5) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((2892672 : Rat) / 2995) [(7, 2), (11, 3), (15, 1)],
  term ((-205376 : Rat) / 2995) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((33 : Rat) / 5) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475792 : Rat) / 2995) [(7, 2), (13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2423808 : Rat) / 2995) [(7, 2), (13, 1), (15, 3)],
  term ((-534 : Rat) / 5) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((10123 : Rat) / 599) [(7, 2), (14, 1)],
  term ((-1211904 : Rat) / 2995) [(7, 2), (14, 1), (15, 2)],
  term ((267 : Rat) / 5) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((4123958 : Rat) / 2995) [(7, 2), (15, 2)],
  term ((-1833 : Rat) / 10) [(7, 2), (15, 2), (16, 1)],
  term ((-3562272 : Rat) / 2995) [(11, 2), (12, 1), (14, 1)],
  term ((-6485184 : Rat) / 2995) [(11, 2), (12, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1781136 : Rat) / 2995) [(11, 2), (12, 2), (14, 1)],
  term ((3242592 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((-948 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((1781136 : Rat) / 2995) [(11, 2), (13, 2), (14, 1)],
  term ((3242592 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)],
  term ((-948 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (12, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (12, 2), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (13, 2), (15, 1)],
  term ((-410752 : Rat) / 2995) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((66 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-951584 : Rat) / 2995) [(12, 1), (13, 1), (15, 1)],
  term ((192 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4847616 : Rat) / 2995) [(12, 1), (13, 1), (15, 3)],
  term ((-1068 : Rat) / 5) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((20246 : Rat) / 599) [(12, 1), (14, 1)],
  term ((-2423808 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((534 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8247916 : Rat) / 2995) [(12, 1), (15, 2)],
  term ((-1833 : Rat) / 5) [(12, 1), (15, 2), (16, 1)],
  term ((205376 : Rat) / 2995) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-33 : Rat) / 5) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((475792 : Rat) / 2995) [(12, 2), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2423808 : Rat) / 2995) [(12, 2), (13, 1), (15, 3)],
  term ((534 : Rat) / 5) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-10123 : Rat) / 599) [(12, 2), (14, 1)],
  term ((1211904 : Rat) / 2995) [(12, 2), (14, 1), (15, 2)],
  term ((-267 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4123958 : Rat) / 2995) [(12, 2), (15, 2)],
  term ((1833 : Rat) / 10) [(12, 2), (15, 2), (16, 1)],
  term ((-10123 : Rat) / 599) [(13, 2), (14, 1)],
  term ((1211904 : Rat) / 2995) [(13, 2), (14, 1), (15, 2)],
  term ((-267 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4123958 : Rat) / 2995) [(13, 2), (15, 2)],
  term ((1833 : Rat) / 10) [(13, 2), (15, 2), (16, 1)],
  term ((205376 : Rat) / 2995) [(13, 3), (14, 1), (15, 1)],
  term ((-33 : Rat) / 5) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((475792 : Rat) / 2995) [(13, 3), (15, 1)],
  term ((-96 : Rat) / 5) [(13, 3), (15, 1), (16, 1)],
  term ((-2423808 : Rat) / 2995) [(13, 3), (15, 3)],
  term ((534 : Rat) / 5) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 400 through 414. -/
theorem rs_R010_ueqv_R010NYN_block_04_0400_0414_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_04_0400_0414
      rs_R010_ueqv_R010NYN_block_04_0400_0414 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
