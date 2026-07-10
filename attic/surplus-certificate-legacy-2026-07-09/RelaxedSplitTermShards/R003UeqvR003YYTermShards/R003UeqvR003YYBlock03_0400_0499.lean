/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 3:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_03_0400_0499 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0400 : Poly :=
[
  term ((-27648 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 400 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0400 : Poly :=
[
  term ((-27648 : Rat) / 10675) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1)],
  term ((-55296 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((27648 : Rat) / 10675) [(4, 1), (8, 2), (9, 1), (11, 2), (13, 1)],
  term ((27648 : Rat) / 10675) [(4, 1), (9, 3), (11, 2), (13, 1)],
  term ((55296 : Rat) / 10675) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-27648 : Rat) / 10675) [(4, 3), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0400
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0401 : Poly :=
[
  term ((21312 : Rat) / 2135) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 401 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0401 : Poly :=
[
  term ((21312 : Rat) / 2135) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((42624 : Rat) / 2135) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-21312 : Rat) / 2135) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-21312 : Rat) / 2135) [(4, 1), (9, 3), (12, 1), (13, 1)],
  term ((-42624 : Rat) / 2135) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((21312 : Rat) / 2135) [(4, 3), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0401
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0402 : Poly :=
[
  term ((-37176 : Rat) / 53375) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 402 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0402 : Poly :=
[
  term ((-37176 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-74352 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((37176 : Rat) / 53375) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((37176 : Rat) / 53375) [(4, 1), (9, 3), (13, 1)],
  term ((74352 : Rat) / 53375) [(4, 2), (9, 1), (13, 1)],
  term ((-37176 : Rat) / 53375) [(4, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0402
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0403 : Poly :=
[
  term ((232128 : Rat) / 10675) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 403 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0403 : Poly :=
[
  term ((232128 : Rat) / 10675) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1)],
  term ((464256 : Rat) / 10675) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (8, 2), (9, 2), (11, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (9, 4), (11, 1), (13, 1)],
  term ((-464256 : Rat) / 10675) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 3), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0403
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0404 : Poly :=
[
  term ((-5568 : Rat) / 1525) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 404 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0404 : Poly :=
[
  term ((-5568 : Rat) / 1525) [(4, 1), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-11136 : Rat) / 1525) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((5568 : Rat) / 1525) [(4, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((5568 : Rat) / 1525) [(4, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((11136 : Rat) / 1525) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-5568 : Rat) / 1525) [(4, 3), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0404
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0405 : Poly :=
[
  term ((14496 : Rat) / 2135) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 405 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0405 : Poly :=
[
  term ((14496 : Rat) / 2135) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((28992 : Rat) / 2135) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-14496 : Rat) / 2135) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-14496 : Rat) / 2135) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-28992 : Rat) / 2135) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((14496 : Rat) / 2135) [(4, 3), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0405
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0406 : Poly :=
[
  term ((-145608 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 406 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0406 : Poly :=
[
  term ((-145608 : Rat) / 53375) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term ((-291216 : Rat) / 53375) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((145608 : Rat) / 53375) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((145608 : Rat) / 53375) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((291216 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((-145608 : Rat) / 53375) [(4, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0406
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0407 : Poly :=
[
  term ((212784 : Rat) / 53375) [(4, 1), (13, 2)]
]

/-- Partial product 407 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0407 : Poly :=
[
  term ((212784 : Rat) / 53375) [(4, 1), (5, 2), (13, 2)],
  term ((425568 : Rat) / 53375) [(4, 1), (8, 1), (13, 2)],
  term ((-212784 : Rat) / 53375) [(4, 1), (8, 2), (13, 2)],
  term ((-212784 : Rat) / 53375) [(4, 1), (9, 2), (13, 2)],
  term ((-425568 : Rat) / 53375) [(4, 2), (13, 2)],
  term ((212784 : Rat) / 53375) [(4, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0407
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0408 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (14, 1)]
]

/-- Partial product 408 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0408 : Poly :=
[
  term ((12 : Rat) / 5) [(4, 1), (5, 2), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (8, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (8, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (14, 1)],
  term ((12 : Rat) / 5) [(4, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0408
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0409 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 409 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0409 : Poly :=
[
  term ((-55296 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 3), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 3), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 4), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0409
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0410 : Poly :=
[
  term ((-221184 : Rat) / 7625) [(4, 2), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 410 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0410 : Poly :=
[
  term ((-221184 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (11, 1), (13, 2)],
  term ((-442368 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (11, 1), (13, 2)],
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (11, 1), (13, 2)],
  term ((442368 : Rat) / 7625) [(4, 3), (7, 1), (11, 1), (13, 2)],
  term ((-221184 : Rat) / 7625) [(4, 4), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0410_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0410
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0411 : Poly :=
[
  term ((156672 : Rat) / 7625) [(4, 2), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 411 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0411 : Poly :=
[
  term ((156672 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (12, 1), (13, 1)],
  term ((313344 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-313344 : Rat) / 7625) [(4, 3), (7, 1), (12, 1), (13, 1)],
  term ((156672 : Rat) / 7625) [(4, 4), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0411_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0411
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0412 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 2), (7, 1), (13, 1)]
]

/-- Partial product 412 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0412 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 3), (7, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 4), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0412_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0412
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0413 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 413 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0413 : Poly :=
[
  term ((110592 : Rat) / 7625) [(4, 2), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 3), (7, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 4), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0413_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0413
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0414 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 414 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0414 : Poly :=
[
  term ((-13824 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (10, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 3), (10, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 3), (9, 1), (10, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 4), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0414_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0414
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0415 : Poly :=
[
  term ((55296 : Rat) / 1525) [(4, 2), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 415 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0415 : Poly :=
[
  term ((55296 : Rat) / 1525) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 2)],
  term ((110592 : Rat) / 1525) [(4, 2), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 1525) [(4, 2), (8, 2), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 1525) [(4, 2), (9, 3), (11, 1), (13, 2)],
  term ((-110592 : Rat) / 1525) [(4, 3), (9, 1), (11, 1), (13, 2)],
  term ((55296 : Rat) / 1525) [(4, 4), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0415_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0415
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0416 : Poly :=
[
  term ((-129024 : Rat) / 7625) [(4, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 416 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0416 : Poly :=
[
  term ((-129024 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-258048 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((129024 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((129024 : Rat) / 7625) [(4, 2), (9, 3), (12, 1), (13, 1)],
  term ((258048 : Rat) / 7625) [(4, 3), (9, 1), (12, 1), (13, 1)],
  term ((-129024 : Rat) / 7625) [(4, 4), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0416_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0416
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0417 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 2), (9, 1), (13, 1)]
]

/-- Partial product 417 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0417 : Poly :=
[
  term ((20736 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (9, 3), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 3), (9, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 4), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0417_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0417
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0418 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 418 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0418 : Poly :=
[
  term ((-165888 : Rat) / 7625) [(4, 2), (5, 2), (9, 2), (11, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(4, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (8, 2), (9, 2), (11, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (9, 4), (11, 1), (13, 1)],
  term ((331776 : Rat) / 7625) [(4, 3), (9, 2), (11, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 4), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0418_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0418
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0419 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 419 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0419 : Poly :=
[
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 3), (10, 1), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 4), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0419_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0419
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0420 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 420 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0420 : Poly :=
[
  term ((-27648 : Rat) / 7625) [(4, 2), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 3), (11, 1), (12, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 4), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0420_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0420
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0421 : Poly :=
[
  term ((-131328 : Rat) / 7625) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 421 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0421 : Poly :=
[
  term ((-131328 : Rat) / 7625) [(4, 2), (5, 2), (11, 1), (13, 1)],
  term ((-262656 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((131328 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (13, 1)],
  term ((131328 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((262656 : Rat) / 7625) [(4, 3), (11, 1), (13, 1)],
  term ((-131328 : Rat) / 7625) [(4, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0421_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0421
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0422 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (13, 2)]
]

/-- Partial product 422 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0422 : Poly :=
[
  term ((13824 : Rat) / 7625) [(4, 2), (5, 2), (13, 2)],
  term ((27648 : Rat) / 7625) [(4, 2), (8, 1), (13, 2)],
  term ((-13824 : Rat) / 7625) [(4, 2), (8, 2), (13, 2)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 2), (13, 2)],
  term ((-27648 : Rat) / 7625) [(4, 3), (13, 2)],
  term ((13824 : Rat) / 7625) [(4, 4), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0422_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0422
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0423 : Poly :=
[
  term ((-36 : Rat) / 5) [(5, 1), (7, 1)]
]

/-- Partial product 423 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0423 : Poly :=
[
  term ((72 : Rat) / 5) [(4, 1), (5, 1), (7, 1)],
  term ((-36 : Rat) / 5) [(4, 2), (5, 1), (7, 1)],
  term ((-72 : Rat) / 5) [(5, 1), (7, 1), (8, 1)],
  term ((36 : Rat) / 5) [(5, 1), (7, 1), (8, 2)],
  term ((36 : Rat) / 5) [(5, 1), (7, 1), (9, 2)],
  term ((-36 : Rat) / 5) [(5, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0423_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0423
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0424 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1)]
]

/-- Partial product 424 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0424 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0424_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0424
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0425 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 425 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0425 : Poly :=
[
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 3), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0425_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0425
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0426 : Poly :=
[
  term ((36 : Rat) / 5) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 426 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0426 : Poly :=
[
  term ((-72 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1)],
  term ((36 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (14, 1)],
  term ((72 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term ((-36 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (14, 1)],
  term ((-36 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (14, 1)],
  term ((36 : Rat) / 5) [(5, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0426_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0426
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0427 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (9, 1)]
]

/-- Partial product 427 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0427 : Poly :=
[
  term ((-24 : Rat) / 5) [(4, 1), (5, 1), (9, 1)],
  term ((12 : Rat) / 5) [(4, 2), (5, 1), (9, 1)],
  term ((24 : Rat) / 5) [(5, 1), (8, 1), (9, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (8, 2), (9, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (9, 3)],
  term ((12 : Rat) / 5) [(5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0427_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0427
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0428 : Poly :=
[
  term ((5472 : Rat) / 7625) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 428 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0428 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (9, 3), (11, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 3), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0428_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0428
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0429 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 429 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0429 : Poly :=
[
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (9, 1), (12, 1)],
  term ((48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (8, 2), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (9, 3), (12, 1)],
  term ((24 : Rat) / 5) [(5, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0429_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0429
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0430 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 430 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0430 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (8, 2), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (9, 3), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0430_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0430
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0431 : Poly :=
[
  term ((32832 : Rat) / 7625) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 431 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0431 : Poly :=
[
  term ((-65664 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)],
  term ((32832 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (13, 2)],
  term ((65664 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((-32832 : Rat) / 7625) [(5, 1), (8, 2), (9, 1), (13, 2)],
  term ((-32832 : Rat) / 7625) [(5, 1), (9, 3), (13, 2)],
  term ((32832 : Rat) / 7625) [(5, 3), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0431_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0431
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0432 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 432 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0432 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((12 : Rat) / 5) [(5, 1), (8, 2), (9, 1), (14, 1)],
  term ((12 : Rat) / 5) [(5, 1), (9, 3), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0432_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0432
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0433 : Poly :=
[
  term ((-47424 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 433 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0433 : Poly :=
[
  term ((94848 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((-47424 : Rat) / 7625) [(4, 2), (5, 1), (9, 2), (13, 1)],
  term ((-94848 : Rat) / 7625) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((47424 : Rat) / 7625) [(5, 1), (8, 2), (9, 2), (13, 1)],
  term ((47424 : Rat) / 7625) [(5, 1), (9, 4), (13, 1)],
  term ((-47424 : Rat) / 7625) [(5, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0433_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0433
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0434 : Poly :=
[
  term ((5472 : Rat) / 7625) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 434 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0434 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (9, 2), (10, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0434_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0434
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0435 : Poly :=
[
  term ((-35328 : Rat) / 7625) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 435 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0435 : Poly :=
[
  term ((70656 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-35328 : Rat) / 7625) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((-70656 : Rat) / 7625) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((35328 : Rat) / 7625) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((35328 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-35328 : Rat) / 7625) [(5, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0435_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0435
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0436 : Poly :=
[
  term ((-17808 : Rat) / 7625) [(5, 1), (13, 1)]
]

/-- Partial product 436 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0436 : Poly :=
[
  term ((35616 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)],
  term ((-17808 : Rat) / 7625) [(4, 2), (5, 1), (13, 1)],
  term ((-35616 : Rat) / 7625) [(5, 1), (8, 1), (13, 1)],
  term ((17808 : Rat) / 7625) [(5, 1), (8, 2), (13, 1)],
  term ((17808 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)],
  term ((-17808 : Rat) / 7625) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0436_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0436
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0437 : Poly :=
[
  term ((18 : Rat) / 5) [(7, 1), (9, 1)]
]

/-- Partial product 437 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0437 : Poly :=
[
  term ((-36 : Rat) / 5) [(4, 1), (7, 1), (9, 1)],
  term ((18 : Rat) / 5) [(4, 2), (7, 1), (9, 1)],
  term ((18 : Rat) / 5) [(5, 2), (7, 1), (9, 1)],
  term ((36 : Rat) / 5) [(7, 1), (8, 1), (9, 1)],
  term ((-18 : Rat) / 5) [(7, 1), (8, 2), (9, 1)],
  term ((-18 : Rat) / 5) [(7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0437_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0437
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0438 : Poly :=
[
  term ((9533632 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 438 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0438 : Poly :=
[
  term ((-19067264 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((9533632 : Rat) / 53375) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((9533632 : Rat) / 53375) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((19067264 : Rat) / 53375) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-9533632 : Rat) / 53375) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-9533632 : Rat) / 53375) [(7, 1), (9, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0438_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0438
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0439 : Poly :=
[
  term ((-1536 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 439 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0439 : Poly :=
[
  term ((3072 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 7) [(7, 1), (9, 3), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0439_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0439
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0440 : Poly :=
[
  term ((512 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 440 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0440 : Poly :=
[
  term ((-1024 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-512 : Rat) / 7) [(7, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0440_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0440
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0441 : Poly :=
[
  term ((-416 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 441 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0441 : Poly :=
[
  term ((832 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 7) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((416 : Rat) / 7) [(7, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0441_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0441
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0442 : Poly :=
[
  term ((12787 : Rat) / 105) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 442 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0442 : Poly :=
[
  term ((-25574 : Rat) / 105) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((12787 : Rat) / 105) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((12787 : Rat) / 105) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12787 : Rat) / 105) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-12787 : Rat) / 105) [(7, 1), (9, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0442_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0442
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0443 : Poly :=
[
  term ((-521 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0443 : Poly :=
[
  term ((1042 : Rat) / 35) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-521 : Rat) / 35) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-521 : Rat) / 35) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((521 : Rat) / 35) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((521 : Rat) / 35) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0443_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0443
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0444 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 444 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0444 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0444_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0444
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0445 : Poly :=
[
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 445 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0445 : Poly :=
[
  term ((-12 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((6 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((6 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((12 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0445_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0445
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0446 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 446 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0446 : Poly :=
[
  term ((10944 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((-10944 : Rat) / 7625) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(7, 1), (9, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0446_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0446
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0447 : Poly :=
[
  term ((81 : Rat) / 10) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 447 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0447 : Poly :=
[
  term ((-81 : Rat) / 5) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((81 : Rat) / 10) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((81 : Rat) / 10) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((81 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-81 : Rat) / 10) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-81 : Rat) / 10) [(7, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0447_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0447
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0448 : Poly :=
[
  term ((-9 : Rat) / 10) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0448 : Poly :=
[
  term ((9 : Rat) / 5) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 10) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0448_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0448
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0449 : Poly :=
[
  term ((51148 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 449 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0449 : Poly :=
[
  term ((-102296 : Rat) / 105) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((51148 : Rat) / 105) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((102296 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-51148 : Rat) / 105) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-51148 : Rat) / 105) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0449_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0449
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0450 : Poly :=
[
  term ((-2084 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0450 : Poly :=
[
  term ((4168 : Rat) / 35) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2084 : Rat) / 35) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4168 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2084 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2084 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0450_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0450
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0451 : Poly :=
[
  term ((38134528 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)]
]

/-- Partial product 451 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0451 : Poly :=
[
  term ((-76269056 : Rat) / 53375) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((38134528 : Rat) / 53375) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((38134528 : Rat) / 53375) [(5, 2), (7, 1), (11, 1), (13, 2)],
  term ((76269056 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-38134528 : Rat) / 53375) [(7, 1), (8, 2), (11, 1), (13, 2)],
  term ((-38134528 : Rat) / 53375) [(7, 1), (9, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0451_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0451
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0452 : Poly :=
[
  term ((-6144 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 452 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0452 : Poly :=
[
  term ((12288 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 7) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0452_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0452
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0453 : Poly :=
[
  term ((2048 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 453 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0453 : Poly :=
[
  term ((-4096 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2048 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((4096 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 7) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0453_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0453
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0454 : Poly :=
[
  term ((-1664 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 454 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0454 : Poly :=
[
  term ((3328 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1664 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1664 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3328 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((1664 : Rat) / 7) [(7, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((1664 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0454_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0454
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0455 : Poly :=
[
  term ((-2091752 : Rat) / 10675) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 455 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0455 : Poly :=
[
  term ((4183504 : Rat) / 10675) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-2091752 : Rat) / 10675) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-2091752 : Rat) / 10675) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-4183504 : Rat) / 10675) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((2091752 : Rat) / 10675) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((2091752 : Rat) / 10675) [(7, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0455_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0455
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0456 : Poly :=
[
  term ((8448 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 456 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0456 : Poly :=
[
  term ((-16896 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((8448 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((8448 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((16896 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8448 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-8448 : Rat) / 35) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0456_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0456
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0457 : Poly :=
[
  term ((-2816 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 457 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0457 : Poly :=
[
  term ((5632 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5632 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2816 : Rat) / 35) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0457_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0457
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0458 : Poly :=
[
  term ((2288 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 458 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0458 : Poly :=
[
  term ((-4576 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((4576 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0458_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0458
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0459 : Poly :=
[
  term ((-12067 : Rat) / 1050) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 459 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0459 : Poly :=
[
  term ((12067 : Rat) / 525) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-12067 : Rat) / 1050) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-12067 : Rat) / 1050) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-12067 : Rat) / 525) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((12067 : Rat) / 1050) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((12067 : Rat) / 1050) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0459_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0459
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0460 : Poly :=
[
  term ((477 : Rat) / 70) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0460 : Poly :=
[
  term ((-477 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((477 : Rat) / 70) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((477 : Rat) / 70) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((477 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-477 : Rat) / 70) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-477 : Rat) / 70) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0460_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0460
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0461 : Poly :=
[
  term ((-165716 : Rat) / 7625) [(7, 1), (13, 1)]
]

/-- Partial product 461 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0461 : Poly :=
[
  term ((331432 : Rat) / 7625) [(4, 1), (7, 1), (13, 1)],
  term ((-165716 : Rat) / 7625) [(4, 2), (7, 1), (13, 1)],
  term ((-165716 : Rat) / 7625) [(5, 2), (7, 1), (13, 1)],
  term ((-331432 : Rat) / 7625) [(7, 1), (8, 1), (13, 1)],
  term ((165716 : Rat) / 7625) [(7, 1), (8, 2), (13, 1)],
  term ((165716 : Rat) / 7625) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0461_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0461
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0462 : Poly :=
[
  term ((216 : Rat) / 5) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 462 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0462 : Poly :=
[
  term ((-432 : Rat) / 5) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((216 : Rat) / 5) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((216 : Rat) / 5) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((432 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0462_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0462
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0463 : Poly :=
[
  term ((-64 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 463 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0463 : Poly :=
[
  term ((128 : Rat) / 5) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0463_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0463
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0464 : Poly :=
[
  term ((76 : Rat) / 5) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 464 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0464 : Poly :=
[
  term ((-152 : Rat) / 5) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 5) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((76 : Rat) / 5) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((152 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-76 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-76 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0464_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0464
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0465 : Poly :=
[
  term ((-1603 : Rat) / 120) [(7, 1), (15, 1)]
]

/-- Partial product 465 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0465 : Poly :=
[
  term ((1603 : Rat) / 60) [(4, 1), (7, 1), (15, 1)],
  term ((-1603 : Rat) / 120) [(4, 2), (7, 1), (15, 1)],
  term ((-1603 : Rat) / 120) [(5, 2), (7, 1), (15, 1)],
  term ((-1603 : Rat) / 60) [(7, 1), (8, 1), (15, 1)],
  term ((1603 : Rat) / 120) [(7, 1), (8, 2), (15, 1)],
  term ((1603 : Rat) / 120) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0465_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0465
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0466 : Poly :=
[
  term ((57 : Rat) / 40) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0466 : Poly :=
[
  term ((-57 : Rat) / 20) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 40) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 40) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 20) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 40) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-57 : Rat) / 40) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0466_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0466
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0467 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 2)]
]

/-- Partial product 467 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0467 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (7, 2)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 2)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 2)],
  term ((-24 : Rat) / 5) [(7, 2), (8, 1)],
  term ((12 : Rat) / 5) [(7, 2), (8, 2)],
  term ((12 : Rat) / 5) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0467_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0467
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0468 : Poly :=
[
  term ((-19067264 : Rat) / 53375) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 468 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0468 : Poly :=
[
  term ((38134528 : Rat) / 53375) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-38134528 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((19067264 : Rat) / 53375) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((19067264 : Rat) / 53375) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0468_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0468
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0469 : Poly :=
[
  term ((3072 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 469 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0469 : Poly :=
[
  term ((-6144 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((6144 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0469_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0469
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0470 : Poly :=
[
  term ((-1024 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 470 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0470 : Poly :=
[
  term ((2048 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0470_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0470
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0471 : Poly :=
[
  term ((832 : Rat) / 7) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 471 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0471 : Poly :=
[
  term ((-1664 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((832 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0471_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0471
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0472 : Poly :=
[
  term ((-25574 : Rat) / 105) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 472 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0472 : Poly :=
[
  term ((51148 : Rat) / 105) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-25574 : Rat) / 105) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((-25574 : Rat) / 105) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((-51148 : Rat) / 105) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(7, 2), (8, 2), (11, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(7, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0472_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0472
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0473 : Poly :=
[
  term ((1042 : Rat) / 35) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0473 : Poly :=
[
  term ((-2084 : Rat) / 35) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1042 : Rat) / 35) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((2084 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0473_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0473
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0474 : Poly :=
[
  term ((-24 : Rat) / 5) [(7, 2), (14, 1)]
]

/-- Partial product 474 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0474 : Poly :=
[
  term ((48 : Rat) / 5) [(4, 1), (7, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (7, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (7, 2), (14, 1)],
  term ((-48 : Rat) / 5) [(7, 2), (8, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 2), (8, 2), (14, 1)],
  term ((24 : Rat) / 5) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0474_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0474
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0475 : Poly :=
[
  term ((-12 : Rat) / 5) [(7, 2), (16, 1)]
]

/-- Partial product 475 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0475 : Poly :=
[
  term ((24 : Rat) / 5) [(4, 1), (7, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (8, 1), (16, 1)],
  term ((12 : Rat) / 5) [(7, 2), (8, 2), (16, 1)],
  term ((12 : Rat) / 5) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0475_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0475
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0476 : Poly :=
[
  term ((466832 : Rat) / 7625) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 476 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0476 : Poly :=
[
  term ((-933664 : Rat) / 7625) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((466832 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((466832 : Rat) / 7625) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((933664 : Rat) / 7625) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-466832 : Rat) / 7625) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-466832 : Rat) / 7625) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0476_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0476
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0477 : Poly :=
[
  term ((-384 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 477 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0477 : Poly :=
[
  term ((768 : Rat) / 5) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 5) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 5) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 5) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 5) [(9, 3), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0477_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0477
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0478 : Poly :=
[
  term ((128 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 478 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0478 : Poly :=
[
  term ((-256 : Rat) / 5) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 5) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 5) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(9, 3), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0478_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0478
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0479 : Poly :=
[
  term ((-104 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 479 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0479 : Poly :=
[
  term ((208 : Rat) / 5) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 5) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0479_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0479
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0480 : Poly :=
[
  term ((-1277 : Rat) / 12) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 480 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0480 : Poly :=
[
  term ((1277 : Rat) / 6) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1277 : Rat) / 12) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1277 : Rat) / 12) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1277 : Rat) / 6) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1277 : Rat) / 12) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((1277 : Rat) / 12) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0480_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0480
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0481 : Poly :=
[
  term ((227 : Rat) / 20) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0481 : Poly :=
[
  term ((-227 : Rat) / 10) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((227 : Rat) / 20) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((227 : Rat) / 20) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((227 : Rat) / 10) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-227 : Rat) / 20) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-227 : Rat) / 20) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0481_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0481
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0482 : Poly :=
[
  term ((2053 : Rat) / 105) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 482 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0482 : Poly :=
[
  term ((-4106 : Rat) / 105) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2053 : Rat) / 105) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2053 : Rat) / 105) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((4106 : Rat) / 105) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2053 : Rat) / 105) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2053 : Rat) / 105) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0482_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0482
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0483 : Poly :=
[
  term ((-19 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 483 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0483 : Poly :=
[
  term ((38 : Rat) / 7) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 7) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0483_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0483
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0484 : Poly :=
[
  term ((155296 : Rat) / 2135) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 484 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0484 : Poly :=
[
  term ((-310592 : Rat) / 2135) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((155296 : Rat) / 2135) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((155296 : Rat) / 2135) [(5, 2), (9, 1), (11, 1), (13, 2)],
  term ((310592 : Rat) / 2135) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-155296 : Rat) / 2135) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((-155296 : Rat) / 2135) [(9, 3), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0484_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0484
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0485 : Poly :=
[
  term ((-3072 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 485 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0485 : Poly :=
[
  term ((6144 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3072 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3072 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3072 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3072 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0485_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0485
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0486 : Poly :=
[
  term ((1024 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 486 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0486 : Poly :=
[
  term ((-2048 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1024 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1024 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2048 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1024 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0486_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0486
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0487 : Poly :=
[
  term ((-832 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 487 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0487 : Poly :=
[
  term ((1664 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-832 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-832 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1664 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((832 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((832 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0487_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0487
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0488 : Poly :=
[
  term ((1718352 : Rat) / 10675) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 488 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0488 : Poly :=
[
  term ((-3436704 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((1718352 : Rat) / 10675) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((1718352 : Rat) / 10675) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-1718352 : Rat) / 10675) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((-1718352 : Rat) / 10675) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0488_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0488
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0489 : Poly :=
[
  term ((-6912 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 489 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0489 : Poly :=
[
  term ((13824 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6912 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6912 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6912 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((6912 : Rat) / 35) [(9, 3), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0489_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0489
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0490 : Poly :=
[
  term ((2304 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 490 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0490 : Poly :=
[
  term ((-4608 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2304 : Rat) / 35) [(9, 3), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0490_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0490
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0491 : Poly :=
[
  term ((-1872 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 491 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0491 : Poly :=
[
  term ((3744 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(9, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0491_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0491
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0492 : Poly :=
[
  term ((-1437 : Rat) / 35) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 492 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0492 : Poly :=
[
  term ((2874 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1437 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((-1437 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((1437 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((1437 : Rat) / 35) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0492_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0492
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0493 : Poly :=
[
  term ((117 : Rat) / 35) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 493 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0493 : Poly :=
[
  term ((-234 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((117 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((117 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-117 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-117 : Rat) / 35) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0493_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0493
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0494 : Poly :=
[
  term ((5913704 : Rat) / 53375) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 494 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0494 : Poly :=
[
  term ((-11827408 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((5913704 : Rat) / 53375) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((5913704 : Rat) / 53375) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((11827408 : Rat) / 53375) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-5913704 : Rat) / 53375) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-5913704 : Rat) / 53375) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0494_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0494
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0495 : Poly :=
[
  term ((-4608 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 495 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0495 : Poly :=
[
  term ((9216 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9216 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((4608 : Rat) / 35) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((4608 : Rat) / 35) [(9, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0495_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0495
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0496 : Poly :=
[
  term ((1536 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 496 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0496 : Poly :=
[
  term ((-3072 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3072 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1536 : Rat) / 35) [(9, 3), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0496_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0496
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0497 : Poly :=
[
  term ((-1248 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 497 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0497 : Poly :=
[
  term ((2496 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(9, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0497_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0497
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0498 : Poly :=
[
  term ((13873 : Rat) / 210) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 498 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0498 : Poly :=
[
  term ((-13873 : Rat) / 105) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((13873 : Rat) / 210) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((13873 : Rat) / 210) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((13873 : Rat) / 105) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-13873 : Rat) / 210) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-13873 : Rat) / 210) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0498_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0498
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0499 : Poly :=
[
  term ((-523 : Rat) / 70) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0499 : Poly :=
[
  term ((523 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 70) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 70) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((523 : Rat) / 70) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((523 : Rat) / 70) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0499_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0499
        rs_R003_ueqv_R003YY_generator_03_0400_0499 =
      rs_R003_ueqv_R003YY_partial_03_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_03_0400_0499 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_03_0400,
  rs_R003_ueqv_R003YY_partial_03_0401,
  rs_R003_ueqv_R003YY_partial_03_0402,
  rs_R003_ueqv_R003YY_partial_03_0403,
  rs_R003_ueqv_R003YY_partial_03_0404,
  rs_R003_ueqv_R003YY_partial_03_0405,
  rs_R003_ueqv_R003YY_partial_03_0406,
  rs_R003_ueqv_R003YY_partial_03_0407,
  rs_R003_ueqv_R003YY_partial_03_0408,
  rs_R003_ueqv_R003YY_partial_03_0409,
  rs_R003_ueqv_R003YY_partial_03_0410,
  rs_R003_ueqv_R003YY_partial_03_0411,
  rs_R003_ueqv_R003YY_partial_03_0412,
  rs_R003_ueqv_R003YY_partial_03_0413,
  rs_R003_ueqv_R003YY_partial_03_0414,
  rs_R003_ueqv_R003YY_partial_03_0415,
  rs_R003_ueqv_R003YY_partial_03_0416,
  rs_R003_ueqv_R003YY_partial_03_0417,
  rs_R003_ueqv_R003YY_partial_03_0418,
  rs_R003_ueqv_R003YY_partial_03_0419,
  rs_R003_ueqv_R003YY_partial_03_0420,
  rs_R003_ueqv_R003YY_partial_03_0421,
  rs_R003_ueqv_R003YY_partial_03_0422,
  rs_R003_ueqv_R003YY_partial_03_0423,
  rs_R003_ueqv_R003YY_partial_03_0424,
  rs_R003_ueqv_R003YY_partial_03_0425,
  rs_R003_ueqv_R003YY_partial_03_0426,
  rs_R003_ueqv_R003YY_partial_03_0427,
  rs_R003_ueqv_R003YY_partial_03_0428,
  rs_R003_ueqv_R003YY_partial_03_0429,
  rs_R003_ueqv_R003YY_partial_03_0430,
  rs_R003_ueqv_R003YY_partial_03_0431,
  rs_R003_ueqv_R003YY_partial_03_0432,
  rs_R003_ueqv_R003YY_partial_03_0433,
  rs_R003_ueqv_R003YY_partial_03_0434,
  rs_R003_ueqv_R003YY_partial_03_0435,
  rs_R003_ueqv_R003YY_partial_03_0436,
  rs_R003_ueqv_R003YY_partial_03_0437,
  rs_R003_ueqv_R003YY_partial_03_0438,
  rs_R003_ueqv_R003YY_partial_03_0439,
  rs_R003_ueqv_R003YY_partial_03_0440,
  rs_R003_ueqv_R003YY_partial_03_0441,
  rs_R003_ueqv_R003YY_partial_03_0442,
  rs_R003_ueqv_R003YY_partial_03_0443,
  rs_R003_ueqv_R003YY_partial_03_0444,
  rs_R003_ueqv_R003YY_partial_03_0445,
  rs_R003_ueqv_R003YY_partial_03_0446,
  rs_R003_ueqv_R003YY_partial_03_0447,
  rs_R003_ueqv_R003YY_partial_03_0448,
  rs_R003_ueqv_R003YY_partial_03_0449,
  rs_R003_ueqv_R003YY_partial_03_0450,
  rs_R003_ueqv_R003YY_partial_03_0451,
  rs_R003_ueqv_R003YY_partial_03_0452,
  rs_R003_ueqv_R003YY_partial_03_0453,
  rs_R003_ueqv_R003YY_partial_03_0454,
  rs_R003_ueqv_R003YY_partial_03_0455,
  rs_R003_ueqv_R003YY_partial_03_0456,
  rs_R003_ueqv_R003YY_partial_03_0457,
  rs_R003_ueqv_R003YY_partial_03_0458,
  rs_R003_ueqv_R003YY_partial_03_0459,
  rs_R003_ueqv_R003YY_partial_03_0460,
  rs_R003_ueqv_R003YY_partial_03_0461,
  rs_R003_ueqv_R003YY_partial_03_0462,
  rs_R003_ueqv_R003YY_partial_03_0463,
  rs_R003_ueqv_R003YY_partial_03_0464,
  rs_R003_ueqv_R003YY_partial_03_0465,
  rs_R003_ueqv_R003YY_partial_03_0466,
  rs_R003_ueqv_R003YY_partial_03_0467,
  rs_R003_ueqv_R003YY_partial_03_0468,
  rs_R003_ueqv_R003YY_partial_03_0469,
  rs_R003_ueqv_R003YY_partial_03_0470,
  rs_R003_ueqv_R003YY_partial_03_0471,
  rs_R003_ueqv_R003YY_partial_03_0472,
  rs_R003_ueqv_R003YY_partial_03_0473,
  rs_R003_ueqv_R003YY_partial_03_0474,
  rs_R003_ueqv_R003YY_partial_03_0475,
  rs_R003_ueqv_R003YY_partial_03_0476,
  rs_R003_ueqv_R003YY_partial_03_0477,
  rs_R003_ueqv_R003YY_partial_03_0478,
  rs_R003_ueqv_R003YY_partial_03_0479,
  rs_R003_ueqv_R003YY_partial_03_0480,
  rs_R003_ueqv_R003YY_partial_03_0481,
  rs_R003_ueqv_R003YY_partial_03_0482,
  rs_R003_ueqv_R003YY_partial_03_0483,
  rs_R003_ueqv_R003YY_partial_03_0484,
  rs_R003_ueqv_R003YY_partial_03_0485,
  rs_R003_ueqv_R003YY_partial_03_0486,
  rs_R003_ueqv_R003YY_partial_03_0487,
  rs_R003_ueqv_R003YY_partial_03_0488,
  rs_R003_ueqv_R003YY_partial_03_0489,
  rs_R003_ueqv_R003YY_partial_03_0490,
  rs_R003_ueqv_R003YY_partial_03_0491,
  rs_R003_ueqv_R003YY_partial_03_0492,
  rs_R003_ueqv_R003YY_partial_03_0493,
  rs_R003_ueqv_R003YY_partial_03_0494,
  rs_R003_ueqv_R003YY_partial_03_0495,
  rs_R003_ueqv_R003YY_partial_03_0496,
  rs_R003_ueqv_R003YY_partial_03_0497,
  rs_R003_ueqv_R003YY_partial_03_0498,
  rs_R003_ueqv_R003YY_partial_03_0499
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_03_0400_0499 : Poly :=
[
  term ((72 : Rat) / 5) [(4, 1), (5, 1), (7, 1)],
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-72 : Rat) / 5) [(4, 1), (5, 1), (7, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (5, 1), (9, 1)],
  term ((-10944 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(4, 1), (5, 1), (9, 1), (12, 1)],
  term ((48 : Rat) / 5) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-65664 : Rat) / 7625) [(4, 1), (5, 1), (9, 1), (13, 2)],
  term ((24 : Rat) / 5) [(4, 1), (5, 1), (9, 1), (14, 1)],
  term ((94848 : Rat) / 7625) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((-10944 : Rat) / 7625) [(4, 1), (5, 1), (10, 1), (13, 1)],
  term ((70656 : Rat) / 7625) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((35616 : Rat) / 7625) [(4, 1), (5, 1), (13, 1)],
  term ((-27648 : Rat) / 10675) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1)],
  term ((21312 : Rat) / 2135) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-37176 : Rat) / 53375) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((232128 : Rat) / 10675) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1)],
  term ((-5568 : Rat) / 1525) [(4, 1), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((14496 : Rat) / 2135) [(4, 1), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-145608 : Rat) / 53375) [(4, 1), (5, 2), (11, 1), (13, 1)],
  term ((212784 : Rat) / 53375) [(4, 1), (5, 2), (13, 2)],
  term ((12 : Rat) / 5) [(4, 1), (5, 2), (14, 1)],
  term ((-36 : Rat) / 5) [(4, 1), (7, 1), (9, 1)],
  term ((-19067264 : Rat) / 53375) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (7, 1), (9, 1), (16, 1)],
  term ((10944 : Rat) / 7625) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-81 : Rat) / 5) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((9 : Rat) / 5) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-102296 : Rat) / 105) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((4168 : Rat) / 35) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-76269056 : Rat) / 53375) [(4, 1), (7, 1), (11, 1), (13, 2)],
  term ((12288 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-4096 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3328 : Rat) / 7) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((4183504 : Rat) / 10675) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-16896 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((5632 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4576 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((12067 : Rat) / 525) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-477 : Rat) / 35) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((331432 : Rat) / 7625) [(4, 1), (7, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 5) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-152 : Rat) / 5) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((1603 : Rat) / 60) [(4, 1), (7, 1), (15, 1)],
  term ((-57 : Rat) / 20) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(4, 1), (7, 2)],
  term ((38134528 : Rat) / 53375) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-6144 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((2048 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(4, 1), (7, 2), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (7, 2), (16, 1)],
  term ((-55296 : Rat) / 10675) [(4, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((42624 : Rat) / 2135) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-74352 : Rat) / 53375) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((464256 : Rat) / 10675) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-11136 : Rat) / 1525) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((28992 : Rat) / 2135) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-291216 : Rat) / 53375) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((425568 : Rat) / 53375) [(4, 1), (8, 1), (13, 2)],
  term ((24 : Rat) / 5) [(4, 1), (8, 1), (14, 1)],
  term ((27648 : Rat) / 10675) [(4, 1), (8, 2), (9, 1), (11, 2), (13, 1)],
  term ((-21312 : Rat) / 2135) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((37176 : Rat) / 53375) [(4, 1), (8, 2), (9, 1), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (8, 2), (9, 2), (11, 1), (13, 1)],
  term ((5568 : Rat) / 1525) [(4, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-14496 : Rat) / 2135) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((145608 : Rat) / 53375) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((-212784 : Rat) / 53375) [(4, 1), (8, 2), (13, 2)],
  term ((-12 : Rat) / 5) [(4, 1), (8, 2), (14, 1)],
  term ((-933664 : Rat) / 7625) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((768 : Rat) / 5) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 5) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 5) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1277 : Rat) / 6) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-227 : Rat) / 10) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4106 : Rat) / 105) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((38 : Rat) / 7) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-310592 : Rat) / 2135) [(4, 1), (9, 1), (11, 1), (13, 2)],
  term ((6144 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3436704 : Rat) / 10675) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((13824 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2874 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-234 : Rat) / 35) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11827408 : Rat) / 53375) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((9216 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13873 : Rat) / 105) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((523 : Rat) / 35) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5568 : Rat) / 1525) [(4, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-14496 : Rat) / 2135) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((145608 : Rat) / 53375) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-212784 : Rat) / 53375) [(4, 1), (9, 2), (13, 2)],
  term ((-12 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((27648 : Rat) / 10675) [(4, 1), (9, 3), (11, 2), (13, 1)],
  term ((-21312 : Rat) / 2135) [(4, 1), (9, 3), (12, 1), (13, 1)],
  term ((37176 : Rat) / 53375) [(4, 1), (9, 3), (13, 1)],
  term ((-232128 : Rat) / 10675) [(4, 1), (9, 4), (11, 1), (13, 1)],
  term ((-36 : Rat) / 5) [(4, 2), (5, 1), (7, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((36 : Rat) / 5) [(4, 2), (5, 1), (7, 1), (14, 1)],
  term ((12 : Rat) / 5) [(4, 2), (5, 1), (9, 1)],
  term ((5472 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(4, 2), (5, 1), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((32832 : Rat) / 7625) [(4, 2), (5, 1), (9, 1), (13, 2)],
  term ((-12 : Rat) / 5) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((-47424 : Rat) / 7625) [(4, 2), (5, 1), (9, 2), (13, 1)],
  term ((5472 : Rat) / 7625) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((-35328 : Rat) / 7625) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((-17808 : Rat) / 7625) [(4, 2), (5, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (11, 1), (13, 2)],
  term ((156672 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (5, 2), (7, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 1525) [(4, 2), (5, 2), (9, 1), (11, 1), (13, 2)],
  term ((-129024 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (5, 2), (9, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 2), (5, 2), (9, 2), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-131328 : Rat) / 7625) [(4, 2), (5, 2), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 2), (5, 2), (13, 2)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-442368 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((313344 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (11, 1), (13, 2)],
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (7, 1), (8, 2), (13, 1)],
  term ((18 : Rat) / 5) [(4, 2), (7, 1), (9, 1)],
  term ((9533632 : Rat) / 53375) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((12787 : Rat) / 105) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-521 : Rat) / 35) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((6 : Rat) / 5) [(4, 2), (7, 1), (9, 1), (16, 1)],
  term ((221184 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (11, 1), (13, 2)],
  term ((-156672 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (7, 1), (9, 2), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 2), (7, 1), (9, 3), (11, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((81 : Rat) / 10) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-9 : Rat) / 10) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(4, 2), (7, 1), (11, 1), (13, 2)],
  term ((-6144 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(4, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2091752 : Rat) / 10675) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((8448 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2816 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12067 : Rat) / 1050) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((477 : Rat) / 70) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-165716 : Rat) / 7625) [(4, 2), (7, 1), (13, 1)],
  term ((216 : Rat) / 5) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-64 : Rat) / 5) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 5) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1603 : Rat) / 120) [(4, 2), (7, 1), (15, 1)],
  term ((57 : Rat) / 40) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 2)],
  term ((221184 : Rat) / 7625) [(4, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-110592 : Rat) / 7625) [(4, 2), (7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-19067264 : Rat) / 53375) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(4, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(4, 2), (7, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 2), (7, 2), (16, 1)],
  term ((-27648 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((110592 : Rat) / 1525) [(4, 2), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-258048 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((41472 : Rat) / 7625) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((-331776 : Rat) / 7625) [(4, 2), (8, 1), (9, 2), (11, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-262656 : Rat) / 7625) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (8, 1), (13, 2)],
  term ((13824 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-55296 : Rat) / 1525) [(4, 2), (8, 2), (9, 1), (11, 1), (13, 2)],
  term ((129024 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (8, 2), (9, 1), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (8, 2), (9, 2), (11, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((131328 : Rat) / 7625) [(4, 2), (8, 2), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (8, 2), (13, 2)],
  term ((466832 : Rat) / 7625) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-384 : Rat) / 5) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 5) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1277 : Rat) / 12) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((227 : Rat) / 20) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2053 : Rat) / 105) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19 : Rat) / 7) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((155296 : Rat) / 2135) [(4, 2), (9, 1), (11, 1), (13, 2)],
  term ((-3072 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((1024 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(4, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1773648 : Rat) / 10675) [(4, 2), (9, 1), (11, 2), (13, 1)],
  term ((-6912 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1437 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((117 : Rat) / 35) [(4, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4848104 : Rat) / 53375) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((13873 : Rat) / 210) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-523 : Rat) / 70) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((74352 : Rat) / 53375) [(4, 2), (9, 1), (13, 1)],
  term ((-55296 : Rat) / 7625) [(4, 2), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 2), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1401984 : Rat) / 53375) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 2), (9, 2), (13, 2)],
  term ((13824 : Rat) / 7625) [(4, 2), (9, 3), (10, 1), (13, 1)],
  term ((-55296 : Rat) / 1525) [(4, 2), (9, 3), (11, 1), (13, 2)],
  term ((129024 : Rat) / 7625) [(4, 2), (9, 3), (12, 1), (13, 1)],
  term ((-20736 : Rat) / 7625) [(4, 2), (9, 3), (13, 1)],
  term ((165888 : Rat) / 7625) [(4, 2), (9, 4), (11, 1), (13, 1)],
  term ((11136 : Rat) / 1525) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-28992 : Rat) / 2135) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((291216 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((-425568 : Rat) / 53375) [(4, 2), (13, 2)],
  term ((-24 : Rat) / 5) [(4, 2), (14, 1)],
  term ((110592 : Rat) / 7625) [(4, 3), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((442368 : Rat) / 7625) [(4, 3), (7, 1), (11, 1), (13, 2)],
  term ((-313344 : Rat) / 7625) [(4, 3), (7, 1), (12, 1), (13, 1)],
  term ((-41472 : Rat) / 7625) [(4, 3), (7, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 3), (7, 2), (11, 1), (13, 1)],
  term ((27648 : Rat) / 7625) [(4, 3), (9, 1), (10, 1), (13, 1)],
  term ((-110592 : Rat) / 1525) [(4, 3), (9, 1), (11, 1), (13, 2)],
  term ((-27648 : Rat) / 10675) [(4, 3), (9, 1), (11, 2), (13, 1)],
  term ((2339136 : Rat) / 53375) [(4, 3), (9, 1), (12, 1), (13, 1)],
  term ((-65496 : Rat) / 10675) [(4, 3), (9, 1), (13, 1)],
  term ((3483072 : Rat) / 53375) [(4, 3), (9, 2), (11, 1), (13, 1)],
  term ((-138432 : Rat) / 7625) [(4, 3), (10, 1), (11, 1), (13, 1)],
  term ((749472 : Rat) / 53375) [(4, 3), (11, 1), (12, 1), (13, 1)],
  term ((1692984 : Rat) / 53375) [(4, 3), (11, 1), (13, 1)],
  term ((19248 : Rat) / 53375) [(4, 3), (13, 2)],
  term ((12 : Rat) / 5) [(4, 3), (14, 1)],
  term ((-55296 : Rat) / 7625) [(4, 4), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-221184 : Rat) / 7625) [(4, 4), (7, 1), (11, 1), (13, 2)],
  term ((156672 : Rat) / 7625) [(4, 4), (7, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 4), (7, 1), (13, 1)],
  term ((110592 : Rat) / 7625) [(4, 4), (7, 2), (11, 1), (13, 1)],
  term ((-13824 : Rat) / 7625) [(4, 4), (9, 1), (10, 1), (13, 1)],
  term ((55296 : Rat) / 1525) [(4, 4), (9, 1), (11, 1), (13, 2)],
  term ((-129024 : Rat) / 7625) [(4, 4), (9, 1), (12, 1), (13, 1)],
  term ((20736 : Rat) / 7625) [(4, 4), (9, 1), (13, 1)],
  term ((-165888 : Rat) / 7625) [(4, 4), (9, 2), (11, 1), (13, 1)],
  term ((55296 : Rat) / 7625) [(4, 4), (10, 1), (11, 1), (13, 1)],
  term ((-27648 : Rat) / 7625) [(4, 4), (11, 1), (12, 1), (13, 1)],
  term ((-131328 : Rat) / 7625) [(4, 4), (11, 1), (13, 1)],
  term ((13824 : Rat) / 7625) [(4, 4), (13, 2)],
  term ((-72 : Rat) / 5) [(5, 1), (7, 1), (8, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1)],
  term ((48 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((72 : Rat) / 5) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term ((36 : Rat) / 5) [(5, 1), (7, 1), (8, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (12, 1), (14, 1)],
  term ((-36 : Rat) / 5) [(5, 1), (7, 1), (8, 2), (14, 1)],
  term ((36 : Rat) / 5) [(5, 1), (7, 1), (9, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1)],
  term ((-36 : Rat) / 5) [(5, 1), (7, 1), (9, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (8, 1), (9, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((65664 : Rat) / 7625) [(5, 1), (8, 1), (9, 1), (13, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-94848 : Rat) / 7625) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((10944 : Rat) / 7625) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-70656 : Rat) / 7625) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-35616 : Rat) / 7625) [(5, 1), (8, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (8, 2), (9, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (8, 2), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (8, 2), (9, 1), (12, 1), (14, 1)],
  term ((-32832 : Rat) / 7625) [(5, 1), (8, 2), (9, 1), (13, 2)],
  term ((12 : Rat) / 5) [(5, 1), (8, 2), (9, 1), (14, 1)],
  term ((47424 : Rat) / 7625) [(5, 1), (8, 2), (9, 2), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((35328 : Rat) / 7625) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((17808 : Rat) / 7625) [(5, 1), (8, 2), (13, 1)],
  term ((-5472 : Rat) / 7625) [(5, 1), (9, 2), (10, 1), (13, 1)],
  term ((35328 : Rat) / 7625) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((17808 : Rat) / 7625) [(5, 1), (9, 2), (13, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (9, 3)],
  term ((-5472 : Rat) / 7625) [(5, 1), (9, 3), (11, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (9, 3), (12, 1)],
  term ((24 : Rat) / 5) [(5, 1), (9, 3), (12, 1), (14, 1)],
  term ((-32832 : Rat) / 7625) [(5, 1), (9, 3), (13, 2)],
  term ((12 : Rat) / 5) [(5, 1), (9, 3), (14, 1)],
  term ((47424 : Rat) / 7625) [(5, 1), (9, 4), (13, 1)],
  term ((18 : Rat) / 5) [(5, 2), (7, 1), (9, 1)],
  term ((9533632 : Rat) / 53375) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((12787 : Rat) / 105) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-521 : Rat) / 35) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((6 : Rat) / 5) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5472 : Rat) / 7625) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((81 : Rat) / 10) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-9 : Rat) / 10) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((51148 : Rat) / 105) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2084 : Rat) / 35) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38134528 : Rat) / 53375) [(5, 2), (7, 1), (11, 1), (13, 2)],
  term ((-6144 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 7) [(5, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2091752 : Rat) / 10675) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((8448 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2816 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12067 : Rat) / 1050) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((477 : Rat) / 70) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-165716 : Rat) / 7625) [(5, 2), (7, 1), (13, 1)],
  term ((216 : Rat) / 5) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-64 : Rat) / 5) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 5) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1603 : Rat) / 120) [(5, 2), (7, 1), (15, 1)],
  term ((57 : Rat) / 40) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 2)],
  term ((-19067264 : Rat) / 53375) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-25574 : Rat) / 105) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(5, 2), (7, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(5, 2), (7, 2), (16, 1)],
  term ((466832 : Rat) / 7625) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-384 : Rat) / 5) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 5) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1277 : Rat) / 12) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((227 : Rat) / 20) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2053 : Rat) / 105) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19 : Rat) / 7) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((155296 : Rat) / 2135) [(5, 2), (9, 1), (11, 1), (13, 2)],
  term ((-3072 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((1024 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1718352 : Rat) / 10675) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((-6912 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1437 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((117 : Rat) / 35) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((5913704 : Rat) / 53375) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((13873 : Rat) / 210) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-523 : Rat) / 70) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(5, 3), (7, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (7, 1), (12, 1)],
  term ((24 : Rat) / 5) [(5, 3), (7, 1), (12, 1), (14, 1)],
  term ((36 : Rat) / 5) [(5, 3), (7, 1), (14, 1)],
  term ((12 : Rat) / 5) [(5, 3), (9, 1)],
  term ((5472 : Rat) / 7625) [(5, 3), (9, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(5, 3), (9, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(5, 3), (9, 1), (12, 1), (14, 1)],
  term ((32832 : Rat) / 7625) [(5, 3), (9, 1), (13, 2)],
  term ((-12 : Rat) / 5) [(5, 3), (9, 1), (14, 1)],
  term ((-47424 : Rat) / 7625) [(5, 3), (9, 2), (13, 1)],
  term ((5472 : Rat) / 7625) [(5, 3), (10, 1), (13, 1)],
  term ((-35328 : Rat) / 7625) [(5, 3), (12, 1), (13, 1)],
  term ((-17808 : Rat) / 7625) [(5, 3), (13, 1)],
  term ((36 : Rat) / 5) [(7, 1), (8, 1), (9, 1)],
  term ((19067264 : Rat) / 53375) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10944 : Rat) / 7625) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((81 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((102296 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4168 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((76269056 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-12288 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((4096 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3328 : Rat) / 7) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4183504 : Rat) / 10675) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((16896 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5632 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4576 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12067 : Rat) / 525) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((477 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-331432 : Rat) / 7625) [(7, 1), (8, 1), (13, 1)],
  term ((432 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((152 : Rat) / 5) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1603 : Rat) / 60) [(7, 1), (8, 1), (15, 1)],
  term ((57 : Rat) / 20) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(7, 1), (8, 2), (9, 1)],
  term ((-9533632 : Rat) / 53375) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(7, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 105) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((521 : Rat) / 35) [(7, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(7, 1), (8, 2), (9, 1), (16, 1)],
  term ((5472 : Rat) / 7625) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-81 : Rat) / 10) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((9 : Rat) / 10) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-51148 : Rat) / 105) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38134528 : Rat) / 53375) [(7, 1), (8, 2), (11, 1), (13, 2)],
  term ((6144 : Rat) / 7) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 7) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(7, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((2091752 : Rat) / 10675) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-8448 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((12067 : Rat) / 1050) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-477 : Rat) / 70) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((165716 : Rat) / 7625) [(7, 1), (8, 2), (13, 1)],
  term ((-216 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((64 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-76 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((1603 : Rat) / 120) [(7, 1), (8, 2), (15, 1)],
  term ((-57 : Rat) / 40) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((5472 : Rat) / 7625) [(7, 1), (9, 2), (10, 1), (13, 1)],
  term ((-81 : Rat) / 10) [(7, 1), (9, 2), (10, 1), (15, 1)],
  term ((9 : Rat) / 10) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-51148 : Rat) / 105) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38134528 : Rat) / 53375) [(7, 1), (9, 2), (11, 1), (13, 2)],
  term ((6144 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((2091752 : Rat) / 10675) [(7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-8448 : Rat) / 35) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(7, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((12067 : Rat) / 1050) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-477 : Rat) / 70) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((165716 : Rat) / 7625) [(7, 1), (9, 2), (13, 1)],
  term ((-216 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((64 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-76 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((1603 : Rat) / 120) [(7, 1), (9, 2), (15, 1)],
  term ((-57 : Rat) / 40) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-18 : Rat) / 5) [(7, 1), (9, 3)],
  term ((-9533632 : Rat) / 53375) [(7, 1), (9, 3), (11, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(7, 1), (9, 3), (11, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(7, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(7, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 105) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((521 : Rat) / 35) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(7, 1), (9, 3), (14, 1)],
  term ((-6 : Rat) / 5) [(7, 1), (9, 3), (16, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (8, 1)],
  term ((-38134528 : Rat) / 53375) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((6144 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2048 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-51148 : Rat) / 105) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(7, 2), (8, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 2), (8, 1), (16, 1)],
  term ((12 : Rat) / 5) [(7, 2), (8, 2)],
  term ((19067264 : Rat) / 53375) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(7, 2), (8, 2), (11, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(7, 2), (8, 2), (14, 1)],
  term ((12 : Rat) / 5) [(7, 2), (8, 2), (16, 1)],
  term ((12 : Rat) / 5) [(7, 2), (9, 2)],
  term ((19067264 : Rat) / 53375) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(7, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(7, 2), (9, 2), (14, 1)],
  term ((12 : Rat) / 5) [(7, 2), (9, 2), (16, 1)],
  term ((933664 : Rat) / 7625) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-768 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1277 : Rat) / 6) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((227 : Rat) / 10) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4106 : Rat) / 105) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((310592 : Rat) / 2135) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-6144 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((2048 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((11827408 : Rat) / 53375) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-9216 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((3072 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((13873 : Rat) / 105) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-523 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-466832 : Rat) / 7625) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((384 : Rat) / 5) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 5) [(8, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1277 : Rat) / 12) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-227 : Rat) / 20) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2053 : Rat) / 105) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((19 : Rat) / 7) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-155296 : Rat) / 2135) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((3072 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1024 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1718352 : Rat) / 10675) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((6912 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2304 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1437 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-117 : Rat) / 35) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5913704 : Rat) / 53375) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((4608 : Rat) / 35) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13873 : Rat) / 210) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((523 : Rat) / 70) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-466832 : Rat) / 7625) [(9, 3), (10, 1), (13, 1)],
  term ((384 : Rat) / 5) [(9, 3), (10, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 5) [(9, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((1277 : Rat) / 12) [(9, 3), (10, 1), (15, 1)],
  term ((-227 : Rat) / 20) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-2053 : Rat) / 105) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((19 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-155296 : Rat) / 2135) [(9, 3), (11, 1), (13, 2)],
  term ((3072 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1)],
  term ((-1024 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-1718352 : Rat) / 10675) [(9, 3), (11, 2), (13, 1)],
  term ((6912 : Rat) / 35) [(9, 3), (11, 2), (13, 1), (14, 1)],
  term ((-2304 : Rat) / 35) [(9, 3), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1872 : Rat) / 35) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((1437 : Rat) / 35) [(9, 3), (11, 2), (15, 1)],
  term ((-117 : Rat) / 35) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-5913704 : Rat) / 53375) [(9, 3), (12, 1), (13, 1)],
  term ((4608 : Rat) / 35) [(9, 3), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-13873 : Rat) / 210) [(9, 3), (12, 1), (15, 1)],
  term ((523 : Rat) / 70) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 400 through 499. -/
theorem rs_R003_ueqv_R003YY_block_03_0400_0499_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_03_0400_0499
      rs_R003_ueqv_R003YY_block_03_0400_0499 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
