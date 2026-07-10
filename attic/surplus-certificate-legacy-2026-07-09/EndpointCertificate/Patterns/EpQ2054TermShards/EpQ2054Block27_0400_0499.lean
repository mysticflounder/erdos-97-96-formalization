/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0400 : Poly :=
[
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 400 for generator 27. -/
def ep_Q2_054_partial_27_0400 : Poly :=
[
  term ((-913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((1827617815512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 27. -/
theorem ep_Q2_054_partial_27_0400_valid :
    mulPoly ep_Q2_054_coefficient_27_0400
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0401 : Poly :=
[
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 401 for generator 27. -/
def ep_Q2_054_partial_27_0401 : Poly :=
[
  term ((134229150000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 27. -/
theorem ep_Q2_054_partial_27_0401_valid :
    mulPoly ep_Q2_054_coefficient_27_0401
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0402 : Poly :=
[
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 402 for generator 27. -/
def ep_Q2_054_partial_27_0402 : Poly :=
[
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1)],
  term ((12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 27. -/
theorem ep_Q2_054_partial_27_0402_valid :
    mulPoly ep_Q2_054_coefficient_27_0402
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0403 : Poly :=
[
  term ((-2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 403 for generator 27. -/
def ep_Q2_054_partial_27_0403 : Poly :=
[
  term ((-5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 27. -/
theorem ep_Q2_054_partial_27_0403_valid :
    mulPoly ep_Q2_054_coefficient_27_0403
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0404 : Poly :=
[
  term ((61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 27. -/
def ep_Q2_054_partial_27_0404 : Poly :=
[
  term ((122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 27. -/
theorem ep_Q2_054_partial_27_0404_valid :
    mulPoly ep_Q2_054_coefficient_27_0404
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0405 : Poly :=
[
  term ((-5000577793524 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 405 for generator 27. -/
def ep_Q2_054_partial_27_0405 : Poly :=
[
  term ((5000577793524 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1)],
  term ((-10001155587048 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 27. -/
theorem ep_Q2_054_partial_27_0405_valid :
    mulPoly ep_Q2_054_coefficient_27_0405
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0406 : Poly :=
[
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 406 for generator 27. -/
def ep_Q2_054_partial_27_0406 : Poly :=
[
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 27. -/
theorem ep_Q2_054_partial_27_0406_valid :
    mulPoly ep_Q2_054_coefficient_27_0406
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0407 : Poly :=
[
  term ((2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 407 for generator 27. -/
def ep_Q2_054_partial_27_0407 : Poly :=
[
  term ((-2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 27. -/
theorem ep_Q2_054_partial_27_0407_valid :
    mulPoly ep_Q2_054_coefficient_27_0407
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0408 : Poly :=
[
  term ((-61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 408 for generator 27. -/
def ep_Q2_054_partial_27_0408 : Poly :=
[
  term ((61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 27. -/
theorem ep_Q2_054_partial_27_0408_valid :
    mulPoly ep_Q2_054_coefficient_27_0408
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0409 : Poly :=
[
  term ((-30506625000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 409 for generator 27. -/
def ep_Q2_054_partial_27_0409 : Poly :=
[
  term ((-61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 27. -/
theorem ep_Q2_054_partial_27_0409_valid :
    mulPoly ep_Q2_054_coefficient_27_0409
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0410 : Poly :=
[
  term ((15218575652232 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 410 for generator 27. -/
def ep_Q2_054_partial_27_0410 : Poly :=
[
  term ((30437151304464 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15218575652232 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 27. -/
theorem ep_Q2_054_partial_27_0410_valid :
    mulPoly ep_Q2_054_coefficient_27_0410
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0411 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 27. -/
def ep_Q2_054_partial_27_0411 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 27. -/
theorem ep_Q2_054_partial_27_0411_valid :
    mulPoly ep_Q2_054_coefficient_27_0411
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0412 : Poly :=
[
  term ((-3766449323268 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 412 for generator 27. -/
def ep_Q2_054_partial_27_0412 : Poly :=
[
  term ((3766449323268 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)],
  term ((-7532898646536 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 27. -/
theorem ep_Q2_054_partial_27_0412_valid :
    mulPoly ep_Q2_054_coefficient_27_0412
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0413 : Poly :=
[
  term ((-2523168865512 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 413 for generator 27. -/
def ep_Q2_054_partial_27_0413 : Poly :=
[
  term ((2523168865512 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-5046337731024 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 27. -/
theorem ep_Q2_054_partial_27_0413_valid :
    mulPoly ep_Q2_054_coefficient_27_0413
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0414 : Poly :=
[
  term ((7980646595103 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 414 for generator 27. -/
def ep_Q2_054_partial_27_0414 : Poly :=
[
  term ((15961293190206 : Rat) / 45033486517) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-7980646595103 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 27. -/
theorem ep_Q2_054_partial_27_0414_valid :
    mulPoly ep_Q2_054_coefficient_27_0414
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0415 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 27. -/
def ep_Q2_054_partial_27_0415 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 27. -/
theorem ep_Q2_054_partial_27_0415_valid :
    mulPoly ep_Q2_054_coefficient_27_0415
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0416 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1)]
]

/-- Partial product 416 for generator 27. -/
def ep_Q2_054_partial_27_0416 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 27. -/
theorem ep_Q2_054_partial_27_0416_valid :
    mulPoly ep_Q2_054_coefficient_27_0416
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0417 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

/-- Partial product 417 for generator 27. -/
def ep_Q2_054_partial_27_0417 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 27. -/
theorem ep_Q2_054_partial_27_0417_valid :
    mulPoly ep_Q2_054_coefficient_27_0417
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0418 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 418 for generator 27. -/
def ep_Q2_054_partial_27_0418 : Poly :=
[
  term ((2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 27. -/
theorem ep_Q2_054_partial_27_0418_valid :
    mulPoly ep_Q2_054_coefficient_27_0418
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0419 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 419 for generator 27. -/
def ep_Q2_054_partial_27_0419 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 27. -/
theorem ep_Q2_054_partial_27_0419_valid :
    mulPoly ep_Q2_054_coefficient_27_0419
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0420 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 420 for generator 27. -/
def ep_Q2_054_partial_27_0420 : Poly :=
[
  term ((-2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 27. -/
theorem ep_Q2_054_partial_27_0420_valid :
    mulPoly ep_Q2_054_coefficient_27_0420
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0421 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 421 for generator 27. -/
def ep_Q2_054_partial_27_0421 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 27. -/
theorem ep_Q2_054_partial_27_0421_valid :
    mulPoly ep_Q2_054_coefficient_27_0421
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0422 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 422 for generator 27. -/
def ep_Q2_054_partial_27_0422 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 27. -/
theorem ep_Q2_054_partial_27_0422_valid :
    mulPoly ep_Q2_054_coefficient_27_0422
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0423 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 423 for generator 27. -/
def ep_Q2_054_partial_27_0423 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 27. -/
theorem ep_Q2_054_partial_27_0423_valid :
    mulPoly ep_Q2_054_coefficient_27_0423
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0424 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 424 for generator 27. -/
def ep_Q2_054_partial_27_0424 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 27. -/
theorem ep_Q2_054_partial_27_0424_valid :
    mulPoly ep_Q2_054_coefficient_27_0424
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0425 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 425 for generator 27. -/
def ep_Q2_054_partial_27_0425 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 27. -/
theorem ep_Q2_054_partial_27_0425_valid :
    mulPoly ep_Q2_054_coefficient_27_0425
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0426 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 426 for generator 27. -/
def ep_Q2_054_partial_27_0426 : Poly :=
[
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 27. -/
theorem ep_Q2_054_partial_27_0426_valid :
    mulPoly ep_Q2_054_coefficient_27_0426
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0427 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 427 for generator 27. -/
def ep_Q2_054_partial_27_0427 : Poly :=
[
  term ((14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 27. -/
theorem ep_Q2_054_partial_27_0427_valid :
    mulPoly ep_Q2_054_coefficient_27_0427
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0428 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 428 for generator 27. -/
def ep_Q2_054_partial_27_0428 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 27. -/
theorem ep_Q2_054_partial_27_0428_valid :
    mulPoly ep_Q2_054_coefficient_27_0428
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0429 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 429 for generator 27. -/
def ep_Q2_054_partial_27_0429 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 27. -/
theorem ep_Q2_054_partial_27_0429_valid :
    mulPoly ep_Q2_054_coefficient_27_0429
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0430 : Poly :=
[
  term ((-3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 430 for generator 27. -/
def ep_Q2_054_partial_27_0430 : Poly :=
[
  term ((3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 27. -/
theorem ep_Q2_054_partial_27_0430_valid :
    mulPoly ep_Q2_054_coefficient_27_0430
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0431 : Poly :=
[
  term ((-16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 431 for generator 27. -/
def ep_Q2_054_partial_27_0431 : Poly :=
[
  term ((-32645331737280 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 27. -/
theorem ep_Q2_054_partial_27_0431_valid :
    mulPoly ep_Q2_054_coefficient_27_0431
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0432 : Poly :=
[
  term ((-1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 27. -/
def ep_Q2_054_partial_27_0432 : Poly :=
[
  term ((-2874867252030 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 27. -/
theorem ep_Q2_054_partial_27_0432_valid :
    mulPoly ep_Q2_054_coefficient_27_0432
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0433 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 433 for generator 27. -/
def ep_Q2_054_partial_27_0433 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 27. -/
theorem ep_Q2_054_partial_27_0433_valid :
    mulPoly ep_Q2_054_coefficient_27_0433
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0434 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 434 for generator 27. -/
def ep_Q2_054_partial_27_0434 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 27. -/
theorem ep_Q2_054_partial_27_0434_valid :
    mulPoly ep_Q2_054_coefficient_27_0434
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0435 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 435 for generator 27. -/
def ep_Q2_054_partial_27_0435 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 27. -/
theorem ep_Q2_054_partial_27_0435_valid :
    mulPoly ep_Q2_054_coefficient_27_0435
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0436 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 436 for generator 27. -/
def ep_Q2_054_partial_27_0436 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 27. -/
theorem ep_Q2_054_partial_27_0436_valid :
    mulPoly ep_Q2_054_coefficient_27_0436
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0437 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 437 for generator 27. -/
def ep_Q2_054_partial_27_0437 : Poly :=
[
  term ((-14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 27. -/
theorem ep_Q2_054_partial_27_0437_valid :
    mulPoly ep_Q2_054_coefficient_27_0437
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0438 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 438 for generator 27. -/
def ep_Q2_054_partial_27_0438 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 27. -/
theorem ep_Q2_054_partial_27_0438_valid :
    mulPoly ep_Q2_054_coefficient_27_0438
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0439 : Poly :=
[
  term ((-5440888622880 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 439 for generator 27. -/
def ep_Q2_054_partial_27_0439 : Poly :=
[
  term ((-10881777245760 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 27. -/
theorem ep_Q2_054_partial_27_0439_valid :
    mulPoly ep_Q2_054_coefficient_27_0439
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0440 : Poly :=
[
  term ((4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 440 for generator 27. -/
def ep_Q2_054_partial_27_0440 : Poly :=
[
  term ((9068147704800 : Rat) / 45033486517) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 27. -/
theorem ep_Q2_054_partial_27_0440_valid :
    mulPoly ep_Q2_054_coefficient_27_0440
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0441 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 441 for generator 27. -/
def ep_Q2_054_partial_27_0441 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 27. -/
theorem ep_Q2_054_partial_27_0441_valid :
    mulPoly ep_Q2_054_coefficient_27_0441
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0442 : Poly :=
[
  term ((13602221557200 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 442 for generator 27. -/
def ep_Q2_054_partial_27_0442 : Poly :=
[
  term ((27204443114400 : Rat) / 45033486517) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 27. -/
theorem ep_Q2_054_partial_27_0442_valid :
    mulPoly ep_Q2_054_coefficient_27_0442
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0443 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 27. -/
def ep_Q2_054_partial_27_0443 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 27. -/
theorem ep_Q2_054_partial_27_0443_valid :
    mulPoly ep_Q2_054_coefficient_27_0443
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0444 : Poly :=
[
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 444 for generator 27. -/
def ep_Q2_054_partial_27_0444 : Poly :=
[
  term ((12403430059266 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6201715029633 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 27. -/
theorem ep_Q2_054_partial_27_0444_valid :
    mulPoly ep_Q2_054_coefficient_27_0444
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0445 : Poly :=
[
  term ((-847857119865 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 27. -/
def ep_Q2_054_partial_27_0445 : Poly :=
[
  term ((-1695714239730 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((847857119865 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 27. -/
theorem ep_Q2_054_partial_27_0445_valid :
    mulPoly ep_Q2_054_coefficient_27_0445
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0446 : Poly :=
[
  term ((260472044055 : Rat) / 90066973034) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 446 for generator 27. -/
def ep_Q2_054_partial_27_0446 : Poly :=
[
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 27. -/
theorem ep_Q2_054_partial_27_0446_valid :
    mulPoly ep_Q2_054_coefficient_27_0446
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0447 : Poly :=
[
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 447 for generator 27. -/
def ep_Q2_054_partial_27_0447 : Poly :=
[
  term ((1593060589474 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 27. -/
theorem ep_Q2_054_partial_27_0447_valid :
    mulPoly ep_Q2_054_coefficient_27_0447
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0448 : Poly :=
[
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 27. -/
def ep_Q2_054_partial_27_0448 : Poly :=
[
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 27. -/
theorem ep_Q2_054_partial_27_0448_valid :
    mulPoly ep_Q2_054_coefficient_27_0448
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0449 : Poly :=
[
  term ((3609407137928 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 449 for generator 27. -/
def ep_Q2_054_partial_27_0449 : Poly :=
[
  term ((7218814275856 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3609407137928 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 27. -/
theorem ep_Q2_054_partial_27_0449_valid :
    mulPoly ep_Q2_054_coefficient_27_0449
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0450 : Poly :=
[
  term ((-747099923145 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 450 for generator 27. -/
def ep_Q2_054_partial_27_0450 : Poly :=
[
  term ((-1494199846290 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((747099923145 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 27. -/
theorem ep_Q2_054_partial_27_0450_valid :
    mulPoly ep_Q2_054_coefficient_27_0450
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0451 : Poly :=
[
  term ((-260472044055 : Rat) / 180133946068) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 451 for generator 27. -/
def ep_Q2_054_partial_27_0451 : Poly :=
[
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((260472044055 : Rat) / 180133946068) [(2, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 27. -/
theorem ep_Q2_054_partial_27_0451_valid :
    mulPoly ep_Q2_054_coefficient_27_0451
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0452 : Poly :=
[
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 452 for generator 27. -/
def ep_Q2_054_partial_27_0452 : Poly :=
[
  term ((-1593060589474 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 27. -/
theorem ep_Q2_054_partial_27_0452_valid :
    mulPoly ep_Q2_054_coefficient_27_0452
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0453 : Poly :=
[
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 27. -/
def ep_Q2_054_partial_27_0453 : Poly :=
[
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 27. -/
theorem ep_Q2_054_partial_27_0453_valid :
    mulPoly ep_Q2_054_coefficient_27_0453
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0454 : Poly :=
[
  term ((-3609407137928 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 454 for generator 27. -/
def ep_Q2_054_partial_27_0454 : Poly :=
[
  term ((3609407137928 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7218814275856 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 27. -/
theorem ep_Q2_054_partial_27_0454_valid :
    mulPoly ep_Q2_054_coefficient_27_0454
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0455 : Poly :=
[
  term ((747099923145 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 27. -/
def ep_Q2_054_partial_27_0455 : Poly :=
[
  term ((-747099923145 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1494199846290 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 27. -/
theorem ep_Q2_054_partial_27_0455_valid :
    mulPoly ep_Q2_054_coefficient_27_0455
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0456 : Poly :=
[
  term ((-1694419093221 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 456 for generator 27. -/
def ep_Q2_054_partial_27_0456 : Poly :=
[
  term ((-3388838186442 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((1694419093221 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 27. -/
theorem ep_Q2_054_partial_27_0456_valid :
    mulPoly ep_Q2_054_coefficient_27_0456
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0457 : Poly :=
[
  term ((1268044011255 : Rat) / 90066973034) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 27. -/
def ep_Q2_054_partial_27_0457 : Poly :=
[
  term ((1268044011255 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1268044011255 : Rat) / 90066973034) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 27. -/
theorem ep_Q2_054_partial_27_0457_valid :
    mulPoly ep_Q2_054_coefficient_27_0457
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0458 : Poly :=
[
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 458 for generator 27. -/
def ep_Q2_054_partial_27_0458 : Poly :=
[
  term ((-1041888176220 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 27. -/
theorem ep_Q2_054_partial_27_0458_valid :
    mulPoly ep_Q2_054_coefficient_27_0458
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0459 : Poly :=
[
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 459 for generator 27. -/
def ep_Q2_054_partial_27_0459 : Poly :=
[
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 27. -/
theorem ep_Q2_054_partial_27_0459_valid :
    mulPoly ep_Q2_054_coefficient_27_0459
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0460 : Poly :=
[
  term ((-781416132165 : Rat) / 90066973034) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 460 for generator 27. -/
def ep_Q2_054_partial_27_0460 : Poly :=
[
  term ((-781416132165 : Rat) / 45033486517) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 27. -/
theorem ep_Q2_054_partial_27_0460_valid :
    mulPoly ep_Q2_054_coefficient_27_0460
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0461 : Poly :=
[
  term ((2601997025559 : Rat) / 45033486517) [(2, 1), (12, 1)]
]

/-- Partial product 461 for generator 27. -/
def ep_Q2_054_partial_27_0461 : Poly :=
[
  term ((-2601997025559 : Rat) / 45033486517) [(2, 1), (12, 1)],
  term ((5203994051118 : Rat) / 45033486517) [(2, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 27. -/
theorem ep_Q2_054_partial_27_0461_valid :
    mulPoly ep_Q2_054_coefficient_27_0461
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0462 : Poly :=
[
  term ((320123534152 : Rat) / 45033486517) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 462 for generator 27. -/
def ep_Q2_054_partial_27_0462 : Poly :=
[
  term ((640247068304 : Rat) / 45033486517) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-320123534152 : Rat) / 45033486517) [(2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 27. -/
theorem ep_Q2_054_partial_27_0462_valid :
    mulPoly ep_Q2_054_coefficient_27_0462
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0463 : Poly :=
[
  term ((-260472044055 : Rat) / 180133946068) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 463 for generator 27. -/
def ep_Q2_054_partial_27_0463 : Poly :=
[
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((260472044055 : Rat) / 180133946068) [(2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 27. -/
theorem ep_Q2_054_partial_27_0463_valid :
    mulPoly ep_Q2_054_coefficient_27_0463
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0464 : Poly :=
[
  term ((-320123534152 : Rat) / 45033486517) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 464 for generator 27. -/
def ep_Q2_054_partial_27_0464 : Poly :=
[
  term ((320123534152 : Rat) / 45033486517) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-640247068304 : Rat) / 45033486517) [(2, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 27. -/
theorem ep_Q2_054_partial_27_0464_valid :
    mulPoly ep_Q2_054_coefficient_27_0464
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0465 : Poly :=
[
  term ((-5219108213690 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 465 for generator 27. -/
def ep_Q2_054_partial_27_0465 : Poly :=
[
  term ((-10438216427380 : Rat) / 45033486517) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((5219108213690 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 27. -/
theorem ep_Q2_054_partial_27_0465_valid :
    mulPoly ep_Q2_054_coefficient_27_0465
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0466 : Poly :=
[
  term ((-1322108617803 : Rat) / 90066973034) [(2, 1), (14, 1)]
]

/-- Partial product 466 for generator 27. -/
def ep_Q2_054_partial_27_0466 : Poly :=
[
  term ((1322108617803 : Rat) / 90066973034) [(2, 1), (14, 1)],
  term ((-1322108617803 : Rat) / 45033486517) [(2, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 27. -/
theorem ep_Q2_054_partial_27_0466_valid :
    mulPoly ep_Q2_054_coefficient_27_0466
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0467 : Poly :=
[
  term ((-7528642947302 : Rat) / 45033486517) [(2, 1), (15, 2)]
]

/-- Partial product 467 for generator 27. -/
def ep_Q2_054_partial_27_0467 : Poly :=
[
  term ((-15057285894604 : Rat) / 45033486517) [(2, 1), (14, 1), (15, 2)],
  term ((7528642947302 : Rat) / 45033486517) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 27. -/
theorem ep_Q2_054_partial_27_0467_valid :
    mulPoly ep_Q2_054_coefficient_27_0467
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0468 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 468 for generator 27. -/
def ep_Q2_054_partial_27_0468 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 27. -/
theorem ep_Q2_054_partial_27_0468_valid :
    mulPoly ep_Q2_054_coefficient_27_0468
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0469 : Poly :=
[
  term ((-260472044055 : Rat) / 180133946068) [(2, 1), (16, 1)]
]

/-- Partial product 469 for generator 27. -/
def ep_Q2_054_partial_27_0469 : Poly :=
[
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (14, 1), (16, 1)],
  term ((260472044055 : Rat) / 180133946068) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 27. -/
theorem ep_Q2_054_partial_27_0469_valid :
    mulPoly ep_Q2_054_coefficient_27_0469
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0470 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1)]
]

/-- Partial product 470 for generator 27. -/
def ep_Q2_054_partial_27_0470 : Poly :=
[
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 27. -/
theorem ep_Q2_054_partial_27_0470_valid :
    mulPoly ep_Q2_054_coefficient_27_0470
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0471 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 471 for generator 27. -/
def ep_Q2_054_partial_27_0471 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 27. -/
theorem ep_Q2_054_partial_27_0471_valid :
    mulPoly ep_Q2_054_coefficient_27_0471
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0472 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 472 for generator 27. -/
def ep_Q2_054_partial_27_0472 : Poly :=
[
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 27. -/
theorem ep_Q2_054_partial_27_0472_valid :
    mulPoly ep_Q2_054_coefficient_27_0472
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0473 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 27. -/
def ep_Q2_054_partial_27_0473 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 27. -/
theorem ep_Q2_054_partial_27_0473_valid :
    mulPoly ep_Q2_054_coefficient_27_0473
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0474 : Poly :=
[
  term ((4004405516079 : Rat) / 90066973034) [(3, 1), (7, 1)]
]

/-- Partial product 474 for generator 27. -/
def ep_Q2_054_partial_27_0474 : Poly :=
[
  term ((-4004405516079 : Rat) / 90066973034) [(3, 1), (7, 1)],
  term ((4004405516079 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 27. -/
theorem ep_Q2_054_partial_27_0474_valid :
    mulPoly ep_Q2_054_coefficient_27_0474
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0475 : Poly :=
[
  term ((5676425990658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 475 for generator 27. -/
def ep_Q2_054_partial_27_0475 : Poly :=
[
  term ((-5676425990658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1)],
  term ((11352851981316 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 27. -/
theorem ep_Q2_054_partial_27_0475_valid :
    mulPoly ep_Q2_054_coefficient_27_0475
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0476 : Poly :=
[
  term ((-3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1)]
]

/-- Partial product 476 for generator 27. -/
def ep_Q2_054_partial_27_0476 : Poly :=
[
  term ((3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-6765512503158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 27. -/
theorem ep_Q2_054_partial_27_0476_valid :
    mulPoly ep_Q2_054_coefficient_27_0476
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0477 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 477 for generator 27. -/
def ep_Q2_054_partial_27_0477 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 27. -/
theorem ep_Q2_054_partial_27_0477_valid :
    mulPoly ep_Q2_054_coefficient_27_0477
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0478 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 478 for generator 27. -/
def ep_Q2_054_partial_27_0478 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 27. -/
theorem ep_Q2_054_partial_27_0478_valid :
    mulPoly ep_Q2_054_coefficient_27_0478
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0479 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 479 for generator 27. -/
def ep_Q2_054_partial_27_0479 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 27. -/
theorem ep_Q2_054_partial_27_0479_valid :
    mulPoly ep_Q2_054_coefficient_27_0479
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0480 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 480 for generator 27. -/
def ep_Q2_054_partial_27_0480 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 27. -/
theorem ep_Q2_054_partial_27_0480_valid :
    mulPoly ep_Q2_054_coefficient_27_0480
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0481 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 481 for generator 27. -/
def ep_Q2_054_partial_27_0481 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 27. -/
theorem ep_Q2_054_partial_27_0481_valid :
    mulPoly ep_Q2_054_coefficient_27_0481
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0482 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 482 for generator 27. -/
def ep_Q2_054_partial_27_0482 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 27. -/
theorem ep_Q2_054_partial_27_0482_valid :
    mulPoly ep_Q2_054_coefficient_27_0482
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0483 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 483 for generator 27. -/
def ep_Q2_054_partial_27_0483 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 27. -/
theorem ep_Q2_054_partial_27_0483_valid :
    mulPoly ep_Q2_054_coefficient_27_0483
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0484 : Poly :=
[
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 484 for generator 27. -/
def ep_Q2_054_partial_27_0484 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 27. -/
theorem ep_Q2_054_partial_27_0484_valid :
    mulPoly ep_Q2_054_coefficient_27_0484
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0485 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (12, 1)]
]

/-- Partial product 485 for generator 27. -/
def ep_Q2_054_partial_27_0485 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 27. -/
theorem ep_Q2_054_partial_27_0485_valid :
    mulPoly ep_Q2_054_coefficient_27_0485
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0486 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (14, 1)]
]

/-- Partial product 486 for generator 27. -/
def ep_Q2_054_partial_27_0486 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (14, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 27. -/
theorem ep_Q2_054_partial_27_0486_valid :
    mulPoly ep_Q2_054_coefficient_27_0486
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0487 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 487 for generator 27. -/
def ep_Q2_054_partial_27_0487 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 27. -/
theorem ep_Q2_054_partial_27_0487_valid :
    mulPoly ep_Q2_054_coefficient_27_0487
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0488 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 488 for generator 27. -/
def ep_Q2_054_partial_27_0488 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 27. -/
theorem ep_Q2_054_partial_27_0488_valid :
    mulPoly ep_Q2_054_coefficient_27_0488
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0489 : Poly :=
[
  term ((-64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 489 for generator 27. -/
def ep_Q2_054_partial_27_0489 : Poly :=
[
  term ((64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 27. -/
theorem ep_Q2_054_partial_27_0489_valid :
    mulPoly ep_Q2_054_coefficient_27_0489
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0490 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 490 for generator 27. -/
def ep_Q2_054_partial_27_0490 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 27. -/
theorem ep_Q2_054_partial_27_0490_valid :
    mulPoly ep_Q2_054_coefficient_27_0490
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0491 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 491 for generator 27. -/
def ep_Q2_054_partial_27_0491 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 27. -/
theorem ep_Q2_054_partial_27_0491_valid :
    mulPoly ep_Q2_054_coefficient_27_0491
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0492 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 492 for generator 27. -/
def ep_Q2_054_partial_27_0492 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 27. -/
theorem ep_Q2_054_partial_27_0492_valid :
    mulPoly ep_Q2_054_coefficient_27_0492
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0493 : Poly :=
[
  term ((6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 493 for generator 27. -/
def ep_Q2_054_partial_27_0493 : Poly :=
[
  term ((-6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1)],
  term ((12414491566938 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 27. -/
theorem ep_Q2_054_partial_27_0493_valid :
    mulPoly ep_Q2_054_coefficient_27_0493
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0494 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 494 for generator 27. -/
def ep_Q2_054_partial_27_0494 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 27. -/
theorem ep_Q2_054_partial_27_0494_valid :
    mulPoly ep_Q2_054_coefficient_27_0494
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0495 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 495 for generator 27. -/
def ep_Q2_054_partial_27_0495 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 27. -/
theorem ep_Q2_054_partial_27_0495_valid :
    mulPoly ep_Q2_054_coefficient_27_0495
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0496 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 496 for generator 27. -/
def ep_Q2_054_partial_27_0496 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 27. -/
theorem ep_Q2_054_partial_27_0496_valid :
    mulPoly ep_Q2_054_coefficient_27_0496
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0497 : Poly :=
[
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2)]
]

/-- Partial product 497 for generator 27. -/
def ep_Q2_054_partial_27_0497 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 27. -/
theorem ep_Q2_054_partial_27_0497_valid :
    mulPoly ep_Q2_054_coefficient_27_0497
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0498 : Poly :=
[
  term ((-1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 498 for generator 27. -/
def ep_Q2_054_partial_27_0498 : Poly :=
[
  term ((1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-2568928803012 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 27. -/
theorem ep_Q2_054_partial_27_0498_valid :
    mulPoly ep_Q2_054_coefficient_27_0498
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0499 : Poly :=
[
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 499 for generator 27. -/
def ep_Q2_054_partial_27_0499 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 27. -/
theorem ep_Q2_054_partial_27_0499_valid :
    mulPoly ep_Q2_054_coefficient_27_0499
        ep_Q2_054_generator_27_0400_0499 =
      ep_Q2_054_partial_27_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0400_0499 : List Poly :=
[
  ep_Q2_054_partial_27_0400,
  ep_Q2_054_partial_27_0401,
  ep_Q2_054_partial_27_0402,
  ep_Q2_054_partial_27_0403,
  ep_Q2_054_partial_27_0404,
  ep_Q2_054_partial_27_0405,
  ep_Q2_054_partial_27_0406,
  ep_Q2_054_partial_27_0407,
  ep_Q2_054_partial_27_0408,
  ep_Q2_054_partial_27_0409,
  ep_Q2_054_partial_27_0410,
  ep_Q2_054_partial_27_0411,
  ep_Q2_054_partial_27_0412,
  ep_Q2_054_partial_27_0413,
  ep_Q2_054_partial_27_0414,
  ep_Q2_054_partial_27_0415,
  ep_Q2_054_partial_27_0416,
  ep_Q2_054_partial_27_0417,
  ep_Q2_054_partial_27_0418,
  ep_Q2_054_partial_27_0419,
  ep_Q2_054_partial_27_0420,
  ep_Q2_054_partial_27_0421,
  ep_Q2_054_partial_27_0422,
  ep_Q2_054_partial_27_0423,
  ep_Q2_054_partial_27_0424,
  ep_Q2_054_partial_27_0425,
  ep_Q2_054_partial_27_0426,
  ep_Q2_054_partial_27_0427,
  ep_Q2_054_partial_27_0428,
  ep_Q2_054_partial_27_0429,
  ep_Q2_054_partial_27_0430,
  ep_Q2_054_partial_27_0431,
  ep_Q2_054_partial_27_0432,
  ep_Q2_054_partial_27_0433,
  ep_Q2_054_partial_27_0434,
  ep_Q2_054_partial_27_0435,
  ep_Q2_054_partial_27_0436,
  ep_Q2_054_partial_27_0437,
  ep_Q2_054_partial_27_0438,
  ep_Q2_054_partial_27_0439,
  ep_Q2_054_partial_27_0440,
  ep_Q2_054_partial_27_0441,
  ep_Q2_054_partial_27_0442,
  ep_Q2_054_partial_27_0443,
  ep_Q2_054_partial_27_0444,
  ep_Q2_054_partial_27_0445,
  ep_Q2_054_partial_27_0446,
  ep_Q2_054_partial_27_0447,
  ep_Q2_054_partial_27_0448,
  ep_Q2_054_partial_27_0449,
  ep_Q2_054_partial_27_0450,
  ep_Q2_054_partial_27_0451,
  ep_Q2_054_partial_27_0452,
  ep_Q2_054_partial_27_0453,
  ep_Q2_054_partial_27_0454,
  ep_Q2_054_partial_27_0455,
  ep_Q2_054_partial_27_0456,
  ep_Q2_054_partial_27_0457,
  ep_Q2_054_partial_27_0458,
  ep_Q2_054_partial_27_0459,
  ep_Q2_054_partial_27_0460,
  ep_Q2_054_partial_27_0461,
  ep_Q2_054_partial_27_0462,
  ep_Q2_054_partial_27_0463,
  ep_Q2_054_partial_27_0464,
  ep_Q2_054_partial_27_0465,
  ep_Q2_054_partial_27_0466,
  ep_Q2_054_partial_27_0467,
  ep_Q2_054_partial_27_0468,
  ep_Q2_054_partial_27_0469,
  ep_Q2_054_partial_27_0470,
  ep_Q2_054_partial_27_0471,
  ep_Q2_054_partial_27_0472,
  ep_Q2_054_partial_27_0473,
  ep_Q2_054_partial_27_0474,
  ep_Q2_054_partial_27_0475,
  ep_Q2_054_partial_27_0476,
  ep_Q2_054_partial_27_0477,
  ep_Q2_054_partial_27_0478,
  ep_Q2_054_partial_27_0479,
  ep_Q2_054_partial_27_0480,
  ep_Q2_054_partial_27_0481,
  ep_Q2_054_partial_27_0482,
  ep_Q2_054_partial_27_0483,
  ep_Q2_054_partial_27_0484,
  ep_Q2_054_partial_27_0485,
  ep_Q2_054_partial_27_0486,
  ep_Q2_054_partial_27_0487,
  ep_Q2_054_partial_27_0488,
  ep_Q2_054_partial_27_0489,
  ep_Q2_054_partial_27_0490,
  ep_Q2_054_partial_27_0491,
  ep_Q2_054_partial_27_0492,
  ep_Q2_054_partial_27_0493,
  ep_Q2_054_partial_27_0494,
  ep_Q2_054_partial_27_0495,
  ep_Q2_054_partial_27_0496,
  ep_Q2_054_partial_27_0497,
  ep_Q2_054_partial_27_0498,
  ep_Q2_054_partial_27_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0400_0499 : Poly :=
[
  term ((-913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((1827617815512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((134229150000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1)],
  term ((12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2761120540512 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-61013250000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((5000577793524 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-12762276127560 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((5522241081024 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-122026500000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((30437151304464 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15218575652232 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3766449323268 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)],
  term ((-5009729781024 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-5046337731024 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((15961293190206 : Rat) / 45033486517) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7980646595103 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((768766950000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1)],
  term ((-1537533900000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1), (14, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (15, 2)],
  term ((14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3839665223268 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-32645331737280 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2874867252030 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16322665868640 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((1437433626015 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-14509036327680 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (14, 2), (15, 1)],
  term ((5440888622880 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((27204443114400 : Rat) / 45033486517) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13602221557200 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((12403430059266 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1695714239730 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6201715029633 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((847857119865 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((1593060589474 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7218814275856 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1494199846290 : Rat) / 45033486517) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3609407137928 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2)],
  term ((747099923145 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 180133946068) [(2, 1), (10, 1), (16, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((220568951486 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7218814275856 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((1494199846290 : Rat) / 45033486517) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1694419093221 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1)],
  term ((-1268044011255 : Rat) / 90066973034) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1041888176220 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1041888176220 : Rat) / 45033486517) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(2, 1), (11, 2), (16, 1)],
  term ((-2601997025559 : Rat) / 45033486517) [(2, 1), (12, 1)],
  term ((5203994051118 : Rat) / 45033486517) [(2, 1), (12, 1), (14, 1)],
  term ((640247068304 : Rat) / 45033486517) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-320123534152 : Rat) / 45033486517) [(2, 1), (12, 1), (15, 2)],
  term ((260472044055 : Rat) / 180133946068) [(2, 1), (12, 1), (16, 1)],
  term ((-10118092893228 : Rat) / 45033486517) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-640247068304 : Rat) / 45033486517) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((5219108213690 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1)],
  term ((1322108617803 : Rat) / 90066973034) [(2, 1), (14, 1)],
  term ((-15057285894604 : Rat) / 45033486517) [(2, 1), (14, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-260472044055 : Rat) / 90066973034) [(2, 1), (14, 1), (16, 1)],
  term ((-1322108617803 : Rat) / 45033486517) [(2, 1), (14, 2)],
  term ((7528642947302 : Rat) / 45033486517) [(2, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)],
  term ((260472044055 : Rat) / 180133946068) [(2, 1), (16, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1)],
  term ((1537533900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-25390813573440 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4004405516079 : Rat) / 90066973034) [(3, 1), (7, 1)],
  term ((-5676425990658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1)],
  term ((3382756251579 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-6765512503158 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (14, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (14, 2)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1), (14, 1)],
  term ((11352851981316 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (16, 1)],
  term ((64063912500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-128127825000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-6207245783469 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (14, 1)],
  term ((1284464401506 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-2568928803012 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((12414491566938 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((4004405516079 : Rat) / 45033486517) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 400 through 499. -/
theorem ep_Q2_054_block_27_0400_0499_valid :
    checkProductSumEq ep_Q2_054_partials_27_0400_0499
      ep_Q2_054_block_27_0400_0499 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
