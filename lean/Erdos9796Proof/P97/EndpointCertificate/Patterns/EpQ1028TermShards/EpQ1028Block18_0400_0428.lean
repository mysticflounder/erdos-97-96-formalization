/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 18:400-428

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_18_0400_0428 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0400 : Poly :=
[
  term (6 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 400 for generator 18. -/
def ep_Q1_028_partial_18_0400 : Poly :=
[
  term (12 : Rat) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 18. -/
theorem ep_Q1_028_partial_18_0400_valid :
    mulPoly ep_Q1_028_coefficient_18_0400
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0401 : Poly :=
[
  term (-1 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 18. -/
def ep_Q1_028_partial_18_0401 : Poly :=
[
  term (-2 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 18. -/
theorem ep_Q1_028_partial_18_0401_valid :
    mulPoly ep_Q1_028_coefficient_18_0401
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0402 : Poly :=
[
  term (8 : Rat) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 402 for generator 18. -/
def ep_Q1_028_partial_18_0402 : Poly :=
[
  term (16 : Rat) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term (-8 : Rat) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 18. -/
theorem ep_Q1_028_partial_18_0402_valid :
    mulPoly ep_Q1_028_coefficient_18_0402
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0403 : Poly :=
[
  term (-12 : Rat) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 403 for generator 18. -/
def ep_Q1_028_partial_18_0403 : Poly :=
[
  term (-24 : Rat) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term (12 : Rat) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 18. -/
theorem ep_Q1_028_partial_18_0403_valid :
    mulPoly ep_Q1_028_coefficient_18_0403
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0404 : Poly :=
[
  term (2 : Rat) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 404 for generator 18. -/
def ep_Q1_028_partial_18_0404 : Poly :=
[
  term (4 : Rat) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 18. -/
theorem ep_Q1_028_partial_18_0404_valid :
    mulPoly ep_Q1_028_coefficient_18_0404
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0405 : Poly :=
[
  term (-18 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 405 for generator 18. -/
def ep_Q1_028_partial_18_0405 : Poly :=
[
  term (-36 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 18. -/
theorem ep_Q1_028_partial_18_0405_valid :
    mulPoly ep_Q1_028_coefficient_18_0405
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0406 : Poly :=
[
  term (6 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 18. -/
def ep_Q1_028_partial_18_0406 : Poly :=
[
  term (12 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 18. -/
theorem ep_Q1_028_partial_18_0406_valid :
    mulPoly ep_Q1_028_coefficient_18_0406
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0407 : Poly :=
[
  term (16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 18. -/
def ep_Q1_028_partial_18_0407 : Poly :=
[
  term (32 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 18. -/
theorem ep_Q1_028_partial_18_0407_valid :
    mulPoly ep_Q1_028_coefficient_18_0407
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0408 : Poly :=
[
  term (-24 : Rat) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 408 for generator 18. -/
def ep_Q1_028_partial_18_0408 : Poly :=
[
  term (-48 : Rat) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term (24 : Rat) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 18. -/
theorem ep_Q1_028_partial_18_0408_valid :
    mulPoly ep_Q1_028_coefficient_18_0408
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0409 : Poly :=
[
  term (3 : Rat) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 409 for generator 18. -/
def ep_Q1_028_partial_18_0409 : Poly :=
[
  term (6 : Rat) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 18. -/
theorem ep_Q1_028_partial_18_0409_valid :
    mulPoly ep_Q1_028_coefficient_18_0409
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0410 : Poly :=
[
  term (-2 : Rat) [(10, 1), (16, 1)]
]

/-- Partial product 410 for generator 18. -/
def ep_Q1_028_partial_18_0410 : Poly :=
[
  term (-4 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 18. -/
theorem ep_Q1_028_partial_18_0410_valid :
    mulPoly ep_Q1_028_coefficient_18_0410
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0411 : Poly :=
[
  term (24 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 411 for generator 18. -/
def ep_Q1_028_partial_18_0411 : Poly :=
[
  term (48 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 18. -/
theorem ep_Q1_028_partial_18_0411_valid :
    mulPoly ep_Q1_028_coefficient_18_0411
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0412 : Poly :=
[
  term (-16 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 18. -/
def ep_Q1_028_partial_18_0412 : Poly :=
[
  term (-32 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 18. -/
theorem ep_Q1_028_partial_18_0412_valid :
    mulPoly ep_Q1_028_coefficient_18_0412
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0413 : Poly :=
[
  term ((3 : Rat) / 2) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 413 for generator 18. -/
def ep_Q1_028_partial_18_0413 : Poly :=
[
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 18. -/
theorem ep_Q1_028_partial_18_0413_valid :
    mulPoly ep_Q1_028_coefficient_18_0413
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0414 : Poly :=
[
  term (-3 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 18. -/
def ep_Q1_028_partial_18_0414 : Poly :=
[
  term (-6 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 18. -/
theorem ep_Q1_028_partial_18_0414_valid :
    mulPoly ep_Q1_028_coefficient_18_0414
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0415 : Poly :=
[
  term ((-3 : Rat) / 4) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 18. -/
def ep_Q1_028_partial_18_0415 : Poly :=
[
  term ((-3 : Rat) / 2) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 18. -/
theorem ep_Q1_028_partial_18_0415_valid :
    mulPoly ep_Q1_028_coefficient_18_0415
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0416 : Poly :=
[
  term (18 : Rat) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 416 for generator 18. -/
def ep_Q1_028_partial_18_0416 : Poly :=
[
  term (36 : Rat) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term (-18 : Rat) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 18. -/
theorem ep_Q1_028_partial_18_0416_valid :
    mulPoly ep_Q1_028_coefficient_18_0416
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0417 : Poly :=
[
  term (-6 : Rat) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 417 for generator 18. -/
def ep_Q1_028_partial_18_0417 : Poly :=
[
  term (-12 : Rat) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 18. -/
theorem ep_Q1_028_partial_18_0417_valid :
    mulPoly ep_Q1_028_coefficient_18_0417
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0418 : Poly :=
[
  term (-3 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 418 for generator 18. -/
def ep_Q1_028_partial_18_0418 : Poly :=
[
  term (-6 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 18. -/
theorem ep_Q1_028_partial_18_0418_valid :
    mulPoly ep_Q1_028_coefficient_18_0418
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0419 : Poly :=
[
  term (-6 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 18. -/
def ep_Q1_028_partial_18_0419 : Poly :=
[
  term (-12 : Rat) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 18. -/
theorem ep_Q1_028_partial_18_0419_valid :
    mulPoly ep_Q1_028_coefficient_18_0419
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0420 : Poly :=
[
  term (19 : Rat) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 420 for generator 18. -/
def ep_Q1_028_partial_18_0420 : Poly :=
[
  term (38 : Rat) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term (-19 : Rat) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 18. -/
theorem ep_Q1_028_partial_18_0420_valid :
    mulPoly ep_Q1_028_coefficient_18_0420
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0421 : Poly :=
[
  term (1 : Rat) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 421 for generator 18. -/
def ep_Q1_028_partial_18_0421 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 18. -/
theorem ep_Q1_028_partial_18_0421_valid :
    mulPoly ep_Q1_028_coefficient_18_0421
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0422 : Poly :=
[
  term (2 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 422 for generator 18. -/
def ep_Q1_028_partial_18_0422 : Poly :=
[
  term (4 : Rat) [(8, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 18. -/
theorem ep_Q1_028_partial_18_0422_valid :
    mulPoly ep_Q1_028_coefficient_18_0422
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0423 : Poly :=
[
  term (-1 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 18. -/
def ep_Q1_028_partial_18_0423 : Poly :=
[
  term (-2 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 18. -/
theorem ep_Q1_028_partial_18_0423_valid :
    mulPoly ep_Q1_028_coefficient_18_0423
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0424 : Poly :=
[
  term ((-11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 18. -/
def ep_Q1_028_partial_18_0424 : Poly :=
[
  term (-11 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 18. -/
theorem ep_Q1_028_partial_18_0424_valid :
    mulPoly ep_Q1_028_coefficient_18_0424
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0425 : Poly :=
[
  term (6 : Rat) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 425 for generator 18. -/
def ep_Q1_028_partial_18_0425 : Poly :=
[
  term (12 : Rat) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 18. -/
theorem ep_Q1_028_partial_18_0425_valid :
    mulPoly ep_Q1_028_coefficient_18_0425
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0426 : Poly :=
[
  term (6 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 426 for generator 18. -/
def ep_Q1_028_partial_18_0426 : Poly :=
[
  term (12 : Rat) [(8, 1), (13, 2), (16, 1)],
  term (-6 : Rat) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 18. -/
theorem ep_Q1_028_partial_18_0426_valid :
    mulPoly ep_Q1_028_coefficient_18_0426
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0427 : Poly :=
[
  term ((19 : Rat) / 4) [(14, 1), (16, 1)]
]

/-- Partial product 427 for generator 18. -/
def ep_Q1_028_partial_18_0427 : Poly :=
[
  term ((19 : Rat) / 2) [(8, 1), (14, 1), (16, 1)],
  term ((-19 : Rat) / 4) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 18. -/
theorem ep_Q1_028_partial_18_0427_valid :
    mulPoly ep_Q1_028_coefficient_18_0427
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 18. -/
def ep_Q1_028_coefficient_18_0428 : Poly :=
[
  term ((-9 : Rat) / 2) [(14, 2), (16, 1)]
]

/-- Partial product 428 for generator 18. -/
def ep_Q1_028_partial_18_0428 : Poly :=
[
  term (-9 : Rat) [(8, 1), (14, 2), (16, 1)],
  term ((9 : Rat) / 2) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 18. -/
theorem ep_Q1_028_partial_18_0428_valid :
    mulPoly ep_Q1_028_coefficient_18_0428
        ep_Q1_028_generator_18_0400_0428 =
      ep_Q1_028_partial_18_0428 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_18_0400_0428 : List Poly :=
[
  ep_Q1_028_partial_18_0400,
  ep_Q1_028_partial_18_0401,
  ep_Q1_028_partial_18_0402,
  ep_Q1_028_partial_18_0403,
  ep_Q1_028_partial_18_0404,
  ep_Q1_028_partial_18_0405,
  ep_Q1_028_partial_18_0406,
  ep_Q1_028_partial_18_0407,
  ep_Q1_028_partial_18_0408,
  ep_Q1_028_partial_18_0409,
  ep_Q1_028_partial_18_0410,
  ep_Q1_028_partial_18_0411,
  ep_Q1_028_partial_18_0412,
  ep_Q1_028_partial_18_0413,
  ep_Q1_028_partial_18_0414,
  ep_Q1_028_partial_18_0415,
  ep_Q1_028_partial_18_0416,
  ep_Q1_028_partial_18_0417,
  ep_Q1_028_partial_18_0418,
  ep_Q1_028_partial_18_0419,
  ep_Q1_028_partial_18_0420,
  ep_Q1_028_partial_18_0421,
  ep_Q1_028_partial_18_0422,
  ep_Q1_028_partial_18_0423,
  ep_Q1_028_partial_18_0424,
  ep_Q1_028_partial_18_0425,
  ep_Q1_028_partial_18_0426,
  ep_Q1_028_partial_18_0427,
  ep_Q1_028_partial_18_0428
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_18_0400_0428 : Poly :=
[
  term (12 : Rat) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term (-24 : Rat) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term (4 : Rat) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term (-36 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term (6 : Rat) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (10, 1), (16, 1)],
  term (48 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-32 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(8, 1), (11, 2), (16, 1)],
  term (-12 : Rat) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (38 : Rat) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(8, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-11 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term (12 : Rat) [(8, 1), (13, 2), (16, 1)],
  term ((19 : Rat) / 2) [(8, 1), (14, 1), (16, 1)],
  term (-9 : Rat) [(8, 1), (14, 2), (16, 1)],
  term (-6 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (1 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 2), (10, 1), (16, 1)],
  term (12 : Rat) [(9, 2), (12, 1), (16, 1)],
  term (-2 : Rat) [(9, 2), (14, 1), (16, 1)],
  term (18 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(10, 1), (13, 2), (16, 1)],
  term (-3 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(10, 1), (16, 1)],
  term (-24 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(11, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (3 : Rat) [(11, 2), (16, 1)],
  term (6 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-19 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(12, 1), (16, 1)],
  term (1 : Rat) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 2) [(13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(13, 2), (16, 1)],
  term ((-19 : Rat) / 4) [(14, 1), (16, 1)],
  term ((9 : Rat) / 2) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 400 through 428. -/
theorem ep_Q1_028_block_18_0400_0428_valid :
    checkProductSumEq ep_Q1_028_partials_18_0400_0428
      ep_Q1_028_block_18_0400_0428 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
