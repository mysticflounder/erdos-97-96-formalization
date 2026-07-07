/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0400 : Poly :=
[
  term ((596764560 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 400 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0400 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0400
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0401 : Poly :=
[
  term ((-2921802012 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 401 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0401 : Poly :=
[
  term ((-5843604024 : Rat) / 12247399) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((2921802012 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0401
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0402 : Poly :=
[
  term ((12730977280 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (11, 2)]
]

/-- Partial product 402 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0402 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0402
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0403 : Poly :=
[
  term ((-589910160 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 403 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0403 : Poly :=
[
  term ((-1179820320 : Rat) / 12247399) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((589910160 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0403
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0404 : Poly :=
[
  term ((9762801068 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (15, 2)]
]

/-- Partial product 404 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0404 : Poly :=
[
  term ((19525602136 : Rat) / 110226591) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2)],
  term ((-9762801068 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0404
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0405 : Poly :=
[
  term ((22051204672 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (11, 1)]
]

/-- Partial product 405 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0405 : Poly :=
[
  term ((44102409344 : Rat) / 6282915687) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0405
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0406 : Poly :=
[
  term ((344550073 : Rat) / 232700581) [(4, 1), (5, 1), (9, 2), (13, 1)]
]

/-- Partial product 406 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0406 : Poly :=
[
  term ((689100146 : Rat) / 232700581) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(4, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0406
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0407 : Poly :=
[
  term ((-38452883834 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (15, 1)]
]

/-- Partial product 407 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0407 : Poly :=
[
  term ((-76905767668 : Rat) / 6282915687) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0407
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0408 : Poly :=
[
  term ((213 : Rat) / 67) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 408 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0408 : Poly :=
[
  term ((426 : Rat) / 67) [(4, 1), (7, 1), (8, 1), (9, 1)],
  term ((-213 : Rat) / 67) [(4, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0408
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0409 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 409 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0409 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0409
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0410 : Poly :=
[
  term ((-52834967632828 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 410 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0410 : Poly :=
[
  term ((-105669935265656 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((52834967632828 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0410
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0411 : Poly :=
[
  term ((13709016478528 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0411 : Poly :=
[
  term ((27418032957056 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13709016478528 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0411
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0412 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(4, 1), (7, 1), (9, 1), (11, 2)]
]

/-- Partial product 412 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0412 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(4, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0412
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0413 : Poly :=
[
  term ((-520251963952 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 413 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0413 : Poly :=
[
  term ((-1040503927904 : Rat) / 17452543575) [(4, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((520251963952 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0413
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0414 : Poly :=
[
  term ((214203382477 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0414 : Poly :=
[
  term ((428406764954 : Rat) / 17452543575) [(4, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-214203382477 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0414
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0415 : Poly :=
[
  term ((196 : Rat) / 67) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 415 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0415 : Poly :=
[
  term ((392 : Rat) / 67) [(4, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0415
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0416 : Poly :=
[
  term ((32126527377344 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 416 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0416 : Poly :=
[
  term ((64253054754688 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-32126527377344 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0416_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0416
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0417 : Poly :=
[
  term ((-15330569567894 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 417 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0417 : Poly :=
[
  term ((-30661139135788 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((15330569567894 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0417_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0417
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0418 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (11, 1)]
]

/-- Partial product 418 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0418 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0418_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0418
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0419 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(4, 1), (7, 1), (9, 2), (13, 1)]
]

/-- Partial product 419 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0419 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(4, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(4, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0419_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0419
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0420 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (15, 1)]
]

/-- Partial product 420 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0420 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (7, 1), (8, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0420_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0420
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0421 : Poly :=
[
  term ((36044848896 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 421 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0421 : Poly :=
[
  term ((72089697792 : Rat) / 1163502905) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-36044848896 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0421_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0421
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0422 : Poly :=
[
  term ((15206420628 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 422 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0422 : Poly :=
[
  term ((30412841256 : Rat) / 1163502905) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-15206420628 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0422_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0422
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0423 : Poly :=
[
  term ((-32504729808 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 423 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0423 : Poly :=
[
  term ((-65009459616 : Rat) / 1163502905) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((32504729808 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0423_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0423
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0424 : Poly :=
[
  term ((30555565077866 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 424 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0424 : Poly :=
[
  term ((61111130155732 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-30555565077866 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0424_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0424
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0425 : Poly :=
[
  term ((34396342400 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 425 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0425 : Poly :=
[
  term ((68792684800 : Rat) / 330679773) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-34396342400 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0425_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0425
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0426 : Poly :=
[
  term ((779878400 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 426 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0426 : Poly :=
[
  term ((1559756800 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0426_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0426
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0427 : Poly :=
[
  term ((58186240 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 427 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0427 : Poly :=
[
  term ((116372480 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-58186240 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0427_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0427
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0428 : Poly :=
[
  term ((-2104176093824 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 428 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0428 : Poly :=
[
  term ((-4208352187648 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((2104176093824 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0428_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0428
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0429 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 429 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0429 : Poly :=
[
  term ((77987840 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0429_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0429
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0430 : Poly :=
[
  term ((103342925728 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 430 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0430 : Poly :=
[
  term ((206685851456 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-103342925728 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0430_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0430
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0431 : Poly :=
[
  term ((-7496075840 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 431 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0431 : Poly :=
[
  term ((-14992151680 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((7496075840 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0431_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0431
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0432 : Poly :=
[
  term ((-2320 : Rat) / 201) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 432 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0432 : Poly :=
[
  term ((-4640 : Rat) / 201) [(4, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2320 : Rat) / 201) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0432_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0432
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0433 : Poly :=
[
  term ((-202546857628 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 433 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0433 : Poly :=
[
  term ((-405093715256 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0433_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0433
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0434 : Poly :=
[
  term ((136478720 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 434 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0434 : Poly :=
[
  term ((272957440 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-136478720 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0434_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0434
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0435 : Poly :=
[
  term ((537442850 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 435 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0435 : Poly :=
[
  term ((1074885700 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-537442850 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0435_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0435
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0436 : Poly :=
[
  term ((36556800 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 436 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0436 : Poly :=
[
  term ((73113600 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0436_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0436
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0437 : Poly :=
[
  term ((-30218576122 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 437 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0437 : Poly :=
[
  term ((-60437152244 : Rat) / 330679773) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((30218576122 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0437_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0437
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0438 : Poly :=
[
  term ((63 : Rat) / 67) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0438 : Poly :=
[
  term ((126 : Rat) / 67) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 67) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0438_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0438
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0439 : Poly :=
[
  term ((-703283200 : Rat) / 110226591) [(4, 1), (7, 1), (12, 1), (15, 3)]
]

/-- Partial product 439 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0439 : Poly :=
[
  term ((-1406566400 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(4, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0439_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0439
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0440 : Poly :=
[
  term ((1414767379151 : Rat) / 69810174300) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 440 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0440 : Poly :=
[
  term ((1414767379151 : Rat) / 34905087150) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-1414767379151 : Rat) / 69810174300) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0440_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0440
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0441 : Poly :=
[
  term ((-32877751466 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 441 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0441 : Poly :=
[
  term ((-65755502932 : Rat) / 918554925) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((32877751466 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0441_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0441
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0442 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 442 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0442 : Poly :=
[
  term ((10967040 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0442_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0442
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0443 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 443 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0443 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0443_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0443
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0444 : Poly :=
[
  term ((-1787642720 : Rat) / 36742197) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 444 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0444 : Poly :=
[
  term ((-3575285440 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((1787642720 : Rat) / 36742197) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0444_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0444
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0445 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 445 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0445 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0445_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0445
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0446 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 446 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0446 : Poly :=
[
  term ((10967040 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0446_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0446
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0447 : Poly :=
[
  term ((1607307424552 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 447 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0447 : Poly :=
[
  term ((3214614849104 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1607307424552 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0447_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0447
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0448 : Poly :=
[
  term ((-20641044794 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0448 : Poly :=
[
  term ((-41282089588 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((20641044794 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0448_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0448
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0449 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(4, 1), (7, 1), (14, 1), (15, 3)]
]

/-- Partial product 449 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0449 : Poly :=
[
  term ((-70328320 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(4, 1), (7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0449_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0449
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0450 : Poly :=
[
  term ((-25655716231511 : Rat) / 942437353050) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 450 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0450 : Poly :=
[
  term ((-25655716231511 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((25655716231511 : Rat) / 942437353050) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0450_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0450
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0451 : Poly :=
[
  term ((-30318188881 : Rat) / 24800982975) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0451 : Poly :=
[
  term ((-60636377762 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 24800982975) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0451_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0451
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0452 : Poly :=
[
  term ((11238116480 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)]
]

/-- Partial product 452 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0452 : Poly :=
[
  term ((22476232960 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (15, 3)],
  term ((-11238116480 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0452_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0452
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0453 : Poly :=
[
  term ((1264 : Rat) / 67) [(4, 1), (7, 2)]
]

/-- Partial product 453 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0453 : Poly :=
[
  term ((-1264 : Rat) / 67) [(4, 1), (7, 2)],
  term ((2528 : Rat) / 67) [(4, 1), (7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0453_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0453
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0454 : Poly :=
[
  term ((-7681428414464 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (11, 1)]
]

/-- Partial product 454 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0454 : Poly :=
[
  term ((-15362856828928 : Rat) / 471218676525) [(4, 1), (7, 2), (8, 1), (9, 1), (11, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0454_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0454
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0455 : Poly :=
[
  term ((-120022318976 : Rat) / 17452543575) [(4, 1), (7, 2), (9, 1), (13, 1)]
]

/-- Partial product 455 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0455 : Poly :=
[
  term ((-240044637952 : Rat) / 17452543575) [(4, 1), (7, 2), (8, 1), (9, 1), (13, 1)],
  term ((120022318976 : Rat) / 17452543575) [(4, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0455_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0455
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0456 : Poly :=
[
  term ((9107267927722 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (15, 1)]
]

/-- Partial product 456 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0456 : Poly :=
[
  term ((18214535855444 : Rat) / 471218676525) [(4, 1), (7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0456_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0456
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0457 : Poly :=
[
  term ((-397843040 : Rat) / 12247399) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 457 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0457 : Poly :=
[
  term ((-795686080 : Rat) / 12247399) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(4, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0457_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0457
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0458 : Poly :=
[
  term ((33753231443752 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1)]
]

/-- Partial product 458 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0458 : Poly :=
[
  term ((67506462887504 : Rat) / 157072892175) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0458_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0458
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0459 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0459 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0459_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0459
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0460 : Poly :=
[
  term ((-25461954560 : Rat) / 330679773) [(4, 1), (7, 2), (11, 2)]
]

/-- Partial product 460 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0460 : Poly :=
[
  term ((-50923909120 : Rat) / 330679773) [(4, 1), (7, 2), (8, 1), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(4, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0460_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0460
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0461 : Poly :=
[
  term ((323864637768 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

/-- Partial product 461 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0461 : Poly :=
[
  term ((647729275536 : Rat) / 5817514525) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0461_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0461
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0462 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0462 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((34264938442 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0462_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0462
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0463 : Poly :=
[
  term ((-392 : Rat) / 67) [(4, 1), (7, 2), (14, 1)]
]

/-- Partial product 463 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0463 : Poly :=
[
  term ((-784 : Rat) / 67) [(4, 1), (7, 2), (8, 1), (14, 1)],
  term ((392 : Rat) / 67) [(4, 1), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0463_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0463
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0464 : Poly :=
[
  term ((-2094906592144 : Rat) / 17452543575) [(4, 1), (7, 2), (15, 2)]
]

/-- Partial product 464 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0464 : Poly :=
[
  term ((-4189813184288 : Rat) / 17452543575) [(4, 1), (7, 2), (8, 1), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(4, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0464_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0464
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0465 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 465 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0465 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(4, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0465_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0465
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0466 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(4, 1), (7, 3), (11, 1)]
]

/-- Partial product 466 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0466 : Poly :=
[
  term ((8771824241152 : Rat) / 157072892175) [(4, 1), (7, 3), (8, 1), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 1), (7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0466_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0466
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0467 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(4, 1), (7, 3), (13, 1)]
]

/-- Partial product 467 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0467 : Poly :=
[
  term ((137059753768 : Rat) / 5817514525) [(4, 1), (7, 3), (8, 1), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0467_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0467
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0468 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(4, 1), (7, 3), (15, 1)]
]

/-- Partial product 468 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0468 : Poly :=
[
  term ((-9579498314696 : Rat) / 157072892175) [(4, 1), (7, 3), (8, 1), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0468_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0468
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0469 : Poly :=
[
  term ((14884800 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 469 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0469 : Poly :=
[
  term ((-14884800 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((29769600 : Rat) / 12247399) [(4, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0469_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0469
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0470 : Poly :=
[
  term ((-286355200 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 470 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0470 : Poly :=
[
  term ((286355200 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-572710400 : Rat) / 110226591) [(4, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0470_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0470
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0471 : Poly :=
[
  term ((317542400 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2)]
]

/-- Partial product 471 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0471 : Poly :=
[
  term ((-317542400 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2)],
  term ((635084800 : Rat) / 110226591) [(4, 1), (8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0471_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0471
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0472 : Poly :=
[
  term ((267594450116 : Rat) / 31414578435) [(4, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 472 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0472 : Poly :=
[
  term ((535188900232 : Rat) / 31414578435) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-267594450116 : Rat) / 31414578435) [(4, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0472_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0472
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0473 : Poly :=
[
  term ((2745235724 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 473 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0473 : Poly :=
[
  term ((5490471448 : Rat) / 1163502905) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2745235724 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0473_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0473
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0474 : Poly :=
[
  term ((-173755879558 : Rat) / 31414578435) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 474 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0474 : Poly :=
[
  term ((-347511759116 : Rat) / 31414578435) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((173755879558 : Rat) / 31414578435) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0474_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0474
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0475 : Poly :=
[
  term ((-15113415474343 : Rat) / 471218676525) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 475 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0475 : Poly :=
[
  term ((-30226830948686 : Rat) / 471218676525) [(4, 1), (8, 1), (9, 1), (11, 1)],
  term ((15113415474343 : Rat) / 471218676525) [(4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0475_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0475
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0476 : Poly :=
[
  term ((-19956976256 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 476 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0476 : Poly :=
[
  term ((-39913952512 : Rat) / 330679773) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((19956976256 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0476_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0476
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0477 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 477 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0477 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0477_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0477
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0478 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 478 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0478 : Poly :=
[
  term ((-779878400 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0478_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0478
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0479 : Poly :=
[
  term ((-30464000 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 479 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0479 : Poly :=
[
  term ((-60928000 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((30464000 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0479_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0479
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0480 : Poly :=
[
  term ((-100956586388 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 480 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0480 : Poly :=
[
  term ((-201913172776 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((100956586388 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0480_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0480
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0481 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 481 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0481 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0481_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0481
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0482 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 482 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0482 : Poly :=
[
  term ((-413371702912 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0482_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0482
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0483 : Poly :=
[
  term ((-4874240 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 2)]
]

/-- Partial product 483 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0483 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 2)],
  term ((4874240 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0483_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0483
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0484 : Poly :=
[
  term ((423518240 : Rat) / 12247399) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 484 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0484 : Poly :=
[
  term ((847036480 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-423518240 : Rat) / 12247399) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0484_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0484
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0485 : Poly :=
[
  term ((4640 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 485 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0485 : Poly :=
[
  term ((9280 : Rat) / 201) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0485_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0485
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0486 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 486 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0486 : Poly :=
[
  term ((810187430512 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0486_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0486
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0487 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 487 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0487 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0487_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0487
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0488 : Poly :=
[
  term ((-311827754 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 488 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0488 : Poly :=
[
  term ((-623655508 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((311827754 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0488_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0488
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0489 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 489 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0489 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0489_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0489
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0490 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 490 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0490 : Poly :=
[
  term ((-36556800 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0490_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0490
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0491 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 491 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0491 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0491_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0491
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0492 : Poly :=
[
  term ((17730398062 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 492 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0492 : Poly :=
[
  term ((35460796124 : Rat) / 330679773) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-17730398062 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0492_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0492
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0493 : Poly :=
[
  term ((-126 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 493 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0493 : Poly :=
[
  term ((-252 : Rat) / 67) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0493_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0493
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0494 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (15, 3)]
]

/-- Partial product 494 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0494 : Poly :=
[
  term ((703283200 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0494_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0494
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0495 : Poly :=
[
  term ((-722605788373 : Rat) / 69810174300) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 495 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0495 : Poly :=
[
  term ((-722605788373 : Rat) / 34905087150) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((722605788373 : Rat) / 69810174300) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0495_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0495
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0496 : Poly :=
[
  term ((-443819642 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 496 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0496 : Poly :=
[
  term ((-887639284 : Rat) / 918554925) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((443819642 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0496_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0496
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0497 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 497 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0497 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0497_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0497
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0498 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 498 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0498 : Poly :=
[
  term ((-6458932858 : Rat) / 918554925) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0498_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0498
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0499 : Poly :=
[
  term ((-685440 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 499 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0499 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 2)],
  term ((685440 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0499_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0499
        rs_R009_ueqv_R009NNNYN_generator_19_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_19_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_0400_0499 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_0400,
  rs_R009_ueqv_R009NNNYN_partial_19_0401,
  rs_R009_ueqv_R009NNNYN_partial_19_0402,
  rs_R009_ueqv_R009NNNYN_partial_19_0403,
  rs_R009_ueqv_R009NNNYN_partial_19_0404,
  rs_R009_ueqv_R009NNNYN_partial_19_0405,
  rs_R009_ueqv_R009NNNYN_partial_19_0406,
  rs_R009_ueqv_R009NNNYN_partial_19_0407,
  rs_R009_ueqv_R009NNNYN_partial_19_0408,
  rs_R009_ueqv_R009NNNYN_partial_19_0409,
  rs_R009_ueqv_R009NNNYN_partial_19_0410,
  rs_R009_ueqv_R009NNNYN_partial_19_0411,
  rs_R009_ueqv_R009NNNYN_partial_19_0412,
  rs_R009_ueqv_R009NNNYN_partial_19_0413,
  rs_R009_ueqv_R009NNNYN_partial_19_0414,
  rs_R009_ueqv_R009NNNYN_partial_19_0415,
  rs_R009_ueqv_R009NNNYN_partial_19_0416,
  rs_R009_ueqv_R009NNNYN_partial_19_0417,
  rs_R009_ueqv_R009NNNYN_partial_19_0418,
  rs_R009_ueqv_R009NNNYN_partial_19_0419,
  rs_R009_ueqv_R009NNNYN_partial_19_0420,
  rs_R009_ueqv_R009NNNYN_partial_19_0421,
  rs_R009_ueqv_R009NNNYN_partial_19_0422,
  rs_R009_ueqv_R009NNNYN_partial_19_0423,
  rs_R009_ueqv_R009NNNYN_partial_19_0424,
  rs_R009_ueqv_R009NNNYN_partial_19_0425,
  rs_R009_ueqv_R009NNNYN_partial_19_0426,
  rs_R009_ueqv_R009NNNYN_partial_19_0427,
  rs_R009_ueqv_R009NNNYN_partial_19_0428,
  rs_R009_ueqv_R009NNNYN_partial_19_0429,
  rs_R009_ueqv_R009NNNYN_partial_19_0430,
  rs_R009_ueqv_R009NNNYN_partial_19_0431,
  rs_R009_ueqv_R009NNNYN_partial_19_0432,
  rs_R009_ueqv_R009NNNYN_partial_19_0433,
  rs_R009_ueqv_R009NNNYN_partial_19_0434,
  rs_R009_ueqv_R009NNNYN_partial_19_0435,
  rs_R009_ueqv_R009NNNYN_partial_19_0436,
  rs_R009_ueqv_R009NNNYN_partial_19_0437,
  rs_R009_ueqv_R009NNNYN_partial_19_0438,
  rs_R009_ueqv_R009NNNYN_partial_19_0439,
  rs_R009_ueqv_R009NNNYN_partial_19_0440,
  rs_R009_ueqv_R009NNNYN_partial_19_0441,
  rs_R009_ueqv_R009NNNYN_partial_19_0442,
  rs_R009_ueqv_R009NNNYN_partial_19_0443,
  rs_R009_ueqv_R009NNNYN_partial_19_0444,
  rs_R009_ueqv_R009NNNYN_partial_19_0445,
  rs_R009_ueqv_R009NNNYN_partial_19_0446,
  rs_R009_ueqv_R009NNNYN_partial_19_0447,
  rs_R009_ueqv_R009NNNYN_partial_19_0448,
  rs_R009_ueqv_R009NNNYN_partial_19_0449,
  rs_R009_ueqv_R009NNNYN_partial_19_0450,
  rs_R009_ueqv_R009NNNYN_partial_19_0451,
  rs_R009_ueqv_R009NNNYN_partial_19_0452,
  rs_R009_ueqv_R009NNNYN_partial_19_0453,
  rs_R009_ueqv_R009NNNYN_partial_19_0454,
  rs_R009_ueqv_R009NNNYN_partial_19_0455,
  rs_R009_ueqv_R009NNNYN_partial_19_0456,
  rs_R009_ueqv_R009NNNYN_partial_19_0457,
  rs_R009_ueqv_R009NNNYN_partial_19_0458,
  rs_R009_ueqv_R009NNNYN_partial_19_0459,
  rs_R009_ueqv_R009NNNYN_partial_19_0460,
  rs_R009_ueqv_R009NNNYN_partial_19_0461,
  rs_R009_ueqv_R009NNNYN_partial_19_0462,
  rs_R009_ueqv_R009NNNYN_partial_19_0463,
  rs_R009_ueqv_R009NNNYN_partial_19_0464,
  rs_R009_ueqv_R009NNNYN_partial_19_0465,
  rs_R009_ueqv_R009NNNYN_partial_19_0466,
  rs_R009_ueqv_R009NNNYN_partial_19_0467,
  rs_R009_ueqv_R009NNNYN_partial_19_0468,
  rs_R009_ueqv_R009NNNYN_partial_19_0469,
  rs_R009_ueqv_R009NNNYN_partial_19_0470,
  rs_R009_ueqv_R009NNNYN_partial_19_0471,
  rs_R009_ueqv_R009NNNYN_partial_19_0472,
  rs_R009_ueqv_R009NNNYN_partial_19_0473,
  rs_R009_ueqv_R009NNNYN_partial_19_0474,
  rs_R009_ueqv_R009NNNYN_partial_19_0475,
  rs_R009_ueqv_R009NNNYN_partial_19_0476,
  rs_R009_ueqv_R009NNNYN_partial_19_0477,
  rs_R009_ueqv_R009NNNYN_partial_19_0478,
  rs_R009_ueqv_R009NNNYN_partial_19_0479,
  rs_R009_ueqv_R009NNNYN_partial_19_0480,
  rs_R009_ueqv_R009NNNYN_partial_19_0481,
  rs_R009_ueqv_R009NNNYN_partial_19_0482,
  rs_R009_ueqv_R009NNNYN_partial_19_0483,
  rs_R009_ueqv_R009NNNYN_partial_19_0484,
  rs_R009_ueqv_R009NNNYN_partial_19_0485,
  rs_R009_ueqv_R009NNNYN_partial_19_0486,
  rs_R009_ueqv_R009NNNYN_partial_19_0487,
  rs_R009_ueqv_R009NNNYN_partial_19_0488,
  rs_R009_ueqv_R009NNNYN_partial_19_0489,
  rs_R009_ueqv_R009NNNYN_partial_19_0490,
  rs_R009_ueqv_R009NNNYN_partial_19_0491,
  rs_R009_ueqv_R009NNNYN_partial_19_0492,
  rs_R009_ueqv_R009NNNYN_partial_19_0493,
  rs_R009_ueqv_R009NNNYN_partial_19_0494,
  rs_R009_ueqv_R009NNNYN_partial_19_0495,
  rs_R009_ueqv_R009NNNYN_partial_19_0496,
  rs_R009_ueqv_R009NNNYN_partial_19_0497,
  rs_R009_ueqv_R009NNNYN_partial_19_0498,
  rs_R009_ueqv_R009NNNYN_partial_19_0499
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_0400_0499 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((25461954560 : Rat) / 110226591) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((19525602136 : Rat) / 110226591) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2)],
  term ((44102409344 : Rat) / 6282915687) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 232700581) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1)],
  term ((-596764560 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((2921802012 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12730977280 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (11, 2)],
  term ((589910160 : Rat) / 12247399) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-9762801068 : Rat) / 110226591) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((-22051204672 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(4, 1), (5, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 6282915687) [(4, 1), (5, 1), (9, 2), (15, 1)],
  term ((426 : Rat) / 67) [(4, 1), (7, 1), (8, 1), (9, 1)],
  term ((397843040 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-105669935265656 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((27418032957056 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(4, 1), (7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-1040503927904 : Rat) / 17452543575) [(4, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((428406764954 : Rat) / 17452543575) [(4, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(4, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((64253054754688 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-30661139135788 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (7, 1), (8, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 698101743) [(4, 1), (7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (7, 1), (8, 1), (9, 2), (15, 1)],
  term ((72089697792 : Rat) / 1163502905) [(4, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((30412841256 : Rat) / 1163502905) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-65009459616 : Rat) / 1163502905) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((61111130155732 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((68792684800 : Rat) / 330679773) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((1559756800 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((116372480 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4208352187648 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((77987840 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14992151680 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(4, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((272957440 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((1074885700 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((73113600 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-60437152244 : Rat) / 330679773) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1406566400 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 3)],
  term ((1414767379151 : Rat) / 34905087150) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-65755502932 : Rat) / 918554925) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((10967040 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3575285440 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((10967040 : Rat) / 12247399) [(4, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((3214614849104 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70328320 : Rat) / 36742197) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-25655716231511 : Rat) / 471218676525) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((22476232960 : Rat) / 110226591) [(4, 1), (7, 1), (8, 1), (15, 3)],
  term ((-213 : Rat) / 67) [(4, 1), (7, 1), (9, 1)],
  term ((-198921520 : Rat) / 12247399) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((52834967632828 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-13709016478528 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(4, 1), (7, 1), (9, 1), (11, 2)],
  term ((520251963952 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-214203382477 : Rat) / 17452543575) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-32126527377344 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((15330569567894 : Rat) / 471218676525) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 698101743) [(4, 1), (7, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 18848747061) [(4, 1), (7, 1), (9, 2), (15, 1)],
  term ((-36044848896 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((-15206420628 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((32504729808 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-30555565077866 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)],
  term ((-34396342400 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-58186240 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2104176093824 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-103342925728 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((7496075840 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((2320 : Rat) / 201) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-136478720 : Rat) / 110226591) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-537442850 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((30218576122 : Rat) / 330679773) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-63 : Rat) / 67) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(4, 1), (7, 1), (12, 1), (15, 3)],
  term ((-1414767379151 : Rat) / 69810174300) [(4, 1), (7, 1), (13, 1)],
  term ((32877751466 : Rat) / 918554925) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1787642720 : Rat) / 36742197) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-1607307424552 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((20641044794 : Rat) / 24800982975) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((25655716231511 : Rat) / 942437353050) [(4, 1), (7, 1), (15, 1)],
  term ((30318188881 : Rat) / 24800982975) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-11238116480 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)],
  term ((-1264 : Rat) / 67) [(4, 1), (7, 2)],
  term ((2528 : Rat) / 67) [(4, 1), (7, 2), (8, 1)],
  term ((-15362856828928 : Rat) / 471218676525) [(4, 1), (7, 2), (8, 1), (9, 1), (11, 1)],
  term ((-240044637952 : Rat) / 17452543575) [(4, 1), (7, 2), (8, 1), (9, 1), (13, 1)],
  term ((18214535855444 : Rat) / 471218676525) [(4, 1), (7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-795686080 : Rat) / 12247399) [(4, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((67506462887504 : Rat) / 157072892175) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50923909120 : Rat) / 330679773) [(4, 1), (7, 2), (8, 1), (11, 2)],
  term ((647729275536 : Rat) / 5817514525) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 1), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-784 : Rat) / 67) [(4, 1), (7, 2), (8, 1), (14, 1)],
  term ((-4189813184288 : Rat) / 17452543575) [(4, 1), (7, 2), (8, 1), (15, 2)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 1), (7, 2), (8, 1), (15, 2), (16, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((120022318976 : Rat) / 17452543575) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((397843040 : Rat) / 12247399) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(4, 1), (7, 2), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((34264938442 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(4, 1), (7, 2), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(4, 1), (7, 2), (15, 2)],
  term ((-2394874578674 : Rat) / 157072892175) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(4, 1), (7, 3), (8, 1), (11, 1)],
  term ((137059753768 : Rat) / 5817514525) [(4, 1), (7, 3), (8, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(4, 1), (7, 3), (8, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 1), (7, 3), (11, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 1), (7, 3), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 1), (7, 3), (15, 1)],
  term ((535188900232 : Rat) / 31414578435) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((5490471448 : Rat) / 1163502905) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-347511759116 : Rat) / 31414578435) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-30226830948686 : Rat) / 471218676525) [(4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-39913952512 : Rat) / 330679773) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-779878400 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-60928000 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-201913172776 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-413371702912 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9748480 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 2)],
  term ((847036480 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((9280 : Rat) / 201) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((810187430512 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-155975680 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-623655508 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36556800 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((35460796124 : Rat) / 330679773) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-252 : Rat) / 67) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-722605788373 : Rat) / 34905087150) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-887639284 : Rat) / 918554925) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1370880 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-14884800 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-317542400 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2)],
  term ((29769600 : Rat) / 12247399) [(4, 1), (8, 2), (11, 1), (13, 1)],
  term ((-572710400 : Rat) / 110226591) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((635084800 : Rat) / 110226591) [(4, 1), (8, 2), (11, 2)],
  term ((-267594450116 : Rat) / 31414578435) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2745235724 : Rat) / 1163502905) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((173755879558 : Rat) / 31414578435) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((15113415474343 : Rat) / 471218676525) [(4, 1), (9, 1), (11, 1)],
  term ((19956976256 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((389939200 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((30464000 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((100956586388 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((4874240 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-423518240 : Rat) / 12247399) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((77987840 : Rat) / 110226591) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((311827754 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((18278400 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17730398062 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((722605788373 : Rat) / 69810174300) [(4, 1), (9, 1), (13, 1)],
  term ((443819642 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((685440 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 400 through 499. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_0400_0499_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_0400_0499
      rs_R009_ueqv_R009NNNYN_block_19_0400_0499 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
