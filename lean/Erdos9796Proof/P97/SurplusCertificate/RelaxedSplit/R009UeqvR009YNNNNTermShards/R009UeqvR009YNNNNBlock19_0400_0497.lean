/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 19:400-497

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0400 : Poly :=
[
  term ((88 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0400 : Poly :=
[
  term ((176 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0400_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0400
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0401 : Poly :=
[
  term ((5684234843532892 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 401 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0401 : Poly :=
[
  term ((11368469687065784 : Rat) / 6527410339149) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5684234843532892 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0401_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0401
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0402 : Poly :=
[
  term ((37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0402 : Poly :=
[
  term ((74 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0402_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0402
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0403 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2)]
]

/-- Partial product 403 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0403 : Poly :=
[
  term ((-239616 : Rat) / 553) [(8, 1), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0403_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0403
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0404 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (14, 1)]
]

/-- Partial product 404 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0404 : Poly :=
[
  term ((-239616 : Rat) / 553) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0404_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0404
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0405 : Poly :=
[
  term ((-108418763473967 : Rat) / 1065699647208) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 405 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0405 : Poly :=
[
  term ((-108418763473967 : Rat) / 532849823604) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((108418763473967 : Rat) / 1065699647208) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0405_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0405
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0406 : Poly :=
[
  term ((-101 : Rat) / 84) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0406 : Poly :=
[
  term ((-101 : Rat) / 42) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((101 : Rat) / 84) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0406_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0406
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0407 : Poly :=
[
  term ((6090608323475 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 407 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0407 : Poly :=
[
  term ((6090608323475 : Rat) / 266424911802) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-6090608323475 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0407_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0407
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0408 : Poly :=
[
  term ((-5 : Rat) / 6) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 408 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0408 : Poly :=
[
  term ((-5 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 6) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0408_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0408
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0409 : Poly :=
[
  term ((15073554766871 : Rat) / 88808303934) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 409 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0409 : Poly :=
[
  term ((15073554766871 : Rat) / 44404151967) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-15073554766871 : Rat) / 88808303934) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0409_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0409
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0410 : Poly :=
[
  term ((11 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 410 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0410 : Poly :=
[
  term ((22 : Rat) / 7) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0410_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0410
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0411 : Poly :=
[
  term ((-50294700516790819 : Rat) / 104438565426384) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 411 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0411 : Poly :=
[
  term ((-50294700516790819 : Rat) / 52219282713192) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((50294700516790819 : Rat) / 104438565426384) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0411_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0411
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0412 : Poly :=
[
  term ((15425 : Rat) / 504) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0412 : Poly :=
[
  term ((15425 : Rat) / 252) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15425 : Rat) / 504) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0412_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0412
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0413 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(10, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 413 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0413 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0413_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0413
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0414 : Poly :=
[
  term ((-2221000328240293 : Rat) / 5594923147842) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 414 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0414 : Poly :=
[
  term ((-2221000328240293 : Rat) / 2797461573921) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2221000328240293 : Rat) / 5594923147842) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0414_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0414
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0415 : Poly :=
[
  term ((-251 : Rat) / 63) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0415 : Poly :=
[
  term ((-502 : Rat) / 63) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((251 : Rat) / 63) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0415_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0415
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0416 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 416 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0416 : Poly :=
[
  term ((6733812628546 : Rat) / 14801383989) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0416_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0416
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0417 : Poly :=
[
  term ((-130 : Rat) / 7) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 417 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0417 : Poly :=
[
  term ((-260 : Rat) / 7) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0417_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0417
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0418 : Poly :=
[
  term ((2030800143635 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

/-- Partial product 418 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0418 : Poly :=
[
  term ((2030800143635 : Rat) / 532849823604) [(8, 1), (10, 1), (13, 2)],
  term ((-2030800143635 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0418_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0418
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0419 : Poly :=
[
  term ((2438286298446361 : Rat) / 3197098941624) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 419 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0419 : Poly :=
[
  term ((2438286298446361 : Rat) / 1598549470812) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0419_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0419
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0420 : Poly :=
[
  term ((-7645 : Rat) / 252) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 420 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0420 : Poly :=
[
  term ((-7645 : Rat) / 126) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((7645 : Rat) / 252) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0420_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0420
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0421 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 421 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0421 : Poly :=
[
  term ((-2954048478533 : Rat) / 9867589326) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0421_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0421
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0422 : Poly :=
[
  term ((305 : Rat) / 14) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 422 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0422 : Poly :=
[
  term ((305 : Rat) / 7) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0422_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0422
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0423 : Poly :=
[
  term ((-5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 423 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0423 : Poly :=
[
  term ((-5 : Rat) / 6) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0423_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0423
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0424 : Poly :=
[
  term ((-6162378460521091 : Rat) / 52219282713192) [(10, 1), (14, 1)]
]

/-- Partial product 424 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0424 : Poly :=
[
  term ((-6162378460521091 : Rat) / 26109641356596) [(8, 1), (10, 1), (14, 1)],
  term ((6162378460521091 : Rat) / 52219282713192) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0424_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0424
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0425 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 425 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0425 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 59205535956) [(10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0425_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0425
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0426 : Poly :=
[
  term ((-65 : Rat) / 14) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 426 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0426 : Poly :=
[
  term ((-65 : Rat) / 7) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0426_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0426
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0427 : Poly :=
[
  term ((720525431494129 : Rat) / 6527410339149) [(10, 1), (15, 2)]
]

/-- Partial product 427 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0427 : Poly :=
[
  term ((1441050862988258 : Rat) / 6527410339149) [(8, 1), (10, 1), (15, 2)],
  term ((-720525431494129 : Rat) / 6527410339149) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0427_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0427
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0428 : Poly :=
[
  term ((275 : Rat) / 63) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 428 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0428 : Poly :=
[
  term ((550 : Rat) / 63) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-275 : Rat) / 63) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0428_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0428
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0429 : Poly :=
[
  term ((119808 : Rat) / 553) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 429 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0429 : Poly :=
[
  term ((239616 : Rat) / 553) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0429_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0429
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0430 : Poly :=
[
  term ((-4353333743611 : Rat) / 29602767978) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 430 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0430 : Poly :=
[
  term ((-4353333743611 : Rat) / 14801383989) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((4353333743611 : Rat) / 29602767978) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0430_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0430
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0431 : Poly :=
[
  term (15 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0431 : Poly :=
[
  term (30 : Rat) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0431_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0431
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0432 : Poly :=
[
  term ((4238595271243 : Rat) / 29602767978) [(10, 2), (15, 2)]
]

/-- Partial product 432 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0432 : Poly :=
[
  term ((4238595271243 : Rat) / 14801383989) [(8, 1), (10, 2), (15, 2)],
  term ((-4238595271243 : Rat) / 29602767978) [(10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0432_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0432
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0433 : Poly :=
[
  term ((-88 : Rat) / 7) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 433 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0433 : Poly :=
[
  term ((-176 : Rat) / 7) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((88 : Rat) / 7) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0433_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0433
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0434 : Poly :=
[
  term ((82604286814447 : Rat) / 710466431472) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 434 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0434 : Poly :=
[
  term ((82604286814447 : Rat) / 355233215736) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-82604286814447 : Rat) / 710466431472) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0434_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0434
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0435 : Poly :=
[
  term ((-2438286298446361 : Rat) / 3197098941624) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 435 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0435 : Poly :=
[
  term ((-2438286298446361 : Rat) / 1598549470812) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2438286298446361 : Rat) / 3197098941624) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0435_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0435
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0436 : Poly :=
[
  term ((7645 : Rat) / 252) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 436 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0436 : Poly :=
[
  term ((7645 : Rat) / 126) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7645 : Rat) / 252) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0436_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0436
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0437 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 437 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0437 : Poly :=
[
  term ((2954048478533 : Rat) / 9867589326) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0437_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0437
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0438 : Poly :=
[
  term ((-305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 438 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0438 : Poly :=
[
  term ((-305 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0438_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0438
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0439 : Poly :=
[
  term ((-425 : Rat) / 168) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 439 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0439 : Poly :=
[
  term ((-425 : Rat) / 84) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((425 : Rat) / 168) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0439_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0439
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0440 : Poly :=
[
  term ((8768283710970787 : Rat) / 26109641356596) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 440 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0440 : Poly :=
[
  term ((8768283710970787 : Rat) / 13054820678298) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8768283710970787 : Rat) / 26109641356596) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0440_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0440
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0441 : Poly :=
[
  term ((-1585 : Rat) / 63) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0441 : Poly :=
[
  term ((-3170 : Rat) / 63) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1585 : Rat) / 63) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0441_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0441
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0442 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 442 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0442 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0442_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0442
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0443 : Poly :=
[
  term ((829570191737071 : Rat) / 3729948765228) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 443 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0443 : Poly :=
[
  term ((829570191737071 : Rat) / 1864974382614) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-829570191737071 : Rat) / 3729948765228) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0443_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0443
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0444 : Poly :=
[
  term ((95 : Rat) / 42) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 444 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0444 : Poly :=
[
  term ((95 : Rat) / 21) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95 : Rat) / 42) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0444_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0444
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0445 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 445 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0445 : Poly :=
[
  term ((-6733812628546 : Rat) / 14801383989) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0445_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0445
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0446 : Poly :=
[
  term ((130 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 446 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0446 : Poly :=
[
  term ((260 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0446_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0446
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0447 : Poly :=
[
  term ((-141892296469537 : Rat) / 473644287648) [(11, 1), (13, 1)]
]

/-- Partial product 447 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0447 : Poly :=
[
  term ((-141892296469537 : Rat) / 236822143824) [(8, 1), (11, 1), (13, 1)],
  term ((141892296469537 : Rat) / 473644287648) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0447_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0447
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0448 : Poly :=
[
  term ((-194964516983104787 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 448 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0448 : Poly :=
[
  term ((-194964516983104787 : Rat) / 156657848139576) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((194964516983104787 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0448_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0448
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0449 : Poly :=
[
  term ((14615 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 449 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0449 : Poly :=
[
  term ((14615 : Rat) / 252) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14615 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0449_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0449
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0450 : Poly :=
[
  term ((103617756485 : Rat) / 26313571536) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 450 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0450 : Poly :=
[
  term ((103617756485 : Rat) / 13156785768) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-103617756485 : Rat) / 26313571536) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0450_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0450
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0451 : Poly :=
[
  term ((-915 : Rat) / 56) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 451 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0451 : Poly :=
[
  term ((-915 : Rat) / 28) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((915 : Rat) / 56) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0451_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0451
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0452 : Poly :=
[
  term ((325 : Rat) / 336) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 452 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0452 : Poly :=
[
  term ((325 : Rat) / 168) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-325 : Rat) / 336) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0452_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0452
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0453 : Poly :=
[
  term ((-1479901784054804 : Rat) / 6527410339149) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 453 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0453 : Poly :=
[
  term ((-2959803568109608 : Rat) / 6527410339149) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1479901784054804 : Rat) / 6527410339149) [(11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0453_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0453
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0454 : Poly :=
[
  term ((-3089 : Rat) / 126) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0454 : Poly :=
[
  term ((-3089 : Rat) / 63) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3089 : Rat) / 126) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0454_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0454
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0455 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 455 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0455 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0455_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0455
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0456 : Poly :=
[
  term ((-13162473829053971 : Rat) / 13054820678298) [(11, 1), (15, 1)]
]

/-- Partial product 456 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0456 : Poly :=
[
  term ((-13162473829053971 : Rat) / 6527410339149) [(8, 1), (11, 1), (15, 1)],
  term ((13162473829053971 : Rat) / 13054820678298) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0456_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0456
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0457 : Poly :=
[
  term ((-31 : Rat) / 84) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0457 : Poly :=
[
  term ((-31 : Rat) / 42) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 84) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0457_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0457
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0458 : Poly :=
[
  term ((-3366906314273 : Rat) / 19735178652) [(11, 1), (15, 3)]
]

/-- Partial product 458 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0458 : Poly :=
[
  term ((-3366906314273 : Rat) / 9867589326) [(8, 1), (11, 1), (15, 3)],
  term ((3366906314273 : Rat) / 19735178652) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0458_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0458
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0459 : Poly :=
[
  term ((195 : Rat) / 14) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 459 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0459 : Poly :=
[
  term ((195 : Rat) / 7) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-195 : Rat) / 14) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0459_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0459
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0460 : Poly :=
[
  term ((-3146890786645 : Rat) / 44404151967) [(11, 2)]
]

/-- Partial product 460 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0460 : Poly :=
[
  term ((-6293781573290 : Rat) / 44404151967) [(8, 1), (11, 2)],
  term ((3146890786645 : Rat) / 44404151967) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0460_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0460
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0461 : Poly :=
[
  term ((-57408 : Rat) / 553) [(11, 2), (12, 1)]
]

/-- Partial product 461 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0461 : Poly :=
[
  term ((-114816 : Rat) / 553) [(8, 1), (11, 2), (12, 1)],
  term ((57408 : Rat) / 553) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0461_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0461
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0462 : Poly :=
[
  term ((2328819458727799 : Rat) / 6527410339149) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 462 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0462 : Poly :=
[
  term ((4657638917455598 : Rat) / 6527410339149) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2328819458727799 : Rat) / 6527410339149) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0462_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0462
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0463 : Poly :=
[
  term ((-239616 : Rat) / 553) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 463 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0463 : Poly :=
[
  term ((-479232 : Rat) / 553) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0463_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0463
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0464 : Poly :=
[
  term ((34560164924602483 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 464 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0464 : Poly :=
[
  term ((34560164924602483 : Rat) / 13054820678298) [(8, 1), (11, 2), (14, 1)],
  term ((-34560164924602483 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0464_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0464
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0465 : Poly :=
[
  term ((-179712 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 465 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0465 : Poly :=
[
  term ((-359424 : Rat) / 553) [(8, 1), (11, 2), (15, 2)],
  term ((179712 : Rat) / 553) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0465_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0465
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0466 : Poly :=
[
  term ((-1934854446325 : Rat) / 710466431472) [(12, 1)]
]

/-- Partial product 466 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0466 : Poly :=
[
  term ((-1934854446325 : Rat) / 355233215736) [(8, 1), (12, 1)],
  term ((1934854446325 : Rat) / 710466431472) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0466_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0466
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0467 : Poly :=
[
  term ((2954048478533 : Rat) / 78940714608) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 467 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0467 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0467_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0467
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0468 : Poly :=
[
  term ((-305 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0468 : Poly :=
[
  term ((-305 : Rat) / 28) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((305 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0468_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0468
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0469 : Poly :=
[
  term ((46953690839072645 : Rat) / 208877130852768) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 469 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0469 : Poly :=
[
  term ((46953690839072645 : Rat) / 104438565426384) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-46953690839072645 : Rat) / 208877130852768) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0469_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0469
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0470 : Poly :=
[
  term ((-841 : Rat) / 336) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 470 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0470 : Poly :=
[
  term ((-841 : Rat) / 168) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((841 : Rat) / 336) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0470_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0470
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0471 : Poly :=
[
  term ((-97923607474811 : Rat) / 1065699647208) [(12, 1), (13, 2)]
]

/-- Partial product 471 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0471 : Poly :=
[
  term ((-97923607474811 : Rat) / 532849823604) [(8, 1), (12, 1), (13, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0471_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0471
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0472 : Poly :=
[
  term ((475 : Rat) / 84) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 472 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0472 : Poly :=
[
  term ((475 : Rat) / 42) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-475 : Rat) / 84) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0472_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0472
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0473 : Poly :=
[
  term ((-32516523481 : Rat) / 5638622472) [(12, 1), (14, 1)]
]

/-- Partial product 473 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0473 : Poly :=
[
  term ((-32516523481 : Rat) / 2819311236) [(8, 1), (12, 1), (14, 1)],
  term ((32516523481 : Rat) / 5638622472) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0473_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0473
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0474 : Poly :=
[
  term ((-3366906314273 : Rat) / 59205535956) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 474 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0474 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 59205535956) [(12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0474_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0474
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0475 : Poly :=
[
  term ((65 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0475 : Poly :=
[
  term ((65 : Rat) / 7) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0475_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0475
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0476 : Poly :=
[
  term ((-496223218750097 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

/-- Partial product 476 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0476 : Poly :=
[
  term ((-496223218750097 : Rat) / 4351606892766) [(8, 1), (12, 1), (15, 2)],
  term ((496223218750097 : Rat) / 8703213785532) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0476_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0476
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0477 : Poly :=
[
  term ((-163 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 477 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0477 : Poly :=
[
  term ((-163 : Rat) / 42) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((163 : Rat) / 84) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0477_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0477
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0478 : Poly :=
[
  term ((52046412815447245 : Rat) / 104438565426384) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 478 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0478 : Poly :=
[
  term ((52046412815447245 : Rat) / 52219282713192) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-52046412815447245 : Rat) / 104438565426384) [(13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0478_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0478
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0479 : Poly :=
[
  term ((2215 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0479 : Poly :=
[
  term ((2215 : Rat) / 252) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2215 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0479_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0479
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0480 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 480 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0480 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0480_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0480
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0481 : Poly :=
[
  term ((-29380434373421465 : Rat) / 626631392558304) [(13, 1), (15, 1)]
]

/-- Partial product 481 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0481 : Poly :=
[
  term ((-29380434373421465 : Rat) / 313315696279152) [(8, 1), (13, 1), (15, 1)],
  term ((29380434373421465 : Rat) / 626631392558304) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0481_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0481
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0482 : Poly :=
[
  term ((4103 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 482 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0482 : Poly :=
[
  term ((4103 : Rat) / 504) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4103 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0482_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0482
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0483 : Poly :=
[
  term ((-3366906314273 : Rat) / 59205535956) [(13, 1), (15, 3)]
]

/-- Partial product 483 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0483 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(8, 1), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0483_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0483
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0484 : Poly :=
[
  term ((65 : Rat) / 14) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 484 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0484 : Poly :=
[
  term ((65 : Rat) / 7) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0484_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0484
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0485 : Poly :=
[
  term ((13258656828593 : Rat) / 1420932862944) [(13, 2)]
]

/-- Partial product 485 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0485 : Poly :=
[
  term ((13258656828593 : Rat) / 710466431472) [(8, 1), (13, 2)],
  term ((-13258656828593 : Rat) / 1420932862944) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0485_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0485
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0486 : Poly :=
[
  term ((-8835273554173081 : Rat) / 12788395766496) [(13, 2), (14, 1)]
]

/-- Partial product 486 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0486 : Poly :=
[
  term ((-8835273554173081 : Rat) / 6394197883248) [(8, 1), (13, 2), (14, 1)],
  term ((8835273554173081 : Rat) / 12788395766496) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0486_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0486
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0487 : Poly :=
[
  term ((2365 : Rat) / 1008) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 487 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0487 : Poly :=
[
  term ((2365 : Rat) / 504) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2365 : Rat) / 1008) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0487_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0487
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0488 : Poly :=
[
  term ((2954048478533 : Rat) / 78940714608) [(13, 2), (15, 2)]
]

/-- Partial product 488 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0488 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(8, 1), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0488_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0488
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0489 : Poly :=
[
  term ((-305 : Rat) / 56) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 489 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0489 : Poly :=
[
  term ((-305 : Rat) / 28) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0489_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0489
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0490 : Poly :=
[
  term ((-2455 : Rat) / 336) [(13, 2), (16, 1)]
]

/-- Partial product 490 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0490 : Poly :=
[
  term ((-2455 : Rat) / 168) [(8, 1), (13, 2), (16, 1)],
  term ((2455 : Rat) / 336) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0490_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0490
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0491 : Poly :=
[
  term ((-26493807330721183 : Rat) / 208877130852768) [(14, 1)]
]

/-- Partial product 491 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0491 : Poly :=
[
  term ((-26493807330721183 : Rat) / 104438565426384) [(8, 1), (14, 1)],
  term ((26493807330721183 : Rat) / 208877130852768) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0491_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0491
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0492 : Poly :=
[
  term ((413194774214435 : Rat) / 2901071261844) [(14, 1), (15, 2)]
]

/-- Partial product 492 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0492 : Poly :=
[
  term ((413194774214435 : Rat) / 1450535630922) [(8, 1), (14, 1), (15, 2)],
  term ((-413194774214435 : Rat) / 2901071261844) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0492_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0492
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0493 : Poly :=
[
  term ((-65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 493 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0493 : Poly :=
[
  term ((-65 : Rat) / 7) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0493_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0493
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0494 : Poly :=
[
  term ((16 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 494 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0494 : Poly :=
[
  term ((32 : Rat) / 21) [(8, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0494_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0494
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0495 : Poly :=
[
  term ((122681445924503923 : Rat) / 208877130852768) [(14, 2)]
]

/-- Partial product 495 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0495 : Poly :=
[
  term ((122681445924503923 : Rat) / 104438565426384) [(8, 1), (14, 2)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0495_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0495
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0496 : Poly :=
[
  term ((158982611033841695 : Rat) / 208877130852768) [(15, 2)]
]

/-- Partial product 496 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0496 : Poly :=
[
  term ((158982611033841695 : Rat) / 104438565426384) [(8, 1), (15, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0496_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0496
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0497 : Poly :=
[
  term ((-407 : Rat) / 252) [(15, 2), (16, 1)]
]

/-- Partial product 497 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0497 : Poly :=
[
  term ((-407 : Rat) / 126) [(8, 1), (15, 2), (16, 1)],
  term ((407 : Rat) / 252) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0497_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0497
        rs_R009_ueqv_R009YNNNN_generator_19_0400_0497 =
      rs_R009_ueqv_R009YNNNN_partial_19_0497 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_19_0400_0497 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_19_0400,
  rs_R009_ueqv_R009YNNNN_partial_19_0401,
  rs_R009_ueqv_R009YNNNN_partial_19_0402,
  rs_R009_ueqv_R009YNNNN_partial_19_0403,
  rs_R009_ueqv_R009YNNNN_partial_19_0404,
  rs_R009_ueqv_R009YNNNN_partial_19_0405,
  rs_R009_ueqv_R009YNNNN_partial_19_0406,
  rs_R009_ueqv_R009YNNNN_partial_19_0407,
  rs_R009_ueqv_R009YNNNN_partial_19_0408,
  rs_R009_ueqv_R009YNNNN_partial_19_0409,
  rs_R009_ueqv_R009YNNNN_partial_19_0410,
  rs_R009_ueqv_R009YNNNN_partial_19_0411,
  rs_R009_ueqv_R009YNNNN_partial_19_0412,
  rs_R009_ueqv_R009YNNNN_partial_19_0413,
  rs_R009_ueqv_R009YNNNN_partial_19_0414,
  rs_R009_ueqv_R009YNNNN_partial_19_0415,
  rs_R009_ueqv_R009YNNNN_partial_19_0416,
  rs_R009_ueqv_R009YNNNN_partial_19_0417,
  rs_R009_ueqv_R009YNNNN_partial_19_0418,
  rs_R009_ueqv_R009YNNNN_partial_19_0419,
  rs_R009_ueqv_R009YNNNN_partial_19_0420,
  rs_R009_ueqv_R009YNNNN_partial_19_0421,
  rs_R009_ueqv_R009YNNNN_partial_19_0422,
  rs_R009_ueqv_R009YNNNN_partial_19_0423,
  rs_R009_ueqv_R009YNNNN_partial_19_0424,
  rs_R009_ueqv_R009YNNNN_partial_19_0425,
  rs_R009_ueqv_R009YNNNN_partial_19_0426,
  rs_R009_ueqv_R009YNNNN_partial_19_0427,
  rs_R009_ueqv_R009YNNNN_partial_19_0428,
  rs_R009_ueqv_R009YNNNN_partial_19_0429,
  rs_R009_ueqv_R009YNNNN_partial_19_0430,
  rs_R009_ueqv_R009YNNNN_partial_19_0431,
  rs_R009_ueqv_R009YNNNN_partial_19_0432,
  rs_R009_ueqv_R009YNNNN_partial_19_0433,
  rs_R009_ueqv_R009YNNNN_partial_19_0434,
  rs_R009_ueqv_R009YNNNN_partial_19_0435,
  rs_R009_ueqv_R009YNNNN_partial_19_0436,
  rs_R009_ueqv_R009YNNNN_partial_19_0437,
  rs_R009_ueqv_R009YNNNN_partial_19_0438,
  rs_R009_ueqv_R009YNNNN_partial_19_0439,
  rs_R009_ueqv_R009YNNNN_partial_19_0440,
  rs_R009_ueqv_R009YNNNN_partial_19_0441,
  rs_R009_ueqv_R009YNNNN_partial_19_0442,
  rs_R009_ueqv_R009YNNNN_partial_19_0443,
  rs_R009_ueqv_R009YNNNN_partial_19_0444,
  rs_R009_ueqv_R009YNNNN_partial_19_0445,
  rs_R009_ueqv_R009YNNNN_partial_19_0446,
  rs_R009_ueqv_R009YNNNN_partial_19_0447,
  rs_R009_ueqv_R009YNNNN_partial_19_0448,
  rs_R009_ueqv_R009YNNNN_partial_19_0449,
  rs_R009_ueqv_R009YNNNN_partial_19_0450,
  rs_R009_ueqv_R009YNNNN_partial_19_0451,
  rs_R009_ueqv_R009YNNNN_partial_19_0452,
  rs_R009_ueqv_R009YNNNN_partial_19_0453,
  rs_R009_ueqv_R009YNNNN_partial_19_0454,
  rs_R009_ueqv_R009YNNNN_partial_19_0455,
  rs_R009_ueqv_R009YNNNN_partial_19_0456,
  rs_R009_ueqv_R009YNNNN_partial_19_0457,
  rs_R009_ueqv_R009YNNNN_partial_19_0458,
  rs_R009_ueqv_R009YNNNN_partial_19_0459,
  rs_R009_ueqv_R009YNNNN_partial_19_0460,
  rs_R009_ueqv_R009YNNNN_partial_19_0461,
  rs_R009_ueqv_R009YNNNN_partial_19_0462,
  rs_R009_ueqv_R009YNNNN_partial_19_0463,
  rs_R009_ueqv_R009YNNNN_partial_19_0464,
  rs_R009_ueqv_R009YNNNN_partial_19_0465,
  rs_R009_ueqv_R009YNNNN_partial_19_0466,
  rs_R009_ueqv_R009YNNNN_partial_19_0467,
  rs_R009_ueqv_R009YNNNN_partial_19_0468,
  rs_R009_ueqv_R009YNNNN_partial_19_0469,
  rs_R009_ueqv_R009YNNNN_partial_19_0470,
  rs_R009_ueqv_R009YNNNN_partial_19_0471,
  rs_R009_ueqv_R009YNNNN_partial_19_0472,
  rs_R009_ueqv_R009YNNNN_partial_19_0473,
  rs_R009_ueqv_R009YNNNN_partial_19_0474,
  rs_R009_ueqv_R009YNNNN_partial_19_0475,
  rs_R009_ueqv_R009YNNNN_partial_19_0476,
  rs_R009_ueqv_R009YNNNN_partial_19_0477,
  rs_R009_ueqv_R009YNNNN_partial_19_0478,
  rs_R009_ueqv_R009YNNNN_partial_19_0479,
  rs_R009_ueqv_R009YNNNN_partial_19_0480,
  rs_R009_ueqv_R009YNNNN_partial_19_0481,
  rs_R009_ueqv_R009YNNNN_partial_19_0482,
  rs_R009_ueqv_R009YNNNN_partial_19_0483,
  rs_R009_ueqv_R009YNNNN_partial_19_0484,
  rs_R009_ueqv_R009YNNNN_partial_19_0485,
  rs_R009_ueqv_R009YNNNN_partial_19_0486,
  rs_R009_ueqv_R009YNNNN_partial_19_0487,
  rs_R009_ueqv_R009YNNNN_partial_19_0488,
  rs_R009_ueqv_R009YNNNN_partial_19_0489,
  rs_R009_ueqv_R009YNNNN_partial_19_0490,
  rs_R009_ueqv_R009YNNNN_partial_19_0491,
  rs_R009_ueqv_R009YNNNN_partial_19_0492,
  rs_R009_ueqv_R009YNNNN_partial_19_0493,
  rs_R009_ueqv_R009YNNNN_partial_19_0494,
  rs_R009_ueqv_R009YNNNN_partial_19_0495,
  rs_R009_ueqv_R009YNNNN_partial_19_0496,
  rs_R009_ueqv_R009YNNNN_partial_19_0497
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_19_0400_0497 : Poly :=
[
  term ((176 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11368469687065784 : Rat) / 6527410339149) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((74 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(8, 1), (10, 1), (11, 2)],
  term ((-239616 : Rat) / 553) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-108418763473967 : Rat) / 532849823604) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-101 : Rat) / 42) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-5 : Rat) / 3) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((15073554766871 : Rat) / 44404151967) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((22 : Rat) / 7) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-50294700516790819 : Rat) / 52219282713192) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((15425 : Rat) / 252) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2221000328240293 : Rat) / 2797461573921) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-502 : Rat) / 63) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6733812628546 : Rat) / 14801383989) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-260 : Rat) / 7) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2030800143635 : Rat) / 532849823604) [(8, 1), (10, 1), (13, 2)],
  term ((2438286298446361 : Rat) / 1598549470812) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-7645 : Rat) / 126) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 9867589326) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((305 : Rat) / 7) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-6162378460521091 : Rat) / 26109641356596) [(8, 1), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1441050862988258 : Rat) / 6527410339149) [(8, 1), (10, 1), (15, 2)],
  term ((550 : Rat) / 63) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((239616 : Rat) / 553) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-4353333743611 : Rat) / 14801383989) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term (30 : Rat) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((4238595271243 : Rat) / 14801383989) [(8, 1), (10, 2), (15, 2)],
  term ((-176 : Rat) / 7) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((82604286814447 : Rat) / 355233215736) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2438286298446361 : Rat) / 1598549470812) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((7645 : Rat) / 126) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 9867589326) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-425 : Rat) / 84) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8768283710970787 : Rat) / 13054820678298) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3170 : Rat) / 63) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((829570191737071 : Rat) / 1864974382614) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((95 : Rat) / 21) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6733812628546 : Rat) / 14801383989) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((260 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-141892296469537 : Rat) / 236822143824) [(8, 1), (11, 1), (13, 1)],
  term ((-194964516983104787 : Rat) / 156657848139576) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((14615 : Rat) / 252) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((103617756485 : Rat) / 13156785768) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-915 : Rat) / 28) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((325 : Rat) / 168) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2959803568109608 : Rat) / 6527410339149) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3089 : Rat) / 63) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-13162473829053971 : Rat) / 6527410339149) [(8, 1), (11, 1), (15, 1)],
  term ((-31 : Rat) / 42) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 9867589326) [(8, 1), (11, 1), (15, 3)],
  term ((195 : Rat) / 7) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-6293781573290 : Rat) / 44404151967) [(8, 1), (11, 2)],
  term ((-114816 : Rat) / 553) [(8, 1), (11, 2), (12, 1)],
  term ((4657638917455598 : Rat) / 6527410339149) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-479232 : Rat) / 553) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((34560164924602483 : Rat) / 13054820678298) [(8, 1), (11, 2), (14, 1)],
  term ((-359424 : Rat) / 553) [(8, 1), (11, 2), (15, 2)],
  term ((-1934854446325 : Rat) / 355233215736) [(8, 1), (12, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-305 : Rat) / 28) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46953690839072645 : Rat) / 104438565426384) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-841 : Rat) / 168) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 532849823604) [(8, 1), (12, 1), (13, 2)],
  term ((475 : Rat) / 42) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-32516523481 : Rat) / 2819311236) [(8, 1), (12, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-496223218750097 : Rat) / 4351606892766) [(8, 1), (12, 1), (15, 2)],
  term ((-163 : Rat) / 42) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((52046412815447245 : Rat) / 52219282713192) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((2215 : Rat) / 252) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-29380434373421465 : Rat) / 313315696279152) [(8, 1), (13, 1), (15, 1)],
  term ((4103 : Rat) / 504) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(8, 1), (13, 1), (15, 3)],
  term ((65 : Rat) / 7) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((13258656828593 : Rat) / 710466431472) [(8, 1), (13, 2)],
  term ((-8835273554173081 : Rat) / 6394197883248) [(8, 1), (13, 2), (14, 1)],
  term ((2365 : Rat) / 504) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(8, 1), (13, 2), (15, 2)],
  term ((-305 : Rat) / 28) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2455 : Rat) / 168) [(8, 1), (13, 2), (16, 1)],
  term ((-26493807330721183 : Rat) / 104438565426384) [(8, 1), (14, 1)],
  term ((413194774214435 : Rat) / 1450535630922) [(8, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(8, 1), (14, 1), (16, 1)],
  term ((122681445924503923 : Rat) / 104438565426384) [(8, 1), (14, 2)],
  term ((158982611033841695 : Rat) / 104438565426384) [(8, 1), (15, 2)],
  term ((-407 : Rat) / 126) [(8, 1), (15, 2), (16, 1)],
  term ((-88 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5684234843532892 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)],
  term ((-37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (14, 1)],
  term ((108418763473967 : Rat) / 1065699647208) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((101 : Rat) / 84) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 2)],
  term ((5 : Rat) / 6) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-15073554766871 : Rat) / 88808303934) [(10, 1), (12, 1), (15, 2)],
  term ((-11 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((50294700516790819 : Rat) / 104438565426384) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15425 : Rat) / 504) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((2221000328240293 : Rat) / 5594923147842) [(10, 1), (13, 1), (15, 1)],
  term ((251 : Rat) / 63) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(10, 1), (13, 1), (15, 3)],
  term ((130 : Rat) / 7) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2030800143635 : Rat) / 1065699647208) [(10, 1), (13, 2)],
  term ((-2438286298446361 : Rat) / 3197098941624) [(10, 1), (13, 2), (14, 1)],
  term ((7645 : Rat) / 252) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(10, 1), (13, 2), (15, 2)],
  term ((-305 : Rat) / 14) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 12) [(10, 1), (13, 2), (16, 1)],
  term ((6162378460521091 : Rat) / 52219282713192) [(10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-720525431494129 : Rat) / 6527410339149) [(10, 1), (15, 2)],
  term ((-275 : Rat) / 63) [(10, 1), (15, 2), (16, 1)],
  term ((-119808 : Rat) / 553) [(10, 2), (11, 1), (15, 1)],
  term ((4353333743611 : Rat) / 29602767978) [(10, 2), (13, 1), (15, 1)],
  term (-15 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4238595271243 : Rat) / 29602767978) [(10, 2), (15, 2)],
  term ((88 : Rat) / 7) [(10, 2), (15, 2), (16, 1)],
  term ((-82604286814447 : Rat) / 710466431472) [(11, 1), (12, 1), (13, 1)],
  term ((2438286298446361 : Rat) / 3197098941624) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7645 : Rat) / 252) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((425 : Rat) / 168) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8768283710970787 : Rat) / 26109641356596) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1585 : Rat) / 63) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-829570191737071 : Rat) / 3729948765228) [(11, 1), (12, 1), (15, 1)],
  term ((-95 : Rat) / 42) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (12, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((141892296469537 : Rat) / 473644287648) [(11, 1), (13, 1)],
  term ((194964516983104787 : Rat) / 313315696279152) [(11, 1), (13, 1), (14, 1)],
  term ((-14615 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-103617756485 : Rat) / 26313571536) [(11, 1), (13, 1), (15, 2)],
  term ((915 : Rat) / 56) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-325 : Rat) / 336) [(11, 1), (13, 1), (16, 1)],
  term ((1479901784054804 : Rat) / 6527410339149) [(11, 1), (14, 1), (15, 1)],
  term ((3089 : Rat) / 126) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)],
  term ((13162473829053971 : Rat) / 13054820678298) [(11, 1), (15, 1)],
  term ((31 : Rat) / 84) [(11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 19735178652) [(11, 1), (15, 3)],
  term ((-195 : Rat) / 14) [(11, 1), (15, 3), (16, 1)],
  term ((3146890786645 : Rat) / 44404151967) [(11, 2)],
  term ((57408 : Rat) / 553) [(11, 2), (12, 1)],
  term ((-2328819458727799 : Rat) / 6527410339149) [(11, 2), (12, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(11, 2), (12, 1), (15, 2)],
  term ((-34560164924602483 : Rat) / 26109641356596) [(11, 2), (14, 1)],
  term ((179712 : Rat) / 553) [(11, 2), (15, 2)],
  term ((1934854446325 : Rat) / 710466431472) [(12, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((305 : Rat) / 56) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46953690839072645 : Rat) / 208877130852768) [(12, 1), (13, 1), (15, 1)],
  term ((841 : Rat) / 336) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(12, 1), (13, 2)],
  term ((-475 : Rat) / 84) [(12, 1), (13, 2), (16, 1)],
  term ((32516523481 : Rat) / 5638622472) [(12, 1), (14, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(12, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((496223218750097 : Rat) / 8703213785532) [(12, 1), (15, 2)],
  term ((163 : Rat) / 84) [(12, 1), (15, 2), (16, 1)],
  term ((-52046412815447245 : Rat) / 104438565426384) [(13, 1), (14, 1), (15, 1)],
  term ((-2215 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)],
  term ((29380434373421465 : Rat) / 626631392558304) [(13, 1), (15, 1)],
  term ((-4103 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(13, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(13, 1), (15, 3), (16, 1)],
  term ((-13258656828593 : Rat) / 1420932862944) [(13, 2)],
  term ((8835273554173081 : Rat) / 12788395766496) [(13, 2), (14, 1)],
  term ((-2365 : Rat) / 1008) [(13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(13, 2), (15, 2)],
  term ((305 : Rat) / 56) [(13, 2), (15, 2), (16, 1)],
  term ((2455 : Rat) / 336) [(13, 2), (16, 1)],
  term ((26493807330721183 : Rat) / 208877130852768) [(14, 1)],
  term ((-413194774214435 : Rat) / 2901071261844) [(14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(14, 1), (16, 1)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(14, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(15, 2)],
  term ((407 : Rat) / 252) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 400 through 497. -/
theorem rs_R009_ueqv_R009YNNNN_block_19_0400_0497_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_19_0400_0497
      rs_R009_ueqv_R009YNNNN_block_19_0400_0497 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
