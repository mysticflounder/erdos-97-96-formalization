/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 25:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_25_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0400 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (6, 1), (12, 1), (15, 2)]
]

/-- Partial product 400 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0400 : Poly :=
[
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (6, 1), (12, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (6, 1), (12, 2), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 3), (6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0400_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0400
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0401 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0401 : Poly :=
[
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0401_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0401
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0402 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (6, 1), (12, 2), (15, 2)]
]

/-- Partial product 402 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0402 : Poly :=
[
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (6, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (6, 1), (12, 2), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (6, 1), (12, 3), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 2), (6, 1), (12, 3), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (6, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0402_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0402
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0403 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 403 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0403 : Poly :=
[
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (6, 1), (12, 3), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 2), (6, 1), (12, 3), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (6, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0403_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0403
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0404 : Poly :=
[
  term ((678880 : Rat) / 52799) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 404 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0404 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 3), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0404_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0404
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0405 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0405 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 3), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0405_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0405
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0406 : Poly :=
[
  term ((-3216320 : Rat) / 158397) [(0, 1), (6, 1), (15, 2)]
]

/-- Partial product 406 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0406 : Poly :=
[
  term ((6432640 : Rat) / 158397) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-3216320 : Rat) / 158397) [(0, 1), (1, 2), (6, 1), (15, 2)],
  term ((-6432640 : Rat) / 158397) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((3216320 : Rat) / 158397) [(0, 1), (6, 1), (15, 2)],
  term ((6432640 : Rat) / 158397) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-3216320 : Rat) / 158397) [(0, 3), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0406_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0406
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0407 : Poly :=
[
  term ((23827616 : Rat) / 385571) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 407 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0407 : Poly :=
[
  term ((-47655232 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((23827616 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (15, 2), (16, 1)],
  term ((47655232 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23827616 : Rat) / 385571) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((23827616 : Rat) / 385571) [(0, 3), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0407_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0407
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0408 : Poly :=
[
  term ((-19908608 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 408 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0408 : Poly :=
[
  term ((39817216 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((39817216 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0408_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0408
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0409 : Poly :=
[
  term ((-15273760 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0409 : Poly :=
[
  term ((30547520 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((30547520 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0409_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0409
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0410 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 410 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0410 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0410_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0410
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0411 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0411 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0411_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0411
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0412 : Poly :=
[
  term ((2893600 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 412 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0412 : Poly :=
[
  term ((-5787200 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2893600 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((5787200 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((2893600 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0412_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0412
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0413 : Poly :=
[
  term ((-93510588 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0413 : Poly :=
[
  term ((187021176 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-187021176 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((93510588 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((187021176 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0413_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0413
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0414 : Poly :=
[
  term ((-8519680 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 414 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0414 : Poly :=
[
  term ((17039360 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((17039360 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0414_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0414
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0415 : Poly :=
[
  term ((-17248256 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0415 : Poly :=
[
  term ((34496512 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((34496512 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0415_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0415
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0416 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 416 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0416 : Poly :=
[
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0416_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0416
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0417 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 417 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0417 : Poly :=
[
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0417_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0417
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0418 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 418 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0418 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0418_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0418
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0419 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0419 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0419_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0419
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0420 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 420 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0420 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0420_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0420
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0421 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0421 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0421_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0421
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0422 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 422 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0422 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 3), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 3), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0422_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0422
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0423 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0423 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0423_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0423
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0424 : Poly :=
[
  term ((-2893600 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 424 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0424 : Poly :=
[
  term ((5787200 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((2893600 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0424_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0424
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0425 : Poly :=
[
  term ((93510588 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 425 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0425 : Poly :=
[
  term ((-187021176 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((93510588 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((187021176 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-187021176 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((93510588 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0425_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0425
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0426 : Poly :=
[
  term ((-1446800 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 426 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0426 : Poly :=
[
  term ((2893600 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1446800 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((1446800 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((2893600 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1446800 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0426_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0426
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0427 : Poly :=
[
  term ((46755294 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0427 : Poly :=
[
  term ((-93510588 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((46755294 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((93510588 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46755294 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((46755294 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0427_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0427
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0428 : Poly :=
[
  term ((19908608 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 428 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0428 : Poly :=
[
  term ((-39817216 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 3), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0428_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0428
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0429 : Poly :=
[
  term ((15273760 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0429 : Poly :=
[
  term ((-30547520 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 3), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0429_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0429
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0430 : Poly :=
[
  term ((-532480 : Rat) / 52799) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 430 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0430 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0430_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0430
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0431 : Poly :=
[
  term ((-3234048 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0431 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0431_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0431
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0432 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 432 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0432 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 3), (7, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0432_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0432
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0433 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0433 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 3), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0433_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0433
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0434 : Poly :=
[
  term ((-14468000 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 434 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0434 : Poly :=
[
  term ((28936000 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-14468000 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-28936000 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((14468000 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((28936000 : Rat) / 158397) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-14468000 : Rat) / 158397) [(0, 3), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0434_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0434
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0435 : Poly :=
[
  term ((155850980 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0435 : Poly :=
[
  term ((-311701960 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((155850980 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((311701960 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-155850980 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-311701960 : Rat) / 385571) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((155850980 : Rat) / 385571) [(0, 3), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0435_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0435
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0436 : Poly :=
[
  term ((8519680 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 436 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0436 : Poly :=
[
  term ((-17039360 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 3), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0436_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0436
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0437 : Poly :=
[
  term ((17248256 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 437 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0437 : Poly :=
[
  term ((-34496512 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 3), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0437_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0437
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0438 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 438 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0438 : Poly :=
[
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 2), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 2), (7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0438_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0438
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0439 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 439 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0439 : Poly :=
[
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 2), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0439_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0439
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0440 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 440 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0440 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0440_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0440
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0441 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0441 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0441_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0441
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0442 : Poly :=
[
  term ((10606240 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 442 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0442 : Poly :=
[
  term ((-21212480 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((10606240 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-10606240 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((21212480 : Rat) / 158397) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-21212480 : Rat) / 158397) [(0, 2), (7, 1), (12, 2), (15, 1)],
  term ((10606240 : Rat) / 158397) [(0, 3), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0442_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0442
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0443 : Poly :=
[
  term ((-146708524 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0443 : Poly :=
[
  term ((293417048 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146708524 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((146708524 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-293417048 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((293417048 : Rat) / 385571) [(0, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-146708524 : Rat) / 385571) [(0, 3), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0443_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0443
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0444 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 444 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0444 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (12, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (7, 1), (12, 3), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (7, 1), (12, 3), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0444_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0444
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0445 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0445 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0445_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0445
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0446 : Poly :=
[
  term ((-12431360 : Rat) / 158397) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 446 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0446 : Poly :=
[
  term ((24862720 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12431360 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-24862720 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((12431360 : Rat) / 158397) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((24862720 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12431360 : Rat) / 158397) [(0, 3), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0446_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0446
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0447 : Poly :=
[
  term ((137518376 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0447 : Poly :=
[
  term ((-275036752 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((137518376 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((275036752 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-137518376 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-275036752 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((137518376 : Rat) / 385571) [(0, 3), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0447_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0447
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0448 : Poly :=
[
  term ((1875280 : Rat) / 52799) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 448 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0448 : Poly :=
[
  term ((-3750560 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((1875280 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((3750560 : Rat) / 52799) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1875280 : Rat) / 52799) [(0, 1), (7, 1), (15, 1)],
  term ((-3750560 : Rat) / 52799) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((1875280 : Rat) / 52799) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0448_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0448
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0449 : Poly :=
[
  term ((-66011682 : Rat) / 385571) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0449 : Poly :=
[
  term ((132023364 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66011682 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-132023364 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((66011682 : Rat) / 385571) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((132023364 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-66011682 : Rat) / 385571) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0449_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0449
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0450 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 450 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0450 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 2), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0450_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0450
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0451 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0451 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 2), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0451_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0451
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0452 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 452 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0452 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 2), (12, 1), (13, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (7, 2), (12, 2), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0452_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0452
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0453 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0453 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0453_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0453
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0454 : Poly :=
[
  term ((-9954304 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 454 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0454 : Poly :=
[
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9954304 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((9954304 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9954304 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0454_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0454
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0455 : Poly :=
[
  term ((-7636880 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0455 : Poly :=
[
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7636880 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7636880 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7636880 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0455_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0455
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0456 : Poly :=
[
  term ((4977152 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 456 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0456 : Poly :=
[
  term ((-9954304 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4977152 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((9954304 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4977152 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-9954304 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((4977152 : Rat) / 52799) [(0, 3), (8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0456_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0456
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0457 : Poly :=
[
  term ((11455320 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0457 : Poly :=
[
  term ((-22910640 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11455320 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((22910640 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11455320 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22910640 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((11455320 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0457_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0457
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0458 : Poly :=
[
  term ((-19908608 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 458 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0458 : Poly :=
[
  term ((39817216 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((39817216 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0458_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0458
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0459 : Poly :=
[
  term ((-15273760 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0459 : Poly :=
[
  term ((30547520 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((30547520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0459_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0459
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0460 : Poly :=
[
  term ((9905408 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 460 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0460 : Poly :=
[
  term ((-19810816 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((9905408 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-9905408 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((19810816 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-19810816 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((9905408 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0460_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0460
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0461 : Poly :=
[
  term ((-88903952 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0461 : Poly :=
[
  term ((177807904 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-88903952 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((88903952 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-177807904 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((177807904 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-88903952 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0461_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0461
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0462 : Poly :=
[
  term ((19908608 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 462 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0462 : Poly :=
[
  term ((-39817216 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0462_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0462
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0463 : Poly :=
[
  term ((15273760 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0463 : Poly :=
[
  term ((-30547520 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0463_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0463
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0464 : Poly :=
[
  term ((-14882560 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 464 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0464 : Poly :=
[
  term ((29765120 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14882560 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-29765120 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((14882560 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((29765120 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14882560 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0464_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0464
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0465 : Poly :=
[
  term ((85085512 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0465 : Poly :=
[
  term ((-170171024 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((85085512 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((170171024 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85085512 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170171024 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((85085512 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0465_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0465
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0466 : Poly :=
[
  term ((-5786368 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 466 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0466 : Poly :=
[
  term ((11572736 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5786368 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-11572736 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((5786368 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((11572736 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-5786368 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0466_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0466
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0467 : Poly :=
[
  term ((-573212 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 467 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0467 : Poly :=
[
  term ((1146424 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-573212 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1146424 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((573212 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1146424 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-573212 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0467_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0467
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0468 : Poly :=
[
  term ((-4259840 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 468 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0468 : Poly :=
[
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4259840 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4259840 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4259840 : Rat) / 158397) [(0, 3), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0468_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0468
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0469 : Poly :=
[
  term ((-8624128 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0469 : Poly :=
[
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8624128 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8624128 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8624128 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0469_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0469
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0470 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 470 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0470 : Poly :=
[
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0470_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0470
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0471 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0471 : Poly :=
[
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0471_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0471
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0472 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 472 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0472 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 3), (8, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0472_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0472
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0473 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 473 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0473 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0473_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0473
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0474 : Poly :=
[
  term ((-5058560 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 474 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0474 : Poly :=
[
  term ((10117120 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-5058560 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-10117120 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((5058560 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((10117120 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-5058560 : Rat) / 158397) [(0, 3), (8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0474_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0474
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0475 : Poly :=
[
  term ((-10241152 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0475 : Poly :=
[
  term ((20482304 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10241152 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-20482304 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((10241152 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((20482304 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10241152 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0475_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0475
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0476 : Poly :=
[
  term ((-8519680 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 476 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0476 : Poly :=
[
  term ((17039360 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((17039360 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0476_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0476
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0477 : Poly :=
[
  term ((-17248256 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0477 : Poly :=
[
  term ((34496512 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((34496512 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0477_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0477
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0478 : Poly :=
[
  term ((8314880 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 478 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0478 : Poly :=
[
  term ((-16629760 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8314880 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8314880 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((16629760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-16629760 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((8314880 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0478_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0478
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0479 : Poly :=
[
  term ((23851840 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0479 : Poly :=
[
  term ((-47703680 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23851840 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23851840 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((47703680 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-47703680 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((23851840 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0479_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0479
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0480 : Poly :=
[
  term ((8519680 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 480 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0480 : Poly :=
[
  term ((-17039360 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0480_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0480
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0481 : Poly :=
[
  term ((17248256 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0481 : Poly :=
[
  term ((-34496512 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0481_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0481
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0482 : Poly :=
[
  term ((-10178560 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 482 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0482 : Poly :=
[
  term ((20357120 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10178560 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-20357120 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((10178560 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((20357120 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10178560 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0482_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0482
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0483 : Poly :=
[
  term ((-27624896 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 483 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0483 : Poly :=
[
  term ((55249792 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27624896 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55249792 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27624896 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((55249792 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27624896 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0483_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0483
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0484 : Poly :=
[
  term ((51200 : Rat) / 4281) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 484 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0484 : Poly :=
[
  term ((-102400 : Rat) / 4281) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((51200 : Rat) / 4281) [(0, 1), (1, 2), (8, 1), (11, 1), (15, 1)],
  term ((102400 : Rat) / 4281) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-51200 : Rat) / 4281) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-102400 : Rat) / 4281) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((51200 : Rat) / 4281) [(0, 3), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0484_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0484
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0485 : Poly :=
[
  term ((7344352 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 485 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0485 : Poly :=
[
  term ((-14688704 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7344352 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((14688704 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7344352 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14688704 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7344352 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0485_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0485
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0486 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 486 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0486 : Poly :=
[
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 3), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0486_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0486
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0487 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 487 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0487 : Poly :=
[
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0487_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0487
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0488 : Poly :=
[
  term ((2539520 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 488 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0488 : Poly :=
[
  term ((-5079040 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((2539520 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-2539520 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((5079040 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((-5079040 : Rat) / 158397) [(0, 2), (8, 1), (12, 2), (15, 2)],
  term ((2539520 : Rat) / 158397) [(0, 3), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0488_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0488
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0489 : Poly :=
[
  term ((-8895104 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 489 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0489 : Poly :=
[
  term ((17790208 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8895104 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((8895104 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17790208 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((17790208 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-8895104 : Rat) / 385571) [(0, 3), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0489_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0489
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0490 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (8, 1), (12, 2), (15, 2)]
]

/-- Partial product 490 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0490 : Poly :=
[
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (12, 2), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (8, 1), (12, 3), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 2), (8, 1), (12, 3), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0490_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0490
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0491 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 491 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0491 : Poly :=
[
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 2), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0491_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0491
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0492 : Poly :=
[
  term ((-942080 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 492 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0492 : Poly :=
[
  term ((1884160 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-942080 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (14, 1), (15, 2)],
  term ((-1884160 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((942080 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((1884160 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-942080 : Rat) / 158397) [(0, 3), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0492_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0492
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0493 : Poly :=
[
  term ((12129152 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 493 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0493 : Poly :=
[
  term ((-24258304 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12129152 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((24258304 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12129152 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24258304 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12129152 : Rat) / 385571) [(0, 3), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0493_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0493
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0494 : Poly :=
[
  term ((2996416 : Rat) / 52799) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 494 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0494 : Poly :=
[
  term ((-5992832 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (13, 1), (15, 2)],
  term ((2996416 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (15, 2)],
  term ((5992832 : Rat) / 52799) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2996416 : Rat) / 52799) [(0, 1), (8, 1), (15, 2)],
  term ((-5992832 : Rat) / 52799) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((2996416 : Rat) / 52799) [(0, 3), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0494_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0494
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0495 : Poly :=
[
  term ((-20064936 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 495 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0495 : Poly :=
[
  term ((40129872 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20064936 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-40129872 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((20064936 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((40129872 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20064936 : Rat) / 385571) [(0, 3), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0495_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0495
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0496 : Poly :=
[
  term ((9954304 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 496 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0496 : Poly :=
[
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((9954304 : Rat) / 158397) [(0, 1), (1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9954304 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((9954304 : Rat) / 158397) [(0, 3), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0496_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0496
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0497 : Poly :=
[
  term ((7636880 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 497 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0497 : Poly :=
[
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7636880 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7636880 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7636880 : Rat) / 385571) [(0, 3), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0497_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0497
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0498 : Poly :=
[
  term ((-25285120 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 498 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0498 : Poly :=
[
  term ((50570240 : Rat) / 158397) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-25285120 : Rat) / 158397) [(0, 1), (1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-50570240 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((25285120 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((50570240 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-25285120 : Rat) / 158397) [(0, 3), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0498_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0498
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NYN_coefficient_25_0499 : Poly :=
[
  term ((-19900712 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 25. -/
def rs_R005_ueqv_R005NYN_partial_25_0499 : Poly :=
[
  term ((39801424 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19900712 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-39801424 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((19900712 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((39801424 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19900712 : Rat) / 385571) [(0, 3), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 25. -/
theorem rs_R005_ueqv_R005NYN_partial_25_0499_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_25_0499
        rs_R005_ueqv_R005NYN_generator_25_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_25_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_25_0400_0499 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_25_0400,
  rs_R005_ueqv_R005NYN_partial_25_0401,
  rs_R005_ueqv_R005NYN_partial_25_0402,
  rs_R005_ueqv_R005NYN_partial_25_0403,
  rs_R005_ueqv_R005NYN_partial_25_0404,
  rs_R005_ueqv_R005NYN_partial_25_0405,
  rs_R005_ueqv_R005NYN_partial_25_0406,
  rs_R005_ueqv_R005NYN_partial_25_0407,
  rs_R005_ueqv_R005NYN_partial_25_0408,
  rs_R005_ueqv_R005NYN_partial_25_0409,
  rs_R005_ueqv_R005NYN_partial_25_0410,
  rs_R005_ueqv_R005NYN_partial_25_0411,
  rs_R005_ueqv_R005NYN_partial_25_0412,
  rs_R005_ueqv_R005NYN_partial_25_0413,
  rs_R005_ueqv_R005NYN_partial_25_0414,
  rs_R005_ueqv_R005NYN_partial_25_0415,
  rs_R005_ueqv_R005NYN_partial_25_0416,
  rs_R005_ueqv_R005NYN_partial_25_0417,
  rs_R005_ueqv_R005NYN_partial_25_0418,
  rs_R005_ueqv_R005NYN_partial_25_0419,
  rs_R005_ueqv_R005NYN_partial_25_0420,
  rs_R005_ueqv_R005NYN_partial_25_0421,
  rs_R005_ueqv_R005NYN_partial_25_0422,
  rs_R005_ueqv_R005NYN_partial_25_0423,
  rs_R005_ueqv_R005NYN_partial_25_0424,
  rs_R005_ueqv_R005NYN_partial_25_0425,
  rs_R005_ueqv_R005NYN_partial_25_0426,
  rs_R005_ueqv_R005NYN_partial_25_0427,
  rs_R005_ueqv_R005NYN_partial_25_0428,
  rs_R005_ueqv_R005NYN_partial_25_0429,
  rs_R005_ueqv_R005NYN_partial_25_0430,
  rs_R005_ueqv_R005NYN_partial_25_0431,
  rs_R005_ueqv_R005NYN_partial_25_0432,
  rs_R005_ueqv_R005NYN_partial_25_0433,
  rs_R005_ueqv_R005NYN_partial_25_0434,
  rs_R005_ueqv_R005NYN_partial_25_0435,
  rs_R005_ueqv_R005NYN_partial_25_0436,
  rs_R005_ueqv_R005NYN_partial_25_0437,
  rs_R005_ueqv_R005NYN_partial_25_0438,
  rs_R005_ueqv_R005NYN_partial_25_0439,
  rs_R005_ueqv_R005NYN_partial_25_0440,
  rs_R005_ueqv_R005NYN_partial_25_0441,
  rs_R005_ueqv_R005NYN_partial_25_0442,
  rs_R005_ueqv_R005NYN_partial_25_0443,
  rs_R005_ueqv_R005NYN_partial_25_0444,
  rs_R005_ueqv_R005NYN_partial_25_0445,
  rs_R005_ueqv_R005NYN_partial_25_0446,
  rs_R005_ueqv_R005NYN_partial_25_0447,
  rs_R005_ueqv_R005NYN_partial_25_0448,
  rs_R005_ueqv_R005NYN_partial_25_0449,
  rs_R005_ueqv_R005NYN_partial_25_0450,
  rs_R005_ueqv_R005NYN_partial_25_0451,
  rs_R005_ueqv_R005NYN_partial_25_0452,
  rs_R005_ueqv_R005NYN_partial_25_0453,
  rs_R005_ueqv_R005NYN_partial_25_0454,
  rs_R005_ueqv_R005NYN_partial_25_0455,
  rs_R005_ueqv_R005NYN_partial_25_0456,
  rs_R005_ueqv_R005NYN_partial_25_0457,
  rs_R005_ueqv_R005NYN_partial_25_0458,
  rs_R005_ueqv_R005NYN_partial_25_0459,
  rs_R005_ueqv_R005NYN_partial_25_0460,
  rs_R005_ueqv_R005NYN_partial_25_0461,
  rs_R005_ueqv_R005NYN_partial_25_0462,
  rs_R005_ueqv_R005NYN_partial_25_0463,
  rs_R005_ueqv_R005NYN_partial_25_0464,
  rs_R005_ueqv_R005NYN_partial_25_0465,
  rs_R005_ueqv_R005NYN_partial_25_0466,
  rs_R005_ueqv_R005NYN_partial_25_0467,
  rs_R005_ueqv_R005NYN_partial_25_0468,
  rs_R005_ueqv_R005NYN_partial_25_0469,
  rs_R005_ueqv_R005NYN_partial_25_0470,
  rs_R005_ueqv_R005NYN_partial_25_0471,
  rs_R005_ueqv_R005NYN_partial_25_0472,
  rs_R005_ueqv_R005NYN_partial_25_0473,
  rs_R005_ueqv_R005NYN_partial_25_0474,
  rs_R005_ueqv_R005NYN_partial_25_0475,
  rs_R005_ueqv_R005NYN_partial_25_0476,
  rs_R005_ueqv_R005NYN_partial_25_0477,
  rs_R005_ueqv_R005NYN_partial_25_0478,
  rs_R005_ueqv_R005NYN_partial_25_0479,
  rs_R005_ueqv_R005NYN_partial_25_0480,
  rs_R005_ueqv_R005NYN_partial_25_0481,
  rs_R005_ueqv_R005NYN_partial_25_0482,
  rs_R005_ueqv_R005NYN_partial_25_0483,
  rs_R005_ueqv_R005NYN_partial_25_0484,
  rs_R005_ueqv_R005NYN_partial_25_0485,
  rs_R005_ueqv_R005NYN_partial_25_0486,
  rs_R005_ueqv_R005NYN_partial_25_0487,
  rs_R005_ueqv_R005NYN_partial_25_0488,
  rs_R005_ueqv_R005NYN_partial_25_0489,
  rs_R005_ueqv_R005NYN_partial_25_0490,
  rs_R005_ueqv_R005NYN_partial_25_0491,
  rs_R005_ueqv_R005NYN_partial_25_0492,
  rs_R005_ueqv_R005NYN_partial_25_0493,
  rs_R005_ueqv_R005NYN_partial_25_0494,
  rs_R005_ueqv_R005NYN_partial_25_0495,
  rs_R005_ueqv_R005NYN_partial_25_0496,
  rs_R005_ueqv_R005NYN_partial_25_0497,
  rs_R005_ueqv_R005NYN_partial_25_0498,
  rs_R005_ueqv_R005NYN_partial_25_0499
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_25_0400_0499 : Poly :=
[
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (6, 1), (12, 2), (13, 1), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((187021176 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-187021176 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28936000 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-311701960 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21212480 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((293417048 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 2), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24862720 : Rat) / 158397) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-275036752 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3750560 : Rat) / 52799) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((132023364 : Rat) / 385571) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 2), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 2), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (7, 2), (12, 1), (13, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9954304 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-22910640 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19810816 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((177807904 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((29765120 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-170171024 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11572736 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((1146424 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((10117120 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((20482304 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16629760 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-47703680 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((20357120 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((55249792 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-102400 : Rat) / 4281) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14688704 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5079040 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((17790208 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1884160 : Rat) / 158397) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-24258304 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5992832 : Rat) / 52799) [(0, 1), (1, 1), (8, 1), (13, 1), (15, 2)],
  term ((40129872 : Rat) / 385571) [(0, 1), (1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50570240 : Rat) / 158397) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((39801424 : Rat) / 385571) [(0, 1), (1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (6, 1), (12, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (6, 1), (12, 2), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(0, 1), (1, 2), (6, 1), (15, 2)],
  term ((23827616 : Rat) / 385571) [(0, 1), (1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1446800 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (8, 1), (15, 1)],
  term ((46755294 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14468000 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (10, 1), (15, 1)],
  term ((155850980 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10606240 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-146708524 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12431360 : Rat) / 158397) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1)],
  term ((137518376 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1875280 : Rat) / 52799) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-66011682 : Rat) / 385571) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9954304 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7636880 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4977152 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((11455320 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9905408 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-88903952 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14882560 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((85085512 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5786368 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-573212 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8624128 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5058560 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (10, 1), (15, 2)],
  term ((-10241152 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8314880 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((23851840 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10178560 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-27624896 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((51200 : Rat) / 4281) [(0, 1), (1, 2), (8, 1), (11, 1), (15, 1)],
  term ((7344352 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2539520 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-8895104 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (12, 2), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-942080 : Rat) / 158397) [(0, 1), (1, 2), (8, 1), (14, 1), (15, 2)],
  term ((12129152 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2996416 : Rat) / 52799) [(0, 1), (1, 2), (8, 1), (15, 2)],
  term ((-20064936 : Rat) / 385571) [(0, 1), (1, 2), (8, 1), (15, 2), (16, 1)],
  term ((9954304 : Rat) / 158397) [(0, 1), (1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((7636880 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25285120 : Rat) / 158397) [(0, 1), (1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-19900712 : Rat) / 385571) [(0, 1), (1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12822400 : Rat) / 158397) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((34719040 : Rat) / 385571) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((6389760 : Rat) / 52799) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((38808576 : Rat) / 385571) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (6, 1), (12, 3), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (6, 1), (12, 3), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3216320 : Rat) / 158397) [(0, 1), (6, 1), (15, 2)],
  term ((-23827616 : Rat) / 385571) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-187021176 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14468000 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((155850980 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (12, 3), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1446800 : Rat) / 52799) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-46755294 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-23103488 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21741856 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28936000 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((311701960 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((14468000 : Rat) / 158397) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-155850980 : Rat) / 385571) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36437120 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((399717536 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((645440 : Rat) / 158397) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((14685160 : Rat) / 385571) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((10928960 : Rat) / 52799) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-418097832 : Rat) / 385571) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (7, 1), (12, 3), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((12431360 : Rat) / 158397) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-137518376 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1875280 : Rat) / 52799) [(0, 1), (7, 1), (15, 1)],
  term ((66011682 : Rat) / 385571) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9954304 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((22910640 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((9954304 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((7636880 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4977152 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-11455320 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3285504 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((185444784 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21478144 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((87757528 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-97792 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-193081664 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((14882560 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-85085512 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5786368 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((573212 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8624128 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10117120 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-20482304 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((5058560 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((10241152 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-11837440 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-38001536 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4526080 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9163136 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2703360 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((30455424 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((10178560 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((27624896 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51200 : Rat) / 4281) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-7344352 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8273920 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((11322112 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((15438976 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-31234768 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((11468800 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((-4854016 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (8, 1), (12, 3), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((942080 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((-12129152 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2996416 : Rat) / 52799) [(0, 1), (8, 1), (15, 2)],
  term ((20064936 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50570240 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-39801424 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9954304 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7636880 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((25285120 : Rat) / 158397) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((19900712 : Rat) / 385571) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-47655232 : Rat) / 385571) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (6, 1), (12, 2), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 2), (6, 1), (12, 3), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 2), (6, 1), (12, 3), (15, 2), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((187021176 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-187021176 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (12, 3), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 2), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 2), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((28936000 : Rat) / 158397) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-311701960 : Rat) / 385571) [(0, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 2), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24862720 : Rat) / 158397) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-275036752 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3750560 : Rat) / 52799) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((132023364 : Rat) / 385571) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 2), (7, 1), (12, 2), (13, 1), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 2), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21212480 : Rat) / 158397) [(0, 2), (7, 1), (12, 2), (15, 1)],
  term ((293417048 : Rat) / 385571) [(0, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (7, 1), (12, 3), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (7, 2), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (7, 2), (12, 2), (13, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9954304 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-22910640 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((29765120 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-170171024 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11572736 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1146424 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19810816 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((177807904 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10117120 : Rat) / 158397) [(0, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((20482304 : Rat) / 385571) [(0, 2), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((20357120 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((55249792 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-102400 : Rat) / 4281) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-14688704 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16629760 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-47703680 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((1884160 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-24258304 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5992832 : Rat) / 52799) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((40129872 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5079040 : Rat) / 158397) [(0, 2), (8, 1), (12, 2), (15, 2)],
  term ((17790208 : Rat) / 385571) [(0, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 2), (8, 1), (12, 3), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 2), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50570240 : Rat) / 158397) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((39801424 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (6, 1), (12, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 3), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (6, 1), (12, 2), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 3), (6, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 3), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(0, 3), (6, 1), (15, 2)],
  term ((23827616 : Rat) / 385571) [(0, 3), (6, 1), (15, 2), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2893600 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-93510588 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2893600 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((93510588 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1446800 : Rat) / 52799) [(0, 3), (7, 1), (8, 1), (15, 1)],
  term ((46755294 : Rat) / 385571) [(0, 3), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 3), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 3), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 3), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 3), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14468000 : Rat) / 158397) [(0, 3), (7, 1), (10, 1), (15, 1)],
  term ((155850980 : Rat) / 385571) [(0, 3), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 3), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 3), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10606240 : Rat) / 158397) [(0, 3), (7, 1), (12, 1), (15, 1)],
  term ((-146708524 : Rat) / 385571) [(0, 3), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (7, 1), (12, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12431360 : Rat) / 158397) [(0, 3), (7, 1), (14, 1), (15, 1)],
  term ((137518376 : Rat) / 385571) [(0, 3), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1875280 : Rat) / 52799) [(0, 3), (7, 1), (15, 1)],
  term ((-66011682 : Rat) / 385571) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9954304 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7636880 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4977152 : Rat) / 52799) [(0, 3), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((11455320 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9905408 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-88903952 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14882560 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((85085512 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5786368 : Rat) / 158397) [(0, 3), (8, 1), (9, 1), (15, 1)],
  term ((-573212 : Rat) / 385571) [(0, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 158397) [(0, 3), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8624128 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((6468096 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5058560 : Rat) / 158397) [(0, 3), (8, 1), (10, 1), (15, 2)],
  term ((-10241152 : Rat) / 385571) [(0, 3), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8314880 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((23851840 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-10178560 : Rat) / 158397) [(0, 3), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-27624896 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((51200 : Rat) / 4281) [(0, 3), (8, 1), (11, 1), (15, 1)],
  term ((7344352 : Rat) / 385571) [(0, 3), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 3), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2539520 : Rat) / 158397) [(0, 3), (8, 1), (12, 1), (15, 2)],
  term ((-8895104 : Rat) / 385571) [(0, 3), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (8, 1), (12, 2), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-942080 : Rat) / 158397) [(0, 3), (8, 1), (14, 1), (15, 2)],
  term ((12129152 : Rat) / 385571) [(0, 3), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2996416 : Rat) / 52799) [(0, 3), (8, 1), (15, 2)],
  term ((-20064936 : Rat) / 385571) [(0, 3), (8, 1), (15, 2), (16, 1)],
  term ((9954304 : Rat) / 158397) [(0, 3), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((7636880 : Rat) / 385571) [(0, 3), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25285120 : Rat) / 158397) [(0, 3), (9, 1), (10, 1), (15, 1)],
  term ((-19900712 : Rat) / 385571) [(0, 3), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 400 through 499. -/
theorem rs_R005_ueqv_R005NYN_block_25_0400_0499_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_25_0400_0499
      rs_R005_ueqv_R005NYN_block_25_0400_0499 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
