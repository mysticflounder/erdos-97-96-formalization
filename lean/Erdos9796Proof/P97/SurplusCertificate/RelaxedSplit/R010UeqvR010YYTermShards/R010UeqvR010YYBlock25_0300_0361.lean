/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 25:300-361

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_25_0300_0361 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0300 : Poly :=
[
  term ((-28064 : Rat) / 25) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0300 : Poly :=
[
  term ((28064 : Rat) / 25) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0300_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0300
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0301 : Poly :=
[
  term ((14032 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0301 : Poly :=
[
  term ((-14032 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0301_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0301
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0302 : Poly :=
[
  term ((-42096 : Rat) / 25) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0302 : Poly :=
[
  term ((-84192 : Rat) / 25) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42096 : Rat) / 25) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0302_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0302
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0303 : Poly :=
[
  term ((28064 : Rat) / 25) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0303 : Poly :=
[
  term ((56128 : Rat) / 25) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0303_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0303
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0304 : Poly :=
[
  term ((-37024 : Rat) / 25) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0304 : Poly :=
[
  term ((-74048 : Rat) / 25) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37024 : Rat) / 25) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0304_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0304
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0305 : Poly :=
[
  term ((-28064 : Rat) / 25) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 305 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0305 : Poly :=
[
  term ((-56128 : Rat) / 25) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0305_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0305
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0306 : Poly :=
[
  term (-20 : Rat) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 306 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0306 : Poly :=
[
  term (-40 : Rat) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term (20 : Rat) [(8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0306_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0306
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0307 : Poly :=
[
  term ((9892 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 307 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0307 : Poly :=
[
  term ((19784 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9892 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0307_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0307
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0308 : Poly :=
[
  term (4 : Rat) [(8, 1), (16, 1)]
]

/-- Partial product 308 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0308 : Poly :=
[
  term (8 : Rat) [(8, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0308_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0308
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0309 : Poly :=
[
  term ((11584 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0309 : Poly :=
[
  term ((23168 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0309_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0309
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0310 : Poly :=
[
  term ((-3584 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0310 : Poly :=
[
  term ((-7168 : Rat) / 25) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0310_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0310
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0311 : Poly :=
[
  term ((-4784 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0311 : Poly :=
[
  term ((-9568 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4784 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0311_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0311
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0312 : Poly :=
[
  term ((-11584 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0312 : Poly :=
[
  term ((-23168 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11584 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0312_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0312
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0313 : Poly :=
[
  term ((-1792 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0313 : Poly :=
[
  term ((-3584 : Rat) / 25) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0313_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0313
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0314 : Poly :=
[
  term ((-1792 : Rat) / 25) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 314 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0314 : Poly :=
[
  term ((1792 : Rat) / 25) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3584 : Rat) / 25) [(9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0314_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0314
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0315 : Poly :=
[
  term ((1792 : Rat) / 25) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 315 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0315 : Poly :=
[
  term ((3584 : Rat) / 25) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0315_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0315
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0316 : Poly :=
[
  term ((5376 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0316 : Poly :=
[
  term ((10752 : Rat) / 25) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5376 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0316_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0316
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0317 : Poly :=
[
  term ((13016 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0317 : Poly :=
[
  term ((26032 : Rat) / 25) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13016 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0317_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0317
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0318 : Poly :=
[
  term ((5792 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0318 : Poly :=
[
  term ((11584 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5792 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0318_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0318
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0319 : Poly :=
[
  term ((-50424 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0319 : Poly :=
[
  term ((-100848 : Rat) / 25) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((50424 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0319_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0319
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0320 : Poly :=
[
  term ((15536 : Rat) / 25) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 320 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0320 : Poly :=
[
  term ((31072 : Rat) / 25) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-15536 : Rat) / 25) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0320_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0320
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0321 : Poly :=
[
  term ((-5256 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0321 : Poly :=
[
  term ((5256 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10512 : Rat) / 25) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0321_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0321
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0322 : Poly :=
[
  term ((9976 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 322 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0322 : Poly :=
[
  term ((19952 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9976 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0322_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0322
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0323 : Poly :=
[
  term ((14544 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0323 : Poly :=
[
  term ((29088 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14544 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0323_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0323
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0324 : Poly :=
[
  term ((-2622 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0324 : Poly :=
[
  term ((-5244 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2622 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0324_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0324
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0325 : Poly :=
[
  term ((3272 : Rat) / 25) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 325 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0325 : Poly :=
[
  term ((-3272 : Rat) / 25) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((6544 : Rat) / 25) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0325_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0325
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0326 : Poly :=
[
  term ((1208 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0326 : Poly :=
[
  term ((2416 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1208 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0326_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0326
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0327 : Poly :=
[
  term ((342 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0327 : Poly :=
[
  term ((684 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0327_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0327
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0328 : Poly :=
[
  term ((-85496 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 328 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0328 : Poly :=
[
  term ((-170992 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((85496 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0328_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0328
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0329 : Poly :=
[
  term ((9952 : Rat) / 25) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0329 : Poly :=
[
  term ((19904 : Rat) / 25) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9952 : Rat) / 25) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0329_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0329
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0330 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 330 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0330 : Poly :=
[
  term (4 : Rat) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0330_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0330
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0331 : Poly :=
[
  term ((11126 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0331 : Poly :=
[
  term ((22252 : Rat) / 25) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11126 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0331_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0331
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0332 : Poly :=
[
  term ((5256 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0332 : Poly :=
[
  term ((10512 : Rat) / 25) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5256 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0332_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0332
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0333 : Poly :=
[
  term ((-18128 : Rat) / 25) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0333 : Poly :=
[
  term ((-36256 : Rat) / 25) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((18128 : Rat) / 25) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0333_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0333
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0334 : Poly :=
[
  term ((-896 : Rat) / 5) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0334 : Poly :=
[
  term ((896 : Rat) / 5) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 5) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0334_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0334
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0335 : Poly :=
[
  term ((11716 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0335 : Poly :=
[
  term ((-11716 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((23432 : Rat) / 25) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0335_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0335
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0336 : Poly :=
[
  term ((-23808 : Rat) / 25) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 336 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0336 : Poly :=
[
  term ((23808 : Rat) / 25) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-47616 : Rat) / 25) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0336_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0336
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0337 : Poly :=
[
  term ((109304 : Rat) / 25) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 337 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0337 : Poly :=
[
  term ((218608 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-109304 : Rat) / 25) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0337_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0337
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0338 : Poly :=
[
  term (2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 338 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0338 : Poly :=
[
  term (4 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0338_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0338
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0339 : Poly :=
[
  term ((2176 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 339 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0339 : Poly :=
[
  term ((4352 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2176 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0339_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0339
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0340 : Poly :=
[
  term ((10318 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0340 : Poly :=
[
  term ((20636 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10318 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0340_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0340
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0341 : Poly :=
[
  term ((13388 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0341 : Poly :=
[
  term ((26776 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13388 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0341_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0341
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0342 : Poly :=
[
  term ((-40504 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0342 : Poly :=
[
  term ((-81008 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((40504 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0342_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0342
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0343 : Poly :=
[
  term ((2296 : Rat) / 3) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 343 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0343 : Poly :=
[
  term ((4592 : Rat) / 3) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2296 : Rat) / 3) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0343_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0343
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0344 : Poly :=
[
  term ((-9976 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0344 : Poly :=
[
  term ((-19952 : Rat) / 5) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9976 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0344_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0344
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0345 : Poly :=
[
  term ((-1792 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0345 : Poly :=
[
  term ((-3584 : Rat) / 25) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0345_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0345
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0346 : Poly :=
[
  term ((3192 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 346 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0346 : Poly :=
[
  term ((-3192 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6384 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0346_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0346
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0347 : Poly :=
[
  term ((6176 : Rat) / 25) [(12, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 347 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0347 : Poly :=
[
  term ((-6176 : Rat) / 25) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((12352 : Rat) / 25) [(12, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0347_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0347
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0348 : Poly :=
[
  term ((-4326 : Rat) / 25) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 348 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0348 : Poly :=
[
  term ((4326 : Rat) / 25) [(12, 1), (15, 2), (16, 1)],
  term ((-8652 : Rat) / 25) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0348_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0348
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0349 : Poly :=
[
  term ((2876 : Rat) / 5) [(12, 1), (15, 4), (16, 1)]
]

/-- Partial product 349 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0349 : Poly :=
[
  term ((-2876 : Rat) / 5) [(12, 1), (15, 4), (16, 1)],
  term ((5752 : Rat) / 5) [(12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0349_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0349
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0350 : Poly :=
[
  term ((-10678 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0350 : Poly :=
[
  term ((-21356 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10678 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0350_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0350
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0351 : Poly :=
[
  term ((-2876 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 351 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0351 : Poly :=
[
  term ((-5752 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2876 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0351_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0351
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0352 : Poly :=
[
  term ((-3192 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0352 : Poly :=
[
  term ((-6384 : Rat) / 5) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3192 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0352_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0352
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0353 : Poly :=
[
  term ((-6176 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0353 : Poly :=
[
  term ((-12352 : Rat) / 25) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0353_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0353
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0354 : Poly :=
[
  term ((-6168 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0354 : Poly :=
[
  term ((-12336 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6168 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0354_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0354
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0355 : Poly :=
[
  term ((71116 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 355 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0355 : Poly :=
[
  term ((142232 : Rat) / 25) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-71116 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0355_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0355
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0356 : Poly :=
[
  term ((-78056 : Rat) / 75) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 356 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0356 : Poly :=
[
  term ((-156112 : Rat) / 75) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((78056 : Rat) / 75) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0356_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0356
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0357 : Poly :=
[
  term (2 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 357 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0357 : Poly :=
[
  term (4 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0357_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0357
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0358 : Poly :=
[
  term ((-4102 : Rat) / 25) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 358 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0358 : Poly :=
[
  term ((-8204 : Rat) / 25) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4102 : Rat) / 25) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0358_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0358
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0359 : Poly :=
[
  term (17 : Rat) [(14, 2), (16, 1)]
]

/-- Partial product 359 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0359 : Poly :=
[
  term (34 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (-17 : Rat) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0359_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0359
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0360 : Poly :=
[
  term ((22127 : Rat) / 75) [(15, 2), (16, 1)]
]

/-- Partial product 360 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0360 : Poly :=
[
  term ((44254 : Rat) / 75) [(12, 1), (15, 2), (16, 1)],
  term ((-22127 : Rat) / 75) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0360_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0360
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YY_coefficient_25_0361 : Poly :=
[
  term ((7086 : Rat) / 25) [(15, 4), (16, 1)]
]

/-- Partial product 361 for generator 25. -/
def rs_R010_ueqv_R010YY_partial_25_0361 : Poly :=
[
  term ((14172 : Rat) / 25) [(12, 1), (15, 4), (16, 1)],
  term ((-7086 : Rat) / 25) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 25. -/
theorem rs_R010_ueqv_R010YY_partial_25_0361_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_25_0361
        rs_R010_ueqv_R010YY_generator_25_0300_0361 =
      rs_R010_ueqv_R010YY_partial_25_0361 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_25_0300_0361 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_25_0300,
  rs_R010_ueqv_R010YY_partial_25_0301,
  rs_R010_ueqv_R010YY_partial_25_0302,
  rs_R010_ueqv_R010YY_partial_25_0303,
  rs_R010_ueqv_R010YY_partial_25_0304,
  rs_R010_ueqv_R010YY_partial_25_0305,
  rs_R010_ueqv_R010YY_partial_25_0306,
  rs_R010_ueqv_R010YY_partial_25_0307,
  rs_R010_ueqv_R010YY_partial_25_0308,
  rs_R010_ueqv_R010YY_partial_25_0309,
  rs_R010_ueqv_R010YY_partial_25_0310,
  rs_R010_ueqv_R010YY_partial_25_0311,
  rs_R010_ueqv_R010YY_partial_25_0312,
  rs_R010_ueqv_R010YY_partial_25_0313,
  rs_R010_ueqv_R010YY_partial_25_0314,
  rs_R010_ueqv_R010YY_partial_25_0315,
  rs_R010_ueqv_R010YY_partial_25_0316,
  rs_R010_ueqv_R010YY_partial_25_0317,
  rs_R010_ueqv_R010YY_partial_25_0318,
  rs_R010_ueqv_R010YY_partial_25_0319,
  rs_R010_ueqv_R010YY_partial_25_0320,
  rs_R010_ueqv_R010YY_partial_25_0321,
  rs_R010_ueqv_R010YY_partial_25_0322,
  rs_R010_ueqv_R010YY_partial_25_0323,
  rs_R010_ueqv_R010YY_partial_25_0324,
  rs_R010_ueqv_R010YY_partial_25_0325,
  rs_R010_ueqv_R010YY_partial_25_0326,
  rs_R010_ueqv_R010YY_partial_25_0327,
  rs_R010_ueqv_R010YY_partial_25_0328,
  rs_R010_ueqv_R010YY_partial_25_0329,
  rs_R010_ueqv_R010YY_partial_25_0330,
  rs_R010_ueqv_R010YY_partial_25_0331,
  rs_R010_ueqv_R010YY_partial_25_0332,
  rs_R010_ueqv_R010YY_partial_25_0333,
  rs_R010_ueqv_R010YY_partial_25_0334,
  rs_R010_ueqv_R010YY_partial_25_0335,
  rs_R010_ueqv_R010YY_partial_25_0336,
  rs_R010_ueqv_R010YY_partial_25_0337,
  rs_R010_ueqv_R010YY_partial_25_0338,
  rs_R010_ueqv_R010YY_partial_25_0339,
  rs_R010_ueqv_R010YY_partial_25_0340,
  rs_R010_ueqv_R010YY_partial_25_0341,
  rs_R010_ueqv_R010YY_partial_25_0342,
  rs_R010_ueqv_R010YY_partial_25_0343,
  rs_R010_ueqv_R010YY_partial_25_0344,
  rs_R010_ueqv_R010YY_partial_25_0345,
  rs_R010_ueqv_R010YY_partial_25_0346,
  rs_R010_ueqv_R010YY_partial_25_0347,
  rs_R010_ueqv_R010YY_partial_25_0348,
  rs_R010_ueqv_R010YY_partial_25_0349,
  rs_R010_ueqv_R010YY_partial_25_0350,
  rs_R010_ueqv_R010YY_partial_25_0351,
  rs_R010_ueqv_R010YY_partial_25_0352,
  rs_R010_ueqv_R010YY_partial_25_0353,
  rs_R010_ueqv_R010YY_partial_25_0354,
  rs_R010_ueqv_R010YY_partial_25_0355,
  rs_R010_ueqv_R010YY_partial_25_0356,
  rs_R010_ueqv_R010YY_partial_25_0357,
  rs_R010_ueqv_R010YY_partial_25_0358,
  rs_R010_ueqv_R010YY_partial_25_0359,
  rs_R010_ueqv_R010YY_partial_25_0360,
  rs_R010_ueqv_R010YY_partial_25_0361
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_25_0300_0361 : Poly :=
[
  term ((-84192 : Rat) / 25) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-74048 : Rat) / 25) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (-40 : Rat) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((5752 : Rat) / 5) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(8, 1), (12, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((42096 : Rat) / 25) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((37024 : Rat) / 25) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term (20 : Rat) [(8, 1), (14, 1), (16, 1)],
  term ((-9892 : Rat) / 5) [(8, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (16, 1)],
  term ((23168 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7168 : Rat) / 25) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9568 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11584 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4784 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23168 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11584 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((10752 : Rat) / 25) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((26032 : Rat) / 25) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11584 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-100848 : Rat) / 25) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((32864 : Rat) / 25) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3584 : Rat) / 25) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1792 : Rat) / 25) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5376 : Rat) / 25) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13016 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5792 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((50424 : Rat) / 25) [(9, 1), (15, 1), (16, 1)],
  term ((-15536 : Rat) / 25) [(9, 1), (15, 3), (16, 1)],
  term ((19952 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((29088 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 25) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10512 : Rat) / 25) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9976 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14544 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2622 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2416 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((684 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-170992 : Rat) / 25) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((19904 : Rat) / 25) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3796 : Rat) / 5) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((6544 : Rat) / 25) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1208 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 25) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((85496 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9952 : Rat) / 25) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(10, 1), (14, 1), (16, 1)],
  term ((-11126 : Rat) / 25) [(10, 1), (15, 2), (16, 1)],
  term ((10512 : Rat) / 25) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36256 : Rat) / 25) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5256 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((18128 : Rat) / 25) [(10, 2), (15, 2), (16, 1)],
  term ((218608 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4352 : Rat) / 25) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((25116 : Rat) / 25) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26776 : Rat) / 25) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92724 : Rat) / 25) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((186224 : Rat) / 75) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1792 : Rat) / 5) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((23432 : Rat) / 25) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-47616 : Rat) / 25) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-109304 : Rat) / 25) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2176 : Rat) / 25) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10318 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13388 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((40504 : Rat) / 25) [(11, 1), (15, 1), (16, 1)],
  term ((-2296 : Rat) / 3) [(11, 1), (15, 3), (16, 1)],
  term ((-19952 : Rat) / 5) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9976 : Rat) / 5) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21356 : Rat) / 25) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5752 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6384 : Rat) / 5) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12352 : Rat) / 25) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-12336 : Rat) / 25) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((142232 : Rat) / 25) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-203992 : Rat) / 75) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 1), (14, 1), (16, 1)],
  term ((-2876 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term (34 : Rat) [(12, 1), (14, 2), (16, 1)],
  term ((57232 : Rat) / 75) [(12, 1), (15, 2), (16, 1)],
  term ((-208 : Rat) / 25) [(12, 1), (15, 4), (16, 1)],
  term ((6384 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((12352 : Rat) / 25) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-8652 : Rat) / 25) [(12, 2), (15, 2), (16, 1)],
  term ((5752 : Rat) / 5) [(12, 2), (15, 4), (16, 1)],
  term ((10678 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2876 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3192 : Rat) / 5) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6176 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((6168 : Rat) / 25) [(13, 1), (15, 1), (16, 1)],
  term ((-71116 : Rat) / 25) [(13, 1), (15, 3), (16, 1)],
  term ((78056 : Rat) / 75) [(14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(14, 1), (16, 1)],
  term ((4102 : Rat) / 25) [(14, 2), (15, 2), (16, 1)],
  term (-17 : Rat) [(14, 2), (16, 1)],
  term ((-22127 : Rat) / 75) [(15, 2), (16, 1)],
  term ((-7086 : Rat) / 25) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 300 through 361. -/
theorem rs_R010_ueqv_R010YY_block_25_0300_0361_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_25_0300_0361
      rs_R010_ueqv_R010YY_block_25_0300_0361 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
