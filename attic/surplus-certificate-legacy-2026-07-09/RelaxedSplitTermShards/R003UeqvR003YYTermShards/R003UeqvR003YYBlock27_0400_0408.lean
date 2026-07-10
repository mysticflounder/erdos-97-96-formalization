/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 27:400-408

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_27_0400_0408 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0400 : Poly :=
[
  term ((-12762389 : Rat) / 640500) [(13, 1), (15, 1)]
]

/-- Partial product 400 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0400 : Poly :=
[
  term ((12762389 : Rat) / 320250) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12762389 : Rat) / 640500) [(0, 2), (13, 1), (15, 1)],
  term ((12762389 : Rat) / 320250) [(1, 1), (13, 2), (15, 1)],
  term ((-12762389 : Rat) / 640500) [(1, 2), (13, 1), (15, 1)],
  term ((-12762389 : Rat) / 320250) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((12762389 : Rat) / 640500) [(13, 1), (14, 2), (15, 1)],
  term ((12762389 : Rat) / 640500) [(13, 1), (15, 3)],
  term ((-12762389 : Rat) / 320250) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0400
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0401 : Poly :=
[
  term ((603 : Rat) / 140) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0401 : Poly :=
[
  term ((-603 : Rat) / 70) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 140) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 70) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((603 : Rat) / 140) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 70) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-603 : Rat) / 140) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-603 : Rat) / 140) [(13, 1), (15, 3), (16, 1)],
  term ((603 : Rat) / 70) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0401
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0402 : Poly :=
[
  term ((-1045876 : Rat) / 10675) [(13, 2)]
]

