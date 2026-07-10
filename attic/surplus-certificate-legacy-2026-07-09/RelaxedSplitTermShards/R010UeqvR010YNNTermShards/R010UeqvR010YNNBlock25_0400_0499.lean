/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0400 : Poly :=
[
  term ((3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 400 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0400 : Poly :=
[
  term ((6947622085770741760 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0400_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0400
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0401 : Poly :=
[
  term ((252031812391116800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 401 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0401 : Poly :=
[
  term ((504063624782233600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0401_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0401
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0402 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 402 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0402 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0402_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0402
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0403 : Poly :=
[
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 403 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0403 : Poly :=
[
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0403_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0403
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0404 : Poly :=
[
  term ((-3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 404 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0404 : Poly :=
[
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0404_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0404
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0405 : Poly :=
[
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0405 : Poly :=
[
  term ((13918380046314455040 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0405_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0405
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0406 : Poly :=
[
  term ((1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0406 : Poly :=
[
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0406_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0406
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0407 : Poly :=
[
  term ((-253737326913280000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 407 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0407 : Poly :=
[
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0407_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0407
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0408 : Poly :=
[
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 408 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0408 : Poly :=
[
  term ((1014949307653120000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0408_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0408
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0409 : Poly :=
[
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 409 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0409 : Poly :=
[
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0409_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0409
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0410 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0410 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0410_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0410
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0411 : Poly :=
[
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0411 : Poly :=
[
  term ((7266678841031601094784 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0411_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0411
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0412 : Poly :=
[
  term ((908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0412 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0412_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0412
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0413 : Poly :=
[
  term ((12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0413 : Poly :=
[
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0413_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0413
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0414 : Poly :=
[
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0414 : Poly :=
[
  term ((-50830188964601446400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0414_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0414
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0415 : Poly :=
[
  term ((-6353773620575180800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0415 : Poly :=
[
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6353773620575180800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0415_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0415
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0416 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 416 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0416 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0416_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0416
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0417 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 417 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0417 : Poly :=
[
  term ((6448371121561600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0417_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0417
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0418 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 418 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0418 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0418_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0418
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0419 : Poly :=
[
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 419 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0419 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0419_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0419
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0420 : Poly :=
[
  term ((-2887294661323520 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 420 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0420 : Poly :=
[
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0420_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0420
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0421 : Poly :=
[
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 421 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0421 : Poly :=
[
  term ((-18316458226122864640 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0421_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0421
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0422 : Poly :=
[
  term ((5774589322647040 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 422 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0422 : Poly :=
[
  term ((11549178645294080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0422_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0422
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0423 : Poly :=
[
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 423 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0423 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0423_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0423
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0424 : Poly :=
[
  term ((1443647330661760 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 424 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0424 : Poly :=
[
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0424_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0424
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0425 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 425 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0425 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0425_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0425
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0426 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 426 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0426 : Poly :=
[
  term ((4750053127536640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0426_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0426
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0427 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 427 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0427 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0427_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0427
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0428 : Poly :=
[
  term ((2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0428 : Poly :=
[
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0428_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0428
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0429 : Poly :=
[
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0429 : Poly :=
[
  term ((-9803721998910723821312 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0429_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0429
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0430 : Poly :=
[
  term ((-1225465249863840477664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0430 : Poly :=
[
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1225465249863840477664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0430_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0430
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0431 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0431 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0431_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0431
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0432 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0432 : Poly :=
[
  term ((1016830741658009600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0432_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0432
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0433 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0433 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0433_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0433
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0434 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0434 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0434_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0434
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0435 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0435 : Poly :=
[
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0435_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0435
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0436 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0436 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0436_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0436
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0437 : Poly :=
[
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 437 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0437 : Poly :=
[
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0437_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0437
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0438 : Poly :=
[
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 438 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0438 : Poly :=
[
  term ((-733041936520499737568 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0438_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0438
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0439 : Poly :=
[
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 439 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0439 : Poly :=
[
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0439_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0439
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0440 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0440 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0440_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0440
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0441 : Poly :=
[
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0441 : Poly :=
[
  term ((-13733191957294222900256 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0441_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0441
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0442 : Poly :=
[
  term ((-1716648994661777862532 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 442 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0442 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1716648994661777862532 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0442_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0442
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0443 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 443 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0443 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0443_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0443
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0444 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 444 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0444 : Poly :=
[
  term ((1187929604337090560 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0444_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0444
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0445 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 445 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0445 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0445_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0445
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0446 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 446 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0446 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0446_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0446
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0447 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 447 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0447 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0447_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0447
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0448 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 448 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0448 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0448_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0448
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0449 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0449 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0449_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0449
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0450 : Poly :=
[
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0450 : Poly :=
[
  term ((83224183161418754048 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0450_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0450
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0451 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0451 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0451_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0451
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0452 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 452 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0452 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0452_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0452
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0453 : Poly :=
[
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0453 : Poly :=
[
  term ((906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0453_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0453
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0454 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0454 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0454_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0454
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0455 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 455 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0455 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0455_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0455
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0456 : Poly :=
[
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 456 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0456 : Poly :=
[
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0456_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0456
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0457 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)]
]

/-- Partial product 457 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0457 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0457_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0457
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0458 : Poly :=
[
  term ((-1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 458 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0458 : Poly :=
[
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0458_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0458
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0459 : Poly :=
[
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 459 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0459 : Poly :=
[
  term ((6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0459_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0459
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0460 : Poly :=
[
  term ((862827549505294208 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 460 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0460 : Poly :=
[
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0460_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0460
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0461 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 461 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0461 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0461_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0461
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0462 : Poly :=
[
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0462 : Poly :=
[
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0462_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0462
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0463 : Poly :=
[
  term ((-211821591221569757264 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0463 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((211821591221569757264 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0463_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0463
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0464 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0464 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0464_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0464
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0465 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0465 : Poly :=
[
  term ((1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0465_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0465
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0466 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0466 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0466_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0466
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0467 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 467 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0467 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0467_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0467
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0468 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0468 : Poly :=
[
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0468_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0468
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0469 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0469 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0469_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0469
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0470 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)]
]

/-- Partial product 470 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0470 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0470_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0470
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0471 : Poly :=
[
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)]
]

/-- Partial product 471 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0471 : Poly :=
[
  term ((30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0471_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0471
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0472 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (16, 1)]
]

/-- Partial product 472 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0472 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0472_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0472
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0473 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0473 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0473_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0473
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0474 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 474 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0474 : Poly :=
[
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0474_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0474
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0475 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 475 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0475 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0475_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0475
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0476 : Poly :=
[
  term (-4 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 476 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0476 : Poly :=
[
  term (4 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0476_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0476
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0477 : Poly :=
[
  term (8 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 477 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0477 : Poly :=
[
  term (16 : Rat) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0477_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0477
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0478 : Poly :=
[
  term (2 : Rat) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 478 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0478 : Poly :=
[
  term (4 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0478_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0478
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0479 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 479 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0479 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0479_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0479
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0480 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 480 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0480 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0480_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0480
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0481 : Poly :=
[
  term ((-1870458877927056608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 481 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0481 : Poly :=
[
  term ((-3740917755854113216 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((1870458877927056608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0481_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0481
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0482 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 482 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0482 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0482_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0482
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0483 : Poly :=
[
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 483 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0483 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0483_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0483
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0484 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 484 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0484 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0484_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0484
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0485 : Poly :=
[
  term (-4 : Rat) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 485 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0485 : Poly :=
[
  term (4 : Rat) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0485_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0485
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0486 : Poly :=
[
  term (4 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 486 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0486 : Poly :=
[
  term (8 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0486_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0486
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0487 : Poly :=
[
  term (2 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 487 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0487 : Poly :=
[
  term (4 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0487_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0487
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0488 : Poly :=
[
  term (-2 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 488 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0488 : Poly :=
[
  term (-4 : Rat) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0488_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0488
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0489 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 489 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0489 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0489_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0489
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0490 : Poly :=
[
  term ((2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 490 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0490 : Poly :=
[
  term ((4006680979361322512 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0490_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0490
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0491 : Poly :=
[
  term ((-269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 491 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0491 : Poly :=
[
  term ((-539685528431856080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0491_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0491
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0492 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0492 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0492_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0492
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0493 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 493 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0493 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0493_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0493
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0494 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 494 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0494 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0494_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0494
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0495 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 495 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0495 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0495_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0495
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0496 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 496 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0496 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0496_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0496
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0497 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 497 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0497 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0497_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0497
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0498 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0498 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0498_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0498
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0499 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 499 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0499 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0499_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0499
        rs_R010_ueqv_R010YNN_generator_25_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_25_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_0400_0499 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_0400,
  rs_R010_ueqv_R010YNN_partial_25_0401,
  rs_R010_ueqv_R010YNN_partial_25_0402,
  rs_R010_ueqv_R010YNN_partial_25_0403,
  rs_R010_ueqv_R010YNN_partial_25_0404,
  rs_R010_ueqv_R010YNN_partial_25_0405,
  rs_R010_ueqv_R010YNN_partial_25_0406,
  rs_R010_ueqv_R010YNN_partial_25_0407,
  rs_R010_ueqv_R010YNN_partial_25_0408,
  rs_R010_ueqv_R010YNN_partial_25_0409,
  rs_R010_ueqv_R010YNN_partial_25_0410,
  rs_R010_ueqv_R010YNN_partial_25_0411,
  rs_R010_ueqv_R010YNN_partial_25_0412,
  rs_R010_ueqv_R010YNN_partial_25_0413,
  rs_R010_ueqv_R010YNN_partial_25_0414,
  rs_R010_ueqv_R010YNN_partial_25_0415,
  rs_R010_ueqv_R010YNN_partial_25_0416,
  rs_R010_ueqv_R010YNN_partial_25_0417,
  rs_R010_ueqv_R010YNN_partial_25_0418,
  rs_R010_ueqv_R010YNN_partial_25_0419,
  rs_R010_ueqv_R010YNN_partial_25_0420,
  rs_R010_ueqv_R010YNN_partial_25_0421,
  rs_R010_ueqv_R010YNN_partial_25_0422,
  rs_R010_ueqv_R010YNN_partial_25_0423,
  rs_R010_ueqv_R010YNN_partial_25_0424,
  rs_R010_ueqv_R010YNN_partial_25_0425,
  rs_R010_ueqv_R010YNN_partial_25_0426,
  rs_R010_ueqv_R010YNN_partial_25_0427,
  rs_R010_ueqv_R010YNN_partial_25_0428,
  rs_R010_ueqv_R010YNN_partial_25_0429,
  rs_R010_ueqv_R010YNN_partial_25_0430,
  rs_R010_ueqv_R010YNN_partial_25_0431,
  rs_R010_ueqv_R010YNN_partial_25_0432,
  rs_R010_ueqv_R010YNN_partial_25_0433,
  rs_R010_ueqv_R010YNN_partial_25_0434,
  rs_R010_ueqv_R010YNN_partial_25_0435,
  rs_R010_ueqv_R010YNN_partial_25_0436,
  rs_R010_ueqv_R010YNN_partial_25_0437,
  rs_R010_ueqv_R010YNN_partial_25_0438,
  rs_R010_ueqv_R010YNN_partial_25_0439,
  rs_R010_ueqv_R010YNN_partial_25_0440,
  rs_R010_ueqv_R010YNN_partial_25_0441,
  rs_R010_ueqv_R010YNN_partial_25_0442,
  rs_R010_ueqv_R010YNN_partial_25_0443,
  rs_R010_ueqv_R010YNN_partial_25_0444,
  rs_R010_ueqv_R010YNN_partial_25_0445,
  rs_R010_ueqv_R010YNN_partial_25_0446,
  rs_R010_ueqv_R010YNN_partial_25_0447,
  rs_R010_ueqv_R010YNN_partial_25_0448,
  rs_R010_ueqv_R010YNN_partial_25_0449,
  rs_R010_ueqv_R010YNN_partial_25_0450,
  rs_R010_ueqv_R010YNN_partial_25_0451,
  rs_R010_ueqv_R010YNN_partial_25_0452,
  rs_R010_ueqv_R010YNN_partial_25_0453,
  rs_R010_ueqv_R010YNN_partial_25_0454,
  rs_R010_ueqv_R010YNN_partial_25_0455,
  rs_R010_ueqv_R010YNN_partial_25_0456,
  rs_R010_ueqv_R010YNN_partial_25_0457,
  rs_R010_ueqv_R010YNN_partial_25_0458,
  rs_R010_ueqv_R010YNN_partial_25_0459,
  rs_R010_ueqv_R010YNN_partial_25_0460,
  rs_R010_ueqv_R010YNN_partial_25_0461,
  rs_R010_ueqv_R010YNN_partial_25_0462,
  rs_R010_ueqv_R010YNN_partial_25_0463,
  rs_R010_ueqv_R010YNN_partial_25_0464,
  rs_R010_ueqv_R010YNN_partial_25_0465,
  rs_R010_ueqv_R010YNN_partial_25_0466,
  rs_R010_ueqv_R010YNN_partial_25_0467,
  rs_R010_ueqv_R010YNN_partial_25_0468,
  rs_R010_ueqv_R010YNN_partial_25_0469,
  rs_R010_ueqv_R010YNN_partial_25_0470,
  rs_R010_ueqv_R010YNN_partial_25_0471,
  rs_R010_ueqv_R010YNN_partial_25_0472,
  rs_R010_ueqv_R010YNN_partial_25_0473,
  rs_R010_ueqv_R010YNN_partial_25_0474,
  rs_R010_ueqv_R010YNN_partial_25_0475,
  rs_R010_ueqv_R010YNN_partial_25_0476,
  rs_R010_ueqv_R010YNN_partial_25_0477,
  rs_R010_ueqv_R010YNN_partial_25_0478,
  rs_R010_ueqv_R010YNN_partial_25_0479,
  rs_R010_ueqv_R010YNN_partial_25_0480,
  rs_R010_ueqv_R010YNN_partial_25_0481,
  rs_R010_ueqv_R010YNN_partial_25_0482,
  rs_R010_ueqv_R010YNN_partial_25_0483,
  rs_R010_ueqv_R010YNN_partial_25_0484,
  rs_R010_ueqv_R010YNN_partial_25_0485,
  rs_R010_ueqv_R010YNN_partial_25_0486,
  rs_R010_ueqv_R010YNN_partial_25_0487,
  rs_R010_ueqv_R010YNN_partial_25_0488,
  rs_R010_ueqv_R010YNN_partial_25_0489,
  rs_R010_ueqv_R010YNN_partial_25_0490,
  rs_R010_ueqv_R010YNN_partial_25_0491,
  rs_R010_ueqv_R010YNN_partial_25_0492,
  rs_R010_ueqv_R010YNN_partial_25_0493,
  rs_R010_ueqv_R010YNN_partial_25_0494,
  rs_R010_ueqv_R010YNN_partial_25_0495,
  rs_R010_ueqv_R010YNN_partial_25_0496,
  rs_R010_ueqv_R010YNN_partial_25_0497,
  rs_R010_ueqv_R010YNN_partial_25_0498,
  rs_R010_ueqv_R010YNN_partial_25_0499
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_0400_0499 : Poly :=
[
  term ((6947622085770741760 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((504063624782233600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((13918380046314455040 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((1014949307653120000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((7266678841031601094784 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-50830188964601446400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6353773620575180800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-18316458226122864640 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11549178645294080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((5774589322647040 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-9803721998910723821312 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1225465249863840477664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1016830741658009600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (12, 2), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-733041936520499737568 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-13733191957294222900256 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1716648994661777862532 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((1187929604337090560 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((83224183161418754048 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (12, 2), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((211821591221569757264 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (12, 2), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (12, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-3740917755854113216 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((1870458877927056608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((4006680979361322512 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-539685528431856080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 400 through 499. -/
theorem rs_R010_ueqv_R010YNN_block_25_0400_0499_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_0400_0499
      rs_R010_ueqv_R010YNN_block_25_0400_0499 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
