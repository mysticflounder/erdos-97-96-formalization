/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0400 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0400 : Poly :=
[
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0400_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0400
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0401 : Poly :=
[
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 2), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0401 : Poly :=
[
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 2), (15, 2), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0401_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0401
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0402 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 402 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0402 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0402_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0402
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0403 : Poly :=
[
  term ((-1023327600147910917594923 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0403 : Poly :=
[
  term ((-1023327600147910917594923 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1023327600147910917594923 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0403_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0403
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0404 : Poly :=
[
  term ((-39264252366020385388535 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 404 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0404 : Poly :=
[
  term ((-78528504732040770777070 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((39264252366020385388535 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0404_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0404
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0405 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 405 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0405 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 19281494226115187343) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 19281494226115187343) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0405_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0405
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0406 : Poly :=
[
  term ((2032721238497707543655 : Rat) / 179960612777075081868) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 406 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0406 : Poly :=
[
  term ((2032721238497707543655 : Rat) / 89980306388537540934) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2032721238497707543655 : Rat) / 179960612777075081868) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0406_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0406
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0407 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0407 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0407_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0407
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0408 : Poly :=
[
  term ((2764093239671843968924247 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0408 : Poly :=
[
  term ((2764093239671843968924247 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2764093239671843968924247 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0408_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0408
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0409 : Poly :=
[
  term ((-292286550505180736635243 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0409 : Poly :=
[
  term ((-292286550505180736635243 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((292286550505180736635243 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0409_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0409
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0410 : Poly :=
[
  term ((-367328036294848348320829 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0410 : Poly :=
[
  term ((-367328036294848348320829 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((367328036294848348320829 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0410_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0410
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0411 : Poly :=
[
  term ((-716873740263655745664175 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 411 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0411 : Poly :=
[
  term ((-716873740263655745664175 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((716873740263655745664175 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0411_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0411
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0412 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 412 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0412 : Poly :=
[
  term ((115438650893527280561990 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0412_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0412
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0413 : Poly :=
[
  term ((404615384463100719277885 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 413 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0413 : Poly :=
[
  term ((809230768926201438555770 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-404615384463100719277885 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0413_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0413
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0414 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 2), (16, 1)]
]

/-- Partial product 414 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0414 : Poly :=
[
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0414_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0414
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0415 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 415 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0415 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0415_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0415
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0416 : Poly :=
[
  term ((-172558132094203647081515 : Rat) / 314931072359881393269) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 416 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0416 : Poly :=
[
  term ((-345116264188407294163030 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((172558132094203647081515 : Rat) / 314931072359881393269) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0416_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0416
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0417 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 417 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0417 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0417_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0417
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0418 : Poly :=
[
  term ((4782709292300963140111 : Rat) / 34046602417284474948) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 418 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0418 : Poly :=
[
  term ((4782709292300963140111 : Rat) / 17023301208642237474) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4782709292300963140111 : Rat) / 34046602417284474948) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0418_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0418
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0419 : Poly :=
[
  term ((7852850473204077077707 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0419 : Poly :=
[
  term ((15705700946408154155414 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7852850473204077077707 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0419_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0419
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0420 : Poly :=
[
  term ((-406544247699541508731 : Rat) / 59986870925691693956) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0420 : Poly :=
[
  term ((-406544247699541508731 : Rat) / 29993435462845846978) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((406544247699541508731 : Rat) / 59986870925691693956) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0420_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0420
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0421 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 421 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0421 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0421_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0421
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0422 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 422 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0422 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0422_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0422
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0423 : Poly :=
[
  term ((-941249417018945484291619 : Rat) / 2519448578879051146152) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 423 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0423 : Poly :=
[
  term ((-941249417018945484291619 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((941249417018945484291619 : Rat) / 2519448578879051146152) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0423_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0423
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0424 : Poly :=
[
  term ((-1 : Rat) / 6) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 424 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0424 : Poly :=
[
  term ((-1 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0424_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0424
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0425 : Poly :=
[
  term ((68510543208953367517091 : Rat) / 629862144719762786538) [(2, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 425 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0425 : Poly :=
[
  term ((68510543208953367517091 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-68510543208953367517091 : Rat) / 629862144719762786538) [(2, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0425_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0425
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0426 : Poly :=
[
  term ((2 : Rat) / 3) [(2, 1), (14, 2), (16, 1)]
]

/-- Partial product 426 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0426 : Poly :=
[
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0426_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0426
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0427 : Poly :=
[
  term ((572112660076195540689697 : Rat) / 2519448578879051146152) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 427 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0427 : Poly :=
[
  term ((572112660076195540689697 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-572112660076195540689697 : Rat) / 2519448578879051146152) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0427_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0427
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0428 : Poly :=
[
  term ((133938634681433268998531 : Rat) / 629862144719762786538) [(2, 1), (15, 4), (16, 1)]
]

/-- Partial product 428 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0428 : Poly :=
[
  term ((133938634681433268998531 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((-133938634681433268998531 : Rat) / 629862144719762786538) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0428_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0428
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0429 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (16, 1)]
]

/-- Partial product 429 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0429 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0429_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0429
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0430 : Poly :=
[
  term ((190405363527772986640 : Rat) / 9354388287917269107) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 430 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0430 : Poly :=
[
  term ((380810727055545973280 : Rat) / 9354388287917269107) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-190405363527772986640 : Rat) / 9354388287917269107) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0430_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0430
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0431 : Poly :=
[
  term ((-38081072705554597328 : Rat) / 3118129429305756369) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0431 : Poly :=
[
  term ((-76162145411109194656 : Rat) / 3118129429305756369) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((38081072705554597328 : Rat) / 3118129429305756369) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0431_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0431
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0432 : Poly :=
[
  term ((-224618777391279583384130 : Rat) / 944793217079644179807) [(2, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 432 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0432 : Poly :=
[
  term ((-449237554782559166768260 : Rat) / 944793217079644179807) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((224618777391279583384130 : Rat) / 944793217079644179807) [(2, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0432_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0432
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0433 : Poly :=
[
  term ((44923755478255916676826 : Rat) / 314931072359881393269) [(2, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0433 : Poly :=
[
  term ((89847510956511833353652 : Rat) / 314931072359881393269) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-44923755478255916676826 : Rat) / 314931072359881393269) [(2, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0433_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0433
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0434 : Poly :=
[
  term ((891367733023007537733565 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0434 : Poly :=
[
  term ((891367733023007537733565 : Rat) / 944793217079644179807) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-891367733023007537733565 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0434_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0434
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0435 : Poly :=
[
  term ((-178273546604601507546713 : Rat) / 629862144719762786538) [(2, 2), (15, 2), (16, 1)]
]

/-- Partial product 435 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0435 : Poly :=
[
  term ((-178273546604601507546713 : Rat) / 314931072359881393269) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((178273546604601507546713 : Rat) / 629862144719762786538) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0435_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0435
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0436 : Poly :=
[
  term ((2153929834559236239680 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 436 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0436 : Poly :=
[
  term ((-2153929834559236239680 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0436_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0436
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0437 : Poly :=
[
  term ((68159089094219188290530 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 437 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0437 : Poly :=
[
  term ((-68159089094219188290530 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((136318178188438376581060 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0437_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0437
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0438 : Poly :=
[
  term ((-430785966911847247936 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0438 : Poly :=
[
  term ((430785966911847247936 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0438_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0438
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0439 : Poly :=
[
  term ((-13631817818843837658106 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0439 : Poly :=
[
  term ((13631817818843837658106 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-27263635637687675316212 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0439_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0439
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0440 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 440 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0440 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0440_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0440
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0441 : Poly :=
[
  term ((-982928476176862513990 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0441 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0441_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0441
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0442 : Poly :=
[
  term ((-20167089644480357354855 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 442 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0442 : Poly :=
[
  term ((-40334179288960714709710 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((20167089644480357354855 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0442_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0442
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0443 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0443 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0443_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0443
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0444 : Poly :=
[
  term ((222177020669533194030345 : Rat) / 209954048239920928846) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 444 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0444 : Poly :=
[
  term ((222177020669533194030345 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-222177020669533194030345 : Rat) / 209954048239920928846) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0444_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0444
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0445 : Poly :=
[
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 445 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0445 : Poly :=
[
  term ((-8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0445_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0445
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0446 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 446 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0446 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0446_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0446
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0447 : Poly :=
[
  term ((-51049814763255053621945 : Rat) / 102139807251853424844) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 447 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0447 : Poly :=
[
  term ((-51049814763255053621945 : Rat) / 51069903625926712422) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((51049814763255053621945 : Rat) / 102139807251853424844) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0447_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0447
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0448 : Poly :=
[
  term ((4033417928896071470971 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0448 : Poly :=
[
  term ((8066835857792142941942 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4033417928896071470971 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0448_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0448
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0449 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 449 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0449 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0449_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0449
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0450 : Poly :=
[
  term ((-133306212401719916418207 : Rat) / 209954048239920928846) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0450 : Poly :=
[
  term ((-133306212401719916418207 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((133306212401719916418207 : Rat) / 209954048239920928846) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0450_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0450
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0451 : Poly :=
[
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0451 : Poly :=
[
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0451_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0451
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0452 : Poly :=
[
  term ((10209962952651010724389 : Rat) / 34046602417284474948) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0452 : Poly :=
[
  term ((10209962952651010724389 : Rat) / 17023301208642237474) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-10209962952651010724389 : Rat) / 34046602417284474948) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0452_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0452
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0453 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

/-- Partial product 453 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0453 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0453_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0453
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0454 : Poly :=
[
  term ((-268671301459552433906635 : Rat) / 3779172868318576719228) [(3, 1), (4, 2), (11, 1), (16, 1)]
]

/-- Partial product 454 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0454 : Poly :=
[
  term ((-268671301459552433906635 : Rat) / 1889586434159288359614) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((268671301459552433906635 : Rat) / 3779172868318576719228) [(3, 1), (4, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0454_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0454
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0455 : Poly :=
[
  term ((53734260291910486781327 : Rat) / 1259724289439525573076) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0455 : Poly :=
[
  term ((53734260291910486781327 : Rat) / 629862144719762786538) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-53734260291910486781327 : Rat) / 1259724289439525573076) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0455_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0455
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0456 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0456 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0456_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0456
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0457 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)]
]

/-- Partial product 457 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0457 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0457_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0457
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0458 : Poly :=
[
  term ((786342780941490011192 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 458 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0458 : Poly :=
[
  term ((-786342780941490011192 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((1572685561882980022384 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0458_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0458
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0459 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0459 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0459_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0459
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0460 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 460 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0460 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0460_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0460
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0461 : Poly :=
[
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0461 : Poly :=
[
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0461_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0461
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0462 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0462 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0462_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0462
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0463 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 463 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0463 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0463_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0463
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0464 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 464 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0464 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0464_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0464
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0465 : Poly :=
[
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 465 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0465 : Poly :=
[
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0465_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0465
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0466 : Poly :=
[
  term ((-1179514171412235016788 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 466 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0466 : Poly :=
[
  term ((-2359028342824470033576 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((1179514171412235016788 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0466_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0466
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0467 : Poly :=
[
  term ((2 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 467 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0467 : Poly :=
[
  term ((-2 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0467_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0467
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0468 : Poly :=
[
  term ((-134800413715859650985 : Rat) / 190905883426883043) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 468 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0468 : Poly :=
[
  term ((134800413715859650985 : Rat) / 190905883426883043) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-269600827431719301970 : Rat) / 190905883426883043) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0468_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0468
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0469 : Poly :=
[
  term ((26960082743171930197 : Rat) / 63635294475627681) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0469 : Poly :=
[
  term ((-26960082743171930197 : Rat) / 63635294475627681) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((53920165486343860394 : Rat) / 63635294475627681) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0469_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0469
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0470 : Poly :=
[
  term ((47858692308246519617290 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 470 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0470 : Poly :=
[
  term ((-47858692308246519617290 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((95717384616493039234580 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0470_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0470
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0471 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0471 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0471_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0471
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0472 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 472 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0472 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0472_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0472
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0473 : Poly :=
[
  term ((-1336322431040390406249685 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 473 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0473 : Poly :=
[
  term ((1336322431040390406249685 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1336322431040390406249685 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0473_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0473
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0474 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 474 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0474 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0474_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0474
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0475 : Poly :=
[
  term ((251252300149221663563161 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0475 : Poly :=
[
  term ((-251252300149221663563161 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((251252300149221663563161 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0475_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0475
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0476 : Poly :=
[
  term ((620913162603718859251295 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 476 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0476 : Poly :=
[
  term ((-620913162603718859251295 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((620913162603718859251295 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0476_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0476
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0477 : Poly :=
[
  term ((-4188847128298841745851 : Rat) / 55576071592920245871) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0477 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 55576071592920245871) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 55576071592920245871) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0477_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0477
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0478 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (16, 1)]
]

/-- Partial product 478 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0478 : Poly :=
[
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0478_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0478
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0479 : Poly :=
[
  term ((-9571738461649303923458 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0479 : Poly :=
[
  term ((9571738461649303923458 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19143476923298607846916 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0479_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0479
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0480 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 480 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0480 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0480_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0480
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0481 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0481 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0481_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0481
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0482 : Poly :=
[
  term ((268944118593997448680705 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 482 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0482 : Poly :=
[
  term ((-268944118593997448680705 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((268944118593997448680705 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0482_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0482
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0483 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 483 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0483 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0483_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0483
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0484 : Poly :=
[
  term ((-41744134253981125498163 : Rat) / 209954048239920928846) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0484 : Poly :=
[
  term ((41744134253981125498163 : Rat) / 209954048239920928846) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-41744134253981125498163 : Rat) / 104977024119960464423) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0484_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0484
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0485 : Poly :=
[
  term ((-36846149219288039125909 : Rat) / 419908096479841857692) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 485 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0485 : Poly :=
[
  term ((36846149219288039125909 : Rat) / 419908096479841857692) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-36846149219288039125909 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0485_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0485
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0486 : Poly :=
[
  term ((92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0486 : Poly :=
[
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0486_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0486
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0487 : Poly :=
[
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 487 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0487 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0487_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0487
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0488 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 488 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0488 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0488_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0488
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0489 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 489 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0489 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0489_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0489
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0490 : Poly :=
[
  term ((187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 490 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0490 : Poly :=
[
  term ((375028342928753661013742 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0490_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0490
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0491 : Poly :=
[
  term ((92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0491 : Poly :=
[
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0491_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0491
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0492 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 492 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0492 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0492_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0492
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0493 : Poly :=
[
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 493 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0493 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0493_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0493
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0494 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0494 : Poly :=
[
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0494_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0494
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0495 : Poly :=
[
  term ((-36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 495 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0495 : Poly :=
[
  term ((-73330129734431195504408 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0495_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0495
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0496 : Poly :=
[
  term ((5 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 496 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0496 : Poly :=
[
  term ((10 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0496_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0496
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0497 : Poly :=
[
  term ((-4 : Rat) / 3) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 497 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0497 : Poly :=
[
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0497_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0497
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0498 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 498 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0498 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0498_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0498
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0499 : Poly :=
[
  term ((-4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 499 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0499 : Poly :=
[
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0499_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0499
        rs_R007_ueqv_R007NY_generator_16_0400_0499 =
      rs_R007_ueqv_R007NY_partial_16_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0400_0499 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0400,
  rs_R007_ueqv_R007NY_partial_16_0401,
  rs_R007_ueqv_R007NY_partial_16_0402,
  rs_R007_ueqv_R007NY_partial_16_0403,
  rs_R007_ueqv_R007NY_partial_16_0404,
  rs_R007_ueqv_R007NY_partial_16_0405,
  rs_R007_ueqv_R007NY_partial_16_0406,
  rs_R007_ueqv_R007NY_partial_16_0407,
  rs_R007_ueqv_R007NY_partial_16_0408,
  rs_R007_ueqv_R007NY_partial_16_0409,
  rs_R007_ueqv_R007NY_partial_16_0410,
  rs_R007_ueqv_R007NY_partial_16_0411,
  rs_R007_ueqv_R007NY_partial_16_0412,
  rs_R007_ueqv_R007NY_partial_16_0413,
  rs_R007_ueqv_R007NY_partial_16_0414,
  rs_R007_ueqv_R007NY_partial_16_0415,
  rs_R007_ueqv_R007NY_partial_16_0416,
  rs_R007_ueqv_R007NY_partial_16_0417,
  rs_R007_ueqv_R007NY_partial_16_0418,
  rs_R007_ueqv_R007NY_partial_16_0419,
  rs_R007_ueqv_R007NY_partial_16_0420,
  rs_R007_ueqv_R007NY_partial_16_0421,
  rs_R007_ueqv_R007NY_partial_16_0422,
  rs_R007_ueqv_R007NY_partial_16_0423,
  rs_R007_ueqv_R007NY_partial_16_0424,
  rs_R007_ueqv_R007NY_partial_16_0425,
  rs_R007_ueqv_R007NY_partial_16_0426,
  rs_R007_ueqv_R007NY_partial_16_0427,
  rs_R007_ueqv_R007NY_partial_16_0428,
  rs_R007_ueqv_R007NY_partial_16_0429,
  rs_R007_ueqv_R007NY_partial_16_0430,
  rs_R007_ueqv_R007NY_partial_16_0431,
  rs_R007_ueqv_R007NY_partial_16_0432,
  rs_R007_ueqv_R007NY_partial_16_0433,
  rs_R007_ueqv_R007NY_partial_16_0434,
  rs_R007_ueqv_R007NY_partial_16_0435,
  rs_R007_ueqv_R007NY_partial_16_0436,
  rs_R007_ueqv_R007NY_partial_16_0437,
  rs_R007_ueqv_R007NY_partial_16_0438,
  rs_R007_ueqv_R007NY_partial_16_0439,
  rs_R007_ueqv_R007NY_partial_16_0440,
  rs_R007_ueqv_R007NY_partial_16_0441,
  rs_R007_ueqv_R007NY_partial_16_0442,
  rs_R007_ueqv_R007NY_partial_16_0443,
  rs_R007_ueqv_R007NY_partial_16_0444,
  rs_R007_ueqv_R007NY_partial_16_0445,
  rs_R007_ueqv_R007NY_partial_16_0446,
  rs_R007_ueqv_R007NY_partial_16_0447,
  rs_R007_ueqv_R007NY_partial_16_0448,
  rs_R007_ueqv_R007NY_partial_16_0449,
  rs_R007_ueqv_R007NY_partial_16_0450,
  rs_R007_ueqv_R007NY_partial_16_0451,
  rs_R007_ueqv_R007NY_partial_16_0452,
  rs_R007_ueqv_R007NY_partial_16_0453,
  rs_R007_ueqv_R007NY_partial_16_0454,
  rs_R007_ueqv_R007NY_partial_16_0455,
  rs_R007_ueqv_R007NY_partial_16_0456,
  rs_R007_ueqv_R007NY_partial_16_0457,
  rs_R007_ueqv_R007NY_partial_16_0458,
  rs_R007_ueqv_R007NY_partial_16_0459,
  rs_R007_ueqv_R007NY_partial_16_0460,
  rs_R007_ueqv_R007NY_partial_16_0461,
  rs_R007_ueqv_R007NY_partial_16_0462,
  rs_R007_ueqv_R007NY_partial_16_0463,
  rs_R007_ueqv_R007NY_partial_16_0464,
  rs_R007_ueqv_R007NY_partial_16_0465,
  rs_R007_ueqv_R007NY_partial_16_0466,
  rs_R007_ueqv_R007NY_partial_16_0467,
  rs_R007_ueqv_R007NY_partial_16_0468,
  rs_R007_ueqv_R007NY_partial_16_0469,
  rs_R007_ueqv_R007NY_partial_16_0470,
  rs_R007_ueqv_R007NY_partial_16_0471,
  rs_R007_ueqv_R007NY_partial_16_0472,
  rs_R007_ueqv_R007NY_partial_16_0473,
  rs_R007_ueqv_R007NY_partial_16_0474,
  rs_R007_ueqv_R007NY_partial_16_0475,
  rs_R007_ueqv_R007NY_partial_16_0476,
  rs_R007_ueqv_R007NY_partial_16_0477,
  rs_R007_ueqv_R007NY_partial_16_0478,
  rs_R007_ueqv_R007NY_partial_16_0479,
  rs_R007_ueqv_R007NY_partial_16_0480,
  rs_R007_ueqv_R007NY_partial_16_0481,
  rs_R007_ueqv_R007NY_partial_16_0482,
  rs_R007_ueqv_R007NY_partial_16_0483,
  rs_R007_ueqv_R007NY_partial_16_0484,
  rs_R007_ueqv_R007NY_partial_16_0485,
  rs_R007_ueqv_R007NY_partial_16_0486,
  rs_R007_ueqv_R007NY_partial_16_0487,
  rs_R007_ueqv_R007NY_partial_16_0488,
  rs_R007_ueqv_R007NY_partial_16_0489,
  rs_R007_ueqv_R007NY_partial_16_0490,
  rs_R007_ueqv_R007NY_partial_16_0491,
  rs_R007_ueqv_R007NY_partial_16_0492,
  rs_R007_ueqv_R007NY_partial_16_0493,
  rs_R007_ueqv_R007NY_partial_16_0494,
  rs_R007_ueqv_R007NY_partial_16_0495,
  rs_R007_ueqv_R007NY_partial_16_0496,
  rs_R007_ueqv_R007NY_partial_16_0497,
  rs_R007_ueqv_R007NY_partial_16_0498,
  rs_R007_ueqv_R007NY_partial_16_0499
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0400_0499 : Poly :=
[
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1023327600147910917594923 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78528504732040770777070 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 19281494226115187343) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2032721238497707543655 : Rat) / 89980306388537540934) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2764093239671843968924247 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-292286550505180736635243 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-367328036294848348320829 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-716873740263655745664175 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((115438650893527280561990 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((809230768926201438555770 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-345116264188407294163030 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4782709292300963140111 : Rat) / 17023301208642237474) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((15705700946408154155414 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-406544247699541508731 : Rat) / 29993435462845846978) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-941249417018945484291619 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((68510543208953367517091 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((572112660076195540689697 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((133938634681433268998531 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1023327600147910917594923 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((39264252366020385388535 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 19281494226115187343) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2032721238497707543655 : Rat) / 179960612777075081868) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2764093239671843968924247 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((292286550505180736635243 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((367328036294848348320829 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((716873740263655745664175 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-404615384463100719277885 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((172558132094203647081515 : Rat) / 314931072359881393269) [(2, 1), (11, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4782709292300963140111 : Rat) / 34046602417284474948) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7852850473204077077707 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((406544247699541508731 : Rat) / 59986870925691693956) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((941249417018945484291619 : Rat) / 2519448578879051146152) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(2, 1), (14, 1), (16, 1)],
  term ((-68510543208953367517091 : Rat) / 629862144719762786538) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (14, 2), (16, 1)],
  term ((-572112660076195540689697 : Rat) / 2519448578879051146152) [(2, 1), (15, 2), (16, 1)],
  term ((-133938634681433268998531 : Rat) / 629862144719762786538) [(2, 1), (15, 4), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (16, 1)],
  term ((380810727055545973280 : Rat) / 9354388287917269107) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-76162145411109194656 : Rat) / 3118129429305756369) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-190405363527772986640 : Rat) / 9354388287917269107) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((38081072705554597328 : Rat) / 3118129429305756369) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-449237554782559166768260 : Rat) / 944793217079644179807) [(2, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((89847510956511833353652 : Rat) / 314931072359881393269) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((891367733023007537733565 : Rat) / 944793217079644179807) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-178273546604601507546713 : Rat) / 314931072359881393269) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((224618777391279583384130 : Rat) / 944793217079644179807) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-44923755478255916676826 : Rat) / 314931072359881393269) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-891367733023007537733565 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((178273546604601507546713 : Rat) / 629862144719762786538) [(2, 2), (15, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40334179288960714709710 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1782046272735315886065425 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-675053774809625120197675 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((8066835857792142941942 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-356409254547063177213085 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((135010754961925024039535 : Rat) / 209954048239920928846) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((136318178188438376581060 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-27263635637687675316212 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((982928476176862513990 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((20167089644480357354855 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-222177020669533194030345 : Rat) / 209954048239920928846) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((51049814763255053621945 : Rat) / 102139807251853424844) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-4033417928896071470971 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((133306212401719916418207 : Rat) / 209954048239920928846) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10209962952651010724389 : Rat) / 34046602417284474948) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-268671301459552433906635 : Rat) / 1889586434159288359614) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((53734260291910486781327 : Rat) / 629862144719762786538) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((268671301459552433906635 : Rat) / 3779172868318576719228) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-53734260291910486781327 : Rat) / 1259724289439525573076) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 2), (16, 1)],
  term ((1572685561882980022384 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((1179514171412235016788 : Rat) / 104977024119960464423) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((375028342928753661013742 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((184309273645149036817444 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (7, 1), (11, 2), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-73330129734431195504408 : Rat) / 104977024119960464423) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((134800413715859650985 : Rat) / 190905883426883043) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-26960082743171930197 : Rat) / 63635294475627681) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-47858692308246519617290 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((1336322431040390406249685 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 3779172868318576719228) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-251252300149221663563161 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-620913162603718859251295 : Rat) / 1889586434159288359614) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 55576071592920245871) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (6, 1), (11, 3), (16, 1)],
  term ((9571738461649303923458 : Rat) / 314931072359881393269) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-268944118593997448680705 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 1259724289439525573076) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((41744134253981125498163 : Rat) / 209954048239920928846) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((36846149219288039125909 : Rat) / 419908096479841857692) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((-269600827431719301970 : Rat) / 190905883426883043) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((53920165486343860394 : Rat) / 63635294475627681) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((95717384616493039234580 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1336322431040390406249685 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 1), (6, 2), (11, 1), (14, 2), (16, 1)],
  term ((251252300149221663563161 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((620913162603718859251295 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 55576071592920245871) [(3, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 1), (6, 2), (11, 3), (16, 1)],
  term ((-19143476923298607846916 : Rat) / 314931072359881393269) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((268944118593997448680705 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((-41744134253981125498163 : Rat) / 104977024119960464423) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-36846149219288039125909 : Rat) / 209954048239920928846) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-187514171464376830506871 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92154636822574518408722 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665064867215597752204 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 400 through 499. -/
theorem rs_R007_ueqv_R007NY_block_16_0400_0499_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0400_0499
      rs_R007_ueqv_R007NY_block_16_0400_0499 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
