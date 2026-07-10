/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 25:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_25_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0500 : Poly :=
[
  term (-45 : Rat) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 500 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0500 : Poly :=
[
  term (-90 : Rat) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term (45 : Rat) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0500_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0500
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0501 : Poly :=
[
  term ((1 : Rat) / 3) [(4, 1)]
]

/-- Partial product 501 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0501 : Poly :=
[
  term ((-1 : Rat) / 3) [(4, 1)],
  term ((2 : Rat) / 3) [(4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0501_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0501
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0502 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 502 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0502 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0502_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0502
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0503 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 503 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0503 : Poly :=
[
  term ((-8 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0503_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0503
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0504 : Poly :=
[
  term (1 : Rat) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 504 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0504 : Poly :=
[
  term (-1 : Rat) [(4, 1), (7, 1), (11, 1)],
  term (2 : Rat) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0504_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0504
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0505 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 505 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0505 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0505_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0505
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0506 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 506 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0506 : Poly :=
[
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0506_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0506
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0507 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 507 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0507 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0507_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0507
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0508 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 508 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0508 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0508_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0508
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0509 : Poly :=
[
  term (-1 : Rat) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 509 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0509 : Poly :=
[
  term (-2 : Rat) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term (1 : Rat) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0509_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0509
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0510 : Poly :=
[
  term ((3 : Rat) / 2) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 510 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0510 : Poly :=
[
  term (3 : Rat) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0510_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0510
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0511 : Poly :=
[
  term ((-86 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 511 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0511 : Poly :=
[
  term ((-172 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((86 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0511_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0511
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0512 : Poly :=
[
  term (21 : Rat) [(4, 1), (10, 1), (13, 2)]
]

/-- Partial product 512 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0512 : Poly :=
[
  term (42 : Rat) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term (-21 : Rat) [(4, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0512_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0512
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0513 : Poly :=
[
  term ((301207 : Rat) / 1540) [(4, 1), (10, 1), (14, 1)]
]

/-- Partial product 513 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0513 : Poly :=
[
  term ((301207 : Rat) / 770) [(4, 1), (10, 1), (12, 1), (14, 1)],
  term ((-301207 : Rat) / 1540) [(4, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0513_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0513
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0514 : Poly :=
[
  term (-3 : Rat) [(4, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 514 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0514 : Poly :=
[
  term (-6 : Rat) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term (3 : Rat) [(4, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0514_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0514
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0515 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (10, 1), (15, 2)]
]

/-- Partial product 515 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0515 : Poly :=
[
  term ((8 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0515_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0515
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0516 : Poly :=
[
  term (-21 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 516 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0516 : Poly :=
[
  term (21 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term (-42 : Rat) [(4, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0516_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0516
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0517 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 517 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0517 : Poly :=
[
  term ((3 : Rat) / 2) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0517_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0517
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0518 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 518 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0518 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0518_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0518
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0519 : Poly :=
[
  term ((35 : Rat) / 2) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 519 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0519 : Poly :=
[
  term (35 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-35 : Rat) / 2) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0519_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0519
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0520 : Poly :=
[
  term (28 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 520 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0520 : Poly :=
[
  term (56 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0520_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0520
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0521 : Poly :=
[
  term ((11 : Rat) / 12) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 521 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0521 : Poly :=
[
  term ((11 : Rat) / 6) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 12) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0521_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0521
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0522 : Poly :=
[
  term (3 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 522 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0522 : Poly :=
[
  term (6 : Rat) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0522_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0522
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0523 : Poly :=
[
  term (-1 : Rat) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 523 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0523 : Poly :=
[
  term (-2 : Rat) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term (1 : Rat) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0523_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0523
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0524 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (12, 1)]
]

/-- Partial product 524 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0524 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (12, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0524_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0524
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0525 : Poly :=
[
  term (21 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 525 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0525 : Poly :=
[
  term (-21 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term (42 : Rat) [(4, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0525_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0525
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0526 : Poly :=
[
  term ((3 : Rat) / 2) [(4, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 526 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0526 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term (3 : Rat) [(4, 1), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0526_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0526
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0527 : Poly :=
[
  term ((-2 : Rat) / 3) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 527 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0527 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (12, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0527_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0527
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0528 : Poly :=
[
  term ((2 : Rat) / 3) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 528 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0528 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0528_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0528
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0529 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 529 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0529 : Poly :=
[
  term (-3 : Rat) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0529_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0529
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0530 : Poly :=
[
  term ((-35 : Rat) / 2) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 530 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0530 : Poly :=
[
  term (-35 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((35 : Rat) / 2) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0530_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0530
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0531 : Poly :=
[
  term (-21 : Rat) [(4, 1), (13, 2), (14, 1)]
]

/-- Partial product 531 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0531 : Poly :=
[
  term (-42 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1)],
  term (21 : Rat) [(4, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0531_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0531
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0532 : Poly :=
[
  term ((-295047 : Rat) / 6160) [(4, 1), (14, 1)]
]

/-- Partial product 532 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0532 : Poly :=
[
  term ((-295047 : Rat) / 3080) [(4, 1), (12, 1), (14, 1)],
  term ((295047 : Rat) / 6160) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0532_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0532
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0533 : Poly :=
[
  term ((-9 : Rat) / 4) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 533 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0533 : Poly :=
[
  term ((-9 : Rat) / 2) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((9 : Rat) / 4) [(4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0533_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0533
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0534 : Poly :=
[
  term ((-301207 : Rat) / 3080) [(4, 1), (14, 2)]
]

/-- Partial product 534 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0534 : Poly :=
[
  term ((-301207 : Rat) / 1540) [(4, 1), (12, 1), (14, 2)],
  term ((301207 : Rat) / 3080) [(4, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0534_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0534
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0535 : Poly :=
[
  term (1 : Rat) [(4, 1), (15, 2)]
]

/-- Partial product 535 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0535 : Poly :=
[
  term (2 : Rat) [(4, 1), (12, 1), (15, 2)],
  term (-1 : Rat) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0535_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0535
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0536 : Poly :=
[
  term ((-1 : Rat) / 3) [(5, 1), (7, 1), (10, 1)]
]

/-- Partial product 536 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0536 : Poly :=
[
  term ((1 : Rat) / 3) [(5, 1), (7, 1), (10, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (7, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0536_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0536
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0537 : Poly :=
[
  term ((-888221 : Rat) / 9240) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 537 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0537 : Poly :=
[
  term ((-888221 : Rat) / 4620) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((888221 : Rat) / 9240) [(5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0537_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0537
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0538 : Poly :=
[
  term ((-21 : Rat) / 2) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 538 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0538 : Poly :=
[
  term (-21 : Rat) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((21 : Rat) / 2) [(5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0538_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0538
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0539 : Poly :=
[
  term ((-3 : Rat) / 4) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 539 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0539 : Poly :=
[
  term ((-3 : Rat) / 2) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 4) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0539_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0539
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0540 : Poly :=
[
  term ((902081 : Rat) / 4620) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 540 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0540 : Poly :=
[
  term ((902081 : Rat) / 2310) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-902081 : Rat) / 4620) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0540_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0540
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0541 : Poly :=
[
  term (-2 : Rat) [(5, 1), (11, 1)]
]

/-- Partial product 541 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0541 : Poly :=
[
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-4 : Rat) [(5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0541_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0541
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0542 : Poly :=
[
  term ((4 : Rat) / 3) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 542 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0542 : Poly :=
[
  term ((-4 : Rat) / 3) [(5, 1), (11, 1), (12, 1)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0542_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0542
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0543 : Poly :=
[
  term ((-8 : Rat) / 3) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 543 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0543 : Poly :=
[
  term ((-16 : Rat) / 3) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0543_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0543
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0544 : Poly :=
[
  term ((-25 : Rat) / 3) [(5, 1), (13, 1)]
]

/-- Partial product 544 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0544 : Poly :=
[
  term ((-50 : Rat) / 3) [(5, 1), (12, 1), (13, 1)],
  term ((25 : Rat) / 3) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0544_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0544
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0545 : Poly :=
[
  term ((21 : Rat) / 2) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 545 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0545 : Poly :=
[
  term (21 : Rat) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21 : Rat) / 2) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0545_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0545
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0546 : Poly :=
[
  term ((-906701 : Rat) / 9240) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 546 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0546 : Poly :=
[
  term ((-906701 : Rat) / 4620) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((906701 : Rat) / 9240) [(5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0546_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0546
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0547 : Poly :=
[
  term ((3 : Rat) / 4) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 547 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0547 : Poly :=
[
  term ((3 : Rat) / 2) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0547_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0547
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0548 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 548 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0548 : Poly :=
[
  term ((2 : Rat) / 3) [(7, 1), (9, 1), (10, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0548_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0548
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0549 : Poly :=
[
  term ((7 : Rat) / 3) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 549 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0549 : Poly :=
[
  term ((14 : Rat) / 3) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-7 : Rat) / 3) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0549_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0549
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0550 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 550 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0550 : Poly :=
[
  term ((2 : Rat) / 3) [(7, 1), (10, 1), (11, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0550_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0550
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0551 : Poly :=
[
  term ((77 : Rat) / 60) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 551 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0551 : Poly :=
[
  term ((77 : Rat) / 30) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-77 : Rat) / 60) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0551_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0551
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0552 : Poly :=
[
  term ((-7 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 552 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0552 : Poly :=
[
  term ((-14 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((7 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0552_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0552
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0553 : Poly :=
[
  term ((-1 : Rat) / 4) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 553 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0553 : Poly :=
[
  term ((-1 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1 : Rat) / 4) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0553_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0553
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0554 : Poly :=
[
  term ((-199 : Rat) / 60) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 554 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0554 : Poly :=
[
  term ((-199 : Rat) / 30) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((199 : Rat) / 60) [(7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0554_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0554
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0555 : Poly :=
[
  term ((131 : Rat) / 15) [(7, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 555 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0555 : Poly :=
[
  term ((262 : Rat) / 15) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-131 : Rat) / 15) [(7, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0555_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0555
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0556 : Poly :=
[
  term (-3 : Rat) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 556 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0556 : Poly :=
[
  term (-6 : Rat) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0556_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0556
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0557 : Poly :=
[
  term ((7 : Rat) / 12) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 557 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0557 : Poly :=
[
  term ((7 : Rat) / 6) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7 : Rat) / 12) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0557_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0557
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0558 : Poly :=
[
  term ((11 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 558 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0558 : Poly :=
[
  term ((11 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0558_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0558
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0559 : Poly :=
[
  term ((7 : Rat) / 4) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 559 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0559 : Poly :=
[
  term ((7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0559_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0559
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0560 : Poly :=
[
  term ((-847 : Rat) / 40) [(7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 560 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0560 : Poly :=
[
  term ((-847 : Rat) / 20) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((847 : Rat) / 40) [(7, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0560_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0560
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0561 : Poly :=
[
  term (3 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0561 : Poly :=
[
  term (6 : Rat) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0561_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0561
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0562 : Poly :=
[
  term ((2881 : Rat) / 120) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 562 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0562 : Poly :=
[
  term ((2881 : Rat) / 60) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2881 : Rat) / 120) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0562_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0562
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0563 : Poly :=
[
  term ((-11 : Rat) / 2) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0563 : Poly :=
[
  term (-11 : Rat) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 2) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0563_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0563
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0564 : Poly :=
[
  term ((149 : Rat) / 24) [(7, 1), (11, 1)]
]

/-- Partial product 564 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0564 : Poly :=
[
  term ((-149 : Rat) / 24) [(7, 1), (11, 1)],
  term ((149 : Rat) / 12) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0564_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0564
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0565 : Poly :=
[
  term ((76 : Rat) / 15) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 565 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0565 : Poly :=
[
  term ((-76 : Rat) / 15) [(7, 1), (11, 1), (12, 1)],
  term ((152 : Rat) / 15) [(7, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0565_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0565
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0566 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 566 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0566 : Poly :=
[
  term ((7 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0566_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0566
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0567 : Poly :=
[
  term ((-629 : Rat) / 60) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 567 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0567 : Poly :=
[
  term ((629 : Rat) / 60) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-629 : Rat) / 30) [(7, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0567_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0567
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0568 : Poly :=
[
  term (3 : Rat) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 568 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0568 : Poly :=
[
  term (-3 : Rat) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0568_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0568
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0569 : Poly :=
[
  term ((7 : Rat) / 10) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 569 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0569 : Poly :=
[
  term ((-7 : Rat) / 10) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((7 : Rat) / 5) [(7, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0569_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0569
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0570 : Poly :=
[
  term ((-11 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 570 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0570 : Poly :=
[
  term ((11 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0570_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0570
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0571 : Poly :=
[
  term ((-77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 571 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0571 : Poly :=
[
  term ((-77 : Rat) / 30) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0571_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0571
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0572 : Poly :=
[
  term ((-7 : Rat) / 8) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 572 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0572 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((7 : Rat) / 8) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0572_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0572
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0573 : Poly :=
[
  term ((-215 : Rat) / 16) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 573 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0573 : Poly :=
[
  term ((-215 : Rat) / 8) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((215 : Rat) / 16) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0573_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0573
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0574 : Poly :=
[
  term ((5 : Rat) / 2) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 574 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0574 : Poly :=
[
  term (5 : Rat) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0574_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0574
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0575 : Poly :=
[
  term ((217 : Rat) / 15) [(7, 1), (11, 1), (14, 2)]
]

/-- Partial product 575 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0575 : Poly :=
[
  term ((434 : Rat) / 15) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-217 : Rat) / 15) [(7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0575_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0575
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0576 : Poly :=
[
  term (-3 : Rat) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 576 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0576 : Poly :=
[
  term (-6 : Rat) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0576_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0576
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0577 : Poly :=
[
  term ((-21 : Rat) / 20) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 577 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0577 : Poly :=
[
  term ((-21 : Rat) / 10) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((21 : Rat) / 20) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0577_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0577
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0578 : Poly :=
[
  term ((-5 : Rat) / 8) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 578 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0578 : Poly :=
[
  term ((-5 : Rat) / 4) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((5 : Rat) / 8) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0578_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0578
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0579 : Poly :=
[
  term ((-77 : Rat) / 60) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 579 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0579 : Poly :=
[
  term ((77 : Rat) / 60) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-77 : Rat) / 30) [(7, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0579_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0579
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0580 : Poly :=
[
  term ((7 : Rat) / 5) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 580 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0580 : Poly :=
[
  term ((14 : Rat) / 5) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0580_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0580
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0581 : Poly :=
[
  term ((91 : Rat) / 120) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 581 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0581 : Poly :=
[
  term ((91 : Rat) / 60) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-91 : Rat) / 120) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0581_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0581
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0582 : Poly :=
[
  term ((7 : Rat) / 4) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 582 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0582 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((7 : Rat) / 2) [(7, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0582_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0582
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0583 : Poly :=
[
  term ((553 : Rat) / 120) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 583 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0583 : Poly :=
[
  term ((-553 : Rat) / 120) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((553 : Rat) / 60) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0583_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0583
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0584 : Poly :=
[
  term ((-3 : Rat) / 2) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 584 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0584 : Poly :=
[
  term ((3 : Rat) / 2) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0584_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0584
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0585 : Poly :=
[
  term ((-1093 : Rat) / 120) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 585 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0585 : Poly :=
[
  term ((1093 : Rat) / 120) [(7, 1), (12, 1), (15, 1)],
  term ((-1093 : Rat) / 60) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0585_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0585
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0586 : Poly :=
[
  term ((9 : Rat) / 2) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 586 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0586 : Poly :=
[
  term ((-9 : Rat) / 2) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0586_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0586
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0587 : Poly :=
[
  term ((83 : Rat) / 10) [(7, 1), (13, 1)]
]

/-- Partial product 587 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0587 : Poly :=
[
  term ((83 : Rat) / 5) [(7, 1), (12, 1), (13, 1)],
  term ((-83 : Rat) / 10) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0587_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0587
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0588 : Poly :=
[
  term ((1019 : Rat) / 80) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 588 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0588 : Poly :=
[
  term ((1019 : Rat) / 40) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1019 : Rat) / 80) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0588_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0588
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0589 : Poly :=
[
  term (-6 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 589 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0589 : Poly :=
[
  term (-12 : Rat) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (6 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0589_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0589
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0590 : Poly :=
[
  term ((-329 : Rat) / 60) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 590 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0590 : Poly :=
[
  term ((-329 : Rat) / 30) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((329 : Rat) / 60) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0590_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0590
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0591 : Poly :=
[
  term ((3 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 591 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0591 : Poly :=
[
  term (3 : Rat) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0591_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0591
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0592 : Poly :=
[
  term ((35 : Rat) / 24) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 592 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0592 : Poly :=
[
  term ((35 : Rat) / 12) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-35 : Rat) / 24) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0592_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0592
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0593 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 593 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0593 : Poly :=
[
  term ((-7 : Rat) / 2) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0593_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0593
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0594 : Poly :=
[
  term ((-7 : Rat) / 4) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 594 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0594 : Poly :=
[
  term ((-7 : Rat) / 2) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0594_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0594
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0595 : Poly :=
[
  term ((-1519 : Rat) / 240) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 595 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0595 : Poly :=
[
  term ((-1519 : Rat) / 120) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1519 : Rat) / 240) [(7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0595_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0595
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0596 : Poly :=
[
  term ((3 : Rat) / 2) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 596 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0596 : Poly :=
[
  term (3 : Rat) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0596_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0596
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0597 : Poly :=
[
  term ((2501 : Rat) / 240) [(7, 1), (15, 1)]
]

/-- Partial product 597 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0597 : Poly :=
[
  term ((2501 : Rat) / 120) [(7, 1), (12, 1), (15, 1)],
  term ((-2501 : Rat) / 240) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0597_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0597
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0598 : Poly :=
[
  term ((-9 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0598 : Poly :=
[
  term (-9 : Rat) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0598_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0598
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 25. -/
def rs_R014_ueqv_R014YY_coefficient_25_0599 : Poly :=
[
  term ((7 : Rat) / 6) [(8, 1)]
]

/-- Partial product 599 for generator 25. -/
def rs_R014_ueqv_R014YY_partial_25_0599 : Poly :=
[
  term ((-7 : Rat) / 6) [(8, 1)],
  term ((7 : Rat) / 3) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 25. -/
theorem rs_R014_ueqv_R014YY_partial_25_0599_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_25_0599
        rs_R014_ueqv_R014YY_generator_25_0500_0599 =
      rs_R014_ueqv_R014YY_partial_25_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_25_0500_0599 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_25_0500,
  rs_R014_ueqv_R014YY_partial_25_0501,
  rs_R014_ueqv_R014YY_partial_25_0502,
  rs_R014_ueqv_R014YY_partial_25_0503,
  rs_R014_ueqv_R014YY_partial_25_0504,
  rs_R014_ueqv_R014YY_partial_25_0505,
  rs_R014_ueqv_R014YY_partial_25_0506,
  rs_R014_ueqv_R014YY_partial_25_0507,
  rs_R014_ueqv_R014YY_partial_25_0508,
  rs_R014_ueqv_R014YY_partial_25_0509,
  rs_R014_ueqv_R014YY_partial_25_0510,
  rs_R014_ueqv_R014YY_partial_25_0511,
  rs_R014_ueqv_R014YY_partial_25_0512,
  rs_R014_ueqv_R014YY_partial_25_0513,
  rs_R014_ueqv_R014YY_partial_25_0514,
  rs_R014_ueqv_R014YY_partial_25_0515,
  rs_R014_ueqv_R014YY_partial_25_0516,
  rs_R014_ueqv_R014YY_partial_25_0517,
  rs_R014_ueqv_R014YY_partial_25_0518,
  rs_R014_ueqv_R014YY_partial_25_0519,
  rs_R014_ueqv_R014YY_partial_25_0520,
  rs_R014_ueqv_R014YY_partial_25_0521,
  rs_R014_ueqv_R014YY_partial_25_0522,
  rs_R014_ueqv_R014YY_partial_25_0523,
  rs_R014_ueqv_R014YY_partial_25_0524,
  rs_R014_ueqv_R014YY_partial_25_0525,
  rs_R014_ueqv_R014YY_partial_25_0526,
  rs_R014_ueqv_R014YY_partial_25_0527,
  rs_R014_ueqv_R014YY_partial_25_0528,
  rs_R014_ueqv_R014YY_partial_25_0529,
  rs_R014_ueqv_R014YY_partial_25_0530,
  rs_R014_ueqv_R014YY_partial_25_0531,
  rs_R014_ueqv_R014YY_partial_25_0532,
  rs_R014_ueqv_R014YY_partial_25_0533,
  rs_R014_ueqv_R014YY_partial_25_0534,
  rs_R014_ueqv_R014YY_partial_25_0535,
  rs_R014_ueqv_R014YY_partial_25_0536,
  rs_R014_ueqv_R014YY_partial_25_0537,
  rs_R014_ueqv_R014YY_partial_25_0538,
  rs_R014_ueqv_R014YY_partial_25_0539,
  rs_R014_ueqv_R014YY_partial_25_0540,
  rs_R014_ueqv_R014YY_partial_25_0541,
  rs_R014_ueqv_R014YY_partial_25_0542,
  rs_R014_ueqv_R014YY_partial_25_0543,
  rs_R014_ueqv_R014YY_partial_25_0544,
  rs_R014_ueqv_R014YY_partial_25_0545,
  rs_R014_ueqv_R014YY_partial_25_0546,
  rs_R014_ueqv_R014YY_partial_25_0547,
  rs_R014_ueqv_R014YY_partial_25_0548,
  rs_R014_ueqv_R014YY_partial_25_0549,
  rs_R014_ueqv_R014YY_partial_25_0550,
  rs_R014_ueqv_R014YY_partial_25_0551,
  rs_R014_ueqv_R014YY_partial_25_0552,
  rs_R014_ueqv_R014YY_partial_25_0553,
  rs_R014_ueqv_R014YY_partial_25_0554,
  rs_R014_ueqv_R014YY_partial_25_0555,
  rs_R014_ueqv_R014YY_partial_25_0556,
  rs_R014_ueqv_R014YY_partial_25_0557,
  rs_R014_ueqv_R014YY_partial_25_0558,
  rs_R014_ueqv_R014YY_partial_25_0559,
  rs_R014_ueqv_R014YY_partial_25_0560,
  rs_R014_ueqv_R014YY_partial_25_0561,
  rs_R014_ueqv_R014YY_partial_25_0562,
  rs_R014_ueqv_R014YY_partial_25_0563,
  rs_R014_ueqv_R014YY_partial_25_0564,
  rs_R014_ueqv_R014YY_partial_25_0565,
  rs_R014_ueqv_R014YY_partial_25_0566,
  rs_R014_ueqv_R014YY_partial_25_0567,
  rs_R014_ueqv_R014YY_partial_25_0568,
  rs_R014_ueqv_R014YY_partial_25_0569,
  rs_R014_ueqv_R014YY_partial_25_0570,
  rs_R014_ueqv_R014YY_partial_25_0571,
  rs_R014_ueqv_R014YY_partial_25_0572,
  rs_R014_ueqv_R014YY_partial_25_0573,
  rs_R014_ueqv_R014YY_partial_25_0574,
  rs_R014_ueqv_R014YY_partial_25_0575,
  rs_R014_ueqv_R014YY_partial_25_0576,
  rs_R014_ueqv_R014YY_partial_25_0577,
  rs_R014_ueqv_R014YY_partial_25_0578,
  rs_R014_ueqv_R014YY_partial_25_0579,
  rs_R014_ueqv_R014YY_partial_25_0580,
  rs_R014_ueqv_R014YY_partial_25_0581,
  rs_R014_ueqv_R014YY_partial_25_0582,
  rs_R014_ueqv_R014YY_partial_25_0583,
  rs_R014_ueqv_R014YY_partial_25_0584,
  rs_R014_ueqv_R014YY_partial_25_0585,
  rs_R014_ueqv_R014YY_partial_25_0586,
  rs_R014_ueqv_R014YY_partial_25_0587,
  rs_R014_ueqv_R014YY_partial_25_0588,
  rs_R014_ueqv_R014YY_partial_25_0589,
  rs_R014_ueqv_R014YY_partial_25_0590,
  rs_R014_ueqv_R014YY_partial_25_0591,
  rs_R014_ueqv_R014YY_partial_25_0592,
  rs_R014_ueqv_R014YY_partial_25_0593,
  rs_R014_ueqv_R014YY_partial_25_0594,
  rs_R014_ueqv_R014YY_partial_25_0595,
  rs_R014_ueqv_R014YY_partial_25_0596,
  rs_R014_ueqv_R014YY_partial_25_0597,
  rs_R014_ueqv_R014YY_partial_25_0598,
  rs_R014_ueqv_R014YY_partial_25_0599
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_25_0500_0599 : Poly :=
[
  term (-90 : Rat) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term (45 : Rat) [(3, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(4, 1)],
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term (-1 : Rat) [(4, 1), (7, 1), (11, 1)],
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((8 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (12, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (7, 1), (12, 2), (15, 1)],
  term ((2 : Rat) / 3) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term (1 : Rat) [(4, 1), (7, 1), (15, 1)],
  term (3 : Rat) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-172 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (42 : Rat) [(4, 1), (10, 1), (12, 1), (13, 2)],
  term ((301207 : Rat) / 770) [(4, 1), (10, 1), (12, 1), (14, 1)],
  term (-6 : Rat) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((8 : Rat) / 3) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-3 : Rat) / 2) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((86 : Rat) / 3) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term (-21 : Rat) [(4, 1), (10, 1), (13, 2)],
  term ((-301207 : Rat) / 1540) [(4, 1), (10, 1), (14, 1)],
  term (3 : Rat) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (10, 1), (15, 2)],
  term (56 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term (56 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((10 : Rat) / 3) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8 : Rat) / 3) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term (-42 : Rat) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-35 : Rat) / 2) [(4, 1), (11, 1), (13, 1)],
  term (-28 : Rat) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-11 : Rat) / 12) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term (1 : Rat) [(4, 1), (11, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (12, 1)],
  term ((4 : Rat) / 3) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term (-56 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term (-42 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1)],
  term ((-295047 : Rat) / 3080) [(4, 1), (12, 1), (14, 1)],
  term (-6 : Rat) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-301207 : Rat) / 1540) [(4, 1), (12, 1), (14, 2)],
  term ((8 : Rat) / 3) [(4, 1), (12, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (12, 2)],
  term (42 : Rat) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term (3 : Rat) [(4, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(4, 1), (12, 2), (15, 2)],
  term ((-2 : Rat) / 3) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((35 : Rat) / 2) [(4, 1), (13, 1), (15, 1)],
  term (21 : Rat) [(4, 1), (13, 2), (14, 1)],
  term ((295047 : Rat) / 6160) [(4, 1), (14, 1)],
  term ((9 : Rat) / 4) [(4, 1), (14, 1), (15, 2)],
  term ((301207 : Rat) / 3080) [(4, 1), (14, 2)],
  term (-1 : Rat) [(4, 1), (15, 2)],
  term ((1 : Rat) / 3) [(5, 1), (7, 1), (10, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((-888221 : Rat) / 4620) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((888221 : Rat) / 9240) [(5, 1), (7, 1), (14, 1)],
  term (-21 : Rat) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((902081 : Rat) / 2310) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((21 : Rat) / 2) [(5, 1), (10, 1), (13, 1)],
  term ((3 : Rat) / 4) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-902081 : Rat) / 4620) [(5, 1), (10, 1), (15, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (11, 1), (12, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (12, 2)],
  term ((8 : Rat) / 3) [(5, 1), (11, 1), (14, 1)],
  term ((-50 : Rat) / 3) [(5, 1), (12, 1), (13, 1)],
  term (21 : Rat) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-906701 : Rat) / 4620) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 2) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((25 : Rat) / 3) [(5, 1), (13, 1)],
  term ((-21 : Rat) / 2) [(5, 1), (13, 1), (14, 1)],
  term ((906701 : Rat) / 9240) [(5, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 4) [(5, 1), (14, 2), (15, 1)],
  term ((2 : Rat) / 3) [(7, 1), (9, 1), (10, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((14 : Rat) / 3) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-7 : Rat) / 3) [(7, 1), (9, 1), (14, 1)],
  term ((2 : Rat) / 3) [(7, 1), (10, 1), (11, 1)],
  term ((-4 : Rat) / 3) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((77 : Rat) / 30) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1 : Rat) / 2) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-77 : Rat) / 60) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((7 : Rat) / 5) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((1 : Rat) / 4) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-199 : Rat) / 30) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((262 : Rat) / 15) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term (-6 : Rat) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7 : Rat) / 6) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((11 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((7 : Rat) / 2) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-847 : Rat) / 20) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (6 : Rat) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2881 : Rat) / 60) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term (-11 : Rat) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((199 : Rat) / 60) [(7, 1), (10, 1), (13, 1)],
  term ((-131 : Rat) / 15) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term (3 : Rat) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7 : Rat) / 12) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-11 : Rat) / 4) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((847 : Rat) / 40) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2881 : Rat) / 120) [(7, 1), (10, 1), (15, 1)],
  term ((11 : Rat) / 2) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-149 : Rat) / 24) [(7, 1), (11, 1)],
  term ((147 : Rat) / 20) [(7, 1), (11, 1), (12, 1)],
  term ((-77 : Rat) / 30) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1967 : Rat) / 120) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((434 : Rat) / 15) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term (-6 : Rat) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-14 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((3 : Rat) / 2) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((152 : Rat) / 15) [(7, 1), (11, 1), (12, 2)],
  term ((-7 : Rat) / 2) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-629 : Rat) / 30) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term (6 : Rat) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((7 : Rat) / 5) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((-11 : Rat) / 2) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((77 : Rat) / 60) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7 : Rat) / 8) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((215 : Rat) / 16) [(7, 1), (11, 1), (14, 1)],
  term ((-5 : Rat) / 2) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-217 : Rat) / 15) [(7, 1), (11, 1), (14, 2)],
  term (3 : Rat) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((21 : Rat) / 20) [(7, 1), (11, 1), (15, 2)],
  term ((5 : Rat) / 8) [(7, 1), (11, 1), (16, 1)],
  term ((14 : Rat) / 5) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((14 : Rat) / 5) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-77 : Rat) / 30) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-7 : Rat) / 5) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-91 : Rat) / 120) [(7, 1), (11, 2), (15, 1)],
  term ((83 : Rat) / 5) [(7, 1), (12, 1), (13, 1)],
  term ((1019 : Rat) / 40) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term (-12 : Rat) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-329 : Rat) / 30) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term (3 : Rat) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((7 : Rat) / 6) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7 : Rat) / 2) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-259 : Rat) / 15) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((9 : Rat) / 2) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((599 : Rat) / 20) [(7, 1), (12, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((553 : Rat) / 60) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term (-3 : Rat) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1093 : Rat) / 60) [(7, 1), (12, 2), (15, 1)],
  term (9 : Rat) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-83 : Rat) / 10) [(7, 1), (13, 1)],
  term ((-1019 : Rat) / 80) [(7, 1), (13, 1), (14, 1)],
  term (6 : Rat) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((329 : Rat) / 60) [(7, 1), (13, 1), (14, 2)],
  term ((-3 : Rat) / 2) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-35 : Rat) / 24) [(7, 1), (13, 1), (15, 2)],
  term ((7 : Rat) / 4) [(7, 1), (13, 1), (16, 1)],
  term ((7 : Rat) / 4) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((1519 : Rat) / 240) [(7, 1), (14, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2501 : Rat) / 240) [(7, 1), (15, 1)],
  term ((9 : Rat) / 2) [(7, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(8, 1)],
  term ((7 : Rat) / 3) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 500 through 599. -/
theorem rs_R014_ueqv_R014YY_block_25_0500_0599_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_25_0500_0599
      rs_R014_ueqv_R014YY_block_25_0500_0599 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
