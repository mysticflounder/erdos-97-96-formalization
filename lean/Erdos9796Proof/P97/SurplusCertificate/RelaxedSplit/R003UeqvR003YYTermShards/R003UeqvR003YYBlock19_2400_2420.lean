/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:2400-2420

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_2400_2420 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 2400 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2400 : Poly :=
[
  term ((-104 : Rat) / 35) [(11, 2), (13, 2), (16, 1)]
]

/-- Partial product 2400 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2400 : Poly :=
[
  term ((-208 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((104 : Rat) / 35) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2400 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2400_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2400
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2400 := by
  native_decide

/-- Coefficient term 2401 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2401 : Poly :=
[
  term ((-1391 : Rat) / 10) [(12, 1)]
]

/-- Partial product 2401 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2401 : Poly :=
[
  term ((-1391 : Rat) / 5) [(8, 1), (12, 1)],
  term ((1391 : Rat) / 10) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2401 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2401_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2401
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2401 := by
  native_decide

/-- Coefficient term 2402 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2402 : Poly :=
[
  term ((41173 : Rat) / 2100) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2402 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2402 : Poly :=
[
  term ((41173 : Rat) / 1050) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-41173 : Rat) / 2100) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2402 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2402_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2402
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2402 := by
  native_decide

/-- Coefficient term 2403 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2403 : Poly :=
[
  term ((-603 : Rat) / 140) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2403 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2403 : Poly :=
[
  term ((-603 : Rat) / 70) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((603 : Rat) / 140) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2403 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2403_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2403
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2403 := by
  native_decide

/-- Coefficient term 2404 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2404 : Poly :=
[
  term ((5156804 : Rat) / 53375) [(12, 1), (13, 2)]
]

/-- Partial product 2404 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2404 : Poly :=
[
  term ((10313608 : Rat) / 53375) [(8, 1), (12, 1), (13, 2)],
  term ((-5156804 : Rat) / 53375) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2404 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2404_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2404
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2404 := by
  native_decide

/-- Coefficient term 2405 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2405 : Poly :=
[
  term ((-4224 : Rat) / 35) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2405 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2405 : Poly :=
[
  term ((-8448 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((4224 : Rat) / 35) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2405 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2405_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2405
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2405 := by
  native_decide

/-- Coefficient term 2406 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2406 : Poly :=
[
  term ((1408 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2406 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2406 : Poly :=
[
  term ((2816 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2406 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2406_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2406
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2406 := by
  native_decide

/-- Coefficient term 2407 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2407 : Poly :=
[
  term ((-1144 : Rat) / 35) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 2407 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2407 : Poly :=
[
  term ((-2288 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((1144 : Rat) / 35) [(12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2407 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2407_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2407
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2407 := by
  native_decide

/-- Coefficient term 2408 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2408 : Poly :=
[
  term (136 : Rat) [(12, 1), (14, 1)]
]

/-- Partial product 2408 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2408 : Poly :=
[
  term (272 : Rat) [(8, 1), (12, 1), (14, 1)],
  term (-136 : Rat) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2408 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2408_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2408
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2408 := by
  native_decide

/-- Coefficient term 2409 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2409 : Poly :=
[
  term ((7 : Rat) / 10) [(12, 1), (16, 1)]
]

/-- Partial product 2409 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2409 : Poly :=
[
  term ((7 : Rat) / 5) [(8, 1), (12, 1), (16, 1)],
  term ((-7 : Rat) / 10) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2409 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2409_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2409
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2409 := by
  native_decide

/-- Coefficient term 2410 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2410 : Poly :=
[
  term ((908 : Rat) / 5) [(12, 2)]
]

/-- Partial product 2410 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2410 : Poly :=
[
  term ((1816 : Rat) / 5) [(8, 1), (12, 2)],
  term ((-908 : Rat) / 5) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2410 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2410_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2410
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2410 := by
  native_decide

/-- Coefficient term 2411 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2411 : Poly :=
[
  term ((-818 : Rat) / 5) [(12, 2), (14, 1)]
]

/-- Partial product 2411 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2411 : Poly :=
[
  term ((-1636 : Rat) / 5) [(8, 1), (12, 2), (14, 1)],
  term ((818 : Rat) / 5) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2411 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2411_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2411
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2411 := by
  native_decide

/-- Coefficient term 2412 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2412 : Poly :=
[
  term ((12 : Rat) / 5) [(12, 2), (16, 1)]
]

/-- Partial product 2412 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2412 : Poly :=
[
  term ((24 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2412 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2412_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2412
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2412 := by
  native_decide

/-- Coefficient term 2413 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2413 : Poly :=
[
  term ((-59111 : Rat) / 2800) [(13, 1), (15, 1)]
]

/-- Partial product 2413 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2413 : Poly :=
[
  term ((-59111 : Rat) / 1400) [(8, 1), (13, 1), (15, 1)],
  term ((59111 : Rat) / 2800) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2413 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2413_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2413
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2413 := by
  native_decide

/-- Coefficient term 2414 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2414 : Poly :=
[
  term ((467 : Rat) / 560) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2414 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2414 : Poly :=
[
  term ((467 : Rat) / 280) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-467 : Rat) / 560) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2414 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2414_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2414
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2414 := by
  native_decide

/-- Coefficient term 2415 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2415 : Poly :=
[
  term ((610382 : Rat) / 10675) [(13, 2)]
]

/-- Partial product 2415 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2415 : Poly :=
[
  term ((1220764 : Rat) / 10675) [(8, 1), (13, 2)],
  term ((-610382 : Rat) / 10675) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2415 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2415_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2415
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2415 := by
  native_decide

/-- Coefficient term 2416 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2416 : Poly :=
[
  term ((-1874 : Rat) / 35) [(13, 2), (14, 1)]
]

/-- Partial product 2416 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2416 : Poly :=
[
  term ((-3748 : Rat) / 35) [(8, 1), (13, 2), (14, 1)],
  term ((1874 : Rat) / 35) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2416 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2416_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2416
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2416 := by
  native_decide

/-- Coefficient term 2417 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2417 : Poly :=
[
  term ((32 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2417 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2417 : Poly :=
[
  term ((64 : Rat) / 35) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 35) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2417 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2417_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2417
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2417 := by
  native_decide

/-- Coefficient term 2418 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2418 : Poly :=
[
  term ((-26 : Rat) / 35) [(13, 2), (16, 1)]
]

/-- Partial product 2418 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2418 : Poly :=
[
  term ((-52 : Rat) / 35) [(8, 1), (13, 2), (16, 1)],
  term ((26 : Rat) / 35) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2418 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2418_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2418
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2418 := by
  native_decide

/-- Coefficient term 2419 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2419 : Poly :=
[
  term ((-141 : Rat) / 5) [(14, 1)]
]

/-- Partial product 2419 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2419 : Poly :=
[
  term ((-282 : Rat) / 5) [(8, 1), (14, 1)],
  term ((141 : Rat) / 5) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2419 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2419_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2419
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2419 := by
  native_decide

/-- Coefficient term 2420 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2420 : Poly :=
[
  term ((-3 : Rat) / 2) [(16, 1)]
]

/-- Partial product 2420 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2420 : Poly :=
[
  term (-3 : Rat) [(8, 1), (16, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2420 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2420_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2420
        rs_R003_ueqv_R003YY_generator_19_2400_2420 =
      rs_R003_ueqv_R003YY_partial_19_2420 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_2400_2420 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_2400,
  rs_R003_ueqv_R003YY_partial_19_2401,
  rs_R003_ueqv_R003YY_partial_19_2402,
  rs_R003_ueqv_R003YY_partial_19_2403,
  rs_R003_ueqv_R003YY_partial_19_2404,
  rs_R003_ueqv_R003YY_partial_19_2405,
  rs_R003_ueqv_R003YY_partial_19_2406,
  rs_R003_ueqv_R003YY_partial_19_2407,
  rs_R003_ueqv_R003YY_partial_19_2408,
  rs_R003_ueqv_R003YY_partial_19_2409,
  rs_R003_ueqv_R003YY_partial_19_2410,
  rs_R003_ueqv_R003YY_partial_19_2411,
  rs_R003_ueqv_R003YY_partial_19_2412,
  rs_R003_ueqv_R003YY_partial_19_2413,
  rs_R003_ueqv_R003YY_partial_19_2414,
  rs_R003_ueqv_R003YY_partial_19_2415,
  rs_R003_ueqv_R003YY_partial_19_2416,
  rs_R003_ueqv_R003YY_partial_19_2417,
  rs_R003_ueqv_R003YY_partial_19_2418,
  rs_R003_ueqv_R003YY_partial_19_2419,
  rs_R003_ueqv_R003YY_partial_19_2420
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_2400_2420 : Poly :=
[
  term ((-208 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1391 : Rat) / 5) [(8, 1), (12, 1)],
  term ((41173 : Rat) / 1050) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-603 : Rat) / 70) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10313608 : Rat) / 53375) [(8, 1), (12, 1), (13, 2)],
  term ((-8448 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((2816 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term (272 : Rat) [(8, 1), (12, 1), (14, 1)],
  term ((7 : Rat) / 5) [(8, 1), (12, 1), (16, 1)],
  term ((1816 : Rat) / 5) [(8, 1), (12, 2)],
  term ((-1636 : Rat) / 5) [(8, 1), (12, 2), (14, 1)],
  term ((24 : Rat) / 5) [(8, 1), (12, 2), (16, 1)],
  term ((-59111 : Rat) / 1400) [(8, 1), (13, 1), (15, 1)],
  term ((467 : Rat) / 280) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1220764 : Rat) / 10675) [(8, 1), (13, 2)],
  term ((-3748 : Rat) / 35) [(8, 1), (13, 2), (14, 1)],
  term ((64 : Rat) / 35) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-52 : Rat) / 35) [(8, 1), (13, 2), (16, 1)],
  term ((-282 : Rat) / 5) [(8, 1), (14, 1)],
  term (-3 : Rat) [(8, 1), (16, 1)],
  term ((104 : Rat) / 35) [(11, 2), (13, 2), (16, 1)],
  term ((1391 : Rat) / 10) [(12, 1)],
  term ((-41173 : Rat) / 2100) [(12, 1), (13, 1), (15, 1)],
  term ((603 : Rat) / 140) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5156804 : Rat) / 53375) [(12, 1), (13, 2)],
  term ((4224 : Rat) / 35) [(12, 1), (13, 2), (14, 1)],
  term ((-1408 : Rat) / 35) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(12, 1), (13, 2), (16, 1)],
  term (-136 : Rat) [(12, 1), (14, 1)],
  term ((-7 : Rat) / 10) [(12, 1), (16, 1)],
  term ((-908 : Rat) / 5) [(12, 2)],
  term ((818 : Rat) / 5) [(12, 2), (14, 1)],
  term ((-12 : Rat) / 5) [(12, 2), (16, 1)],
  term ((59111 : Rat) / 2800) [(13, 1), (15, 1)],
  term ((-467 : Rat) / 560) [(13, 1), (15, 1), (16, 1)],
  term ((-610382 : Rat) / 10675) [(13, 2)],
  term ((1874 : Rat) / 35) [(13, 2), (14, 1)],
  term ((-32 : Rat) / 35) [(13, 2), (14, 1), (16, 1)],
  term ((26 : Rat) / 35) [(13, 2), (16, 1)],
  term ((141 : Rat) / 5) [(14, 1)],
  term ((3 : Rat) / 2) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 2400 through 2420. -/
theorem rs_R003_ueqv_R003YY_block_19_2400_2420_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_2400_2420
      rs_R003_ueqv_R003YY_block_19_2400_2420 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
