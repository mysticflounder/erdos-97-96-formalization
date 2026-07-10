/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 3:500-546

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_03_0500_0546 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0500 : Poly :=
[
  term ((737942 : Rat) / 10675) [(9, 1), (13, 1)]
]

/-- Partial product 500 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0500 : Poly :=
[
  term ((-1475884 : Rat) / 10675) [(4, 1), (9, 1), (13, 1)],
  term ((737942 : Rat) / 10675) [(4, 2), (9, 1), (13, 1)],
  term ((737942 : Rat) / 10675) [(5, 2), (9, 1), (13, 1)],
  term ((1475884 : Rat) / 10675) [(8, 1), (9, 1), (13, 1)],
  term ((-737942 : Rat) / 10675) [(8, 2), (9, 1), (13, 1)],
  term ((-737942 : Rat) / 10675) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0500_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0500
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0501 : Poly :=
[
  term ((-1996 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 501 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0501 : Poly :=
[
  term ((3992 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1996 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1996 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3992 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((1996 : Rat) / 35) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((1996 : Rat) / 35) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0501_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0501
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0502 : Poly :=
[
  term ((-576 : Rat) / 35) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 502 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0502 : Poly :=
[
  term ((1152 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0502_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0502
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0503 : Poly :=
[
  term ((426 : Rat) / 35) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 503 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0503 : Poly :=
[
  term ((-852 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((426 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((426 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((852 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-426 : Rat) / 35) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-426 : Rat) / 35) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0503_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0503
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0504 : Poly :=
[
  term ((24791 : Rat) / 4200) [(9, 1), (15, 1)]
]

/-- Partial product 504 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0504 : Poly :=
[
  term ((-24791 : Rat) / 2100) [(4, 1), (9, 1), (15, 1)],
  term ((24791 : Rat) / 4200) [(4, 2), (9, 1), (15, 1)],
  term ((24791 : Rat) / 4200) [(5, 2), (9, 1), (15, 1)],
  term ((24791 : Rat) / 2100) [(8, 1), (9, 1), (15, 1)],
  term ((-24791 : Rat) / 4200) [(8, 2), (9, 1), (15, 1)],
  term ((-24791 : Rat) / 4200) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0504_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0504
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0505 : Poly :=
[
  term ((-1137 : Rat) / 280) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0505 : Poly :=
[
  term ((1137 : Rat) / 140) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 280) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 280) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1137 : Rat) / 140) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1137 : Rat) / 280) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1137 : Rat) / 280) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0505_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0505
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0506 : Poly :=
[
  term ((-1732 : Rat) / 5) [(9, 2)]
]

/-- Partial product 506 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0506 : Poly :=
[
  term ((3464 : Rat) / 5) [(4, 1), (9, 2)],
  term ((-1732 : Rat) / 5) [(4, 2), (9, 2)],
  term ((-1732 : Rat) / 5) [(5, 2), (9, 2)],
  term ((-3464 : Rat) / 5) [(8, 1), (9, 2)],
  term ((1732 : Rat) / 5) [(8, 2), (9, 2)],
  term ((1732 : Rat) / 5) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0506_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0506
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0507 : Poly :=
[
  term ((-45861024 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 507 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0507 : Poly :=
[
  term ((91722048 : Rat) / 53375) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-45861024 : Rat) / 53375) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((-45861024 : Rat) / 53375) [(5, 2), (9, 2), (11, 1), (13, 1)],
  term ((-91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((45861024 : Rat) / 53375) [(9, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0507_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0507
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0508 : Poly :=
[
  term ((36864 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 508 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0508 : Poly :=
[
  term ((-73728 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((36864 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((36864 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-36864 : Rat) / 35) [(9, 4), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0508_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0508
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0509 : Poly :=
[
  term ((-12288 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 509 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0509 : Poly :=
[
  term ((24576 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12288 : Rat) / 35) [(9, 4), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0509_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0509
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0510 : Poly :=
[
  term ((9984 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 510 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0510 : Poly :=
[
  term ((-19968 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(9, 4), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0510_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0510
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0511 : Poly :=
[
  term ((-2096 : Rat) / 7) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 511 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0511 : Poly :=
[
  term ((4192 : Rat) / 7) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((-2096 : Rat) / 7) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((-2096 : Rat) / 7) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((-4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((2096 : Rat) / 7) [(9, 4), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0511_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0511
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0512 : Poly :=
[
  term ((1392 : Rat) / 35) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0512 : Poly :=
[
  term ((-2784 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1392 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1392 : Rat) / 35) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0512_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0512
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0513 : Poly :=
[
  term ((1568 : Rat) / 5) [(9, 2), (14, 1)]
]

/-- Partial product 513 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0513 : Poly :=
[
  term ((-3136 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((1568 : Rat) / 5) [(4, 2), (9, 2), (14, 1)],
  term ((1568 : Rat) / 5) [(5, 2), (9, 2), (14, 1)],
  term ((3136 : Rat) / 5) [(8, 1), (9, 2), (14, 1)],
  term ((-1568 : Rat) / 5) [(8, 2), (9, 2), (14, 1)],
  term ((-1568 : Rat) / 5) [(9, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0513_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0513
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0514 : Poly :=
[
  term ((-2 : Rat) / 5) [(9, 2), (16, 1)]
]

/-- Partial product 514 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0514 : Poly :=
[
  term ((4 : Rat) / 5) [(4, 1), (9, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(4, 2), (9, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(5, 2), (9, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(8, 1), (9, 2), (16, 1)],
  term ((2 : Rat) / 5) [(8, 2), (9, 2), (16, 1)],
  term ((2 : Rat) / 5) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0514_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0514
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0515 : Poly :=
[
  term ((479144 : Rat) / 7625) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 515 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0515 : Poly :=
[
  term ((-958288 : Rat) / 7625) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((479144 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((479144 : Rat) / 7625) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((958288 : Rat) / 7625) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-479144 : Rat) / 7625) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-479144 : Rat) / 7625) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0515_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0515
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0516 : Poly :=
[
  term ((-384 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 516 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0516 : Poly :=
[
  term ((768 : Rat) / 5) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 5) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 5) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 5) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0516_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0516
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0517 : Poly :=
[
  term ((128 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 517 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0517 : Poly :=
[
  term ((-256 : Rat) / 5) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 5) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 5) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0517_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0517
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0518 : Poly :=
[
  term ((-104 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 518 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0518 : Poly :=
[
  term ((208 : Rat) / 5) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0518_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0518
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0519 : Poly :=
[
  term ((3247 : Rat) / 30) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 519 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0519 : Poly :=
[
  term ((-3247 : Rat) / 15) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((3247 : Rat) / 30) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((3247 : Rat) / 30) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((3247 : Rat) / 15) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3247 : Rat) / 30) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3247 : Rat) / 30) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0519_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0519
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0520 : Poly :=
[
  term ((-25 : Rat) / 2) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0520 : Poly :=
[
  term (25 : Rat) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25 : Rat) / 2) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25 : Rat) / 2) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-25 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((25 : Rat) / 2) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((25 : Rat) / 2) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0520_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0520
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0521 : Poly :=
[
  term ((-81 : Rat) / 5) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 521 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0521 : Poly :=
[
  term ((162 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-81 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-81 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-162 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((81 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((81 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0521_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0521
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0522 : Poly :=
[
  term ((9 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0522 : Poly :=
[
  term ((-18 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0522_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0522
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0523 : Poly :=
[
  term ((-18144544 : Rat) / 53375) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 523 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0523 : Poly :=
[
  term ((36289088 : Rat) / 53375) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-18144544 : Rat) / 53375) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-18144544 : Rat) / 53375) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-36289088 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((18144544 : Rat) / 53375) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((18144544 : Rat) / 53375) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0523_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0523
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0524 : Poly :=
[
  term ((14592 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 524 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0524 : Poly :=
[
  term ((-29184 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((14592 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((14592 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((29184 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-14592 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-14592 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0524_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0524
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0525 : Poly :=
[
  term ((-4864 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 525 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0525 : Poly :=
[
  term ((9728 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4864 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4864 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9728 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4864 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4864 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0525_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0525
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0526 : Poly :=
[
  term ((3952 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 526 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0526 : Poly :=
[
  term ((-7904 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3952 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3952 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7904 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3952 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3952 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0526_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0526
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0527 : Poly :=
[
  term ((-35663 : Rat) / 210) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 527 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0527 : Poly :=
[
  term ((35663 : Rat) / 105) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-35663 : Rat) / 210) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-35663 : Rat) / 210) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-35663 : Rat) / 105) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((35663 : Rat) / 210) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((35663 : Rat) / 210) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0527_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0527
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0528 : Poly :=
[
  term ((1501 : Rat) / 70) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0528 : Poly :=
[
  term ((-1501 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1501 : Rat) / 70) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1501 : Rat) / 70) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1501 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1501 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1501 : Rat) / 70) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0528_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0528
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0529 : Poly :=
[
  term ((13863028 : Rat) / 53375) [(11, 1), (13, 1)]
]

/-- Partial product 529 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0529 : Poly :=
[
  term ((-27726056 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)],
  term ((13863028 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((13863028 : Rat) / 53375) [(5, 2), (11, 1), (13, 1)],
  term ((27726056 : Rat) / 53375) [(8, 1), (11, 1), (13, 1)],
  term ((-13863028 : Rat) / 53375) [(8, 2), (11, 1), (13, 1)],
  term ((-13863028 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0529_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0529
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0530 : Poly :=
[
  term ((-11136 : Rat) / 35) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 530 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0530 : Poly :=
[
  term ((22272 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-11136 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-11136 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-22272 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((11136 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((11136 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0530_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0530
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0531 : Poly :=
[
  term ((3712 : Rat) / 35) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 531 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0531 : Poly :=
[
  term ((-7424 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3712 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3712 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7424 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3712 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3712 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0531_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0531
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0532 : Poly :=
[
  term ((-3016 : Rat) / 35) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 532 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0532 : Poly :=
[
  term ((6032 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3016 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3016 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6032 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3016 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((3016 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0532_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0532
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0533 : Poly :=
[
  term ((79949 : Rat) / 840) [(11, 1), (15, 1)]
]

/-- Partial product 533 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0533 : Poly :=
[
  term ((-79949 : Rat) / 420) [(4, 1), (11, 1), (15, 1)],
  term ((79949 : Rat) / 840) [(4, 2), (11, 1), (15, 1)],
  term ((79949 : Rat) / 840) [(5, 2), (11, 1), (15, 1)],
  term ((79949 : Rat) / 420) [(8, 1), (11, 1), (15, 1)],
  term ((-79949 : Rat) / 840) [(8, 2), (11, 1), (15, 1)],
  term ((-79949 : Rat) / 840) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0533_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0533
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0534 : Poly :=
[
  term ((-3511 : Rat) / 280) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0534 : Poly :=
[
  term ((3511 : Rat) / 140) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3511 : Rat) / 280) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3511 : Rat) / 280) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3511 : Rat) / 140) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3511 : Rat) / 280) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((3511 : Rat) / 280) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0534_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0534
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0535 : Poly :=
[
  term ((-211 : Rat) / 5) [(12, 1)]
]

/-- Partial product 535 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0535 : Poly :=
[
  term ((422 : Rat) / 5) [(4, 1), (12, 1)],
  term ((-211 : Rat) / 5) [(4, 2), (12, 1)],
  term ((-211 : Rat) / 5) [(5, 2), (12, 1)],
  term ((-422 : Rat) / 5) [(8, 1), (12, 1)],
  term ((211 : Rat) / 5) [(8, 2), (12, 1)],
  term ((211 : Rat) / 5) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0535_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0535
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0536 : Poly :=
[
  term ((20736 : Rat) / 7625) [(12, 1), (13, 2)]
]

/-- Partial product 536 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0536 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(4, 1), (12, 1), (13, 2)],
  term ((20736 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)],
  term ((20736 : Rat) / 7625) [(5, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(8, 1), (12, 1), (13, 2)],
  term ((-20736 : Rat) / 7625) [(8, 2), (12, 1), (13, 2)],
  term ((-20736 : Rat) / 7625) [(9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0536_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0536
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0537 : Poly :=
[
  term (30 : Rat) [(12, 1), (14, 1)]
]

/-- Partial product 537 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0537 : Poly :=
[
  term (-60 : Rat) [(4, 1), (12, 1), (14, 1)],
  term (30 : Rat) [(4, 2), (12, 1), (14, 1)],
  term (30 : Rat) [(5, 2), (12, 1), (14, 1)],
  term (60 : Rat) [(8, 1), (12, 1), (14, 1)],
  term (-30 : Rat) [(8, 2), (12, 1), (14, 1)],
  term (-30 : Rat) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0537_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0537
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0538 : Poly :=
[
  term ((-11 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 538 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0538 : Poly :=
[
  term ((22 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((-11 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((-11 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((-22 : Rat) / 5) [(8, 1), (12, 1), (16, 1)],
  term ((11 : Rat) / 5) [(8, 2), (12, 1), (16, 1)],
  term ((11 : Rat) / 5) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0538_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0538
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0539 : Poly :=
[
  term ((22546 : Rat) / 525) [(13, 1), (15, 1)]
]

/-- Partial product 539 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0539 : Poly :=
[
  term ((-45092 : Rat) / 525) [(4, 1), (13, 1), (15, 1)],
  term ((22546 : Rat) / 525) [(4, 2), (13, 1), (15, 1)],
  term ((22546 : Rat) / 525) [(5, 2), (13, 1), (15, 1)],
  term ((45092 : Rat) / 525) [(8, 1), (13, 1), (15, 1)],
  term ((-22546 : Rat) / 525) [(8, 2), (13, 1), (15, 1)],
  term ((-22546 : Rat) / 525) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0539_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0539
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0540 : Poly :=
[
  term ((-106 : Rat) / 35) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0540 : Poly :=
[
  term ((212 : Rat) / 35) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106 : Rat) / 35) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-106 : Rat) / 35) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-212 : Rat) / 35) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((106 : Rat) / 35) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((106 : Rat) / 35) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0540_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0540
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0541 : Poly :=
[
  term ((-499496 : Rat) / 10675) [(13, 2)]
]

/-- Partial product 541 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0541 : Poly :=
[
  term ((998992 : Rat) / 10675) [(4, 1), (13, 2)],
  term ((-499496 : Rat) / 10675) [(4, 2), (13, 2)],
  term ((-499496 : Rat) / 10675) [(5, 2), (13, 2)],
  term ((-998992 : Rat) / 10675) [(8, 1), (13, 2)],
  term ((499496 : Rat) / 10675) [(8, 2), (13, 2)],
  term ((499496 : Rat) / 10675) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0541_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0541
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0542 : Poly :=
[
  term ((384 : Rat) / 7) [(13, 2), (14, 1)]
]

/-- Partial product 542 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0542 : Poly :=
[
  term ((-768 : Rat) / 7) [(4, 1), (13, 2), (14, 1)],
  term ((384 : Rat) / 7) [(4, 2), (13, 2), (14, 1)],
  term ((384 : Rat) / 7) [(5, 2), (13, 2), (14, 1)],
  term ((768 : Rat) / 7) [(8, 1), (13, 2), (14, 1)],
  term ((-384 : Rat) / 7) [(8, 2), (13, 2), (14, 1)],
  term ((-384 : Rat) / 7) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0542_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0542
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0543 : Poly :=
[
  term ((-128 : Rat) / 7) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 543 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0543 : Poly :=
[
  term ((256 : Rat) / 7) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 7) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 7) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0543_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0543
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0544 : Poly :=
[
  term ((104 : Rat) / 7) [(13, 2), (16, 1)]
]

/-- Partial product 544 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0544 : Poly :=
[
  term ((-208 : Rat) / 7) [(4, 1), (13, 2), (16, 1)],
  term ((104 : Rat) / 7) [(4, 2), (13, 2), (16, 1)],
  term ((104 : Rat) / 7) [(5, 2), (13, 2), (16, 1)],
  term ((208 : Rat) / 7) [(8, 1), (13, 2), (16, 1)],
  term ((-104 : Rat) / 7) [(8, 2), (13, 2), (16, 1)],
  term ((-104 : Rat) / 7) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0544_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0544
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0545 : Poly :=
[
  term ((141 : Rat) / 5) [(14, 1)]
]

/-- Partial product 545 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0545 : Poly :=
[
  term ((-282 : Rat) / 5) [(4, 1), (14, 1)],
  term ((141 : Rat) / 5) [(4, 2), (14, 1)],
  term ((141 : Rat) / 5) [(5, 2), (14, 1)],
  term ((282 : Rat) / 5) [(8, 1), (14, 1)],
  term ((-141 : Rat) / 5) [(8, 2), (14, 1)],
  term ((-141 : Rat) / 5) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0545_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0545
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003YY_coefficient_03_0546 : Poly :=
[
  term ((3 : Rat) / 2) [(16, 1)]
]

/-- Partial product 546 for generator 3. -/
def rs_R003_ueqv_R003YY_partial_03_0546 : Poly :=
[
  term (-3 : Rat) [(4, 1), (16, 1)],
  term ((3 : Rat) / 2) [(4, 2), (16, 1)],
  term ((3 : Rat) / 2) [(5, 2), (16, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(8, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 3. -/
theorem rs_R003_ueqv_R003YY_partial_03_0546_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_03_0546
        rs_R003_ueqv_R003YY_generator_03_0500_0546 =
      rs_R003_ueqv_R003YY_partial_03_0546 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_03_0500_0546 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_03_0500,
  rs_R003_ueqv_R003YY_partial_03_0501,
  rs_R003_ueqv_R003YY_partial_03_0502,
  rs_R003_ueqv_R003YY_partial_03_0503,
  rs_R003_ueqv_R003YY_partial_03_0504,
  rs_R003_ueqv_R003YY_partial_03_0505,
  rs_R003_ueqv_R003YY_partial_03_0506,
  rs_R003_ueqv_R003YY_partial_03_0507,
  rs_R003_ueqv_R003YY_partial_03_0508,
  rs_R003_ueqv_R003YY_partial_03_0509,
  rs_R003_ueqv_R003YY_partial_03_0510,
  rs_R003_ueqv_R003YY_partial_03_0511,
  rs_R003_ueqv_R003YY_partial_03_0512,
  rs_R003_ueqv_R003YY_partial_03_0513,
  rs_R003_ueqv_R003YY_partial_03_0514,
  rs_R003_ueqv_R003YY_partial_03_0515,
  rs_R003_ueqv_R003YY_partial_03_0516,
  rs_R003_ueqv_R003YY_partial_03_0517,
  rs_R003_ueqv_R003YY_partial_03_0518,
  rs_R003_ueqv_R003YY_partial_03_0519,
  rs_R003_ueqv_R003YY_partial_03_0520,
  rs_R003_ueqv_R003YY_partial_03_0521,
  rs_R003_ueqv_R003YY_partial_03_0522,
  rs_R003_ueqv_R003YY_partial_03_0523,
  rs_R003_ueqv_R003YY_partial_03_0524,
  rs_R003_ueqv_R003YY_partial_03_0525,
  rs_R003_ueqv_R003YY_partial_03_0526,
  rs_R003_ueqv_R003YY_partial_03_0527,
  rs_R003_ueqv_R003YY_partial_03_0528,
  rs_R003_ueqv_R003YY_partial_03_0529,
  rs_R003_ueqv_R003YY_partial_03_0530,
  rs_R003_ueqv_R003YY_partial_03_0531,
  rs_R003_ueqv_R003YY_partial_03_0532,
  rs_R003_ueqv_R003YY_partial_03_0533,
  rs_R003_ueqv_R003YY_partial_03_0534,
  rs_R003_ueqv_R003YY_partial_03_0535,
  rs_R003_ueqv_R003YY_partial_03_0536,
  rs_R003_ueqv_R003YY_partial_03_0537,
  rs_R003_ueqv_R003YY_partial_03_0538,
  rs_R003_ueqv_R003YY_partial_03_0539,
  rs_R003_ueqv_R003YY_partial_03_0540,
  rs_R003_ueqv_R003YY_partial_03_0541,
  rs_R003_ueqv_R003YY_partial_03_0542,
  rs_R003_ueqv_R003YY_partial_03_0543,
  rs_R003_ueqv_R003YY_partial_03_0544,
  rs_R003_ueqv_R003YY_partial_03_0545,
  rs_R003_ueqv_R003YY_partial_03_0546
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_03_0500_0546 : Poly :=
[
  term ((-1475884 : Rat) / 10675) [(4, 1), (9, 1), (13, 1)],
  term ((3992 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-852 : Rat) / 35) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24791 : Rat) / 2100) [(4, 1), (9, 1), (15, 1)],
  term ((1137 : Rat) / 140) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((3464 : Rat) / 5) [(4, 1), (9, 2)],
  term ((91722048 : Rat) / 53375) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-73728 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((24576 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((4192 : Rat) / 7) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((-2784 : Rat) / 35) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3136 : Rat) / 5) [(4, 1), (9, 2), (14, 1)],
  term ((4 : Rat) / 5) [(4, 1), (9, 2), (16, 1)],
  term ((-958288 : Rat) / 7625) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((768 : Rat) / 5) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 5) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 5) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3247 : Rat) / 15) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term (25 : Rat) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((36289088 : Rat) / 53375) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-29184 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((9728 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7904 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((35663 : Rat) / 105) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1501 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27726056 : Rat) / 53375) [(4, 1), (11, 1), (13, 1)],
  term ((22272 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-7424 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6032 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-79949 : Rat) / 420) [(4, 1), (11, 1), (15, 1)],
  term ((3511 : Rat) / 140) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((422 : Rat) / 5) [(4, 1), (12, 1)],
  term ((-41472 : Rat) / 7625) [(4, 1), (12, 1), (13, 2)],
  term (-60 : Rat) [(4, 1), (12, 1), (14, 1)],
  term ((22 : Rat) / 5) [(4, 1), (12, 1), (16, 1)],
  term ((-45092 : Rat) / 525) [(4, 1), (13, 1), (15, 1)],
  term ((212 : Rat) / 35) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((998992 : Rat) / 10675) [(4, 1), (13, 2)],
  term ((-768 : Rat) / 7) [(4, 1), (13, 2), (14, 1)],
  term ((256 : Rat) / 7) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(4, 1), (13, 2), (16, 1)],
  term ((-282 : Rat) / 5) [(4, 1), (14, 1)],
  term (-3 : Rat) [(4, 1), (16, 1)],
  term ((737942 : Rat) / 10675) [(4, 2), (9, 1), (13, 1)],
  term ((-1996 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((426 : Rat) / 35) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((24791 : Rat) / 4200) [(4, 2), (9, 1), (15, 1)],
  term ((-1137 : Rat) / 280) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1732 : Rat) / 5) [(4, 2), (9, 2)],
  term ((-45861024 : Rat) / 53375) [(4, 2), (9, 2), (11, 1), (13, 1)],
  term ((36864 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((1392 : Rat) / 35) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1568 : Rat) / 5) [(4, 2), (9, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(4, 2), (9, 2), (16, 1)],
  term ((479144 : Rat) / 7625) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-384 : Rat) / 5) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 5) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3247 : Rat) / 30) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 2) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((9 : Rat) / 5) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18144544 : Rat) / 53375) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((14592 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4864 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3952 : Rat) / 35) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-35663 : Rat) / 210) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((1501 : Rat) / 70) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13863028 : Rat) / 53375) [(4, 2), (11, 1), (13, 1)],
  term ((-11136 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((3712 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3016 : Rat) / 35) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((79949 : Rat) / 840) [(4, 2), (11, 1), (15, 1)],
  term ((-3511 : Rat) / 280) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-211 : Rat) / 5) [(4, 2), (12, 1)],
  term ((20736 : Rat) / 7625) [(4, 2), (12, 1), (13, 2)],
  term (30 : Rat) [(4, 2), (12, 1), (14, 1)],
  term ((-11 : Rat) / 5) [(4, 2), (12, 1), (16, 1)],
  term ((22546 : Rat) / 525) [(4, 2), (13, 1), (15, 1)],
  term ((-106 : Rat) / 35) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-499496 : Rat) / 10675) [(4, 2), (13, 2)],
  term ((384 : Rat) / 7) [(4, 2), (13, 2), (14, 1)],
  term ((-128 : Rat) / 7) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((104 : Rat) / 7) [(4, 2), (13, 2), (16, 1)],
  term ((141 : Rat) / 5) [(4, 2), (14, 1)],
  term ((3 : Rat) / 2) [(4, 2), (16, 1)],
  term ((737942 : Rat) / 10675) [(5, 2), (9, 1), (13, 1)],
  term ((-1996 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((426 : Rat) / 35) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((24791 : Rat) / 4200) [(5, 2), (9, 1), (15, 1)],
  term ((-1137 : Rat) / 280) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1732 : Rat) / 5) [(5, 2), (9, 2)],
  term ((-45861024 : Rat) / 53375) [(5, 2), (9, 2), (11, 1), (13, 1)],
  term ((36864 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2096 : Rat) / 7) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((1392 : Rat) / 35) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1568 : Rat) / 5) [(5, 2), (9, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(5, 2), (9, 2), (16, 1)],
  term ((479144 : Rat) / 7625) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-384 : Rat) / 5) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((128 : Rat) / 5) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3247 : Rat) / 30) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-25 : Rat) / 2) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((9 : Rat) / 5) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18144544 : Rat) / 53375) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((14592 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4864 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3952 : Rat) / 35) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-35663 : Rat) / 210) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((1501 : Rat) / 70) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13863028 : Rat) / 53375) [(5, 2), (11, 1), (13, 1)],
  term ((-11136 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((3712 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3016 : Rat) / 35) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((79949 : Rat) / 840) [(5, 2), (11, 1), (15, 1)],
  term ((-3511 : Rat) / 280) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-211 : Rat) / 5) [(5, 2), (12, 1)],
  term ((20736 : Rat) / 7625) [(5, 2), (12, 1), (13, 2)],
  term (30 : Rat) [(5, 2), (12, 1), (14, 1)],
  term ((-11 : Rat) / 5) [(5, 2), (12, 1), (16, 1)],
  term ((22546 : Rat) / 525) [(5, 2), (13, 1), (15, 1)],
  term ((-106 : Rat) / 35) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-499496 : Rat) / 10675) [(5, 2), (13, 2)],
  term ((384 : Rat) / 7) [(5, 2), (13, 2), (14, 1)],
  term ((-128 : Rat) / 7) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((104 : Rat) / 7) [(5, 2), (13, 2), (16, 1)],
  term ((141 : Rat) / 5) [(5, 2), (14, 1)],
  term ((3 : Rat) / 2) [(5, 2), (16, 1)],
  term ((1475884 : Rat) / 10675) [(8, 1), (9, 1), (13, 1)],
  term ((-3992 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1152 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((852 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((24791 : Rat) / 2100) [(8, 1), (9, 1), (15, 1)],
  term ((-1137 : Rat) / 140) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3464 : Rat) / 5) [(8, 1), (9, 2)],
  term ((-91722048 : Rat) / 53375) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((73728 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-24576 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4192 : Rat) / 7) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3136 : Rat) / 5) [(8, 1), (9, 2), (14, 1)],
  term ((-4 : Rat) / 5) [(8, 1), (9, 2), (16, 1)],
  term ((958288 : Rat) / 7625) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-768 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3247 : Rat) / 15) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term (-25 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-162 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((18 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36289088 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((29184 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9728 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7904 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-35663 : Rat) / 105) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1501 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27726056 : Rat) / 53375) [(8, 1), (11, 1), (13, 1)],
  term ((-22272 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((7424 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6032 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((79949 : Rat) / 420) [(8, 1), (11, 1), (15, 1)],
  term ((-3511 : Rat) / 140) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-422 : Rat) / 5) [(8, 1), (12, 1)],
  term ((41472 : Rat) / 7625) [(8, 1), (12, 1), (13, 2)],
  term (60 : Rat) [(8, 1), (12, 1), (14, 1)],
  term ((-22 : Rat) / 5) [(8, 1), (12, 1), (16, 1)],
  term ((45092 : Rat) / 525) [(8, 1), (13, 1), (15, 1)],
  term ((-212 : Rat) / 35) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-998992 : Rat) / 10675) [(8, 1), (13, 2)],
  term ((768 : Rat) / 7) [(8, 1), (13, 2), (14, 1)],
  term ((-256 : Rat) / 7) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(8, 1), (13, 2), (16, 1)],
  term ((282 : Rat) / 5) [(8, 1), (14, 1)],
  term (3 : Rat) [(8, 1), (16, 1)],
  term ((-737942 : Rat) / 10675) [(8, 2), (9, 1), (13, 1)],
  term ((1996 : Rat) / 35) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 35) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-426 : Rat) / 35) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-24791 : Rat) / 4200) [(8, 2), (9, 1), (15, 1)],
  term ((1137 : Rat) / 280) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1732 : Rat) / 5) [(8, 2), (9, 2)],
  term ((45861024 : Rat) / 53375) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1568 : Rat) / 5) [(8, 2), (9, 2), (14, 1)],
  term ((2 : Rat) / 5) [(8, 2), (9, 2), (16, 1)],
  term ((-479144 : Rat) / 7625) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((384 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3247 : Rat) / 30) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 2) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18144544 : Rat) / 53375) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-14592 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4864 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3952 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((35663 : Rat) / 210) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1501 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13863028 : Rat) / 53375) [(8, 2), (11, 1), (13, 1)],
  term ((11136 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3712 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3016 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-79949 : Rat) / 840) [(8, 2), (11, 1), (15, 1)],
  term ((3511 : Rat) / 280) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((211 : Rat) / 5) [(8, 2), (12, 1)],
  term ((-20736 : Rat) / 7625) [(8, 2), (12, 1), (13, 2)],
  term (-30 : Rat) [(8, 2), (12, 1), (14, 1)],
  term ((11 : Rat) / 5) [(8, 2), (12, 1), (16, 1)],
  term ((-22546 : Rat) / 525) [(8, 2), (13, 1), (15, 1)],
  term ((106 : Rat) / 35) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((499496 : Rat) / 10675) [(8, 2), (13, 2)],
  term ((-384 : Rat) / 7) [(8, 2), (13, 2), (14, 1)],
  term ((128 : Rat) / 7) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(8, 2), (13, 2), (16, 1)],
  term ((-141 : Rat) / 5) [(8, 2), (14, 1)],
  term ((-3 : Rat) / 2) [(8, 2), (16, 1)],
  term ((-479144 : Rat) / 7625) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((384 : Rat) / 5) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-128 : Rat) / 5) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3247 : Rat) / 30) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((25 : Rat) / 2) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((81 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18144544 : Rat) / 53375) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-14592 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4864 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3952 : Rat) / 35) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((35663 : Rat) / 210) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1501 : Rat) / 70) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13863028 : Rat) / 53375) [(9, 2), (11, 1), (13, 1)],
  term ((11136 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3712 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3016 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-79949 : Rat) / 840) [(9, 2), (11, 1), (15, 1)],
  term ((3511 : Rat) / 280) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((211 : Rat) / 5) [(9, 2), (12, 1)],
  term ((-20736 : Rat) / 7625) [(9, 2), (12, 1), (13, 2)],
  term (-30 : Rat) [(9, 2), (12, 1), (14, 1)],
  term ((11 : Rat) / 5) [(9, 2), (12, 1), (16, 1)],
  term ((-22546 : Rat) / 525) [(9, 2), (13, 1), (15, 1)],
  term ((106 : Rat) / 35) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((499496 : Rat) / 10675) [(9, 2), (13, 2)],
  term ((-384 : Rat) / 7) [(9, 2), (13, 2), (14, 1)],
  term ((128 : Rat) / 7) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(9, 2), (13, 2), (16, 1)],
  term ((-141 : Rat) / 5) [(9, 2), (14, 1)],
  term ((-3 : Rat) / 2) [(9, 2), (16, 1)],
  term ((-737942 : Rat) / 10675) [(9, 3), (13, 1)],
  term ((1996 : Rat) / 35) [(9, 3), (13, 1), (14, 1)],
  term ((576 : Rat) / 35) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-426 : Rat) / 35) [(9, 3), (13, 1), (16, 1)],
  term ((-24791 : Rat) / 4200) [(9, 3), (15, 1)],
  term ((1137 : Rat) / 280) [(9, 3), (15, 1), (16, 1)],
  term ((1732 : Rat) / 5) [(9, 4)],
  term ((45861024 : Rat) / 53375) [(9, 4), (11, 1), (13, 1)],
  term ((-36864 : Rat) / 35) [(9, 4), (11, 1), (13, 1), (14, 1)],
  term ((12288 : Rat) / 35) [(9, 4), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9984 : Rat) / 35) [(9, 4), (11, 1), (13, 1), (16, 1)],
  term ((2096 : Rat) / 7) [(9, 4), (11, 1), (15, 1)],
  term ((-1392 : Rat) / 35) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((-1568 : Rat) / 5) [(9, 4), (14, 1)],
  term ((2 : Rat) / 5) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 500 through 546. -/
theorem rs_R003_ueqv_R003YY_block_03_0500_0546_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_03_0500_0546
      rs_R003_ueqv_R003YY_block_03_0500_0546 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
