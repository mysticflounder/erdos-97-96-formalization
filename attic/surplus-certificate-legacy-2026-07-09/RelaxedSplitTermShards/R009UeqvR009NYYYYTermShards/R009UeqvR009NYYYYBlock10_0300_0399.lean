/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 10:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0300 : Poly :=
[
  term ((1472 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0300 : Poly :=
[
  term ((2944 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1472 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0300_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0300
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0301 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 301 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0301 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0301_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0301
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0302 : Poly :=
[
  term ((23552 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0302 : Poly :=
[
  term ((47104 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0302_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0302
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0303 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 303 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0303 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0303_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0303
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0304 : Poly :=
[
  term ((11776 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0304 : Poly :=
[
  term ((23552 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0304_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0304
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0305 : Poly :=
[
  term ((-88350015629 : Rat) / 398273820) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 305 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0305 : Poly :=
[
  term ((-88350015629 : Rat) / 199136910) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((88350015629 : Rat) / 398273820) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0305_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0305
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0306 : Poly :=
[
  term ((4210004 : Rat) / 98097) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0306 : Poly :=
[
  term ((8420008 : Rat) / 98097) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4210004 : Rat) / 98097) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0306_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0306
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0307 : Poly :=
[
  term ((-89 : Rat) / 40) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 307 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0307 : Poly :=
[
  term ((-89 : Rat) / 20) [(2, 1), (3, 1), (8, 1), (13, 1)],
  term ((89 : Rat) / 40) [(3, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0307_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0307
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0308 : Poly :=
[
  term ((71768322827 : Rat) / 531031760) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 308 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0308 : Poly :=
[
  term ((71768322827 : Rat) / 265515880) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((-71768322827 : Rat) / 531031760) [(3, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0308_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0308
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0309 : Poly :=
[
  term ((-861971 : Rat) / 32699) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0309 : Poly :=
[
  term ((-1723942 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((861971 : Rat) / 32699) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0309_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0309
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0310 : Poly :=
[
  term ((-19 : Rat) / 32) [(3, 1), (9, 1)]
]

/-- Partial product 310 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0310 : Poly :=
[
  term ((-19 : Rat) / 16) [(2, 1), (3, 1), (9, 1)],
  term ((19 : Rat) / 32) [(3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0310_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0310
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0311 : Poly :=
[
  term ((16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 311 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0311 : Poly :=
[
  term ((32 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0311_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0311
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0312 : Poly :=
[
  term ((8 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 312 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0312 : Poly :=
[
  term ((16 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-8 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0312_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0312
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0313 : Poly :=
[
  term ((-15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 313 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0313 : Poly :=
[
  term ((-31005392 : Rat) / 19913691) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0313_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0313
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0314 : Poly :=
[
  term ((14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 314 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0314 : Poly :=
[
  term ((29440 : Rat) / 98097) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0314_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0314
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0315 : Poly :=
[
  term ((-46508088 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 315 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0315 : Poly :=
[
  term ((-93016176 : Rat) / 33189485) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((46508088 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0315_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0315
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0316 : Poly :=
[
  term ((8832 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0316 : Poly :=
[
  term ((17664 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8832 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0316_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0316
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0317 : Poly :=
[
  term ((-32 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 317 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0317 : Poly :=
[
  term ((-64 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((32 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0317_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0317
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0318 : Poly :=
[
  term ((7751348 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 318 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0318 : Poly :=
[
  term ((15502696 : Rat) / 6637897) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7751348 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0318_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0318
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0319 : Poly :=
[
  term ((-7360 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0319 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7360 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0319_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0319
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0320 : Poly :=
[
  term ((102901384 : Rat) / 99568455) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 320 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0320 : Poly :=
[
  term ((205802768 : Rat) / 99568455) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-102901384 : Rat) / 99568455) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0320_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0320
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0321 : Poly :=
[
  term ((-8832 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0321 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8832 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0321_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0321
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0322 : Poly :=
[
  term ((-15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 322 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0322 : Poly :=
[
  term ((-31005392 : Rat) / 19913691) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0322_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0322
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0323 : Poly :=
[
  term ((14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0323 : Poly :=
[
  term ((29440 : Rat) / 98097) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0323_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0323
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0324 : Poly :=
[
  term ((-2419717 : Rat) / 1746815) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 324 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0324 : Poly :=
[
  term ((-4839434 : Rat) / 1746815) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((2419717 : Rat) / 1746815) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0324_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0324
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0325 : Poly :=
[
  term ((368 : Rat) / 1721) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0325 : Poly :=
[
  term ((736 : Rat) / 1721) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-368 : Rat) / 1721) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0325_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0325
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0326 : Poly :=
[
  term ((52125576 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 326 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0326 : Poly :=
[
  term ((104251152 : Rat) / 33189485) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-52125576 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0326_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0326
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0327 : Poly :=
[
  term ((-2944 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 327 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0327 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((2944 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0327_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0327
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0328 : Poly :=
[
  term ((-3 : Rat) / 4) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 328 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0328 : Poly :=
[
  term ((-3 : Rat) / 2) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((3 : Rat) / 4) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0328_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0328
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0329 : Poly :=
[
  term ((-5 : Rat) / 12) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 329 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0329 : Poly :=
[
  term ((-5 : Rat) / 6) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((5 : Rat) / 12) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0329_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0329
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0330 : Poly :=
[
  term ((-40 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 330 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0330 : Poly :=
[
  term ((-80 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((40 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0330_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0330
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0331 : Poly :=
[
  term ((-190 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 331 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0331 : Poly :=
[
  term ((-380 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((190 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0331_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0331
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0332 : Poly :=
[
  term ((5 : Rat) / 8) [(3, 1), (9, 1), (12, 2)]
]

/-- Partial product 332 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0332 : Poly :=
[
  term ((5 : Rat) / 4) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((-5 : Rat) / 8) [(3, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0332_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0332
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0333 : Poly :=
[
  term ((20 : Rat) / 29) [(3, 1), (9, 1), (12, 2), (15, 2)]
]

/-- Partial product 333 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0333 : Poly :=
[
  term ((40 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2)],
  term ((-20 : Rat) / 29) [(3, 1), (9, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0333_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0333
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0334 : Poly :=
[
  term ((-115 : Rat) / 348) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 334 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0334 : Poly :=
[
  term ((-115 : Rat) / 174) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((115 : Rat) / 348) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0334_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0334
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0335 : Poly :=
[
  term ((40 : Rat) / 29) [(3, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 335 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0335 : Poly :=
[
  term ((80 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-40 : Rat) / 29) [(3, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0335_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0335
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0336 : Poly :=
[
  term ((-5 : Rat) / 12) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 336 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0336 : Poly :=
[
  term ((-5 : Rat) / 6) [(2, 1), (3, 1), (9, 1), (13, 2)],
  term ((5 : Rat) / 12) [(3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0336_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0336
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0337 : Poly :=
[
  term ((-40 : Rat) / 87) [(3, 1), (9, 1), (13, 2), (15, 2)]
]

/-- Partial product 337 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0337 : Poly :=
[
  term ((-80 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (13, 2), (15, 2)],
  term ((40 : Rat) / 87) [(3, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0337_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0337
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0338 : Poly :=
[
  term ((-27 : Rat) / 116) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 338 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0338 : Poly :=
[
  term ((-27 : Rat) / 58) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((27 : Rat) / 116) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0338_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0338
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0339 : Poly :=
[
  term ((-1023177936 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 339 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0339 : Poly :=
[
  term ((-2046355872 : Rat) / 6637897) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((1023177936 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0339_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0339
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0340 : Poly :=
[
  term ((971520 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0340 : Poly :=
[
  term ((1943040 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-971520 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0340_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0340
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0341 : Poly :=
[
  term ((-2573447536 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 341 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0341 : Poly :=
[
  term ((-5146895072 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((2573447536 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0341_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0341
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0342 : Poly :=
[
  term ((488704 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0342 : Poly :=
[
  term ((977408 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-488704 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0342_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0342
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0343 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 343 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0343 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0343_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0343
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0344 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0344 : Poly :=
[
  term ((-3049920 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0344_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0344
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0345 : Poly :=
[
  term ((94350902311 : Rat) / 398273820) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 345 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0345 : Poly :=
[
  term ((94350902311 : Rat) / 199136910) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-94350902311 : Rat) / 398273820) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0345_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0345
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0346 : Poly :=
[
  term ((-4506733 : Rat) / 98097) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0346 : Poly :=
[
  term ((-9013466 : Rat) / 98097) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4506733 : Rat) / 98097) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0346_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0346
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0347 : Poly :=
[
  term ((-664418012 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 3)]
]

/-- Partial product 347 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0347 : Poly :=
[
  term ((-1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3)],
  term ((664418012 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0347_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0347
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0348 : Poly :=
[
  term ((127080 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 348 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0348 : Poly :=
[
  term ((254160 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-127080 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0348_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0348
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0349 : Poly :=
[
  term ((-5979762108 : Rat) / 33189485) [(3, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 349 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0349 : Poly :=
[
  term ((-11959524216 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1)],
  term ((5979762108 : Rat) / 33189485) [(3, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0349_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0349
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0350 : Poly :=
[
  term ((1143720 : Rat) / 32699) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0350 : Poly :=
[
  term ((2287440 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0350_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0350
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0351 : Poly :=
[
  term ((-664418012 : Rat) / 1746815) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 351 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0351 : Poly :=
[
  term ((-1328836024 : Rat) / 1746815) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((664418012 : Rat) / 1746815) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0351_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0351
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0352 : Poly :=
[
  term ((127080 : Rat) / 1721) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 352 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0352 : Poly :=
[
  term ((254160 : Rat) / 1721) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-127080 : Rat) / 1721) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0352_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0352
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0353 : Poly :=
[
  term ((7469273529 : Rat) / 53103176) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 353 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0353 : Poly :=
[
  term ((7469273529 : Rat) / 26551588) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-7469273529 : Rat) / 53103176) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0353_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0353
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0354 : Poly :=
[
  term ((-1778081 : Rat) / 65398) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0354 : Poly :=
[
  term ((-1778081 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1778081 : Rat) / 65398) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0354_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0354
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0355 : Poly :=
[
  term ((-498313509 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)]
]

/-- Partial product 355 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0355 : Poly :=
[
  term ((-996627018 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (15, 3)],
  term ((498313509 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0355_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0355
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0356 : Poly :=
[
  term ((95310 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 356 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0356 : Poly :=
[
  term ((190620 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-95310 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0356_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0356
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0357 : Poly :=
[
  term ((968918500 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 357 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0357 : Poly :=
[
  term ((1937837000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-968918500 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0357_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0357
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0358 : Poly :=
[
  term ((-920000 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 358 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0358 : Poly :=
[
  term ((-1840000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((920000 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0358_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0358
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0359 : Poly :=
[
  term ((71885125173 : Rat) / 66378970) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 359 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0359 : Poly :=
[
  term ((71885125173 : Rat) / 33189485) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-71885125173 : Rat) / 66378970) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0359_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0359
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0360 : Poly :=
[
  term ((-6849818 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 360 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0360 : Poly :=
[
  term ((-13699636 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((6849818 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0360_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0360
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0361 : Poly :=
[
  term ((-1453377750 : Rat) / 6637897) [(3, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 361 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0361 : Poly :=
[
  term ((-2906755500 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2)],
  term ((1453377750 : Rat) / 6637897) [(3, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0361_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0361
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0362 : Poly :=
[
  term ((1380000 : Rat) / 32699) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 362 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0362 : Poly :=
[
  term ((2760000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1380000 : Rat) / 32699) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0362_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0362
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0363 : Poly :=
[
  term ((-17024726413 : Rat) / 19913691) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 363 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0363 : Poly :=
[
  term ((-34049452826 : Rat) / 19913691) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((17024726413 : Rat) / 19913691) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0363_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0363
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0364 : Poly :=
[
  term ((16237790 : Rat) / 98097) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0364 : Poly :=
[
  term ((32475580 : Rat) / 98097) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16237790 : Rat) / 98097) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0364_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0364
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0365 : Poly :=
[
  term ((-2906755500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 365 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0365 : Poly :=
[
  term ((-5813511000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3)],
  term ((2906755500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0365_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0365
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0366 : Poly :=
[
  term ((2760000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 366 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0366 : Poly :=
[
  term ((5520000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0366_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0366
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0367 : Poly :=
[
  term ((968918500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 367 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0367 : Poly :=
[
  term ((1937837000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-968918500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0367_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0367
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0368 : Poly :=
[
  term ((-920000 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 368 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0368 : Poly :=
[
  term ((-1840000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((920000 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0368_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0368
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0369 : Poly :=
[
  term ((6012015533 : Rat) / 26551588) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 369 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0369 : Poly :=
[
  term ((6012015533 : Rat) / 13275794) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-6012015533 : Rat) / 26551588) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0369_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0369
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0370 : Poly :=
[
  term ((-1409412 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 370 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0370 : Poly :=
[
  term ((-2818824 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1409412 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0370_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0370
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0371 : Poly :=
[
  term ((-2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 371 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0371 : Poly :=
[
  term ((-4588798016 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0371_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0371
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0372 : Poly :=
[
  term ((435712 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 372 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0372 : Poly :=
[
  term ((871424 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-435712 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0372_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0372
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0373 : Poly :=
[
  term ((-1441750728 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 373 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0373 : Poly :=
[
  term ((-2883501456 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((1441750728 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0373_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0373
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0374 : Poly :=
[
  term ((273792 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0374 : Poly :=
[
  term ((547584 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-273792 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0374_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0374
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0375 : Poly :=
[
  term ((682118624 : Rat) / 6637897) [(3, 1), (11, 2), (12, 1), (15, 3)]
]

/-- Partial product 375 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0375 : Poly :=
[
  term ((1364237248 : Rat) / 6637897) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-682118624 : Rat) / 6637897) [(3, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0375_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0375
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0376 : Poly :=
[
  term ((-647680 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 376 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0376 : Poly :=
[
  term ((-1295360 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((647680 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0376_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0376
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0377 : Poly :=
[
  term ((3441598512 : Rat) / 33189485) [(3, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 377 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0377 : Poly :=
[
  term ((6883197024 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-3441598512 : Rat) / 33189485) [(3, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0377_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0377
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0378 : Poly :=
[
  term ((-653568 : Rat) / 32699) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0378 : Poly :=
[
  term ((-1307136 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((653568 : Rat) / 32699) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0378_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0378
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0379 : Poly :=
[
  term ((2077361264 : Rat) / 6637897) [(3, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 379 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0379 : Poly :=
[
  term ((4154722528 : Rat) / 6637897) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2077361264 : Rat) / 6637897) [(3, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0379_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0379
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0380 : Poly :=
[
  term ((-1972480 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 380 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0380 : Poly :=
[
  term ((-3944960 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1972480 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0380_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0380
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0381 : Poly :=
[
  term ((-2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 381 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0381 : Poly :=
[
  term ((-4588798016 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0381_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0381
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0382 : Poly :=
[
  term ((435712 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0382 : Poly :=
[
  term ((871424 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-435712 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0382_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0382
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0383 : Poly :=
[
  term ((-104643198 : Rat) / 4741355) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 383 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0383 : Poly :=
[
  term ((-209286396 : Rat) / 4741355) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((104643198 : Rat) / 4741355) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0383_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0383
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0384 : Poly :=
[
  term ((139104 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0384 : Poly :=
[
  term ((278208 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-139104 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0384_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0384
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0385 : Poly :=
[
  term ((-10247282056 : Rat) / 33189485) [(3, 1), (11, 2), (15, 3)]
]

/-- Partial product 385 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0385 : Poly :=
[
  term ((-20494564112 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (15, 3)],
  term ((10247282056 : Rat) / 33189485) [(3, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0385_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0385
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0386 : Poly :=
[
  term ((1945984 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 386 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0386 : Poly :=
[
  term ((3891968 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1945984 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0386_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0386
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0387 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)]
]

/-- Partial product 387 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0387 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(2, 1), (3, 1), (11, 3), (13, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0387_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0387
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0388 : Poly :=
[
  term ((47104 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0388 : Poly :=
[
  term ((94208 : Rat) / 32699) [(2, 1), (3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0388_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0388
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0389 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(3, 1), (11, 3), (15, 2)]
]

/-- Partial product 389 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0389 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(2, 1), (3, 1), (11, 3), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0389_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0389
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0390 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(3, 1), (11, 3), (15, 2), (16, 1)]
]

/-- Partial product 390 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0390 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(2, 1), (3, 1), (11, 3), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0390_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0390
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0391 : Poly :=
[
  term ((41 : Rat) / 40) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 391 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0391 : Poly :=
[
  term ((41 : Rat) / 20) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((-41 : Rat) / 40) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0391_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0391
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0392 : Poly :=
[
  term ((24226615219 : Rat) / 113792520) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 392 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0392 : Poly :=
[
  term ((24226615219 : Rat) / 56896260) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-24226615219 : Rat) / 113792520) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0392_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0392
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0393 : Poly :=
[
  term ((-4087217 : Rat) / 98097) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 393 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0393 : Poly :=
[
  term ((-8174434 : Rat) / 98097) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4087217 : Rat) / 98097) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0393_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0393
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0394 : Poly :=
[
  term ((-123653851231 : Rat) / 1593095280) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 394 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0394 : Poly :=
[
  term ((-123653851231 : Rat) / 796547640) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((123653851231 : Rat) / 1593095280) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0394_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0394
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0395 : Poly :=
[
  term ((2902007 : Rat) / 196194) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0395 : Poly :=
[
  term ((2902007 : Rat) / 98097) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2902007 : Rat) / 196194) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0395_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0395
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0396 : Poly :=
[
  term ((-2657672048 : Rat) / 14224065) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 396 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0396 : Poly :=
[
  term ((-5315344096 : Rat) / 14224065) [(2, 1), (3, 1), (12, 1), (15, 3)],
  term ((2657672048 : Rat) / 14224065) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0396_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0396
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0397 : Poly :=
[
  term ((1186080 : Rat) / 32699) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 397 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0397 : Poly :=
[
  term ((2372160 : Rat) / 32699) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1186080 : Rat) / 32699) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0397_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0397
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0398 : Poly :=
[
  term ((149334339227 : Rat) / 531031760) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 398 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0398 : Poly :=
[
  term ((149334339227 : Rat) / 265515880) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-149334339227 : Rat) / 531031760) [(3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0398_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0398
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0399 : Poly :=
[
  term ((-3537583 : Rat) / 65398) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0399 : Poly :=
[
  term ((-3537583 : Rat) / 32699) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((3537583 : Rat) / 65398) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0399_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0399
        rs_R009_ueqv_R009NYYYY_generator_10_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_10_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_10_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_10_0300,
  rs_R009_ueqv_R009NYYYY_partial_10_0301,
  rs_R009_ueqv_R009NYYYY_partial_10_0302,
  rs_R009_ueqv_R009NYYYY_partial_10_0303,
  rs_R009_ueqv_R009NYYYY_partial_10_0304,
  rs_R009_ueqv_R009NYYYY_partial_10_0305,
  rs_R009_ueqv_R009NYYYY_partial_10_0306,
  rs_R009_ueqv_R009NYYYY_partial_10_0307,
  rs_R009_ueqv_R009NYYYY_partial_10_0308,
  rs_R009_ueqv_R009NYYYY_partial_10_0309,
  rs_R009_ueqv_R009NYYYY_partial_10_0310,
  rs_R009_ueqv_R009NYYYY_partial_10_0311,
  rs_R009_ueqv_R009NYYYY_partial_10_0312,
  rs_R009_ueqv_R009NYYYY_partial_10_0313,
  rs_R009_ueqv_R009NYYYY_partial_10_0314,
  rs_R009_ueqv_R009NYYYY_partial_10_0315,
  rs_R009_ueqv_R009NYYYY_partial_10_0316,
  rs_R009_ueqv_R009NYYYY_partial_10_0317,
  rs_R009_ueqv_R009NYYYY_partial_10_0318,
  rs_R009_ueqv_R009NYYYY_partial_10_0319,
  rs_R009_ueqv_R009NYYYY_partial_10_0320,
  rs_R009_ueqv_R009NYYYY_partial_10_0321,
  rs_R009_ueqv_R009NYYYY_partial_10_0322,
  rs_R009_ueqv_R009NYYYY_partial_10_0323,
  rs_R009_ueqv_R009NYYYY_partial_10_0324,
  rs_R009_ueqv_R009NYYYY_partial_10_0325,
  rs_R009_ueqv_R009NYYYY_partial_10_0326,
  rs_R009_ueqv_R009NYYYY_partial_10_0327,
  rs_R009_ueqv_R009NYYYY_partial_10_0328,
  rs_R009_ueqv_R009NYYYY_partial_10_0329,
  rs_R009_ueqv_R009NYYYY_partial_10_0330,
  rs_R009_ueqv_R009NYYYY_partial_10_0331,
  rs_R009_ueqv_R009NYYYY_partial_10_0332,
  rs_R009_ueqv_R009NYYYY_partial_10_0333,
  rs_R009_ueqv_R009NYYYY_partial_10_0334,
  rs_R009_ueqv_R009NYYYY_partial_10_0335,
  rs_R009_ueqv_R009NYYYY_partial_10_0336,
  rs_R009_ueqv_R009NYYYY_partial_10_0337,
  rs_R009_ueqv_R009NYYYY_partial_10_0338,
  rs_R009_ueqv_R009NYYYY_partial_10_0339,
  rs_R009_ueqv_R009NYYYY_partial_10_0340,
  rs_R009_ueqv_R009NYYYY_partial_10_0341,
  rs_R009_ueqv_R009NYYYY_partial_10_0342,
  rs_R009_ueqv_R009NYYYY_partial_10_0343,
  rs_R009_ueqv_R009NYYYY_partial_10_0344,
  rs_R009_ueqv_R009NYYYY_partial_10_0345,
  rs_R009_ueqv_R009NYYYY_partial_10_0346,
  rs_R009_ueqv_R009NYYYY_partial_10_0347,
  rs_R009_ueqv_R009NYYYY_partial_10_0348,
  rs_R009_ueqv_R009NYYYY_partial_10_0349,
  rs_R009_ueqv_R009NYYYY_partial_10_0350,
  rs_R009_ueqv_R009NYYYY_partial_10_0351,
  rs_R009_ueqv_R009NYYYY_partial_10_0352,
  rs_R009_ueqv_R009NYYYY_partial_10_0353,
  rs_R009_ueqv_R009NYYYY_partial_10_0354,
  rs_R009_ueqv_R009NYYYY_partial_10_0355,
  rs_R009_ueqv_R009NYYYY_partial_10_0356,
  rs_R009_ueqv_R009NYYYY_partial_10_0357,
  rs_R009_ueqv_R009NYYYY_partial_10_0358,
  rs_R009_ueqv_R009NYYYY_partial_10_0359,
  rs_R009_ueqv_R009NYYYY_partial_10_0360,
  rs_R009_ueqv_R009NYYYY_partial_10_0361,
  rs_R009_ueqv_R009NYYYY_partial_10_0362,
  rs_R009_ueqv_R009NYYYY_partial_10_0363,
  rs_R009_ueqv_R009NYYYY_partial_10_0364,
  rs_R009_ueqv_R009NYYYY_partial_10_0365,
  rs_R009_ueqv_R009NYYYY_partial_10_0366,
  rs_R009_ueqv_R009NYYYY_partial_10_0367,
  rs_R009_ueqv_R009NYYYY_partial_10_0368,
  rs_R009_ueqv_R009NYYYY_partial_10_0369,
  rs_R009_ueqv_R009NYYYY_partial_10_0370,
  rs_R009_ueqv_R009NYYYY_partial_10_0371,
  rs_R009_ueqv_R009NYYYY_partial_10_0372,
  rs_R009_ueqv_R009NYYYY_partial_10_0373,
  rs_R009_ueqv_R009NYYYY_partial_10_0374,
  rs_R009_ueqv_R009NYYYY_partial_10_0375,
  rs_R009_ueqv_R009NYYYY_partial_10_0376,
  rs_R009_ueqv_R009NYYYY_partial_10_0377,
  rs_R009_ueqv_R009NYYYY_partial_10_0378,
  rs_R009_ueqv_R009NYYYY_partial_10_0379,
  rs_R009_ueqv_R009NYYYY_partial_10_0380,
  rs_R009_ueqv_R009NYYYY_partial_10_0381,
  rs_R009_ueqv_R009NYYYY_partial_10_0382,
  rs_R009_ueqv_R009NYYYY_partial_10_0383,
  rs_R009_ueqv_R009NYYYY_partial_10_0384,
  rs_R009_ueqv_R009NYYYY_partial_10_0385,
  rs_R009_ueqv_R009NYYYY_partial_10_0386,
  rs_R009_ueqv_R009NYYYY_partial_10_0387,
  rs_R009_ueqv_R009NYYYY_partial_10_0388,
  rs_R009_ueqv_R009NYYYY_partial_10_0389,
  rs_R009_ueqv_R009NYYYY_partial_10_0390,
  rs_R009_ueqv_R009NYYYY_partial_10_0391,
  rs_R009_ueqv_R009NYYYY_partial_10_0392,
  rs_R009_ueqv_R009NYYYY_partial_10_0393,
  rs_R009_ueqv_R009NYYYY_partial_10_0394,
  rs_R009_ueqv_R009NYYYY_partial_10_0395,
  rs_R009_ueqv_R009NYYYY_partial_10_0396,
  rs_R009_ueqv_R009NYYYY_partial_10_0397,
  rs_R009_ueqv_R009NYYYY_partial_10_0398,
  rs_R009_ueqv_R009NYYYY_partial_10_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_10_0300_0399 : Poly :=
[
  term ((2944 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((47104 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((23552 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-88350015629 : Rat) / 199136910) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((8420008 : Rat) / 98097) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 20) [(2, 1), (3, 1), (8, 1), (13, 1)],
  term ((71768322827 : Rat) / 265515880) [(2, 1), (3, 1), (8, 1), (15, 1)],
  term ((-1723942 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 16) [(2, 1), (3, 1), (9, 1)],
  term ((32 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((16 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-31005392 : Rat) / 19913691) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((29440 : Rat) / 98097) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((17664 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((15502696 : Rat) / 6637897) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-14720 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((205802768 : Rat) / 99568455) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-17664 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31005392 : Rat) / 19913691) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((29440 : Rat) / 98097) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4839434 : Rat) / 1746815) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((736 : Rat) / 1721) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((104251152 : Rat) / 33189485) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-5888 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3 : Rat) / 2) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-5 : Rat) / 6) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-80 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-380 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((5 : Rat) / 4) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((40 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2)],
  term ((-115 : Rat) / 174) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((80 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-5 : Rat) / 6) [(2, 1), (3, 1), (9, 1), (13, 2)],
  term ((-80 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (13, 2), (15, 2)],
  term ((-27 : Rat) / 58) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((1943040 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5146895072 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((977408 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((94350902311 : Rat) / 199136910) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-9013466 : Rat) / 98097) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3)],
  term ((254160 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-11959524216 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1)],
  term ((2287440 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 1746815) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((254160 : Rat) / 1721) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((7469273529 : Rat) / 26551588) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-1778081 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-996627018 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (15, 3)],
  term ((190620 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((1937837000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1840000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((71885125173 : Rat) / 33189485) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-13699636 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2)],
  term ((2760000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-34049452826 : Rat) / 19913691) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((32475580 : Rat) / 98097) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3)],
  term ((5520000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1937837000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1840000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((6012015533 : Rat) / 13275794) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-2818824 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4588798016 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((871424 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2883501456 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((547584 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1364237248 : Rat) / 6637897) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-1295360 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((4154722528 : Rat) / 6637897) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3944960 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4588798016 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((871424 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-209286396 : Rat) / 4741355) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((278208 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-20494564112 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (15, 3)],
  term ((3891968 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(2, 1), (3, 1), (11, 3), (13, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(2, 1), (3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(2, 1), (3, 1), (11, 3), (15, 2)],
  term ((-23552 : Rat) / 32699) [(2, 1), (3, 1), (11, 3), (15, 2), (16, 1)],
  term ((41 : Rat) / 20) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((24226615219 : Rat) / 56896260) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8174434 : Rat) / 98097) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-123653851231 : Rat) / 796547640) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((2902007 : Rat) / 98097) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 14224065) [(2, 1), (3, 1), (12, 1), (15, 3)],
  term ((2372160 : Rat) / 32699) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((149334339227 : Rat) / 265515880) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-3537583 : Rat) / 32699) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1472 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-11776 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((88350015629 : Rat) / 398273820) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4210004 : Rat) / 98097) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 40) [(3, 1), (8, 1), (13, 1)],
  term ((-71768322827 : Rat) / 531031760) [(3, 1), (8, 1), (15, 1)],
  term ((861971 : Rat) / 32699) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((19 : Rat) / 32) [(3, 1), (9, 1)],
  term ((-16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-8 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((46508088 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8832 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-7751348 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((7360 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-102901384 : Rat) / 99568455) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((8832 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2419717 : Rat) / 1746815) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-368 : Rat) / 1721) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-52125576 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((2944 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((3 : Rat) / 4) [(3, 1), (9, 1), (12, 1)],
  term ((5 : Rat) / 12) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((40 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((190 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-5 : Rat) / 8) [(3, 1), (9, 1), (12, 2)],
  term ((-20 : Rat) / 29) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((115 : Rat) / 348) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-40 : Rat) / 29) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((5 : Rat) / 12) [(3, 1), (9, 1), (13, 2)],
  term ((40 : Rat) / 87) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((27 : Rat) / 116) [(3, 1), (9, 1), (15, 2)],
  term ((1023177936 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-971520 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2573447536 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-488704 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((1524960 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-94350902311 : Rat) / 398273820) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((4506733 : Rat) / 98097) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 3)],
  term ((-127080 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1143720 : Rat) / 32699) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 1746815) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-127080 : Rat) / 1721) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7469273529 : Rat) / 53103176) [(3, 1), (10, 1), (15, 1)],
  term ((1778081 : Rat) / 65398) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((498313509 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)],
  term ((-95310 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-968918500 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((920000 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-71885125173 : Rat) / 66378970) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((6849818 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1453377750 : Rat) / 6637897) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-1380000 : Rat) / 32699) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((17024726413 : Rat) / 19913691) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-16237790 : Rat) / 98097) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-2760000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-968918500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((920000 : Rat) / 32699) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6012015533 : Rat) / 26551588) [(3, 1), (11, 1), (15, 2)],
  term ((1409412 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-435712 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1441750728 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-273792 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-682118624 : Rat) / 6637897) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((647680 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-3441598512 : Rat) / 33189485) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((653568 : Rat) / 32699) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2077361264 : Rat) / 6637897) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((1972480 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-435712 : Rat) / 32699) [(3, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((104643198 : Rat) / 4741355) [(3, 1), (11, 2), (15, 1)],
  term ((-139104 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((10247282056 : Rat) / 33189485) [(3, 1), (11, 2), (15, 3)],
  term ((-1945984 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(3, 1), (11, 3), (15, 2)],
  term ((11776 : Rat) / 32699) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((-41 : Rat) / 40) [(3, 1), (12, 1), (13, 1)],
  term ((-24226615219 : Rat) / 113792520) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((4087217 : Rat) / 98097) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((123653851231 : Rat) / 1593095280) [(3, 1), (12, 1), (15, 1)],
  term ((-2902007 : Rat) / 196194) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 14224065) [(3, 1), (12, 1), (15, 3)],
  term ((-1186080 : Rat) / 32699) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-149334339227 : Rat) / 531031760) [(3, 1), (12, 2), (15, 1)],
  term ((3537583 : Rat) / 65398) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NYYYY_block_10_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_10_0300_0399
      rs_R009_ueqv_R009NYYYY_block_10_0300_0399 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
