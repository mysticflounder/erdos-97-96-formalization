/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0600 : Poly :=
[
  term ((703283200 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 3)]
]

/-- Partial product 600 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0600 : Poly :=
[
  term ((1406566400 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-703283200 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0600_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0600
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0601 : Poly :=
[
  term ((-42446488021 : Rat) / 11635029050) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 601 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0601 : Poly :=
[
  term ((-42446488021 : Rat) / 5817514525) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((42446488021 : Rat) / 11635029050) [(5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0601_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0601
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0602 : Poly :=
[
  term ((11097081716 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 602 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0602 : Poly :=
[
  term ((22194163432 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-11097081716 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0602_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0602
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0603 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 603 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0603 : Poly :=
[
  term ((-10967040 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0603_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0603
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0604 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 604 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0604 : Poly :=
[
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0604_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0604
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0605 : Poly :=
[
  term ((5296609120 : Rat) / 110226591) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 605 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0605 : Poly :=
[
  term ((10593218240 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-5296609120 : Rat) / 110226591) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0605_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0605
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0606 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 606 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0606 : Poly :=
[
  term ((6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0606_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0606
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0607 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 607 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0607 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0607_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0607
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0608 : Poly :=
[
  term ((-350251627552 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 608 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0608 : Poly :=
[
  term ((-700503255104 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((350251627552 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0608_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0608
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0609 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0609 : Poly :=
[
  term ((82564179176 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0609_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0609
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0610 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(5, 1), (6, 1), (14, 1), (15, 3)]
]

/-- Partial product 610 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0610 : Poly :=
[
  term ((70328320 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(5, 1), (6, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0610_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0610
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0611 : Poly :=
[
  term ((-991328179694 : Rat) / 157072892175) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 611 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0611 : Poly :=
[
  term ((-1982656359388 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((991328179694 : Rat) / 157072892175) [(5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0611_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0611
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0612 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0612 : Poly :=
[
  term ((121272755524 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0612_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0612
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0613 : Poly :=
[
  term ((-11284269440 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)]
]

/-- Partial product 613 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0613 : Poly :=
[
  term ((-22568538880 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((11284269440 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0613_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0613
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0614 : Poly :=
[
  term ((6427 : Rat) / 268) [(5, 1), (7, 1)]
]

/-- Partial product 614 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0614 : Poly :=
[
  term ((-6427 : Rat) / 268) [(5, 1), (7, 1)],
  term ((6427 : Rat) / 134) [(5, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0614_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0614
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0615 : Poly :=
[
  term ((-457 : Rat) / 134) [(5, 1), (7, 1), (8, 1)]
]

/-- Partial product 615 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0615 : Poly :=
[
  term ((457 : Rat) / 134) [(5, 1), (7, 1), (8, 1)],
  term ((-457 : Rat) / 67) [(5, 1), (7, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0615_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0615
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0616 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 616 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0616 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0616_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0616
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0617 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 617 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0617 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (7, 1), (8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0617_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0617
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0618 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 618 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0618 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0618_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0618
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0619 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 619 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0619 : Poly :=
[
  term ((-397843040 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((795686080 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0619_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0619
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0620 : Poly :=
[
  term ((-20595495082024 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 620 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0620 : Poly :=
[
  term ((20595495082024 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-41190990164048 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0620_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0620
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0621 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0621 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0621_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0621
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0622 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(5, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 622 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0622 : Poly :=
[
  term ((-25461954560 : Rat) / 330679773) [(5, 1), (7, 1), (8, 1), (11, 2)],
  term ((50923909120 : Rat) / 330679773) [(5, 1), (7, 1), (8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0622_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0622
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0623 : Poly :=
[
  term ((-118275007116 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 623 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0623 : Poly :=
[
  term ((118275007116 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-236550014232 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0623_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0623
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0624 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0624 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0624_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0624
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0625 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 625 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0625 : Poly :=
[
  term ((196 : Rat) / 67) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (7, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0625_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0625
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0626 : Poly :=
[
  term ((1494970619084 : Rat) / 52357630725) [(5, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 626 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0626 : Poly :=
[
  term ((-1494970619084 : Rat) / 52357630725) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((2989941238168 : Rat) / 52357630725) [(5, 1), (7, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0626_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0626
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0627 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0627 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0627_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0627
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0628 : Poly :=
[
  term ((-22493005126592 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 628 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0628 : Poly :=
[
  term ((-44986010253184 : Rat) / 471218676525) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((22493005126592 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0628_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0628
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0629 : Poly :=
[
  term ((-351453205103 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 629 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0629 : Poly :=
[
  term ((-702906410206 : Rat) / 17452543575) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((351453205103 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0629_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0629
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0630 : Poly :=
[
  term ((26360481687316 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 630 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0630 : Poly :=
[
  term ((52720963374632 : Rat) / 471218676525) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-26360481687316 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0630_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0630
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0631 : Poly :=
[
  term ((-994607600 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 631 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0631 : Poly :=
[
  term ((-1989215200 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((994607600 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0631_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0631
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0632 : Poly :=
[
  term ((64646474066788 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 632 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0632 : Poly :=
[
  term ((129292948133576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-64646474066788 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0632_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0632
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0633 : Poly :=
[
  term ((2192956060288 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0633 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0633_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0633
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0634 : Poly :=
[
  term ((-63654886400 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)]
]

/-- Partial product 634 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0634 : Poly :=
[
  term ((-127309772800 : Rat) / 330679773) [(5, 1), (7, 1), (8, 1), (11, 2)],
  term ((63654886400 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0634_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0634
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0635 : Poly :=
[
  term ((501277148442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 635 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0635 : Poly :=
[
  term ((1002554296884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-501277148442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0635_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0635
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0636 : Poly :=
[
  term ((34264938442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0636 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0636_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0636
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0637 : Poly :=
[
  term ((-98 : Rat) / 67) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 637 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0637 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term ((98 : Rat) / 67) [(5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0637_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0637
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0638 : Poly :=
[
  term ((-2842391901686 : Rat) / 17452543575) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 638 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0638 : Poly :=
[
  term ((-5684783803372 : Rat) / 17452543575) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((2842391901686 : Rat) / 17452543575) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0638_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0638
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0639 : Poly :=
[
  term ((-2394874578674 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 639 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0639 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0639_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0639
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0640 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 1), (11, 1)]
]

/-- Partial product 640 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0640 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 1), (11, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0640_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0640
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0641 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 1), (13, 1)]
]

/-- Partial product 641 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0641 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0641_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0641
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0642 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 1), (15, 1)]
]

/-- Partial product 642 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0642 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0642_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0642
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0643 : Poly :=
[
  term ((2192956060288 : Rat) / 31414578435) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 643 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0643 : Poly :=
[
  term ((4385912120576 : Rat) / 31414578435) [(5, 1), (7, 2), (8, 1), (11, 1)],
  term ((-2192956060288 : Rat) / 31414578435) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0643_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0643
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0644 : Poly :=
[
  term ((34264938442 : Rat) / 1163502905) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 644 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0644 : Poly :=
[
  term ((68529876884 : Rat) / 1163502905) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-34264938442 : Rat) / 1163502905) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0644_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0644
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0645 : Poly :=
[
  term ((-2394874578674 : Rat) / 31414578435) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 645 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0645 : Poly :=
[
  term ((-4789749157348 : Rat) / 31414578435) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((2394874578674 : Rat) / 31414578435) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0645_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0645
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0646 : Poly :=
[
  term ((587 : Rat) / 134) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 646 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0646 : Poly :=
[
  term ((-587 : Rat) / 134) [(5, 1), (8, 1), (9, 1)],
  term ((587 : Rat) / 67) [(5, 1), (8, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0646_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0646
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0647 : Poly :=
[
  term ((98 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 647 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0647 : Poly :=
[
  term ((-98 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0647_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0647
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0648 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 648 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0648 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0648_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0648
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0649 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0649 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0649_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0649
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0650 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 650 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0650 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0650_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0650
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0651 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0651 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0651_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0651
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0652 : Poly :=
[
  term ((-98 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 652 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0652 : Poly :=
[
  term ((98 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0652_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0652
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0653 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 653 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0653 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0653_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0653
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0654 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 654 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0654 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0654_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0654
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0655 : Poly :=
[
  term ((-266194670336 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 655 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0655 : Poly :=
[
  term ((266194670336 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-532389340672 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0655_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0655
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0656 : Poly :=
[
  term ((-4159291724 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 656 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0656 : Poly :=
[
  term ((4159291724 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-8318583448 : Rat) / 1163502905) [(5, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0656_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0656
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0657 : Poly :=
[
  term ((255367111558 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 657 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0657 : Poly :=
[
  term ((-255367111558 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((510734223116 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0657_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0657
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0658 : Poly :=
[
  term ((15458038088518 : Rat) / 471218676525) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 658 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0658 : Poly :=
[
  term ((-15458038088518 : Rat) / 471218676525) [(5, 1), (8, 1), (11, 1)],
  term ((30916076177036 : Rat) / 471218676525) [(5, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0658_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0658
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0659 : Poly :=
[
  term ((19956976256 : Rat) / 330679773) [(5, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 659 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0659 : Poly :=
[
  term ((-19956976256 : Rat) / 330679773) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((39913952512 : Rat) / 330679773) [(5, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0659_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0659
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0660 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 660 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0660 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0660_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0660
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0661 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 661 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0661 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((779878400 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0661_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0661
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0662 : Poly :=
[
  term ((30464000 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 662 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0662 : Poly :=
[
  term ((-30464000 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((60928000 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0662_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0662
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0663 : Poly :=
[
  term ((28404457088 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 663 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0663 : Poly :=
[
  term ((-28404457088 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((56808914176 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0663_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0663
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0664 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 664 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0664 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0664_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0664
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0665 : Poly :=
[
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 665 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0665 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0665_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0665
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0666 : Poly :=
[
  term ((4874240 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 2)]
]

/-- Partial product 666 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0666 : Poly :=
[
  term ((-4874240 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0666_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0666
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0667 : Poly :=
[
  term ((-423518240 : Rat) / 12247399) [(5, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 667 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0667 : Poly :=
[
  term ((423518240 : Rat) / 12247399) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-847036480 : Rat) / 12247399) [(5, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0667_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0667
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0668 : Poly :=
[
  term ((-4640 : Rat) / 201) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0668 : Poly :=
[
  term ((4640 : Rat) / 201) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9280 : Rat) / 201) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0668_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0668
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0669 : Poly :=
[
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 669 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0669 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0669_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0669
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0670 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 670 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0670 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((155975680 : Rat) / 110226591) [(5, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0670_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0670
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0671 : Poly :=
[
  term ((311827754 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 671 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0671 : Poly :=
[
  term ((-311827754 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((623655508 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0671_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0671
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0672 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 672 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0672 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0672_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0672
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0673 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 673 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0673 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((36556800 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0673_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0673
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0674 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 674 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0674 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0674_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0674
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0675 : Poly :=
[
  term ((-17730398062 : Rat) / 330679773) [(5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 675 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0675 : Poly :=
[
  term ((17730398062 : Rat) / 330679773) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-35460796124 : Rat) / 330679773) [(5, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0675_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0675
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0676 : Poly :=
[
  term ((126 : Rat) / 67) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0676 : Poly :=
[
  term ((-126 : Rat) / 67) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 67) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0676_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0676
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0677 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 677 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0677 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-703283200 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0677_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0677
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0678 : Poly :=
[
  term ((722605788373 : Rat) / 69810174300) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 678 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0678 : Poly :=
[
  term ((-722605788373 : Rat) / 69810174300) [(5, 1), (8, 1), (13, 1)],
  term ((722605788373 : Rat) / 34905087150) [(5, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0678_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0678
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0679 : Poly :=
[
  term ((443819642 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 679 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0679 : Poly :=
[
  term ((-443819642 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((887639284 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0679_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0679
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0680 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 680 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0680 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0680_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0680
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0681 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 681 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0681 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0681_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0681
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0682 : Poly :=
[
  term ((685440 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 682 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0682 : Poly :=
[
  term ((-685440 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((1370880 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0682_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0682
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0683 : Poly :=
[
  term ((-901532560 : Rat) / 36742197) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 683 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0683 : Poly :=
[
  term ((901532560 : Rat) / 36742197) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1803065120 : Rat) / 36742197) [(5, 1), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0683_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0683
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0684 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 684 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0684 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0684_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0684
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0685 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 685 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0685 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (8, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0685_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0685
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0686 : Poly :=
[
  term ((-182811013774 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 686 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0686 : Poly :=
[
  term ((182811013774 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-365622027548 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0686_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0686
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0687 : Poly :=
[
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0687 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0687_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0687
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0688 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 688 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0688 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(5, 1), (8, 1), (14, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(5, 1), (8, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0688_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0688
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0689 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(5, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 689 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0689 : Poly :=
[
  term ((4395520 : Rat) / 36742197) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (8, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0689_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0689
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0690 : Poly :=
[
  term ((-13333938983803 : Rat) / 942437353050) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 690 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0690 : Poly :=
[
  term ((13333938983803 : Rat) / 942437353050) [(5, 1), (8, 1), (15, 1)],
  term ((-13333938983803 : Rat) / 471218676525) [(5, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0690_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0690
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0691 : Poly :=
[
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 691 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0691 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0691_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0691
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0692 : Poly :=
[
  term ((5668507840 : Rat) / 110226591) [(5, 1), (8, 1), (15, 3)]
]

/-- Partial product 692 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0692 : Poly :=
[
  term ((-5668507840 : Rat) / 110226591) [(5, 1), (8, 1), (15, 3)],
  term ((11337015680 : Rat) / 110226591) [(5, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0692_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0692
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0693 : Poly :=
[
  term ((-4027 : Rat) / 268) [(5, 1), (9, 1)]
]

/-- Partial product 693 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0693 : Poly :=
[
  term ((-4027 : Rat) / 134) [(5, 1), (8, 1), (9, 1)],
  term ((4027 : Rat) / 268) [(5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0693_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0693
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0694 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 694 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0694 : Poly :=
[
  term ((-392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0694_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0694
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0695 : Poly :=
[
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 695 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0695 : Poly :=
[
  term ((392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0695_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0695
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0696 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 2)]
]

/-- Partial product 696 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0696 : Poly :=
[
  term ((-392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 2)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0696_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0696
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0697 : Poly :=
[
  term ((596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 697 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0697 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0697_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0697
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0698 : Poly :=
[
  term ((-4518704501140 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 698 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0698 : Poly :=
[
  term ((-9037409002280 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((4518704501140 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0698_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0698
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0699 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 699 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0699 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0699_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0699
        rs_R009_ueqv_R009NNNYN_generator_19_0600_0699 =
      rs_R009_ueqv_R009NNNYN_partial_19_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_0600_0699 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_0600,
  rs_R009_ueqv_R009NNNYN_partial_19_0601,
  rs_R009_ueqv_R009NNNYN_partial_19_0602,
  rs_R009_ueqv_R009NNNYN_partial_19_0603,
  rs_R009_ueqv_R009NNNYN_partial_19_0604,
  rs_R009_ueqv_R009NNNYN_partial_19_0605,
  rs_R009_ueqv_R009NNNYN_partial_19_0606,
  rs_R009_ueqv_R009NNNYN_partial_19_0607,
  rs_R009_ueqv_R009NNNYN_partial_19_0608,
  rs_R009_ueqv_R009NNNYN_partial_19_0609,
  rs_R009_ueqv_R009NNNYN_partial_19_0610,
  rs_R009_ueqv_R009NNNYN_partial_19_0611,
  rs_R009_ueqv_R009NNNYN_partial_19_0612,
  rs_R009_ueqv_R009NNNYN_partial_19_0613,
  rs_R009_ueqv_R009NNNYN_partial_19_0614,
  rs_R009_ueqv_R009NNNYN_partial_19_0615,
  rs_R009_ueqv_R009NNNYN_partial_19_0616,
  rs_R009_ueqv_R009NNNYN_partial_19_0617,
  rs_R009_ueqv_R009NNNYN_partial_19_0618,
  rs_R009_ueqv_R009NNNYN_partial_19_0619,
  rs_R009_ueqv_R009NNNYN_partial_19_0620,
  rs_R009_ueqv_R009NNNYN_partial_19_0621,
  rs_R009_ueqv_R009NNNYN_partial_19_0622,
  rs_R009_ueqv_R009NNNYN_partial_19_0623,
  rs_R009_ueqv_R009NNNYN_partial_19_0624,
  rs_R009_ueqv_R009NNNYN_partial_19_0625,
  rs_R009_ueqv_R009NNNYN_partial_19_0626,
  rs_R009_ueqv_R009NNNYN_partial_19_0627,
  rs_R009_ueqv_R009NNNYN_partial_19_0628,
  rs_R009_ueqv_R009NNNYN_partial_19_0629,
  rs_R009_ueqv_R009NNNYN_partial_19_0630,
  rs_R009_ueqv_R009NNNYN_partial_19_0631,
  rs_R009_ueqv_R009NNNYN_partial_19_0632,
  rs_R009_ueqv_R009NNNYN_partial_19_0633,
  rs_R009_ueqv_R009NNNYN_partial_19_0634,
  rs_R009_ueqv_R009NNNYN_partial_19_0635,
  rs_R009_ueqv_R009NNNYN_partial_19_0636,
  rs_R009_ueqv_R009NNNYN_partial_19_0637,
  rs_R009_ueqv_R009NNNYN_partial_19_0638,
  rs_R009_ueqv_R009NNNYN_partial_19_0639,
  rs_R009_ueqv_R009NNNYN_partial_19_0640,
  rs_R009_ueqv_R009NNNYN_partial_19_0641,
  rs_R009_ueqv_R009NNNYN_partial_19_0642,
  rs_R009_ueqv_R009NNNYN_partial_19_0643,
  rs_R009_ueqv_R009NNNYN_partial_19_0644,
  rs_R009_ueqv_R009NNNYN_partial_19_0645,
  rs_R009_ueqv_R009NNNYN_partial_19_0646,
  rs_R009_ueqv_R009NNNYN_partial_19_0647,
  rs_R009_ueqv_R009NNNYN_partial_19_0648,
  rs_R009_ueqv_R009NNNYN_partial_19_0649,
  rs_R009_ueqv_R009NNNYN_partial_19_0650,
  rs_R009_ueqv_R009NNNYN_partial_19_0651,
  rs_R009_ueqv_R009NNNYN_partial_19_0652,
  rs_R009_ueqv_R009NNNYN_partial_19_0653,
  rs_R009_ueqv_R009NNNYN_partial_19_0654,
  rs_R009_ueqv_R009NNNYN_partial_19_0655,
  rs_R009_ueqv_R009NNNYN_partial_19_0656,
  rs_R009_ueqv_R009NNNYN_partial_19_0657,
  rs_R009_ueqv_R009NNNYN_partial_19_0658,
  rs_R009_ueqv_R009NNNYN_partial_19_0659,
  rs_R009_ueqv_R009NNNYN_partial_19_0660,
  rs_R009_ueqv_R009NNNYN_partial_19_0661,
  rs_R009_ueqv_R009NNNYN_partial_19_0662,
  rs_R009_ueqv_R009NNNYN_partial_19_0663,
  rs_R009_ueqv_R009NNNYN_partial_19_0664,
  rs_R009_ueqv_R009NNNYN_partial_19_0665,
  rs_R009_ueqv_R009NNNYN_partial_19_0666,
  rs_R009_ueqv_R009NNNYN_partial_19_0667,
  rs_R009_ueqv_R009NNNYN_partial_19_0668,
  rs_R009_ueqv_R009NNNYN_partial_19_0669,
  rs_R009_ueqv_R009NNNYN_partial_19_0670,
  rs_R009_ueqv_R009NNNYN_partial_19_0671,
  rs_R009_ueqv_R009NNNYN_partial_19_0672,
  rs_R009_ueqv_R009NNNYN_partial_19_0673,
  rs_R009_ueqv_R009NNNYN_partial_19_0674,
  rs_R009_ueqv_R009NNNYN_partial_19_0675,
  rs_R009_ueqv_R009NNNYN_partial_19_0676,
  rs_R009_ueqv_R009NNNYN_partial_19_0677,
  rs_R009_ueqv_R009NNNYN_partial_19_0678,
  rs_R009_ueqv_R009NNNYN_partial_19_0679,
  rs_R009_ueqv_R009NNNYN_partial_19_0680,
  rs_R009_ueqv_R009NNNYN_partial_19_0681,
  rs_R009_ueqv_R009NNNYN_partial_19_0682,
  rs_R009_ueqv_R009NNNYN_partial_19_0683,
  rs_R009_ueqv_R009NNNYN_partial_19_0684,
  rs_R009_ueqv_R009NNNYN_partial_19_0685,
  rs_R009_ueqv_R009NNNYN_partial_19_0686,
  rs_R009_ueqv_R009NNNYN_partial_19_0687,
  rs_R009_ueqv_R009NNNYN_partial_19_0688,
  rs_R009_ueqv_R009NNNYN_partial_19_0689,
  rs_R009_ueqv_R009NNNYN_partial_19_0690,
  rs_R009_ueqv_R009NNNYN_partial_19_0691,
  rs_R009_ueqv_R009NNNYN_partial_19_0692,
  rs_R009_ueqv_R009NNNYN_partial_19_0693,
  rs_R009_ueqv_R009NNNYN_partial_19_0694,
  rs_R009_ueqv_R009NNNYN_partial_19_0695,
  rs_R009_ueqv_R009NNNYN_partial_19_0696,
  rs_R009_ueqv_R009NNNYN_partial_19_0697,
  rs_R009_ueqv_R009NNNYN_partial_19_0698,
  rs_R009_ueqv_R009NNNYN_partial_19_0699
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_0600_0699 : Poly :=
[
  term ((1406566400 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 3)],
  term ((-42446488021 : Rat) / 5817514525) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((22194163432 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-10967040 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((10593218240 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((-700503255104 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((82564179176 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((70328320 : Rat) / 36742197) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((-1982656359388 : Rat) / 157072892175) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((121272755524 : Rat) / 24800982975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-22568538880 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-703283200 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((42446488021 : Rat) / 11635029050) [(5, 1), (6, 1), (13, 1)],
  term ((-11097081716 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5296609120 : Rat) / 110226591) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((350251627552 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35164160 : Rat) / 36742197) [(5, 1), (6, 1), (14, 1), (15, 3)],
  term ((991328179694 : Rat) / 157072892175) [(5, 1), (6, 1), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((11284269440 : Rat) / 110226591) [(5, 1), (6, 1), (15, 3)],
  term ((-6427 : Rat) / 268) [(5, 1), (7, 1)],
  term ((3442 : Rat) / 67) [(5, 1), (7, 1), (8, 1)],
  term ((-15362856828928 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-240044637952 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((18214535855444 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2387058240 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((11687208048 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50923909120 : Rat) / 110226591) [(5, 1), (7, 1), (8, 1), (11, 2)],
  term ((2359640640 : Rat) / 12247399) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39051204272 : Rat) / 110226591) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-457 : Rat) / 67) [(5, 1), (7, 1), (8, 2)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (7, 1), (8, 2), (9, 1), (13, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1)],
  term ((795686080 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((-41190990164048 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((50923909120 : Rat) / 330679773) [(5, 1), (7, 1), (8, 2), (11, 2)],
  term ((-236550014232 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (7, 1), (8, 2), (14, 1)],
  term ((2989941238168 : Rat) / 52357630725) [(5, 1), (7, 1), (8, 2), (15, 2)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((22493005126592 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((351453205103 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-26360481687316 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((994607600 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-64646474066788 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((63654886400 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)],
  term ((-501277148442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 67) [(5, 1), (7, 1), (14, 1)],
  term ((2842391901686 : Rat) / 17452543575) [(5, 1), (7, 1), (15, 2)],
  term ((2394874578674 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((8771824241152 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 1), (11, 1)],
  term ((411179261304 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 52357630725) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (11, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 2), (13, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (15, 1)],
  term ((-2192956060288 : Rat) / 31414578435) [(5, 1), (7, 2), (11, 1)],
  term ((-34264938442 : Rat) / 1163502905) [(5, 1), (7, 2), (13, 1)],
  term ((2394874578674 : Rat) / 31414578435) [(5, 1), (7, 2), (15, 1)],
  term ((-2307 : Rat) / 67) [(5, 1), (8, 1), (9, 1)],
  term ((-490 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 2)],
  term ((1193529120 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5843604024 : Rat) / 12247399) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((266194670336 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((4159291724 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-255367111558 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-15458038088518 : Rat) / 471218676525) [(5, 1), (8, 1), (11, 1)],
  term ((-19956976256 : Rat) / 330679773) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-97484800 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-30464000 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-28404457088 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4874240 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((423518240 : Rat) / 12247399) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-311827754 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18278400 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((17730398062 : Rat) / 330679773) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-722605788373 : Rat) / 69810174300) [(5, 1), (8, 1), (13, 1)],
  term ((-443819642 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-685440 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((901532560 : Rat) / 36742197) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((182811013774 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(5, 1), (8, 1), (14, 1), (15, 3)],
  term ((4395520 : Rat) / 36742197) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((13333938983803 : Rat) / 942437353050) [(5, 1), (8, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5668507840 : Rat) / 110226591) [(5, 1), (8, 1), (15, 3)],
  term ((587 : Rat) / 67) [(5, 1), (8, 2), (9, 1)],
  term ((196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (10, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (8, 2), (9, 1), (14, 1)],
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-532389340672 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (11, 1)],
  term ((-8318583448 : Rat) / 1163502905) [(5, 1), (8, 2), (10, 1), (13, 1)],
  term ((510734223116 : Rat) / 31414578435) [(5, 1), (8, 2), (10, 1), (15, 1)],
  term ((30916076177036 : Rat) / 471218676525) [(5, 1), (8, 2), (11, 1)],
  term ((39913952512 : Rat) / 330679773) [(5, 1), (8, 2), (11, 1), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (14, 1)],
  term ((779878400 : Rat) / 110226591) [(5, 1), (8, 2), (11, 1), (12, 1), (15, 2)],
  term ((60928000 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((56808914176 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (8, 2), (11, 1), (14, 2)],
  term ((-847036480 : Rat) / 12247399) [(5, 1), (8, 2), (11, 1), (15, 2)],
  term ((-9280 : Rat) / 201) [(5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((155975680 : Rat) / 110226591) [(5, 1), (8, 2), (11, 2), (15, 1)],
  term ((623655508 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((36556800 : Rat) / 12247399) [(5, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((-35460796124 : Rat) / 330679773) [(5, 1), (8, 2), (12, 1), (15, 1)],
  term ((252 : Rat) / 67) [(5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-703283200 : Rat) / 110226591) [(5, 1), (8, 2), (12, 1), (15, 3)],
  term ((722605788373 : Rat) / 34905087150) [(5, 1), (8, 2), (13, 1)],
  term ((887639284 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((1370880 : Rat) / 12247399) [(5, 1), (8, 2), (13, 1), (14, 2)],
  term ((-1803065120 : Rat) / 36742197) [(5, 1), (8, 2), (13, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (8, 2), (13, 2), (15, 1)],
  term ((-365622027548 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-35164160 : Rat) / 36742197) [(5, 1), (8, 2), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (8, 2), (14, 2), (15, 1)],
  term ((-13333938983803 : Rat) / 471218676525) [(5, 1), (8, 2), (15, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((11337015680 : Rat) / 110226591) [(5, 1), (8, 2), (15, 3)],
  term ((4027 : Rat) / 268) [(5, 1), (9, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (14, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 2)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((4518704501140 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 600 through 699. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_0600_0699_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_0600_0699
      rs_R009_ueqv_R009NNNYN_block_19_0600_0699 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
