/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 10:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_10_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0400 : Poly :=
[
  term ((1432746262413455360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0400 : Poly :=
[
  term ((2865492524826910720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0400_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0400
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0401 : Poly :=
[
  term ((-716373131206727680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 401 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0401 : Poly :=
[
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((716373131206727680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0401_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0401
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0402 : Poly :=
[
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 402 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0402 : Poly :=
[
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0402_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0402
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0403 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 403 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0403 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (13, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0403_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0403
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0404 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0404 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0404_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0404
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0405 : Poly :=
[
  term ((358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

/-- Partial product 405 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0405 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (16, 1)],
  term ((-358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0405_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0405
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0406 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 406 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0406 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0406_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0406
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0407 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0407 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0407_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0407
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0408 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)]
]

/-- Partial product 408 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0408 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (15, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0408_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0408
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0409 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0409 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0409_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0409
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0410 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 410 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0410 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0410_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0410
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0411 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 411 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0411 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0411_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0411
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0412 : Poly :=
[
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 412 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0412 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0412_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0412
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0413 : Poly :=
[
  term ((179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 413 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0413 : Poly :=
[
  term ((359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0413_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0413
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0414 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0414 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0414_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0414
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0415 : Poly :=
[
  term ((-881346890969679748 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0415 : Poly :=
[
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0415_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0415
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0416 : Poly :=
[
  term ((440673445484839874 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 416 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0416 : Poly :=
[
  term ((881346890969679748 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-440673445484839874 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0416_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0416
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0417 : Poly :=
[
  term ((1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 417 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0417 : Poly :=
[
  term ((3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0417_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0417
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0418 : Poly :=
[
  term ((89865853771361951428 : Rat) / 269491324728529755) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 418 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0418 : Poly :=
[
  term ((179731707542723902856 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-89865853771361951428 : Rat) / 269491324728529755) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0418_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0418
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0419 : Poly :=
[
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 419 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0419 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0419_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0419
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0420 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0420 : Poly :=
[
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0420_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0420
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0421 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 421 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0421 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0421_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0421
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0422 : Poly :=
[
  term (-4 : Rat) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 422 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0422 : Poly :=
[
  term (-8 : Rat) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0422_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0422
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0423 : Poly :=
[
  term ((179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0423 : Poly :=
[
  term ((359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0423_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0423
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0424 : Poly :=
[
  term (8 : Rat) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0424 : Poly :=
[
  term (16 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0424_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0424
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0425 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 425 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0425 : Poly :=
[
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0425_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0425
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0426 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 426 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0426 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0426_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0426
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0427 : Poly :=
[
  term ((15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0427 : Poly :=
[
  term ((30871928905370982784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0427_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0427
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0428 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 428 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0428 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0428_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0428
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0429 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 429 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0429 : Poly :=
[
  term ((19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0429_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0429
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0430 : Poly :=
[
  term ((-148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0430 : Poly :=
[
  term ((-297153869582026240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0430_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0430
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0431 : Poly :=
[
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 431 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0431 : Poly :=
[
  term ((129929800474369280 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0431_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0431
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0432 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 432 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0432 : Poly :=
[
  term ((594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0432_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0432
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0433 : Poly :=
[
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 433 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0433 : Poly :=
[
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0433_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0433
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0434 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 434 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0434 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0434_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0434
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0435 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0435 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0435_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0435
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0436 : Poly :=
[
  term ((395005826415140048 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 436 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0436 : Poly :=
[
  term ((790011652830280096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0436_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0436
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0437 : Poly :=
[
  term ((-20291855480440399072 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 437 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0437 : Poly :=
[
  term ((-40583710960880798144 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((20291855480440399072 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0437_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0437
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0438 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 438 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0438 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0438_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0438
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0439 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0439 : Poly :=
[
  term ((-765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0439_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0439
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0440 : Poly :=
[
  term ((92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0440 : Poly :=
[
  term ((185785469175424000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0440_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0440
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0441 : Poly :=
[
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 441 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0441 : Poly :=
[
  term ((37122800135534080 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0441_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0441
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0442 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 442 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0442 : Poly :=
[
  term ((-371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0442_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0442
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0443 : Poly :=
[
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 443 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0443 : Poly :=
[
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0443_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0443
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0444 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 444 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0444 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0444_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0444
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0445 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0445 : Poly :=
[
  term ((2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0445_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0445
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0446 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 446 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0446 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0446_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0446
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0447 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0447 : Poly :=
[
  term ((2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0447_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0447
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0448 : Poly :=
[
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 448 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0448 : Poly :=
[
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0448_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0448
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0449 : Poly :=
[
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 449 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0449 : Poly :=
[
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0449_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0449
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0450 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 450 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0450 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0450_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0450
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0451 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0451 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0451_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0451
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0452 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0452 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0452_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0452
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0453 : Poly :=
[
  term ((4920930732265216064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 453 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0453 : Poly :=
[
  term ((9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0453_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0453
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0454 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 454 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0454 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0454_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0454
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0455 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 455 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0455 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0455_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0455
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0456 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0456 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0456_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0456
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0457 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0457 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0457_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0457
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0458 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 458 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0458 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0458_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0458
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0459 : Poly :=
[
  term ((-2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 459 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0459 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0459_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0459
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0460 : Poly :=
[
  term ((23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 460 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0460 : Poly :=
[
  term ((46628087176130561536 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0460_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0460
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0461 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0461 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0461_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0461
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0462 : Poly :=
[
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 462 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0462 : Poly :=
[
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0462_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0462
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0463 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0463 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0463_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0463
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0464 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 464 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0464 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0464_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0464
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0465 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 465 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0465 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0465_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0465
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0466 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0466 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0466_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0466
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0467 : Poly :=
[
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 467 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0467 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0467_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0467
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0468 : Poly :=
[
  term ((191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0468 : Poly :=
[
  term ((383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0468_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0468
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0469 : Poly :=
[
  term ((-17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0469 : Poly :=
[
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0469_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0469
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0470 : Poly :=
[
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 470 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0470 : Poly :=
[
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0470_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0470
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0471 : Poly :=
[
  term ((35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 471 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0471 : Poly :=
[
  term ((71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0471_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0471
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0472 : Poly :=
[
  term ((-47990508548763115456 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 472 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0472 : Poly :=
[
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((47990508548763115456 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0472_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0472
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0473 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 473 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0473 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0473_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0473
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0474 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 474 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0474 : Poly :=
[
  term ((-112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0474_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0474
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0475 : Poly :=
[
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0475 : Poly :=
[
  term ((125079846927630498816 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0475_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0475
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0476 : Poly :=
[
  term ((-277109611576712353808 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 476 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0476 : Poly :=
[
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0476_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0476
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0477 : Poly :=
[
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0477 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0477_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0477
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0478 : Poly :=
[
  term ((554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0478 : Poly :=
[
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0478_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0478
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0479 : Poly :=
[
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 479 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0479 : Poly :=
[
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0479_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0479
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0480 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 480 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0480 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0480_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0480
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0481 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0481 : Poly :=
[
  term ((426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0481_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0481
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0482 : Poly :=
[
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 482 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0482 : Poly :=
[
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0482_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0482
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0483 : Poly :=
[
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 483 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0483 : Poly :=
[
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0483_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0483
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0484 : Poly :=
[
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 484 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0484 : Poly :=
[
  term ((81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0484_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0484
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0485 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 485 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0485 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0485_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0485
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0486 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0486 : Poly :=
[
  term ((142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0486_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0486
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0487 : Poly :=
[
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 487 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0487 : Poly :=
[
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0487_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0487
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0488 : Poly :=
[
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 488 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0488 : Poly :=
[
  term ((214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0488_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0488
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0489 : Poly :=
[
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 489 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0489 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0489_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0489
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0490 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 490 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0490 : Poly :=
[
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0490_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0490
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0491 : Poly :=
[
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 491 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0491 : Poly :=
[
  term ((-149393249891224064 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0491_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0491
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0492 : Poly :=
[
  term ((105655388516260304476 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 492 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0492 : Poly :=
[
  term ((211310777032520608952 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-105655388516260304476 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0492_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0492
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0493 : Poly :=
[
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 493 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0493 : Poly :=
[
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0493_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0493
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0494 : Poly :=
[
  term ((4272707492197398400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0494 : Poly :=
[
  term ((8545414984394796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4272707492197398400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0494_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0494
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0495 : Poly :=
[
  term ((1001057938701557440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 495 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0495 : Poly :=
[
  term ((2002115877403114880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1001057938701557440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0495_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0495
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0496 : Poly :=
[
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 496 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0496 : Poly :=
[
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0496_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0496
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0497 : Poly :=
[
  term ((8375917841878858276 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 497 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0497 : Poly :=
[
  term ((16751835683757716552 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8375917841878858276 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0497_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0497
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0498 : Poly :=
[
  term ((-2108443843726951936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 498 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0498 : Poly :=
[
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2108443843726951936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0498_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0498
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0499 : Poly :=
[
  term ((4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0499 : Poly :=
[
  term ((8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0499_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0499
        rs_R010_ueqv_R010YNN_generator_10_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_10_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_10_0400_0499 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_10_0400,
  rs_R010_ueqv_R010YNN_partial_10_0401,
  rs_R010_ueqv_R010YNN_partial_10_0402,
  rs_R010_ueqv_R010YNN_partial_10_0403,
  rs_R010_ueqv_R010YNN_partial_10_0404,
  rs_R010_ueqv_R010YNN_partial_10_0405,
  rs_R010_ueqv_R010YNN_partial_10_0406,
  rs_R010_ueqv_R010YNN_partial_10_0407,
  rs_R010_ueqv_R010YNN_partial_10_0408,
  rs_R010_ueqv_R010YNN_partial_10_0409,
  rs_R010_ueqv_R010YNN_partial_10_0410,
  rs_R010_ueqv_R010YNN_partial_10_0411,
  rs_R010_ueqv_R010YNN_partial_10_0412,
  rs_R010_ueqv_R010YNN_partial_10_0413,
  rs_R010_ueqv_R010YNN_partial_10_0414,
  rs_R010_ueqv_R010YNN_partial_10_0415,
  rs_R010_ueqv_R010YNN_partial_10_0416,
  rs_R010_ueqv_R010YNN_partial_10_0417,
  rs_R010_ueqv_R010YNN_partial_10_0418,
  rs_R010_ueqv_R010YNN_partial_10_0419,
  rs_R010_ueqv_R010YNN_partial_10_0420,
  rs_R010_ueqv_R010YNN_partial_10_0421,
  rs_R010_ueqv_R010YNN_partial_10_0422,
  rs_R010_ueqv_R010YNN_partial_10_0423,
  rs_R010_ueqv_R010YNN_partial_10_0424,
  rs_R010_ueqv_R010YNN_partial_10_0425,
  rs_R010_ueqv_R010YNN_partial_10_0426,
  rs_R010_ueqv_R010YNN_partial_10_0427,
  rs_R010_ueqv_R010YNN_partial_10_0428,
  rs_R010_ueqv_R010YNN_partial_10_0429,
  rs_R010_ueqv_R010YNN_partial_10_0430,
  rs_R010_ueqv_R010YNN_partial_10_0431,
  rs_R010_ueqv_R010YNN_partial_10_0432,
  rs_R010_ueqv_R010YNN_partial_10_0433,
  rs_R010_ueqv_R010YNN_partial_10_0434,
  rs_R010_ueqv_R010YNN_partial_10_0435,
  rs_R010_ueqv_R010YNN_partial_10_0436,
  rs_R010_ueqv_R010YNN_partial_10_0437,
  rs_R010_ueqv_R010YNN_partial_10_0438,
  rs_R010_ueqv_R010YNN_partial_10_0439,
  rs_R010_ueqv_R010YNN_partial_10_0440,
  rs_R010_ueqv_R010YNN_partial_10_0441,
  rs_R010_ueqv_R010YNN_partial_10_0442,
  rs_R010_ueqv_R010YNN_partial_10_0443,
  rs_R010_ueqv_R010YNN_partial_10_0444,
  rs_R010_ueqv_R010YNN_partial_10_0445,
  rs_R010_ueqv_R010YNN_partial_10_0446,
  rs_R010_ueqv_R010YNN_partial_10_0447,
  rs_R010_ueqv_R010YNN_partial_10_0448,
  rs_R010_ueqv_R010YNN_partial_10_0449,
  rs_R010_ueqv_R010YNN_partial_10_0450,
  rs_R010_ueqv_R010YNN_partial_10_0451,
  rs_R010_ueqv_R010YNN_partial_10_0452,
  rs_R010_ueqv_R010YNN_partial_10_0453,
  rs_R010_ueqv_R010YNN_partial_10_0454,
  rs_R010_ueqv_R010YNN_partial_10_0455,
  rs_R010_ueqv_R010YNN_partial_10_0456,
  rs_R010_ueqv_R010YNN_partial_10_0457,
  rs_R010_ueqv_R010YNN_partial_10_0458,
  rs_R010_ueqv_R010YNN_partial_10_0459,
  rs_R010_ueqv_R010YNN_partial_10_0460,
  rs_R010_ueqv_R010YNN_partial_10_0461,
  rs_R010_ueqv_R010YNN_partial_10_0462,
  rs_R010_ueqv_R010YNN_partial_10_0463,
  rs_R010_ueqv_R010YNN_partial_10_0464,
  rs_R010_ueqv_R010YNN_partial_10_0465,
  rs_R010_ueqv_R010YNN_partial_10_0466,
  rs_R010_ueqv_R010YNN_partial_10_0467,
  rs_R010_ueqv_R010YNN_partial_10_0468,
  rs_R010_ueqv_R010YNN_partial_10_0469,
  rs_R010_ueqv_R010YNN_partial_10_0470,
  rs_R010_ueqv_R010YNN_partial_10_0471,
  rs_R010_ueqv_R010YNN_partial_10_0472,
  rs_R010_ueqv_R010YNN_partial_10_0473,
  rs_R010_ueqv_R010YNN_partial_10_0474,
  rs_R010_ueqv_R010YNN_partial_10_0475,
  rs_R010_ueqv_R010YNN_partial_10_0476,
  rs_R010_ueqv_R010YNN_partial_10_0477,
  rs_R010_ueqv_R010YNN_partial_10_0478,
  rs_R010_ueqv_R010YNN_partial_10_0479,
  rs_R010_ueqv_R010YNN_partial_10_0480,
  rs_R010_ueqv_R010YNN_partial_10_0481,
  rs_R010_ueqv_R010YNN_partial_10_0482,
  rs_R010_ueqv_R010YNN_partial_10_0483,
  rs_R010_ueqv_R010YNN_partial_10_0484,
  rs_R010_ueqv_R010YNN_partial_10_0485,
  rs_R010_ueqv_R010YNN_partial_10_0486,
  rs_R010_ueqv_R010YNN_partial_10_0487,
  rs_R010_ueqv_R010YNN_partial_10_0488,
  rs_R010_ueqv_R010YNN_partial_10_0489,
  rs_R010_ueqv_R010YNN_partial_10_0490,
  rs_R010_ueqv_R010YNN_partial_10_0491,
  rs_R010_ueqv_R010YNN_partial_10_0492,
  rs_R010_ueqv_R010YNN_partial_10_0493,
  rs_R010_ueqv_R010YNN_partial_10_0494,
  rs_R010_ueqv_R010YNN_partial_10_0495,
  rs_R010_ueqv_R010YNN_partial_10_0496,
  rs_R010_ueqv_R010YNN_partial_10_0497,
  rs_R010_ueqv_R010YNN_partial_10_0498,
  rs_R010_ueqv_R010YNN_partial_10_0499
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_10_0400_0499 : Poly :=
[
  term ((2865492524826910720 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (13, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (15, 3), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((30871928905370982784 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-40583710960880798144 : Rat) / 269491324728529755) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((9841861464530432128 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1108438446306849415232 : Rat) / 4042369870927946325) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(2, 1), (5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(2, 1), (5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(2, 1), (5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(2, 1), (5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-422621554065041217904 : Rat) / 161694794837117853) [(2, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2002115877403114880 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(2, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(2, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1432746262413455360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((716373131206727680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)],
  term ((-358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((881346890969679748 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-440673445484839874 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-89865853771361951428 : Rat) / 269491324728529755) [(5, 1), (11, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(5, 1), (13, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (15, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (15, 3), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-15435964452685491392 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((20291855480440399072 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4920930732265216064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9109666273165623616 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((47990508548763115456 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-554219223153424707616 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-105655388516260304476 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4272707492197398400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1001057938701557440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8375917841878858276 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2108443843726951936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 400 through 499. -/
theorem rs_R010_ueqv_R010YNN_block_10_0400_0499_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_10_0400_0499
      rs_R010_ueqv_R010YNN_block_10_0400_0499 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
