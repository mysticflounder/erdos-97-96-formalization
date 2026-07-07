/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 16:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0400 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 400 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0400 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (13, 1)],
  term ((34264938442 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0400
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0401 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 401 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0401 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (15, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0401
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0402 : Poly :=
[
  term ((445 : Rat) / 134) [(5, 1), (9, 1)]
]

/-- Partial product 402 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0402 : Poly :=
[
  term ((445 : Rat) / 67) [(5, 1), (6, 1), (9, 1)],
  term ((-445 : Rat) / 134) [(5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0402
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0403 : Poly :=
[
  term ((-298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 403 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0403 : Poly :=
[
  term ((-596764560 : Rat) / 12247399) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0403
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0404 : Poly :=
[
  term ((2292429057578 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 404 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0404 : Poly :=
[
  term ((4584858115156 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2292429057578 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0404
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0405 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0405 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0405
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0406 : Poly :=
[
  term ((-6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 406 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0406 : Poly :=
[
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0406
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0407 : Poly :=
[
  term ((72 : Rat) / 67) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 407 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0407 : Poly :=
[
  term ((144 : Rat) / 67) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-72 : Rat) / 67) [(5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0407
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0408 : Poly :=
[
  term ((17501539706 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 408 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0408 : Poly :=
[
  term ((35003079412 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-17501539706 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0408
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0409 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0409 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0409
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0410 : Poly :=
[
  term ((-911625258982 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 410 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0410 : Poly :=
[
  term ((-1823250517964 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((911625258982 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0410
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0411 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 411 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0411 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0411
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0412 : Poly :=
[
  term ((-11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 412 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0412 : Poly :=
[
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (11, 1)],
  term ((11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0412
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0413 : Poly :=
[
  term ((-344550073 : Rat) / 465401162) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 413 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0413 : Poly :=
[
  term ((-344550073 : Rat) / 232700581) [(5, 1), (6, 1), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 465401162) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0413
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0414 : Poly :=
[
  term ((19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 414 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0414 : Poly :=
[
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0414
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0415 : Poly :=
[
  term ((320699217664 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 415 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0415 : Poly :=
[
  term ((641398435328 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-320699217664 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0415
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0416 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 416 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0416 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0416_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0416
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0417 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 417 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0417 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0417_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0417
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0418 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 418 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0418 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0418_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0418
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0419 : Poly :=
[
  term ((5010925276 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 419 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0419 : Poly :=
[
  term ((10021850552 : Rat) / 1163502905) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((-5010925276 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0419_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0419
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0420 : Poly :=
[
  term ((-289201973072 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 420 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0420 : Poly :=
[
  term ((-578403946144 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((289201973072 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0420_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0420
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0421 : Poly :=
[
  term ((-88166267998 : Rat) / 471218676525) [(5, 1), (11, 1)]
]

/-- Partial product 421 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0421 : Poly :=
[
  term ((-176332535996 : Rat) / 471218676525) [(5, 1), (6, 1), (11, 1)],
  term ((88166267998 : Rat) / 471218676525) [(5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0421_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0421
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0422 : Poly :=
[
  term ((-1088267284 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 422 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0422 : Poly :=
[
  term ((-2176534568 : Rat) / 12247399) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((1088267284 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0422_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0422
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0423 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 423 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0423 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0423_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0423
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0424 : Poly :=
[
  term ((738133760 : Rat) / 330679773) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 424 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0424 : Poly :=
[
  term ((1476267520 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-738133760 : Rat) / 330679773) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0424_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0424
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0425 : Poly :=
[
  term ((-317696000 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 425 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0425 : Poly :=
[
  term ((-635392000 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((317696000 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0425_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0425
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0426 : Poly :=
[
  term ((-15841280 : Rat) / 36742197) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 426 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0426 : Poly :=
[
  term ((-31682560 : Rat) / 36742197) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((15841280 : Rat) / 36742197) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0426_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0426
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0427 : Poly :=
[
  term ((155015019712 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 427 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0427 : Poly :=
[
  term ((310030039424 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-155015019712 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0427_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0427
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0428 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 428 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0428 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0428_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0428
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0429 : Poly :=
[
  term ((-103342925728 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 429 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0429 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0429_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0429
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0430 : Poly :=
[
  term ((3820194080 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 430 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0430 : Poly :=
[
  term ((7640388160 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-3820194080 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0430_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0430
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0431 : Poly :=
[
  term ((2320 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 431 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0431 : Poly :=
[
  term ((4640 : Rat) / 201) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0431_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0431
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0432 : Poly :=
[
  term ((202546857628 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 432 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0432 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0432_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0432
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0433 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 433 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0433 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0433_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0433
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0434 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 434 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0434 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0434_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0434
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0435 : Poly :=
[
  term ((-6810993 : Rat) / 182797) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 435 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0435 : Poly :=
[
  term ((-13621986 : Rat) / 182797) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((6810993 : Rat) / 182797) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0435_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0435
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0436 : Poly :=
[
  term ((11533340 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 436 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0436 : Poly :=
[
  term ((23066680 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11533340 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0436_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0436
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0437 : Poly :=
[
  term ((-17364480 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 437 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0437 : Poly :=
[
  term ((-34728960 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((17364480 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0437_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0437
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0438 : Poly :=
[
  term ((-310281112 : Rat) / 330679773) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 438 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0438 : Poly :=
[
  term ((-620562224 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((310281112 : Rat) / 330679773) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0438_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0438
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0439 : Poly :=
[
  term ((954062267 : Rat) / 12247399) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 439 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0439 : Poly :=
[
  term ((1908124534 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-954062267 : Rat) / 12247399) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0439_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0439
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0440 : Poly :=
[
  term ((-63 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0440 : Poly :=
[
  term ((-126 : Rat) / 67) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0440_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0440
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0441 : Poly :=
[
  term ((334059520 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 441 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0441 : Poly :=
[
  term ((668119040 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((-334059520 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0441_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0441
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0442 : Poly :=
[
  term ((476022400819 : Rat) / 139620348600) [(5, 1), (13, 1)]
]

/-- Partial product 442 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0442 : Poly :=
[
  term ((476022400819 : Rat) / 69810174300) [(5, 1), (6, 1), (13, 1)],
  term ((-476022400819 : Rat) / 139620348600) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0442_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0442
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0443 : Poly :=
[
  term ((2422109683 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 443 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0443 : Poly :=
[
  term ((4844219366 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2422109683 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0443_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0443
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0444 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 444 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0444 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0444_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0444
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0445 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 445 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0445 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0445_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0445
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0446 : Poly :=
[
  term ((889545520 : Rat) / 36742197) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 446 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0446 : Poly :=
[
  term ((1779091040 : Rat) / 36742197) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-889545520 : Rat) / 36742197) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0446_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0446
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0447 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 447 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0447 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0447_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0447
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0448 : Poly :=
[
  term ((-685440 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 448 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0448 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((685440 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0448_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0448
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0449 : Poly :=
[
  term ((-1349022326 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 449 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0449 : Poly :=
[
  term ((-2698044652 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((1349022326 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0449_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0449
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0450 : Poly :=
[
  term ((20641044794 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0450 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0450_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0450
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0451 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 451 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0451 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(5, 1), (6, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0451_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0451
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0452 : Poly :=
[
  term ((-26956557453109 : Rat) / 1884874706100) [(5, 1), (15, 1)]
]

/-- Partial product 452 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0452 : Poly :=
[
  term ((-26956557453109 : Rat) / 942437353050) [(5, 1), (6, 1), (15, 1)],
  term ((26956557453109 : Rat) / 1884874706100) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0452_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0452
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0453 : Poly :=
[
  term ((30318188881 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0453 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0453_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0453
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0454 : Poly :=
[
  term ((-5676200000 : Rat) / 110226591) [(5, 1), (15, 3)]
]

/-- Partial product 454 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0454 : Poly :=
[
  term ((-11352400000 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)],
  term ((5676200000 : Rat) / 110226591) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0454_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0454
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0455 : Poly :=
[
  term ((-1721 : Rat) / 134) [(5, 2)]
]

/-- Partial product 455 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0455 : Poly :=
[
  term ((1721 : Rat) / 134) [(5, 2)],
  term ((-1721 : Rat) / 67) [(5, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0455_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0455
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0456 : Poly :=
[
  term ((-2192956060288 : Rat) / 52357630725) [(5, 2), (7, 1), (11, 1)]
]

/-- Partial product 456 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0456 : Poly :=
[
  term ((-4385912120576 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((2192956060288 : Rat) / 52357630725) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0456_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0456
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0457 : Poly :=
[
  term ((-102794815326 : Rat) / 5817514525) [(5, 2), (7, 1), (13, 1)]
]

/-- Partial product 457 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0457 : Poly :=
[
  term ((-205589630652 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((102794815326 : Rat) / 5817514525) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0457_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0457
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0458 : Poly :=
[
  term ((2394874578674 : Rat) / 52357630725) [(5, 2), (7, 1), (15, 1)]
]

/-- Partial product 458 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0458 : Poly :=
[
  term ((4789749157348 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-2394874578674 : Rat) / 52357630725) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0458_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0458
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0459 : Poly :=
[
  term ((22051204672 : Rat) / 6282915687) [(5, 2), (9, 1), (11, 1)]
]

/-- Partial product 459 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0459 : Poly :=
[
  term ((44102409344 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0459_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0459
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0460 : Poly :=
[
  term ((344550073 : Rat) / 232700581) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 460 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0460 : Poly :=
[
  term ((689100146 : Rat) / 232700581) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0460_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0460
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0461 : Poly :=
[
  term ((-38452883834 : Rat) / 6282915687) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 461 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0461 : Poly :=
[
  term ((-76905767668 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0461_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0461
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0462 : Poly :=
[
  term ((596764560 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1)]
]

/-- Partial product 462 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0462 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0462_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0462
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0463 : Poly :=
[
  term ((-2921802012 : Rat) / 12247399) [(5, 2), (11, 1), (15, 1)]
]

/-- Partial product 463 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0463 : Poly :=
[
  term ((-5843604024 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((2921802012 : Rat) / 12247399) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0463_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0463
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0464 : Poly :=
[
  term ((12730977280 : Rat) / 110226591) [(5, 2), (11, 2)]
]

/-- Partial product 464 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0464 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(5, 2), (6, 1), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0464_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0464
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0465 : Poly :=
[
  term ((-589910160 : Rat) / 12247399) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 465 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0465 : Poly :=
[
  term ((-1179820320 : Rat) / 12247399) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((589910160 : Rat) / 12247399) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0465_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0465
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0466 : Poly :=
[
  term ((9762801068 : Rat) / 110226591) [(5, 2), (15, 2)]
]

/-- Partial product 466 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0466 : Poly :=
[
  term ((19525602136 : Rat) / 110226591) [(5, 2), (6, 1), (15, 2)],
  term ((-9762801068 : Rat) / 110226591) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0466_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0466
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0467 : Poly :=
[
  term ((-158 : Rat) / 67) [(6, 1)]
]

/-- Partial product 467 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0467 : Poly :=
[
  term ((158 : Rat) / 67) [(6, 1)],
  term ((-316 : Rat) / 67) [(6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0467_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0467
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0468 : Poly :=
[
  term ((-548239015072 : Rat) / 157072892175) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 468 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0468 : Poly :=
[
  term ((548239015072 : Rat) / 157072892175) [(6, 1), (7, 1), (11, 1)],
  term ((-1096478030144 : Rat) / 157072892175) [(6, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0468_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0468
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0469 : Poly :=
[
  term ((-17132469221 : Rat) / 11635029050) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 469 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0469 : Poly :=
[
  term ((17132469221 : Rat) / 11635029050) [(6, 1), (7, 1), (13, 1)],
  term ((-17132469221 : Rat) / 5817514525) [(6, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0469_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0469
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0470 : Poly :=
[
  term ((1197437289337 : Rat) / 314145784350) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 470 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0470 : Poly :=
[
  term ((-1197437289337 : Rat) / 314145784350) [(6, 1), (7, 1), (15, 1)],
  term ((1197437289337 : Rat) / 157072892175) [(6, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0470_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0470
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0471 : Poly :=
[
  term ((322551428864 : Rat) / 31414578435) [(6, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 471 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0471 : Poly :=
[
  term ((-322551428864 : Rat) / 31414578435) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((645102857728 : Rat) / 31414578435) [(6, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0471_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0471
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0472 : Poly :=
[
  term ((5039866076 : Rat) / 1163502905) [(6, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 472 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0472 : Poly :=
[
  term ((-5039866076 : Rat) / 1163502905) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((10079732152 : Rat) / 1163502905) [(6, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0472_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0472
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0473 : Poly :=
[
  term ((-290872270672 : Rat) / 31414578435) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 473 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0473 : Poly :=
[
  term ((290872270672 : Rat) / 31414578435) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(6, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0473_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0473
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0474 : Poly :=
[
  term ((-1893933869398 : Rat) / 94243735305) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 474 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0474 : Poly :=
[
  term ((1893933869398 : Rat) / 94243735305) [(6, 1), (9, 1), (11, 1)],
  term ((-3787867738796 : Rat) / 94243735305) [(6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0474_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0474
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0475 : Poly :=
[
  term ((268424576 : Rat) / 12247399) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 475 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0475 : Poly :=
[
  term ((-268424576 : Rat) / 12247399) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((536849152 : Rat) / 12247399) [(6, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0475_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0475
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0476 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 476 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0476 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0476_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0476
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0477 : Poly :=
[
  term ((-5331542272 : Rat) / 330679773) [(6, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 477 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0477 : Poly :=
[
  term ((5331542272 : Rat) / 330679773) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-10663084544 : Rat) / 330679773) [(6, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0477_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0477
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0478 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 478 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0478 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(6, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0478_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0478
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0479 : Poly :=
[
  term ((113241618 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 479 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0479 : Poly :=
[
  term ((-113241618 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((226483236 : Rat) / 12247399) [(6, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0479_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0479
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0480 : Poly :=
[
  term ((-235480756 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 480 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0480 : Poly :=
[
  term ((235480756 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-470961512 : Rat) / 12247399) [(6, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0480_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0480
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0481 : Poly :=
[
  term ((-121008284803 : Rat) / 13962034860) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 481 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0481 : Poly :=
[
  term ((121008284803 : Rat) / 13962034860) [(6, 1), (9, 1), (13, 1)],
  term ((-121008284803 : Rat) / 6981017430) [(6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0481_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0481
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0482 : Poly :=
[
  term ((-83305348 : Rat) / 12247399) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 482 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0482 : Poly :=
[
  term ((83305348 : Rat) / 12247399) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-166610696 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0482_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0482
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0483 : Poly :=
[
  term ((-6049280 : Rat) / 36742197) [(6, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 483 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0483 : Poly :=
[
  term ((6049280 : Rat) / 36742197) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-12098560 : Rat) / 36742197) [(6, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0483_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0483
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0484 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 484 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0484 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(6, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0484_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0484
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0485 : Poly :=
[
  term ((4985587340 : Rat) / 330679773) [(6, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 485 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0485 : Poly :=
[
  term ((-4985587340 : Rat) / 330679773) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((9971174680 : Rat) / 330679773) [(6, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0485_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0485
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0486 : Poly :=
[
  term ((3643399761973 : Rat) / 188487470610) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 486 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0486 : Poly :=
[
  term ((-3643399761973 : Rat) / 188487470610) [(6, 1), (9, 1), (15, 1)],
  term ((3643399761973 : Rat) / 94243735305) [(6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0486_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0486
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0487 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(6, 1), (9, 1), (15, 3)]
]

/-- Partial product 487 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0487 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(6, 1), (9, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(6, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0487_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0487
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0488 : Poly :=
[
  term ((419 : Rat) / 134) [(6, 1), (9, 2)]
]

/-- Partial product 488 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0488 : Poly :=
[
  term ((-419 : Rat) / 134) [(6, 1), (9, 2)],
  term ((419 : Rat) / 67) [(6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0488_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0488
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0489 : Poly :=
[
  term ((909732740 : Rat) / 330679773) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 489 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0489 : Poly :=
[
  term ((-909732740 : Rat) / 330679773) [(6, 1), (11, 1), (13, 1)],
  term ((1819465480 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0489_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0489
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0490 : Poly :=
[
  term ((818809600 : Rat) / 330679773) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 490 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0490 : Poly :=
[
  term ((-818809600 : Rat) / 330679773) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((1637619200 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0490_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0490
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0491 : Poly :=
[
  term ((-243483501 : Rat) / 12247399) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 491 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0491 : Poly :=
[
  term ((243483501 : Rat) / 12247399) [(6, 1), (11, 1), (15, 1)],
  term ((-486967002 : Rat) / 12247399) [(6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0491_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0491
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0492 : Poly :=
[
  term ((3182744320 : Rat) / 330679773) [(6, 1), (11, 2)]
]

/-- Partial product 492 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0492 : Poly :=
[
  term ((-3182744320 : Rat) / 330679773) [(6, 1), (11, 2)],
  term ((6365488640 : Rat) / 330679773) [(6, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0492_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0492
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0493 : Poly :=
[
  term ((-738390800 : Rat) / 330679773) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 493 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0493 : Poly :=
[
  term ((738390800 : Rat) / 330679773) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1476781600 : Rat) / 330679773) [(6, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0493_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0493
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0494 : Poly :=
[
  term ((-981255571 : Rat) / 330679773) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 494 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0494 : Poly :=
[
  term ((981255571 : Rat) / 330679773) [(6, 1), (13, 1), (15, 1)],
  term ((-1962511142 : Rat) / 330679773) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0494_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0494
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0495 : Poly :=
[
  term ((-6765430 : Rat) / 12247399) [(6, 1), (13, 2)]
]

/-- Partial product 495 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0495 : Poly :=
[
  term ((6765430 : Rat) / 12247399) [(6, 1), (13, 2)],
  term ((-13530860 : Rat) / 12247399) [(6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0495_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0495
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0496 : Poly :=
[
  term ((12793900 : Rat) / 12247399) [(6, 1), (13, 2), (14, 1)]
]

/-- Partial product 496 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0496 : Poly :=
[
  term ((-12793900 : Rat) / 12247399) [(6, 1), (13, 2), (14, 1)],
  term ((25587800 : Rat) / 12247399) [(6, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0496_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0496
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0497 : Poly :=
[
  term ((49 : Rat) / 67) [(6, 1), (14, 1)]
]

/-- Partial product 497 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0497 : Poly :=
[
  term ((-49 : Rat) / 67) [(6, 1), (14, 1)],
  term ((98 : Rat) / 67) [(6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0497_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0497
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0498 : Poly :=
[
  term ((2440700267 : Rat) / 330679773) [(6, 1), (15, 2)]
]

/-- Partial product 498 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0498 : Poly :=
[
  term ((-2440700267 : Rat) / 330679773) [(6, 1), (15, 2)],
  term ((4881400534 : Rat) / 330679773) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0498_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0498
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0499 : Poly :=
[
  term ((845 : Rat) / 268) [(7, 1), (9, 1)]
]

/-- Partial product 499 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0499 : Poly :=
[
  term ((845 : Rat) / 134) [(6, 1), (7, 1), (9, 1)],
  term ((-845 : Rat) / 268) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0499_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0499
        rs_R009_ueqv_R009NNNYN_generator_16_0400_0499 =
      rs_R009_ueqv_R009NNNYN_partial_16_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_16_0400_0499 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_16_0400,
  rs_R009_ueqv_R009NNNYN_partial_16_0401,
  rs_R009_ueqv_R009NNNYN_partial_16_0402,
  rs_R009_ueqv_R009NNNYN_partial_16_0403,
  rs_R009_ueqv_R009NNNYN_partial_16_0404,
  rs_R009_ueqv_R009NNNYN_partial_16_0405,
  rs_R009_ueqv_R009NNNYN_partial_16_0406,
  rs_R009_ueqv_R009NNNYN_partial_16_0407,
  rs_R009_ueqv_R009NNNYN_partial_16_0408,
  rs_R009_ueqv_R009NNNYN_partial_16_0409,
  rs_R009_ueqv_R009NNNYN_partial_16_0410,
  rs_R009_ueqv_R009NNNYN_partial_16_0411,
  rs_R009_ueqv_R009NNNYN_partial_16_0412,
  rs_R009_ueqv_R009NNNYN_partial_16_0413,
  rs_R009_ueqv_R009NNNYN_partial_16_0414,
  rs_R009_ueqv_R009NNNYN_partial_16_0415,
  rs_R009_ueqv_R009NNNYN_partial_16_0416,
  rs_R009_ueqv_R009NNNYN_partial_16_0417,
  rs_R009_ueqv_R009NNNYN_partial_16_0418,
  rs_R009_ueqv_R009NNNYN_partial_16_0419,
  rs_R009_ueqv_R009NNNYN_partial_16_0420,
  rs_R009_ueqv_R009NNNYN_partial_16_0421,
  rs_R009_ueqv_R009NNNYN_partial_16_0422,
  rs_R009_ueqv_R009NNNYN_partial_16_0423,
  rs_R009_ueqv_R009NNNYN_partial_16_0424,
  rs_R009_ueqv_R009NNNYN_partial_16_0425,
  rs_R009_ueqv_R009NNNYN_partial_16_0426,
  rs_R009_ueqv_R009NNNYN_partial_16_0427,
  rs_R009_ueqv_R009NNNYN_partial_16_0428,
  rs_R009_ueqv_R009NNNYN_partial_16_0429,
  rs_R009_ueqv_R009NNNYN_partial_16_0430,
  rs_R009_ueqv_R009NNNYN_partial_16_0431,
  rs_R009_ueqv_R009NNNYN_partial_16_0432,
  rs_R009_ueqv_R009NNNYN_partial_16_0433,
  rs_R009_ueqv_R009NNNYN_partial_16_0434,
  rs_R009_ueqv_R009NNNYN_partial_16_0435,
  rs_R009_ueqv_R009NNNYN_partial_16_0436,
  rs_R009_ueqv_R009NNNYN_partial_16_0437,
  rs_R009_ueqv_R009NNNYN_partial_16_0438,
  rs_R009_ueqv_R009NNNYN_partial_16_0439,
  rs_R009_ueqv_R009NNNYN_partial_16_0440,
  rs_R009_ueqv_R009NNNYN_partial_16_0441,
  rs_R009_ueqv_R009NNNYN_partial_16_0442,
  rs_R009_ueqv_R009NNNYN_partial_16_0443,
  rs_R009_ueqv_R009NNNYN_partial_16_0444,
  rs_R009_ueqv_R009NNNYN_partial_16_0445,
  rs_R009_ueqv_R009NNNYN_partial_16_0446,
  rs_R009_ueqv_R009NNNYN_partial_16_0447,
  rs_R009_ueqv_R009NNNYN_partial_16_0448,
  rs_R009_ueqv_R009NNNYN_partial_16_0449,
  rs_R009_ueqv_R009NNNYN_partial_16_0450,
  rs_R009_ueqv_R009NNNYN_partial_16_0451,
  rs_R009_ueqv_R009NNNYN_partial_16_0452,
  rs_R009_ueqv_R009NNNYN_partial_16_0453,
  rs_R009_ueqv_R009NNNYN_partial_16_0454,
  rs_R009_ueqv_R009NNNYN_partial_16_0455,
  rs_R009_ueqv_R009NNNYN_partial_16_0456,
  rs_R009_ueqv_R009NNNYN_partial_16_0457,
  rs_R009_ueqv_R009NNNYN_partial_16_0458,
  rs_R009_ueqv_R009NNNYN_partial_16_0459,
  rs_R009_ueqv_R009NNNYN_partial_16_0460,
  rs_R009_ueqv_R009NNNYN_partial_16_0461,
  rs_R009_ueqv_R009NNNYN_partial_16_0462,
  rs_R009_ueqv_R009NNNYN_partial_16_0463,
  rs_R009_ueqv_R009NNNYN_partial_16_0464,
  rs_R009_ueqv_R009NNNYN_partial_16_0465,
  rs_R009_ueqv_R009NNNYN_partial_16_0466,
  rs_R009_ueqv_R009NNNYN_partial_16_0467,
  rs_R009_ueqv_R009NNNYN_partial_16_0468,
  rs_R009_ueqv_R009NNNYN_partial_16_0469,
  rs_R009_ueqv_R009NNNYN_partial_16_0470,
  rs_R009_ueqv_R009NNNYN_partial_16_0471,
  rs_R009_ueqv_R009NNNYN_partial_16_0472,
  rs_R009_ueqv_R009NNNYN_partial_16_0473,
  rs_R009_ueqv_R009NNNYN_partial_16_0474,
  rs_R009_ueqv_R009NNNYN_partial_16_0475,
  rs_R009_ueqv_R009NNNYN_partial_16_0476,
  rs_R009_ueqv_R009NNNYN_partial_16_0477,
  rs_R009_ueqv_R009NNNYN_partial_16_0478,
  rs_R009_ueqv_R009NNNYN_partial_16_0479,
  rs_R009_ueqv_R009NNNYN_partial_16_0480,
  rs_R009_ueqv_R009NNNYN_partial_16_0481,
  rs_R009_ueqv_R009NNNYN_partial_16_0482,
  rs_R009_ueqv_R009NNNYN_partial_16_0483,
  rs_R009_ueqv_R009NNNYN_partial_16_0484,
  rs_R009_ueqv_R009NNNYN_partial_16_0485,
  rs_R009_ueqv_R009NNNYN_partial_16_0486,
  rs_R009_ueqv_R009NNNYN_partial_16_0487,
  rs_R009_ueqv_R009NNNYN_partial_16_0488,
  rs_R009_ueqv_R009NNNYN_partial_16_0489,
  rs_R009_ueqv_R009NNNYN_partial_16_0490,
  rs_R009_ueqv_R009NNNYN_partial_16_0491,
  rs_R009_ueqv_R009NNNYN_partial_16_0492,
  rs_R009_ueqv_R009NNNYN_partial_16_0493,
  rs_R009_ueqv_R009NNNYN_partial_16_0494,
  rs_R009_ueqv_R009NNNYN_partial_16_0495,
  rs_R009_ueqv_R009NNNYN_partial_16_0496,
  rs_R009_ueqv_R009NNNYN_partial_16_0497,
  rs_R009_ueqv_R009NNNYN_partial_16_0498,
  rs_R009_ueqv_R009NNNYN_partial_16_0499
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_16_0400_0499 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (15, 1)],
  term ((445 : Rat) / 67) [(5, 1), (6, 1), (9, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((4584858115156 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((144 : Rat) / 67) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((35003079412 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1823250517964 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (6, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((641398435328 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((10021850552 : Rat) / 1163502905) [(5, 1), (6, 1), (10, 1), (13, 1)],
  term ((-578403946144 : Rat) / 31414578435) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-176332535996 : Rat) / 471218676525) [(5, 1), (6, 1), (11, 1)],
  term ((-2176534568 : Rat) / 12247399) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1476267520 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-635392000 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-31682560 : Rat) / 36742197) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((310030039424 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((7640388160 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-155975680 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-13621986 : Rat) / 182797) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((23066680 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-34728960 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-620562224 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((1908124534 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((668119040 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((476022400819 : Rat) / 69810174300) [(5, 1), (6, 1), (13, 1)],
  term ((4844219366 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((1779091040 : Rat) / 36742197) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-2698044652 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (6, 1), (14, 1), (15, 3)],
  term ((-26956557453109 : Rat) / 942437353050) [(5, 1), (6, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-11352400000 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)],
  term ((34264938442 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(5, 1), (7, 2), (15, 1)],
  term ((-445 : Rat) / 134) [(5, 1), (9, 1)],
  term ((298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2292429057578 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)],
  term ((-72 : Rat) / 67) [(5, 1), (9, 1), (12, 1)],
  term ((-17501539706 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((911625258982 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 465401162) [(5, 1), (9, 2), (13, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)],
  term ((-320699217664 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-5010925276 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)],
  term ((289201973072 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)],
  term ((88166267998 : Rat) / 471218676525) [(5, 1), (11, 1)],
  term ((1088267284 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-738133760 : Rat) / 330679773) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((317696000 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((15841280 : Rat) / 36742197) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-155015019712 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3820194080 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)],
  term ((6810993 : Rat) / 182797) [(5, 1), (12, 1), (13, 1)],
  term ((-11533340 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((17364480 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((310281112 : Rat) / 330679773) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-954062267 : Rat) / 12247399) [(5, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-334059520 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)],
  term ((-476022400819 : Rat) / 139620348600) [(5, 1), (13, 1)],
  term ((-2422109683 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-889545520 : Rat) / 36742197) [(5, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (16, 1)],
  term ((685440 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)],
  term ((1349022326 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)],
  term ((26956557453109 : Rat) / 1884874706100) [(5, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)],
  term ((5676200000 : Rat) / 110226591) [(5, 1), (15, 3)],
  term ((1721 : Rat) / 134) [(5, 2)],
  term ((-1721 : Rat) / 67) [(5, 2), (6, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((44102409344 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((25461954560 : Rat) / 110226591) [(5, 2), (6, 1), (11, 2)],
  term ((-1179820320 : Rat) / 12247399) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((19525602136 : Rat) / 110226591) [(5, 2), (6, 1), (15, 2)],
  term ((2192956060288 : Rat) / 52357630725) [(5, 2), (7, 1), (11, 1)],
  term ((102794815326 : Rat) / 5817514525) [(5, 2), (7, 1), (13, 1)],
  term ((-2394874578674 : Rat) / 52357630725) [(5, 2), (7, 1), (15, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 2), (9, 1), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 2), (9, 1), (13, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 2), (9, 1), (15, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1)],
  term ((2921802012 : Rat) / 12247399) [(5, 2), (11, 1), (15, 1)],
  term ((-12730977280 : Rat) / 110226591) [(5, 2), (11, 2)],
  term ((589910160 : Rat) / 12247399) [(5, 2), (13, 1), (15, 1)],
  term ((-9762801068 : Rat) / 110226591) [(5, 2), (15, 2)],
  term ((158 : Rat) / 67) [(6, 1)],
  term ((845 : Rat) / 134) [(6, 1), (7, 1), (9, 1)],
  term ((548239015072 : Rat) / 157072892175) [(6, 1), (7, 1), (11, 1)],
  term ((17132469221 : Rat) / 11635029050) [(6, 1), (7, 1), (13, 1)],
  term ((-1197437289337 : Rat) / 314145784350) [(6, 1), (7, 1), (15, 1)],
  term ((-322551428864 : Rat) / 31414578435) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-5039866076 : Rat) / 1163502905) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((290872270672 : Rat) / 31414578435) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((1893933869398 : Rat) / 94243735305) [(6, 1), (9, 1), (11, 1)],
  term ((-268424576 : Rat) / 12247399) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-9748480 : Rat) / 36742197) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((5331542272 : Rat) / 330679773) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 110226591) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-113241618 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((235480756 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((121008284803 : Rat) / 13962034860) [(6, 1), (9, 1), (13, 1)],
  term ((83305348 : Rat) / 12247399) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((6049280 : Rat) / 36742197) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1370880 : Rat) / 12247399) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-4985587340 : Rat) / 330679773) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-3643399761973 : Rat) / 188487470610) [(6, 1), (9, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(6, 1), (9, 1), (15, 3)],
  term ((-419 : Rat) / 134) [(6, 1), (9, 2)],
  term ((-909732740 : Rat) / 330679773) [(6, 1), (11, 1), (13, 1)],
  term ((-818809600 : Rat) / 330679773) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((243483501 : Rat) / 12247399) [(6, 1), (11, 1), (15, 1)],
  term ((-3182744320 : Rat) / 330679773) [(6, 1), (11, 2)],
  term ((738390800 : Rat) / 330679773) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((981255571 : Rat) / 330679773) [(6, 1), (13, 1), (15, 1)],
  term ((6765430 : Rat) / 12247399) [(6, 1), (13, 2)],
  term ((-12793900 : Rat) / 12247399) [(6, 1), (13, 2), (14, 1)],
  term ((-49 : Rat) / 67) [(6, 1), (14, 1)],
  term ((-2440700267 : Rat) / 330679773) [(6, 1), (15, 2)],
  term ((-316 : Rat) / 67) [(6, 2)],
  term ((-1096478030144 : Rat) / 157072892175) [(6, 2), (7, 1), (11, 1)],
  term ((-17132469221 : Rat) / 5817514525) [(6, 2), (7, 1), (13, 1)],
  term ((1197437289337 : Rat) / 157072892175) [(6, 2), (7, 1), (15, 1)],
  term ((645102857728 : Rat) / 31414578435) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((10079732152 : Rat) / 1163502905) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-3787867738796 : Rat) / 94243735305) [(6, 2), (9, 1), (11, 1)],
  term ((536849152 : Rat) / 12247399) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 36742197) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10663084544 : Rat) / 330679773) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 110226591) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((226483236 : Rat) / 12247399) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-470961512 : Rat) / 12247399) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-121008284803 : Rat) / 6981017430) [(6, 2), (9, 1), (13, 1)],
  term ((-166610696 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-12098560 : Rat) / 36742197) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(6, 2), (9, 1), (13, 2), (15, 1)],
  term ((9971174680 : Rat) / 330679773) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((3643399761973 : Rat) / 94243735305) [(6, 2), (9, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(6, 2), (9, 1), (15, 3)],
  term ((419 : Rat) / 67) [(6, 2), (9, 2)],
  term ((1819465480 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1)],
  term ((1637619200 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-486967002 : Rat) / 12247399) [(6, 2), (11, 1), (15, 1)],
  term ((6365488640 : Rat) / 330679773) [(6, 2), (11, 2)],
  term ((-1476781600 : Rat) / 330679773) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1962511142 : Rat) / 330679773) [(6, 2), (13, 1), (15, 1)],
  term ((-13530860 : Rat) / 12247399) [(6, 2), (13, 2)],
  term ((25587800 : Rat) / 12247399) [(6, 2), (13, 2), (14, 1)],
  term ((98 : Rat) / 67) [(6, 2), (14, 1)],
  term ((4881400534 : Rat) / 330679773) [(6, 2), (15, 2)],
  term ((-845 : Rat) / 268) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 400 through 499. -/
theorem rs_R009_ueqv_R009NNNYN_block_16_0400_0499_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_16_0400_0499
      rs_R009_ueqv_R009NNNYN_block_16_0400_0499 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
