/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 16:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_16_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0500 : Poly :=
[
  term ((-1824 : Rat) / 7) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 500 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0500 : Poly :=
[
  term ((-3648 : Rat) / 7) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((1824 : Rat) / 7) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0500_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0500
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0501 : Poly :=
[
  term ((2736 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 501 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0501 : Poly :=
[
  term ((5472 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-2736 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0501_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0501
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0502 : Poly :=
[
  term ((-912 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 502 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0502 : Poly :=
[
  term ((-1824 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((912 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0502_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0502
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0503 : Poly :=
[
  term ((456 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 503 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0503 : Poly :=
[
  term ((912 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0503_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0503
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0504 : Poly :=
[
  term ((-108 : Rat) / 5) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 504 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0504 : Poly :=
[
  term ((-216 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((108 : Rat) / 5) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0504_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0504
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0505 : Poly :=
[
  term ((-1728 : Rat) / 7) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 505 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0505 : Poly :=
[
  term ((-3456 : Rat) / 7) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((1728 : Rat) / 7) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0505_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0505
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0506 : Poly :=
[
  term ((2592 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1)]
]

/-- Partial product 506 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0506 : Poly :=
[
  term ((5184 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((-2592 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0506_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0506
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0507 : Poly :=
[
  term ((-864 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 507 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0507 : Poly :=
[
  term ((-1728 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0507_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0507
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0508 : Poly :=
[
  term ((432 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 508 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0508 : Poly :=
[
  term ((864 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0508_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0508
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0509 : Poly :=
[
  term ((-2592 : Rat) / 5) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 509 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0509 : Poly :=
[
  term ((-5184 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((2592 : Rat) / 5) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0509_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0509
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0510 : Poly :=
[
  term ((864 : Rat) / 5) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0510 : Poly :=
[
  term ((1728 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0510_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0510
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0511 : Poly :=
[
  term ((-471 : Rat) / 5) [(1, 1), (11, 1)]
]

/-- Partial product 511 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0511 : Poly :=
[
  term ((-942 : Rat) / 5) [(1, 1), (6, 1), (11, 1)],
  term ((471 : Rat) / 5) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0511_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0511
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0512 : Poly :=
[
  term ((234 : Rat) / 5) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 512 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0512 : Poly :=
[
  term ((468 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-234 : Rat) / 5) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0512_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0512
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0513 : Poly :=
[
  term (-42 : Rat) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 513 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0513 : Poly :=
[
  term (-84 : Rat) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term (42 : Rat) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0513_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0513
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0514 : Poly :=
[
  term ((2 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 514 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0514 : Poly :=
[
  term ((4 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0514_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0514
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0515 : Poly :=
[
  term ((339 : Rat) / 5) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 515 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0515 : Poly :=
[
  term ((678 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-339 : Rat) / 5) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0515_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0515
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0516 : Poly :=
[
  term ((-1 : Rat) / 5) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 516 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0516 : Poly :=
[
  term ((-2 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((1 : Rat) / 5) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0516_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0516
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0517 : Poly :=
[
  term ((-1992 : Rat) / 7) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 517 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0517 : Poly :=
[
  term ((-3984 : Rat) / 7) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((1992 : Rat) / 7) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0517_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0517
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0518 : Poly :=
[
  term (576 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 518 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0518 : Poly :=
[
  term (1152 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term (-576 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0518_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0518
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0519 : Poly :=
[
  term (-192 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 519 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0519 : Poly :=
[
  term (-384 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0519_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0519
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0520 : Poly :=
[
  term (96 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 520 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0520 : Poly :=
[
  term (192 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0520_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0520
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0521 : Poly :=
[
  term ((-14544 : Rat) / 25) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 521 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0521 : Poly :=
[
  term ((-29088 : Rat) / 25) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((14544 : Rat) / 25) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0521_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0521
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0522 : Poly :=
[
  term ((4848 : Rat) / 25) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0522 : Poly :=
[
  term ((9696 : Rat) / 25) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4848 : Rat) / 25) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0522_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0522
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0523 : Poly :=
[
  term ((1719 : Rat) / 35) [(1, 1), (13, 1)]
]

/-- Partial product 523 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0523 : Poly :=
[
  term ((3438 : Rat) / 35) [(1, 1), (6, 1), (13, 1)],
  term ((-1719 : Rat) / 35) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0523_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0523
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0524 : Poly :=
[
  term ((-111 : Rat) / 5) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 524 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0524 : Poly :=
[
  term ((-222 : Rat) / 5) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((111 : Rat) / 5) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0524_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0524
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0525 : Poly :=
[
  term ((-48 : Rat) / 5) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 525 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0525 : Poly :=
[
  term ((-96 : Rat) / 5) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0525_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0525
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0526 : Poly :=
[
  term ((23 : Rat) / 5) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 526 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0526 : Poly :=
[
  term ((46 : Rat) / 5) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-23 : Rat) / 5) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0526_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0526
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0527 : Poly :=
[
  term ((-54 : Rat) / 5) [(1, 1), (15, 1)]
]

/-- Partial product 527 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0527 : Poly :=
[
  term ((-108 : Rat) / 5) [(1, 1), (6, 1), (15, 1)],
  term ((54 : Rat) / 5) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0527_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0527
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0528 : Poly :=
[
  term ((24 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0528 : Poly :=
[
  term ((48 : Rat) / 5) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0528_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0528
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0529 : Poly :=
[
  term ((117 : Rat) / 5) [(1, 2)]
]

/-- Partial product 529 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0529 : Poly :=
[
  term ((-117 : Rat) / 5) [(1, 2)],
  term ((234 : Rat) / 5) [(1, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0529_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0529
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0530 : Poly :=
[
  term ((-42 : Rat) / 5) [(1, 2), (2, 1)]
]

/-- Partial product 530 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0530 : Poly :=
[
  term ((42 : Rat) / 5) [(1, 2), (2, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (2, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0530_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0530
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0531 : Poly :=
[
  term ((288 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1)]
]

/-- Partial product 531 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0531 : Poly :=
[
  term ((576 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0531_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0531
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0532 : Poly :=
[
  term ((144 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 532 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0532 : Poly :=
[
  term ((288 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0532_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0532
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0533 : Poly :=
[
  term ((-48 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 533 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0533 : Poly :=
[
  term ((-96 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0533_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0533
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0534 : Poly :=
[
  term ((-96 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 534 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0534 : Poly :=
[
  term ((-192 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0534_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0534
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0535 : Poly :=
[
  term ((48 : Rat) / 35) [(1, 2), (2, 1), (5, 1), (13, 1)]
]

/-- Partial product 535 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0535 : Poly :=
[
  term ((96 : Rat) / 35) [(1, 2), (2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(1, 2), (2, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0535_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0535
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0536 : Poly :=
[
  term ((192 : Rat) / 7) [(1, 2), (2, 1), (9, 1), (13, 1)]
]

/-- Partial product 536 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0536 : Poly :=
[
  term ((384 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-192 : Rat) / 7) [(1, 2), (2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0536_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0536
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0537 : Poly :=
[
  term ((-288 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 537 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0537 : Poly :=
[
  term ((-576 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0537_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0537
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0538 : Poly :=
[
  term ((96 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 538 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0538 : Poly :=
[
  term ((192 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0538_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0538
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0539 : Poly :=
[
  term ((-48 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 539 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0539 : Poly :=
[
  term ((-96 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0539_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0539
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0540 : Poly :=
[
  term ((1728 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 540 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0540 : Poly :=
[
  term ((3456 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0540_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0540
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0541 : Poly :=
[
  term ((-576 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 541 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0541 : Poly :=
[
  term ((-1152 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0541_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0541
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0542 : Poly :=
[
  term ((6 : Rat) / 5) [(1, 2), (2, 1), (14, 1)]
]

/-- Partial product 542 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0542 : Poly :=
[
  term ((12 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0542_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0542
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0543 : Poly :=
[
  term ((2 : Rat) / 5) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 543 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0543 : Poly :=
[
  term ((4 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0543_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0543
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0544 : Poly :=
[
  term ((-576 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1)]
]

/-- Partial product 544 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0544 : Poly :=
[
  term ((-1152 : Rat) / 5) [(1, 2), (2, 2), (6, 1), (9, 1), (15, 1)],
  term ((576 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0544_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0544
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0545 : Poly :=
[
  term ((192 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 545 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0545 : Poly :=
[
  term ((384 : Rat) / 5) [(1, 2), (2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0545_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0545
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0546 : Poly :=
[
  term (-144 : Rat) [(1, 2), (3, 1), (9, 1)]
]

/-- Partial product 546 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0546 : Poly :=
[
  term (-288 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term (144 : Rat) [(1, 2), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0546_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0546
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0547 : Poly :=
[
  term (-72 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 547 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0547 : Poly :=
[
  term (-144 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1), (14, 1)],
  term (72 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0547_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0547
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0548 : Poly :=
[
  term (24 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 548 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0548 : Poly :=
[
  term (48 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0548_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0548
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0549 : Poly :=
[
  term (48 : Rat) [(1, 2), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 549 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0549 : Poly :=
[
  term (96 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0549_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0549
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0550 : Poly :=
[
  term ((-24 : Rat) / 7) [(1, 2), (5, 1), (13, 1)]
]

/-- Partial product 550 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0550 : Poly :=
[
  term ((-48 : Rat) / 7) [(1, 2), (5, 1), (6, 1), (13, 1)],
  term ((24 : Rat) / 7) [(1, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0550_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0550
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0551 : Poly :=
[
  term ((-480 : Rat) / 7) [(1, 2), (9, 1), (13, 1)]
]

/-- Partial product 551 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0551 : Poly :=
[
  term ((-960 : Rat) / 7) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((480 : Rat) / 7) [(1, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0551_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0551
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0552 : Poly :=
[
  term (144 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 552 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0552 : Poly :=
[
  term (288 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1), (14, 1)],
  term (-144 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0552_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0552
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0553 : Poly :=
[
  term (-48 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 553 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0553 : Poly :=
[
  term (-96 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0553_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0553
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0554 : Poly :=
[
  term (24 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 554 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0554 : Poly :=
[
  term (48 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0554_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0554
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0555 : Poly :=
[
  term (-144 : Rat) [(1, 2), (9, 1), (15, 1)]
]

/-- Partial product 555 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0555 : Poly :=
[
  term (-288 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term (144 : Rat) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0555_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0555
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0556 : Poly :=
[
  term (48 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0556 : Poly :=
[
  term (96 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0556_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0556
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0557 : Poly :=
[
  term (-21 : Rat) [(1, 2), (14, 1)]
]

/-- Partial product 557 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0557 : Poly :=
[
  term (-42 : Rat) [(1, 2), (6, 1), (14, 1)],
  term (21 : Rat) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0557_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0557
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0558 : Poly :=
[
  term ((1 : Rat) / 5) [(1, 2), (16, 1)]
]

/-- Partial product 558 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0558 : Poly :=
[
  term ((2 : Rat) / 5) [(1, 2), (6, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0558_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0558
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0559 : Poly :=
[
  term ((213 : Rat) / 5) [(2, 1)]
]

/-- Partial product 559 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0559 : Poly :=
[
  term ((-213 : Rat) / 5) [(2, 1)],
  term ((426 : Rat) / 5) [(2, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0559_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0559
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0560 : Poly :=
[
  term ((48 : Rat) / 35) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 560 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0560 : Poly :=
[
  term ((96 : Rat) / 35) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0560_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0560
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0561 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 561 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0561 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0561_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0561
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0562 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 562 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0562 : Poly :=
[
  term ((192 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0562_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0562
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0563 : Poly :=
[
  term (-12 : Rat) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 563 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0563 : Poly :=
[
  term (-24 : Rat) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0563_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0563
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0564 : Poly :=
[
  term ((1032 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 564 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0564 : Poly :=
[
  term ((2064 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1032 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0564_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0564
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0565 : Poly :=
[
  term ((-288 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 565 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0565 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0565_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0565
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0566 : Poly :=
[
  term ((96 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 566 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0566 : Poly :=
[
  term ((192 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0566_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0566
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0567 : Poly :=
[
  term ((-48 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 567 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0567 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0567_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0567
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0568 : Poly :=
[
  term (6 : Rat) [(2, 1), (3, 1), (7, 1), (14, 1)]
]

/-- Partial product 568 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0568 : Poly :=
[
  term (12 : Rat) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0568_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0568
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0569 : Poly :=
[
  term ((-4 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

/-- Partial product 569 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0569 : Poly :=
[
  term ((-8 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((4 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0569_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0569
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0570 : Poly :=
[
  term ((-144 : Rat) / 5) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 570 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0570 : Poly :=
[
  term ((-288 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((144 : Rat) / 5) [(2, 1), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0570_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0570
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0571 : Poly :=
[
  term ((2304 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 571 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0571 : Poly :=
[
  term ((4608 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2304 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0571_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0571
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0572 : Poly :=
[
  term ((-768 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0572 : Poly :=
[
  term ((-1536 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0572_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0572
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0573 : Poly :=
[
  term ((-1152 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 573 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0573 : Poly :=
[
  term ((-2304 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0573_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0573
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0574 : Poly :=
[
  term ((384 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0574 : Poly :=
[
  term ((768 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0574_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0574
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0575 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 575 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0575 : Poly :=
[
  term ((-1152 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0575_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0575
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0576 : Poly :=
[
  term ((192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0576 : Poly :=
[
  term ((384 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0576_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0576
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0577 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1)]
]

/-- Partial product 577 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0577 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0577_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0577
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0578 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 578 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0578 : Poly :=
[
  term ((-1152 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0578_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0578
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0579 : Poly :=
[
  term ((192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0579 : Poly :=
[
  term ((384 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0579_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0579
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0580 : Poly :=
[
  term ((144 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 580 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0580 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0580_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0580
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0581 : Poly :=
[
  term ((-48 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 581 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0581 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0581_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0581
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0582 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 582 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0582 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0582_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0582
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0583 : Poly :=
[
  term ((-72 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 583 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0583 : Poly :=
[
  term ((-144 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((72 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0583_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0583
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0584 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 584 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0584 : Poly :=
[
  term ((48 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0584_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0584
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0585 : Poly :=
[
  term ((48 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 585 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0585 : Poly :=
[
  term ((96 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0585_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0585
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0586 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 586 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0586 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (3, 2), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0586_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0586
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0587 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 587 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0587 : Poly :=
[
  term ((192 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(2, 1), (3, 2), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0587_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0587
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0588 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1)]
]

/-- Partial product 588 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0588 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0588_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0588
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0589 : Poly :=
[
  term ((144 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 589 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0589 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0589_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0589
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0590 : Poly :=
[
  term ((-48 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 590 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0590 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0590_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0590
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0591 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 591 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0591 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0591_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0591
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0592 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (3, 2), (9, 1), (15, 1)]
]

/-- Partial product 592 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0592 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0592_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0592
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0593 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 593 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0593 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0593_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0593
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0594 : Poly :=
[
  term ((6 : Rat) / 5) [(2, 1), (4, 1)]
]

/-- Partial product 594 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0594 : Poly :=
[
  term ((-6 : Rat) / 5) [(2, 1), (4, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0594_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0594
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0595 : Poly :=
[
  term ((-12 : Rat) / 5) [(2, 1), (4, 1), (14, 1)]
]

/-- Partial product 595 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0595 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0595_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0595
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0596 : Poly :=
[
  term ((48 : Rat) / 35) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 596 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0596 : Poly :=
[
  term ((96 : Rat) / 35) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0596_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0596
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0597 : Poly :=
[
  term ((-24 : Rat) / 35) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 597 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0597 : Poly :=
[
  term ((-48 : Rat) / 35) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((24 : Rat) / 35) [(2, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0597_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0597
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0598 : Poly :=
[
  term ((12 : Rat) / 5) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 598 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0598 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0598_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0598
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0599 : Poly :=
[
  term ((108 : Rat) / 5) [(2, 1), (6, 1)]
]

/-- Partial product 599 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0599 : Poly :=
[
  term ((-108 : Rat) / 5) [(2, 1), (6, 1)],
  term ((216 : Rat) / 5) [(2, 1), (6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0599_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0599
        rs_R006_ueqv_R006_generator_16_0500_0599 =
      rs_R006_ueqv_R006_partial_16_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_16_0500_0599 : List Poly :=
[
  rs_R006_ueqv_R006_partial_16_0500,
  rs_R006_ueqv_R006_partial_16_0501,
  rs_R006_ueqv_R006_partial_16_0502,
  rs_R006_ueqv_R006_partial_16_0503,
  rs_R006_ueqv_R006_partial_16_0504,
  rs_R006_ueqv_R006_partial_16_0505,
  rs_R006_ueqv_R006_partial_16_0506,
  rs_R006_ueqv_R006_partial_16_0507,
  rs_R006_ueqv_R006_partial_16_0508,
  rs_R006_ueqv_R006_partial_16_0509,
  rs_R006_ueqv_R006_partial_16_0510,
  rs_R006_ueqv_R006_partial_16_0511,
  rs_R006_ueqv_R006_partial_16_0512,
  rs_R006_ueqv_R006_partial_16_0513,
  rs_R006_ueqv_R006_partial_16_0514,
  rs_R006_ueqv_R006_partial_16_0515,
  rs_R006_ueqv_R006_partial_16_0516,
  rs_R006_ueqv_R006_partial_16_0517,
  rs_R006_ueqv_R006_partial_16_0518,
  rs_R006_ueqv_R006_partial_16_0519,
  rs_R006_ueqv_R006_partial_16_0520,
  rs_R006_ueqv_R006_partial_16_0521,
  rs_R006_ueqv_R006_partial_16_0522,
  rs_R006_ueqv_R006_partial_16_0523,
  rs_R006_ueqv_R006_partial_16_0524,
  rs_R006_ueqv_R006_partial_16_0525,
  rs_R006_ueqv_R006_partial_16_0526,
  rs_R006_ueqv_R006_partial_16_0527,
  rs_R006_ueqv_R006_partial_16_0528,
  rs_R006_ueqv_R006_partial_16_0529,
  rs_R006_ueqv_R006_partial_16_0530,
  rs_R006_ueqv_R006_partial_16_0531,
  rs_R006_ueqv_R006_partial_16_0532,
  rs_R006_ueqv_R006_partial_16_0533,
  rs_R006_ueqv_R006_partial_16_0534,
  rs_R006_ueqv_R006_partial_16_0535,
  rs_R006_ueqv_R006_partial_16_0536,
  rs_R006_ueqv_R006_partial_16_0537,
  rs_R006_ueqv_R006_partial_16_0538,
  rs_R006_ueqv_R006_partial_16_0539,
  rs_R006_ueqv_R006_partial_16_0540,
  rs_R006_ueqv_R006_partial_16_0541,
  rs_R006_ueqv_R006_partial_16_0542,
  rs_R006_ueqv_R006_partial_16_0543,
  rs_R006_ueqv_R006_partial_16_0544,
  rs_R006_ueqv_R006_partial_16_0545,
  rs_R006_ueqv_R006_partial_16_0546,
  rs_R006_ueqv_R006_partial_16_0547,
  rs_R006_ueqv_R006_partial_16_0548,
  rs_R006_ueqv_R006_partial_16_0549,
  rs_R006_ueqv_R006_partial_16_0550,
  rs_R006_ueqv_R006_partial_16_0551,
  rs_R006_ueqv_R006_partial_16_0552,
  rs_R006_ueqv_R006_partial_16_0553,
  rs_R006_ueqv_R006_partial_16_0554,
  rs_R006_ueqv_R006_partial_16_0555,
  rs_R006_ueqv_R006_partial_16_0556,
  rs_R006_ueqv_R006_partial_16_0557,
  rs_R006_ueqv_R006_partial_16_0558,
  rs_R006_ueqv_R006_partial_16_0559,
  rs_R006_ueqv_R006_partial_16_0560,
  rs_R006_ueqv_R006_partial_16_0561,
  rs_R006_ueqv_R006_partial_16_0562,
  rs_R006_ueqv_R006_partial_16_0563,
  rs_R006_ueqv_R006_partial_16_0564,
  rs_R006_ueqv_R006_partial_16_0565,
  rs_R006_ueqv_R006_partial_16_0566,
  rs_R006_ueqv_R006_partial_16_0567,
  rs_R006_ueqv_R006_partial_16_0568,
  rs_R006_ueqv_R006_partial_16_0569,
  rs_R006_ueqv_R006_partial_16_0570,
  rs_R006_ueqv_R006_partial_16_0571,
  rs_R006_ueqv_R006_partial_16_0572,
  rs_R006_ueqv_R006_partial_16_0573,
  rs_R006_ueqv_R006_partial_16_0574,
  rs_R006_ueqv_R006_partial_16_0575,
  rs_R006_ueqv_R006_partial_16_0576,
  rs_R006_ueqv_R006_partial_16_0577,
  rs_R006_ueqv_R006_partial_16_0578,
  rs_R006_ueqv_R006_partial_16_0579,
  rs_R006_ueqv_R006_partial_16_0580,
  rs_R006_ueqv_R006_partial_16_0581,
  rs_R006_ueqv_R006_partial_16_0582,
  rs_R006_ueqv_R006_partial_16_0583,
  rs_R006_ueqv_R006_partial_16_0584,
  rs_R006_ueqv_R006_partial_16_0585,
  rs_R006_ueqv_R006_partial_16_0586,
  rs_R006_ueqv_R006_partial_16_0587,
  rs_R006_ueqv_R006_partial_16_0588,
  rs_R006_ueqv_R006_partial_16_0589,
  rs_R006_ueqv_R006_partial_16_0590,
  rs_R006_ueqv_R006_partial_16_0591,
  rs_R006_ueqv_R006_partial_16_0592,
  rs_R006_ueqv_R006_partial_16_0593,
  rs_R006_ueqv_R006_partial_16_0594,
  rs_R006_ueqv_R006_partial_16_0595,
  rs_R006_ueqv_R006_partial_16_0596,
  rs_R006_ueqv_R006_partial_16_0597,
  rs_R006_ueqv_R006_partial_16_0598,
  rs_R006_ueqv_R006_partial_16_0599
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_16_0500_0599 : Poly :=
[
  term ((-3648 : Rat) / 7) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((5472 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1824 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((912 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-216 : Rat) / 5) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((-3456 : Rat) / 7) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((5184 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-942 : Rat) / 5) [(1, 1), (6, 1), (11, 1)],
  term ((468 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term (-84 : Rat) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((678 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-3984 : Rat) / 7) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term (1152 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term (-384 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-29088 : Rat) / 25) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((9696 : Rat) / 25) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3438 : Rat) / 35) [(1, 1), (6, 1), (13, 1)],
  term ((-222 : Rat) / 5) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((46 : Rat) / 5) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(1, 1), (6, 1), (15, 1)],
  term ((48 : Rat) / 5) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 7) [(1, 1), (9, 1), (13, 2)],
  term ((-2736 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((912 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-456 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((108 : Rat) / 5) [(1, 1), (9, 1), (14, 1)],
  term ((1728 : Rat) / 7) [(1, 1), (9, 2), (13, 1)],
  term ((-2592 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((2592 : Rat) / 5) [(1, 1), (9, 2), (15, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((471 : Rat) / 5) [(1, 1), (11, 1)],
  term ((-234 : Rat) / 5) [(1, 1), (11, 1), (12, 1)],
  term (42 : Rat) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-339 : Rat) / 5) [(1, 1), (11, 1), (14, 1)],
  term ((1 : Rat) / 5) [(1, 1), (11, 1), (16, 1)],
  term ((1992 : Rat) / 7) [(1, 1), (12, 1), (13, 1)],
  term (-576 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term (192 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((14544 : Rat) / 25) [(1, 1), (12, 1), (15, 1)],
  term ((-4848 : Rat) / 25) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1719 : Rat) / 35) [(1, 1), (13, 1)],
  term ((111 : Rat) / 5) [(1, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23 : Rat) / 5) [(1, 1), (13, 1), (16, 1)],
  term ((54 : Rat) / 5) [(1, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((-117 : Rat) / 5) [(1, 2)],
  term ((42 : Rat) / 5) [(1, 2), (2, 1)],
  term ((576 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((288 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 2), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((96 : Rat) / 35) [(1, 2), (2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(1, 2), (2, 1), (5, 1), (13, 1)],
  term ((-84 : Rat) / 5) [(1, 2), (2, 1), (6, 1)],
  term ((384 : Rat) / 7) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 2), (2, 1), (6, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((576 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (2, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (2, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(1, 2), (2, 2), (6, 1), (9, 1), (15, 1)],
  term ((384 : Rat) / 5) [(1, 2), (2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term (-288 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term (-144 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1), (14, 1)],
  term (48 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term (96 : Rat) [(1, 2), (3, 1), (6, 1), (9, 1), (16, 1)],
  term (144 : Rat) [(1, 2), (3, 1), (9, 1)],
  term (72 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term (-24 : Rat) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 2), (5, 1), (6, 1), (13, 1)],
  term ((24 : Rat) / 7) [(1, 2), (5, 1), (13, 1)],
  term ((234 : Rat) / 5) [(1, 2), (6, 1)],
  term ((-960 : Rat) / 7) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term (288 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1), (14, 1)],
  term (-96 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (-288 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term (96 : Rat) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-42 : Rat) [(1, 2), (6, 1), (14, 1)],
  term ((2 : Rat) / 5) [(1, 2), (6, 1), (16, 1)],
  term ((480 : Rat) / 7) [(1, 2), (9, 1), (13, 1)],
  term (-144 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term (48 : Rat) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term (144 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (-48 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (21 : Rat) [(1, 2), (14, 1)],
  term ((-1 : Rat) / 5) [(1, 2), (16, 1)],
  term ((-213 : Rat) / 5) [(2, 1)],
  term ((96 : Rat) / 35) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((2064 : Rat) / 35) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((4608 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1536 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((768 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-1152 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((384 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(2, 1), (3, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (7, 1)],
  term ((-1032 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((4 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((144 : Rat) / 5) [(2, 1), (3, 1), (9, 1)],
  term ((-2304 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((768 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-384 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1)],
  term ((288 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(2, 1), (3, 2), (6, 2), (9, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(2, 1), (3, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-144 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(2, 1), (4, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (6, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (14, 1)],
  term ((96 : Rat) / 35) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((24 : Rat) / 5) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-48 : Rat) / 35) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 35) [(2, 1), (5, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(2, 1), (5, 1), (15, 1)],
  term ((318 : Rat) / 5) [(2, 1), (6, 1)],
  term ((216 : Rat) / 5) [(2, 1), (6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 500 through 599. -/
theorem rs_R006_ueqv_R006_block_16_0500_0599_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_16_0500_0599
      rs_R006_ueqv_R006_block_16_0500_0599 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
