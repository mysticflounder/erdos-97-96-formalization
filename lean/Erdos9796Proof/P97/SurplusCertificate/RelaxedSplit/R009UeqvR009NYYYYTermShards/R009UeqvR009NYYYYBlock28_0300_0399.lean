/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 28:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0300 : Poly :=
[
  term ((-18686218 : Rat) / 98097) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 300 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0300 : Poly :=
[
  term ((-37372436 : Rat) / 98097) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((18686218 : Rat) / 98097) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0300_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0300
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0301 : Poly :=
[
  term ((-81 : Rat) / 10) [(2, 1), (13, 2)]
]

/-- Partial product 301 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0301 : Poly :=
[
  term ((81 : Rat) / 10) [(2, 1), (13, 2)],
  term ((-81 : Rat) / 5) [(2, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0301_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0301
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0302 : Poly :=
[
  term ((-3615067997 : Rat) / 1373358) [(2, 1), (13, 2), (15, 2)]
]

/-- Partial product 302 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0302 : Poly :=
[
  term ((-3615067997 : Rat) / 686679) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((3615067997 : Rat) / 1373358) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0302_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0302
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0303 : Poly :=
[
  term ((49745968 : Rat) / 98097) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 303 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0303 : Poly :=
[
  term ((99491936 : Rat) / 98097) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-49745968 : Rat) / 98097) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0303_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0303
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0304 : Poly :=
[
  term ((5315344096 : Rat) / 6637897) [(2, 1), (13, 3), (15, 1)]
]

/-- Partial product 304 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0304 : Poly :=
[
  term ((10630688192 : Rat) / 6637897) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((-5315344096 : Rat) / 6637897) [(2, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0304_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0304
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0305 : Poly :=
[
  term ((-5083200 : Rat) / 32699) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0305 : Poly :=
[
  term ((-10166400 : Rat) / 32699) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((5083200 : Rat) / 32699) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0305_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0305
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0306 : Poly :=
[
  term ((-262461541787 : Rat) / 6372381120) [(2, 1), (15, 2)]
]

/-- Partial product 306 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0306 : Poly :=
[
  term ((-262461541787 : Rat) / 3186190560) [(2, 1), (14, 1), (15, 2)],
  term ((262461541787 : Rat) / 6372381120) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0306_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0306
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0307 : Poly :=
[
  term ((5827741 : Rat) / 784776) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 307 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0307 : Poly :=
[
  term ((5827741 : Rat) / 392388) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5827741 : Rat) / 784776) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0307_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0307
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0308 : Poly :=
[
  term ((-39522502697 : Rat) / 531031760) [(2, 1), (15, 4)]
]

/-- Partial product 308 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0308 : Poly :=
[
  term ((-39522502697 : Rat) / 265515880) [(2, 1), (14, 1), (15, 4)],
  term ((39522502697 : Rat) / 531031760) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0308_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0308
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0309 : Poly :=
[
  term ((2831621 : Rat) / 196194) [(2, 1), (15, 4), (16, 1)]
]

/-- Partial product 309 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0309 : Poly :=
[
  term ((2831621 : Rat) / 98097) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-2831621 : Rat) / 196194) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0309_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0309
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0310 : Poly :=
[
  term ((-31 : Rat) / 20) [(3, 1), (5, 1)]
]

/-- Partial product 310 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0310 : Poly :=
[
  term ((31 : Rat) / 20) [(3, 1), (5, 1)],
  term ((-31 : Rat) / 10) [(3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0310_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0310
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0311 : Poly :=
[
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 311 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0311 : Poly :=
[
  term ((-128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0311_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0311
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0312 : Poly :=
[
  term ((62010784 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 312 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0312 : Poly :=
[
  term ((-62010784 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((124021568 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0312_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0312
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0313 : Poly :=
[
  term ((-58880 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0313 : Poly :=
[
  term ((58880 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-117760 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0313_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0313
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0314 : Poly :=
[
  term ((31005392 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 314 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0314 : Poly :=
[
  term ((62010784 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-31005392 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0314_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0314
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0315 : Poly :=
[
  term ((-29440 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0315 : Poly :=
[
  term ((-58880 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29440 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0315_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0315
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0316 : Poly :=
[
  term ((128 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 316 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0316 : Poly :=
[
  term ((-128 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((256 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0316_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0316
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0317 : Poly :=
[
  term ((64 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 317 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0317 : Poly :=
[
  term ((128 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-64 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0317_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0317
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0318 : Poly :=
[
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 318 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0318 : Poly :=
[
  term ((-128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0318_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0318
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0319 : Poly :=
[
  term ((5 : Rat) / 6) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 319 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0319 : Poly :=
[
  term ((-5 : Rat) / 6) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((5 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0319_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0319
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0320 : Poly :=
[
  term ((5 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 320 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0320 : Poly :=
[
  term ((-5 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((10 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0320_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0320
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0321 : Poly :=
[
  term ((160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 321 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0321 : Poly :=
[
  term ((-160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((320 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0321_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0321
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0322 : Poly :=
[
  term ((80 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 322 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0322 : Poly :=
[
  term ((160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-80 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0322_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0322
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0323 : Poly :=
[
  term ((160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 323 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0323 : Poly :=
[
  term ((-160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((320 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0323_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0323
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0324 : Poly :=
[
  term ((80 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 324 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0324 : Poly :=
[
  term ((160 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-80 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0324_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0324
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0325 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 325 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0325 : Poly :=
[
  term ((8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0325_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0325
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0326 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0326 : Poly :=
[
  term ((-7772160 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3886080 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0326_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0326
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0327 : Poly :=
[
  term ((-21261376384 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 327 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0327 : Poly :=
[
  term ((21261376384 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-42522752768 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0327_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0327
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0328 : Poly :=
[
  term ((4066560 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0328 : Poly :=
[
  term ((-4066560 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8133120 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0328_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0328
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0329 : Poly :=
[
  term ((-10630688192 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 329 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0329 : Poly :=
[
  term ((-21261376384 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((10630688192 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0329_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0329
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0330 : Poly :=
[
  term ((2033280 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0330 : Poly :=
[
  term ((4066560 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2033280 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0330_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0330
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0331 : Poly :=
[
  term ((4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 331 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0331 : Poly :=
[
  term ((8162169444 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0331_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0331
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0332 : Poly :=
[
  term ((-3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0332 : Poly :=
[
  term ((-7750080 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0332_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0332
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0333 : Poly :=
[
  term ((-3875674000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 333 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0333 : Poly :=
[
  term ((3875674000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7751348000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0333_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0333
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0334 : Poly :=
[
  term ((3680000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0334 : Poly :=
[
  term ((-3680000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7360000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0334_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0334
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0335 : Poly :=
[
  term ((-1937837000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 335 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0335 : Poly :=
[
  term ((-3875674000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1937837000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0335_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0335
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0336 : Poly :=
[
  term ((1840000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 336 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0336 : Poly :=
[
  term ((3680000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1840000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0336_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0336
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0337 : Poly :=
[
  term ((-19488645096 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 337 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0337 : Poly :=
[
  term ((19488645096 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-38977290192 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0337_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0337
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0338 : Poly :=
[
  term ((3718216 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0338 : Poly :=
[
  term ((-3718216 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7436432 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0338_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0338
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0339 : Poly :=
[
  term ((-1400351094 : Rat) / 4741355) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 339 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0339 : Poly :=
[
  term ((-2800702188 : Rat) / 4741355) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((1400351094 : Rat) / 4741355) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0339_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0339
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0340 : Poly :=
[
  term ((1870148 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0340 : Poly :=
[
  term ((3740296 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1870148 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0340_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0340
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0341 : Poly :=
[
  term ((9177596032 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 341 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0341 : Poly :=
[
  term ((-9177596032 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((18355192064 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0341_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0341
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0342 : Poly :=
[
  term ((-1742848 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0342 : Poly :=
[
  term ((1742848 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3485696 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0342_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0342
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0343 : Poly :=
[
  term ((4588798016 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 343 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0343 : Poly :=
[
  term ((9177596032 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4588798016 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0343_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0343
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0344 : Poly :=
[
  term ((-871424 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0344 : Poly :=
[
  term ((-1742848 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((871424 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0344_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0344
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0345 : Poly :=
[
  term ((-2728474496 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 345 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0345 : Poly :=
[
  term ((2728474496 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((-5456948992 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0345_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0345
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0346 : Poly :=
[
  term ((2590720 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 346 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0346 : Poly :=
[
  term ((-2590720 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((5181440 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0346_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0346
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0347 : Poly :=
[
  term ((-1364237248 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)]
]

/-- Partial product 347 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0347 : Poly :=
[
  term ((-2728474496 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2)],
  term ((1364237248 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0347_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0347
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0348 : Poly :=
[
  term ((1295360 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 348 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0348 : Poly :=
[
  term ((2590720 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1295360 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0348_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0348
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0349 : Poly :=
[
  term ((-31 : Rat) / 20) [(3, 1), (5, 1), (12, 1)]
]

/-- Partial product 349 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0349 : Poly :=
[
  term ((31 : Rat) / 20) [(3, 1), (5, 1), (12, 1)],
  term ((-31 : Rat) / 10) [(3, 1), (5, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0349_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0349
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0350 : Poly :=
[
  term ((14342485769 : Rat) / 66378970) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 350 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0350 : Poly :=
[
  term ((-14342485769 : Rat) / 66378970) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((14342485769 : Rat) / 33189485) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0350_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0350
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0351 : Poly :=
[
  term ((-3983932 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0351 : Poly :=
[
  term ((3983932 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7967864 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0351_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0351
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0352 : Poly :=
[
  term ((14342485769 : Rat) / 132757940) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 352 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0352 : Poly :=
[
  term ((14342485769 : Rat) / 66378970) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14342485769 : Rat) / 132757940) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0352_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0352
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0353 : Poly :=
[
  term ((-1991966 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0353 : Poly :=
[
  term ((-3983932 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1991966 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0353_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0353
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0354 : Poly :=
[
  term ((1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 354 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0354 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0354_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0354
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0355 : Poly :=
[
  term ((-381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0355 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0355_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0355
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0356 : Poly :=
[
  term ((-996627018 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 356 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0356 : Poly :=
[
  term ((996627018 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0356_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0356
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0357 : Poly :=
[
  term ((190620 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0357 : Poly :=
[
  term ((-190620 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0357_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0357
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0358 : Poly :=
[
  term ((-166104503 : Rat) / 1746815) [(3, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 358 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0358 : Poly :=
[
  term ((-332209006 : Rat) / 1746815) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((166104503 : Rat) / 1746815) [(3, 1), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0358_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0358
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0359 : Poly :=
[
  term ((31770 : Rat) / 1721) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0359 : Poly :=
[
  term ((63540 : Rat) / 1721) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31770 : Rat) / 1721) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0359_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0359
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0360 : Poly :=
[
  term ((-17274868312 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 360 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0360 : Poly :=
[
  term ((17274868312 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-34549736624 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0360_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0360
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0361 : Poly :=
[
  term ((3304080 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0361 : Poly :=
[
  term ((-3304080 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6608160 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0361_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0361
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0362 : Poly :=
[
  term ((-8637434156 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 362 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0362 : Poly :=
[
  term ((-17274868312 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((8637434156 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0362_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0362
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0363 : Poly :=
[
  term ((1652040 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0363 : Poly :=
[
  term ((3304080 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1652040 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0363_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0363
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0364 : Poly :=
[
  term ((8637434156 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 364 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0364 : Poly :=
[
  term ((-8637434156 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((17274868312 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0364_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0364
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0365 : Poly :=
[
  term ((-1652040 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0365 : Poly :=
[
  term ((1652040 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0365_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0365
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0366 : Poly :=
[
  term ((4318717078 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 366 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0366 : Poly :=
[
  term ((8637434156 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-4318717078 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0366_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0366
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0367 : Poly :=
[
  term ((-826020 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 367 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0367 : Poly :=
[
  term ((-1652040 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((826020 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0367_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0367
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0368 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 368 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0368 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0368_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0368
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0369 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0369 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0369_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0369
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0370 : Poly :=
[
  term ((2657672048 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 370 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0370 : Poly :=
[
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0370_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0370
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0371 : Poly :=
[
  term ((-508320 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0371 : Poly :=
[
  term ((508320 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0371_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0371
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0372 : Poly :=
[
  term ((1328836024 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 372 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0372 : Poly :=
[
  term ((2657672048 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0372_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0372
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0373 : Poly :=
[
  term ((-254160 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0373 : Poly :=
[
  term ((-508320 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((254160 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0373_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0373
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0374 : Poly :=
[
  term ((-664418012 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 374 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0374 : Poly :=
[
  term ((664418012 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0374_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0374
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0375 : Poly :=
[
  term ((127080 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 375 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0375 : Poly :=
[
  term ((-127080 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((254160 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0375_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0375
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0376 : Poly :=
[
  term ((-332209006 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (15, 2)]
]

/-- Partial product 376 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0376 : Poly :=
[
  term ((-664418012 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((332209006 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0376_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0376
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0377 : Poly :=
[
  term ((63540 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 377 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0377 : Poly :=
[
  term ((127080 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-63540 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0377_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0377
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0378 : Poly :=
[
  term ((8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 378 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0378 : Poly :=
[
  term ((17274868312 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0378_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0378
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0379 : Poly :=
[
  term ((-1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0379 : Poly :=
[
  term ((-3304080 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0379_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0379
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0380 : Poly :=
[
  term ((-664418012 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 380 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0380 : Poly :=
[
  term ((664418012 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0380_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0380
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0381 : Poly :=
[
  term ((127080 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0381 : Poly :=
[
  term ((-127080 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((254160 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0381_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0381
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0382 : Poly :=
[
  term ((1661045030 : Rat) / 6637897) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 382 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0382 : Poly :=
[
  term ((3322090060 : Rat) / 6637897) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1661045030 : Rat) / 6637897) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0382_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0382
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0383 : Poly :=
[
  term ((-1588500 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0383 : Poly :=
[
  term ((-3177000 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1588500 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0383_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0383
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0384 : Poly :=
[
  term ((10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 384 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0384 : Poly :=
[
  term ((-10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((21261376384 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0384_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0384
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0385 : Poly :=
[
  term ((-677760 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0385 : Poly :=
[
  term ((677760 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1355520 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0385_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0385
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0386 : Poly :=
[
  term ((5315344096 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 386 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0386 : Poly :=
[
  term ((10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5315344096 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0386_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0386
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0387 : Poly :=
[
  term ((-338880 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0387 : Poly :=
[
  term ((-677760 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((338880 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0387_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0387
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0388 : Poly :=
[
  term ((-10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 388 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0388 : Poly :=
[
  term ((10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-21261376384 : Rat) / 99568455) [(3, 1), (7, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0388_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0388
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0389 : Poly :=
[
  term ((677760 : Rat) / 32699) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 389 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0389 : Poly :=
[
  term ((-677760 : Rat) / 32699) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1355520 : Rat) / 32699) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0389_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0389
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0390 : Poly :=
[
  term ((-5315344096 : Rat) / 99568455) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 390 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0390 : Poly :=
[
  term ((-10630688192 : Rat) / 99568455) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((5315344096 : Rat) / 99568455) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0390_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0390
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0391 : Poly :=
[
  term ((338880 : Rat) / 32699) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 391 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0391 : Poly :=
[
  term ((677760 : Rat) / 32699) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-338880 : Rat) / 32699) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0391_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0391
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0392 : Poly :=
[
  term ((19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 392 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0392 : Poly :=
[
  term ((39023268124 : Rat) / 99568455) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0392_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0392
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0393 : Poly :=
[
  term ((-3752732 : Rat) / 98097) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0393 : Poly :=
[
  term ((-7505464 : Rat) / 98097) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3752732 : Rat) / 98097) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0393_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0393
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0394 : Poly :=
[
  term ((15502696 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 394 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0394 : Poly :=
[
  term ((31005392 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-15502696 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0394_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0394
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0395 : Poly :=
[
  term ((-14720 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0395 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((14720 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0395_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0395
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0396 : Poly :=
[
  term ((-7751348 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 396 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0396 : Poly :=
[
  term ((7751348 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-15502696 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0396_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0396
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0397 : Poly :=
[
  term ((7360 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 397 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0397 : Poly :=
[
  term ((-7360 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((14720 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0397_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0397
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0398 : Poly :=
[
  term ((-3875674 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 398 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0398 : Poly :=
[
  term ((-7751348 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((3875674 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0398_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0398
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYYYY_coefficient_28_0399 : Poly :=
[
  term ((736 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 399 for generator 28. -/
def rs_R009_ueqv_R009NYYYY_partial_28_0399 : Poly :=
[
  term ((1472 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-736 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 28. -/
theorem rs_R009_ueqv_R009NYYYY_partial_28_0399_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_28_0399
        rs_R009_ueqv_R009NYYYY_generator_28_0300_0399 =
      rs_R009_ueqv_R009NYYYY_partial_28_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_28_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_28_0300,
  rs_R009_ueqv_R009NYYYY_partial_28_0301,
  rs_R009_ueqv_R009NYYYY_partial_28_0302,
  rs_R009_ueqv_R009NYYYY_partial_28_0303,
  rs_R009_ueqv_R009NYYYY_partial_28_0304,
  rs_R009_ueqv_R009NYYYY_partial_28_0305,
  rs_R009_ueqv_R009NYYYY_partial_28_0306,
  rs_R009_ueqv_R009NYYYY_partial_28_0307,
  rs_R009_ueqv_R009NYYYY_partial_28_0308,
  rs_R009_ueqv_R009NYYYY_partial_28_0309,
  rs_R009_ueqv_R009NYYYY_partial_28_0310,
  rs_R009_ueqv_R009NYYYY_partial_28_0311,
  rs_R009_ueqv_R009NYYYY_partial_28_0312,
  rs_R009_ueqv_R009NYYYY_partial_28_0313,
  rs_R009_ueqv_R009NYYYY_partial_28_0314,
  rs_R009_ueqv_R009NYYYY_partial_28_0315,
  rs_R009_ueqv_R009NYYYY_partial_28_0316,
  rs_R009_ueqv_R009NYYYY_partial_28_0317,
  rs_R009_ueqv_R009NYYYY_partial_28_0318,
  rs_R009_ueqv_R009NYYYY_partial_28_0319,
  rs_R009_ueqv_R009NYYYY_partial_28_0320,
  rs_R009_ueqv_R009NYYYY_partial_28_0321,
  rs_R009_ueqv_R009NYYYY_partial_28_0322,
  rs_R009_ueqv_R009NYYYY_partial_28_0323,
  rs_R009_ueqv_R009NYYYY_partial_28_0324,
  rs_R009_ueqv_R009NYYYY_partial_28_0325,
  rs_R009_ueqv_R009NYYYY_partial_28_0326,
  rs_R009_ueqv_R009NYYYY_partial_28_0327,
  rs_R009_ueqv_R009NYYYY_partial_28_0328,
  rs_R009_ueqv_R009NYYYY_partial_28_0329,
  rs_R009_ueqv_R009NYYYY_partial_28_0330,
  rs_R009_ueqv_R009NYYYY_partial_28_0331,
  rs_R009_ueqv_R009NYYYY_partial_28_0332,
  rs_R009_ueqv_R009NYYYY_partial_28_0333,
  rs_R009_ueqv_R009NYYYY_partial_28_0334,
  rs_R009_ueqv_R009NYYYY_partial_28_0335,
  rs_R009_ueqv_R009NYYYY_partial_28_0336,
  rs_R009_ueqv_R009NYYYY_partial_28_0337,
  rs_R009_ueqv_R009NYYYY_partial_28_0338,
  rs_R009_ueqv_R009NYYYY_partial_28_0339,
  rs_R009_ueqv_R009NYYYY_partial_28_0340,
  rs_R009_ueqv_R009NYYYY_partial_28_0341,
  rs_R009_ueqv_R009NYYYY_partial_28_0342,
  rs_R009_ueqv_R009NYYYY_partial_28_0343,
  rs_R009_ueqv_R009NYYYY_partial_28_0344,
  rs_R009_ueqv_R009NYYYY_partial_28_0345,
  rs_R009_ueqv_R009NYYYY_partial_28_0346,
  rs_R009_ueqv_R009NYYYY_partial_28_0347,
  rs_R009_ueqv_R009NYYYY_partial_28_0348,
  rs_R009_ueqv_R009NYYYY_partial_28_0349,
  rs_R009_ueqv_R009NYYYY_partial_28_0350,
  rs_R009_ueqv_R009NYYYY_partial_28_0351,
  rs_R009_ueqv_R009NYYYY_partial_28_0352,
  rs_R009_ueqv_R009NYYYY_partial_28_0353,
  rs_R009_ueqv_R009NYYYY_partial_28_0354,
  rs_R009_ueqv_R009NYYYY_partial_28_0355,
  rs_R009_ueqv_R009NYYYY_partial_28_0356,
  rs_R009_ueqv_R009NYYYY_partial_28_0357,
  rs_R009_ueqv_R009NYYYY_partial_28_0358,
  rs_R009_ueqv_R009NYYYY_partial_28_0359,
  rs_R009_ueqv_R009NYYYY_partial_28_0360,
  rs_R009_ueqv_R009NYYYY_partial_28_0361,
  rs_R009_ueqv_R009NYYYY_partial_28_0362,
  rs_R009_ueqv_R009NYYYY_partial_28_0363,
  rs_R009_ueqv_R009NYYYY_partial_28_0364,
  rs_R009_ueqv_R009NYYYY_partial_28_0365,
  rs_R009_ueqv_R009NYYYY_partial_28_0366,
  rs_R009_ueqv_R009NYYYY_partial_28_0367,
  rs_R009_ueqv_R009NYYYY_partial_28_0368,
  rs_R009_ueqv_R009NYYYY_partial_28_0369,
  rs_R009_ueqv_R009NYYYY_partial_28_0370,
  rs_R009_ueqv_R009NYYYY_partial_28_0371,
  rs_R009_ueqv_R009NYYYY_partial_28_0372,
  rs_R009_ueqv_R009NYYYY_partial_28_0373,
  rs_R009_ueqv_R009NYYYY_partial_28_0374,
  rs_R009_ueqv_R009NYYYY_partial_28_0375,
  rs_R009_ueqv_R009NYYYY_partial_28_0376,
  rs_R009_ueqv_R009NYYYY_partial_28_0377,
  rs_R009_ueqv_R009NYYYY_partial_28_0378,
  rs_R009_ueqv_R009NYYYY_partial_28_0379,
  rs_R009_ueqv_R009NYYYY_partial_28_0380,
  rs_R009_ueqv_R009NYYYY_partial_28_0381,
  rs_R009_ueqv_R009NYYYY_partial_28_0382,
  rs_R009_ueqv_R009NYYYY_partial_28_0383,
  rs_R009_ueqv_R009NYYYY_partial_28_0384,
  rs_R009_ueqv_R009NYYYY_partial_28_0385,
  rs_R009_ueqv_R009NYYYY_partial_28_0386,
  rs_R009_ueqv_R009NYYYY_partial_28_0387,
  rs_R009_ueqv_R009NYYYY_partial_28_0388,
  rs_R009_ueqv_R009NYYYY_partial_28_0389,
  rs_R009_ueqv_R009NYYYY_partial_28_0390,
  rs_R009_ueqv_R009NYYYY_partial_28_0391,
  rs_R009_ueqv_R009NYYYY_partial_28_0392,
  rs_R009_ueqv_R009NYYYY_partial_28_0393,
  rs_R009_ueqv_R009NYYYY_partial_28_0394,
  rs_R009_ueqv_R009NYYYY_partial_28_0395,
  rs_R009_ueqv_R009NYYYY_partial_28_0396,
  rs_R009_ueqv_R009NYYYY_partial_28_0397,
  rs_R009_ueqv_R009NYYYY_partial_28_0398,
  rs_R009_ueqv_R009NYYYY_partial_28_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_28_0300_0399 : Poly :=
[
  term ((-37372436 : Rat) / 98097) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((18686218 : Rat) / 98097) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((81 : Rat) / 10) [(2, 1), (13, 2)],
  term ((-81 : Rat) / 5) [(2, 1), (13, 2), (14, 1)],
  term ((-3615067997 : Rat) / 686679) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((99491936 : Rat) / 98097) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((3615067997 : Rat) / 1373358) [(2, 1), (13, 2), (15, 2)],
  term ((-49745968 : Rat) / 98097) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((10630688192 : Rat) / 6637897) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((-10166400 : Rat) / 32699) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(2, 1), (13, 3), (15, 1)],
  term ((5083200 : Rat) / 32699) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-262461541787 : Rat) / 3186190560) [(2, 1), (14, 1), (15, 2)],
  term ((5827741 : Rat) / 392388) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39522502697 : Rat) / 265515880) [(2, 1), (14, 1), (15, 4)],
  term ((2831621 : Rat) / 98097) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((262461541787 : Rat) / 6372381120) [(2, 1), (15, 2)],
  term ((-5827741 : Rat) / 784776) [(2, 1), (15, 2), (16, 1)],
  term ((39522502697 : Rat) / 531031760) [(2, 1), (15, 4)],
  term ((-2831621 : Rat) / 196194) [(2, 1), (15, 4), (16, 1)],
  term ((31 : Rat) / 20) [(3, 1), (5, 1)],
  term ((-128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((124021568 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-117760 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 19913691) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((29440 : Rat) / 98097) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-64 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((10 : Rat) / 3) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((320 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-80 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((320 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-80 : Rat) / 87) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7772160 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((3886080 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42522752768 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((8133120 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2033280 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8162169444 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7750080 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7751348000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((7360000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1937837000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1840000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23254044 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((22080 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38977290192 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((7436432 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1400351094 : Rat) / 4741355) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-1870148 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((18355192064 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3485696 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4588798016 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((871424 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5456948992 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (14, 2), (15, 2)],
  term ((5181440 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((1364237248 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-1295360 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((31 : Rat) / 20) [(3, 1), (5, 1), (12, 1)],
  term ((-31 : Rat) / 10) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((14342485769 : Rat) / 33189485) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-7967864 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14342485769 : Rat) / 132757940) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((1991966 : Rat) / 98097) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 10) [(3, 1), (5, 1), (14, 1)],
  term ((3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((1016640 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((381240 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((166104503 : Rat) / 1746815) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-31770 : Rat) / 1721) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((6608160 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8637434156 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1652040 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (14, 2), (15, 2)],
  term ((-3304080 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4318717078 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((826020 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((254160 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (14, 2), (15, 2)],
  term ((254160 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((332209006 : Rat) / 33189485) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((-63540 : Rat) / 32699) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((254160 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1661045030 : Rat) / 6637897) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((1588500 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((21261376384 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1355520 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 99568455) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((338880 : Rat) / 32699) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21261376384 : Rat) / 99568455) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((1355520 : Rat) / 32699) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((5315344096 : Rat) / 99568455) [(3, 1), (7, 1), (15, 2)],
  term ((-338880 : Rat) / 32699) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((39023268124 : Rat) / 99568455) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-7505464 : Rat) / 98097) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((3752732 : Rat) / 98097) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-29440 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((14720 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15502696 : Rat) / 6637897) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((14720 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((3875674 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-736 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NYYYY_block_28_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_28_0300_0399
      rs_R009_ueqv_R009NYYYY_block_28_0300_0399 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
