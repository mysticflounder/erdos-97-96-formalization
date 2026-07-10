/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 10:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0500 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 500 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0500 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0500_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0500
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0501 : Poly :=
[
  term ((23552 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 501 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0501 : Poly :=
[
  term ((47104 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0501_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0501
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0502 : Poly :=
[
  term ((3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 502 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0502 : Poly :=
[
  term ((6868986254 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0502_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0502
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0503 : Poly :=
[
  term ((-609696 : Rat) / 32699) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0503 : Poly :=
[
  term ((-1219392 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((609696 : Rat) / 32699) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0503_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0503
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0504 : Poly :=
[
  term ((-3434493127 : Rat) / 132757940) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 504 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0504 : Poly :=
[
  term ((-3434493127 : Rat) / 66378970) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((3434493127 : Rat) / 132757940) [(5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0504_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0504
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0505 : Poly :=
[
  term ((152424 : Rat) / 32699) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0505 : Poly :=
[
  term ((304848 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-152424 : Rat) / 32699) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0505_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0505
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0506 : Poly :=
[
  term ((-1 : Rat) / 8) [(5, 1), (9, 1)]
]

/-- Partial product 506 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0506 : Poly :=
[
  term ((-1 : Rat) / 4) [(2, 1), (5, 1), (9, 1)],
  term ((1 : Rat) / 8) [(5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0506_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0506
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0507 : Poly :=
[
  term ((-64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 507 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0507 : Poly :=
[
  term ((-128 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0507_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0507
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0508 : Poly :=
[
  term ((16 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 508 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0508 : Poly :=
[
  term ((32 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0508_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0508
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0509 : Poly :=
[
  term ((-62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 509 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0509 : Poly :=
[
  term ((-124021568 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0509_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0509
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0510 : Poly :=
[
  term ((58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 510 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0510 : Poly :=
[
  term ((117760 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0510_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0510
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0511 : Poly :=
[
  term ((302302572 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 511 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0511 : Poly :=
[
  term ((604605144 : Rat) / 33189485) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-302302572 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0511_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0511
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0512 : Poly :=
[
  term ((-57408 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0512 : Poly :=
[
  term ((-114816 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((57408 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0512_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0512
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0513 : Poly :=
[
  term ((-128 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 513 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0513 : Poly :=
[
  term ((-256 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((128 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0513_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0513
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0514 : Poly :=
[
  term ((-31005392 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 514 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0514 : Poly :=
[
  term ((-62010784 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((31005392 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0514_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0514
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0515 : Poly :=
[
  term ((29440 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0515 : Poly :=
[
  term ((58880 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-29440 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0515_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0515
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0516 : Poly :=
[
  term ((13795608 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 516 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0516 : Poly :=
[
  term ((27591216 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-13795608 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0516_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0516
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0517 : Poly :=
[
  term ((14720 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 517 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0517 : Poly :=
[
  term ((29440 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14720 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0517_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0517
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0518 : Poly :=
[
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 518 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0518 : Poly :=
[
  term ((124021568 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0518_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0518
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0519 : Poly :=
[
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0519 : Poly :=
[
  term ((-117760 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0519_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0519
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0520 : Poly :=
[
  term ((28871532 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 520 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0520 : Poly :=
[
  term ((57743064 : Rat) / 33189485) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-28871532 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0520_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0520
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0521 : Poly :=
[
  term ((1472 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0521 : Poly :=
[
  term ((2944 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1472 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0521_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0521
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0522 : Poly :=
[
  term ((-32 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 522 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0522 : Poly :=
[
  term ((-64 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((32 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0522_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0522
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0523 : Poly :=
[
  term ((39 : Rat) / 8) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 523 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0523 : Poly :=
[
  term ((39 : Rat) / 4) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term ((-39 : Rat) / 8) [(5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0523_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0523
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0524 : Poly :=
[
  term (-5 : Rat) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 524 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0524 : Poly :=
[
  term (-10 : Rat) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term (5 : Rat) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0524_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0524
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0525 : Poly :=
[
  term ((-160 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 525 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0525 : Poly :=
[
  term ((-320 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((160 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0525_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0525
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0526 : Poly :=
[
  term ((164 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 526 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0526 : Poly :=
[
  term ((328 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-164 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0526_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0526
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0527 : Poly :=
[
  term ((-5 : Rat) / 2) [(5, 1), (9, 1), (12, 2)]
]

/-- Partial product 527 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0527 : Poly :=
[
  term (-5 : Rat) [(2, 1), (5, 1), (9, 1), (12, 2)],
  term ((5 : Rat) / 2) [(5, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0527_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0527
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0528 : Poly :=
[
  term ((-80 : Rat) / 29) [(5, 1), (9, 1), (12, 2), (15, 2)]
]

/-- Partial product 528 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0528 : Poly :=
[
  term ((-160 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 2), (15, 2)],
  term ((80 : Rat) / 29) [(5, 1), (9, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0528_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0528
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0529 : Poly :=
[
  term ((-5 : Rat) / 4) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 529 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0529 : Poly :=
[
  term ((-5 : Rat) / 2) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((5 : Rat) / 4) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0529_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0529
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0530 : Poly :=
[
  term ((-40 : Rat) / 29) [(5, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 530 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0530 : Poly :=
[
  term ((-80 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((40 : Rat) / 29) [(5, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0530_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0530
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0531 : Poly :=
[
  term (5 : Rat) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 531 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0531 : Poly :=
[
  term (10 : Rat) [(2, 1), (5, 1), (9, 1), (13, 2)],
  term (-5 : Rat) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0531_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0531
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0532 : Poly :=
[
  term ((160 : Rat) / 29) [(5, 1), (9, 1), (13, 2), (15, 2)]
]

/-- Partial product 532 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0532 : Poly :=
[
  term ((320 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-160 : Rat) / 29) [(5, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0532_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0532
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0533 : Poly :=
[
  term ((-2 : Rat) / 29) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 533 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0533 : Poly :=
[
  term ((-4 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((2 : Rat) / 29) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0533_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0533
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0534 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 534 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0534 : Poly :=
[
  term ((8185423488 : Rat) / 6637897) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0534_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0534
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0535 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 535 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0535 : Poly :=
[
  term ((-7772160 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0535_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0535
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0536 : Poly :=
[
  term ((-1023177936 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 536 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0536 : Poly :=
[
  term ((-2046355872 : Rat) / 6637897) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((1023177936 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0536_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0536
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0537 : Poly :=
[
  term ((971520 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 537 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0537 : Poly :=
[
  term ((1943040 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-971520 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0537_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0537
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0538 : Poly :=
[
  term ((63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 538 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0538 : Poly :=
[
  term ((127568258304 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0538_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0538
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0539 : Poly :=
[
  term ((-12199680 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 539 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0539 : Poly :=
[
  term ((-24399360 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((12199680 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0539_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0539
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0540 : Poly :=
[
  term ((-36211561476 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 540 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0540 : Poly :=
[
  term ((-72423122952 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((36211561476 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0540_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0540
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0541 : Poly :=
[
  term ((6905076 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0541 : Poly :=
[
  term ((13810152 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6905076 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0541_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0541
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0542 : Poly :=
[
  term ((31892064576 : Rat) / 33189485) [(5, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 542 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0542 : Poly :=
[
  term ((63784129152 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-31892064576 : Rat) / 33189485) [(5, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0542_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0542
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0543 : Poly :=
[
  term ((-6099840 : Rat) / 32699) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0543 : Poly :=
[
  term ((-12199680 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((6099840 : Rat) / 32699) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0543_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0543
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0544 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 544 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0544 : Poly :=
[
  term ((31892064576 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-15946032288 : Rat) / 33189485) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0544_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0544
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0545 : Poly :=
[
  term ((-3049920 : Rat) / 32699) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 545 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0545 : Poly :=
[
  term ((-6099840 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3049920 : Rat) / 32699) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0545_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0545
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0546 : Poly :=
[
  term ((-63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 546 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0546 : Poly :=
[
  term ((-127568258304 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1)],
  term ((63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0546_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0546
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0547 : Poly :=
[
  term ((12199680 : Rat) / 32699) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0547 : Poly :=
[
  term ((24399360 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12199680 : Rat) / 32699) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0547_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0547
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0548 : Poly :=
[
  term ((-4317117537 : Rat) / 26551588) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 548 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0548 : Poly :=
[
  term ((-4317117537 : Rat) / 13275794) [(2, 1), (5, 1), (10, 1), (15, 1)],
  term ((4317117537 : Rat) / 26551588) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0548_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0548
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0549 : Poly :=
[
  term ((1037813 : Rat) / 32699) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 549 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0549 : Poly :=
[
  term ((2075626 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1037813 : Rat) / 32699) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0549_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0549
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0550 : Poly :=
[
  term ((11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 550 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0550 : Poly :=
[
  term ((23254044000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0550_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0550
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0551 : Poly :=
[
  term ((-11040000 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 551 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0551 : Poly :=
[
  term ((-22080000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((11040000 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0551_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0551
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0552 : Poly :=
[
  term ((-49494839656 : Rat) / 33189485) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 552 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0552 : Poly :=
[
  term ((-98989679312 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((49494839656 : Rat) / 33189485) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0552_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0552
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0553 : Poly :=
[
  term ((9347368 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 553 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0553 : Poly :=
[
  term ((18694736 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9347368 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0553_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0553
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0554 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 554 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0554 : Poly :=
[
  term ((11627022000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-5813511000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0554_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0554
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0555 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 555 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0555 : Poly :=
[
  term ((-11040000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((5520000 : Rat) / 32699) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0555_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0555
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0556 : Poly :=
[
  term ((-7452376263 : Rat) / 33189485) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 556 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0556 : Poly :=
[
  term ((-14904752526 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((7452376263 : Rat) / 33189485) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0556_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0556
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0557 : Poly :=
[
  term ((1467048 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0557 : Poly :=
[
  term ((2934096 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1467048 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0557_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0557
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0558 : Poly :=
[
  term ((2906755500 : Rat) / 6637897) [(5, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 558 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0558 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-2906755500 : Rat) / 6637897) [(5, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0558_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0558
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0559 : Poly :=
[
  term ((-2760000 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 559 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0559 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2760000 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0559_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0559
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0560 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 560 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0560 : Poly :=
[
  term ((-23254044000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2)],
  term ((11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0560_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0560
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0561 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 561 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0561 : Poly :=
[
  term ((22080000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0561_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0561
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0562 : Poly :=
[
  term ((4093408243 : Rat) / 66378970) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 562 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0562 : Poly :=
[
  term ((4093408243 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-4093408243 : Rat) / 66378970) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0562_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0562
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0563 : Poly :=
[
  term ((-401630 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 563 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0563 : Poly :=
[
  term ((-803260 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((401630 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0563_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0563
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0564 : Poly :=
[
  term ((-27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 564 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0564 : Poly :=
[
  term ((-55065576192 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0564_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0564
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0565 : Poly :=
[
  term ((5228544 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 565 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0565 : Poly :=
[
  term ((10457088 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0565_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0565
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0566 : Poly :=
[
  term ((2387415184 : Rat) / 4741355) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 566 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0566 : Poly :=
[
  term ((4774830368 : Rat) / 4741355) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2387415184 : Rat) / 4741355) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0566_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0566
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0567 : Poly :=
[
  term ((-3173632 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0567 : Poly :=
[
  term ((-6347264 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3173632 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0567_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0567
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0568 : Poly :=
[
  term ((8185423488 : Rat) / 6637897) [(5, 1), (11, 2), (12, 1), (15, 3)]
]

/-- Partial product 568 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0568 : Poly :=
[
  term ((16370846976 : Rat) / 6637897) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 3)],
  term ((-8185423488 : Rat) / 6637897) [(5, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0568_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0568
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0569 : Poly :=
[
  term ((-7772160 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 569 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0569 : Poly :=
[
  term ((-15544320 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((7772160 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0569_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0569
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0570 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(5, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 570 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0570 : Poly :=
[
  term ((-27532788096 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(5, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0570_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0570
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0571 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0571 : Poly :=
[
  term ((5228544 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0571_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0571
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0572 : Poly :=
[
  term ((-47810314464 : Rat) / 33189485) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 572 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0572 : Poly :=
[
  term ((-95620628928 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((47810314464 : Rat) / 33189485) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0572_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0572
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0573 : Poly :=
[
  term ((9079296 : Rat) / 32699) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 573 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0573 : Poly :=
[
  term ((18158592 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9079296 : Rat) / 32699) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0573_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0573
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0574 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 574 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0574 : Poly :=
[
  term ((55065576192 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0574_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0574
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0575 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0575 : Poly :=
[
  term ((-10457088 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((5228544 : Rat) / 32699) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0575_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0575
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0576 : Poly :=
[
  term ((-8495477408 : Rat) / 33189485) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 576 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0576 : Poly :=
[
  term ((-16990954816 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((8495477408 : Rat) / 33189485) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0576_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0576
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0577 : Poly :=
[
  term ((1613312 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0577 : Poly :=
[
  term ((3226624 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1613312 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0577_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0577
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0578 : Poly :=
[
  term ((2046355872 : Rat) / 6637897) [(5, 1), (11, 2), (15, 3)]
]

/-- Partial product 578 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0578 : Poly :=
[
  term ((4092711744 : Rat) / 6637897) [(2, 1), (5, 1), (11, 2), (15, 3)],
  term ((-2046355872 : Rat) / 6637897) [(5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0578_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0578
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0579 : Poly :=
[
  term ((-1943040 : Rat) / 32699) [(5, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 579 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0579 : Poly :=
[
  term ((-3886080 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (15, 3), (16, 1)],
  term ((1943040 : Rat) / 32699) [(5, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0579_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0579
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0580 : Poly :=
[
  term ((-43027457307 : Rat) / 66378970) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 580 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0580 : Poly :=
[
  term ((-43027457307 : Rat) / 33189485) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((43027457307 : Rat) / 66378970) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0580_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0580
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0581 : Poly :=
[
  term ((3983932 : Rat) / 32699) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 581 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0581 : Poly :=
[
  term ((7967864 : Rat) / 32699) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3983932 : Rat) / 32699) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0581_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0581
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0582 : Poly :=
[
  term ((102552187827 : Rat) / 531031760) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 582 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0582 : Poly :=
[
  term ((102552187827 : Rat) / 265515880) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-102552187827 : Rat) / 531031760) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0582_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0582
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0583 : Poly :=
[
  term ((-2321075 : Rat) / 65398) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 583 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0583 : Poly :=
[
  term ((-2321075 : Rat) / 32699) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2321075 : Rat) / 65398) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0583_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0583
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0584 : Poly :=
[
  term ((-43027457307 : Rat) / 132757940) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 584 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0584 : Poly :=
[
  term ((-43027457307 : Rat) / 66378970) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((43027457307 : Rat) / 132757940) [(5, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0584_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0584
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0585 : Poly :=
[
  term ((1991966 : Rat) / 32699) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 585 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0585 : Poly :=
[
  term ((3983932 : Rat) / 32699) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1991966 : Rat) / 32699) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0585_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0585
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0586 : Poly :=
[
  term ((-31 : Rat) / 8) [(5, 1), (13, 1)]
]

/-- Partial product 586 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0586 : Poly :=
[
  term ((-31 : Rat) / 4) [(2, 1), (5, 1), (13, 1)],
  term ((31 : Rat) / 8) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0586_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0586
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0587 : Poly :=
[
  term ((-43027457307 : Rat) / 265515880) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 587 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0587 : Poly :=
[
  term ((-43027457307 : Rat) / 132757940) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((43027457307 : Rat) / 265515880) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0587_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0587
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0588 : Poly :=
[
  term ((995983 : Rat) / 32699) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 588 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0588 : Poly :=
[
  term ((1991966 : Rat) / 32699) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-995983 : Rat) / 32699) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0588_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0588
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0589 : Poly :=
[
  term ((43027457307 : Rat) / 66378970) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 589 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0589 : Poly :=
[
  term ((43027457307 : Rat) / 33189485) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-43027457307 : Rat) / 66378970) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0589_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0589
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0590 : Poly :=
[
  term ((-3983932 : Rat) / 32699) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0590 : Poly :=
[
  term ((-7967864 : Rat) / 32699) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((3983932 : Rat) / 32699) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0590_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0590
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0591 : Poly :=
[
  term ((-15426825261 : Rat) / 531031760) [(5, 1), (15, 1)]
]

/-- Partial product 591 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0591 : Poly :=
[
  term ((-15426825261 : Rat) / 265515880) [(2, 1), (5, 1), (15, 1)],
  term ((15426825261 : Rat) / 531031760) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0591_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0591
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0592 : Poly :=
[
  term ((123835 : Rat) / 65398) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 592 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0592 : Poly :=
[
  term ((123835 : Rat) / 32699) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-123835 : Rat) / 65398) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0592_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0592
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0593 : Poly :=
[
  term ((31 : Rat) / 20) [(5, 2)]
]

/-- Partial product 593 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0593 : Poly :=
[
  term ((31 : Rat) / 10) [(2, 1), (5, 2)],
  term ((-31 : Rat) / 20) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0593_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0593
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0594 : Poly :=
[
  term ((-46508088 : Rat) / 6637897) [(5, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 594 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0594 : Poly :=
[
  term ((-93016176 : Rat) / 6637897) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1)],
  term ((46508088 : Rat) / 6637897) [(5, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0594_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0594
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0595 : Poly :=
[
  term ((44160 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0595 : Poly :=
[
  term ((88320 : Rat) / 32699) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-44160 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0595_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0595
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0596 : Poly :=
[
  term ((11627022 : Rat) / 6637897) [(5, 2), (11, 1), (15, 1)]
]

/-- Partial product 596 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0596 : Poly :=
[
  term ((23254044 : Rat) / 6637897) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-11627022 : Rat) / 6637897) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0596_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0596
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0597 : Poly :=
[
  term ((-11040 : Rat) / 32699) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 597 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0597 : Poly :=
[
  term ((-22080 : Rat) / 32699) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((11040 : Rat) / 32699) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0597_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0597
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0598 : Poly :=
[
  term ((-31 : Rat) / 5) [(5, 2), (12, 1)]
]

/-- Partial product 598 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0598 : Poly :=
[
  term ((-62 : Rat) / 5) [(2, 1), (5, 2), (12, 1)],
  term ((31 : Rat) / 5) [(5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0598_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0598
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0599 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 599 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0599 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0599_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0599
        rs_R009_ueqv_R009NYYYY_generator_10_0500_0599 =
      rs_R009_ueqv_R009NYYYY_partial_10_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_10_0500_0599 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_10_0500,
  rs_R009_ueqv_R009NYYYY_partial_10_0501,
  rs_R009_ueqv_R009NYYYY_partial_10_0502,
  rs_R009_ueqv_R009NYYYY_partial_10_0503,
  rs_R009_ueqv_R009NYYYY_partial_10_0504,
  rs_R009_ueqv_R009NYYYY_partial_10_0505,
  rs_R009_ueqv_R009NYYYY_partial_10_0506,
  rs_R009_ueqv_R009NYYYY_partial_10_0507,
  rs_R009_ueqv_R009NYYYY_partial_10_0508,
  rs_R009_ueqv_R009NYYYY_partial_10_0509,
  rs_R009_ueqv_R009NYYYY_partial_10_0510,
  rs_R009_ueqv_R009NYYYY_partial_10_0511,
  rs_R009_ueqv_R009NYYYY_partial_10_0512,
  rs_R009_ueqv_R009NYYYY_partial_10_0513,
  rs_R009_ueqv_R009NYYYY_partial_10_0514,
  rs_R009_ueqv_R009NYYYY_partial_10_0515,
  rs_R009_ueqv_R009NYYYY_partial_10_0516,
  rs_R009_ueqv_R009NYYYY_partial_10_0517,
  rs_R009_ueqv_R009NYYYY_partial_10_0518,
  rs_R009_ueqv_R009NYYYY_partial_10_0519,
  rs_R009_ueqv_R009NYYYY_partial_10_0520,
  rs_R009_ueqv_R009NYYYY_partial_10_0521,
  rs_R009_ueqv_R009NYYYY_partial_10_0522,
  rs_R009_ueqv_R009NYYYY_partial_10_0523,
  rs_R009_ueqv_R009NYYYY_partial_10_0524,
  rs_R009_ueqv_R009NYYYY_partial_10_0525,
  rs_R009_ueqv_R009NYYYY_partial_10_0526,
  rs_R009_ueqv_R009NYYYY_partial_10_0527,
  rs_R009_ueqv_R009NYYYY_partial_10_0528,
  rs_R009_ueqv_R009NYYYY_partial_10_0529,
  rs_R009_ueqv_R009NYYYY_partial_10_0530,
  rs_R009_ueqv_R009NYYYY_partial_10_0531,
  rs_R009_ueqv_R009NYYYY_partial_10_0532,
  rs_R009_ueqv_R009NYYYY_partial_10_0533,
  rs_R009_ueqv_R009NYYYY_partial_10_0534,
  rs_R009_ueqv_R009NYYYY_partial_10_0535,
  rs_R009_ueqv_R009NYYYY_partial_10_0536,
  rs_R009_ueqv_R009NYYYY_partial_10_0537,
  rs_R009_ueqv_R009NYYYY_partial_10_0538,
  rs_R009_ueqv_R009NYYYY_partial_10_0539,
  rs_R009_ueqv_R009NYYYY_partial_10_0540,
  rs_R009_ueqv_R009NYYYY_partial_10_0541,
  rs_R009_ueqv_R009NYYYY_partial_10_0542,
  rs_R009_ueqv_R009NYYYY_partial_10_0543,
  rs_R009_ueqv_R009NYYYY_partial_10_0544,
  rs_R009_ueqv_R009NYYYY_partial_10_0545,
  rs_R009_ueqv_R009NYYYY_partial_10_0546,
  rs_R009_ueqv_R009NYYYY_partial_10_0547,
  rs_R009_ueqv_R009NYYYY_partial_10_0548,
  rs_R009_ueqv_R009NYYYY_partial_10_0549,
  rs_R009_ueqv_R009NYYYY_partial_10_0550,
  rs_R009_ueqv_R009NYYYY_partial_10_0551,
  rs_R009_ueqv_R009NYYYY_partial_10_0552,
  rs_R009_ueqv_R009NYYYY_partial_10_0553,
  rs_R009_ueqv_R009NYYYY_partial_10_0554,
  rs_R009_ueqv_R009NYYYY_partial_10_0555,
  rs_R009_ueqv_R009NYYYY_partial_10_0556,
  rs_R009_ueqv_R009NYYYY_partial_10_0557,
  rs_R009_ueqv_R009NYYYY_partial_10_0558,
  rs_R009_ueqv_R009NYYYY_partial_10_0559,
  rs_R009_ueqv_R009NYYYY_partial_10_0560,
  rs_R009_ueqv_R009NYYYY_partial_10_0561,
  rs_R009_ueqv_R009NYYYY_partial_10_0562,
  rs_R009_ueqv_R009NYYYY_partial_10_0563,
  rs_R009_ueqv_R009NYYYY_partial_10_0564,
  rs_R009_ueqv_R009NYYYY_partial_10_0565,
  rs_R009_ueqv_R009NYYYY_partial_10_0566,
  rs_R009_ueqv_R009NYYYY_partial_10_0567,
  rs_R009_ueqv_R009NYYYY_partial_10_0568,
  rs_R009_ueqv_R009NYYYY_partial_10_0569,
  rs_R009_ueqv_R009NYYYY_partial_10_0570,
  rs_R009_ueqv_R009NYYYY_partial_10_0571,
  rs_R009_ueqv_R009NYYYY_partial_10_0572,
  rs_R009_ueqv_R009NYYYY_partial_10_0573,
  rs_R009_ueqv_R009NYYYY_partial_10_0574,
  rs_R009_ueqv_R009NYYYY_partial_10_0575,
  rs_R009_ueqv_R009NYYYY_partial_10_0576,
  rs_R009_ueqv_R009NYYYY_partial_10_0577,
  rs_R009_ueqv_R009NYYYY_partial_10_0578,
  rs_R009_ueqv_R009NYYYY_partial_10_0579,
  rs_R009_ueqv_R009NYYYY_partial_10_0580,
  rs_R009_ueqv_R009NYYYY_partial_10_0581,
  rs_R009_ueqv_R009NYYYY_partial_10_0582,
  rs_R009_ueqv_R009NYYYY_partial_10_0583,
  rs_R009_ueqv_R009NYYYY_partial_10_0584,
  rs_R009_ueqv_R009NYYYY_partial_10_0585,
  rs_R009_ueqv_R009NYYYY_partial_10_0586,
  rs_R009_ueqv_R009NYYYY_partial_10_0587,
  rs_R009_ueqv_R009NYYYY_partial_10_0588,
  rs_R009_ueqv_R009NYYYY_partial_10_0589,
  rs_R009_ueqv_R009NYYYY_partial_10_0590,
  rs_R009_ueqv_R009NYYYY_partial_10_0591,
  rs_R009_ueqv_R009NYYYY_partial_10_0592,
  rs_R009_ueqv_R009NYYYY_partial_10_0593,
  rs_R009_ueqv_R009NYYYY_partial_10_0594,
  rs_R009_ueqv_R009NYYYY_partial_10_0595,
  rs_R009_ueqv_R009NYYYY_partial_10_0596,
  rs_R009_ueqv_R009NYYYY_partial_10_0597,
  rs_R009_ueqv_R009NYYYY_partial_10_0598,
  rs_R009_ueqv_R009NYYYY_partial_10_0599
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_10_0500_0599 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((47104 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((6868986254 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1219392 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3434493127 : Rat) / 66378970) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((304848 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 4) [(2, 1), (5, 1), (9, 1)],
  term ((-128 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((32 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-124021568 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((117760 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((604605144 : Rat) / 33189485) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-114816 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-62010784 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((58880 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((27591216 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((29440 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((124021568 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-117760 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((57743064 : Rat) / 33189485) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((2944 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((39 : Rat) / 4) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term (-10 : Rat) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-320 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((328 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term (-5 : Rat) [(2, 1), (5, 1), (9, 1), (12, 2)],
  term ((-160 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-5 : Rat) / 2) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-80 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 3)],
  term (10 : Rat) [(2, 1), (5, 1), (9, 1), (13, 2)],
  term ((320 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-4 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((8185423488 : Rat) / 6637897) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-7772160 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2046355872 : Rat) / 6637897) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((1943040 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((127568258304 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-24399360 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72423122952 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((13810152 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((63784129152 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-12199680 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((31892064576 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-6099840 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-127568258304 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1)],
  term ((24399360 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4317117537 : Rat) / 13275794) [(2, 1), (5, 1), (10, 1), (15, 1)],
  term ((2075626 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((23254044000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-22080000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-98989679312 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((18694736 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-11040000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-14904752526 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((2934096 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-5520000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23254044000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2)],
  term ((22080000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((4093408243 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-803260 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-55065576192 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((10457088 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4774830368 : Rat) / 4741355) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6347264 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((16370846976 : Rat) / 6637897) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 3)],
  term ((-15544320 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((5228544 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-95620628928 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((18158592 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((55065576192 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-10457088 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-16990954816 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((3226624 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(2, 1), (5, 1), (11, 2), (15, 3)],
  term ((-3886080 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (15, 3), (16, 1)],
  term ((-43027457307 : Rat) / 33189485) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((7967864 : Rat) / 32699) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((102552187827 : Rat) / 265515880) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-2321075 : Rat) / 32699) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43027457307 : Rat) / 66378970) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((3983932 : Rat) / 32699) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-31 : Rat) / 4) [(2, 1), (5, 1), (13, 1)],
  term ((-43027457307 : Rat) / 132757940) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((1991966 : Rat) / 32699) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((43027457307 : Rat) / 33189485) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-7967864 : Rat) / 32699) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15426825261 : Rat) / 265515880) [(2, 1), (5, 1), (15, 1)],
  term ((123835 : Rat) / 32699) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 10) [(2, 1), (5, 2)],
  term ((-93016176 : Rat) / 6637897) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1)],
  term ((88320 : Rat) / 32699) [(2, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((23254044 : Rat) / 6637897) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-22080 : Rat) / 32699) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62 : Rat) / 5) [(2, 1), (5, 2), (12, 1)],
  term ((7973016144 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-23552 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((609696 : Rat) / 32699) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3434493127 : Rat) / 132757940) [(5, 1), (8, 1), (15, 1)],
  term ((-152424 : Rat) / 32699) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 8) [(5, 1), (9, 1)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-302302572 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((57408 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((31005392 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-29440 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-13795608 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-14720 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28871532 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1472 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-39 : Rat) / 8) [(5, 1), (9, 1), (12, 1)],
  term (5 : Rat) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((160 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-164 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((5 : Rat) / 2) [(5, 1), (9, 1), (12, 2)],
  term ((80 : Rat) / 29) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((5 : Rat) / 4) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((40 : Rat) / 29) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term (-5 : Rat) [(5, 1), (9, 1), (13, 2)],
  term ((-160 : Rat) / 29) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((2 : Rat) / 29) [(5, 1), (9, 1), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1023177936 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-971520 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((12199680 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((36211561476 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6905076 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-31892064576 : Rat) / 33189485) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((6099840 : Rat) / 32699) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((3049920 : Rat) / 32699) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((-12199680 : Rat) / 32699) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((4317117537 : Rat) / 26551588) [(5, 1), (10, 1), (15, 1)],
  term ((-1037813 : Rat) / 32699) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((11040000 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((49494839656 : Rat) / 33189485) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9347368 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((5520000 : Rat) / 32699) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((7452376263 : Rat) / 33189485) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1467048 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((2760000 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-11040000 : Rat) / 32699) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4093408243 : Rat) / 66378970) [(5, 1), (11, 1), (15, 2)],
  term ((401630 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2387415184 : Rat) / 4741355) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((3173632 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8185423488 : Rat) / 6637897) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((7772160 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((47810314464 : Rat) / 33189485) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-9079296 : Rat) / 32699) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((5228544 : Rat) / 32699) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((8495477408 : Rat) / 33189485) [(5, 1), (11, 2), (15, 1)],
  term ((-1613312 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2046355872 : Rat) / 6637897) [(5, 1), (11, 2), (15, 3)],
  term ((1943040 : Rat) / 32699) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((43027457307 : Rat) / 66378970) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3983932 : Rat) / 32699) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-102552187827 : Rat) / 531031760) [(5, 1), (12, 1), (15, 1)],
  term ((2321075 : Rat) / 65398) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((43027457307 : Rat) / 132757940) [(5, 1), (12, 2), (15, 1)],
  term ((-1991966 : Rat) / 32699) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((31 : Rat) / 8) [(5, 1), (13, 1)],
  term ((43027457307 : Rat) / 265515880) [(5, 1), (13, 1), (15, 2)],
  term ((-995983 : Rat) / 32699) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43027457307 : Rat) / 66378970) [(5, 1), (13, 2), (15, 1)],
  term ((3983932 : Rat) / 32699) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((15426825261 : Rat) / 531031760) [(5, 1), (15, 1)],
  term ((-123835 : Rat) / 65398) [(5, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 20) [(5, 2)],
  term ((46508088 : Rat) / 6637897) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-44160 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11627022 : Rat) / 6637897) [(5, 2), (11, 1), (15, 1)],
  term ((11040 : Rat) / 32699) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 5) [(5, 2), (12, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 500 through 599. -/
theorem rs_R009_ueqv_R009NYYYY_block_10_0500_0599_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_10_0500_0599
      rs_R009_ueqv_R009NYYYY_block_10_0500_0599 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
