/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 10:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0600 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0600 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0600_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0600
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0601 : Poly :=
[
  term ((-5481448599 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 601 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0601 : Poly :=
[
  term ((-10962897198 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((5481448599 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0601_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0601
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0602 : Poly :=
[
  term ((1048410 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 602 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0602 : Poly :=
[
  term ((2096820 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1048410 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0602_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0602
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0603 : Poly :=
[
  term ((7308598132 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 3)]
]

/-- Partial product 603 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0603 : Poly :=
[
  term ((14617196264 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 3)],
  term ((-7308598132 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0603_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0603
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0604 : Poly :=
[
  term ((-1397880 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 604 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0604 : Poly :=
[
  term ((-2795760 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1397880 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0604_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0604
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0605 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (13, 2), (15, 2)]
]

/-- Partial product 605 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0605 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (13, 2), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0605_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0605
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0606 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0606 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0606_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0606
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0607 : Poly :=
[
  term ((332209006 : Rat) / 4741355) [(6, 1), (10, 1), (15, 2)]
]

/-- Partial product 607 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0607 : Poly :=
[
  term ((664418012 : Rat) / 4741355) [(2, 1), (6, 1), (10, 1), (15, 2)],
  term ((-332209006 : Rat) / 4741355) [(6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0607_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0607
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0608 : Poly :=
[
  term ((-444780 : Rat) / 32699) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 608 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0608 : Poly :=
[
  term ((-889560 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((444780 : Rat) / 32699) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0608_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0608
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0609 : Poly :=
[
  term ((-1328836024 : Rat) / 33189485) [(6, 1), (10, 1), (15, 4)]
]

/-- Partial product 609 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0609 : Poly :=
[
  term ((-2657672048 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (15, 4)],
  term ((1328836024 : Rat) / 33189485) [(6, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0609_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0609
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0610 : Poly :=
[
  term ((254160 : Rat) / 32699) [(6, 1), (10, 1), (15, 4), (16, 1)]
]

/-- Partial product 610 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0610 : Poly :=
[
  term ((508320 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (15, 4), (16, 1)],
  term ((-254160 : Rat) / 32699) [(6, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0610_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0610
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0611 : Poly :=
[
  term ((103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 611 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0611 : Poly :=
[
  term ((207298419744 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0611_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0611
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0612 : Poly :=
[
  term ((-19824480 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 612 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0612 : Poly :=
[
  term ((-39648960 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((19824480 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0612_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0612
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0613 : Poly :=
[
  term ((-5315344096 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 613 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0613 : Poly :=
[
  term ((-10630688192 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0613_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0613
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0614 : Poly :=
[
  term ((1016640 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0614 : Poly :=
[
  term ((2033280 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0614_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0614
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0615 : Poly :=
[
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 615 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0615 : Poly :=
[
  term ((-103649209872 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 3)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0615_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0615
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0616 : Poly :=
[
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 616 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0616 : Poly :=
[
  term ((19824480 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0616_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0616
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0617 : Poly :=
[
  term ((-15281614276 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 617 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0617 : Poly :=
[
  term ((-30563228552 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((15281614276 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0617_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0617
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0618 : Poly :=
[
  term ((2922840 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 618 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0618 : Poly :=
[
  term ((5845680 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2922840 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0618_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0618
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0619 : Poly :=
[
  term ((-51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 619 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0619 : Poly :=
[
  term ((-103649209872 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0619_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0619
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0620 : Poly :=
[
  term ((9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 620 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0620 : Poly :=
[
  term ((19824480 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0620_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0620
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0621 : Poly :=
[
  term ((-2823776551 : Rat) / 66378970) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 621 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0621 : Poly :=
[
  term ((-2823776551 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((2823776551 : Rat) / 66378970) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0621_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0621
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0622 : Poly :=
[
  term ((270045 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0622 : Poly :=
[
  term ((540090 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-270045 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0622_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0622
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0623 : Poly :=
[
  term ((332209006 : Rat) / 948271) [(6, 1), (11, 1), (15, 3)]
]

/-- Partial product 623 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0623 : Poly :=
[
  term ((664418012 : Rat) / 948271) [(2, 1), (6, 1), (11, 1), (15, 3)],
  term ((-332209006 : Rat) / 948271) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0623_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0623
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0624 : Poly :=
[
  term ((-2223900 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 624 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0624 : Poly :=
[
  term ((-4447800 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((2223900 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0624_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0624
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0625 : Poly :=
[
  term ((2657672048 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 625 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0625 : Poly :=
[
  term ((5315344096 : Rat) / 6637897) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2657672048 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0625_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0625
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0626 : Poly :=
[
  term ((-2541600 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 626 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0626 : Poly :=
[
  term ((-5083200 : Rat) / 32699) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2541600 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0626_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0626
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0627 : Poly :=
[
  term ((-1328836024 : Rat) / 4741355) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 627 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0627 : Poly :=
[
  term ((-2657672048 : Rat) / 4741355) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((1328836024 : Rat) / 4741355) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0627_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0627
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0628 : Poly :=
[
  term ((1779120 : Rat) / 32699) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 628 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0628 : Poly :=
[
  term ((3558240 : Rat) / 32699) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1779120 : Rat) / 32699) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0628_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0628
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0629 : Poly :=
[
  term ((-5315344096 : Rat) / 33189485) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 629 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0629 : Poly :=
[
  term ((-10630688192 : Rat) / 33189485) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0629_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0629
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0630 : Poly :=
[
  term ((1016640 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0630 : Poly :=
[
  term ((2033280 : Rat) / 32699) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0630_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0630
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0631 : Poly :=
[
  term ((108964553968 : Rat) / 99568455) [(6, 1), (13, 1), (15, 3)]
]

/-- Partial product 631 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0631 : Poly :=
[
  term ((217929107936 : Rat) / 99568455) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((-108964553968 : Rat) / 99568455) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0631_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0631
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0632 : Poly :=
[
  term ((-6947040 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 632 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0632 : Poly :=
[
  term ((-13894080 : Rat) / 32699) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((6947040 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0632_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0632
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0633 : Poly :=
[
  term ((-5315344096 : Rat) / 6637897) [(6, 1), (13, 2), (15, 2)]
]

/-- Partial product 633 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0633 : Poly :=
[
  term ((-10630688192 : Rat) / 6637897) [(2, 1), (6, 1), (13, 2), (15, 2)],
  term ((5315344096 : Rat) / 6637897) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0633_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0633
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0634 : Poly :=
[
  term ((5083200 : Rat) / 32699) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 634 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0634 : Poly :=
[
  term ((10166400 : Rat) / 32699) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5083200 : Rat) / 32699) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0634_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0634
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0635 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(6, 1), (15, 2)]
]

/-- Partial product 635 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0635 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(2, 1), (6, 1), (15, 2)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0635_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0635
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0636 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 636 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0636 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((762480 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0636_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0636
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0637 : Poly :=
[
  term ((-5315344096 : Rat) / 14224065) [(6, 1), (15, 4)]
]

/-- Partial product 637 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0637 : Poly :=
[
  term ((-10630688192 : Rat) / 14224065) [(2, 1), (6, 1), (15, 4)],
  term ((5315344096 : Rat) / 14224065) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0637_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0637
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0638 : Poly :=
[
  term ((2372160 : Rat) / 32699) [(6, 1), (15, 4), (16, 1)]
]

/-- Partial product 638 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0638 : Poly :=
[
  term ((4744320 : Rat) / 32699) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((-2372160 : Rat) / 32699) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0638_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0638
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0639 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 639 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0639 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0639_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0639
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0640 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 640 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0640 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0640_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0640
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0641 : Poly :=
[
  term ((5481448599 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 641 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0641 : Poly :=
[
  term ((10962897198 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-5481448599 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0641_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0641
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0642 : Poly :=
[
  term ((-1048410 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0642 : Poly :=
[
  term ((-2096820 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1048410 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0642_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0642
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0643 : Poly :=
[
  term ((1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 3)]
]

/-- Partial product 643 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0643 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 3)],
  term ((-1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0643_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0643
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0644 : Poly :=
[
  term ((-381240 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 644 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0644 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((381240 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0644_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0644
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0645 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 645 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0645 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0645_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0645
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0646 : Poly :=
[
  term ((762480 : Rat) / 32699) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 646 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0646 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0646_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0646
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0647 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 647 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0647 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0647_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0647
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0648 : Poly :=
[
  term ((381240 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 648 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0648 : Poly :=
[
  term ((762480 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-381240 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0648_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0648
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0649 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 649 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0649 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0649_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0649
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0650 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 650 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0650 : Poly :=
[
  term ((-3049920 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0650_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0650
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0651 : Poly :=
[
  term ((-332209006 : Rat) / 33189485) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 651 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0651 : Poly :=
[
  term ((-664418012 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((332209006 : Rat) / 33189485) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0651_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0651
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0652 : Poly :=
[
  term ((63540 : Rat) / 32699) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0652 : Poly :=
[
  term ((127080 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-63540 : Rat) / 32699) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0652_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0652
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0653 : Poly :=
[
  term ((-1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 653 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0653 : Poly :=
[
  term ((-2657672048 : Rat) / 6637897) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0653_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0653
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0654 : Poly :=
[
  term ((1270800 : Rat) / 32699) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 654 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0654 : Poly :=
[
  term ((2541600 : Rat) / 32699) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1270800 : Rat) / 32699) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0654_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0654
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0655 : Poly :=
[
  term ((20596958372 : Rat) / 33189485) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 655 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0655 : Poly :=
[
  term ((41193916744 : Rat) / 33189485) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-20596958372 : Rat) / 33189485) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0655_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0655
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0656 : Poly :=
[
  term ((-3939480 : Rat) / 32699) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 656 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0656 : Poly :=
[
  term ((-7878960 : Rat) / 32699) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3939480 : Rat) / 32699) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0656_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0656
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0657 : Poly :=
[
  term ((11959524216 : Rat) / 33189485) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 657 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0657 : Poly :=
[
  term ((23919048432 : Rat) / 33189485) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-11959524216 : Rat) / 33189485) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0657_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0657
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0658 : Poly :=
[
  term ((-2287440 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 658 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0658 : Poly :=
[
  term ((-4574880 : Rat) / 32699) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2287440 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0658_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0658
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0659 : Poly :=
[
  term ((5315344096 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 659 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0659 : Poly :=
[
  term ((10630688192 : Rat) / 33189485) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5315344096 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0659_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0659
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0660 : Poly :=
[
  term ((-1016640 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 660 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0660 : Poly :=
[
  term ((-2033280 : Rat) / 32699) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1016640 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0660_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0660
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0661 : Poly :=
[
  term ((8637434156 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 661 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0661 : Poly :=
[
  term ((17274868312 : Rat) / 33189485) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-8637434156 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0661_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0661
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0662 : Poly :=
[
  term ((-1652040 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 662 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0662 : Poly :=
[
  term ((-3304080 : Rat) / 32699) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1652040 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0662_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0662
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0663 : Poly :=
[
  term ((2657672048 : Rat) / 33189485) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 663 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0663 : Poly :=
[
  term ((5315344096 : Rat) / 33189485) [(2, 1), (7, 1), (12, 1), (15, 3)],
  term ((-2657672048 : Rat) / 33189485) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0663_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0663
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0664 : Poly :=
[
  term ((-508320 : Rat) / 32699) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 664 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0664 : Poly :=
[
  term ((-1016640 : Rat) / 32699) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((508320 : Rat) / 32699) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0664_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0664
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0665 : Poly :=
[
  term ((-2657672048 : Rat) / 6637897) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 665 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0665 : Poly :=
[
  term ((-5315344096 : Rat) / 6637897) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((2657672048 : Rat) / 6637897) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0665_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0665
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0666 : Poly :=
[
  term ((2541600 : Rat) / 32699) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0666 : Poly :=
[
  term ((5083200 : Rat) / 32699) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0666_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0666
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0667 : Poly :=
[
  term ((-2657672048 : Rat) / 6637897) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 667 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0667 : Poly :=
[
  term ((-5315344096 : Rat) / 6637897) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((2657672048 : Rat) / 6637897) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0667_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0667
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0668 : Poly :=
[
  term ((2541600 : Rat) / 32699) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0668 : Poly :=
[
  term ((5083200 : Rat) / 32699) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0668_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0668
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0669 : Poly :=
[
  term ((10630688192 : Rat) / 33189485) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 669 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0669 : Poly :=
[
  term ((21261376384 : Rat) / 33189485) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0669_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0669
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0670 : Poly :=
[
  term ((-2033280 : Rat) / 32699) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 670 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0670 : Poly :=
[
  term ((-4066560 : Rat) / 32699) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0670_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0670
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0671 : Poly :=
[
  term ((-2989881054 : Rat) / 33189485) [(7, 1), (15, 1)]
]

/-- Partial product 671 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0671 : Poly :=
[
  term ((-5979762108 : Rat) / 33189485) [(2, 1), (7, 1), (15, 1)],
  term ((2989881054 : Rat) / 33189485) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0671_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0671
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0672 : Poly :=
[
  term ((571860 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 672 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0672 : Poly :=
[
  term ((1143720 : Rat) / 32699) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-571860 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0672_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0672
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0673 : Poly :=
[
  term ((1328836024 : Rat) / 33189485) [(7, 1), (15, 3)]
]

/-- Partial product 673 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0673 : Poly :=
[
  term ((2657672048 : Rat) / 33189485) [(2, 1), (7, 1), (15, 3)],
  term ((-1328836024 : Rat) / 33189485) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0673_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0673
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0674 : Poly :=
[
  term ((-254160 : Rat) / 32699) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 674 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0674 : Poly :=
[
  term ((-508320 : Rat) / 32699) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((254160 : Rat) / 32699) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0674_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0674
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0675 : Poly :=
[
  term ((-89 : Rat) / 640) [(8, 1)]
]

/-- Partial product 675 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0675 : Poly :=
[
  term ((-89 : Rat) / 320) [(2, 1), (8, 1)],
  term ((89 : Rat) / 640) [(8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0675_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0675
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0676 : Poly :=
[
  term ((8 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 676 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0676 : Poly :=
[
  term ((16 : Rat) / 29) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-8 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0676_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0676
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0677 : Poly :=
[
  term ((-120732636 : Rat) / 948271) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 677 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0677 : Poly :=
[
  term ((-241465272 : Rat) / 948271) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((120732636 : Rat) / 948271) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0677_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0677
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0678 : Poly :=
[
  term ((805176 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 678 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0678 : Poly :=
[
  term ((1610352 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-805176 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0678_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0678
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0679 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 679 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0679 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0679_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0679
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0680 : Poly :=
[
  term ((5888 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 680 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0680 : Poly :=
[
  term ((11776 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5888 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0680_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0680
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0681 : Poly :=
[
  term ((-15502696 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 681 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0681 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((15502696 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0681_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0681
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0682 : Poly :=
[
  term ((2944 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 682 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0682 : Poly :=
[
  term ((5888 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2944 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0682_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0682
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0683 : Poly :=
[
  term ((-9755817031 : Rat) / 99568455) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 683 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0683 : Poly :=
[
  term ((-19511634062 : Rat) / 99568455) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((9755817031 : Rat) / 99568455) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0683_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0683
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0684 : Poly :=
[
  term ((1876366 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 684 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0684 : Poly :=
[
  term ((3752732 : Rat) / 98097) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1876366 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0684_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0684
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0685 : Poly :=
[
  term ((3875674 : Rat) / 4741355) [(8, 1), (11, 1), (15, 3)]
]

/-- Partial product 685 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0685 : Poly :=
[
  term ((7751348 : Rat) / 4741355) [(2, 1), (8, 1), (11, 1), (15, 3)],
  term ((-3875674 : Rat) / 4741355) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0685_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0685
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0686 : Poly :=
[
  term ((-5152 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 686 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0686 : Poly :=
[
  term ((-10304 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((5152 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0686_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0686
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0687 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 687 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0687 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(2, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0687_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0687
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0688 : Poly :=
[
  term ((47104 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 688 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0688 : Poly :=
[
  term ((94208 : Rat) / 32699) [(2, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0688_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0688
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0689 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 689 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0689 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0689_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0689
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0690 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0690 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0690_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0690
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0691 : Poly :=
[
  term ((93016176 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)]
]

/-- Partial product 691 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0691 : Poly :=
[
  term ((186032352 : Rat) / 33189485) [(2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-93016176 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0691_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0691
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0692 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 692 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0692 : Poly :=
[
  term ((-35328 : Rat) / 32699) [(2, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((17664 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0692_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0692
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0693 : Poly :=
[
  term ((-15 : Rat) / 32) [(8, 1), (12, 1)]
]

/-- Partial product 693 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0693 : Poly :=
[
  term ((-15 : Rat) / 16) [(2, 1), (8, 1), (12, 1)],
  term ((15 : Rat) / 32) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0693_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0693
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0694 : Poly :=
[
  term ((-267 : Rat) / 20) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 694 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0694 : Poly :=
[
  term ((-267 : Rat) / 10) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((267 : Rat) / 20) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0694_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0694
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0695 : Poly :=
[
  term ((510428791709 : Rat) / 796547640) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 695 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0695 : Poly :=
[
  term ((510428791709 : Rat) / 398273820) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-510428791709 : Rat) / 796547640) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0695_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0695
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0696 : Poly :=
[
  term ((-12220018 : Rat) / 98097) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 696 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0696 : Poly :=
[
  term ((-24440036 : Rat) / 98097) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((12220018 : Rat) / 98097) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0696_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0696
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0697 : Poly :=
[
  term ((-50986502825 : Rat) / 159309528) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 697 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0697 : Poly :=
[
  term ((-50986502825 : Rat) / 79654764) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((50986502825 : Rat) / 159309528) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0697_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0697
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0698 : Poly :=
[
  term ((6110009 : Rat) / 98097) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 698 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0698 : Poly :=
[
  term ((12220018 : Rat) / 98097) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6110009 : Rat) / 98097) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0698_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0698
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NYYYY_coefficient_10_0699 : Poly :=
[
  term ((267 : Rat) / 40) [(8, 1), (13, 2)]
]

/-- Partial product 699 for generator 10. -/
def rs_R009_ueqv_R009NYYYY_partial_10_0699 : Poly :=
[
  term ((267 : Rat) / 20) [(2, 1), (8, 1), (13, 2)],
  term ((-267 : Rat) / 40) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 10. -/
theorem rs_R009_ueqv_R009NYYYY_partial_10_0699_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_10_0699
        rs_R009_ueqv_R009NYYYY_generator_10_0600_0699 =
      rs_R009_ueqv_R009NYYYY_partial_10_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_10_0600_0699 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_10_0600,
  rs_R009_ueqv_R009NYYYY_partial_10_0601,
  rs_R009_ueqv_R009NYYYY_partial_10_0602,
  rs_R009_ueqv_R009NYYYY_partial_10_0603,
  rs_R009_ueqv_R009NYYYY_partial_10_0604,
  rs_R009_ueqv_R009NYYYY_partial_10_0605,
  rs_R009_ueqv_R009NYYYY_partial_10_0606,
  rs_R009_ueqv_R009NYYYY_partial_10_0607,
  rs_R009_ueqv_R009NYYYY_partial_10_0608,
  rs_R009_ueqv_R009NYYYY_partial_10_0609,
  rs_R009_ueqv_R009NYYYY_partial_10_0610,
  rs_R009_ueqv_R009NYYYY_partial_10_0611,
  rs_R009_ueqv_R009NYYYY_partial_10_0612,
  rs_R009_ueqv_R009NYYYY_partial_10_0613,
  rs_R009_ueqv_R009NYYYY_partial_10_0614,
  rs_R009_ueqv_R009NYYYY_partial_10_0615,
  rs_R009_ueqv_R009NYYYY_partial_10_0616,
  rs_R009_ueqv_R009NYYYY_partial_10_0617,
  rs_R009_ueqv_R009NYYYY_partial_10_0618,
  rs_R009_ueqv_R009NYYYY_partial_10_0619,
  rs_R009_ueqv_R009NYYYY_partial_10_0620,
  rs_R009_ueqv_R009NYYYY_partial_10_0621,
  rs_R009_ueqv_R009NYYYY_partial_10_0622,
  rs_R009_ueqv_R009NYYYY_partial_10_0623,
  rs_R009_ueqv_R009NYYYY_partial_10_0624,
  rs_R009_ueqv_R009NYYYY_partial_10_0625,
  rs_R009_ueqv_R009NYYYY_partial_10_0626,
  rs_R009_ueqv_R009NYYYY_partial_10_0627,
  rs_R009_ueqv_R009NYYYY_partial_10_0628,
  rs_R009_ueqv_R009NYYYY_partial_10_0629,
  rs_R009_ueqv_R009NYYYY_partial_10_0630,
  rs_R009_ueqv_R009NYYYY_partial_10_0631,
  rs_R009_ueqv_R009NYYYY_partial_10_0632,
  rs_R009_ueqv_R009NYYYY_partial_10_0633,
  rs_R009_ueqv_R009NYYYY_partial_10_0634,
  rs_R009_ueqv_R009NYYYY_partial_10_0635,
  rs_R009_ueqv_R009NYYYY_partial_10_0636,
  rs_R009_ueqv_R009NYYYY_partial_10_0637,
  rs_R009_ueqv_R009NYYYY_partial_10_0638,
  rs_R009_ueqv_R009NYYYY_partial_10_0639,
  rs_R009_ueqv_R009NYYYY_partial_10_0640,
  rs_R009_ueqv_R009NYYYY_partial_10_0641,
  rs_R009_ueqv_R009NYYYY_partial_10_0642,
  rs_R009_ueqv_R009NYYYY_partial_10_0643,
  rs_R009_ueqv_R009NYYYY_partial_10_0644,
  rs_R009_ueqv_R009NYYYY_partial_10_0645,
  rs_R009_ueqv_R009NYYYY_partial_10_0646,
  rs_R009_ueqv_R009NYYYY_partial_10_0647,
  rs_R009_ueqv_R009NYYYY_partial_10_0648,
  rs_R009_ueqv_R009NYYYY_partial_10_0649,
  rs_R009_ueqv_R009NYYYY_partial_10_0650,
  rs_R009_ueqv_R009NYYYY_partial_10_0651,
  rs_R009_ueqv_R009NYYYY_partial_10_0652,
  rs_R009_ueqv_R009NYYYY_partial_10_0653,
  rs_R009_ueqv_R009NYYYY_partial_10_0654,
  rs_R009_ueqv_R009NYYYY_partial_10_0655,
  rs_R009_ueqv_R009NYYYY_partial_10_0656,
  rs_R009_ueqv_R009NYYYY_partial_10_0657,
  rs_R009_ueqv_R009NYYYY_partial_10_0658,
  rs_R009_ueqv_R009NYYYY_partial_10_0659,
  rs_R009_ueqv_R009NYYYY_partial_10_0660,
  rs_R009_ueqv_R009NYYYY_partial_10_0661,
  rs_R009_ueqv_R009NYYYY_partial_10_0662,
  rs_R009_ueqv_R009NYYYY_partial_10_0663,
  rs_R009_ueqv_R009NYYYY_partial_10_0664,
  rs_R009_ueqv_R009NYYYY_partial_10_0665,
  rs_R009_ueqv_R009NYYYY_partial_10_0666,
  rs_R009_ueqv_R009NYYYY_partial_10_0667,
  rs_R009_ueqv_R009NYYYY_partial_10_0668,
  rs_R009_ueqv_R009NYYYY_partial_10_0669,
  rs_R009_ueqv_R009NYYYY_partial_10_0670,
  rs_R009_ueqv_R009NYYYY_partial_10_0671,
  rs_R009_ueqv_R009NYYYY_partial_10_0672,
  rs_R009_ueqv_R009NYYYY_partial_10_0673,
  rs_R009_ueqv_R009NYYYY_partial_10_0674,
  rs_R009_ueqv_R009NYYYY_partial_10_0675,
  rs_R009_ueqv_R009NYYYY_partial_10_0676,
  rs_R009_ueqv_R009NYYYY_partial_10_0677,
  rs_R009_ueqv_R009NYYYY_partial_10_0678,
  rs_R009_ueqv_R009NYYYY_partial_10_0679,
  rs_R009_ueqv_R009NYYYY_partial_10_0680,
  rs_R009_ueqv_R009NYYYY_partial_10_0681,
  rs_R009_ueqv_R009NYYYY_partial_10_0682,
  rs_R009_ueqv_R009NYYYY_partial_10_0683,
  rs_R009_ueqv_R009NYYYY_partial_10_0684,
  rs_R009_ueqv_R009NYYYY_partial_10_0685,
  rs_R009_ueqv_R009NYYYY_partial_10_0686,
  rs_R009_ueqv_R009NYYYY_partial_10_0687,
  rs_R009_ueqv_R009NYYYY_partial_10_0688,
  rs_R009_ueqv_R009NYYYY_partial_10_0689,
  rs_R009_ueqv_R009NYYYY_partial_10_0690,
  rs_R009_ueqv_R009NYYYY_partial_10_0691,
  rs_R009_ueqv_R009NYYYY_partial_10_0692,
  rs_R009_ueqv_R009NYYYY_partial_10_0693,
  rs_R009_ueqv_R009NYYYY_partial_10_0694,
  rs_R009_ueqv_R009NYYYY_partial_10_0695,
  rs_R009_ueqv_R009NYYYY_partial_10_0696,
  rs_R009_ueqv_R009NYYYY_partial_10_0697,
  rs_R009_ueqv_R009NYYYY_partial_10_0698,
  rs_R009_ueqv_R009NYYYY_partial_10_0699
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_10_0600_0699 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10962897198 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((2096820 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14617196264 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 3)],
  term ((-2795760 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (13, 2), (15, 2)],
  term ((3049920 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((664418012 : Rat) / 4741355) [(2, 1), (6, 1), (10, 1), (15, 2)],
  term ((-889560 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(2, 1), (6, 1), (10, 1), (15, 4)],
  term ((508320 : Rat) / 32699) [(2, 1), (6, 1), (10, 1), (15, 4), (16, 1)],
  term ((207298419744 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-39648960 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((2033280 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-103649209872 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 3)],
  term ((19824480 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-30563228552 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((5845680 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103649209872 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((19824480 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2823776551 : Rat) / 33189485) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((540090 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 948271) [(2, 1), (6, 1), (11, 1), (15, 3)],
  term ((-4447800 : Rat) / 32699) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5083200 : Rat) / 32699) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 4741355) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((3558240 : Rat) / 32699) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((2033280 : Rat) / 32699) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((217929107936 : Rat) / 99568455) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((-13894080 : Rat) / 32699) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10630688192 : Rat) / 6637897) [(2, 1), (6, 1), (13, 2), (15, 2)],
  term ((10166400 : Rat) / 32699) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(2, 1), (6, 1), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-10630688192 : Rat) / 14224065) [(2, 1), (6, 1), (15, 4)],
  term ((4744320 : Rat) / 32699) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((3049920 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10962897198 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2096820 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 3)],
  term ((-762480 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (12, 2), (15, 1)],
  term ((1524960 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((762480 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-3049920 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 33189485) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((127080 : Rat) / 32699) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((2541600 : Rat) / 32699) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((41193916744 : Rat) / 33189485) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7878960 : Rat) / 32699) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((23919048432 : Rat) / 33189485) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-4574880 : Rat) / 32699) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((10630688192 : Rat) / 33189485) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2033280 : Rat) / 32699) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(2, 1), (7, 1), (12, 1), (15, 3)],
  term ((-1016640 : Rat) / 32699) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((5083200 : Rat) / 32699) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((5083200 : Rat) / 32699) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((21261376384 : Rat) / 33189485) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((-4066560 : Rat) / 32699) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(2, 1), (7, 1), (15, 1)],
  term ((1143720 : Rat) / 32699) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(2, 1), (7, 1), (15, 3)],
  term ((-508320 : Rat) / 32699) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-89 : Rat) / 320) [(2, 1), (8, 1)],
  term ((16 : Rat) / 29) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-241465272 : Rat) / 948271) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1610352 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((11776 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19511634062 : Rat) / 99568455) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((3752732 : Rat) / 98097) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7751348 : Rat) / 4741355) [(2, 1), (8, 1), (11, 1), (15, 3)],
  term ((-10304 : Rat) / 32699) [(2, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(2, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((94208 : Rat) / 32699) [(2, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((186032352 : Rat) / 33189485) [(2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-35328 : Rat) / 32699) [(2, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-15 : Rat) / 16) [(2, 1), (8, 1), (12, 1)],
  term ((-267 : Rat) / 10) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((510428791709 : Rat) / 398273820) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-24440036 : Rat) / 98097) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-50986502825 : Rat) / 79654764) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((12220018 : Rat) / 98097) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((267 : Rat) / 20) [(2, 1), (8, 1), (13, 2)],
  term ((762480 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5481448599 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1048410 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7308598132 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((1397880 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (13, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-332209006 : Rat) / 4741355) [(6, 1), (10, 1), (15, 2)],
  term ((444780 : Rat) / 32699) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(6, 1), (10, 1), (15, 4)],
  term ((-254160 : Rat) / 32699) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((-103649209872 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((19824480 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((15281614276 : Rat) / 33189485) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2922840 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((51824604936 : Rat) / 33189485) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-9912240 : Rat) / 32699) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2823776551 : Rat) / 66378970) [(6, 1), (11, 1), (15, 1)],
  term ((-270045 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-332209006 : Rat) / 948271) [(6, 1), (11, 1), (15, 3)],
  term ((2223900 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2541600 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 4741355) [(6, 1), (12, 1), (15, 2)],
  term ((-1779120 : Rat) / 32699) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(6, 1), (13, 1), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108964553968 : Rat) / 99568455) [(6, 1), (13, 1), (15, 3)],
  term ((6947040 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(6, 1), (13, 2), (15, 2)],
  term ((-5083200 : Rat) / 32699) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(6, 1), (15, 2)],
  term ((762480 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)],
  term ((5315344096 : Rat) / 14224065) [(6, 1), (15, 4)],
  term ((-2372160 : Rat) / 32699) [(6, 1), (15, 4), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5481448599 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((1048410 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((381240 : Rat) / 32699) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-762480 : Rat) / 32699) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-381240 : Rat) / 32699) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((1524960 : Rat) / 32699) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((332209006 : Rat) / 33189485) [(7, 1), (10, 1), (15, 1)],
  term ((-63540 : Rat) / 32699) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 6637897) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1270800 : Rat) / 32699) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20596958372 : Rat) / 33189485) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((3939480 : Rat) / 32699) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11959524216 : Rat) / 33189485) [(7, 1), (11, 1), (15, 2)],
  term ((2287440 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((1016640 : Rat) / 32699) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8637434156 : Rat) / 33189485) [(7, 1), (12, 1), (15, 1)],
  term ((1652040 : Rat) / 32699) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(7, 1), (12, 1), (15, 3)],
  term ((508320 : Rat) / 32699) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(7, 1), (12, 2), (15, 1)],
  term ((-2541600 : Rat) / 32699) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(7, 1), (13, 1), (15, 2)],
  term ((-2541600 : Rat) / 32699) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10630688192 : Rat) / 33189485) [(7, 1), (13, 2), (15, 1)],
  term ((2033280 : Rat) / 32699) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(7, 1), (15, 1)],
  term ((-571860 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(7, 1), (15, 3)],
  term ((254160 : Rat) / 32699) [(7, 1), (15, 3), (16, 1)],
  term ((89 : Rat) / 640) [(8, 1)],
  term ((-8 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((120732636 : Rat) / 948271) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-805176 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-5888 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((15502696 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2944 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9755817031 : Rat) / 99568455) [(8, 1), (11, 1), (15, 1)],
  term ((-1876366 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3875674 : Rat) / 4741355) [(8, 1), (11, 1), (15, 3)],
  term ((5152 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)],
  term ((17664 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((15 : Rat) / 32) [(8, 1), (12, 1)],
  term ((267 : Rat) / 20) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-510428791709 : Rat) / 796547640) [(8, 1), (12, 1), (15, 2)],
  term ((12220018 : Rat) / 98097) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((50986502825 : Rat) / 159309528) [(8, 1), (13, 1), (15, 1)],
  term ((-6110009 : Rat) / 98097) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-267 : Rat) / 40) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 600 through 699. -/
theorem rs_R009_ueqv_R009NYYYY_block_10_0600_0699_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_10_0600_0699
      rs_R009_ueqv_R009NYYYY_block_10_0600_0699 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
