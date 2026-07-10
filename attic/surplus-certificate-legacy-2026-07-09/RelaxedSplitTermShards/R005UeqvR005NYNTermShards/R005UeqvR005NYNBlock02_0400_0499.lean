/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 2:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_02_0400_0499 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0400 : Poly :=
[
  term ((11118880 : Rat) / 385571) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0400 : Poly :=
[
  term ((11118880 : Rat) / 385571) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11118880 : Rat) / 385571) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0400_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0400
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0401 : Poly :=
[
  term ((798720 : Rat) / 52799) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 401 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0401 : Poly :=
[
  term ((798720 : Rat) / 52799) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((798720 : Rat) / 52799) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-798720 : Rat) / 52799) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-798720 : Rat) / 52799) [(3, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0401_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0401
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0402 : Poly :=
[
  term ((-10355040 : Rat) / 385571) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0402 : Poly :=
[
  term ((-10355040 : Rat) / 385571) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10355040 : Rat) / 385571) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((10355040 : Rat) / 385571) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((10355040 : Rat) / 385571) [(3, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0402_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0402
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0403 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 403 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0403 : Poly :=
[
  term ((6348800 : Rat) / 158397) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((6348800 : Rat) / 158397) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (10, 2), (12, 1), (15, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0403_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0403
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0404 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0404 : Poly :=
[
  term ((-22237760 : Rat) / 385571) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22237760 : Rat) / 385571) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0404_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0404
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0405 : Poly :=
[
  term ((-1315360 : Rat) / 52799) [(3, 1), (15, 1)]
]

/-- Partial product 405 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0405 : Poly :=
[
  term ((-1315360 : Rat) / 52799) [(0, 2), (3, 1), (15, 1)],
  term ((-1315360 : Rat) / 52799) [(1, 2), (3, 1), (15, 1)],
  term ((1315360 : Rat) / 52799) [(3, 1), (10, 2), (15, 1)],
  term ((1315360 : Rat) / 52799) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0405_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0405
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0406 : Poly :=
[
  term ((9714996 : Rat) / 385571) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0406 : Poly :=
[
  term ((9714996 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((9714996 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-9714996 : Rat) / 385571) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9714996 : Rat) / 385571) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0406_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0406
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0407 : Poly :=
[
  term ((3174400 : Rat) / 158397) [(3, 1), (15, 3)]
]

/-- Partial product 407 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0407 : Poly :=
[
  term ((3174400 : Rat) / 158397) [(0, 2), (3, 1), (15, 3)],
  term ((3174400 : Rat) / 158397) [(1, 2), (3, 1), (15, 3)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (10, 2), (15, 3)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0407_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0407
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0408 : Poly :=
[
  term ((-11118880 : Rat) / 385571) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 408 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0408 : Poly :=
[
  term ((-11118880 : Rat) / 385571) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((11118880 : Rat) / 385571) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0408_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0408
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0409 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 409 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0409 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0409_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0409
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0410 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0410 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0410_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0410
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0411 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 411 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0411 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (10, 2), (12, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0411_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0411
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0412 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0412 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0412_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0412
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0413 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 413 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0413 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0413_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0413
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0414 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0414 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0414_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0414
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0415 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 415 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0415 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0415_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0415
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0416 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 416 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0416 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0416_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0416
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0417 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 417 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0417 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0417_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0417
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0418 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 418 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0418 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0418_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0418
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0419 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 419 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0419 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0419_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0419
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0420 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0420 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0420_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0420
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0421 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 421 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0421 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0421_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0421
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0422 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0422 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0422_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0422
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0423 : Poly :=
[
  term ((2791040 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 423 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0423 : Poly :=
[
  term ((2791040 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((2791040 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2791040 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-2791040 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0423_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0423
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0424 : Poly :=
[
  term ((150547216 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0424 : Poly :=
[
  term ((150547216 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((150547216 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-150547216 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-150547216 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0424_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0424
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0425 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 425 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0425 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0425_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0425
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0426 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 426 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0426 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0426_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0426
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0427 : Poly :=
[
  term ((1495040 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 427 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0427 : Poly :=
[
  term ((1495040 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((1495040 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-1495040 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-1495040 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0427_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0427
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0428 : Poly :=
[
  term ((-3201648 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0428 : Poly :=
[
  term ((-3201648 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3201648 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3201648 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((3201648 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0428_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0428
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0429 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (15, 3)]
]

/-- Partial product 429 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0429 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 3)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 3)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 3)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0429_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0429
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0430 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 430 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0430 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 3), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0430_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0430
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0431 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 431 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0431 : Poly :=
[
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0431_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0431
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0432 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0432 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0432_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0432
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0433 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 433 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0433 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0433_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0433
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0434 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0434 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0434_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0434
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0435 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 435 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0435 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0435_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0435
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0436 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0436 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0436_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0436
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0437 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 437 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0437 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0437_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0437
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0438 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0438 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0438_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0438
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0439 : Poly :=
[
  term ((-2791040 : Rat) / 158397) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 439 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0439 : Poly :=
[
  term ((-2791040 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-2791040 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((2791040 : Rat) / 158397) [(4, 1), (5, 1), (10, 2), (12, 1), (15, 1)],
  term ((2791040 : Rat) / 158397) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0439_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0439
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0440 : Poly :=
[
  term ((-150547216 : Rat) / 385571) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0440 : Poly :=
[
  term ((-150547216 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-150547216 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((150547216 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((150547216 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0440_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0440
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0441 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 441 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0441 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0441_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0441
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0442 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 442 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0442 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0442_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0442
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0443 : Poly :=
[
  term ((7475200 : Rat) / 52799) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 443 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0443 : Poly :=
[
  term ((7475200 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (15, 1)],
  term ((7475200 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (15, 1)],
  term ((-7475200 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (15, 1)],
  term ((-7475200 : Rat) / 52799) [(4, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0443_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0443
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0444 : Poly :=
[
  term ((-16008240 : Rat) / 385571) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 444 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0444 : Poly :=
[
  term ((-16008240 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-16008240 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((16008240 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((16008240 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0444_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0444
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0445 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (15, 3)]
]

/-- Partial product 445 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0445 : Poly :=
[
  term ((-5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (15, 3)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (15, 3)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (15, 3)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0445_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0445
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0446 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 446 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0446 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (15, 3), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0446_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0446
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0447 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 447 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0447 : Poly :=
[
  term ((-11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0447_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0447
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0448 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0448 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0448_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0448
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0449 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (13, 1), (15, 1)]
]

/-- Partial product 449 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0449 : Poly :=
[
  term ((11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 2), (13, 1), (15, 1)],
  term ((11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 2), (13, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (10, 2), (13, 1), (15, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0449_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0449
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0450 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0450 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0450_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0450
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0451 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 451 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0451 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0451_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0451
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0452 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0452 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0452_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0452
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0453 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 453 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0453 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0453_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0453
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0454 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0454 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0454_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0454
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0455 : Poly :=
[
  term ((-1446800 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 455 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0455 : Poly :=
[
  term ((-1446800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1446800 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((1446800 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((1446800 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0455_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0455
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0456 : Poly :=
[
  term ((15585098 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0456 : Poly :=
[
  term ((15585098 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((15585098 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-15585098 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-15585098 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0456_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0456
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0457 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (15, 3)]
]

/-- Partial product 457 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0457 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 3)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0457_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0457
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0458 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 458 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0458 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0458_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0458
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0459 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 459 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0459 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0459_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0459
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0460 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0460 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0460_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0460
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0461 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 461 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0461 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0461_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0461
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0462 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0462 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0462_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0462
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0463 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 463 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0463 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0463_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0463
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0464 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0464 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0464_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0464
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0465 : Poly :=
[
  term ((-7234000 : Rat) / 158397) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 465 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0465 : Poly :=
[
  term ((-7234000 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((-7234000 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((7234000 : Rat) / 158397) [(4, 1), (7, 1), (10, 2), (15, 1)],
  term ((7234000 : Rat) / 158397) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0465_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0465
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0466 : Poly :=
[
  term ((77925490 : Rat) / 385571) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0466 : Poly :=
[
  term ((77925490 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((77925490 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-77925490 : Rat) / 385571) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-77925490 : Rat) / 385571) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0466_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0466
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0467 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (15, 3)]
]

/-- Partial product 467 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0467 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 3)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 3)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 2), (15, 3)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0467_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0467
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0468 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 468 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0468 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 2), (15, 3), (16, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0468_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0468
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0469 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 469 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0469 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0469_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0469
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0470 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 470 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0470 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0470_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0470
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0471 : Poly :=
[
  term ((-27020032 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 471 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0471 : Poly :=
[
  term ((-27020032 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-27020032 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((27020032 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((27020032 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0471_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0471
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0472 : Poly :=
[
  term ((-70668992 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 472 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0472 : Poly :=
[
  term ((-70668992 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70668992 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((70668992 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((70668992 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0472_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0472
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0473 : Poly :=
[
  term ((-3029824 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 473 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0473 : Poly :=
[
  term ((-3029824 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-3029824 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((3029824 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((3029824 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0473_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0473
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0474 : Poly :=
[
  term ((460252 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 474 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0474 : Poly :=
[
  term ((460252 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((460252 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-460252 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-460252 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0474_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0474
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0475 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (15, 3)]
]

/-- Partial product 475 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0475 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 3)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0475_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0475
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0476 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 476 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0476 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0476_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0476
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0477 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 477 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0477 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0477_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0477
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0478 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0478 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0478_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0478
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0479 : Poly :=
[
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 479 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0479 : Poly :=
[
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0479_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0479
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0480 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 480 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0480 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0480_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0480
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0481 : Poly :=
[
  term ((-532480 : Rat) / 4281) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 481 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0481 : Poly :=
[
  term ((-532480 : Rat) / 4281) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-532480 : Rat) / 4281) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((532480 : Rat) / 4281) [(4, 1), (8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((532480 : Rat) / 4281) [(4, 1), (8, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0481_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0481
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0482 : Poly :=
[
  term ((51350080 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 482 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0482 : Poly :=
[
  term ((51350080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51350080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51350080 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51350080 : Rat) / 385571) [(4, 1), (8, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0482_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0482
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0483 : Poly :=
[
  term ((-1945600 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 483 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0483 : Poly :=
[
  term ((-1945600 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1945600 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((1945600 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((1945600 : Rat) / 52799) [(4, 1), (8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0483_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0483
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0484 : Poly :=
[
  term ((5728800 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0484 : Poly :=
[
  term ((5728800 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5728800 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5728800 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5728800 : Rat) / 385571) [(4, 1), (8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0484_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0484
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0485 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (15, 3)]
]

/-- Partial product 485 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0485 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0485_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0485
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0486 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 486 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0486 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0486_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0486
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0487 : Poly :=
[
  term ((8683520 : Rat) / 158397) [(4, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 487 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0487 : Poly :=
[
  term ((8683520 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((8683520 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-8683520 : Rat) / 158397) [(4, 1), (8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-8683520 : Rat) / 158397) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0487_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0487
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0488 : Poly :=
[
  term ((-24529280 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 488 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0488 : Poly :=
[
  term ((-24529280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24529280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((24529280 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((24529280 : Rat) / 385571) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0488_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0488
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0489 : Poly :=
[
  term ((194560 : Rat) / 52799) [(4, 1), (8, 1), (15, 2)]
]

/-- Partial product 489 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0489 : Poly :=
[
  term ((194560 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (15, 2)],
  term ((194560 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (15, 2)],
  term ((-194560 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (15, 2)],
  term ((-194560 : Rat) / 52799) [(4, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0489_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0489
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0490 : Poly :=
[
  term ((-572880 : Rat) / 385571) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 490 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0490 : Poly :=
[
  term ((-572880 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-572880 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((572880 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((572880 : Rat) / 385571) [(4, 1), (8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0490_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0490
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0491 : Poly :=
[
  term ((778240 : Rat) / 52799) [(4, 1), (8, 1), (15, 4)]
]

/-- Partial product 491 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0491 : Poly :=
[
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (15, 4)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (15, 4)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (15, 4)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0491_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0491
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0492 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(4, 1), (8, 1), (15, 4), (16, 1)]
]

/-- Partial product 492 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0492 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 4), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (15, 4), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (15, 4), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0492_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0492
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0493 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 493 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0493 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0493_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0493
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0494 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0494 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0494_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0494
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0495 : Poly :=
[
  term ((778240 : Rat) / 52799) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 495 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0495 : Poly :=
[
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(4, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(4, 1), (9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0495_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0495
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0496 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 496 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0496 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 1), (9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0496_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0496
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0497 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 497 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0497 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0497_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0497
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0498 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0498 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (9, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0498_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0498
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 2. -/
def rs_R005_ueqv_R005NYN_coefficient_02_0499 : Poly :=
[
  term ((9566464 : Rat) / 52799) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 499 for generator 2. -/
def rs_R005_ueqv_R005NYN_partial_02_0499 : Poly :=
[
  term ((9566464 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((9566464 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-9566464 : Rat) / 52799) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-9566464 : Rat) / 52799) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 2. -/
theorem rs_R005_ueqv_R005NYN_partial_02_0499_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_02_0499
        rs_R005_ueqv_R005NYN_generator_02_0400_0499 =
      rs_R005_ueqv_R005NYN_partial_02_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_02_0400_0499 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_02_0400,
  rs_R005_ueqv_R005NYN_partial_02_0401,
  rs_R005_ueqv_R005NYN_partial_02_0402,
  rs_R005_ueqv_R005NYN_partial_02_0403,
  rs_R005_ueqv_R005NYN_partial_02_0404,
  rs_R005_ueqv_R005NYN_partial_02_0405,
  rs_R005_ueqv_R005NYN_partial_02_0406,
  rs_R005_ueqv_R005NYN_partial_02_0407,
  rs_R005_ueqv_R005NYN_partial_02_0408,
  rs_R005_ueqv_R005NYN_partial_02_0409,
  rs_R005_ueqv_R005NYN_partial_02_0410,
  rs_R005_ueqv_R005NYN_partial_02_0411,
  rs_R005_ueqv_R005NYN_partial_02_0412,
  rs_R005_ueqv_R005NYN_partial_02_0413,
  rs_R005_ueqv_R005NYN_partial_02_0414,
  rs_R005_ueqv_R005NYN_partial_02_0415,
  rs_R005_ueqv_R005NYN_partial_02_0416,
  rs_R005_ueqv_R005NYN_partial_02_0417,
  rs_R005_ueqv_R005NYN_partial_02_0418,
  rs_R005_ueqv_R005NYN_partial_02_0419,
  rs_R005_ueqv_R005NYN_partial_02_0420,
  rs_R005_ueqv_R005NYN_partial_02_0421,
  rs_R005_ueqv_R005NYN_partial_02_0422,
  rs_R005_ueqv_R005NYN_partial_02_0423,
  rs_R005_ueqv_R005NYN_partial_02_0424,
  rs_R005_ueqv_R005NYN_partial_02_0425,
  rs_R005_ueqv_R005NYN_partial_02_0426,
  rs_R005_ueqv_R005NYN_partial_02_0427,
  rs_R005_ueqv_R005NYN_partial_02_0428,
  rs_R005_ueqv_R005NYN_partial_02_0429,
  rs_R005_ueqv_R005NYN_partial_02_0430,
  rs_R005_ueqv_R005NYN_partial_02_0431,
  rs_R005_ueqv_R005NYN_partial_02_0432,
  rs_R005_ueqv_R005NYN_partial_02_0433,
  rs_R005_ueqv_R005NYN_partial_02_0434,
  rs_R005_ueqv_R005NYN_partial_02_0435,
  rs_R005_ueqv_R005NYN_partial_02_0436,
  rs_R005_ueqv_R005NYN_partial_02_0437,
  rs_R005_ueqv_R005NYN_partial_02_0438,
  rs_R005_ueqv_R005NYN_partial_02_0439,
  rs_R005_ueqv_R005NYN_partial_02_0440,
  rs_R005_ueqv_R005NYN_partial_02_0441,
  rs_R005_ueqv_R005NYN_partial_02_0442,
  rs_R005_ueqv_R005NYN_partial_02_0443,
  rs_R005_ueqv_R005NYN_partial_02_0444,
  rs_R005_ueqv_R005NYN_partial_02_0445,
  rs_R005_ueqv_R005NYN_partial_02_0446,
  rs_R005_ueqv_R005NYN_partial_02_0447,
  rs_R005_ueqv_R005NYN_partial_02_0448,
  rs_R005_ueqv_R005NYN_partial_02_0449,
  rs_R005_ueqv_R005NYN_partial_02_0450,
  rs_R005_ueqv_R005NYN_partial_02_0451,
  rs_R005_ueqv_R005NYN_partial_02_0452,
  rs_R005_ueqv_R005NYN_partial_02_0453,
  rs_R005_ueqv_R005NYN_partial_02_0454,
  rs_R005_ueqv_R005NYN_partial_02_0455,
  rs_R005_ueqv_R005NYN_partial_02_0456,
  rs_R005_ueqv_R005NYN_partial_02_0457,
  rs_R005_ueqv_R005NYN_partial_02_0458,
  rs_R005_ueqv_R005NYN_partial_02_0459,
  rs_R005_ueqv_R005NYN_partial_02_0460,
  rs_R005_ueqv_R005NYN_partial_02_0461,
  rs_R005_ueqv_R005NYN_partial_02_0462,
  rs_R005_ueqv_R005NYN_partial_02_0463,
  rs_R005_ueqv_R005NYN_partial_02_0464,
  rs_R005_ueqv_R005NYN_partial_02_0465,
  rs_R005_ueqv_R005NYN_partial_02_0466,
  rs_R005_ueqv_R005NYN_partial_02_0467,
  rs_R005_ueqv_R005NYN_partial_02_0468,
  rs_R005_ueqv_R005NYN_partial_02_0469,
  rs_R005_ueqv_R005NYN_partial_02_0470,
  rs_R005_ueqv_R005NYN_partial_02_0471,
  rs_R005_ueqv_R005NYN_partial_02_0472,
  rs_R005_ueqv_R005NYN_partial_02_0473,
  rs_R005_ueqv_R005NYN_partial_02_0474,
  rs_R005_ueqv_R005NYN_partial_02_0475,
  rs_R005_ueqv_R005NYN_partial_02_0476,
  rs_R005_ueqv_R005NYN_partial_02_0477,
  rs_R005_ueqv_R005NYN_partial_02_0478,
  rs_R005_ueqv_R005NYN_partial_02_0479,
  rs_R005_ueqv_R005NYN_partial_02_0480,
  rs_R005_ueqv_R005NYN_partial_02_0481,
  rs_R005_ueqv_R005NYN_partial_02_0482,
  rs_R005_ueqv_R005NYN_partial_02_0483,
  rs_R005_ueqv_R005NYN_partial_02_0484,
  rs_R005_ueqv_R005NYN_partial_02_0485,
  rs_R005_ueqv_R005NYN_partial_02_0486,
  rs_R005_ueqv_R005NYN_partial_02_0487,
  rs_R005_ueqv_R005NYN_partial_02_0488,
  rs_R005_ueqv_R005NYN_partial_02_0489,
  rs_R005_ueqv_R005NYN_partial_02_0490,
  rs_R005_ueqv_R005NYN_partial_02_0491,
  rs_R005_ueqv_R005NYN_partial_02_0492,
  rs_R005_ueqv_R005NYN_partial_02_0493,
  rs_R005_ueqv_R005NYN_partial_02_0494,
  rs_R005_ueqv_R005NYN_partial_02_0495,
  rs_R005_ueqv_R005NYN_partial_02_0496,
  rs_R005_ueqv_R005NYN_partial_02_0497,
  rs_R005_ueqv_R005NYN_partial_02_0498,
  rs_R005_ueqv_R005NYN_partial_02_0499
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_02_0400_0499 : Poly :=
[
  term ((11118880 : Rat) / 385571) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((798720 : Rat) / 52799) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-10355040 : Rat) / 385571) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1315360 : Rat) / 52799) [(0, 2), (3, 1), (15, 1)],
  term ((9714996 : Rat) / 385571) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(0, 2), (3, 1), (15, 3)],
  term ((-11118880 : Rat) / 385571) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2791040 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((150547216 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1495040 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-3201648 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 3)],
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (8, 1), (15, 3), (16, 1)],
  term ((5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2791040 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-150547216 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((7475200 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (15, 1)],
  term ((-16008240 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(0, 2), (4, 1), (5, 1), (15, 3)],
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(0, 2), (4, 1), (5, 2), (13, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(0, 2), (4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1446800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((15585098 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7234000 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((77925490 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 3)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27020032 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-70668992 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3029824 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((460252 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 4281) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((51350080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1945600 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((5728800 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((8683520 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-24529280 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((194560 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (15, 2)],
  term ((-572880 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (15, 4)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (15, 4), (16, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((9566464 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((11118880 : Rat) / 385571) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((798720 : Rat) / 52799) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-10355040 : Rat) / 385571) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((6348800 : Rat) / 158397) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-22237760 : Rat) / 385571) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1315360 : Rat) / 52799) [(1, 2), (3, 1), (15, 1)],
  term ((9714996 : Rat) / 385571) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((3174400 : Rat) / 158397) [(1, 2), (3, 1), (15, 3)],
  term ((-11118880 : Rat) / 385571) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2791040 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((150547216 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1495040 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-3201648 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 3)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (8, 1), (15, 3), (16, 1)],
  term ((5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2791040 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-150547216 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((7475200 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (15, 1)],
  term ((-16008240 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(1, 2), (4, 1), (5, 1), (15, 3)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(1, 2), (4, 1), (5, 2), (13, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(1, 2), (4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1446800 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((15585098 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7234000 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((77925490 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 3)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27020032 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-70668992 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3029824 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((460252 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 4281) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((51350080 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1945600 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((5728800 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((8683520 : Rat) / 158397) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-24529280 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((194560 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (15, 2)],
  term ((-572880 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (8, 1), (15, 4)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (8, 1), (15, 4), (16, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((9566464 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11118880 : Rat) / 385571) [(3, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-798720 : Rat) / 52799) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((10355040 : Rat) / 385571) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (10, 2), (12, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1315360 : Rat) / 52799) [(3, 1), (10, 2), (15, 1)],
  term ((-9714996 : Rat) / 385571) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (10, 2), (15, 3)],
  term ((11118880 : Rat) / 385571) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((-798720 : Rat) / 52799) [(3, 1), (10, 3), (15, 1)],
  term ((10355040 : Rat) / 385571) [(3, 1), (10, 3), (15, 1), (16, 1)],
  term ((-6348800 : Rat) / 158397) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((22237760 : Rat) / 385571) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1315360 : Rat) / 52799) [(3, 1), (11, 2), (15, 1)],
  term ((-9714996 : Rat) / 385571) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3174400 : Rat) / 158397) [(3, 1), (11, 2), (15, 3)],
  term ((11118880 : Rat) / 385571) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (10, 2), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(4, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(4, 1), (5, 1), (6, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2791040 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-150547216 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1495040 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 1)],
  term ((3201648 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 3)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (10, 3), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (10, 3), (15, 1), (16, 1)],
  term ((-2791040 : Rat) / 158397) [(4, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-150547216 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1495040 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((3201648 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 3)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 2), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (5, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (5, 1), (8, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5980160 : Rat) / 52799) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1)],
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2791040 : Rat) / 158397) [(4, 1), (5, 1), (10, 2), (12, 1), (15, 1)],
  term ((150547216 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7475200 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (15, 1)],
  term ((16008240 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 2), (15, 3)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 2), (15, 3), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (10, 3), (15, 1)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (10, 3), (15, 1), (16, 1)],
  term ((2791040 : Rat) / 158397) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((150547216 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7475200 : Rat) / 52799) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((16008240 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((5980160 : Rat) / 52799) [(4, 1), (5, 1), (11, 2), (15, 3)],
  term ((-12806592 : Rat) / 385571) [(4, 1), (5, 1), (11, 2), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(4, 1), (5, 1), (11, 3), (13, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(4, 1), (5, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((11960320 : Rat) / 52799) [(4, 1), (5, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 2), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (10, 2), (13, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11960320 : Rat) / 52799) [(4, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((25613184 : Rat) / 385571) [(4, 1), (5, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1446800 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-15585098 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 3)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 2), (15, 3), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (10, 3), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (10, 3), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1446800 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-15585098 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 3)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 3), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (9, 1), (11, 3), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((7234000 : Rat) / 158397) [(4, 1), (7, 1), (10, 2), (15, 1)],
  term ((-77925490 : Rat) / 385571) [(4, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 2), (15, 3)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 3), (15, 1)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((7234000 : Rat) / 158397) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-77925490 : Rat) / 385571) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (11, 2), (15, 3)],
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (11, 2), (15, 3), (16, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((27020032 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((70668992 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3029824 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-460252 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 3)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 2), (15, 3), (16, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (10, 3), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((27020032 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((70668992 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3029824 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-460252 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 3)],
  term ((-1841008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 1), (11, 3), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((532480 : Rat) / 4281) [(4, 1), (8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-51350080 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1945600 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-5728800 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-8683520 : Rat) / 158397) [(4, 1), (8, 1), (10, 2), (12, 1), (15, 2)],
  term ((24529280 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-194560 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (15, 2)],
  term ((572880 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 2), (15, 4)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 2), (15, 4), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (10, 3), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (10, 3), (15, 2)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (10, 3), (15, 2), (16, 1)],
  term ((-8683520 : Rat) / 158397) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((24529280 : Rat) / 385571) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-194560 : Rat) / 52799) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((572880 : Rat) / 385571) [(4, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (8, 1), (11, 2), (15, 4)],
  term ((2291520 : Rat) / 385571) [(4, 1), (8, 1), (11, 2), (15, 4), (16, 1)],
  term ((532480 : Rat) / 4281) [(4, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-51350080 : Rat) / 385571) [(4, 1), (8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((1945600 : Rat) / 52799) [(4, 1), (8, 1), (11, 3), (15, 1)],
  term ((-5728800 : Rat) / 385571) [(4, 1), (8, 1), (11, 3), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (11, 3), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (11, 3), (15, 3), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(4, 1), (9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (9, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-9566464 : Rat) / 52799) [(4, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(4, 1), (9, 1), (10, 3), (15, 1)],
  term ((1841008 : Rat) / 385571) [(4, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-9566464 : Rat) / 52799) [(4, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(4, 1), (9, 1), (11, 3), (15, 2)],
  term ((2291520 : Rat) / 385571) [(4, 1), (9, 1), (11, 3), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (9, 1), (11, 4), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (9, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 400 through 499. -/
theorem rs_R005_ueqv_R005NYN_block_02_0400_0499_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_02_0400_0499
      rs_R005_ueqv_R005NYN_block_02_0400_0499 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
