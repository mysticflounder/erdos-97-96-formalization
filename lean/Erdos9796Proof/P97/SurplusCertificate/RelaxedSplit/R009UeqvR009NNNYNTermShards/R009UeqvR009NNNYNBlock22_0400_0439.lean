/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 22:400-439

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0400 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 400 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0400 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0400
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0401 : Poly :=
[
  term ((-61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 401 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0401 : Poly :=
[
  term ((123596800 : Rat) / 36742197) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61798400 : Rat) / 36742197) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((123596800 : Rat) / 36742197) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-61798400 : Rat) / 36742197) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0401
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0402 : Poly :=
[
  term ((1116106240 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 402 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0402 : Poly :=
[
  term ((-2232212480 : Rat) / 330679773) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1116106240 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2232212480 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((1116106240 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0402
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0403 : Poly :=
[
  term ((117488608744 : Rat) / 10471526145) [(11, 1), (13, 1)]
]

/-- Partial product 403 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0403 : Poly :=
[
  term ((-234977217488 : Rat) / 10471526145) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((117488608744 : Rat) / 10471526145) [(0, 2), (11, 1), (13, 1)],
  term ((-234977217488 : Rat) / 10471526145) [(1, 1), (11, 2), (13, 1)],
  term ((117488608744 : Rat) / 10471526145) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0403
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0404 : Poly :=
[
  term ((-251464640 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 404 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0404 : Poly :=
[
  term ((502929280 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-251464640 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((502929280 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-251464640 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0404
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0405 : Poly :=
[
  term ((-20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 405 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0405 : Poly :=
[
  term ((40315520 : Rat) / 36742197) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-20157760 : Rat) / 36742197) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((40315520 : Rat) / 36742197) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((-20157760 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0405
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0406 : Poly :=
[
  term ((-130801600 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 406 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0406 : Poly :=
[
  term ((261603200 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-130801600 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((261603200 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-130801600 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0406
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0407 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 407 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0407 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-7311360 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0407
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0408 : Poly :=
[
  term ((7784804426 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 408 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0408 : Poly :=
[
  term ((-15569608852 : Rat) / 330679773) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((7784804426 : Rat) / 330679773) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-15569608852 : Rat) / 330679773) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((7784804426 : Rat) / 330679773) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0408
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0409 : Poly :=
[
  term ((-218159360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 409 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0409 : Poly :=
[
  term ((436318720 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((436318720 : Rat) / 110226591) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(1, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0409
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0410 : Poly :=
[
  term ((-538763056 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 410 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0410 : Poly :=
[
  term ((1077526112 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-538763056 : Rat) / 94243735305) [(0, 2), (11, 1), (15, 1)],
  term ((1077526112 : Rat) / 94243735305) [(1, 1), (11, 2), (15, 1)],
  term ((-538763056 : Rat) / 94243735305) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0410
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0411 : Poly :=
[
  term ((-203536640 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 411 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0411 : Poly :=
[
  term ((407073280 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((-203536640 : Rat) / 110226591) [(0, 2), (11, 1), (15, 3)],
  term ((407073280 : Rat) / 110226591) [(1, 1), (11, 2), (15, 3)],
  term ((-203536640 : Rat) / 110226591) [(1, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0411
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0412 : Poly :=
[
  term ((2469866613272 : Rat) / 94243735305) [(11, 2)]
]

/-- Partial product 412 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0412 : Poly :=
[
  term ((-4939733226544 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2)],
  term ((2469866613272 : Rat) / 94243735305) [(0, 2), (11, 2)],
  term ((-4939733226544 : Rat) / 94243735305) [(1, 1), (11, 3)],
  term ((2469866613272 : Rat) / 94243735305) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0412
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0413 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 413 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0413 : Poly :=
[
  term ((155975680 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1)],
  term ((155975680 : Rat) / 110226591) [(1, 1), (11, 3), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0413
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0414 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 414 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0414 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (11, 3), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0414
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0415 : Poly :=
[
  term ((-4264960 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 415 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0415 : Poly :=
[
  term ((8529920 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4264960 : Rat) / 110226591) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((8529920 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-4264960 : Rat) / 110226591) [(1, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0415
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0416 : Poly :=
[
  term ((-2507223040 : Rat) / 330679773) [(11, 2), (14, 1)]
]

/-- Partial product 416 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0416 : Poly :=
[
  term ((5014446080 : Rat) / 330679773) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-2507223040 : Rat) / 330679773) [(0, 2), (11, 2), (14, 1)],
  term ((5014446080 : Rat) / 330679773) [(1, 1), (11, 3), (14, 1)],
  term ((-2507223040 : Rat) / 330679773) [(1, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0416_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0416
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0417 : Poly :=
[
  term ((716800 : Rat) / 231083) [(11, 2), (14, 2)]
]

/-- Partial product 417 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0417 : Poly :=
[
  term ((-1433600 : Rat) / 231083) [(0, 1), (10, 1), (11, 2), (14, 2)],
  term ((716800 : Rat) / 231083) [(0, 2), (11, 2), (14, 2)],
  term ((-1433600 : Rat) / 231083) [(1, 1), (11, 3), (14, 2)],
  term ((716800 : Rat) / 231083) [(1, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0417_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0417
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0418 : Poly :=
[
  term ((517734400 : Rat) / 110226591) [(11, 2), (15, 2)]
]

/-- Partial product 418 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0418 : Poly :=
[
  term ((-1035468800 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((517734400 : Rat) / 110226591) [(0, 2), (11, 2), (15, 2)],
  term ((-1035468800 : Rat) / 110226591) [(1, 1), (11, 3), (15, 2)],
  term ((517734400 : Rat) / 110226591) [(1, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0418_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0418
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0419 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(11, 3), (15, 1)]
]

/-- Partial product 419 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0419 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(0, 2), (11, 3), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (11, 4), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0419_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0419
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0420 : Poly :=
[
  term ((18 : Rat) / 67) [(12, 1)]
]

/-- Partial product 420 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0420 : Poly :=
[
  term ((-36 : Rat) / 67) [(0, 1), (10, 1), (12, 1)],
  term ((18 : Rat) / 67) [(0, 2), (12, 1)],
  term ((-36 : Rat) / 67) [(1, 1), (11, 1), (12, 1)],
  term ((18 : Rat) / 67) [(1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0420_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0420
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0421 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 421 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0421 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0421_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0421
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0422 : Poly :=
[
  term ((266840 : Rat) / 231083) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 422 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0422 : Poly :=
[
  term ((-533680 : Rat) / 231083) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((266840 : Rat) / 231083) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-533680 : Rat) / 231083) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((266840 : Rat) / 231083) [(1, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0422_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0422
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0423 : Poly :=
[
  term ((-18 : Rat) / 67) [(12, 1), (14, 1)]
]

/-- Partial product 423 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0423 : Poly :=
[
  term ((36 : Rat) / 67) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(0, 2), (12, 1), (14, 1)],
  term ((36 : Rat) / 67) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(1, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0423_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0423
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0424 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 424 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0424 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(1, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0424_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0424
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0425 : Poly :=
[
  term ((-13724266 : Rat) / 6239241) [(12, 1), (15, 2)]
]

/-- Partial product 425 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0425 : Poly :=
[
  term ((27448532 : Rat) / 6239241) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-13724266 : Rat) / 6239241) [(0, 2), (12, 1), (15, 2)],
  term ((27448532 : Rat) / 6239241) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-13724266 : Rat) / 6239241) [(1, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0425_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0425
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0426 : Poly :=
[
  term ((544480306 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 426 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0426 : Poly :=
[
  term ((-1088960612 : Rat) / 110226591) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((544480306 : Rat) / 110226591) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1088960612 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((544480306 : Rat) / 110226591) [(1, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0426_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0426
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0427 : Poly :=
[
  term ((74217920 : Rat) / 36742197) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 427 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0427 : Poly :=
[
  term ((-148435840 : Rat) / 36742197) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-148435840 : Rat) / 36742197) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(1, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0427_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0427
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0428 : Poly :=
[
  term ((2196713893 : Rat) / 220453182) [(13, 1), (15, 1)]
]

/-- Partial product 428 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0428 : Poly :=
[
  term ((-2196713893 : Rat) / 110226591) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((2196713893 : Rat) / 220453182) [(0, 2), (13, 1), (15, 1)],
  term ((-2196713893 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((2196713893 : Rat) / 220453182) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0428_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0428
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0429 : Poly :=
[
  term ((76274240 : Rat) / 36742197) [(13, 1), (15, 3)]
]

/-- Partial product 429 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0429 : Poly :=
[
  term ((-152548480 : Rat) / 36742197) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(0, 2), (13, 1), (15, 3)],
  term ((-152548480 : Rat) / 36742197) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(1, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0429_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0429
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0430 : Poly :=
[
  term ((-8893311 : Rat) / 24494798) [(13, 2)]
]

/-- Partial product 430 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0430 : Poly :=
[
  term ((8893311 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2)],
  term ((-8893311 : Rat) / 24494798) [(0, 2), (13, 2)],
  term ((8893311 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2)],
  term ((-8893311 : Rat) / 24494798) [(1, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0430_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0430
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0431 : Poly :=
[
  term ((4739700 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 431 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0431 : Poly :=
[
  term ((-9479400 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((4739700 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((-9479400 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((4739700 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0431_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0431
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0432 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (14, 2)]
]

/-- Partial product 432 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0432 : Poly :=
[
  term ((19192320 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 2)],
  term ((19192320 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0432_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0432
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0433 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 433 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0433 : Poly :=
[
  term ((19192320 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (15, 2)],
  term ((19192320 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0433_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0433
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0434 : Poly :=
[
  term ((245 : Rat) / 67) [(14, 1)]
]

/-- Partial product 434 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0434 : Poly :=
[
  term ((-490 : Rat) / 67) [(0, 1), (10, 1), (14, 1)],
  term ((245 : Rat) / 67) [(0, 2), (14, 1)],
  term ((-490 : Rat) / 67) [(1, 1), (11, 1), (14, 1)],
  term ((245 : Rat) / 67) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0434_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0434
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0435 : Poly :=
[
  term ((-1422071920 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 435 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0435 : Poly :=
[
  term ((2844143840 : Rat) / 110226591) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1422071920 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((2844143840 : Rat) / 110226591) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1422071920 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0435_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0435
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0436 : Poly :=
[
  term ((-92 : Rat) / 67) [(14, 2)]
]

/-- Partial product 436 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0436 : Poly :=
[
  term ((184 : Rat) / 67) [(0, 1), (10, 1), (14, 2)],
  term ((-92 : Rat) / 67) [(0, 2), (14, 2)],
  term ((184 : Rat) / 67) [(1, 1), (11, 1), (14, 2)],
  term ((-92 : Rat) / 67) [(1, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0436_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0436
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0437 : Poly :=
[
  term ((-81317120 : Rat) / 110226591) [(14, 2), (15, 2)]
]

/-- Partial product 437 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0437 : Poly :=
[
  term ((162634240 : Rat) / 110226591) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(0, 2), (14, 2), (15, 2)],
  term ((162634240 : Rat) / 110226591) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(1, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0437_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0437
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0438 : Poly :=
[
  term ((-13548366535 : Rat) / 661359546) [(15, 2)]
]

/-- Partial product 438 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0438 : Poly :=
[
  term ((13548366535 : Rat) / 330679773) [(0, 1), (10, 1), (15, 2)],
  term ((-13548366535 : Rat) / 661359546) [(0, 2), (15, 2)],
  term ((13548366535 : Rat) / 330679773) [(1, 1), (11, 1), (15, 2)],
  term ((-13548366535 : Rat) / 661359546) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0438_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0438
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNYN_coefficient_22_0439 : Poly :=
[
  term ((-94503680 : Rat) / 110226591) [(15, 4)]
]

/-- Partial product 439 for generator 22. -/
def rs_R009_ueqv_R009NNNYN_partial_22_0439 : Poly :=
[
  term ((189007360 : Rat) / 110226591) [(0, 1), (10, 1), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(0, 2), (15, 4)],
  term ((189007360 : Rat) / 110226591) [(1, 1), (11, 1), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(1, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 22. -/
theorem rs_R009_ueqv_R009NNNYN_partial_22_0439_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_22_0439
        rs_R009_ueqv_R009NNNYN_generator_22_0400_0439 =
      rs_R009_ueqv_R009NNNYN_partial_22_0439 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_22_0400_0439 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_22_0400,
  rs_R009_ueqv_R009NNNYN_partial_22_0401,
  rs_R009_ueqv_R009NNNYN_partial_22_0402,
  rs_R009_ueqv_R009NNNYN_partial_22_0403,
  rs_R009_ueqv_R009NNNYN_partial_22_0404,
  rs_R009_ueqv_R009NNNYN_partial_22_0405,
  rs_R009_ueqv_R009NNNYN_partial_22_0406,
  rs_R009_ueqv_R009NNNYN_partial_22_0407,
  rs_R009_ueqv_R009NNNYN_partial_22_0408,
  rs_R009_ueqv_R009NNNYN_partial_22_0409,
  rs_R009_ueqv_R009NNNYN_partial_22_0410,
  rs_R009_ueqv_R009NNNYN_partial_22_0411,
  rs_R009_ueqv_R009NNNYN_partial_22_0412,
  rs_R009_ueqv_R009NNNYN_partial_22_0413,
  rs_R009_ueqv_R009NNNYN_partial_22_0414,
  rs_R009_ueqv_R009NNNYN_partial_22_0415,
  rs_R009_ueqv_R009NNNYN_partial_22_0416,
  rs_R009_ueqv_R009NNNYN_partial_22_0417,
  rs_R009_ueqv_R009NNNYN_partial_22_0418,
  rs_R009_ueqv_R009NNNYN_partial_22_0419,
  rs_R009_ueqv_R009NNNYN_partial_22_0420,
  rs_R009_ueqv_R009NNNYN_partial_22_0421,
  rs_R009_ueqv_R009NNNYN_partial_22_0422,
  rs_R009_ueqv_R009NNNYN_partial_22_0423,
  rs_R009_ueqv_R009NNNYN_partial_22_0424,
  rs_R009_ueqv_R009NNNYN_partial_22_0425,
  rs_R009_ueqv_R009NNNYN_partial_22_0426,
  rs_R009_ueqv_R009NNNYN_partial_22_0427,
  rs_R009_ueqv_R009NNNYN_partial_22_0428,
  rs_R009_ueqv_R009NNNYN_partial_22_0429,
  rs_R009_ueqv_R009NNNYN_partial_22_0430,
  rs_R009_ueqv_R009NNNYN_partial_22_0431,
  rs_R009_ueqv_R009NNNYN_partial_22_0432,
  rs_R009_ueqv_R009NNNYN_partial_22_0433,
  rs_R009_ueqv_R009NNNYN_partial_22_0434,
  rs_R009_ueqv_R009NNNYN_partial_22_0435,
  rs_R009_ueqv_R009NNNYN_partial_22_0436,
  rs_R009_ueqv_R009NNNYN_partial_22_0437,
  rs_R009_ueqv_R009NNNYN_partial_22_0438,
  rs_R009_ueqv_R009NNNYN_partial_22_0439
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_22_0400_0439 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((123596800 : Rat) / 36742197) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2232212480 : Rat) / 330679773) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-234977217488 : Rat) / 10471526145) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((502929280 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((40315520 : Rat) / 36742197) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((261603200 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-15569608852 : Rat) / 330679773) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((436318720 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((1077526112 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((407073280 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((-4939733226544 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2)],
  term ((155975680 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((8529920 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((5014446080 : Rat) / 330679773) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-1433600 : Rat) / 231083) [(0, 1), (10, 1), (11, 2), (14, 2)],
  term ((-1035468800 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((-36 : Rat) / 67) [(0, 1), (10, 1), (12, 1)],
  term ((9139200 : Rat) / 12247399) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-533680 : Rat) / 231083) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((36 : Rat) / 67) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((27448532 : Rat) / 6239241) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1088960612 : Rat) / 110226591) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-148435840 : Rat) / 36742197) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2196713893 : Rat) / 110226591) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-152548480 : Rat) / 36742197) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term ((8893311 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2)],
  term ((-9479400 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((19192320 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((19192320 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term ((-490 : Rat) / 67) [(0, 1), (10, 1), (14, 1)],
  term ((2844143840 : Rat) / 110226591) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((184 : Rat) / 67) [(0, 1), (10, 1), (14, 2)],
  term ((162634240 : Rat) / 110226591) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((13548366535 : Rat) / 330679773) [(0, 1), (10, 1), (15, 2)],
  term ((189007360 : Rat) / 110226591) [(0, 1), (10, 1), (15, 4)],
  term ((4569600 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-61798400 : Rat) / 36742197) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1116106240 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((117488608744 : Rat) / 10471526145) [(0, 2), (11, 1), (13, 1)],
  term ((-251464640 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-20157760 : Rat) / 36742197) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-130801600 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((7784804426 : Rat) / 330679773) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-538763056 : Rat) / 94243735305) [(0, 2), (11, 1), (15, 1)],
  term ((-203536640 : Rat) / 110226591) [(0, 2), (11, 1), (15, 3)],
  term ((2469866613272 : Rat) / 94243735305) [(0, 2), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((-4264960 : Rat) / 110226591) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2507223040 : Rat) / 330679773) [(0, 2), (11, 2), (14, 1)],
  term ((716800 : Rat) / 231083) [(0, 2), (11, 2), (14, 2)],
  term ((517734400 : Rat) / 110226591) [(0, 2), (11, 2), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(0, 2), (11, 3), (15, 1)],
  term ((18 : Rat) / 67) [(0, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((266840 : Rat) / 231083) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(0, 2), (12, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-13724266 : Rat) / 6239241) [(0, 2), (12, 1), (15, 2)],
  term ((544480306 : Rat) / 110226591) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((2196713893 : Rat) / 220453182) [(0, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(0, 2), (13, 1), (15, 3)],
  term ((-8893311 : Rat) / 24494798) [(0, 2), (13, 2)],
  term ((4739700 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(0, 2), (13, 2), (15, 2)],
  term ((245 : Rat) / 67) [(0, 2), (14, 1)],
  term ((-1422071920 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(0, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(0, 2), (14, 2), (15, 2)],
  term ((-13548366535 : Rat) / 661359546) [(0, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(0, 2), (15, 4)],
  term ((-36 : Rat) / 67) [(1, 1), (11, 1), (12, 1)],
  term ((9139200 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-533680 : Rat) / 231083) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((36 : Rat) / 67) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((27448532 : Rat) / 6239241) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1088960612 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-148435840 : Rat) / 36742197) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2196713893 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-152548480 : Rat) / 36742197) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((8893311 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2)],
  term ((-9479400 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((19192320 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((19192320 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-490 : Rat) / 67) [(1, 1), (11, 1), (14, 1)],
  term ((2844143840 : Rat) / 110226591) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((184 : Rat) / 67) [(1, 1), (11, 1), (14, 2)],
  term ((162634240 : Rat) / 110226591) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((13548366535 : Rat) / 330679773) [(1, 1), (11, 1), (15, 2)],
  term ((189007360 : Rat) / 110226591) [(1, 1), (11, 1), (15, 4)],
  term ((-9139200 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((123596800 : Rat) / 36742197) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-2232212480 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-234977217488 : Rat) / 10471526145) [(1, 1), (11, 2), (13, 1)],
  term ((502929280 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((40315520 : Rat) / 36742197) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((261603200 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-7311360 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-15569608852 : Rat) / 330679773) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((436318720 : Rat) / 110226591) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((1077526112 : Rat) / 94243735305) [(1, 1), (11, 2), (15, 1)],
  term ((407073280 : Rat) / 110226591) [(1, 1), (11, 2), (15, 3)],
  term ((-4939733226544 : Rat) / 94243735305) [(1, 1), (11, 3)],
  term ((155975680 : Rat) / 110226591) [(1, 1), (11, 3), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (11, 3), (12, 1), (14, 1)],
  term ((8529920 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((5014446080 : Rat) / 330679773) [(1, 1), (11, 3), (14, 1)],
  term ((-1433600 : Rat) / 231083) [(1, 1), (11, 3), (14, 2)],
  term ((-1035468800 : Rat) / 110226591) [(1, 1), (11, 3), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (11, 4), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-61798400 : Rat) / 36742197) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1116106240 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((117488608744 : Rat) / 10471526145) [(1, 2), (11, 1), (13, 1)],
  term ((-251464640 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-20157760 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-130801600 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((7784804426 : Rat) / 330679773) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-538763056 : Rat) / 94243735305) [(1, 2), (11, 1), (15, 1)],
  term ((-203536640 : Rat) / 110226591) [(1, 2), (11, 1), (15, 3)],
  term ((2469866613272 : Rat) / 94243735305) [(1, 2), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((-4264960 : Rat) / 110226591) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2507223040 : Rat) / 330679773) [(1, 2), (11, 2), (14, 1)],
  term ((716800 : Rat) / 231083) [(1, 2), (11, 2), (14, 2)],
  term ((517734400 : Rat) / 110226591) [(1, 2), (11, 2), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(1, 2), (11, 3), (15, 1)],
  term ((18 : Rat) / 67) [(1, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((266840 : Rat) / 231083) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(1, 2), (12, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-13724266 : Rat) / 6239241) [(1, 2), (12, 1), (15, 2)],
  term ((544480306 : Rat) / 110226591) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((2196713893 : Rat) / 220453182) [(1, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(1, 2), (13, 1), (15, 3)],
  term ((-8893311 : Rat) / 24494798) [(1, 2), (13, 2)],
  term ((4739700 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(1, 2), (13, 2), (15, 2)],
  term ((245 : Rat) / 67) [(1, 2), (14, 1)],
  term ((-1422071920 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(1, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(1, 2), (14, 2), (15, 2)],
  term ((-13548366535 : Rat) / 661359546) [(1, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(1, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 400 through 439. -/
theorem rs_R009_ueqv_R009NNNYN_block_22_0400_0439_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_22_0400_0439
      rs_R009_ueqv_R009NNNYN_block_22_0400_0439 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
