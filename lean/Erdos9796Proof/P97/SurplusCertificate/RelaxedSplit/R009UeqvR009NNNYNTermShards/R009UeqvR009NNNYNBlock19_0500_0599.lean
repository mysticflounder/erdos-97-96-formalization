/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0500 : Poly :=
[
  term ((901532560 : Rat) / 36742197) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 500 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0500 : Poly :=
[
  term ((1803065120 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-901532560 : Rat) / 36742197) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0500_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0500
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0501 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 501 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0501 : Poly :=
[
  term ((6458932858 : Rat) / 918554925) [(4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0501_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0501
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0502 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 502 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0502 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0502_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0502
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0503 : Poly :=
[
  term ((182811013774 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 503 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0503 : Poly :=
[
  term ((365622027548 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-182811013774 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0503_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0503
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0504 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 504 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0504 : Poly :=
[
  term ((82564179176 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0504_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0504
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0505 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(4, 1), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 505 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0505 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(4, 1), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0505_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0505
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0506 : Poly :=
[
  term ((4395520 : Rat) / 36742197) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 506 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0506 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0506_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0506
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0507 : Poly :=
[
  term ((13348005212953 : Rat) / 942437353050) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 507 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0507 : Poly :=
[
  term ((13348005212953 : Rat) / 471218676525) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-13348005212953 : Rat) / 942437353050) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0507_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0507
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0508 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 508 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0508 : Poly :=
[
  term ((121272755524 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0508_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0508
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0509 : Poly :=
[
  term ((-5668507840 : Rat) / 110226591) [(4, 1), (9, 1), (15, 3)]
]

/-- Partial product 509 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0509 : Poly :=
[
  term ((-11337015680 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (15, 3)],
  term ((5668507840 : Rat) / 110226591) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0509_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0509
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0510 : Poly :=
[
  term ((-587 : Rat) / 134) [(4, 1), (9, 2)]
]

/-- Partial product 510 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0510 : Poly :=
[
  term ((-587 : Rat) / 67) [(4, 1), (8, 1), (9, 2)],
  term ((587 : Rat) / 134) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0510_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0510
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0511 : Poly :=
[
  term ((-98 : Rat) / 67) [(4, 1), (9, 2), (10, 1)]
]

/-- Partial product 511 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0511 : Poly :=
[
  term ((-196 : Rat) / 67) [(4, 1), (8, 1), (9, 2), (10, 1)],
  term ((98 : Rat) / 67) [(4, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0511_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0511
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0512 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1)]
]

/-- Partial product 512 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0512 : Poly :=
[
  term ((88204818688 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0512_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0512
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0513 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0513 : Poly :=
[
  term ((-88204818688 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0513_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0513
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0514 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 514 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0514 : Poly :=
[
  term ((1378200292 : Rat) / 698101743) [(4, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0514_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0514
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0515 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 515 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0515 : Poly :=
[
  term ((-1378200292 : Rat) / 698101743) [(4, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0515_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0515
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0516 : Poly :=
[
  term ((98 : Rat) / 67) [(4, 1), (9, 2), (14, 1)]
]

/-- Partial product 516 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0516 : Poly :=
[
  term ((196 : Rat) / 67) [(4, 1), (8, 1), (9, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(4, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0516_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0516
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0517 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2)]
]

/-- Partial product 517 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0517 : Poly :=
[
  term ((-153811535336 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0517_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0517
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0518 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 518 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0518 : Poly :=
[
  term ((153811535336 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0518_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0518
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0519 : Poly :=
[
  term ((-8376465048 : Rat) / 1163502905) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 519 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0519 : Poly :=
[
  term ((-16752930096 : Rat) / 1163502905) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((8376465048 : Rat) / 1163502905) [(4, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0519_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0519
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0520 : Poly :=
[
  term ((510370395916 : Rat) / 31414578435) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 520 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0520 : Poly :=
[
  term ((1020740791832 : Rat) / 31414578435) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-510370395916 : Rat) / 31414578435) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0520_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0520
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0521 : Poly :=
[
  term ((-178697921024 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)]
]

/-- Partial product 521 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0521 : Poly :=
[
  term ((-357395842048 : Rat) / 10471526145) [(4, 1), (8, 1), (10, 1), (11, 2)],
  term ((178697921024 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0521_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0521
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0522 : Poly :=
[
  term ((-609280 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 522 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0522 : Poly :=
[
  term ((-1218560 : Rat) / 12247399) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((609280 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0522_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0522
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0523 : Poly :=
[
  term ((35164160 : Rat) / 330679773) [(4, 1), (10, 1), (15, 2)]
]

/-- Partial product 523 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0523 : Poly :=
[
  term ((70328320 : Rat) / 330679773) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-35164160 : Rat) / 330679773) [(4, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0523_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0523
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0524 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 524 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0524 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0524_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0524
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0525 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 525 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0525 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0525_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0525
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0526 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 526 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0526 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0526_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0526
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0527 : Poly :=
[
  term ((1110595840 : Rat) / 330679773) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 527 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0527 : Poly :=
[
  term ((2221191680 : Rat) / 330679773) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1110595840 : Rat) / 330679773) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0527_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0527
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0528 : Poly :=
[
  term ((291282614 : Rat) / 1163502905) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 528 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0528 : Poly :=
[
  term ((582565228 : Rat) / 1163502905) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-291282614 : Rat) / 1163502905) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0528_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0528
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0529 : Poly :=
[
  term ((-8377600 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 529 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0529 : Poly :=
[
  term ((-16755200 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((8377600 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0529_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0529
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0530 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 2)]
]

/-- Partial product 530 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0530 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0530_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0530
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0531 : Poly :=
[
  term ((-68130560 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 531 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0531 : Poly :=
[
  term ((-136261120 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((68130560 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0531_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0531
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0532 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 532 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0532 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0532_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0532
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0533 : Poly :=
[
  term ((153741932 : Rat) / 330679773) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 533 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0533 : Poly :=
[
  term ((307483864 : Rat) / 330679773) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-153741932 : Rat) / 330679773) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0533_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0533
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0534 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(4, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 534 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0534 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(4, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0534_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0534
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0535 : Poly :=
[
  term ((-830101131839 : Rat) / 94243735305) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 535 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0535 : Poly :=
[
  term ((-1660202263678 : Rat) / 94243735305) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((830101131839 : Rat) / 94243735305) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0535_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0535
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0536 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(4, 1), (11, 1), (15, 3)]
]

/-- Partial product 536 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0536 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0536_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0536
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0537 : Poly :=
[
  term ((18642087296 : Rat) / 31414578435) [(4, 1), (11, 2)]
]

/-- Partial product 537 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0537 : Poly :=
[
  term ((37284174592 : Rat) / 31414578435) [(4, 1), (8, 1), (11, 2)],
  term ((-18642087296 : Rat) / 31414578435) [(4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0537_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0537
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0538 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1)]
]

/-- Partial product 538 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0538 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0538_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0538
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0539 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 539 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0539 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0539_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0539
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0540 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 540 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0540 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0540_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0540
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0541 : Poly :=
[
  term ((-536166400 : Rat) / 330679773) [(4, 1), (11, 2), (14, 1)]
]

/-- Partial product 541 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0541 : Poly :=
[
  term ((-1072332800 : Rat) / 330679773) [(4, 1), (8, 1), (11, 2), (14, 1)],
  term ((536166400 : Rat) / 330679773) [(4, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0541_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0541
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0542 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(4, 1), (11, 2), (14, 2)]
]

/-- Partial product 542 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0542 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(4, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0542_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0542
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0543 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 543 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0543 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((-9748480 : Rat) / 110226591) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0543_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0543
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0544 : Poly :=
[
  term ((36 : Rat) / 67) [(4, 1), (12, 1)]
]

/-- Partial product 544 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0544 : Poly :=
[
  term ((72 : Rat) / 67) [(4, 1), (8, 1), (12, 1)],
  term ((-36 : Rat) / 67) [(4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0544_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0544
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0545 : Poly :=
[
  term ((14056420 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 545 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0545 : Poly :=
[
  term ((28112840 : Rat) / 12247399) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14056420 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0545_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0545
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0546 : Poly :=
[
  term ((-1166613608 : Rat) / 330679773) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 546 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0546 : Poly :=
[
  term ((-2333227216 : Rat) / 330679773) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((1166613608 : Rat) / 330679773) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0546_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0546
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0547 : Poly :=
[
  term ((-114240 : Rat) / 12247399) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 547 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0547 : Poly :=
[
  term ((-228480 : Rat) / 12247399) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((114240 : Rat) / 12247399) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0547_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0547
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0548 : Poly :=
[
  term ((-5227508867 : Rat) / 1396203486) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 548 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0548 : Poly :=
[
  term ((-5227508867 : Rat) / 698101743) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((5227508867 : Rat) / 1396203486) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0548_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0548
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0549 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(4, 1), (13, 1), (15, 3)]
]

/-- Partial product 549 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0549 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0549_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0549
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0550 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)]
]

/-- Partial product 550 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0550 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(4, 1), (8, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0550_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0550
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0551 : Poly :=
[
  term ((-12 : Rat) / 67) [(4, 1), (14, 1)]
]

/-- Partial product 551 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0551 : Poly :=
[
  term ((-24 : Rat) / 67) [(4, 1), (8, 1), (14, 1)],
  term ((12 : Rat) / 67) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0551_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0551
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0552 : Poly :=
[
  term ((2197760 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 552 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0552 : Poly :=
[
  term ((4395520 : Rat) / 110226591) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2197760 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0552_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0552
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0553 : Poly :=
[
  term ((161353754594 : Rat) / 18848747061) [(4, 1), (15, 2)]
]

/-- Partial product 553 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0553 : Poly :=
[
  term ((322707509188 : Rat) / 18848747061) [(4, 1), (8, 1), (15, 2)],
  term ((-161353754594 : Rat) / 18848747061) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0553_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0553
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0554 : Poly :=
[
  term ((-317542400 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1)]
]

/-- Partial product 554 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0554 : Poly :=
[
  term ((-635084800 : Rat) / 110226591) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term ((317542400 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0554_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0554
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0555 : Poly :=
[
  term ((-14884800 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1)]
]

/-- Partial product 555 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0555 : Poly :=
[
  term ((-29769600 : Rat) / 12247399) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((14884800 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0555_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0555
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0556 : Poly :=
[
  term ((286355200 : Rat) / 110226591) [(4, 2), (7, 1), (15, 1)]
]

/-- Partial product 556 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0556 : Poly :=
[
  term ((572710400 : Rat) / 110226591) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(4, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0556_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0556
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0557 : Poly :=
[
  term ((-1264 : Rat) / 67) [(5, 1), (6, 1), (7, 1)]
]

/-- Partial product 557 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0557 : Poly :=
[
  term ((1264 : Rat) / 67) [(5, 1), (6, 1), (7, 1)],
  term ((-2528 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0557_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0557
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0558 : Poly :=
[
  term ((20839164776192 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 558 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0558 : Poly :=
[
  term ((41678329552384 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-20839164776192 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0558_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0558
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0559 : Poly :=
[
  term ((325611949628 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 559 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0559 : Poly :=
[
  term ((651223899256 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-325611949628 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0559_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0559
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0560 : Poly :=
[
  term ((-23476515399766 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 560 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0560 : Poly :=
[
  term ((-46953030799532 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((23476515399766 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0560_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0560
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0561 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 561 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0561 : Poly :=
[
  term ((795686080 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-397843040 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0561_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0561
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0562 : Poly :=
[
  term ((-33753231443752 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 562 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0562 : Poly :=
[
  term ((-67506462887504 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0562_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0562
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0563 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0563 : Poly :=
[
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0563_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0563
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0564 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (11, 2)]
]

/-- Partial product 564 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0564 : Poly :=
[
  term ((50923909120 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 2)],
  term ((-25461954560 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0564_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0564
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0565 : Poly :=
[
  term ((-323864637768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 565 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0565 : Poly :=
[
  term ((-647729275536 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((323864637768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0565_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0565
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0566 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 566 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0566 : Poly :=
[
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0566_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0566
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0567 : Poly :=
[
  term ((392 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (14, 1)]
]

/-- Partial product 567 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0567 : Poly :=
[
  term ((784 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0567_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0567
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0568 : Poly :=
[
  term ((2094906592144 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 568 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0568 : Poly :=
[
  term ((4189813184288 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-2094906592144 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0568_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0568
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0569 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 569 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0569 : Poly :=
[
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0569_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0569
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0570 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (11, 1)]
]

/-- Partial product 570 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0570 : Poly :=
[
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (11, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0570_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0570
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0571 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (13, 1)]
]

/-- Partial product 571 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0571 : Poly :=
[
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (8, 1), (13, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0571_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0571
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0572 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (15, 1)]
]

/-- Partial product 572 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0572 : Poly :=
[
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (15, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0572_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0572
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0573 : Poly :=
[
  term ((1133 : Rat) / 134) [(5, 1), (6, 1), (9, 1)]
]

/-- Partial product 573 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0573 : Poly :=
[
  term ((1133 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-1133 : Rat) / 134) [(5, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0573_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0573
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0574 : Poly :=
[
  term ((-596764560 : Rat) / 12247399) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 574 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0574 : Poly :=
[
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0574_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0574
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0575 : Poly :=
[
  term ((4584858115156 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 575 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0575 : Poly :=
[
  term ((9169716230312 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4584858115156 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0575_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0575
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0576 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0576 : Poly :=
[
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0576_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0576
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0577 : Poly :=
[
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (6, 1), (9, 1), (11, 2)]
]

/-- Partial product 577 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0577 : Poly :=
[
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (6, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0577_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0577
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0578 : Poly :=
[
  term ((35003079412 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 578 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0578 : Poly :=
[
  term ((70006158824 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-35003079412 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0578_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0578
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0579 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0579 : Poly :=
[
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0579_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0579
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0580 : Poly :=
[
  term ((-1823250517964 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 580 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0580 : Poly :=
[
  term ((-3646501035928 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((1823250517964 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0580_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0580
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0581 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 581 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0581 : Poly :=
[
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0581_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0581
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0582 : Poly :=
[
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (11, 1)]
]

/-- Partial product 582 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0582 : Poly :=
[
  term ((-44102409344 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0582_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0582
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0583 : Poly :=
[
  term ((-344550073 : Rat) / 232700581) [(5, 1), (6, 1), (9, 2), (13, 1)]
]

/-- Partial product 583 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0583 : Poly :=
[
  term ((-689100146 : Rat) / 232700581) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (6, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0583_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0583
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0584 : Poly :=
[
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (15, 1)]
]

/-- Partial product 584 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0584 : Poly :=
[
  term ((76905767668 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0584_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0584
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0585 : Poly :=
[
  term ((-4012116182972 : Rat) / 157072892175) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 585 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0585 : Poly :=
[
  term ((-8024232365944 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((4012116182972 : Rat) / 157072892175) [(5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0585_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0585
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0586 : Poly :=
[
  term ((-41791359232 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 586 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0586 : Poly :=
[
  term ((-83582718464 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((41791359232 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0586_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0586
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0587 : Poly :=
[
  term ((-779878400 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 587 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0587 : Poly :=
[
  term ((-1559756800 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((779878400 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0587_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0587
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0588 : Poly :=
[
  term ((-101749760 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 588 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0588 : Poly :=
[
  term ((-203499520 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((101749760 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0588_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0588
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0589 : Poly :=
[
  term ((710213229824 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 589 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0589 : Poly :=
[
  term ((1420426459648 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-710213229824 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0589_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0589
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0590 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 590 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0590 : Poly :=
[
  term ((-77987840 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0590_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0590
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0591 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 591 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0591 : Poly :=
[
  term ((-413371702912 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0591_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0591
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0592 : Poly :=
[
  term ((7600001600 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 592 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0592 : Poly :=
[
  term ((15200003200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-7600001600 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0592_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0592
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0593 : Poly :=
[
  term ((4640 : Rat) / 201) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 593 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0593 : Poly :=
[
  term ((9280 : Rat) / 201) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0593_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0593
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0594 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 594 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0594 : Poly :=
[
  term ((810187430512 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0594_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0594
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0595 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 595 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0595 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0595_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0595
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0596 : Poly :=
[
  term ((-652989988 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 596 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0596 : Poly :=
[
  term ((-1305979976 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((652989988 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0596_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0596
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0597 : Poly :=
[
  term ((-36556800 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 597 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0597 : Poly :=
[
  term ((-73113600 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((36556800 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0597_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0597
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0598 : Poly :=
[
  term ((37509172052 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 598 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0598 : Poly :=
[
  term ((75018344104 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-37509172052 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0598_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0598
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0599 : Poly :=
[
  term ((-126 : Rat) / 67) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0599 : Poly :=
[
  term ((-252 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0599_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0599
        rs_R009_ueqv_R009NNNYN_generator_19_0500_0599 =
      rs_R009_ueqv_R009NNNYN_partial_19_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_0500_0599 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_0500,
  rs_R009_ueqv_R009NNNYN_partial_19_0501,
  rs_R009_ueqv_R009NNNYN_partial_19_0502,
  rs_R009_ueqv_R009NNNYN_partial_19_0503,
  rs_R009_ueqv_R009NNNYN_partial_19_0504,
  rs_R009_ueqv_R009NNNYN_partial_19_0505,
  rs_R009_ueqv_R009NNNYN_partial_19_0506,
  rs_R009_ueqv_R009NNNYN_partial_19_0507,
  rs_R009_ueqv_R009NNNYN_partial_19_0508,
  rs_R009_ueqv_R009NNNYN_partial_19_0509,
  rs_R009_ueqv_R009NNNYN_partial_19_0510,
  rs_R009_ueqv_R009NNNYN_partial_19_0511,
  rs_R009_ueqv_R009NNNYN_partial_19_0512,
  rs_R009_ueqv_R009NNNYN_partial_19_0513,
  rs_R009_ueqv_R009NNNYN_partial_19_0514,
  rs_R009_ueqv_R009NNNYN_partial_19_0515,
  rs_R009_ueqv_R009NNNYN_partial_19_0516,
  rs_R009_ueqv_R009NNNYN_partial_19_0517,
  rs_R009_ueqv_R009NNNYN_partial_19_0518,
  rs_R009_ueqv_R009NNNYN_partial_19_0519,
  rs_R009_ueqv_R009NNNYN_partial_19_0520,
  rs_R009_ueqv_R009NNNYN_partial_19_0521,
  rs_R009_ueqv_R009NNNYN_partial_19_0522,
  rs_R009_ueqv_R009NNNYN_partial_19_0523,
  rs_R009_ueqv_R009NNNYN_partial_19_0524,
  rs_R009_ueqv_R009NNNYN_partial_19_0525,
  rs_R009_ueqv_R009NNNYN_partial_19_0526,
  rs_R009_ueqv_R009NNNYN_partial_19_0527,
  rs_R009_ueqv_R009NNNYN_partial_19_0528,
  rs_R009_ueqv_R009NNNYN_partial_19_0529,
  rs_R009_ueqv_R009NNNYN_partial_19_0530,
  rs_R009_ueqv_R009NNNYN_partial_19_0531,
  rs_R009_ueqv_R009NNNYN_partial_19_0532,
  rs_R009_ueqv_R009NNNYN_partial_19_0533,
  rs_R009_ueqv_R009NNNYN_partial_19_0534,
  rs_R009_ueqv_R009NNNYN_partial_19_0535,
  rs_R009_ueqv_R009NNNYN_partial_19_0536,
  rs_R009_ueqv_R009NNNYN_partial_19_0537,
  rs_R009_ueqv_R009NNNYN_partial_19_0538,
  rs_R009_ueqv_R009NNNYN_partial_19_0539,
  rs_R009_ueqv_R009NNNYN_partial_19_0540,
  rs_R009_ueqv_R009NNNYN_partial_19_0541,
  rs_R009_ueqv_R009NNNYN_partial_19_0542,
  rs_R009_ueqv_R009NNNYN_partial_19_0543,
  rs_R009_ueqv_R009NNNYN_partial_19_0544,
  rs_R009_ueqv_R009NNNYN_partial_19_0545,
  rs_R009_ueqv_R009NNNYN_partial_19_0546,
  rs_R009_ueqv_R009NNNYN_partial_19_0547,
  rs_R009_ueqv_R009NNNYN_partial_19_0548,
  rs_R009_ueqv_R009NNNYN_partial_19_0549,
  rs_R009_ueqv_R009NNNYN_partial_19_0550,
  rs_R009_ueqv_R009NNNYN_partial_19_0551,
  rs_R009_ueqv_R009NNNYN_partial_19_0552,
  rs_R009_ueqv_R009NNNYN_partial_19_0553,
  rs_R009_ueqv_R009NNNYN_partial_19_0554,
  rs_R009_ueqv_R009NNNYN_partial_19_0555,
  rs_R009_ueqv_R009NNNYN_partial_19_0556,
  rs_R009_ueqv_R009NNNYN_partial_19_0557,
  rs_R009_ueqv_R009NNNYN_partial_19_0558,
  rs_R009_ueqv_R009NNNYN_partial_19_0559,
  rs_R009_ueqv_R009NNNYN_partial_19_0560,
  rs_R009_ueqv_R009NNNYN_partial_19_0561,
  rs_R009_ueqv_R009NNNYN_partial_19_0562,
  rs_R009_ueqv_R009NNNYN_partial_19_0563,
  rs_R009_ueqv_R009NNNYN_partial_19_0564,
  rs_R009_ueqv_R009NNNYN_partial_19_0565,
  rs_R009_ueqv_R009NNNYN_partial_19_0566,
  rs_R009_ueqv_R009NNNYN_partial_19_0567,
  rs_R009_ueqv_R009NNNYN_partial_19_0568,
  rs_R009_ueqv_R009NNNYN_partial_19_0569,
  rs_R009_ueqv_R009NNNYN_partial_19_0570,
  rs_R009_ueqv_R009NNNYN_partial_19_0571,
  rs_R009_ueqv_R009NNNYN_partial_19_0572,
  rs_R009_ueqv_R009NNNYN_partial_19_0573,
  rs_R009_ueqv_R009NNNYN_partial_19_0574,
  rs_R009_ueqv_R009NNNYN_partial_19_0575,
  rs_R009_ueqv_R009NNNYN_partial_19_0576,
  rs_R009_ueqv_R009NNNYN_partial_19_0577,
  rs_R009_ueqv_R009NNNYN_partial_19_0578,
  rs_R009_ueqv_R009NNNYN_partial_19_0579,
  rs_R009_ueqv_R009NNNYN_partial_19_0580,
  rs_R009_ueqv_R009NNNYN_partial_19_0581,
  rs_R009_ueqv_R009NNNYN_partial_19_0582,
  rs_R009_ueqv_R009NNNYN_partial_19_0583,
  rs_R009_ueqv_R009NNNYN_partial_19_0584,
  rs_R009_ueqv_R009NNNYN_partial_19_0585,
  rs_R009_ueqv_R009NNNYN_partial_19_0586,
  rs_R009_ueqv_R009NNNYN_partial_19_0587,
  rs_R009_ueqv_R009NNNYN_partial_19_0588,
  rs_R009_ueqv_R009NNNYN_partial_19_0589,
  rs_R009_ueqv_R009NNNYN_partial_19_0590,
  rs_R009_ueqv_R009NNNYN_partial_19_0591,
  rs_R009_ueqv_R009NNNYN_partial_19_0592,
  rs_R009_ueqv_R009NNNYN_partial_19_0593,
  rs_R009_ueqv_R009NNNYN_partial_19_0594,
  rs_R009_ueqv_R009NNNYN_partial_19_0595,
  rs_R009_ueqv_R009NNNYN_partial_19_0596,
  rs_R009_ueqv_R009NNNYN_partial_19_0597,
  rs_R009_ueqv_R009NNNYN_partial_19_0598,
  rs_R009_ueqv_R009NNNYN_partial_19_0599
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_0500_0599 : Poly :=
[
  term ((1803065120 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(4, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term ((365622027548 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((82564179176 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((13348005212953 : Rat) / 471218676525) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((121272755524 : Rat) / 24800982975) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11337015680 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-587 : Rat) / 67) [(4, 1), (8, 1), (9, 2)],
  term ((-196 : Rat) / 67) [(4, 1), (8, 1), (9, 2), (10, 1)],
  term ((88204818688 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(4, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1378200292 : Rat) / 698101743) [(4, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(4, 1), (8, 1), (9, 2), (14, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (15, 2)],
  term ((153811535336 : Rat) / 18848747061) [(4, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-16752930096 : Rat) / 1163502905) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1020740791832 : Rat) / 31414578435) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-357395842048 : Rat) / 10471526145) [(4, 1), (8, 1), (10, 1), (11, 2)],
  term ((-1218560 : Rat) / 12247399) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((70328320 : Rat) / 330679773) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-7311360 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-351641600 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2221191680 : Rat) / 330679773) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((582565228 : Rat) / 1163502905) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-16755200 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-136261120 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((307483864 : Rat) / 330679773) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1660202263678 : Rat) / 94243735305) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((37284174592 : Rat) / 31414578435) [(4, 1), (8, 1), (11, 2)],
  term ((-155975680 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1072332800 : Rat) / 330679773) [(4, 1), (8, 1), (11, 2), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (14, 2)],
  term ((19496960 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((72 : Rat) / 67) [(4, 1), (8, 1), (12, 1)],
  term ((28112840 : Rat) / 12247399) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2333227216 : Rat) / 330679773) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-228480 : Rat) / 12247399) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5227508867 : Rat) / 698101743) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(4, 1), (8, 1), (13, 2), (15, 2)],
  term ((-24 : Rat) / 67) [(4, 1), (8, 1), (14, 1)],
  term ((4395520 : Rat) / 110226591) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((322707509188 : Rat) / 18848747061) [(4, 1), (8, 1), (15, 2)],
  term ((-901532560 : Rat) / 36742197) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((-182811013774 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-4395520 : Rat) / 36742197) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-13348005212953 : Rat) / 942437353050) [(4, 1), (9, 1), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((5668507840 : Rat) / 110226591) [(4, 1), (9, 1), (15, 3)],
  term ((587 : Rat) / 134) [(4, 1), (9, 2)],
  term ((98 : Rat) / 67) [(4, 1), (9, 2), (10, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98 : Rat) / 67) [(4, 1), (9, 2), (14, 1)],
  term ((76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((8376465048 : Rat) / 1163502905) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-510370395916 : Rat) / 31414578435) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((178697921024 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)],
  term ((609280 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 330679773) [(4, 1), (10, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1110595840 : Rat) / 330679773) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-291282614 : Rat) / 1163502905) [(4, 1), (11, 1), (13, 1)],
  term ((8377600 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((68130560 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-153741932 : Rat) / 330679773) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((830101131839 : Rat) / 94243735305) [(4, 1), (11, 1), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(4, 1), (11, 1), (15, 3)],
  term ((-18642087296 : Rat) / 31414578435) [(4, 1), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((536166400 : Rat) / 330679773) [(4, 1), (11, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(4, 1), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 110226591) [(4, 1), (11, 2), (15, 2)],
  term ((-36 : Rat) / 67) [(4, 1), (12, 1)],
  term ((-14056420 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((1166613608 : Rat) / 330679773) [(4, 1), (12, 1), (15, 2)],
  term ((114240 : Rat) / 12247399) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((5227508867 : Rat) / 1396203486) [(4, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(4, 1), (13, 1), (15, 3)],
  term ((913920 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)],
  term ((12 : Rat) / 67) [(4, 1), (14, 1)],
  term ((-2197760 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((-161353754594 : Rat) / 18848747061) [(4, 1), (15, 2)],
  term ((-635084800 : Rat) / 110226591) [(4, 2), (7, 1), (8, 1), (11, 1)],
  term ((-29769600 : Rat) / 12247399) [(4, 2), (7, 1), (8, 1), (13, 1)],
  term ((572710400 : Rat) / 110226591) [(4, 2), (7, 1), (8, 1), (15, 1)],
  term ((317542400 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1)],
  term ((14884800 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1)],
  term ((-286355200 : Rat) / 110226591) [(4, 2), (7, 1), (15, 1)],
  term ((1264 : Rat) / 67) [(5, 1), (6, 1), (7, 1)],
  term ((-2528 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1)],
  term ((41678329552384 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((651223899256 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-46953030799532 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((795686080 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-67506462887504 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((50923909120 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 2)],
  term ((-647729275536 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((784 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((4189813184288 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-20839164776192 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-325611949628 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((23476515399766 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-397843040 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (11, 2)],
  term ((323864637768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (14, 1)],
  term ((-2094906592144 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (11, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (8, 1), (13, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (11, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (13, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (15, 1)],
  term ((1133 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((9169716230312 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2)],
  term ((70006158824 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3646501035928 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-44102409344 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1)],
  term ((-689100146 : Rat) / 232700581) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1)],
  term ((76905767668 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1)],
  term ((-8024232365944 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((-83582718464 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1559756800 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-203499520 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1420426459648 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-77987840 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-413371702912 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((15200003200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((9280 : Rat) / 201) [(5, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((810187430512 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-389939200 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1305979976 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-73113600 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((75018344104 : Rat) / 330679773) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-252 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1133 : Rat) / 134) [(5, 1), (6, 1), (9, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-4584858115156 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (6, 1), (9, 1), (11, 2)],
  term ((-35003079412 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1823250517964 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (6, 1), (9, 2), (13, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((4012116182972 : Rat) / 157072892175) [(5, 1), (6, 1), (11, 1)],
  term ((41791359232 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((779878400 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((101749760 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-710213229824 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7600001600 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((652989988 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((36556800 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-37509172052 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 500 through 599. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_0500_0599_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_0500_0599
      rs_R009_ueqv_R009NNNYN_block_19_0500_0599 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
