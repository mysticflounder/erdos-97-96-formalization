/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 28:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_28_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0500 : Poly :=
[
  term ((-77474323 : Rat) / 25735104) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0500 : Poly :=
[
  term ((-77474323 : Rat) / 12867552) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((77474323 : Rat) / 25735104) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0500_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0500
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0501 : Poly :=
[
  term (-54 : Rat) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 501 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0501 : Poly :=
[
  term (-108 : Rat) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term (54 : Rat) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0501_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0501
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0502 : Poly :=
[
  term ((440675 : Rat) / 268074) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 502 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0502 : Poly :=
[
  term ((440675 : Rat) / 134037) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-440675 : Rat) / 268074) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0502_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0502
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0503 : Poly :=
[
  term (-118 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 503 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0503 : Poly :=
[
  term (118 : Rat) [(7, 1), (13, 1)],
  term (-236 : Rat) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0503_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0503
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0504 : Poly :=
[
  term (104 : Rat) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 504 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0504 : Poly :=
[
  term (-104 : Rat) [(7, 1), (13, 1), (14, 1)],
  term (208 : Rat) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0504_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0504
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0505 : Poly :=
[
  term (-18 : Rat) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 505 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0505 : Poly :=
[
  term (18 : Rat) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term (-36 : Rat) [(7, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0505_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0505
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0506 : Poly :=
[
  term ((-1258667 : Rat) / 1072296) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 506 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0506 : Poly :=
[
  term ((1258667 : Rat) / 1072296) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1258667 : Rat) / 536148) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0506_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0506
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0507 : Poly :=
[
  term (-9 : Rat) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 507 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0507 : Poly :=
[
  term (-18 : Rat) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term (9 : Rat) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0507_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0507
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0508 : Poly :=
[
  term ((263551 : Rat) / 714864) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 508 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0508 : Poly :=
[
  term ((263551 : Rat) / 357432) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-263551 : Rat) / 714864) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0508_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0508
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0509 : Poly :=
[
  term (-32 : Rat) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 509 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0509 : Poly :=
[
  term (32 : Rat) [(7, 1), (14, 1), (15, 1)],
  term (-64 : Rat) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0509_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0509
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0510 : Poly :=
[
  term ((-42695417 : Rat) / 12867552) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0510 : Poly :=
[
  term ((42695417 : Rat) / 12867552) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42695417 : Rat) / 6433776) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0510_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0510
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0511 : Poly :=
[
  term ((-644035 : Rat) / 536148) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 511 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0511 : Poly :=
[
  term ((644035 : Rat) / 536148) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-644035 : Rat) / 268074) [(7, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0511_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0511
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0512 : Poly :=
[
  term ((169 : Rat) / 4) [(7, 1), (15, 1)]
]

/-- Partial product 512 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0512 : Poly :=
[
  term ((169 : Rat) / 2) [(7, 1), (14, 1), (15, 1)],
  term ((-169 : Rat) / 4) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0512_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0512
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0513 : Poly :=
[
  term ((-75449143 : Rat) / 51470208) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0513 : Poly :=
[
  term ((-75449143 : Rat) / 25735104) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((75449143 : Rat) / 51470208) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0513_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0513
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0514 : Poly :=
[
  term (99 : Rat) [(7, 1), (15, 3)]
]

/-- Partial product 514 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0514 : Poly :=
[
  term (198 : Rat) [(7, 1), (14, 1), (15, 3)],
  term (-99 : Rat) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0514_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0514
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0515 : Poly :=
[
  term ((-365731 : Rat) / 1072296) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 515 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0515 : Poly :=
[
  term ((-365731 : Rat) / 536148) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((365731 : Rat) / 1072296) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0515_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0515
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0516 : Poly :=
[
  term (-6 : Rat) [(7, 2)]
]

/-- Partial product 516 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0516 : Poly :=
[
  term (6 : Rat) [(7, 2)],
  term (-12 : Rat) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0516_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0516
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0517 : Poly :=
[
  term (-12 : Rat) [(7, 2), (12, 1)]
]

/-- Partial product 517 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0517 : Poly :=
[
  term (12 : Rat) [(7, 2), (12, 1)],
  term (-24 : Rat) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0517_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0517
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0518 : Poly :=
[
  term ((3428 : Rat) / 44679) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 518 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0518 : Poly :=
[
  term ((6856 : Rat) / 44679) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0518_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0518
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0519 : Poly :=
[
  term ((-12569 : Rat) / 29786) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0519 : Poly :=
[
  term ((-12569 : Rat) / 14893) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12569 : Rat) / 29786) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0519_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0519
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0520 : Poly :=
[
  term ((-345 : Rat) / 8) [(8, 1)]
]

/-- Partial product 520 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0520 : Poly :=
[
  term ((345 : Rat) / 8) [(8, 1)],
  term ((-345 : Rat) / 4) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0520_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0520
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0521 : Poly :=
[
  term (9 : Rat) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 521 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0521 : Poly :=
[
  term (-9 : Rat) [(8, 1), (9, 1), (13, 1)],
  term (18 : Rat) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0521_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0521
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0522 : Poly :=
[
  term (96 : Rat) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 522 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0522 : Poly :=
[
  term (192 : Rat) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term (-96 : Rat) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0522_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0522
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0523 : Poly :=
[
  term ((-2612095 : Rat) / 804222) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 523 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0523 : Poly :=
[
  term ((-2612095 : Rat) / 402111) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 804222) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0523_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0523
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0524 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(8, 1), (9, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 524 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0524 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0524_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0524
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0525 : Poly :=
[
  term (78 : Rat) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 525 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0525 : Poly :=
[
  term (156 : Rat) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term (-78 : Rat) [(8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0525_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0525
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0526 : Poly :=
[
  term ((-1134179 : Rat) / 1608444) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 526 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0526 : Poly :=
[
  term ((-1134179 : Rat) / 804222) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1134179 : Rat) / 1608444) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0526_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0526
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0527 : Poly :=
[
  term (-192 : Rat) [(8, 1), (9, 1), (15, 3)]
]

/-- Partial product 527 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0527 : Poly :=
[
  term (-384 : Rat) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term (192 : Rat) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0527_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0527
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0528 : Poly :=
[
  term ((1452832 : Rat) / 402111) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 528 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0528 : Poly :=
[
  term ((2905664 : Rat) / 402111) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1452832 : Rat) / 402111) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0528_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0528
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0529 : Poly :=
[
  term ((257614 : Rat) / 44679) [(8, 1), (9, 1), (15, 5), (16, 1)]
]

/-- Partial product 529 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0529 : Poly :=
[
  term ((515228 : Rat) / 44679) [(8, 1), (9, 1), (14, 1), (15, 5), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0529_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0529
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0530 : Poly :=
[
  term ((-87 : Rat) / 2) [(8, 1), (10, 1)]
]

/-- Partial product 530 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0530 : Poly :=
[
  term ((87 : Rat) / 2) [(8, 1), (10, 1)],
  term (-87 : Rat) [(8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0530_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0530
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0531 : Poly :=
[
  term (-96 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 531 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0531 : Poly :=
[
  term (-192 : Rat) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (96 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0531_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0531
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0532 : Poly :=
[
  term ((-628967 : Rat) / 119144) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0532 : Poly :=
[
  term ((-628967 : Rat) / 59572) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((628967 : Rat) / 119144) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0532_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0532
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0533 : Poly :=
[
  term ((128807 : Rat) / 44679) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 533 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0533 : Poly :=
[
  term ((257614 : Rat) / 44679) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0533_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0533
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0534 : Poly :=
[
  term (48 : Rat) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 534 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0534 : Poly :=
[
  term (96 : Rat) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term (-48 : Rat) [(8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0534_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0534
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0535 : Poly :=
[
  term ((1903535 : Rat) / 536148) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 535 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0535 : Poly :=
[
  term ((1903535 : Rat) / 268074) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1903535 : Rat) / 536148) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0535_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0535
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0536 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(8, 1), (10, 1), (15, 4), (16, 1)]
]

/-- Partial product 536 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0536 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(8, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(8, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0536_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0536
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0537 : Poly :=
[
  term (96 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 537 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0537 : Poly :=
[
  term (192 : Rat) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (-96 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0537_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0537
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0538 : Poly :=
[
  term ((628967 : Rat) / 119144) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0538 : Poly :=
[
  term ((628967 : Rat) / 59572) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-628967 : Rat) / 119144) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0538_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0538
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0539 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 539 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0539 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0539_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0539
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0540 : Poly :=
[
  term (42 : Rat) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 540 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0540 : Poly :=
[
  term (-42 : Rat) [(8, 1), (11, 1), (13, 1)],
  term (84 : Rat) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0540_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0540
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0541 : Poly :=
[
  term ((-1180595 : Rat) / 804222) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 541 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0541 : Poly :=
[
  term ((-1180595 : Rat) / 402111) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 804222) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0541_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0541
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0542 : Poly :=
[
  term (-48 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 542 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0542 : Poly :=
[
  term (48 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term (-96 : Rat) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0542_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0542
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0543 : Poly :=
[
  term ((-1120027 : Rat) / 536148) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0543 : Poly :=
[
  term ((1120027 : Rat) / 536148) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1120027 : Rat) / 268074) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0543_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0543
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0544 : Poly :=
[
  term ((128807 : Rat) / 89358) [(8, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 544 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0544 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(8, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (11, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0544_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0544
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0545 : Poly :=
[
  term (-81 : Rat) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 545 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0545 : Poly :=
[
  term (-162 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term (81 : Rat) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0545_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0545
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0546 : Poly :=
[
  term ((-3470783 : Rat) / 2144592) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 546 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0546 : Poly :=
[
  term ((-3470783 : Rat) / 1072296) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3470783 : Rat) / 2144592) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0546_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0546
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0547 : Poly :=
[
  term ((3563117 : Rat) / 1608444) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 547 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0547 : Poly :=
[
  term ((3563117 : Rat) / 804222) [(8, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3563117 : Rat) / 1608444) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0547_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0547
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0548 : Poly :=
[
  term ((-21 : Rat) / 2) [(8, 1), (12, 1)]
]

/-- Partial product 548 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0548 : Poly :=
[
  term ((21 : Rat) / 2) [(8, 1), (12, 1)],
  term (-21 : Rat) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0548_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0548
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0549 : Poly :=
[
  term ((-22771511 : Rat) / 3216888) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 549 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0549 : Poly :=
[
  term ((-22771511 : Rat) / 1608444) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22771511 : Rat) / 3216888) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0549_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0549
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0550 : Poly :=
[
  term (-48 : Rat) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 550 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0550 : Poly :=
[
  term (-96 : Rat) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term (48 : Rat) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0550_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0550
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0551 : Poly :=
[
  term ((12847307 : Rat) / 2144592) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 551 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0551 : Poly :=
[
  term ((12847307 : Rat) / 1072296) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12847307 : Rat) / 2144592) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0551_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0551
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0552 : Poly :=
[
  term ((128807 : Rat) / 89358) [(8, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 552 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0552 : Poly :=
[
  term ((128807 : Rat) / 44679) [(8, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 89358) [(8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0552_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0552
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0553 : Poly :=
[
  term (48 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 553 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0553 : Poly :=
[
  term (-48 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term (96 : Rat) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0553_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0553
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0554 : Poly :=
[
  term ((12266125 : Rat) / 6433776) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0554 : Poly :=
[
  term ((-12266125 : Rat) / 6433776) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12266125 : Rat) / 3216888) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0554_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0554
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0555 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 555 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0555 : Poly :=
[
  term ((128807 : Rat) / 89358) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (13, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0555_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0555
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0556 : Poly :=
[
  term (-511 : Rat) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 556 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0556 : Poly :=
[
  term (-1022 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term (511 : Rat) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0556_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0556
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0557 : Poly :=
[
  term ((-8969587 : Rat) / 4289184) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 557 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0557 : Poly :=
[
  term ((-8969587 : Rat) / 2144592) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8969587 : Rat) / 4289184) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0557_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0557
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0558 : Poly :=
[
  term (-96 : Rat) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 558 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0558 : Poly :=
[
  term (-192 : Rat) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term (96 : Rat) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0558_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0558
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0559 : Poly :=
[
  term ((664366 : Rat) / 134037) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 559 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0559 : Poly :=
[
  term ((1328732 : Rat) / 134037) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-664366 : Rat) / 134037) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0559_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0559
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0560 : Poly :=
[
  term ((128807 : Rat) / 44679) [(8, 1), (13, 1), (15, 5), (16, 1)]
]

/-- Partial product 560 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0560 : Poly :=
[
  term ((257614 : Rat) / 44679) [(8, 1), (13, 1), (14, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0560_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0560
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0561 : Poly :=
[
  term (216 : Rat) [(8, 1), (13, 2)]
]

/-- Partial product 561 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0561 : Poly :=
[
  term (-216 : Rat) [(8, 1), (13, 2)],
  term (432 : Rat) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0561_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0561
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0562 : Poly :=
[
  term ((33 : Rat) / 4) [(8, 1), (14, 1)]
]

/-- Partial product 562 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0562 : Poly :=
[
  term ((-33 : Rat) / 4) [(8, 1), (14, 1)],
  term ((33 : Rat) / 2) [(8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0562_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0562
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0563 : Poly :=
[
  term (72 : Rat) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 563 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0563 : Poly :=
[
  term (-72 : Rat) [(8, 1), (14, 1), (15, 2)],
  term (144 : Rat) [(8, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0563_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0563
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0564 : Poly :=
[
  term ((-3816727 : Rat) / 714864) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 564 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0564 : Poly :=
[
  term ((3816727 : Rat) / 714864) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3816727 : Rat) / 357432) [(8, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0564_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0564
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0565 : Poly :=
[
  term ((-128807 : Rat) / 59572) [(8, 1), (14, 1), (15, 4), (16, 1)]
]

/-- Partial product 565 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0565 : Poly :=
[
  term ((128807 : Rat) / 59572) [(8, 1), (14, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 1), (14, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0565_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0565
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0566 : Poly :=
[
  term (122 : Rat) [(8, 1), (15, 2)]
]

/-- Partial product 566 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0566 : Poly :=
[
  term (244 : Rat) [(8, 1), (14, 1), (15, 2)],
  term (-122 : Rat) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0566_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0566
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0567 : Poly :=
[
  term ((-31761709 : Rat) / 6433776) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 567 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0567 : Poly :=
[
  term ((-31761709 : Rat) / 3216888) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((31761709 : Rat) / 6433776) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0567_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0567
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0568 : Poly :=
[
  term (192 : Rat) [(8, 1), (15, 4)]
]

/-- Partial product 568 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0568 : Poly :=
[
  term (384 : Rat) [(8, 1), (14, 1), (15, 4)],
  term (-192 : Rat) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0568_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0568
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0569 : Poly :=
[
  term ((-9470593 : Rat) / 1072296) [(8, 1), (15, 4), (16, 1)]
]

/-- Partial product 569 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0569 : Poly :=
[
  term ((-9470593 : Rat) / 536148) [(8, 1), (14, 1), (15, 4), (16, 1)],
  term ((9470593 : Rat) / 1072296) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0569_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0569
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0570 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(8, 1), (15, 6), (16, 1)]
]

/-- Partial product 570 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0570 : Poly :=
[
  term ((-515228 : Rat) / 44679) [(8, 1), (14, 1), (15, 6), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0570_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0570
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0571 : Poly :=
[
  term ((261 : Rat) / 2) [(8, 2)]
]

/-- Partial product 571 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0571 : Poly :=
[
  term ((-261 : Rat) / 2) [(8, 2)],
  term (261 : Rat) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0571_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0571
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0572 : Poly :=
[
  term (-144 : Rat) [(8, 2), (15, 2)]
]

/-- Partial product 572 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0572 : Poly :=
[
  term (-288 : Rat) [(8, 2), (14, 1), (15, 2)],
  term (144 : Rat) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0572_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0572
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0573 : Poly :=
[
  term ((293569 : Rat) / 536148) [(8, 2), (15, 2), (16, 1)]
]

/-- Partial product 573 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0573 : Poly :=
[
  term ((293569 : Rat) / 268074) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-293569 : Rat) / 536148) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0573_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0573
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0574 : Poly :=
[
  term ((128807 : Rat) / 29786) [(8, 2), (15, 4), (16, 1)]
]

/-- Partial product 574 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0574 : Poly :=
[
  term ((128807 : Rat) / 14893) [(8, 2), (14, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0574_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0574
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0575 : Poly :=
[
  term (142 : Rat) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 575 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0575 : Poly :=
[
  term (-142 : Rat) [(9, 1), (10, 1), (13, 1)],
  term (284 : Rat) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0575_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0575
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0576 : Poly :=
[
  term (-192 : Rat) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 576 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0576 : Poly :=
[
  term (-384 : Rat) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term (192 : Rat) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0576_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0576
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0577 : Poly :=
[
  term ((12830 : Rat) / 7587) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 577 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0577 : Poly :=
[
  term ((25660 : Rat) / 7587) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12830 : Rat) / 7587) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0577_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0577
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0578 : Poly :=
[
  term ((257614 : Rat) / 44679) [(9, 1), (10, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 578 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0578 : Poly :=
[
  term ((515228 : Rat) / 44679) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (10, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0578_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0578
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0579 : Poly :=
[
  term (-71 : Rat) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 579 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0579 : Poly :=
[
  term (-142 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term (71 : Rat) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0579_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0579
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0580 : Poly :=
[
  term ((9267059 : Rat) / 6433776) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 580 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0580 : Poly :=
[
  term ((9267059 : Rat) / 3216888) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9267059 : Rat) / 6433776) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0580_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0580
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0581 : Poly :=
[
  term (96 : Rat) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 581 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0581 : Poly :=
[
  term (192 : Rat) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term (-96 : Rat) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0581_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0581
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0582 : Poly :=
[
  term ((-6415 : Rat) / 7587) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 582 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0582 : Poly :=
[
  term ((-12830 : Rat) / 7587) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((6415 : Rat) / 7587) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0582_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0582
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0583 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 1), (10, 1), (15, 5), (16, 1)]
]

/-- Partial product 583 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0583 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(9, 1), (10, 1), (14, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (10, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0583_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0583
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0584 : Poly :=
[
  term ((-29 : Rat) / 2) [(9, 1), (11, 1)]
]

/-- Partial product 584 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0584 : Poly :=
[
  term ((29 : Rat) / 2) [(9, 1), (11, 1)],
  term (-29 : Rat) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0584_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0584
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0585 : Poly :=
[
  term (-100 : Rat) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 585 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0585 : Poly :=
[
  term (100 : Rat) [(9, 1), (11, 1), (12, 1)],
  term (-200 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0585_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0585
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0586 : Poly :=
[
  term (192 : Rat) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 586 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0586 : Poly :=
[
  term (384 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term (-192 : Rat) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0586_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0586
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0587 : Poly :=
[
  term ((-2540575 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 587 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0587 : Poly :=
[
  term ((-2540575 : Rat) / 402111) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2540575 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0587_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0587
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0588 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 588 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0588 : Poly :=
[
  term ((-515228 : Rat) / 44679) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0588_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0588
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0589 : Poly :=
[
  term (71 : Rat) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 589 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0589 : Poly :=
[
  term (-71 : Rat) [(9, 1), (11, 1), (14, 1)],
  term (142 : Rat) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0589_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0589
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0590 : Poly :=
[
  term (-96 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 590 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0590 : Poly :=
[
  term (96 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term (-192 : Rat) [(9, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0590_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0590
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0591 : Poly :=
[
  term ((6415 : Rat) / 7587) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 591 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0591 : Poly :=
[
  term ((-6415 : Rat) / 7587) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((12830 : Rat) / 7587) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0591_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0591
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0592 : Poly :=
[
  term ((128807 : Rat) / 44679) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)]
]

/-- Partial product 592 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0592 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0592_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0592
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0593 : Poly :=
[
  term (48 : Rat) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 593 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0593 : Poly :=
[
  term (96 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term (-48 : Rat) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0593_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0593
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0594 : Poly :=
[
  term ((-620195 : Rat) / 536148) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 594 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0594 : Poly :=
[
  term ((-620195 : Rat) / 268074) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((620195 : Rat) / 536148) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0594_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0594
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0595 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 595 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0595 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0595_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0595
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0596 : Poly :=
[
  term (271 : Rat) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 596 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0596 : Poly :=
[
  term (-271 : Rat) [(9, 1), (12, 1), (13, 1)],
  term (542 : Rat) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0596_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0596
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0597 : Poly :=
[
  term (-96 : Rat) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 597 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0597 : Poly :=
[
  term (-192 : Rat) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term (96 : Rat) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0597_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0597
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0598 : Poly :=
[
  term ((1066411 : Rat) / 804222) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 598 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0598 : Poly :=
[
  term ((1066411 : Rat) / 402111) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1066411 : Rat) / 804222) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0598_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0598
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0599 : Poly :=
[
  term ((128807 : Rat) / 44679) [(9, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 599 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0599 : Poly :=
[
  term ((257614 : Rat) / 44679) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0599_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0599
        rs_R003_ueqv_R003NN_generator_28_0500_0599 =
      rs_R003_ueqv_R003NN_partial_28_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_28_0500_0599 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_28_0500,
  rs_R003_ueqv_R003NN_partial_28_0501,
  rs_R003_ueqv_R003NN_partial_28_0502,
  rs_R003_ueqv_R003NN_partial_28_0503,
  rs_R003_ueqv_R003NN_partial_28_0504,
  rs_R003_ueqv_R003NN_partial_28_0505,
  rs_R003_ueqv_R003NN_partial_28_0506,
  rs_R003_ueqv_R003NN_partial_28_0507,
  rs_R003_ueqv_R003NN_partial_28_0508,
  rs_R003_ueqv_R003NN_partial_28_0509,
  rs_R003_ueqv_R003NN_partial_28_0510,
  rs_R003_ueqv_R003NN_partial_28_0511,
  rs_R003_ueqv_R003NN_partial_28_0512,
  rs_R003_ueqv_R003NN_partial_28_0513,
  rs_R003_ueqv_R003NN_partial_28_0514,
  rs_R003_ueqv_R003NN_partial_28_0515,
  rs_R003_ueqv_R003NN_partial_28_0516,
  rs_R003_ueqv_R003NN_partial_28_0517,
  rs_R003_ueqv_R003NN_partial_28_0518,
  rs_R003_ueqv_R003NN_partial_28_0519,
  rs_R003_ueqv_R003NN_partial_28_0520,
  rs_R003_ueqv_R003NN_partial_28_0521,
  rs_R003_ueqv_R003NN_partial_28_0522,
  rs_R003_ueqv_R003NN_partial_28_0523,
  rs_R003_ueqv_R003NN_partial_28_0524,
  rs_R003_ueqv_R003NN_partial_28_0525,
  rs_R003_ueqv_R003NN_partial_28_0526,
  rs_R003_ueqv_R003NN_partial_28_0527,
  rs_R003_ueqv_R003NN_partial_28_0528,
  rs_R003_ueqv_R003NN_partial_28_0529,
  rs_R003_ueqv_R003NN_partial_28_0530,
  rs_R003_ueqv_R003NN_partial_28_0531,
  rs_R003_ueqv_R003NN_partial_28_0532,
  rs_R003_ueqv_R003NN_partial_28_0533,
  rs_R003_ueqv_R003NN_partial_28_0534,
  rs_R003_ueqv_R003NN_partial_28_0535,
  rs_R003_ueqv_R003NN_partial_28_0536,
  rs_R003_ueqv_R003NN_partial_28_0537,
  rs_R003_ueqv_R003NN_partial_28_0538,
  rs_R003_ueqv_R003NN_partial_28_0539,
  rs_R003_ueqv_R003NN_partial_28_0540,
  rs_R003_ueqv_R003NN_partial_28_0541,
  rs_R003_ueqv_R003NN_partial_28_0542,
  rs_R003_ueqv_R003NN_partial_28_0543,
  rs_R003_ueqv_R003NN_partial_28_0544,
  rs_R003_ueqv_R003NN_partial_28_0545,
  rs_R003_ueqv_R003NN_partial_28_0546,
  rs_R003_ueqv_R003NN_partial_28_0547,
  rs_R003_ueqv_R003NN_partial_28_0548,
  rs_R003_ueqv_R003NN_partial_28_0549,
  rs_R003_ueqv_R003NN_partial_28_0550,
  rs_R003_ueqv_R003NN_partial_28_0551,
  rs_R003_ueqv_R003NN_partial_28_0552,
  rs_R003_ueqv_R003NN_partial_28_0553,
  rs_R003_ueqv_R003NN_partial_28_0554,
  rs_R003_ueqv_R003NN_partial_28_0555,
  rs_R003_ueqv_R003NN_partial_28_0556,
  rs_R003_ueqv_R003NN_partial_28_0557,
  rs_R003_ueqv_R003NN_partial_28_0558,
  rs_R003_ueqv_R003NN_partial_28_0559,
  rs_R003_ueqv_R003NN_partial_28_0560,
  rs_R003_ueqv_R003NN_partial_28_0561,
  rs_R003_ueqv_R003NN_partial_28_0562,
  rs_R003_ueqv_R003NN_partial_28_0563,
  rs_R003_ueqv_R003NN_partial_28_0564,
  rs_R003_ueqv_R003NN_partial_28_0565,
  rs_R003_ueqv_R003NN_partial_28_0566,
  rs_R003_ueqv_R003NN_partial_28_0567,
  rs_R003_ueqv_R003NN_partial_28_0568,
  rs_R003_ueqv_R003NN_partial_28_0569,
  rs_R003_ueqv_R003NN_partial_28_0570,
  rs_R003_ueqv_R003NN_partial_28_0571,
  rs_R003_ueqv_R003NN_partial_28_0572,
  rs_R003_ueqv_R003NN_partial_28_0573,
  rs_R003_ueqv_R003NN_partial_28_0574,
  rs_R003_ueqv_R003NN_partial_28_0575,
  rs_R003_ueqv_R003NN_partial_28_0576,
  rs_R003_ueqv_R003NN_partial_28_0577,
  rs_R003_ueqv_R003NN_partial_28_0578,
  rs_R003_ueqv_R003NN_partial_28_0579,
  rs_R003_ueqv_R003NN_partial_28_0580,
  rs_R003_ueqv_R003NN_partial_28_0581,
  rs_R003_ueqv_R003NN_partial_28_0582,
  rs_R003_ueqv_R003NN_partial_28_0583,
  rs_R003_ueqv_R003NN_partial_28_0584,
  rs_R003_ueqv_R003NN_partial_28_0585,
  rs_R003_ueqv_R003NN_partial_28_0586,
  rs_R003_ueqv_R003NN_partial_28_0587,
  rs_R003_ueqv_R003NN_partial_28_0588,
  rs_R003_ueqv_R003NN_partial_28_0589,
  rs_R003_ueqv_R003NN_partial_28_0590,
  rs_R003_ueqv_R003NN_partial_28_0591,
  rs_R003_ueqv_R003NN_partial_28_0592,
  rs_R003_ueqv_R003NN_partial_28_0593,
  rs_R003_ueqv_R003NN_partial_28_0594,
  rs_R003_ueqv_R003NN_partial_28_0595,
  rs_R003_ueqv_R003NN_partial_28_0596,
  rs_R003_ueqv_R003NN_partial_28_0597,
  rs_R003_ueqv_R003NN_partial_28_0598,
  rs_R003_ueqv_R003NN_partial_28_0599
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_28_0500_0599 : Poly :=
[
  term ((-77474323 : Rat) / 12867552) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-108 : Rat) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((440675 : Rat) / 134037) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((77474323 : Rat) / 25735104) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term (54 : Rat) [(7, 1), (12, 1), (15, 3)],
  term ((-440675 : Rat) / 268074) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term (118 : Rat) [(7, 1), (13, 1)],
  term (-340 : Rat) [(7, 1), (13, 1), (14, 1)],
  term ((256165 : Rat) / 134037) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (208 : Rat) [(7, 1), (13, 1), (14, 2)],
  term (-36 : Rat) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1258667 : Rat) / 536148) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term (9 : Rat) [(7, 1), (13, 1), (15, 2)],
  term ((-263551 : Rat) / 714864) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((233 : Rat) / 2) [(7, 1), (14, 1), (15, 1)],
  term ((3313897 : Rat) / 8578368) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term (198 : Rat) [(7, 1), (14, 1), (15, 3)],
  term ((23192 : Rat) / 44679) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term (-64 : Rat) [(7, 1), (14, 2), (15, 1)],
  term ((-42695417 : Rat) / 6433776) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-644035 : Rat) / 268074) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-169 : Rat) / 4) [(7, 1), (15, 1)],
  term ((75449143 : Rat) / 51470208) [(7, 1), (15, 1), (16, 1)],
  term (-99 : Rat) [(7, 1), (15, 3)],
  term ((365731 : Rat) / 1072296) [(7, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(7, 2)],
  term (12 : Rat) [(7, 2), (12, 1)],
  term ((6856 : Rat) / 44679) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (12, 1), (14, 1)],
  term ((-12569 : Rat) / 14893) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12569 : Rat) / 29786) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 2), (14, 1)],
  term ((345 : Rat) / 8) [(8, 1)],
  term (-9 : Rat) [(8, 1), (9, 1), (13, 1)],
  term (18 : Rat) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term (192 : Rat) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2612095 : Rat) / 402111) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term (-96 : Rat) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((2612095 : Rat) / 804222) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term (156 : Rat) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1134179 : Rat) / 804222) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((2905664 : Rat) / 402111) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((515228 : Rat) / 44679) [(8, 1), (9, 1), (14, 1), (15, 5), (16, 1)],
  term (-78 : Rat) [(8, 1), (9, 1), (15, 1)],
  term ((1134179 : Rat) / 1608444) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(8, 1), (9, 1), (15, 3)],
  term ((-1452832 : Rat) / 402111) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (15, 5), (16, 1)],
  term ((87 : Rat) / 2) [(8, 1), (10, 1)],
  term (-192 : Rat) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-628967 : Rat) / 59572) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term (96 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((628967 : Rat) / 119144) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term (-87 : Rat) [(8, 1), (10, 1), (14, 1)],
  term (96 : Rat) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1903535 : Rat) / 268074) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term (-48 : Rat) [(8, 1), (10, 1), (15, 2)],
  term ((-1903535 : Rat) / 536148) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(8, 1), (10, 1), (15, 4), (16, 1)],
  term (192 : Rat) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((628967 : Rat) / 59572) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term (-96 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-628967 : Rat) / 119144) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term (-42 : Rat) [(8, 1), (11, 1), (13, 1)],
  term (84 : Rat) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1180595 : Rat) / 402111) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 804222) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-114 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-410243 : Rat) / 357432) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1201927 : Rat) / 402111) [(8, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term (-96 : Rat) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1120027 : Rat) / 268074) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term (81 : Rat) [(8, 1), (11, 1), (15, 1)],
  term ((3470783 : Rat) / 2144592) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3563117 : Rat) / 1608444) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((21 : Rat) / 2) [(8, 1), (12, 1)],
  term ((-22771511 : Rat) / 1608444) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22771511 : Rat) / 3216888) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(8, 1), (12, 1), (14, 1)],
  term (-96 : Rat) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((12847307 : Rat) / 1072296) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term (48 : Rat) [(8, 1), (12, 1), (15, 2)],
  term ((-12847307 : Rat) / 2144592) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term (-1070 : Rat) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19587443 : Rat) / 3216888) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((3043885 : Rat) / 268074) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (13, 1), (14, 1), (15, 5), (16, 1)],
  term (96 : Rat) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((12266125 : Rat) / 3216888) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term (511 : Rat) [(8, 1), (13, 1), (15, 1)],
  term ((8969587 : Rat) / 4289184) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(8, 1), (13, 1), (15, 3)],
  term ((-664366 : Rat) / 134037) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (13, 1), (15, 5), (16, 1)],
  term (-216 : Rat) [(8, 1), (13, 2)],
  term (432 : Rat) [(8, 1), (13, 2), (14, 1)],
  term ((-189 : Rat) / 2) [(8, 1), (14, 1)],
  term (172 : Rat) [(8, 1), (14, 1), (15, 2)],
  term ((-29172875 : Rat) / 6433776) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term (384 : Rat) [(8, 1), (14, 1), (15, 4)],
  term ((-4155665 : Rat) / 268074) [(8, 1), (14, 1), (15, 4), (16, 1)],
  term ((-515228 : Rat) / 44679) [(8, 1), (14, 1), (15, 6), (16, 1)],
  term ((33 : Rat) / 2) [(8, 1), (14, 2)],
  term (144 : Rat) [(8, 1), (14, 2), (15, 2)],
  term ((-3816727 : Rat) / 357432) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 1), (14, 2), (15, 4), (16, 1)],
  term (-122 : Rat) [(8, 1), (15, 2)],
  term ((31761709 : Rat) / 6433776) [(8, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(8, 1), (15, 4)],
  term ((9470593 : Rat) / 1072296) [(8, 1), (15, 4), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (15, 6), (16, 1)],
  term ((-261 : Rat) / 2) [(8, 2)],
  term (261 : Rat) [(8, 2), (14, 1)],
  term (-288 : Rat) [(8, 2), (14, 1), (15, 2)],
  term ((293569 : Rat) / 268074) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 14893) [(8, 2), (14, 1), (15, 4), (16, 1)],
  term (144 : Rat) [(8, 2), (15, 2)],
  term ((-293569 : Rat) / 536148) [(8, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 2), (15, 4), (16, 1)],
  term (-142 : Rat) [(9, 1), (10, 1), (13, 1)],
  term (284 : Rat) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term (-384 : Rat) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((25660 : Rat) / 7587) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((515228 : Rat) / 44679) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term (192 : Rat) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-12830 : Rat) / 7587) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term (-142 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((9267059 : Rat) / 3216888) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-12830 : Rat) / 7587) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (10, 1), (14, 1), (15, 5), (16, 1)],
  term (71 : Rat) [(9, 1), (10, 1), (15, 1)],
  term ((-9267059 : Rat) / 6433776) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(9, 1), (10, 1), (15, 3)],
  term ((6415 : Rat) / 7587) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (10, 1), (15, 5), (16, 1)],
  term ((29 : Rat) / 2) [(9, 1), (11, 1)],
  term (100 : Rat) [(9, 1), (11, 1), (12, 1)],
  term (-200 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term (384 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2540575 : Rat) / 402111) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-515228 : Rat) / 44679) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term (-192 : Rat) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((2540575 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term (-100 : Rat) [(9, 1), (11, 1), (14, 1)],
  term (192 : Rat) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2540575 : Rat) / 804222) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (11, 1), (14, 1), (15, 4), (16, 1)],
  term (142 : Rat) [(9, 1), (11, 1), (14, 2)],
  term (-192 : Rat) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((12830 : Rat) / 7587) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (11, 1), (14, 2), (15, 4), (16, 1)],
  term (-48 : Rat) [(9, 1), (11, 1), (15, 2)],
  term ((620195 : Rat) / 536148) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term (-271 : Rat) [(9, 1), (12, 1), (13, 1)],
  term (542 : Rat) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term (-192 : Rat) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1066411 : Rat) / 402111) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term (96 : Rat) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1066411 : Rat) / 804222) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 500 through 599. -/
theorem rs_R003_ueqv_R003NN_block_28_0500_0599_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_28_0500_0599
      rs_R003_ueqv_R003NN_block_28_0500_0599 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
