/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 30:400-409

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_30_0400_0409 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0400 : Poly :=
[
  term ((12 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 400 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0400 : Poly :=
[
  term ((24 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(12, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(12, 1), (16, 1)],
  term ((24 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0400
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0401 : Poly :=
[
  term ((12762389 : Rat) / 640500) [(13, 1), (15, 1)]
]

/-- Partial product 401 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0401 : Poly :=
[
  term ((12762389 : Rat) / 320250) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12762389 : Rat) / 640500) [(12, 2), (13, 1), (15, 1)],
  term ((-12762389 : Rat) / 320250) [(13, 1), (14, 1), (15, 1)],
  term ((12762389 : Rat) / 640500) [(13, 1), (15, 1)],
  term ((12762389 : Rat) / 320250) [(13, 2), (15, 2)],
  term ((-12762389 : Rat) / 640500) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0401
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0402 : Poly :=
[
  term ((-603 : Rat) / 140) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0402 : Poly :=
[
  term ((-603 : Rat) / 70) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 140) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 70) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 140) [(13, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 70) [(13, 2), (15, 2), (16, 1)],
  term ((603 : Rat) / 140) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0402
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0403 : Poly :=
[
  term ((5265668 : Rat) / 53375) [(13, 2)]
]

/-- Partial product 403 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0403 : Poly :=
[
  term ((10531336 : Rat) / 53375) [(12, 1), (13, 2), (14, 1)],
  term ((-5265668 : Rat) / 53375) [(12, 2), (13, 2)],
  term ((5265668 : Rat) / 53375) [(13, 2)],
  term ((-10531336 : Rat) / 53375) [(13, 2), (14, 1)],
  term ((10531336 : Rat) / 53375) [(13, 3), (15, 1)],
  term ((-5265668 : Rat) / 53375) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0403
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0404 : Poly :=
[
  term ((-4224 : Rat) / 35) [(13, 2), (14, 1)]
]

/-- Partial product 404 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0404 : Poly :=
[
  term ((-8448 : Rat) / 35) [(12, 1), (13, 2), (14, 2)],
  term ((4224 : Rat) / 35) [(12, 2), (13, 2), (14, 1)],
  term ((-4224 : Rat) / 35) [(13, 2), (14, 1)],
  term ((8448 : Rat) / 35) [(13, 2), (14, 2)],
  term ((-8448 : Rat) / 35) [(13, 3), (14, 1), (15, 1)],
  term ((4224 : Rat) / 35) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0404
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0405 : Poly :=
[
  term ((1408 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 405 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0405 : Poly :=
[
  term ((2816 : Rat) / 35) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1408 : Rat) / 35) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(13, 2), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(13, 2), (14, 2), (16, 1)],
  term ((2816 : Rat) / 35) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0405
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0406 : Poly :=
[
  term ((-1144 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 406 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0406 : Poly :=
[
  term ((-2288 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(12, 2), (13, 2), (16, 1)],
  term ((2288 : Rat) / 35) [(13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(13, 2), (16, 1)],
  term ((-2288 : Rat) / 35) [(13, 3), (15, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0406
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0407 : Poly :=
[
  term ((414 : Rat) / 5) [(14, 1)]
]

/-- Partial product 407 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0407 : Poly :=
[
  term ((828 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-414 : Rat) / 5) [(12, 2), (14, 1)],
  term ((828 : Rat) / 5) [(13, 1), (14, 1), (15, 1)],
  term ((-414 : Rat) / 5) [(13, 2), (14, 1)],
  term ((414 : Rat) / 5) [(14, 1)],
  term ((-828 : Rat) / 5) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0407
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0408 : Poly :=
[
  term ((6 : Rat) / 5) [(15, 2)]
]

/-- Partial product 408 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0408 : Poly :=
[
  term ((12 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(12, 2), (15, 2)],
  term ((12 : Rat) / 5) [(13, 1), (15, 3)],
  term ((-6 : Rat) / 5) [(13, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(14, 1), (15, 2)],
  term ((6 : Rat) / 5) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0408
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003YY_coefficient_30_0409 : Poly :=
[
  term ((-9 : Rat) / 5) [(16, 1)]
]

/-- Partial product 409 for generator 30. -/
def rs_R003_ueqv_R003YY_partial_30_0409 : Poly :=
[
  term ((-18 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((9 : Rat) / 5) [(12, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(13, 2), (16, 1)],
  term ((18 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 30. -/
theorem rs_R003_ueqv_R003YY_partial_30_0409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_30_0409
        rs_R003_ueqv_R003YY_generator_30_0400_0409 =
      rs_R003_ueqv_R003YY_partial_30_0409 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_30_0400_0409 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_30_0400,
  rs_R003_ueqv_R003YY_partial_30_0401,
  rs_R003_ueqv_R003YY_partial_30_0402,
  rs_R003_ueqv_R003YY_partial_30_0403,
  rs_R003_ueqv_R003YY_partial_30_0404,
  rs_R003_ueqv_R003YY_partial_30_0405,
  rs_R003_ueqv_R003YY_partial_30_0406,
  rs_R003_ueqv_R003YY_partial_30_0407,
  rs_R003_ueqv_R003YY_partial_30_0408,
  rs_R003_ueqv_R003YY_partial_30_0409
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_30_0400_0409 : Poly :=
[
  term ((12762389 : Rat) / 320250) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-603 : Rat) / 70) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10531336 : Rat) / 53375) [(12, 1), (13, 2), (14, 1)],
  term ((-2288 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-8448 : Rat) / 35) [(12, 1), (13, 2), (14, 2)],
  term ((2816 : Rat) / 35) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(12, 1), (13, 2), (16, 1)],
  term ((12 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((-42 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((828 : Rat) / 5) [(12, 1), (14, 2)],
  term ((12 : Rat) / 5) [(12, 1), (16, 1)],
  term ((-12762389 : Rat) / 640500) [(12, 2), (13, 1), (15, 1)],
  term ((603 : Rat) / 140) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5265668 : Rat) / 53375) [(12, 2), (13, 2)],
  term ((4224 : Rat) / 35) [(12, 2), (13, 2), (14, 1)],
  term ((-1408 : Rat) / 35) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(12, 2), (13, 2), (16, 1)],
  term ((-414 : Rat) / 5) [(12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(12, 2), (14, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(12, 2), (15, 2)],
  term ((9 : Rat) / 5) [(12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(12, 3), (16, 1)],
  term ((40271011 : Rat) / 320250) [(13, 1), (14, 1), (15, 1)],
  term ((603 : Rat) / 70) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12762389 : Rat) / 640500) [(13, 1), (15, 1)],
  term ((-1107 : Rat) / 140) [(13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(13, 1), (15, 3)],
  term ((5265668 : Rat) / 53375) [(13, 2)],
  term ((-21392386 : Rat) / 53375) [(13, 2), (14, 1)],
  term ((528 : Rat) / 5) [(13, 2), (14, 1), (16, 1)],
  term ((8448 : Rat) / 35) [(13, 2), (14, 2)],
  term ((-2816 : Rat) / 35) [(13, 2), (14, 2), (16, 1)],
  term ((12378089 : Rat) / 320250) [(13, 2), (15, 2)],
  term ((-603 : Rat) / 70) [(13, 2), (15, 2), (16, 1)],
  term ((-1081 : Rat) / 35) [(13, 2), (16, 1)],
  term ((-8448 : Rat) / 35) [(13, 3), (14, 1), (15, 1)],
  term ((2816 : Rat) / 35) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((113613643 : Rat) / 640500) [(13, 3), (15, 1)],
  term ((-8549 : Rat) / 140) [(13, 3), (15, 1), (16, 1)],
  term ((-5265668 : Rat) / 53375) [(13, 4)],
  term ((4224 : Rat) / 35) [(13, 4), (14, 1)],
  term ((-1408 : Rat) / 35) [(13, 4), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(13, 4), (16, 1)],
  term ((414 : Rat) / 5) [(14, 1)],
  term ((-12 : Rat) / 5) [(14, 1), (15, 2)],
  term ((18 : Rat) / 5) [(14, 1), (16, 1)],
  term ((-828 : Rat) / 5) [(14, 2)],
  term ((6 : Rat) / 5) [(15, 2)],
  term ((-9 : Rat) / 5) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 400 through 409. -/
theorem rs_R003_ueqv_R003YY_block_30_0400_0409_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_30_0400_0409
      rs_R003_ueqv_R003YY_block_30_0400_0409 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
