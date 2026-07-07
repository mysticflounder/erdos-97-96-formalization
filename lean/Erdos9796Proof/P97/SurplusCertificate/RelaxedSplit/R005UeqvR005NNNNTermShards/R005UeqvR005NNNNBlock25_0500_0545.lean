/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NNNN, term block 25:500-545

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NNNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R005:u=v:R005NNNN`. -/
def rs_R005_ueqv_R005NNNN_generator_25_0500_0545 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0500 : Poly :=
[
  term ((-96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

/-- Partial product 500 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0500 : Poly :=
[
  term ((-192 : Rat) / 7) [(9, 3), (12, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0500_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0500
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0501 : Poly :=
[
  term ((5 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 501 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0501 : Poly :=
[
  term ((-5 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0501_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0501
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0502 : Poly :=
[
  term ((-80 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 502 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0502 : Poly :=
[
  term ((-160 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0502_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0502
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0503 : Poly :=
[
  term ((8 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 503 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0503 : Poly :=
[
  term ((16 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0503_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0503
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0504 : Poly :=
[
  term ((-40 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0504 : Poly :=
[
  term ((-80 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0504_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0504
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0505 : Poly :=
[
  term ((5 : Rat) / 14) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0505 : Poly :=
[
  term ((5 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 14) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0505_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0505
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0506 : Poly :=
[
  term (-2 : Rat) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 506 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0506 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0506_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0506
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0507 : Poly :=
[
  term ((20 : Rat) / 7) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0507 : Poly :=
[
  term ((40 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0507_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0507
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0508 : Poly :=
[
  term ((185 : Rat) / 28) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 508 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0508 : Poly :=
[
  term ((185 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 28) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0508_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0508
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0509 : Poly :=
[
  term ((-24 : Rat) / 7) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 509 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0509 : Poly :=
[
  term ((-48 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0509_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0509
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0510 : Poly :=
[
  term ((-53 : Rat) / 14) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 510 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0510 : Poly :=
[
  term ((-53 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((53 : Rat) / 14) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0510_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0510
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0511 : Poly :=
[
  term ((-36 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 511 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0511 : Poly :=
[
  term ((-72 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0511_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0511
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0512 : Poly :=
[
  term ((51 : Rat) / 14) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 512 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0512 : Poly :=
[
  term ((51 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-51 : Rat) / 14) [(10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0512_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0512
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0513 : Poly :=
[
  term ((-53 : Rat) / 7) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 513 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0513 : Poly :=
[
  term ((-106 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((53 : Rat) / 7) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0513_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0513
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0514 : Poly :=
[
  term ((207 : Rat) / 56) [(10, 1), (16, 1)]
]

/-- Partial product 514 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0514 : Poly :=
[
  term ((207 : Rat) / 28) [(10, 1), (12, 1), (16, 1)],
  term ((-207 : Rat) / 56) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0514_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0514
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0515 : Poly :=
[
  term ((-5 : Rat) / 7) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0515 : Poly :=
[
  term ((-10 : Rat) / 7) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 7) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0515_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0515
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0516 : Poly :=
[
  term ((64 : Rat) / 7) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 516 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0516 : Poly :=
[
  term ((128 : Rat) / 7) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0516_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0516
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0517 : Poly :=
[
  term ((-34 : Rat) / 7) [(10, 2), (16, 1)]
]

/-- Partial product 517 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0517 : Poly :=
[
  term ((-68 : Rat) / 7) [(10, 2), (12, 1), (16, 1)],
  term ((34 : Rat) / 7) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0517_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0517
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0518 : Poly :=
[
  term ((53 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 518 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0518 : Poly :=
[
  term ((-53 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((53 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0518_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0518
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0519 : Poly :=
[
  term ((-6 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0519 : Poly :=
[
  term ((6 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0519_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0519
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0520 : Poly :=
[
  term ((-101 : Rat) / 28) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0520 : Poly :=
[
  term ((101 : Rat) / 28) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101 : Rat) / 14) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0520_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0520
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0521 : Poly :=
[
  term ((24 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 521 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0521 : Poly :=
[
  term ((-24 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0521_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0521
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0522 : Poly :=
[
  term (-3 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 522 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0522 : Poly :=
[
  term (-6 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0522_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0522
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0523 : Poly :=
[
  term ((53 : Rat) / 28) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 523 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0523 : Poly :=
[
  term ((53 : Rat) / 14) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53 : Rat) / 28) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0523_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0523
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0524 : Poly :=
[
  term ((31 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0524 : Poly :=
[
  term ((62 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0524_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0524
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0525 : Poly :=
[
  term ((12 : Rat) / 7) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 525 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0525 : Poly :=
[
  term ((24 : Rat) / 7) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0525_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0525
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0526 : Poly :=
[
  term ((-101 : Rat) / 56) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0526 : Poly :=
[
  term ((-101 : Rat) / 28) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((101 : Rat) / 56) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0526_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0526
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0527 : Poly :=
[
  term ((12 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 527 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0527 : Poly :=
[
  term ((24 : Rat) / 7) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0527_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0527
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0528 : Poly :=
[
  term ((80 : Rat) / 7) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 528 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0528 : Poly :=
[
  term ((-80 : Rat) / 7) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0528_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0528
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0529 : Poly :=
[
  term ((-8 : Rat) / 7) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 529 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0529 : Poly :=
[
  term ((8 : Rat) / 7) [(11, 2), (12, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0529_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0529
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0530 : Poly :=
[
  term ((40 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 530 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0530 : Poly :=
[
  term ((80 : Rat) / 7) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0530_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0530
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0531 : Poly :=
[
  term ((-4 : Rat) / 7) [(11, 2), (16, 1)]
]

/-- Partial product 531 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0531 : Poly :=
[
  term ((-8 : Rat) / 7) [(11, 2), (12, 1), (16, 1)],
  term ((4 : Rat) / 7) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0531_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0531
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0532 : Poly :=
[
  term ((-41 : Rat) / 14) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0532 : Poly :=
[
  term ((41 : Rat) / 14) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 7) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0532_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0532
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0533 : Poly :=
[
  term ((12 : Rat) / 7) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 533 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0533 : Poly :=
[
  term ((-12 : Rat) / 7) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0533_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0533
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0534 : Poly :=
[
  term ((41 : Rat) / 28) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 534 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0534 : Poly :=
[
  term ((-41 : Rat) / 28) [(12, 1), (14, 1), (16, 1)],
  term ((41 : Rat) / 14) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0534_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0534
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0535 : Poly :=
[
  term ((11 : Rat) / 7) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 535 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0535 : Poly :=
[
  term ((-11 : Rat) / 7) [(12, 1), (15, 2), (16, 1)],
  term ((22 : Rat) / 7) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0535_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0535
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0536 : Poly :=
[
  term ((-41 : Rat) / 56) [(12, 1), (16, 1)]
]

/-- Partial product 536 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0536 : Poly :=
[
  term ((41 : Rat) / 56) [(12, 1), (16, 1)],
  term ((-41 : Rat) / 28) [(12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0536_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0536
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0537 : Poly :=
[
  term ((-11 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0537 : Poly :=
[
  term ((-22 : Rat) / 7) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0537_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0537
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0538 : Poly :=
[
  term ((-12 : Rat) / 7) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0538 : Poly :=
[
  term ((-24 : Rat) / 7) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0538_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0538
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0539 : Poly :=
[
  term ((-41 : Rat) / 28) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 539 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0539 : Poly :=
[
  term ((-41 : Rat) / 14) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 28) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0539_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0539
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0540 : Poly :=
[
  term ((41 : Rat) / 14) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 540 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0540 : Poly :=
[
  term ((41 : Rat) / 7) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-41 : Rat) / 14) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0540_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0540
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0541 : Poly :=
[
  term ((24 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 541 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0541 : Poly :=
[
  term ((48 : Rat) / 7) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0541_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0541
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0542 : Poly :=
[
  term ((-109 : Rat) / 28) [(14, 1), (16, 1)]
]

/-- Partial product 542 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0542 : Poly :=
[
  term ((-109 : Rat) / 14) [(12, 1), (14, 1), (16, 1)],
  term ((109 : Rat) / 28) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0542_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0542
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0543 : Poly :=
[
  term ((-3 : Rat) / 14) [(14, 2), (16, 1)]
]

/-- Partial product 543 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0543 : Poly :=
[
  term ((-3 : Rat) / 7) [(12, 1), (14, 2), (16, 1)],
  term ((3 : Rat) / 14) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0543_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0543
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0544 : Poly :=
[
  term ((11 : Rat) / 14) [(15, 2), (16, 1)]
]

/-- Partial product 544 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0544 : Poly :=
[
  term ((11 : Rat) / 7) [(12, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 14) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0544_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0544
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 25. -/
def rs_R005_ueqv_R005NNNN_coefficient_25_0545 : Poly :=
[
  term ((-41 : Rat) / 112) [(16, 1)]
]

/-- Partial product 545 for generator 25. -/
def rs_R005_ueqv_R005NNNN_partial_25_0545 : Poly :=
[
  term ((-41 : Rat) / 56) [(12, 1), (16, 1)],
  term ((41 : Rat) / 112) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 25. -/
theorem rs_R005_ueqv_R005NNNN_partial_25_0545_valid :
    mulPoly rs_R005_ueqv_R005NNNN_coefficient_25_0545
        rs_R005_ueqv_R005NNNN_generator_25_0500_0545 =
      rs_R005_ueqv_R005NNNN_partial_25_0545 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NNNN_partials_25_0500_0545 : List Poly :=
[
  rs_R005_ueqv_R005NNNN_partial_25_0500,
  rs_R005_ueqv_R005NNNN_partial_25_0501,
  rs_R005_ueqv_R005NNNN_partial_25_0502,
  rs_R005_ueqv_R005NNNN_partial_25_0503,
  rs_R005_ueqv_R005NNNN_partial_25_0504,
  rs_R005_ueqv_R005NNNN_partial_25_0505,
  rs_R005_ueqv_R005NNNN_partial_25_0506,
  rs_R005_ueqv_R005NNNN_partial_25_0507,
  rs_R005_ueqv_R005NNNN_partial_25_0508,
  rs_R005_ueqv_R005NNNN_partial_25_0509,
  rs_R005_ueqv_R005NNNN_partial_25_0510,
  rs_R005_ueqv_R005NNNN_partial_25_0511,
  rs_R005_ueqv_R005NNNN_partial_25_0512,
  rs_R005_ueqv_R005NNNN_partial_25_0513,
  rs_R005_ueqv_R005NNNN_partial_25_0514,
  rs_R005_ueqv_R005NNNN_partial_25_0515,
  rs_R005_ueqv_R005NNNN_partial_25_0516,
  rs_R005_ueqv_R005NNNN_partial_25_0517,
  rs_R005_ueqv_R005NNNN_partial_25_0518,
  rs_R005_ueqv_R005NNNN_partial_25_0519,
  rs_R005_ueqv_R005NNNN_partial_25_0520,
  rs_R005_ueqv_R005NNNN_partial_25_0521,
  rs_R005_ueqv_R005NNNN_partial_25_0522,
  rs_R005_ueqv_R005NNNN_partial_25_0523,
  rs_R005_ueqv_R005NNNN_partial_25_0524,
  rs_R005_ueqv_R005NNNN_partial_25_0525,
  rs_R005_ueqv_R005NNNN_partial_25_0526,
  rs_R005_ueqv_R005NNNN_partial_25_0527,
  rs_R005_ueqv_R005NNNN_partial_25_0528,
  rs_R005_ueqv_R005NNNN_partial_25_0529,
  rs_R005_ueqv_R005NNNN_partial_25_0530,
  rs_R005_ueqv_R005NNNN_partial_25_0531,
  rs_R005_ueqv_R005NNNN_partial_25_0532,
  rs_R005_ueqv_R005NNNN_partial_25_0533,
  rs_R005_ueqv_R005NNNN_partial_25_0534,
  rs_R005_ueqv_R005NNNN_partial_25_0535,
  rs_R005_ueqv_R005NNNN_partial_25_0536,
  rs_R005_ueqv_R005NNNN_partial_25_0537,
  rs_R005_ueqv_R005NNNN_partial_25_0538,
  rs_R005_ueqv_R005NNNN_partial_25_0539,
  rs_R005_ueqv_R005NNNN_partial_25_0540,
  rs_R005_ueqv_R005NNNN_partial_25_0541,
  rs_R005_ueqv_R005NNNN_partial_25_0542,
  rs_R005_ueqv_R005NNNN_partial_25_0543,
  rs_R005_ueqv_R005NNNN_partial_25_0544,
  rs_R005_ueqv_R005NNNN_partial_25_0545
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NNNN_block_25_0500_0545 : Poly :=
[
  term ((-192 : Rat) / 7) [(9, 3), (12, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((80 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((40 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 14) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((185 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-53 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((51 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((207 : Rat) / 28) [(10, 1), (12, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 28) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((53 : Rat) / 14) [(10, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51 : Rat) / 14) [(10, 1), (14, 1), (16, 1)],
  term ((53 : Rat) / 7) [(10, 1), (15, 2), (16, 1)],
  term ((-207 : Rat) / 56) [(10, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(10, 2), (12, 1), (16, 1)],
  term ((5 : Rat) / 7) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(10, 2), (15, 2), (16, 1)],
  term ((34 : Rat) / 7) [(10, 2), (16, 1)],
  term (-6 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((68 : Rat) / 7) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((53 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-101 : Rat) / 14) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53 : Rat) / 28) [(11, 1), (13, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((101 : Rat) / 56) [(11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(11, 2), (12, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(11, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 7) [(11, 2), (16, 1)],
  term ((-22 : Rat) / 7) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((41 : Rat) / 7) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((36 : Rat) / 7) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-37 : Rat) / 4) [(12, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 7) [(12, 1), (14, 2), (16, 1)],
  term ((-41 : Rat) / 7) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((41 : Rat) / 14) [(12, 2), (14, 1), (16, 1)],
  term ((22 : Rat) / 7) [(12, 2), (15, 2), (16, 1)],
  term ((-41 : Rat) / 28) [(12, 2), (16, 1)],
  term ((11 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((41 : Rat) / 28) [(13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 14) [(13, 2), (14, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(14, 1), (15, 2), (16, 1)],
  term ((109 : Rat) / 28) [(14, 1), (16, 1)],
  term ((3 : Rat) / 14) [(14, 2), (16, 1)],
  term ((-11 : Rat) / 14) [(15, 2), (16, 1)],
  term ((41 : Rat) / 112) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 500 through 545. -/
theorem rs_R005_ueqv_R005NNNN_block_25_0500_0545_valid :
    checkProductSumEq rs_R005_ueqv_R005NNNN_partials_25_0500_0545
      rs_R005_ueqv_R005NNNN_block_25_0500_0545 = true := by
  native_decide

end R005UeqvR005NNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
