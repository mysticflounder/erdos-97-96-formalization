/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 0:400-415

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 0 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0400 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 400 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0400 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(5, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0400
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0401 : Poly :=
[
  term ((-327135218 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 401 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0401 : Poly :=
[
  term ((-327135218 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((-327135218 : Rat) / 330679773) [(1, 2), (12, 1), (15, 2)],
  term ((327135218 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((327135218 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0401
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0402 : Poly :=
[
  term ((354307826 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 402 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0402 : Poly :=
[
  term ((354307826 : Rat) / 110226591) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((354307826 : Rat) / 110226591) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-354307826 : Rat) / 110226591) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-354307826 : Rat) / 110226591) [(5, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0402
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0403 : Poly :=
[
  term ((74217920 : Rat) / 36742197) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 403 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0403 : Poly :=
[
  term ((74217920 : Rat) / 36742197) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(5, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0403
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0404 : Poly :=
[
  term ((1260212843 : Rat) / 661359546) [(13, 1), (15, 1)]
]

/-- Partial product 404 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0404 : Poly :=
[
  term ((1260212843 : Rat) / 661359546) [(0, 2), (13, 1), (15, 1)],
  term ((1260212843 : Rat) / 661359546) [(1, 2), (13, 1), (15, 1)],
  term ((-1260212843 : Rat) / 661359546) [(4, 2), (13, 1), (15, 1)],
  term ((-1260212843 : Rat) / 661359546) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0404
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0405 : Poly :=
[
  term ((76274240 : Rat) / 36742197) [(13, 1), (15, 3)]
]

/-- Partial product 405 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0405 : Poly :=
[
  term ((76274240 : Rat) / 36742197) [(0, 2), (13, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(1, 2), (13, 1), (15, 3)],
  term ((-76274240 : Rat) / 36742197) [(4, 2), (13, 1), (15, 3)],
  term ((-76274240 : Rat) / 36742197) [(5, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0405
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0406 : Poly :=
[
  term ((17108609 : Rat) / 24494798) [(13, 2)]
]

/-- Partial product 406 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0406 : Poly :=
[
  term ((17108609 : Rat) / 24494798) [(0, 2), (13, 2)],
  term ((17108609 : Rat) / 24494798) [(1, 2), (13, 2)],
  term ((-17108609 : Rat) / 24494798) [(4, 2), (13, 2)],
  term ((-17108609 : Rat) / 24494798) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0406
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0407 : Poly :=
[
  term ((13502580 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 407 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0407 : Poly :=
[
  term ((13502580 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((13502580 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((-13502580 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((-13502580 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0407
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0408 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (14, 2)]
]

/-- Partial product 408 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0408 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(4, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(5, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0408
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0409 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 409 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0409 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0409
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0410 : Poly :=
[
  term ((266 : Rat) / 67) [(14, 1)]
]

/-- Partial product 410 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0410 : Poly :=
[
  term ((266 : Rat) / 67) [(0, 2), (14, 1)],
  term ((266 : Rat) / 67) [(1, 2), (14, 1)],
  term ((-266 : Rat) / 67) [(4, 2), (14, 1)],
  term ((-266 : Rat) / 67) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0410
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0411 : Poly :=
[
  term ((-1375918960 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 411 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0411 : Poly :=
[
  term ((-1375918960 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((-1375918960 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)],
  term ((1375918960 : Rat) / 110226591) [(4, 2), (14, 1), (15, 2)],
  term ((1375918960 : Rat) / 110226591) [(5, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0411
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0412 : Poly :=
[
  term ((-92 : Rat) / 67) [(14, 2)]
]

/-- Partial product 412 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0412 : Poly :=
[
  term ((-92 : Rat) / 67) [(0, 2), (14, 2)],
  term ((-92 : Rat) / 67) [(1, 2), (14, 2)],
  term ((92 : Rat) / 67) [(4, 2), (14, 2)],
  term ((92 : Rat) / 67) [(5, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0412
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0413 : Poly :=
[
  term ((-81317120 : Rat) / 110226591) [(14, 2), (15, 2)]
]

/-- Partial product 413 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0413 : Poly :=
[
  term ((-81317120 : Rat) / 110226591) [(0, 2), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(1, 2), (14, 2), (15, 2)],
  term ((81317120 : Rat) / 110226591) [(4, 2), (14, 2), (15, 2)],
  term ((81317120 : Rat) / 110226591) [(5, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0413
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0414 : Poly :=
[
  term ((-3615924953 : Rat) / 661359546) [(15, 2)]
]

/-- Partial product 414 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0414 : Poly :=
[
  term ((-3615924953 : Rat) / 661359546) [(0, 2), (15, 2)],
  term ((-3615924953 : Rat) / 661359546) [(1, 2), (15, 2)],
  term ((3615924953 : Rat) / 661359546) [(4, 2), (15, 2)],
  term ((3615924953 : Rat) / 661359546) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0414
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0415 : Poly :=
[
  term ((-94503680 : Rat) / 110226591) [(15, 4)]
]

/-- Partial product 415 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0415 : Poly :=
[
  term ((-94503680 : Rat) / 110226591) [(0, 2), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(1, 2), (15, 4)],
  term ((94503680 : Rat) / 110226591) [(4, 2), (15, 4)],
  term ((94503680 : Rat) / 110226591) [(5, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0415
        rs_R009_ueqv_R009NNNYN_generator_00_0400_0415 =
      rs_R009_ueqv_R009NNNYN_partial_00_0415 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_00_0400_0415 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_00_0400,
  rs_R009_ueqv_R009NNNYN_partial_00_0401,
  rs_R009_ueqv_R009NNNYN_partial_00_0402,
  rs_R009_ueqv_R009NNNYN_partial_00_0403,
  rs_R009_ueqv_R009NNNYN_partial_00_0404,
  rs_R009_ueqv_R009NNNYN_partial_00_0405,
  rs_R009_ueqv_R009NNNYN_partial_00_0406,
  rs_R009_ueqv_R009NNNYN_partial_00_0407,
  rs_R009_ueqv_R009NNNYN_partial_00_0408,
  rs_R009_ueqv_R009NNNYN_partial_00_0409,
  rs_R009_ueqv_R009NNNYN_partial_00_0410,
  rs_R009_ueqv_R009NNNYN_partial_00_0411,
  rs_R009_ueqv_R009NNNYN_partial_00_0412,
  rs_R009_ueqv_R009NNNYN_partial_00_0413,
  rs_R009_ueqv_R009NNNYN_partial_00_0414,
  rs_R009_ueqv_R009NNNYN_partial_00_0415
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_00_0400_0415 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-327135218 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((354307826 : Rat) / 110226591) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((1260212843 : Rat) / 661359546) [(0, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(0, 2), (13, 1), (15, 3)],
  term ((17108609 : Rat) / 24494798) [(0, 2), (13, 2)],
  term ((13502580 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (15, 2)],
  term ((266 : Rat) / 67) [(0, 2), (14, 1)],
  term ((-1375918960 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(0, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(0, 2), (14, 2), (15, 2)],
  term ((-3615924953 : Rat) / 661359546) [(0, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(0, 2), (15, 4)],
  term ((87910400 : Rat) / 110226591) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-327135218 : Rat) / 330679773) [(1, 2), (12, 1), (15, 2)],
  term ((354307826 : Rat) / 110226591) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((1260212843 : Rat) / 661359546) [(1, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(1, 2), (13, 1), (15, 3)],
  term ((17108609 : Rat) / 24494798) [(1, 2), (13, 2)],
  term ((13502580 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (15, 2)],
  term ((266 : Rat) / 67) [(1, 2), (14, 1)],
  term ((-1375918960 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(1, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(1, 2), (14, 2), (15, 2)],
  term ((-3615924953 : Rat) / 661359546) [(1, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(1, 2), (15, 4)],
  term ((-87910400 : Rat) / 110226591) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((327135218 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((-354307826 : Rat) / 110226591) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1260212843 : Rat) / 661359546) [(4, 2), (13, 1), (15, 1)],
  term ((-76274240 : Rat) / 36742197) [(4, 2), (13, 1), (15, 3)],
  term ((-17108609 : Rat) / 24494798) [(4, 2), (13, 2)],
  term ((-13502580 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((9596160 : Rat) / 12247399) [(4, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((-266 : Rat) / 67) [(4, 2), (14, 1)],
  term ((1375918960 : Rat) / 110226591) [(4, 2), (14, 1), (15, 2)],
  term ((92 : Rat) / 67) [(4, 2), (14, 2)],
  term ((81317120 : Rat) / 110226591) [(4, 2), (14, 2), (15, 2)],
  term ((3615924953 : Rat) / 661359546) [(4, 2), (15, 2)],
  term ((94503680 : Rat) / 110226591) [(4, 2), (15, 4)],
  term ((-87910400 : Rat) / 110226591) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((327135218 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)],
  term ((-354307826 : Rat) / 110226591) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1260212843 : Rat) / 661359546) [(5, 2), (13, 1), (15, 1)],
  term ((-76274240 : Rat) / 36742197) [(5, 2), (13, 1), (15, 3)],
  term ((-17108609 : Rat) / 24494798) [(5, 2), (13, 2)],
  term ((-13502580 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)],
  term ((9596160 : Rat) / 12247399) [(5, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)],
  term ((-266 : Rat) / 67) [(5, 2), (14, 1)],
  term ((1375918960 : Rat) / 110226591) [(5, 2), (14, 1), (15, 2)],
  term ((92 : Rat) / 67) [(5, 2), (14, 2)],
  term ((81317120 : Rat) / 110226591) [(5, 2), (14, 2), (15, 2)],
  term ((3615924953 : Rat) / 661359546) [(5, 2), (15, 2)],
  term ((94503680 : Rat) / 110226591) [(5, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 400 through 415. -/
theorem rs_R009_ueqv_R009NNNYN_block_00_0400_0415_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_00_0400_0415
      rs_R009_ueqv_R009NNNYN_block_00_0400_0415 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