/-- Partial product 402 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0402 : Poly :=
[
  term ((2091752 : Rat) / 10675) [(0, 1), (12, 1), (13, 2)],
  term ((-1045876 : Rat) / 10675) [(0, 2), (13, 2)],
  term ((2091752 : Rat) / 10675) [(1, 1), (13, 3)],
  term ((-1045876 : Rat) / 10675) [(1, 2), (13, 2)],
  term ((-2091752 : Rat) / 10675) [(12, 1), (13, 2), (14, 1)],
  term ((1045876 : Rat) / 10675) [(13, 2), (14, 2)],
  term ((1045876 : Rat) / 10675) [(13, 2), (15, 2)],
  term ((-2091752 : Rat) / 10675) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0402
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0403 : Poly :=
[
  term ((4224 : Rat) / 35) [(13, 2), (14, 1)]
]

/-- Partial product 403 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0403 : Poly :=
[
  term ((-8448 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((4224 : Rat) / 35) [(0, 2), (13, 2), (14, 1)],
  term ((-8448 : Rat) / 35) [(1, 1), (13, 3), (14, 1)],
  term ((4224 : Rat) / 35) [(1, 2), (13, 2), (14, 1)],
  term ((8448 : Rat) / 35) [(12, 1), (13, 2), (14, 2)],
  term ((-4224 : Rat) / 35) [(13, 2), (14, 1), (15, 2)],
  term ((-4224 : Rat) / 35) [(13, 2), (14, 3)],
  term ((8448 : Rat) / 35) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0403
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0404 : Poly :=
[
  term ((-1408 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 404 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0404 : Poly :=
[
  term ((2816 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1408 : Rat) / 35) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1408 : Rat) / 35) [(13, 2), (14, 3), (16, 1)],
  term ((-2816 : Rat) / 35) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0404
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0405 : Poly :=
[
  term ((1144 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 405 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0405 : Poly :=
[
  term ((-2288 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((1144 : Rat) / 35) [(0, 2), (13, 2), (16, 1)],
  term ((-2288 : Rat) / 35) [(1, 1), (13, 3), (16, 1)],
  term ((1144 : Rat) / 35) [(1, 2), (13, 2), (16, 1)],
  term ((2288 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(13, 2), (14, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(13, 2), (15, 2), (16, 1)],
  term ((2288 : Rat) / 35) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0405
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0406 : Poly :=
[
  term ((-417 : Rat) / 5) [(14, 1)]
]

/-- Partial product 406 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0406 : Poly :=
[
  term ((834 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((-417 : Rat) / 5) [(0, 2), (14, 1)],
  term ((834 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((-417 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-834 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-834 : Rat) / 5) [(13, 1), (14, 1), (15, 1)],
  term ((417 : Rat) / 5) [(14, 1), (15, 2)],
  term ((417 : Rat) / 5) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0406
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0407 : Poly :=
[
  term ((-6 : Rat) / 5) [(15, 2)]
]

/-- Partial product 407 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0407 : Poly :=
[
  term ((12 : Rat) / 5) [(0, 1), (12, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(0, 2), (15, 2)],
  term ((12 : Rat) / 5) [(1, 1), (13, 1), (15, 2)],
  term ((-6 : Rat) / 5) [(1, 2), (15, 2)],
  term ((-12 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(13, 1), (15, 3)],
  term ((6 : Rat) / 5) [(14, 2), (15, 2)],
  term ((6 : Rat) / 5) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0407
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 27. -/
def rs_R003_ueqv_R003YY_coefficient_27_0408 : Poly :=
[
  term ((9 : Rat) / 5) [(16, 1)]
]

/-- Partial product 408 for generator 27. -/
def rs_R003_ueqv_R003YY_partial_27_0408 : Poly :=
[
  term ((-18 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((9 : Rat) / 5) [(0, 2), (16, 1)],
  term ((-18 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 5) [(1, 2), (16, 1)],
  term ((18 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((18 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(14, 2), (16, 1)],
  term ((-9 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 27. -/
theorem rs_R003_ueqv_R003YY_partial_27_0408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_27_0408
        rs_R003_ueqv_R003YY_generator_27_0400_0408 =
      rs_R003_ueqv_R003YY_partial_27_0408 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_27_0400_0408 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_27_0400,
  rs_R003_ueqv_R003YY_partial_27_0401,
  rs_R003_ueqv_R003YY_partial_27_0402,
  rs_R003_ueqv_R003YY_partial_27_0403,
  rs_R003_ueqv_R003YY_partial_27_0404,
  rs_R003_ueqv_R003YY_partial_27_0405,
  rs_R003_ueqv_R003YY_partial_27_0406,
  rs_R003_ueqv_R003YY_partial_27_0407,
  rs_R003_ueqv_R003YY_partial_27_0408
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_27_0400_0408 : Poly :=
[
  term ((12762389 : Rat) / 320250) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-603 : Rat) / 70) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2091752 : Rat) / 10675) [(0, 1), (12, 1), (13, 2)],
  term ((-8448 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((2816 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((834 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 1), (12, 1), (15, 2)],
  term ((-18 : Rat) / 5) [(0, 1), (12, 1), (16, 1)],
  term ((-12762389 : Rat) / 640500) [(0, 2), (13, 1), (15, 1)],
  term ((603 : Rat) / 140) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1045876 : Rat) / 10675) [(0, 2), (13, 2)],
  term ((4224 : Rat) / 35) [(0, 2), (13, 2), (14, 1)],
  term ((-1408 : Rat) / 35) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(0, 2), (13, 2), (16, 1)],
  term ((-417 : Rat) / 5) [(0, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(0, 2), (15, 2)],
  term ((9 : Rat) / 5) [(0, 2), (16, 1)],
  term ((834 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(1, 1), (13, 1), (15, 2)],
  term ((-18 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((12762389 : Rat) / 320250) [(1, 1), (13, 2), (15, 1)],
  term ((-603 : Rat) / 70) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((2091752 : Rat) / 10675) [(1, 1), (13, 3)],
  term ((-8448 : Rat) / 35) [(1, 1), (13, 3), (14, 1)],
  term ((2816 : Rat) / 35) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(1, 1), (13, 3), (16, 1)],
  term ((-12762389 : Rat) / 640500) [(1, 2), (13, 1), (15, 1)],
  term ((603 : Rat) / 140) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1045876 : Rat) / 10675) [(1, 2), (13, 2)],
  term ((4224 : Rat) / 35) [(1, 2), (13, 2), (14, 1)],
  term ((-1408 : Rat) / 35) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(1, 2), (13, 2), (16, 1)],
  term ((-417 : Rat) / 5) [(1, 2), (14, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (15, 2)],
  term ((9 : Rat) / 5) [(1, 2), (16, 1)],
  term ((-12762389 : Rat) / 320250) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((603 : Rat) / 70) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2091752 : Rat) / 10675) [(12, 1), (13, 2), (14, 1)],
  term ((2288 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((8448 : Rat) / 35) [(12, 1), (13, 2), (14, 2)],
  term ((-2816 : Rat) / 35) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(12, 1), (14, 1), (15, 2)],
  term ((18 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((-834 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-834 : Rat) / 5) [(13, 1), (14, 1), (15, 1)],
  term ((12762389 : Rat) / 640500) [(13, 1), (14, 2), (15, 1)],
  term ((-603 : Rat) / 140) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((11225189 : Rat) / 640500) [(13, 1), (15, 3)],
  term ((-603 : Rat) / 140) [(13, 1), (15, 3), (16, 1)],
  term ((-4224 : Rat) / 35) [(13, 2), (14, 1), (15, 2)],
  term ((1408 : Rat) / 35) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1045876 : Rat) / 10675) [(13, 2), (14, 2)],
  term ((-1144 : Rat) / 35) [(13, 2), (14, 2), (16, 1)],
  term ((-4224 : Rat) / 35) [(13, 2), (14, 3)],
  term ((1408 : Rat) / 35) [(13, 2), (14, 3), (16, 1)],
  term ((18613891 : Rat) / 320250) [(13, 2), (15, 2)],
  term ((-337 : Rat) / 14) [(13, 2), (15, 2), (16, 1)],
  term ((8448 : Rat) / 35) [(13, 3), (14, 1), (15, 1)],
  term ((-2816 : Rat) / 35) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2091752 : Rat) / 10675) [(13, 3), (15, 1)],
  term ((2288 : Rat) / 35) [(13, 3), (15, 1), (16, 1)],
  term ((417 : Rat) / 5) [(14, 1), (15, 2)],
  term ((6 : Rat) / 5) [(14, 2), (15, 2)],
  term ((-9 : Rat) / 5) [(14, 2), (16, 1)],
  term ((417 : Rat) / 5) [(14, 3)],
  term ((-9 : Rat) / 5) [(15, 2), (16, 1)],
  term ((6 : Rat) / 5) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 400 through 408. -/
theorem rs_R003_ueqv_R003YY_block_27_0400_0408_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_27_0400_0408
      rs_R003_ueqv_R003YY_block_27_0400_0408 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
