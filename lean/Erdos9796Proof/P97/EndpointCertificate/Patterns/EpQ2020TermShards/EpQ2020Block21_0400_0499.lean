/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 21:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_21_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0400 : Poly :=
[
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 400 for generator 21. -/
def ep_Q2_020_partial_21_0400 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 21. -/
theorem ep_Q2_020_partial_21_0400_valid :
    mulPoly ep_Q2_020_coefficient_21_0400
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0401 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 21. -/
def ep_Q2_020_partial_21_0401 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 21. -/
theorem ep_Q2_020_partial_21_0401_valid :
    mulPoly ep_Q2_020_coefficient_21_0401
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0402 : Poly :=
[
  term ((-3463212780521208 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 21. -/
def ep_Q2_020_partial_21_0402 : Poly :=
[
  term ((-6926425561042416 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 21. -/
theorem ep_Q2_020_partial_21_0402_valid :
    mulPoly ep_Q2_020_coefficient_21_0402
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0403 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 21. -/
def ep_Q2_020_partial_21_0403 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 21. -/
theorem ep_Q2_020_partial_21_0403_valid :
    mulPoly ep_Q2_020_coefficient_21_0403
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0404 : Poly :=
[
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 404 for generator 21. -/
def ep_Q2_020_partial_21_0404 : Poly :=
[
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 21. -/
theorem ep_Q2_020_partial_21_0404_valid :
    mulPoly ep_Q2_020_coefficient_21_0404
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0405 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 405 for generator 21. -/
def ep_Q2_020_partial_21_0405 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 21. -/
theorem ep_Q2_020_partial_21_0405_valid :
    mulPoly ep_Q2_020_coefficient_21_0405
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0406 : Poly :=
[
  term ((-58531843759687848 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 406 for generator 21. -/
def ep_Q2_020_partial_21_0406 : Poly :=
[
  term ((58531843759687848 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-117063687519375696 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 21. -/
theorem ep_Q2_020_partial_21_0406_valid :
    mulPoly ep_Q2_020_coefficient_21_0406
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0407 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 21. -/
def ep_Q2_020_partial_21_0407 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 21. -/
theorem ep_Q2_020_partial_21_0407_valid :
    mulPoly ep_Q2_020_coefficient_21_0407
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0408 : Poly :=
[
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 21. -/
def ep_Q2_020_partial_21_0408 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 21. -/
theorem ep_Q2_020_partial_21_0408_valid :
    mulPoly ep_Q2_020_coefficient_21_0408
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0409 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 409 for generator 21. -/
def ep_Q2_020_partial_21_0409 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 21. -/
theorem ep_Q2_020_partial_21_0409_valid :
    mulPoly ep_Q2_020_coefficient_21_0409
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0410 : Poly :=
[
  term ((213264786198298017 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 410 for generator 21. -/
def ep_Q2_020_partial_21_0410 : Poly :=
[
  term ((426529572396596034 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-213264786198298017 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 21. -/
theorem ep_Q2_020_partial_21_0410_valid :
    mulPoly ep_Q2_020_coefficient_21_0410
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0411 : Poly :=
[
  term ((17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 411 for generator 21. -/
def ep_Q2_020_partial_21_0411 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 21. -/
theorem ep_Q2_020_partial_21_0411_valid :
    mulPoly ep_Q2_020_coefficient_21_0411
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0412 : Poly :=
[
  term ((-17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 412 for generator 21. -/
def ep_Q2_020_partial_21_0412 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 21. -/
theorem ep_Q2_020_partial_21_0412_valid :
    mulPoly ep_Q2_020_coefficient_21_0412
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0413 : Poly :=
[
  term ((-29265921879843924 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 413 for generator 21. -/
def ep_Q2_020_partial_21_0413 : Poly :=
[
  term ((-58531843759687848 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((29265921879843924 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 21. -/
theorem ep_Q2_020_partial_21_0413_valid :
    mulPoly ep_Q2_020_coefficient_21_0413
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0414 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 21. -/
def ep_Q2_020_partial_21_0414 : Poly :=
[
  term ((46176170406949440 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 21. -/
theorem ep_Q2_020_partial_21_0414_valid :
    mulPoly ep_Q2_020_coefficient_21_0414
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0415 : Poly :=
[
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 415 for generator 21. -/
def ep_Q2_020_partial_21_0415 : Poly :=
[
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 21. -/
theorem ep_Q2_020_partial_21_0415_valid :
    mulPoly ep_Q2_020_coefficient_21_0415
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0416 : Poly :=
[
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 416 for generator 21. -/
def ep_Q2_020_partial_21_0416 : Poly :=
[
  term ((-46176170406949440 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 21. -/
theorem ep_Q2_020_partial_21_0416_valid :
    mulPoly ep_Q2_020_coefficient_21_0416
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0417 : Poly :=
[
  term ((47041973602079742 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 417 for generator 21. -/
def ep_Q2_020_partial_21_0417 : Poly :=
[
  term ((94083947204159484 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-47041973602079742 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 21. -/
theorem ep_Q2_020_partial_21_0417_valid :
    mulPoly ep_Q2_020_coefficient_21_0417
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0418 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 418 for generator 21. -/
def ep_Q2_020_partial_21_0418 : Poly :=
[
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 21. -/
theorem ep_Q2_020_partial_21_0418_valid :
    mulPoly ep_Q2_020_coefficient_21_0418
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0419 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 21. -/
def ep_Q2_020_partial_21_0419 : Poly :=
[
  term ((-171490471718940000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 21. -/
theorem ep_Q2_020_partial_21_0419_valid :
    mulPoly ep_Q2_020_coefficient_21_0419
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0420 : Poly :=
[
  term ((-9235234081389888 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 420 for generator 21. -/
def ep_Q2_020_partial_21_0420 : Poly :=
[
  term ((-18470468162779776 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((9235234081389888 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 21. -/
theorem ep_Q2_020_partial_21_0420_valid :
    mulPoly ep_Q2_020_coefficient_21_0420
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0421 : Poly :=
[
  term ((-104354694771528960 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 421 for generator 21. -/
def ep_Q2_020_partial_21_0421 : Poly :=
[
  term ((-208709389543057920 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((104354694771528960 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 21. -/
theorem ep_Q2_020_partial_21_0421_valid :
    mulPoly ep_Q2_020_coefficient_21_0421
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0422 : Poly :=
[
  term ((362513084493198960 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 422 for generator 21. -/
def ep_Q2_020_partial_21_0422 : Poly :=
[
  term ((725026168986397920 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-362513084493198960 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 21. -/
theorem ep_Q2_020_partial_21_0422_valid :
    mulPoly ep_Q2_020_coefficient_21_0422
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0423 : Poly :=
[
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 21. -/
def ep_Q2_020_partial_21_0423 : Poly :=
[
  term ((1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 21. -/
theorem ep_Q2_020_partial_21_0423_valid :
    mulPoly ep_Q2_020_coefficient_21_0423
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0424 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 424 for generator 21. -/
def ep_Q2_020_partial_21_0424 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 21. -/
theorem ep_Q2_020_partial_21_0424_valid :
    mulPoly ep_Q2_020_coefficient_21_0424
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0425 : Poly :=
[
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 425 for generator 21. -/
def ep_Q2_020_partial_21_0425 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 21. -/
theorem ep_Q2_020_partial_21_0425_valid :
    mulPoly ep_Q2_020_coefficient_21_0425
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0426 : Poly :=
[
  term ((10389638341563624 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 21. -/
def ep_Q2_020_partial_21_0426 : Poly :=
[
  term ((20779276683127248 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10389638341563624 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 21. -/
theorem ep_Q2_020_partial_21_0426_valid :
    mulPoly ep_Q2_020_coefficient_21_0426
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0427 : Poly :=
[
  term ((-415049379376253829 : Rat) / 56596790034801622) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 21. -/
def ep_Q2_020_partial_21_0427 : Poly :=
[
  term ((-415049379376253829 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((415049379376253829 : Rat) / 56596790034801622) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 21. -/
theorem ep_Q2_020_partial_21_0427_valid :
    mulPoly ep_Q2_020_coefficient_21_0427
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0428 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 428 for generator 21. -/
def ep_Q2_020_partial_21_0428 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 21. -/
theorem ep_Q2_020_partial_21_0428_valid :
    mulPoly ep_Q2_020_coefficient_21_0428
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0429 : Poly :=
[
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 21. -/
def ep_Q2_020_partial_21_0429 : Poly :=
[
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 21. -/
theorem ep_Q2_020_partial_21_0429_valid :
    mulPoly ep_Q2_020_coefficient_21_0429
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0430 : Poly :=
[
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 430 for generator 21. -/
def ep_Q2_020_partial_21_0430 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 21. -/
theorem ep_Q2_020_partial_21_0430_valid :
    mulPoly ep_Q2_020_coefficient_21_0430
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0431 : Poly :=
[
  term ((2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 431 for generator 21. -/
def ep_Q2_020_partial_21_0431 : Poly :=
[
  term ((-2886010650434340 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 21. -/
theorem ep_Q2_020_partial_21_0431_valid :
    mulPoly ep_Q2_020_coefficient_21_0431
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0432 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 432 for generator 21. -/
def ep_Q2_020_partial_21_0432 : Poly :=
[
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 21. -/
theorem ep_Q2_020_partial_21_0432_valid :
    mulPoly ep_Q2_020_coefficient_21_0432
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0433 : Poly :=
[
  term ((-359338472777721186 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 433 for generator 21. -/
def ep_Q2_020_partial_21_0433 : Poly :=
[
  term ((359338472777721186 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-718676945555442372 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 21. -/
theorem ep_Q2_020_partial_21_0433_valid :
    mulPoly ep_Q2_020_coefficient_21_0433
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0434 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 434 for generator 21. -/
def ep_Q2_020_partial_21_0434 : Poly :=
[
  term ((171490471718940000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 21. -/
theorem ep_Q2_020_partial_21_0434_valid :
    mulPoly ep_Q2_020_coefficient_21_0434
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0435 : Poly :=
[
  term ((92810652169791600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 21. -/
def ep_Q2_020_partial_21_0435 : Poly :=
[
  term ((185621304339583200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92810652169791600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 21. -/
theorem ep_Q2_020_partial_21_0435_valid :
    mulPoly ep_Q2_020_coefficient_21_0435
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0436 : Poly :=
[
  term ((-6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 21. -/
def ep_Q2_020_partial_21_0436 : Poly :=
[
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 21. -/
theorem ep_Q2_020_partial_21_0436_valid :
    mulPoly ep_Q2_020_coefficient_21_0436
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0437 : Poly :=
[
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 437 for generator 21. -/
def ep_Q2_020_partial_21_0437 : Poly :=
[
  term ((25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 21. -/
theorem ep_Q2_020_partial_21_0437_valid :
    mulPoly ep_Q2_020_coefficient_21_0437
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0438 : Poly :=
[
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 438 for generator 21. -/
def ep_Q2_020_partial_21_0438 : Poly :=
[
  term ((-1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 21. -/
theorem ep_Q2_020_partial_21_0438_valid :
    mulPoly ep_Q2_020_coefficient_21_0438
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0439 : Poly :=
[
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 439 for generator 21. -/
def ep_Q2_020_partial_21_0439 : Poly :=
[
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 21. -/
theorem ep_Q2_020_partial_21_0439_valid :
    mulPoly ep_Q2_020_coefficient_21_0439
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0440 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 21. -/
def ep_Q2_020_partial_21_0440 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 21. -/
theorem ep_Q2_020_partial_21_0440_valid :
    mulPoly ep_Q2_020_coefficient_21_0440
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0441 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 441 for generator 21. -/
def ep_Q2_020_partial_21_0441 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 21. -/
theorem ep_Q2_020_partial_21_0441_valid :
    mulPoly ep_Q2_020_coefficient_21_0441
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0442 : Poly :=
[
  term ((251891417021718057 : Rat) / 56596790034801622) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 442 for generator 21. -/
def ep_Q2_020_partial_21_0442 : Poly :=
[
  term ((251891417021718057 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-251891417021718057 : Rat) / 56596790034801622) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 21. -/
theorem ep_Q2_020_partial_21_0442_valid :
    mulPoly ep_Q2_020_coefficient_21_0442
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0443 : Poly :=
[
  term ((-11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 443 for generator 21. -/
def ep_Q2_020_partial_21_0443 : Poly :=
[
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 21. -/
theorem ep_Q2_020_partial_21_0443_valid :
    mulPoly ep_Q2_020_coefficient_21_0443
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0444 : Poly :=
[
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 444 for generator 21. -/
def ep_Q2_020_partial_21_0444 : Poly :=
[
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 21. -/
theorem ep_Q2_020_partial_21_0444_valid :
    mulPoly ep_Q2_020_coefficient_21_0444
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0445 : Poly :=
[
  term ((-179669236388860593 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 445 for generator 21. -/
def ep_Q2_020_partial_21_0445 : Poly :=
[
  term ((-359338472777721186 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (16, 1)],
  term ((179669236388860593 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 21. -/
theorem ep_Q2_020_partial_21_0445_valid :
    mulPoly ep_Q2_020_coefficient_21_0445
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0446 : Poly :=
[
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 446 for generator 21. -/
def ep_Q2_020_partial_21_0446 : Poly :=
[
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 21. -/
theorem ep_Q2_020_partial_21_0446_valid :
    mulPoly ep_Q2_020_coefficient_21_0446
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0447 : Poly :=
[
  term ((2308808520347472 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 21. -/
def ep_Q2_020_partial_21_0447 : Poly :=
[
  term ((-2308808520347472 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((4617617040694944 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 21. -/
theorem ep_Q2_020_partial_21_0447_valid :
    mulPoly ep_Q2_020_coefficient_21_0447
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0448 : Poly :=
[
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 448 for generator 21. -/
def ep_Q2_020_partial_21_0448 : Poly :=
[
  term ((-50793787447644384 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 21. -/
theorem ep_Q2_020_partial_21_0448_valid :
    mulPoly ep_Q2_020_coefficient_21_0448
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0449 : Poly :=
[
  term ((6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 449 for generator 21. -/
def ep_Q2_020_partial_21_0449 : Poly :=
[
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 21. -/
theorem ep_Q2_020_partial_21_0449_valid :
    mulPoly ep_Q2_020_coefficient_21_0449
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0450 : Poly :=
[
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 21. -/
def ep_Q2_020_partial_21_0450 : Poly :=
[
  term ((46176170406949440 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 21. -/
theorem ep_Q2_020_partial_21_0450_valid :
    mulPoly ep_Q2_020_coefficient_21_0450
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0451 : Poly :=
[
  term ((1154404260173736 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 21. -/
def ep_Q2_020_partial_21_0451 : Poly :=
[
  term ((2308808520347472 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1154404260173736 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 21. -/
theorem ep_Q2_020_partial_21_0451_valid :
    mulPoly ep_Q2_020_coefficient_21_0451
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0452 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 21. -/
def ep_Q2_020_partial_21_0452 : Poly :=
[
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 21. -/
theorem ep_Q2_020_partial_21_0452_valid :
    mulPoly ep_Q2_020_coefficient_21_0452
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0453 : Poly :=
[
  term ((2308808520347472 : Rat) / 1230365000756557) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 21. -/
def ep_Q2_020_partial_21_0453 : Poly :=
[
  term ((-2308808520347472 : Rat) / 1230365000756557) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4617617040694944 : Rat) / 1230365000756557) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 21. -/
theorem ep_Q2_020_partial_21_0453_valid :
    mulPoly ep_Q2_020_coefficient_21_0453
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0454 : Poly :=
[
  term ((151942651899750648 : Rat) / 28298395017400811) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 21. -/
def ep_Q2_020_partial_21_0454 : Poly :=
[
  term ((-151942651899750648 : Rat) / 28298395017400811) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((303885303799501296 : Rat) / 28298395017400811) [(5, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 21. -/
theorem ep_Q2_020_partial_21_0454_valid :
    mulPoly ep_Q2_020_coefficient_21_0454
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0455 : Poly :=
[
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 455 for generator 21. -/
def ep_Q2_020_partial_21_0455 : Poly :=
[
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 21. -/
theorem ep_Q2_020_partial_21_0455_valid :
    mulPoly ep_Q2_020_coefficient_21_0455
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0456 : Poly :=
[
  term ((-151942651899750648 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 456 for generator 21. -/
def ep_Q2_020_partial_21_0456 : Poly :=
[
  term ((-303885303799501296 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((151942651899750648 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 21. -/
theorem ep_Q2_020_partial_21_0456_valid :
    mulPoly ep_Q2_020_coefficient_21_0456
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0457 : Poly :=
[
  term ((-2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 457 for generator 21. -/
def ep_Q2_020_partial_21_0457 : Poly :=
[
  term ((-4617617040694944 : Rat) / 1230365000756557) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 21. -/
theorem ep_Q2_020_partial_21_0457_valid :
    mulPoly ep_Q2_020_coefficient_21_0457
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0458 : Poly :=
[
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 21. -/
def ep_Q2_020_partial_21_0458 : Poly :=
[
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 21. -/
theorem ep_Q2_020_partial_21_0458_valid :
    mulPoly ep_Q2_020_coefficient_21_0458
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0459 : Poly :=
[
  term ((-512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 459 for generator 21. -/
def ep_Q2_020_partial_21_0459 : Poly :=
[
  term ((-1025230011051953982 : Rat) / 28298395017400811) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 21. -/
theorem ep_Q2_020_partial_21_0459_valid :
    mulPoly ep_Q2_020_coefficient_21_0459
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0460 : Poly :=
[
  term ((-219026189545302 : Rat) / 23800164017999) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 21. -/
def ep_Q2_020_partial_21_0460 : Poly :=
[
  term ((-438052379090604 : Rat) / 23800164017999) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((219026189545302 : Rat) / 23800164017999) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 21. -/
theorem ep_Q2_020_partial_21_0460_valid :
    mulPoly ep_Q2_020_coefficient_21_0460
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0461 : Poly :=
[
  term ((75971325949875324 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 21. -/
def ep_Q2_020_partial_21_0461 : Poly :=
[
  term ((151942651899750648 : Rat) / 28298395017400811) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-75971325949875324 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 21. -/
theorem ep_Q2_020_partial_21_0461_valid :
    mulPoly ep_Q2_020_coefficient_21_0461
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0462 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 21. -/
def ep_Q2_020_partial_21_0462 : Poly :=
[
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 21. -/
theorem ep_Q2_020_partial_21_0462_valid :
    mulPoly ep_Q2_020_coefficient_21_0462
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0463 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 463 for generator 21. -/
def ep_Q2_020_partial_21_0463 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 21. -/
theorem ep_Q2_020_partial_21_0463_valid :
    mulPoly ep_Q2_020_coefficient_21_0463
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0464 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 464 for generator 21. -/
def ep_Q2_020_partial_21_0464 : Poly :=
[
  term ((-152381362342933152 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 21. -/
theorem ep_Q2_020_partial_21_0464_valid :
    mulPoly ep_Q2_020_coefficient_21_0464
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0465 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 21. -/
def ep_Q2_020_partial_21_0465 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 21. -/
theorem ep_Q2_020_partial_21_0465_valid :
    mulPoly ep_Q2_020_coefficient_21_0465
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0466 : Poly :=
[
  term ((168229351638173781 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 466 for generator 21. -/
def ep_Q2_020_partial_21_0466 : Poly :=
[
  term ((336458703276347562 : Rat) / 28298395017400811) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-168229351638173781 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 21. -/
theorem ep_Q2_020_partial_21_0466_valid :
    mulPoly ep_Q2_020_coefficient_21_0466
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0467 : Poly :=
[
  term ((-67164773431499028 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 467 for generator 21. -/
def ep_Q2_020_partial_21_0467 : Poly :=
[
  term ((-134329546862998056 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((67164773431499028 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 21. -/
theorem ep_Q2_020_partial_21_0467_valid :
    mulPoly ep_Q2_020_coefficient_21_0467
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0468 : Poly :=
[
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 21. -/
def ep_Q2_020_partial_21_0468 : Poly :=
[
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 21. -/
theorem ep_Q2_020_partial_21_0468_valid :
    mulPoly ep_Q2_020_coefficient_21_0468
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0469 : Poly :=
[
  term ((67164773431499028 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 469 for generator 21. -/
def ep_Q2_020_partial_21_0469 : Poly :=
[
  term ((-67164773431499028 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((134329546862998056 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 21. -/
theorem ep_Q2_020_partial_21_0469_valid :
    mulPoly ep_Q2_020_coefficient_21_0469
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0470 : Poly :=
[
  term ((57563855272496952 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 470 for generator 21. -/
def ep_Q2_020_partial_21_0470 : Poly :=
[
  term ((115127710544993904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-57563855272496952 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 21. -/
theorem ep_Q2_020_partial_21_0470_valid :
    mulPoly ep_Q2_020_coefficient_21_0470
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0471 : Poly :=
[
  term ((109210716312314358 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 471 for generator 21. -/
def ep_Q2_020_partial_21_0471 : Poly :=
[
  term ((218421432624628716 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-109210716312314358 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 21. -/
theorem ep_Q2_020_partial_21_0471_valid :
    mulPoly ep_Q2_020_coefficient_21_0471
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0472 : Poly :=
[
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 472 for generator 21. -/
def ep_Q2_020_partial_21_0472 : Poly :=
[
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 21. -/
theorem ep_Q2_020_partial_21_0472_valid :
    mulPoly ep_Q2_020_coefficient_21_0472
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0473 : Poly :=
[
  term ((43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 473 for generator 21. -/
def ep_Q2_020_partial_21_0473 : Poly :=
[
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 21. -/
theorem ep_Q2_020_partial_21_0473_valid :
    mulPoly ep_Q2_020_coefficient_21_0473
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0474 : Poly :=
[
  term ((-114346394036992338 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 474 for generator 21. -/
def ep_Q2_020_partial_21_0474 : Poly :=
[
  term ((-228692788073984676 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((114346394036992338 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 21. -/
theorem ep_Q2_020_partial_21_0474_valid :
    mulPoly ep_Q2_020_coefficient_21_0474
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0475 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 475 for generator 21. -/
def ep_Q2_020_partial_21_0475 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 21. -/
theorem ep_Q2_020_partial_21_0475_valid :
    mulPoly ep_Q2_020_coefficient_21_0475
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0476 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 476 for generator 21. -/
def ep_Q2_020_partial_21_0476 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 21. -/
theorem ep_Q2_020_partial_21_0476_valid :
    mulPoly ep_Q2_020_coefficient_21_0476
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0477 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (16, 1)]
]

/-- Partial product 477 for generator 21. -/
def ep_Q2_020_partial_21_0477 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 21. -/
theorem ep_Q2_020_partial_21_0477_valid :
    mulPoly ep_Q2_020_coefficient_21_0477
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0478 : Poly :=
[
  term ((71963496940936920 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 478 for generator 21. -/
def ep_Q2_020_partial_21_0478 : Poly :=
[
  term ((143926993881873840 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 21. -/
theorem ep_Q2_020_partial_21_0478_valid :
    mulPoly ep_Q2_020_coefficient_21_0478
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0479 : Poly :=
[
  term ((-28785398776374768 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 21. -/
def ep_Q2_020_partial_21_0479 : Poly :=
[
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 21. -/
theorem ep_Q2_020_partial_21_0479_valid :
    mulPoly ep_Q2_020_coefficient_21_0479
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0480 : Poly :=
[
  term ((57570797552749536 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 480 for generator 21. -/
def ep_Q2_020_partial_21_0480 : Poly :=
[
  term ((115141595105499072 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 21. -/
theorem ep_Q2_020_partial_21_0480_valid :
    mulPoly ep_Q2_020_coefficient_21_0480
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0481 : Poly :=
[
  term ((-172712392658248608 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 21. -/
def ep_Q2_020_partial_21_0481 : Poly :=
[
  term ((-345424785316497216 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 21. -/
theorem ep_Q2_020_partial_21_0481_valid :
    mulPoly ep_Q2_020_coefficient_21_0481
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0482 : Poly :=
[
  term ((-61826722646184906 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 482 for generator 21. -/
def ep_Q2_020_partial_21_0482 : Poly :=
[
  term ((-123653445292369812 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((61826722646184906 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 21. -/
theorem ep_Q2_020_partial_21_0482_valid :
    mulPoly ep_Q2_020_coefficient_21_0482
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0483 : Poly :=
[
  term ((-17990874235234230 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 483 for generator 21. -/
def ep_Q2_020_partial_21_0483 : Poly :=
[
  term ((-35981748470468460 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((17990874235234230 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 21. -/
theorem ep_Q2_020_partial_21_0483_valid :
    mulPoly ep_Q2_020_coefficient_21_0483
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0484 : Poly :=
[
  term ((14392699388187384 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 21. -/
def ep_Q2_020_partial_21_0484 : Poly :=
[
  term ((-14392699388187384 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 21. -/
theorem ep_Q2_020_partial_21_0484_valid :
    mulPoly ep_Q2_020_coefficient_21_0484
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0485 : Poly :=
[
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 485 for generator 21. -/
def ep_Q2_020_partial_21_0485 : Poly :=
[
  term ((-143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 21. -/
theorem ep_Q2_020_partial_21_0485_valid :
    mulPoly ep_Q2_020_coefficient_21_0485
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0486 : Poly :=
[
  term ((-289907621868945011 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 486 for generator 21. -/
def ep_Q2_020_partial_21_0486 : Poly :=
[
  term ((-579815243737890022 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((289907621868945011 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 21. -/
theorem ep_Q2_020_partial_21_0486_valid :
    mulPoly ep_Q2_020_coefficient_21_0486
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0487 : Poly :=
[
  term ((175960318258986108 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 487 for generator 21. -/
def ep_Q2_020_partial_21_0487 : Poly :=
[
  term ((351920636517972216 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-175960318258986108 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 21. -/
theorem ep_Q2_020_partial_21_0487_valid :
    mulPoly ep_Q2_020_coefficient_21_0487
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0488 : Poly :=
[
  term ((-75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 488 for generator 21. -/
def ep_Q2_020_partial_21_0488 : Poly :=
[
  term ((-150743152635753942 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 21. -/
theorem ep_Q2_020_partial_21_0488_valid :
    mulPoly ep_Q2_020_coefficient_21_0488
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0489 : Poly :=
[
  term ((149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 489 for generator 21. -/
def ep_Q2_020_partial_21_0489 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 21. -/
theorem ep_Q2_020_partial_21_0489_valid :
    mulPoly ep_Q2_020_coefficient_21_0489
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0490 : Poly :=
[
  term ((408289198336663233 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 490 for generator 21. -/
def ep_Q2_020_partial_21_0490 : Poly :=
[
  term ((816578396673326466 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-408289198336663233 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 21. -/
theorem ep_Q2_020_partial_21_0490_valid :
    mulPoly ep_Q2_020_coefficient_21_0490
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0491 : Poly :=
[
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 491 for generator 21. -/
def ep_Q2_020_partial_21_0491 : Poly :=
[
  term ((71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 21. -/
theorem ep_Q2_020_partial_21_0491_valid :
    mulPoly ep_Q2_020_coefficient_21_0491
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0492 : Poly :=
[
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 492 for generator 21. -/
def ep_Q2_020_partial_21_0492 : Poly :=
[
  term ((57570797552749536 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 21. -/
theorem ep_Q2_020_partial_21_0492_valid :
    mulPoly ep_Q2_020_coefficient_21_0492
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0493 : Poly :=
[
  term ((-31184182007739332 : Rat) / 28298395017400811) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 493 for generator 21. -/
def ep_Q2_020_partial_21_0493 : Poly :=
[
  term ((-62368364015478664 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((31184182007739332 : Rat) / 28298395017400811) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 21. -/
theorem ep_Q2_020_partial_21_0493_valid :
    mulPoly ep_Q2_020_coefficient_21_0493
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0494 : Poly :=
[
  term ((-21436308964867500 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 21. -/
def ep_Q2_020_partial_21_0494 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 21. -/
theorem ep_Q2_020_partial_21_0494_valid :
    mulPoly ep_Q2_020_coefficient_21_0494
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0495 : Poly :=
[
  term ((-983715691841784 : Rat) / 1230365000756557) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 495 for generator 21. -/
def ep_Q2_020_partial_21_0495 : Poly :=
[
  term ((983715691841784 : Rat) / 1230365000756557) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(6, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 21. -/
theorem ep_Q2_020_partial_21_0495_valid :
    mulPoly ep_Q2_020_coefficient_21_0495
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0496 : Poly :=
[
  term ((3247925600737500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 496 for generator 21. -/
def ep_Q2_020_partial_21_0496 : Poly :=
[
  term ((6495851201475000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 21. -/
theorem ep_Q2_020_partial_21_0496_valid :
    mulPoly ep_Q2_020_coefficient_21_0496
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0497 : Poly :=
[
  term ((-45165868231018221 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 497 for generator 21. -/
def ep_Q2_020_partial_21_0497 : Poly :=
[
  term ((-90331736462036442 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((45165868231018221 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 21. -/
theorem ep_Q2_020_partial_21_0497_valid :
    mulPoly ep_Q2_020_coefficient_21_0497
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0498 : Poly :=
[
  term ((149047832097240 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 21. -/
def ep_Q2_020_partial_21_0498 : Poly :=
[
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 21. -/
theorem ep_Q2_020_partial_21_0498_valid :
    mulPoly ep_Q2_020_coefficient_21_0498
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0499 : Poly :=
[
  term ((6623543751097890 : Rat) / 690204756521971) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 21. -/
def ep_Q2_020_partial_21_0499 : Poly :=
[
  term ((13247087502195780 : Rat) / 690204756521971) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6623543751097890 : Rat) / 690204756521971) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 21. -/
theorem ep_Q2_020_partial_21_0499_valid :
    mulPoly ep_Q2_020_coefficient_21_0499
        ep_Q2_020_generator_21_0400_0499 =
      ep_Q2_020_partial_21_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_21_0400_0499 : List Poly :=
[
  ep_Q2_020_partial_21_0400,
  ep_Q2_020_partial_21_0401,
  ep_Q2_020_partial_21_0402,
  ep_Q2_020_partial_21_0403,
  ep_Q2_020_partial_21_0404,
  ep_Q2_020_partial_21_0405,
  ep_Q2_020_partial_21_0406,
  ep_Q2_020_partial_21_0407,
  ep_Q2_020_partial_21_0408,
  ep_Q2_020_partial_21_0409,
  ep_Q2_020_partial_21_0410,
  ep_Q2_020_partial_21_0411,
  ep_Q2_020_partial_21_0412,
  ep_Q2_020_partial_21_0413,
  ep_Q2_020_partial_21_0414,
  ep_Q2_020_partial_21_0415,
  ep_Q2_020_partial_21_0416,
  ep_Q2_020_partial_21_0417,
  ep_Q2_020_partial_21_0418,
  ep_Q2_020_partial_21_0419,
  ep_Q2_020_partial_21_0420,
  ep_Q2_020_partial_21_0421,
  ep_Q2_020_partial_21_0422,
  ep_Q2_020_partial_21_0423,
  ep_Q2_020_partial_21_0424,
  ep_Q2_020_partial_21_0425,
  ep_Q2_020_partial_21_0426,
  ep_Q2_020_partial_21_0427,
  ep_Q2_020_partial_21_0428,
  ep_Q2_020_partial_21_0429,
  ep_Q2_020_partial_21_0430,
  ep_Q2_020_partial_21_0431,
  ep_Q2_020_partial_21_0432,
  ep_Q2_020_partial_21_0433,
  ep_Q2_020_partial_21_0434,
  ep_Q2_020_partial_21_0435,
  ep_Q2_020_partial_21_0436,
  ep_Q2_020_partial_21_0437,
  ep_Q2_020_partial_21_0438,
  ep_Q2_020_partial_21_0439,
  ep_Q2_020_partial_21_0440,
  ep_Q2_020_partial_21_0441,
  ep_Q2_020_partial_21_0442,
  ep_Q2_020_partial_21_0443,
  ep_Q2_020_partial_21_0444,
  ep_Q2_020_partial_21_0445,
  ep_Q2_020_partial_21_0446,
  ep_Q2_020_partial_21_0447,
  ep_Q2_020_partial_21_0448,
  ep_Q2_020_partial_21_0449,
  ep_Q2_020_partial_21_0450,
  ep_Q2_020_partial_21_0451,
  ep_Q2_020_partial_21_0452,
  ep_Q2_020_partial_21_0453,
  ep_Q2_020_partial_21_0454,
  ep_Q2_020_partial_21_0455,
  ep_Q2_020_partial_21_0456,
  ep_Q2_020_partial_21_0457,
  ep_Q2_020_partial_21_0458,
  ep_Q2_020_partial_21_0459,
  ep_Q2_020_partial_21_0460,
  ep_Q2_020_partial_21_0461,
  ep_Q2_020_partial_21_0462,
  ep_Q2_020_partial_21_0463,
  ep_Q2_020_partial_21_0464,
  ep_Q2_020_partial_21_0465,
  ep_Q2_020_partial_21_0466,
  ep_Q2_020_partial_21_0467,
  ep_Q2_020_partial_21_0468,
  ep_Q2_020_partial_21_0469,
  ep_Q2_020_partial_21_0470,
  ep_Q2_020_partial_21_0471,
  ep_Q2_020_partial_21_0472,
  ep_Q2_020_partial_21_0473,
  ep_Q2_020_partial_21_0474,
  ep_Q2_020_partial_21_0475,
  ep_Q2_020_partial_21_0476,
  ep_Q2_020_partial_21_0477,
  ep_Q2_020_partial_21_0478,
  ep_Q2_020_partial_21_0479,
  ep_Q2_020_partial_21_0480,
  ep_Q2_020_partial_21_0481,
  ep_Q2_020_partial_21_0482,
  ep_Q2_020_partial_21_0483,
  ep_Q2_020_partial_21_0484,
  ep_Q2_020_partial_21_0485,
  ep_Q2_020_partial_21_0486,
  ep_Q2_020_partial_21_0487,
  ep_Q2_020_partial_21_0488,
  ep_Q2_020_partial_21_0489,
  ep_Q2_020_partial_21_0490,
  ep_Q2_020_partial_21_0491,
  ep_Q2_020_partial_21_0492,
  ep_Q2_020_partial_21_0493,
  ep_Q2_020_partial_21_0494,
  ep_Q2_020_partial_21_0495,
  ep_Q2_020_partial_21_0496,
  ep_Q2_020_partial_21_0497,
  ep_Q2_020_partial_21_0498,
  ep_Q2_020_partial_21_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_21_0400_0499 : Poly :=
[
  term ((-38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6926425561042416 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19047670292866644 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3463212780521208 : Rat) / 28298395017400811) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((18419285293311378 : Rat) / 1230365000756557) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((-117063687519375696 : Rat) / 28298395017400811) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19047670292866644 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((38095340585733288 : Rat) / 28298395017400811) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-213264786198298017 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((17316063902606040 : Rat) / 28298395017400811) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((29265921879843924 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)],
  term ((46176170406949440 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-46176170406949440 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((94083947204159484 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12698446861911096 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-47041973602079742 : Rat) / 28298395017400811) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-171490471718940000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18470468162779776 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-208709389543057920 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((725026168986397920 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((20779276683127248 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-415049379376253829 : Rat) / 28298395017400811) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((293248828882774800 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9235234081389888 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((104354694771528960 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-362513084493198960 : Rat) / 28298395017400811) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-10389638341563624 : Rat) / 28298395017400811) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((415049379376253829 : Rat) / 56596790034801622) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((185621304339583200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1172995315531099200 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((249005406371283717 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((5772021300868680 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-718676945555442372 : Rat) / 28298395017400811) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-92810652169791600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12698446861911096 : Rat) / 28298395017400811) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-146624414441387400 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-251891417021718057 : Rat) / 56596790034801622) [(5, 1), (9, 1), (14, 1), (16, 1)],
  term ((11544042601737360 : Rat) / 28298395017400811) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-5772021300868680 : Rat) / 28298395017400811) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((179669236388860593 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)],
  term ((-50793787447644384 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((46176170406949440 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((4617617040694944 : Rat) / 28298395017400811) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((25396893723822192 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-6349223430955548 : Rat) / 28298395017400811) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-23088085203474720 : Rat) / 28298395017400811) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1154404260173736 : Rat) / 28298395017400811) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((586497657765549600 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-303885303799501296 : Rat) / 28298395017400811) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4617617040694944 : Rat) / 1230365000756557) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1025230011051953982 : Rat) / 28298395017400811) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-573946874706720012 : Rat) / 28298395017400811) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-586497657765549600 : Rat) / 28298395017400811) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((4617617040694944 : Rat) / 1230365000756557) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((303885303799501296 : Rat) / 28298395017400811) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-293248828882774800 : Rat) / 28298395017400811) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((151942651899750648 : Rat) / 28298395017400811) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((2308808520347472 : Rat) / 1230365000756557) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((146624414441387400 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((512615005525976991 : Rat) / 28298395017400811) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((219026189545302 : Rat) / 23800164017999) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75971325949875324 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)],
  term ((152381362342933152 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(5, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((336458703276347562 : Rat) / 28298395017400811) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-168229351638173781 : Rat) / 28298395017400811) [(5, 2), (14, 1), (16, 1)],
  term ((-134329546862998056 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((67164773431499028 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((115127710544993904 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((151256659193129688 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((134329546862998056 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-57563855272496952 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-109210716312314358 : Rat) / 28298395017400811) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-228692788073984676 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-52768602903185352 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86356196329124304 : Rat) / 28298395017400811) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-43178098164562152 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((114346394036992338 : Rat) / 28298395017400811) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(6, 1), (7, 2), (9, 2), (16, 1)],
  term ((143926993881873840 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-71963496940936920 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((115141595105499072 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-345424785316497216 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-123653445292369812 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-35981748470468460 : Rat) / 28298395017400811) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((172712392658248608 : Rat) / 28298395017400811) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((61826722646184906 : Rat) / 28298395017400811) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((17990874235234230 : Rat) / 28298395017400811) [(6, 1), (8, 1), (16, 1)],
  term ((-143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-579815243737890022 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((351920636517972216 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-150743152635753942 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((802185697285139082 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((71963496940936920 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((289907621868945011 : Rat) / 28298395017400811) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-175960318258986108 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((75371576317876971 : Rat) / 28298395017400811) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-408289198336663233 : Rat) / 28298395017400811) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((9595132925458256 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-143926993881873840 : Rat) / 28298395017400811) [(6, 1), (9, 2), (10, 2), (16, 1)],
  term ((-28785398776374768 : Rat) / 28298395017400811) [(6, 1), (9, 2), (14, 1), (16, 1)],
  term ((31184182007739332 : Rat) / 28298395017400811) [(6, 1), (9, 2), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-90331736462036442 : Rat) / 28298395017400811) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13247087502195780 : Rat) / 690204756521971) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((21436308964867500 : Rat) / 28298395017400811) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((983715691841784 : Rat) / 1230365000756557) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-42872617929735000 : Rat) / 28298395017400811) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1967431383683568 : Rat) / 1230365000756557) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3247925600737500 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((45165868231018221 : Rat) / 28298395017400811) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-149047832097240 : Rat) / 1230365000756557) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6623543751097890 : Rat) / 690204756521971) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 400 through 499. -/
theorem ep_Q2_020_block_21_0400_0499_valid :
    checkProductSumEq ep_Q2_020_partials_21_0400_0499
      ep_Q2_020_block_21_0400_0499 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
