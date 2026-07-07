/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 29:400-440

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0400 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 400 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0400 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3655680 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)],
  term ((7311360 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7311360 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0400
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0401 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 401 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0401 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4569600 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((9139200 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0401
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0402 : Poly :=
[
  term ((-61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 402 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0402 : Poly :=
[
  term ((-123596800 : Rat) / 36742197) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((61798400 : Rat) / 36742197) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((123596800 : Rat) / 36742197) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-123596800 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((61798400 : Rat) / 36742197) [(11, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0402
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0403 : Poly :=
[
  term ((1057615360 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 403 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0403 : Poly :=
[
  term ((2115230720 : Rat) / 330679773) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1057615360 : Rat) / 330679773) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2115230720 : Rat) / 330679773) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1057615360 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)],
  term ((2115230720 : Rat) / 330679773) [(11, 2), (12, 1), (15, 2)],
  term ((-1057615360 : Rat) / 330679773) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0403
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0404 : Poly :=
[
  term ((33321422347 : Rat) / 10471526145) [(11, 1), (13, 1)]
]

/-- Partial product 404 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0404 : Poly :=
[
  term ((66642844694 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-33321422347 : Rat) / 10471526145) [(10, 2), (11, 1), (13, 1)],
  term ((33321422347 : Rat) / 10471526145) [(11, 1), (13, 1)],
  term ((-66642844694 : Rat) / 10471526145) [(11, 1), (13, 1), (14, 1)],
  term ((66642844694 : Rat) / 10471526145) [(11, 2), (13, 1), (15, 1)],
  term ((-33321422347 : Rat) / 10471526145) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0404
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0405 : Poly :=
[
  term ((-63613760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 405 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0405 : Poly :=
[
  term ((-127227520 : Rat) / 36742197) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((63613760 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-63613760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 1)],
  term ((127227520 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2)],
  term ((-127227520 : Rat) / 36742197) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((63613760 : Rat) / 36742197) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0405
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0406 : Poly :=
[
  term ((-20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 406 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0406 : Poly :=
[
  term ((-40315520 : Rat) / 36742197) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((20157760 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((-20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2)],
  term ((40315520 : Rat) / 36742197) [(11, 1), (13, 1), (14, 3)],
  term ((-40315520 : Rat) / 36742197) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((20157760 : Rat) / 36742197) [(11, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0406
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0407 : Poly :=
[
  term ((-130801600 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 407 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0407 : Poly :=
[
  term ((-261603200 : Rat) / 110226591) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((130801600 : Rat) / 110226591) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((261603200 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-130801600 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)],
  term ((-261603200 : Rat) / 110226591) [(11, 2), (13, 1), (15, 3)],
  term ((130801600 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0407
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0408 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 408 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0408 : Poly :=
[
  term ((7311360 : Rat) / 12247399) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((-7311360 : Rat) / 12247399) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)],
  term ((7311360 : Rat) / 12247399) [(11, 2), (13, 2), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0408
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0409 : Poly :=
[
  term ((7404091466 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 409 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0409 : Poly :=
[
  term ((14808182932 : Rat) / 330679773) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-7404091466 : Rat) / 330679773) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((7404091466 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)],
  term ((-14808182932 : Rat) / 330679773) [(11, 1), (14, 2), (15, 1)],
  term ((14808182932 : Rat) / 330679773) [(11, 2), (14, 1), (15, 2)],
  term ((-7404091466 : Rat) / 330679773) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0409
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0410 : Poly :=
[
  term ((-218159360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 410 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0410 : Poly :=
[
  term ((-436318720 : Rat) / 110226591) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 1)],
  term ((436318720 : Rat) / 110226591) [(11, 1), (14, 3), (15, 1)],
  term ((-436318720 : Rat) / 110226591) [(11, 2), (14, 2), (15, 2)],
  term ((218159360 : Rat) / 110226591) [(11, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0410
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0411 : Poly :=
[
  term ((-24529598036 : Rat) / 31414578435) [(11, 1), (15, 1)]
]

/-- Partial product 411 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0411 : Poly :=
[
  term ((-49059196072 : Rat) / 31414578435) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((24529598036 : Rat) / 31414578435) [(10, 2), (11, 1), (15, 1)],
  term ((49059196072 : Rat) / 31414578435) [(11, 1), (14, 1), (15, 1)],
  term ((-24529598036 : Rat) / 31414578435) [(11, 1), (15, 1)],
  term ((-49059196072 : Rat) / 31414578435) [(11, 2), (15, 2)],
  term ((24529598036 : Rat) / 31414578435) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0411
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0412 : Poly :=
[
  term ((-203536640 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 412 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0412 : Poly :=
[
  term ((-407073280 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((203536640 : Rat) / 110226591) [(10, 2), (11, 1), (15, 3)],
  term ((407073280 : Rat) / 110226591) [(11, 1), (14, 1), (15, 3)],
  term ((-203536640 : Rat) / 110226591) [(11, 1), (15, 3)],
  term ((-407073280 : Rat) / 110226591) [(11, 2), (15, 4)],
  term ((203536640 : Rat) / 110226591) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0412
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0413 : Poly :=
[
  term ((24974072968 : Rat) / 3490508715) [(11, 2)]
]

/-- Partial product 413 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0413 : Poly :=
[
  term ((49948145936 : Rat) / 3490508715) [(10, 1), (11, 2), (14, 1)],
  term ((-24974072968 : Rat) / 3490508715) [(10, 2), (11, 2)],
  term ((24974072968 : Rat) / 3490508715) [(11, 2)],
  term ((-49948145936 : Rat) / 3490508715) [(11, 2), (14, 1)],
  term ((49948145936 : Rat) / 3490508715) [(11, 3), (15, 1)],
  term ((-24974072968 : Rat) / 3490508715) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0413
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0414 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 414 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0414 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((77987840 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1)],
  term ((155975680 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((-155975680 : Rat) / 110226591) [(11, 3), (12, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0414
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0415 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 415 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0415 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-97484800 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(11, 4), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0415
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0416 : Poly :=
[
  term ((-4264960 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 416 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0416 : Poly :=
[
  term ((-8529920 : Rat) / 110226591) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((4264960 : Rat) / 110226591) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((8529920 : Rat) / 110226591) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4264960 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)],
  term ((-8529920 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)],
  term ((4264960 : Rat) / 110226591) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0416_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0416
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0417 : Poly :=
[
  term ((-2214768640 : Rat) / 330679773) [(11, 2), (14, 1)]
]

/-- Partial product 417 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0417 : Poly :=
[
  term ((-4429537280 : Rat) / 330679773) [(10, 1), (11, 2), (14, 2)],
  term ((2214768640 : Rat) / 330679773) [(10, 2), (11, 2), (14, 1)],
  term ((-2214768640 : Rat) / 330679773) [(11, 2), (14, 1)],
  term ((4429537280 : Rat) / 330679773) [(11, 2), (14, 2)],
  term ((-4429537280 : Rat) / 330679773) [(11, 3), (14, 1), (15, 1)],
  term ((2214768640 : Rat) / 330679773) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0417_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0417
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0418 : Poly :=
[
  term ((716800 : Rat) / 231083) [(11, 2), (14, 2)]
]

/-- Partial product 418 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0418 : Poly :=
[
  term ((1433600 : Rat) / 231083) [(10, 1), (11, 2), (14, 3)],
  term ((-716800 : Rat) / 231083) [(10, 2), (11, 2), (14, 2)],
  term ((716800 : Rat) / 231083) [(11, 2), (14, 2)],
  term ((-1433600 : Rat) / 231083) [(11, 2), (14, 3)],
  term ((1433600 : Rat) / 231083) [(11, 3), (14, 2), (15, 1)],
  term ((-716800 : Rat) / 231083) [(11, 4), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0418_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0418
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0419 : Poly :=
[
  term ((517734400 : Rat) / 110226591) [(11, 2), (15, 2)]
]

/-- Partial product 419 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0419 : Poly :=
[
  term ((1035468800 : Rat) / 110226591) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-517734400 : Rat) / 110226591) [(10, 2), (11, 2), (15, 2)],
  term ((-1035468800 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)],
  term ((517734400 : Rat) / 110226591) [(11, 2), (15, 2)],
  term ((1035468800 : Rat) / 110226591) [(11, 3), (15, 3)],
  term ((-517734400 : Rat) / 110226591) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0419_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0419
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0420 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(11, 3), (15, 1)]
]

/-- Partial product 420 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0420 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(10, 2), (11, 3), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(11, 3), (14, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(11, 3), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(11, 4), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0420_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0420
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0421 : Poly :=
[
  term ((18 : Rat) / 67) [(12, 1)]
]

/-- Partial product 421 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0421 : Poly :=
[
  term ((36 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((36 : Rat) / 67) [(11, 1), (12, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(11, 2), (12, 1)],
  term ((18 : Rat) / 67) [(12, 1)],
  term ((-36 : Rat) / 67) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0421_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0421
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0422 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 422 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0422 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4569600 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0422_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0422
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0423 : Poly :=
[
  term ((13228600 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 423 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0423 : Poly :=
[
  term ((26457200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13228600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((26457200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13228600 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-26457200 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((13228600 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0423_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0423
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0424 : Poly :=
[
  term ((-18 : Rat) / 67) [(12, 1), (14, 1)]
]

/-- Partial product 424 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0424 : Poly :=
[
  term ((-36 : Rat) / 67) [(10, 1), (12, 1), (14, 2)],
  term ((18 : Rat) / 67) [(10, 2), (12, 1), (14, 1)],
  term ((-36 : Rat) / 67) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18 : Rat) / 67) [(11, 2), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(12, 1), (14, 1)],
  term ((36 : Rat) / 67) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0424_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0424
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0425 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 425 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0425 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-87910400 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0425_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0425
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0426 : Poly :=
[
  term ((-674639858 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 426 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0426 : Poly :=
[
  term ((-1349279716 : Rat) / 330679773) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((674639858 : Rat) / 330679773) [(10, 2), (12, 1), (15, 2)],
  term ((-1349279716 : Rat) / 330679773) [(11, 1), (12, 1), (15, 3)],
  term ((674639858 : Rat) / 330679773) [(11, 2), (12, 1), (15, 2)],
  term ((1349279716 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((-674639858 : Rat) / 330679773) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0426_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0426
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0427 : Poly :=
[
  term ((170149222 : Rat) / 36742197) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 427 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0427 : Poly :=
[
  term ((340298444 : Rat) / 36742197) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-170149222 : Rat) / 36742197) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((340298444 : Rat) / 36742197) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-170149222 : Rat) / 36742197) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((170149222 : Rat) / 36742197) [(13, 1), (14, 1), (15, 1)],
  term ((-340298444 : Rat) / 36742197) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0427_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0427
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0428 : Poly :=
[
  term ((74217920 : Rat) / 36742197) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 428 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0428 : Poly :=
[
  term ((148435840 : Rat) / 36742197) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((148435840 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-74217920 : Rat) / 36742197) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(13, 1), (14, 2), (15, 1)],
  term ((-148435840 : Rat) / 36742197) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0428_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0428
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0429 : Poly :=
[
  term ((526714177 : Rat) / 220453182) [(13, 1), (15, 1)]
]

/-- Partial product 429 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0429 : Poly :=
[
  term ((526714177 : Rat) / 110226591) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-526714177 : Rat) / 220453182) [(10, 2), (13, 1), (15, 1)],
  term ((526714177 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)],
  term ((-526714177 : Rat) / 220453182) [(11, 2), (13, 1), (15, 1)],
  term ((-526714177 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)],
  term ((526714177 : Rat) / 220453182) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0429_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0429
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0430 : Poly :=
[
  term ((76274240 : Rat) / 36742197) [(13, 1), (15, 3)]
]

/-- Partial product 430 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0430 : Poly :=
[
  term ((152548480 : Rat) / 36742197) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-76274240 : Rat) / 36742197) [(10, 2), (13, 1), (15, 3)],
  term ((152548480 : Rat) / 36742197) [(11, 1), (13, 1), (15, 4)],
  term ((-76274240 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)],
  term ((-152548480 : Rat) / 36742197) [(13, 1), (14, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0430_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0430
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0431 : Poly :=
[
  term ((-8893311 : Rat) / 24494798) [(13, 2)]
]

/-- Partial product 431 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0431 : Poly :=
[
  term ((-8893311 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1)],
  term ((8893311 : Rat) / 24494798) [(10, 2), (13, 2)],
  term ((-8893311 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)],
  term ((8893311 : Rat) / 24494798) [(11, 2), (13, 2)],
  term ((-8893311 : Rat) / 24494798) [(13, 2)],
  term ((8893311 : Rat) / 12247399) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0431_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0431
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0432 : Poly :=
[
  term ((5653620 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 432 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0432 : Poly :=
[
  term ((11307240 : Rat) / 12247399) [(10, 1), (13, 2), (14, 2)],
  term ((-5653620 : Rat) / 12247399) [(10, 2), (13, 2), (14, 1)],
  term ((11307240 : Rat) / 12247399) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-5653620 : Rat) / 12247399) [(11, 2), (13, 2), (14, 1)],
  term ((5653620 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((-11307240 : Rat) / 12247399) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0432_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0432
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0433 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (14, 2)]
]

/-- Partial product 433 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0433 : Poly :=
[
  term ((-19192320 : Rat) / 12247399) [(10, 1), (13, 2), (14, 3)],
  term ((9596160 : Rat) / 12247399) [(10, 2), (13, 2), (14, 2)],
  term ((-19192320 : Rat) / 12247399) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((9596160 : Rat) / 12247399) [(11, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((19192320 : Rat) / 12247399) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0433_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0433
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0434 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 434 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0434 : Poly :=
[
  term ((-19192320 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(10, 2), (13, 2), (15, 2)],
  term ((-19192320 : Rat) / 12247399) [(11, 1), (13, 2), (15, 3)],
  term ((9596160 : Rat) / 12247399) [(11, 2), (13, 2), (15, 2)],
  term ((19192320 : Rat) / 12247399) [(13, 2), (14, 1), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0434_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0434
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0435 : Poly :=
[
  term ((667 : Rat) / 134) [(14, 1)]
]

/-- Partial product 435 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0435 : Poly :=
[
  term ((667 : Rat) / 67) [(10, 1), (14, 2)],
  term ((-667 : Rat) / 134) [(10, 2), (14, 1)],
  term ((667 : Rat) / 67) [(11, 1), (14, 1), (15, 1)],
  term ((-667 : Rat) / 134) [(11, 2), (14, 1)],
  term ((667 : Rat) / 134) [(14, 1)],
  term ((-667 : Rat) / 67) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0435_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0435
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0436 : Poly :=
[
  term ((-1386907760 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 436 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0436 : Poly :=
[
  term ((-2773815520 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((1386907760 : Rat) / 110226591) [(10, 2), (14, 1), (15, 2)],
  term ((-2773815520 : Rat) / 110226591) [(11, 1), (14, 1), (15, 3)],
  term ((1386907760 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)],
  term ((-1386907760 : Rat) / 110226591) [(14, 1), (15, 2)],
  term ((2773815520 : Rat) / 110226591) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0436_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0436
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0437 : Poly :=
[
  term ((-92 : Rat) / 67) [(14, 2)]
]

/-- Partial product 437 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0437 : Poly :=
[
  term ((-184 : Rat) / 67) [(10, 1), (14, 3)],
  term ((92 : Rat) / 67) [(10, 2), (14, 2)],
  term ((-184 : Rat) / 67) [(11, 1), (14, 2), (15, 1)],
  term ((92 : Rat) / 67) [(11, 2), (14, 2)],
  term ((-92 : Rat) / 67) [(14, 2)],
  term ((184 : Rat) / 67) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0437_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0437
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0438 : Poly :=
[
  term ((-81317120 : Rat) / 110226591) [(14, 2), (15, 2)]
]

/-- Partial product 438 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0438 : Poly :=
[
  term ((-162634240 : Rat) / 110226591) [(10, 1), (14, 3), (15, 2)],
  term ((81317120 : Rat) / 110226591) [(10, 2), (14, 2), (15, 2)],
  term ((-162634240 : Rat) / 110226591) [(11, 1), (14, 2), (15, 3)],
  term ((81317120 : Rat) / 110226591) [(11, 2), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(14, 2), (15, 2)],
  term ((162634240 : Rat) / 110226591) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0438_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0438
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0439 : Poly :=
[
  term ((-2839162007 : Rat) / 661359546) [(15, 2)]
]

/-- Partial product 439 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0439 : Poly :=
[
  term ((-2839162007 : Rat) / 330679773) [(10, 1), (14, 1), (15, 2)],
  term ((2839162007 : Rat) / 661359546) [(10, 2), (15, 2)],
  term ((-2839162007 : Rat) / 330679773) [(11, 1), (15, 3)],
  term ((2839162007 : Rat) / 661359546) [(11, 2), (15, 2)],
  term ((2839162007 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((-2839162007 : Rat) / 661359546) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0439_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0439
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0440 : Poly :=
[
  term ((-94503680 : Rat) / 110226591) [(15, 4)]
]

/-- Partial product 440 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0440 : Poly :=
[
  term ((-189007360 : Rat) / 110226591) [(10, 1), (14, 1), (15, 4)],
  term ((94503680 : Rat) / 110226591) [(10, 2), (15, 4)],
  term ((-189007360 : Rat) / 110226591) [(11, 1), (15, 5)],
  term ((94503680 : Rat) / 110226591) [(11, 2), (15, 4)],
  term ((189007360 : Rat) / 110226591) [(14, 1), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0440_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0440
        rs_R009_ueqv_R009NNNYN_generator_29_0400_0440 =
      rs_R009_ueqv_R009NNNYN_partial_29_0440 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_29_0400_0440 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_29_0400,
  rs_R009_ueqv_R009NNNYN_partial_29_0401,
  rs_R009_ueqv_R009NNNYN_partial_29_0402,
  rs_R009_ueqv_R009NNNYN_partial_29_0403,
  rs_R009_ueqv_R009NNNYN_partial_29_0404,
  rs_R009_ueqv_R009NNNYN_partial_29_0405,
  rs_R009_ueqv_R009NNNYN_partial_29_0406,
  rs_R009_ueqv_R009NNNYN_partial_29_0407,
  rs_R009_ueqv_R009NNNYN_partial_29_0408,
  rs_R009_ueqv_R009NNNYN_partial_29_0409,
  rs_R009_ueqv_R009NNNYN_partial_29_0410,
  rs_R009_ueqv_R009NNNYN_partial_29_0411,
  rs_R009_ueqv_R009NNNYN_partial_29_0412,
  rs_R009_ueqv_R009NNNYN_partial_29_0413,
  rs_R009_ueqv_R009NNNYN_partial_29_0414,
  rs_R009_ueqv_R009NNNYN_partial_29_0415,
  rs_R009_ueqv_R009NNNYN_partial_29_0416,
  rs_R009_ueqv_R009NNNYN_partial_29_0417,
  rs_R009_ueqv_R009NNNYN_partial_29_0418,
  rs_R009_ueqv_R009NNNYN_partial_29_0419,
  rs_R009_ueqv_R009NNNYN_partial_29_0420,
  rs_R009_ueqv_R009NNNYN_partial_29_0421,
  rs_R009_ueqv_R009NNNYN_partial_29_0422,
  rs_R009_ueqv_R009NNNYN_partial_29_0423,
  rs_R009_ueqv_R009NNNYN_partial_29_0424,
  rs_R009_ueqv_R009NNNYN_partial_29_0425,
  rs_R009_ueqv_R009NNNYN_partial_29_0426,
  rs_R009_ueqv_R009NNNYN_partial_29_0427,
  rs_R009_ueqv_R009NNNYN_partial_29_0428,
  rs_R009_ueqv_R009NNNYN_partial_29_0429,
  rs_R009_ueqv_R009NNNYN_partial_29_0430,
  rs_R009_ueqv_R009NNNYN_partial_29_0431,
  rs_R009_ueqv_R009NNNYN_partial_29_0432,
  rs_R009_ueqv_R009NNNYN_partial_29_0433,
  rs_R009_ueqv_R009NNNYN_partial_29_0434,
  rs_R009_ueqv_R009NNNYN_partial_29_0435,
  rs_R009_ueqv_R009NNNYN_partial_29_0436,
  rs_R009_ueqv_R009NNNYN_partial_29_0437,
  rs_R009_ueqv_R009NNNYN_partial_29_0438,
  rs_R009_ueqv_R009NNNYN_partial_29_0439,
  rs_R009_ueqv_R009NNNYN_partial_29_0440
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_29_0400_0440 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((2115230720 : Rat) / 330679773) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-123596800 : Rat) / 36742197) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((66642844694 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-261603200 : Rat) / 110226591) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-127227520 : Rat) / 36742197) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-40315520 : Rat) / 36742197) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((7311360 : Rat) / 12247399) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-49059196072 : Rat) / 31414578435) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-407073280 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((14808182932 : Rat) / 330679773) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-436318720 : Rat) / 110226591) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((-155975680 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-8529920 : Rat) / 110226591) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((49948145936 : Rat) / 3490508715) [(10, 1), (11, 2), (14, 1)],
  term ((1035468800 : Rat) / 110226591) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-4429537280 : Rat) / 330679773) [(10, 1), (11, 2), (14, 2)],
  term ((1433600 : Rat) / 231083) [(10, 1), (11, 2), (14, 3)],
  term ((-389939200 : Rat) / 110226591) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((26457200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((36 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((-1349279716 : Rat) / 330679773) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-36 : Rat) / 67) [(10, 1), (12, 1), (14, 2)],
  term ((175820800 : Rat) / 110226591) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((526714177 : Rat) / 110226591) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((152548480 : Rat) / 36742197) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((340298444 : Rat) / 36742197) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((148435840 : Rat) / 36742197) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((-8893311 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1)],
  term ((-19192320 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((11307240 : Rat) / 12247399) [(10, 1), (13, 2), (14, 2)],
  term ((-19192320 : Rat) / 12247399) [(10, 1), (13, 2), (14, 3)],
  term ((-2839162007 : Rat) / 330679773) [(10, 1), (14, 1), (15, 2)],
  term ((-189007360 : Rat) / 110226591) [(10, 1), (14, 1), (15, 4)],
  term ((667 : Rat) / 67) [(10, 1), (14, 2)],
  term ((-2773815520 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((-184 : Rat) / 67) [(10, 1), (14, 3)],
  term ((-162634240 : Rat) / 110226591) [(10, 1), (14, 3), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((61798400 : Rat) / 36742197) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1057615360 : Rat) / 330679773) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-33321422347 : Rat) / 10471526145) [(10, 2), (11, 1), (13, 1)],
  term ((63613760 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((20157760 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((130801600 : Rat) / 110226591) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((-7404091466 : Rat) / 330679773) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((24529598036 : Rat) / 31414578435) [(10, 2), (11, 1), (15, 1)],
  term ((203536640 : Rat) / 110226591) [(10, 2), (11, 1), (15, 3)],
  term ((-24974072968 : Rat) / 3490508715) [(10, 2), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1)],
  term ((-97484800 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1), (14, 1)],
  term ((4264960 : Rat) / 110226591) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((2214768640 : Rat) / 330679773) [(10, 2), (11, 2), (14, 1)],
  term ((-716800 : Rat) / 231083) [(10, 2), (11, 2), (14, 2)],
  term ((-517734400 : Rat) / 110226591) [(10, 2), (11, 2), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(10, 2), (11, 3), (15, 1)],
  term ((-18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13228600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((18 : Rat) / 67) [(10, 2), (12, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((674639858 : Rat) / 330679773) [(10, 2), (12, 1), (15, 2)],
  term ((-170149222 : Rat) / 36742197) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-526714177 : Rat) / 220453182) [(10, 2), (13, 1), (15, 1)],
  term ((-76274240 : Rat) / 36742197) [(10, 2), (13, 1), (15, 3)],
  term ((8893311 : Rat) / 24494798) [(10, 2), (13, 2)],
  term ((-5653620 : Rat) / 12247399) [(10, 2), (13, 2), (14, 1)],
  term ((9596160 : Rat) / 12247399) [(10, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(10, 2), (13, 2), (15, 2)],
  term ((-667 : Rat) / 134) [(10, 2), (14, 1)],
  term ((1386907760 : Rat) / 110226591) [(10, 2), (14, 1), (15, 2)],
  term ((92 : Rat) / 67) [(10, 2), (14, 2)],
  term ((81317120 : Rat) / 110226591) [(10, 2), (14, 2), (15, 2)],
  term ((2839162007 : Rat) / 661359546) [(10, 2), (15, 2)],
  term ((94503680 : Rat) / 110226591) [(10, 2), (15, 4)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)],
  term ((11880960 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9139200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((26457200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2849095004 : Rat) / 330679773) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((123596800 : Rat) / 36742197) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1235294044 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)],
  term ((-1349279716 : Rat) / 330679773) [(11, 1), (12, 1), (15, 3)],
  term ((33321422347 : Rat) / 10471526145) [(11, 1), (13, 1)],
  term ((-84772766294 : Rat) / 10471526145) [(11, 1), (13, 1), (14, 1)],
  term ((1282498532 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((35689920 : Rat) / 12247399) [(11, 1), (13, 1), (14, 2)],
  term ((148435840 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((40315520 : Rat) / 36742197) [(11, 1), (13, 1), (14, 3)],
  term ((131970859 : Rat) / 36742197) [(11, 1), (13, 1), (15, 2)],
  term ((152548480 : Rat) / 36742197) [(11, 1), (13, 1), (15, 4)],
  term ((59640 : Rat) / 182797) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-19192320 : Rat) / 12247399) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-5237631 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)],
  term ((-19192320 : Rat) / 12247399) [(11, 1), (13, 2), (15, 3)],
  term ((15898314131 : Rat) / 468874305) [(11, 1), (14, 1), (15, 1)],
  term ((-262971360 : Rat) / 12247399) [(11, 1), (14, 1), (15, 3)],
  term ((-16370796508 : Rat) / 330679773) [(11, 1), (14, 2), (15, 1)],
  term ((-162634240 : Rat) / 110226591) [(11, 1), (14, 2), (15, 3)],
  term ((436318720 : Rat) / 110226591) [(11, 1), (14, 3), (15, 1)],
  term ((-24529598036 : Rat) / 31414578435) [(11, 1), (15, 1)],
  term ((-3449771927 : Rat) / 330679773) [(11, 1), (15, 3)],
  term ((-189007360 : Rat) / 110226591) [(11, 1), (15, 5)],
  term ((24974072968 : Rat) / 3490508715) [(11, 2)],
  term ((-107600954 : Rat) / 110226591) [(11, 2), (12, 1)],
  term ((13708800 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20539960 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((283073594 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((-458700800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((2789870578 : Rat) / 330679773) [(11, 2), (12, 1), (15, 2)],
  term ((-883600306 : Rat) / 110226591) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-114533440 : Rat) / 36742197) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((82437500173 : Rat) / 20943052290) [(11, 2), (13, 1), (15, 1)],
  term ((-490425920 : Rat) / 110226591) [(11, 2), (13, 1), (15, 3)],
  term ((8893311 : Rat) / 24494798) [(11, 2), (13, 2)],
  term ((-5653620 : Rat) / 12247399) [(11, 2), (13, 2), (14, 1)],
  term ((9596160 : Rat) / 12247399) [(11, 2), (13, 2), (14, 2)],
  term ((16907520 : Rat) / 12247399) [(11, 2), (13, 2), (15, 2)],
  term ((-1632611829883 : Rat) / 62829156870) [(11, 2), (14, 1)],
  term ((15862499812 : Rat) / 330679773) [(11, 2), (14, 1), (15, 2)],
  term ((5909345828 : Rat) / 330679773) [(11, 2), (14, 2)],
  term ((-355001600 : Rat) / 110226591) [(11, 2), (14, 2), (15, 2)],
  term ((-1433600 : Rat) / 231083) [(11, 2), (14, 3)],
  term ((466710606521 : Rat) / 62829156870) [(11, 2), (15, 2)],
  term ((-312569600 : Rat) / 110226591) [(11, 2), (15, 4)],
  term ((3655680 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1), (14, 1)],
  term ((380364800 : Rat) / 110226591) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-1525542400 : Rat) / 330679773) [(11, 3), (12, 1), (15, 1)],
  term ((-33321422347 : Rat) / 10471526145) [(11, 3), (13, 1)],
  term ((63613760 : Rat) / 36742197) [(11, 3), (13, 1), (14, 1)],
  term ((20157760 : Rat) / 36742197) [(11, 3), (13, 1), (14, 2)],
  term ((122271680 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(11, 3), (13, 2), (15, 1)],
  term ((-10663811146 : Rat) / 330679773) [(11, 3), (14, 1), (15, 1)],
  term ((901986560 : Rat) / 110226591) [(11, 3), (14, 2), (15, 1)],
  term ((83699315092 : Rat) / 6282915687) [(11, 3), (15, 1)],
  term ((1239005440 : Rat) / 110226591) [(11, 3), (15, 3)],
  term ((-24974072968 : Rat) / 3490508715) [(11, 4)],
  term ((77987840 : Rat) / 110226591) [(11, 4), (12, 1)],
  term ((-97484800 : Rat) / 110226591) [(11, 4), (12, 1), (14, 1)],
  term ((4264960 : Rat) / 110226591) [(11, 4), (13, 1), (15, 1)],
  term ((2214768640 : Rat) / 330679773) [(11, 4), (14, 1)],
  term ((-716800 : Rat) / 231083) [(11, 4), (14, 2)],
  term ((-907673600 : Rat) / 110226591) [(11, 4), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 5), (15, 1)],
  term ((18 : Rat) / 67) [(12, 1)],
  term ((-31026800 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((13228600 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)],
  term ((-54 : Rat) / 67) [(12, 1), (14, 1)],
  term ((1613010916 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((36 : Rat) / 67) [(12, 1), (14, 2)],
  term ((-175820800 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)],
  term ((-674639858 : Rat) / 330679773) [(12, 1), (15, 2)],
  term ((-16266511 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)],
  term ((-152548480 : Rat) / 36742197) [(13, 1), (14, 1), (15, 3)],
  term ((-88693508 : Rat) / 12247399) [(13, 1), (14, 2), (15, 1)],
  term ((-148435840 : Rat) / 36742197) [(13, 1), (14, 3), (15, 1)],
  term ((526714177 : Rat) / 220453182) [(13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(13, 1), (15, 3)],
  term ((-8893311 : Rat) / 24494798) [(13, 2)],
  term ((14546931 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((19192320 : Rat) / 12247399) [(13, 2), (14, 1), (15, 2)],
  term ((-20903400 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((19192320 : Rat) / 12247399) [(13, 2), (14, 3)],
  term ((-9596160 : Rat) / 12247399) [(13, 2), (15, 2)],
  term ((667 : Rat) / 134) [(14, 1)],
  term ((-1321561273 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((189007360 : Rat) / 110226591) [(14, 1), (15, 4)],
  term ((-759 : Rat) / 67) [(14, 2)],
  term ((2692498400 : Rat) / 110226591) [(14, 2), (15, 2)],
  term ((184 : Rat) / 67) [(14, 3)],
  term ((162634240 : Rat) / 110226591) [(14, 3), (15, 2)],
  term ((-2839162007 : Rat) / 661359546) [(15, 2)],
  term ((-94503680 : Rat) / 110226591) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 400 through 440. -/
theorem rs_R009_ueqv_R009NNNYN_block_29_0400_0440_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_29_0400_0440
      rs_R009_ueqv_R009NNNYN_block_29_0400_0440 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
