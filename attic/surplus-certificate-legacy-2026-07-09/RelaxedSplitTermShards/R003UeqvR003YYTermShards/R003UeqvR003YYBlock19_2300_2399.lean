/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:2300-2399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_2300_2399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 2300 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2300 : Poly :=
[
  term ((-117 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2300 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2300 : Poly :=
[
  term ((-234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((117 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2300 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2300_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2300
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2300 := by
  native_decide

/-- Coefficient term 2301 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2301 : Poly :=
[
  term ((-1718352 : Rat) / 10675) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 2301 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2301 : Poly :=
[
  term ((-3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((1718352 : Rat) / 10675) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2301 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2301_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2301
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2301 := by
  native_decide

/-- Coefficient term 2302 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2302 : Poly :=
[
  term ((6912 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 2302 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2302 : Poly :=
[
  term ((13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6912 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2302 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2302_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2302
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2302 := by
  native_decide

/-- Coefficient term 2303 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2303 : Poly :=
[
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2303 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2303 : Poly :=
[
  term ((-4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2303 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2303_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2303
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2303 := by
  native_decide

/-- Coefficient term 2304 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2304 : Poly :=
[
  term ((1872 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 2304 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2304 : Poly :=
[
  term ((3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2304 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2304_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2304
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2304 := by
  native_decide

/-- Coefficient term 2305 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2305 : Poly :=
[
  term ((1437 : Rat) / 35) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 2305 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2305 : Poly :=
[
  term ((2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1437 : Rat) / 35) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2305 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2305_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2305
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2305 := by
  native_decide

/-- Coefficient term 2306 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2306 : Poly :=
[
  term ((-117 : Rat) / 35) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 2306 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2306 : Poly :=
[
  term ((-234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((117 : Rat) / 35) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2306 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2306_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2306
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2306 := by
  native_decide

/-- Coefficient term 2307 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2307 : Poly :=
[
  term ((-115124 : Rat) / 875) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 2307 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2307 : Poly :=
[
  term ((-230248 : Rat) / 875) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((115124 : Rat) / 875) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2307 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2307_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2307
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2307 := by
  native_decide

/-- Coefficient term 2308 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2308 : Poly :=
[
  term ((4516 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2308 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2308 : Poly :=
[
  term ((9032 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4516 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2308 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2308_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2308
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2308 := by
  native_decide

/-- Coefficient term 2309 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2309 : Poly :=
[
  term ((-64 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2309 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2309 : Poly :=
[
  term ((-128 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2309 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2309_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2309
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2309 := by
  native_decide

/-- Coefficient term 2310 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2310 : Poly :=
[
  term ((52 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2310 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2310 : Poly :=
[
  term ((104 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-52 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2310 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2310_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2310
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2310 := by
  native_decide

/-- Coefficient term 2311 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2311 : Poly :=
[
  term ((-153621 : Rat) / 1400) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 2311 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2311 : Poly :=
[
  term ((-153621 : Rat) / 700) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((153621 : Rat) / 1400) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2311 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2311_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2311
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2311 := by
  native_decide

/-- Coefficient term 2312 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2312 : Poly :=
[
  term ((3321 : Rat) / 280) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2312 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2312 : Poly :=
[
  term ((3321 : Rat) / 140) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3321 : Rat) / 280) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2312 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2312_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2312
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2312 := by
  native_decide

/-- Coefficient term 2313 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2313 : Poly :=
[
  term ((-5913704 : Rat) / 53375) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 2313 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2313 : Poly :=
[
  term ((-11827408 : Rat) / 53375) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((5913704 : Rat) / 53375) [(9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2313 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2313_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2313
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2313 := by
  native_decide

/-- Coefficient term 2314 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2314 : Poly :=
[
  term ((4608 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2314 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2314 : Poly :=
[
  term ((9216 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2314 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2314_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2314
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2314 := by
  native_decide

/-- Coefficient term 2315 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2315 : Poly :=
[
  term ((-1536 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2315 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2315 : Poly :=
[
  term ((-3072 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2315 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2315_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2315
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2315 := by
  native_decide

/-- Coefficient term 2316 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2316 : Poly :=
[
  term ((1248 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 2316 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2316 : Poly :=
[
  term ((2496 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2316 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2316_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2316
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2316 := by
  native_decide

/-- Coefficient term 2317 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2317 : Poly :=
[
  term ((-13873 : Rat) / 210) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 2317 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2317 : Poly :=
[
  term ((-13873 : Rat) / 105) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((13873 : Rat) / 210) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2317 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2317_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2317
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2317 := by
  native_decide

/-- Coefficient term 2318 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2318 : Poly :=
[
  term ((523 : Rat) / 70) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2318 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2318 : Poly :=
[
  term ((523 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-523 : Rat) / 70) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2318 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2318_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2318
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2318 := by
  native_decide

/-- Coefficient term 2319 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2319 : Poly :=
[
  term ((-2586852 : Rat) / 10675) [(9, 1), (13, 1)]
]

/-- Partial product 2319 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2319 : Poly :=
[
  term ((-5173704 : Rat) / 10675) [(8, 1), (9, 1), (13, 1)],
  term ((2586852 : Rat) / 10675) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2319 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2319_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2319
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2319 := by
  native_decide

/-- Coefficient term 2320 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2320 : Poly :=
[
  term ((7484 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 2320 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2320 : Poly :=
[
  term ((14968 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-7484 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2320 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2320_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2320
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2320 := by
  native_decide

/-- Coefficient term 2321 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2321 : Poly :=
[
  term ((576 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2321 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2321 : Poly :=
[
  term ((1152 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2321 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2321_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2321
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2321 := by
  native_decide

/-- Coefficient term 2322 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2322 : Poly :=
[
  term ((-433 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2322 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2322 : Poly :=
[
  term ((-866 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((433 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2322 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2322_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2322
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2322 := by
  native_decide

/-- Coefficient term 2323 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2323 : Poly :=
[
  term ((-24791 : Rat) / 4200) [(9, 1), (15, 1)]
]

/-- Partial product 2323 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2323 : Poly :=
[
  term ((-24791 : Rat) / 2100) [(8, 1), (9, 1), (15, 1)],
  term ((24791 : Rat) / 4200) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2323 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2323_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2323
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2323 := by
  native_decide

/-- Coefficient term 2324 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2324 : Poly :=
[
  term ((1137 : Rat) / 280) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2324 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2324 : Poly :=
[
  term ((1137 : Rat) / 140) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 280) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2324 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2324_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2324
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2324 := by
  native_decide

/-- Coefficient term 2325 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2325 : Poly :=
[
  term ((1732 : Rat) / 5) [(9, 2)]
]

/-- Partial product 2325 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2325 : Poly :=
[
  term ((3464 : Rat) / 5) [(8, 1), (9, 2)],
  term ((-1732 : Rat) / 5) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2325 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2325_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2325
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2325 := by
  native_decide

/-- Coefficient term 2326 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2326 : Poly :=
[
  term ((45861024 : Rat) / 53375) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2326 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2326 : Poly :=
[
  term ((91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2326 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2326_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2326
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2326 := by
  native_decide

/-- Coefficient term 2327 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2327 : Poly :=
[
  term ((-36864 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2327 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2327 : Poly :=
[
  term ((-73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2327 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2327_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2327
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2327 := by
  native_decide

/-- Coefficient term 2328 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2328 : Poly :=
[
  term ((12288 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2328 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2328 : Poly :=
[
  term ((24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2328 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2328_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2328
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2328 := by
  native_decide

/-- Coefficient term 2329 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2329 : Poly :=
[
  term ((-9984 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2329 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2329 : Poly :=
[
  term ((-19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2329 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2329_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2329
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2329 := by
  native_decide

/-- Coefficient term 2330 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2330 : Poly :=
[
  term ((2096 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2330 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2330 : Poly :=
[
  term ((4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2330 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2330_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2330
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2330 := by
  native_decide

/-- Coefficient term 2331 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2331 : Poly :=
[
  term ((-1392 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2331 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2331 : Poly :=
[
  term ((-2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2331 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2331_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2331
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2331 := by
  native_decide

/-- Coefficient term 2332 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2332 : Poly :=
[
  term ((45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 2332 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2332 : Poly :=
[
  term ((91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2332 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2332_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2332
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2332 := by
  native_decide

/-- Coefficient term 2333 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2333 : Poly :=
[
  term ((-36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2333 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2333 : Poly :=
[
  term ((-73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2333 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2333_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2333
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2333 := by
  native_decide

/-- Coefficient term 2334 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2334 : Poly :=
[
  term ((12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2334 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2334 : Poly :=
[
  term ((24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2334 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2334_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2334
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2334 := by
  native_decide

/-- Coefficient term 2335 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2335 : Poly :=
[
  term ((-9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2335 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2335 : Poly :=
[
  term ((-19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2335 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2335_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2335
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2335 := by
  native_decide

/-- Coefficient term 2336 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2336 : Poly :=
[
  term ((2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 2336 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2336 : Poly :=
[
  term ((4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2336 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2336_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2336
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2336 := by
  native_decide

/-- Coefficient term 2337 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2337 : Poly :=
[
  term ((-1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2337 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2337 : Poly :=
[
  term ((-2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2337 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2337_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2337
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2337 := by
  native_decide

/-- Coefficient term 2338 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2338 : Poly :=
[
  term ((1732 : Rat) / 5) [(9, 2), (12, 1)]
]

/-- Partial product 2338 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2338 : Poly :=
[
  term ((3464 : Rat) / 5) [(8, 1), (9, 2), (12, 1)],
  term ((-1732 : Rat) / 5) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2338 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2338_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2338
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2338 := by
  native_decide

/-- Coefficient term 2339 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2339 : Poly :=
[
  term ((-1568 : Rat) / 5) [(9, 2), (12, 1), (14, 1)]
]

/-- Partial product 2339 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2339 : Poly :=
[
  term ((-3136 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((1568 : Rat) / 5) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2339 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2339_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2339
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2339 := by
  native_decide

/-- Coefficient term 2340 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2340 : Poly :=
[
  term ((2 : Rat) / 5) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 2340 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2340 : Poly :=
[
  term ((4 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2340 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2340_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2340
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2340 := by
  native_decide

/-- Coefficient term 2341 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2341 : Poly :=
[
  term ((-1568 : Rat) / 5) [(9, 2), (14, 1)]
]

/-- Partial product 2341 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2341 : Poly :=
[
  term ((-3136 : Rat) / 5) [(8, 1), (9, 2), (14, 1)],
  term ((1568 : Rat) / 5) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2341 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2341_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2341
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2341 := by
  native_decide

/-- Coefficient term 2342 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2342 : Poly :=
[
  term ((2 : Rat) / 5) [(9, 2), (16, 1)]
]

/-- Partial product 2342 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2342 : Poly :=
[
  term ((4 : Rat) / 5) [(8, 1), (9, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2342 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2342_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2342
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2342 := by
  native_decide

/-- Coefficient term 2343 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2343 : Poly :=
[
  term ((-462 : Rat) / 5) [(10, 1)]
]

/-- Partial product 2343 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2343 : Poly :=
[
  term ((-924 : Rat) / 5) [(8, 1), (10, 1)],
  term ((462 : Rat) / 5) [(10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2343 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2343_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2343
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2343 := by
  native_decide

/-- Coefficient term 2344 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2344 : Poly :=
[
  term ((4766816 : Rat) / 53375) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2344 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2344 : Poly :=
[
  term ((9533632 : Rat) / 53375) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4766816 : Rat) / 53375) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2344 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2344_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2344
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2344 := by
  native_decide

/-- Coefficient term 2345 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2345 : Poly :=
[
  term ((-768 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2345 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2345 : Poly :=
[
  term ((-1536 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2345 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2345_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2345
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2345 := by
  native_decide

/-- Coefficient term 2346 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2346 : Poly :=
[
  term ((256 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2346 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2346 : Poly :=
[
  term ((512 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2346 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2346_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2346
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2346 := by
  native_decide

/-- Coefficient term 2347 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2347 : Poly :=
[
  term ((-208 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2347 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2347 : Poly :=
[
  term ((-416 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2347 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2347_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2347
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2347 := by
  native_decide

/-- Coefficient term 2348 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2348 : Poly :=
[
  term ((-17831 : Rat) / 210) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2348 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2348 : Poly :=
[
  term ((-17831 : Rat) / 105) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((17831 : Rat) / 210) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2348 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2348_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2348
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2348 := by
  native_decide

/-- Coefficient term 2349 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2349 : Poly :=
[
  term ((613 : Rat) / 70) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2349 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2349 : Poly :=
[
  term ((613 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-613 : Rat) / 70) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2349 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2349_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2349
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2349 := by
  native_decide

/-- Coefficient term 2350 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2350 : Poly :=
[
  term ((-31352 : Rat) / 175) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 2350 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2350 : Poly :=
[
  term ((-62704 : Rat) / 175) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((31352 : Rat) / 175) [(10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2350 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2350_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2350
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2350 := by
  native_decide

/-- Coefficient term 2351 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2351 : Poly :=
[
  term ((1536 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2351 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2351 : Poly :=
[
  term ((3072 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2351 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2351_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2351
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2351 := by
  native_decide

/-- Coefficient term 2352 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2352 : Poly :=
[
  term ((-512 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2352 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2352 : Poly :=
[
  term ((-1024 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2352 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2352_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2352
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2352 := by
  native_decide

/-- Coefficient term 2353 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2353 : Poly :=
[
  term ((416 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2353 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2353 : Poly :=
[
  term ((832 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2353 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2353_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2353
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2353 := by
  native_decide

/-- Coefficient term 2354 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2354 : Poly :=
[
  term ((-9209 : Rat) / 84) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 2354 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2354 : Poly :=
[
  term ((-9209 : Rat) / 42) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((9209 : Rat) / 84) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2354 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2354_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2354
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2354 := by
  native_decide

/-- Coefficient term 2355 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2355 : Poly :=
[
  term ((379 : Rat) / 28) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2355 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2355 : Poly :=
[
  term ((379 : Rat) / 14) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 28) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2355 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2355_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2355
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2355 := by
  native_decide

/-- Coefficient term 2356 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2356 : Poly :=
[
  term ((616 : Rat) / 5) [(10, 1), (12, 1)]
]

/-- Partial product 2356 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2356 : Poly :=
[
  term ((1232 : Rat) / 5) [(8, 1), (10, 1), (12, 1)],
  term ((-616 : Rat) / 5) [(10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2356 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2356_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2356
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2356 := by
  native_decide

/-- Coefficient term 2357 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2357 : Poly :=
[
  term ((-576 : Rat) / 5) [(10, 1), (12, 1), (14, 1)]
]

/-- Partial product 2357 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2357 : Poly :=
[
  term ((-1152 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2357 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2357_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2357
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2357 := by
  native_decide

/-- Coefficient term 2358 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2358 : Poly :=
[
  term ((-4229 : Rat) / 84) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 2358 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2358 : Poly :=
[
  term ((-4229 : Rat) / 42) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((4229 : Rat) / 84) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2358 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2358_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2358
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2358 := by
  native_decide

/-- Coefficient term 2359 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2359 : Poly :=
[
  term ((731 : Rat) / 140) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2359 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2359 : Poly :=
[
  term ((731 : Rat) / 70) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-731 : Rat) / 140) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2359 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2359_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2359
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2359 := by
  native_decide

/-- Coefficient term 2360 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2360 : Poly :=
[
  term ((531436 : Rat) / 10675) [(10, 1), (13, 2)]
]

/-- Partial product 2360 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2360 : Poly :=
[
  term ((1062872 : Rat) / 10675) [(8, 1), (10, 1), (13, 2)],
  term ((-531436 : Rat) / 10675) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2360 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2360_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2360
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2360 := by
  native_decide

/-- Coefficient term 2361 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2361 : Poly :=
[
  term ((-2112 : Rat) / 35) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 2361 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2361 : Poly :=
[
  term ((-4224 : Rat) / 35) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((2112 : Rat) / 35) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2361 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2361_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2361
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2361 := by
  native_decide

/-- Coefficient term 2362 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2362 : Poly :=
[
  term ((704 : Rat) / 35) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2362 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2362 : Poly :=
[
  term ((1408 : Rat) / 35) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-704 : Rat) / 35) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2362 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2362_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2362
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2362 := by
  native_decide

/-- Coefficient term 2363 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2363 : Poly :=
[
  term ((-572 : Rat) / 35) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 2363 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2363 : Poly :=
[
  term ((-1144 : Rat) / 35) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((572 : Rat) / 35) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2363 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2363_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2363
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2363 := by
  native_decide

/-- Coefficient term 2364 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2364 : Poly :=
[
  term ((432 : Rat) / 5) [(10, 1), (14, 1)]
]

/-- Partial product 2364 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2364 : Poly :=
[
  term ((864 : Rat) / 5) [(8, 1), (10, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2364 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2364_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2364
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2364 := by
  native_decide

/-- Coefficient term 2365 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2365 : Poly :=
[
  term ((1352 : Rat) / 21) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 2365 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2365 : Poly :=
[
  term ((2704 : Rat) / 21) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1352 : Rat) / 21) [(10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2365 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2365_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2365
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2365 := by
  native_decide

/-- Coefficient term 2366 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2366 : Poly :=
[
  term ((-248 : Rat) / 35) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2366 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2366 : Poly :=
[
  term ((-496 : Rat) / 35) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((248 : Rat) / 35) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2366 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2366_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2366
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2366 := by
  native_decide

/-- Coefficient term 2367 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2367 : Poly :=
[
  term ((-470936 : Rat) / 53375) [(10, 2), (13, 2)]
]

/-- Partial product 2367 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2367 : Poly :=
[
  term ((-941872 : Rat) / 53375) [(8, 1), (10, 2), (13, 2)],
  term ((470936 : Rat) / 53375) [(10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2367 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2367_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2367
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2367 := by
  native_decide

/-- Coefficient term 2368 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2368 : Poly :=
[
  term ((384 : Rat) / 35) [(10, 2), (13, 2), (14, 1)]
]

/-- Partial product 2368 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2368 : Poly :=
[
  term ((768 : Rat) / 35) [(8, 1), (10, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 35) [(10, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2368 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2368_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2368
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2368 := by
  native_decide

/-- Coefficient term 2369 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2369 : Poly :=
[
  term ((-128 : Rat) / 35) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2369 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2369 : Poly :=
[
  term ((-256 : Rat) / 35) [(8, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 35) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2369 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2369_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2369
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2369 := by
  native_decide

/-- Coefficient term 2370 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2370 : Poly :=
[
  term ((104 : Rat) / 35) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 2370 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2370 : Poly :=
[
  term ((208 : Rat) / 35) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-104 : Rat) / 35) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2370 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2370_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2370
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2370 := by
  native_decide

/-- Coefficient term 2371 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2371 : Poly :=
[
  term ((-1979504 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2371 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2371 : Poly :=
[
  term ((-3959008 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((1979504 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2371 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2371_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2371
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2371 := by
  native_decide

/-- Coefficient term 2372 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2372 : Poly :=
[
  term ((1536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2372 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2372 : Poly :=
[
  term ((3072 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2372 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2372_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2372
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2372 := by
  native_decide

/-- Coefficient term 2373 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2373 : Poly :=
[
  term ((-512 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2373 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2373 : Poly :=
[
  term ((-1024 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2373 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2373_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2373
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2373 := by
  native_decide

/-- Coefficient term 2374 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2374 : Poly :=
[
  term ((416 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2374 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2374 : Poly :=
[
  term ((832 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2374 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2374_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2374
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2374 := by
  native_decide

/-- Coefficient term 2375 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2375 : Poly :=
[
  term ((-5279 : Rat) / 105) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2375 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2375 : Poly :=
[
  term ((-10558 : Rat) / 105) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((5279 : Rat) / 105) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2375 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2375_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2375
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2375 := by
  native_decide

/-- Coefficient term 2376 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2376 : Poly :=
[
  term ((41 : Rat) / 7) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2376 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2376 : Poly :=
[
  term ((82 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 7) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2376 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2376_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2376
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2376 := by
  native_decide

/-- Coefficient term 2377 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2377 : Poly :=
[
  term ((21008464 : Rat) / 53375) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 2377 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2377 : Poly :=
[
  term ((42016928 : Rat) / 53375) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-21008464 : Rat) / 53375) [(11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2377 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2377_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2377
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2377 := by
  native_decide

/-- Coefficient term 2378 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2378 : Poly :=
[
  term ((-16896 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2378 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2378 : Poly :=
[
  term ((-33792 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((16896 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2378 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2378_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2378
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2378 := by
  native_decide

/-- Coefficient term 2379 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2379 : Poly :=
[
  term ((5632 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2379 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2379 : Poly :=
[
  term ((11264 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5632 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2379 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2379_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2379
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2379 := by
  native_decide

/-- Coefficient term 2380 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2380 : Poly :=
[
  term ((-4576 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 2380 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2380 : Poly :=
[
  term ((-9152 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((4576 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2380 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2380_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2380
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2380 := by
  native_decide

/-- Coefficient term 2381 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2381 : Poly :=
[
  term ((53201 : Rat) / 210) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 2381 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2381 : Poly :=
[
  term ((53201 : Rat) / 105) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-53201 : Rat) / 210) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2381 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2381_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2381
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2381 := by
  native_decide

/-- Coefficient term 2382 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2382 : Poly :=
[
  term ((-2179 : Rat) / 70) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2382 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2382 : Poly :=
[
  term ((-2179 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2179 : Rat) / 70) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2382 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2382_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2382
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2382 := by
  native_decide

/-- Coefficient term 2383 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2383 : Poly :=
[
  term ((-2028838 : Rat) / 7625) [(11, 1), (13, 1)]
]

/-- Partial product 2383 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2383 : Poly :=
[
  term ((-4057676 : Rat) / 7625) [(8, 1), (11, 1), (13, 1)],
  term ((2028838 : Rat) / 7625) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2383 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2383_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2383
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2383 := by
  native_decide

/-- Coefficient term 2384 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2384 : Poly :=
[
  term ((1632 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2384 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2384 : Poly :=
[
  term ((3264 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1632 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2384 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2384_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2384
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2384 := by
  native_decide

/-- Coefficient term 2385 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2385 : Poly :=
[
  term ((-544 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2385 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2385 : Poly :=
[
  term ((-1088 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((544 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2385 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2385_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2385
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2385 := by
  native_decide

/-- Coefficient term 2386 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2386 : Poly :=
[
  term ((442 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2386 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2386 : Poly :=
[
  term ((884 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-442 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2386 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2386_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2386
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2386 := by
  native_decide

/-- Coefficient term 2387 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2387 : Poly :=
[
  term ((2053 : Rat) / 210) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 2387 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2387 : Poly :=
[
  term ((2053 : Rat) / 105) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2053 : Rat) / 210) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2387 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2387_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2387
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2387 := by
  native_decide

/-- Coefficient term 2388 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2388 : Poly :=
[
  term ((-19 : Rat) / 14) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2388 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2388 : Poly :=
[
  term ((-19 : Rat) / 7) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((19 : Rat) / 14) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2388 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2388_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2388
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2388 := by
  native_decide

/-- Coefficient term 2389 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2389 : Poly :=
[
  term ((77648 : Rat) / 2135) [(11, 1), (13, 3)]
]

/-- Partial product 2389 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2389 : Poly :=
[
  term ((155296 : Rat) / 2135) [(8, 1), (11, 1), (13, 3)],
  term ((-77648 : Rat) / 2135) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2389 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2389_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2389
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2389 := by
  native_decide

/-- Coefficient term 2390 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2390 : Poly :=
[
  term ((-1536 : Rat) / 35) [(11, 1), (13, 3), (14, 1)]
]

/-- Partial product 2390 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2390 : Poly :=
[
  term ((-3072 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((1536 : Rat) / 35) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2390 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2390_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2390
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2390 := by
  native_decide

/-- Coefficient term 2391 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2391 : Poly :=
[
  term ((512 : Rat) / 35) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 2391 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2391 : Poly :=
[
  term ((1024 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-512 : Rat) / 35) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2391 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2391_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2391
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2391 := by
  native_decide

/-- Coefficient term 2392 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2392 : Poly :=
[
  term ((-416 : Rat) / 35) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 2392 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2392 : Poly :=
[
  term ((-832 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((416 : Rat) / 35) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2392 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2392_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2392
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2392 := by
  native_decide

/-- Coefficient term 2393 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2393 : Poly :=
[
  term ((-1903 : Rat) / 24) [(11, 1), (15, 1)]
]

/-- Partial product 2393 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2393 : Poly :=
[
  term ((-1903 : Rat) / 12) [(8, 1), (11, 1), (15, 1)],
  term ((1903 : Rat) / 24) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2393 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2393_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2393
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2393 := by
  native_decide

/-- Coefficient term 2394 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2394 : Poly :=
[
  term ((433 : Rat) / 40) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2394 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2394 : Poly :=
[
  term ((433 : Rat) / 20) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-433 : Rat) / 40) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2394 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2394_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2394
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2394 := by
  native_decide

/-- Coefficient term 2395 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2395 : Poly :=
[
  term ((-1352 : Rat) / 21) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 2395 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2395 : Poly :=
[
  term ((-2704 : Rat) / 21) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((1352 : Rat) / 21) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2395 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2395_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2395
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2395 := by
  native_decide

/-- Coefficient term 2396 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2396 : Poly :=
[
  term ((248 : Rat) / 35) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2396 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2396 : Poly :=
[
  term ((496 : Rat) / 35) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-248 : Rat) / 35) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2396 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2396_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2396
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2396 := by
  native_decide

/-- Coefficient term 2397 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2397 : Poly :=
[
  term ((470936 : Rat) / 53375) [(11, 2), (13, 2)]
]

/-- Partial product 2397 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2397 : Poly :=
[
  term ((941872 : Rat) / 53375) [(8, 1), (11, 2), (13, 2)],
  term ((-470936 : Rat) / 53375) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2397 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2397_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2397
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2397 := by
  native_decide

/-- Coefficient term 2398 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2398 : Poly :=
[
  term ((-384 : Rat) / 35) [(11, 2), (13, 2), (14, 1)]
]

/-- Partial product 2398 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2398 : Poly :=
[
  term ((-768 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((384 : Rat) / 35) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2398 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2398_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2398
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2398 := by
  native_decide

/-- Coefficient term 2399 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2399 : Poly :=
[
  term ((128 : Rat) / 35) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2399 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2399 : Poly :=
[
  term ((256 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 35) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2399 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2399_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2399
        rs_R003_ueqv_R003YY_generator_19_2300_2399 =
      rs_R003_ueqv_R003YY_partial_19_2399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_2300_2399 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_2300,
  rs_R003_ueqv_R003YY_partial_19_2301,
  rs_R003_ueqv_R003YY_partial_19_2302,
  rs_R003_ueqv_R003YY_partial_19_2303,
  rs_R003_ueqv_R003YY_partial_19_2304,
  rs_R003_ueqv_R003YY_partial_19_2305,
  rs_R003_ueqv_R003YY_partial_19_2306,
  rs_R003_ueqv_R003YY_partial_19_2307,
  rs_R003_ueqv_R003YY_partial_19_2308,
  rs_R003_ueqv_R003YY_partial_19_2309,
  rs_R003_ueqv_R003YY_partial_19_2310,
  rs_R003_ueqv_R003YY_partial_19_2311,
  rs_R003_ueqv_R003YY_partial_19_2312,
  rs_R003_ueqv_R003YY_partial_19_2313,
  rs_R003_ueqv_R003YY_partial_19_2314,
  rs_R003_ueqv_R003YY_partial_19_2315,
  rs_R003_ueqv_R003YY_partial_19_2316,
  rs_R003_ueqv_R003YY_partial_19_2317,
  rs_R003_ueqv_R003YY_partial_19_2318,
  rs_R003_ueqv_R003YY_partial_19_2319,
  rs_R003_ueqv_R003YY_partial_19_2320,
  rs_R003_ueqv_R003YY_partial_19_2321,
  rs_R003_ueqv_R003YY_partial_19_2322,
  rs_R003_ueqv_R003YY_partial_19_2323,
  rs_R003_ueqv_R003YY_partial_19_2324,
  rs_R003_ueqv_R003YY_partial_19_2325,
  rs_R003_ueqv_R003YY_partial_19_2326,
  rs_R003_ueqv_R003YY_partial_19_2327,
  rs_R003_ueqv_R003YY_partial_19_2328,
  rs_R003_ueqv_R003YY_partial_19_2329,
  rs_R003_ueqv_R003YY_partial_19_2330,
  rs_R003_ueqv_R003YY_partial_19_2331,
  rs_R003_ueqv_R003YY_partial_19_2332,
  rs_R003_ueqv_R003YY_partial_19_2333,
  rs_R003_ueqv_R003YY_partial_19_2334,
  rs_R003_ueqv_R003YY_partial_19_2335,
  rs_R003_ueqv_R003YY_partial_19_2336,
  rs_R003_ueqv_R003YY_partial_19_2337,
  rs_R003_ueqv_R003YY_partial_19_2338,
  rs_R003_ueqv_R003YY_partial_19_2339,
  rs_R003_ueqv_R003YY_partial_19_2340,
  rs_R003_ueqv_R003YY_partial_19_2341,
  rs_R003_ueqv_R003YY_partial_19_2342,
  rs_R003_ueqv_R003YY_partial_19_2343,
  rs_R003_ueqv_R003YY_partial_19_2344,
  rs_R003_ueqv_R003YY_partial_19_2345,
  rs_R003_ueqv_R003YY_partial_19_2346,
  rs_R003_ueqv_R003YY_partial_19_2347,
  rs_R003_ueqv_R003YY_partial_19_2348,
  rs_R003_ueqv_R003YY_partial_19_2349,
  rs_R003_ueqv_R003YY_partial_19_2350,
  rs_R003_ueqv_R003YY_partial_19_2351,
  rs_R003_ueqv_R003YY_partial_19_2352,
  rs_R003_ueqv_R003YY_partial_19_2353,
  rs_R003_ueqv_R003YY_partial_19_2354,
  rs_R003_ueqv_R003YY_partial_19_2355,
  rs_R003_ueqv_R003YY_partial_19_2356,
  rs_R003_ueqv_R003YY_partial_19_2357,
  rs_R003_ueqv_R003YY_partial_19_2358,
  rs_R003_ueqv_R003YY_partial_19_2359,
  rs_R003_ueqv_R003YY_partial_19_2360,
  rs_R003_ueqv_R003YY_partial_19_2361,
  rs_R003_ueqv_R003YY_partial_19_2362,
  rs_R003_ueqv_R003YY_partial_19_2363,
  rs_R003_ueqv_R003YY_partial_19_2364,
  rs_R003_ueqv_R003YY_partial_19_2365,
  rs_R003_ueqv_R003YY_partial_19_2366,
  rs_R003_ueqv_R003YY_partial_19_2367,
  rs_R003_ueqv_R003YY_partial_19_2368,
  rs_R003_ueqv_R003YY_partial_19_2369,
  rs_R003_ueqv_R003YY_partial_19_2370,
  rs_R003_ueqv_R003YY_partial_19_2371,
  rs_R003_ueqv_R003YY_partial_19_2372,
  rs_R003_ueqv_R003YY_partial_19_2373,
  rs_R003_ueqv_R003YY_partial_19_2374,
  rs_R003_ueqv_R003YY_partial_19_2375,
  rs_R003_ueqv_R003YY_partial_19_2376,
  rs_R003_ueqv_R003YY_partial_19_2377,
  rs_R003_ueqv_R003YY_partial_19_2378,
  rs_R003_ueqv_R003YY_partial_19_2379,
  rs_R003_ueqv_R003YY_partial_19_2380,
  rs_R003_ueqv_R003YY_partial_19_2381,
  rs_R003_ueqv_R003YY_partial_19_2382,
  rs_R003_ueqv_R003YY_partial_19_2383,
  rs_R003_ueqv_R003YY_partial_19_2384,
  rs_R003_ueqv_R003YY_partial_19_2385,
  rs_R003_ueqv_R003YY_partial_19_2386,
  rs_R003_ueqv_R003YY_partial_19_2387,
  rs_R003_ueqv_R003YY_partial_19_2388,
  rs_R003_ueqv_R003YY_partial_19_2389,
  rs_R003_ueqv_R003YY_partial_19_2390,
  rs_R003_ueqv_R003YY_partial_19_2391,
  rs_R003_ueqv_R003YY_partial_19_2392,
  rs_R003_ueqv_R003YY_partial_19_2393,
  rs_R003_ueqv_R003YY_partial_19_2394,
  rs_R003_ueqv_R003YY_partial_19_2395,
  rs_R003_ueqv_R003YY_partial_19_2396,
  rs_R003_ueqv_R003YY_partial_19_2397,
  rs_R003_ueqv_R003YY_partial_19_2398,
  rs_R003_ueqv_R003YY_partial_19_2399
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_2300_2399 : Poly :=
[
  term ((-234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-234 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-230248 : Rat) / 875) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((9032 : Rat) / 35) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-153621 : Rat) / 700) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((3321 : Rat) / 140) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11827408 : Rat) / 53375) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((9216 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2496 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-13873 : Rat) / 105) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((523 : Rat) / 35) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5173704 : Rat) / 10675) [(8, 1), (9, 1), (13, 1)],
  term ((14968 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-866 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24791 : Rat) / 2100) [(8, 1), (9, 1), (15, 1)],
  term ((1137 : Rat) / 140) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3464 : Rat) / 5) [(8, 1), (9, 2)],
  term ((91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3464 : Rat) / 5) [(8, 1), (9, 2), (12, 1)],
  term ((-3136 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-3136 : Rat) / 5) [(8, 1), (9, 2), (14, 1)],
  term ((4 : Rat) / 5) [(8, 1), (9, 2), (16, 1)],
  term ((-924 : Rat) / 5) [(8, 1), (10, 1)],
  term ((9533632 : Rat) / 53375) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17831 : Rat) / 105) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((613 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62704 : Rat) / 175) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((3072 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 42) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((379 : Rat) / 14) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(8, 1), (10, 1), (12, 1)],
  term ((-1152 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-4229 : Rat) / 42) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((731 : Rat) / 70) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1062872 : Rat) / 10675) [(8, 1), (10, 1), (13, 2)],
  term ((-4224 : Rat) / 35) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (10, 1), (14, 1)],
  term ((2704 : Rat) / 21) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-496 : Rat) / 35) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-941872 : Rat) / 53375) [(8, 1), (10, 2), (13, 2)],
  term ((768 : Rat) / 35) [(8, 1), (10, 2), (13, 2), (14, 1)],
  term ((-256 : Rat) / 35) [(8, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-3959008 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((3072 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10558 : Rat) / 105) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((82 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42016928 : Rat) / 53375) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-33792 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((11264 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-9152 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((53201 : Rat) / 105) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2179 : Rat) / 35) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4057676 : Rat) / 7625) [(8, 1), (11, 1), (13, 1)],
  term ((3264 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1088 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((884 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2053 : Rat) / 105) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-19 : Rat) / 7) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((155296 : Rat) / 2135) [(8, 1), (11, 1), (13, 3)],
  term ((-3072 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((1024 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1903 : Rat) / 12) [(8, 1), (11, 1), (15, 1)],
  term ((433 : Rat) / 20) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2704 : Rat) / 21) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((496 : Rat) / 35) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((941872 : Rat) / 53375) [(8, 1), (11, 2), (13, 2)],
  term ((-768 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((256 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((117 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1718352 : Rat) / 10675) [(9, 1), (11, 2), (13, 1)],
  term ((-6912 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1437 : Rat) / 35) [(9, 1), (11, 2), (15, 1)],
  term ((117 : Rat) / 35) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((115124 : Rat) / 875) [(9, 1), (12, 1), (13, 1)],
  term ((-4516 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-52 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((153621 : Rat) / 1400) [(9, 1), (12, 1), (15, 1)],
  term ((-3321 : Rat) / 280) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5913704 : Rat) / 53375) [(9, 1), (12, 2), (13, 1)],
  term ((-4608 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((13873 : Rat) / 210) [(9, 1), (12, 2), (15, 1)],
  term ((-523 : Rat) / 70) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2586852 : Rat) / 10675) [(9, 1), (13, 1)],
  term ((-7484 : Rat) / 35) [(9, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((433 : Rat) / 35) [(9, 1), (13, 1), (16, 1)],
  term ((24791 : Rat) / 4200) [(9, 1), (15, 1)],
  term ((-1137 : Rat) / 280) [(9, 1), (15, 1), (16, 1)],
  term ((-1732 : Rat) / 5) [(9, 2)],
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)],
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)],
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1732 : Rat) / 5) [(9, 2), (12, 1)],
  term ((1568 : Rat) / 5) [(9, 2), (12, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(9, 2), (12, 1), (16, 1)],
  term ((1568 : Rat) / 5) [(9, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(9, 2), (16, 1)],
  term ((462 : Rat) / 5) [(10, 1)],
  term ((-4766816 : Rat) / 53375) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((768 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((17831 : Rat) / 210) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-613 : Rat) / 70) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((31352 : Rat) / 175) [(10, 1), (11, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((9209 : Rat) / 84) [(10, 1), (11, 1), (15, 1)],
  term ((-379 : Rat) / 28) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-616 : Rat) / 5) [(10, 1), (12, 1)],
  term ((576 : Rat) / 5) [(10, 1), (12, 1), (14, 1)],
  term ((4229 : Rat) / 84) [(10, 1), (13, 1), (15, 1)],
  term ((-731 : Rat) / 140) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-531436 : Rat) / 10675) [(10, 1), (13, 2)],
  term ((2112 : Rat) / 35) [(10, 1), (13, 2), (14, 1)],
  term ((-704 : Rat) / 35) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((572 : Rat) / 35) [(10, 1), (13, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(10, 1), (14, 1)],
  term ((-1352 : Rat) / 21) [(10, 2), (13, 1), (15, 1)],
  term ((248 : Rat) / 35) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((470936 : Rat) / 53375) [(10, 2), (13, 2)],
  term ((-384 : Rat) / 35) [(10, 2), (13, 2), (14, 1)],
  term ((128 : Rat) / 35) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 35) [(10, 2), (13, 2), (16, 1)],
  term ((1979504 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)],
  term ((-1536 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5279 : Rat) / 105) [(11, 1), (12, 1), (15, 1)],
  term ((-41 : Rat) / 7) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21008464 : Rat) / 53375) [(11, 1), (12, 2), (13, 1)],
  term ((16896 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-5632 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4576 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-53201 : Rat) / 210) [(11, 1), (12, 2), (15, 1)],
  term ((2179 : Rat) / 70) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2028838 : Rat) / 7625) [(11, 1), (13, 1)],
  term ((-1632 : Rat) / 5) [(11, 1), (13, 1), (14, 1)],
  term ((544 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-442 : Rat) / 5) [(11, 1), (13, 1), (16, 1)],
  term ((-2053 : Rat) / 210) [(11, 1), (13, 2), (15, 1)],
  term ((19 : Rat) / 14) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-77648 : Rat) / 2135) [(11, 1), (13, 3)],
  term ((1536 : Rat) / 35) [(11, 1), (13, 3), (14, 1)],
  term ((-512 : Rat) / 35) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(11, 1), (13, 3), (16, 1)],
  term ((1903 : Rat) / 24) [(11, 1), (15, 1)],
  term ((-433 : Rat) / 40) [(11, 1), (15, 1), (16, 1)],
  term ((1352 : Rat) / 21) [(11, 2), (13, 1), (15, 1)],
  term ((-248 : Rat) / 35) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-470936 : Rat) / 53375) [(11, 2), (13, 2)],
  term ((384 : Rat) / 35) [(11, 2), (13, 2), (14, 1)],
  term ((-128 : Rat) / 35) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 2300 through 2399. -/
theorem rs_R003_ueqv_R003YY_block_19_2300_2399_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_2300_2399
      rs_R003_ueqv_R003YY_block_19_2300_2399 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
