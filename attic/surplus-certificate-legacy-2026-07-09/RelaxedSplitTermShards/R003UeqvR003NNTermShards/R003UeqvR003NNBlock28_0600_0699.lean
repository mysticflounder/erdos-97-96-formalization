/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 28:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_28_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0600 : Poly :=
[
  term (-119 : Rat) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 600 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0600 : Poly :=
[
  term (-238 : Rat) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term (119 : Rat) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0600_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0600
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0601 : Poly :=
[
  term ((70235 : Rat) / 14893) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0601 : Poly :=
[
  term ((140470 : Rat) / 14893) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70235 : Rat) / 14893) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0601_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0601
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0602 : Poly :=
[
  term (-96 : Rat) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 602 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0602 : Poly :=
[
  term (-192 : Rat) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term (96 : Rat) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0602_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0602
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0603 : Poly :=
[
  term ((3301499 : Rat) / 536148) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 603 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0603 : Poly :=
[
  term ((3301499 : Rat) / 268074) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3301499 : Rat) / 536148) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0603_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0603
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0604 : Poly :=
[
  term ((128807 : Rat) / 44679) [(9, 1), (12, 1), (15, 5), (16, 1)]
]

/-- Partial product 604 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0604 : Poly :=
[
  term ((257614 : Rat) / 44679) [(9, 1), (12, 1), (14, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (12, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0604_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0604
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0605 : Poly :=
[
  term (251 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 605 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0605 : Poly :=
[
  term (-251 : Rat) [(9, 1), (13, 1)],
  term (502 : Rat) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0605_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0605
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0606 : Poly :=
[
  term (-39 : Rat) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 606 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0606 : Poly :=
[
  term (39 : Rat) [(9, 1), (13, 1), (14, 1)],
  term (-78 : Rat) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0606_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0606
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0607 : Poly :=
[
  term (96 : Rat) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 607 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0607 : Poly :=
[
  term (-96 : Rat) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term (192 : Rat) [(9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0607_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0607
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0608 : Poly :=
[
  term ((-726416 : Rat) / 402111) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 608 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0608 : Poly :=
[
  term ((726416 : Rat) / 402111) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1452832 : Rat) / 402111) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0608_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0608
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0609 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 1), (13, 1), (14, 1), (15, 4), (16, 1)]
]

/-- Partial product 609 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0609 : Poly :=
[
  term ((128807 : Rat) / 44679) [(9, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (13, 1), (14, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0609_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0609
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0610 : Poly :=
[
  term (-96 : Rat) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 610 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0610 : Poly :=
[
  term (-192 : Rat) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term (96 : Rat) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0610_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0610
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0611 : Poly :=
[
  term ((-2117809 : Rat) / 1608444) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 611 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0611 : Poly :=
[
  term ((-2117809 : Rat) / 804222) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2117809 : Rat) / 1608444) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0611_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0611
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0612 : Poly :=
[
  term ((128807 : Rat) / 44679) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 612 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0612 : Poly :=
[
  term ((257614 : Rat) / 44679) [(9, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0612_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0612
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0613 : Poly :=
[
  term (48 : Rat) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 613 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0613 : Poly :=
[
  term (-48 : Rat) [(9, 1), (14, 1), (15, 1)],
  term (96 : Rat) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0613_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0613
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0614 : Poly :=
[
  term ((-8945951 : Rat) / 6433776) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0614 : Poly :=
[
  term ((8945951 : Rat) / 6433776) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8945951 : Rat) / 3216888) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0614_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0614
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0615 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(9, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 615 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0615 : Poly :=
[
  term ((128807 : Rat) / 89358) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0615_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0615
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0616 : Poly :=
[
  term ((7 : Rat) / 2) [(9, 1), (15, 1)]
]

/-- Partial product 616 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0616 : Poly :=
[
  term (7 : Rat) [(9, 1), (14, 1), (15, 1)],
  term ((-7 : Rat) / 2) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0616_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0616
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0617 : Poly :=
[
  term ((22617509 : Rat) / 12867552) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 617 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0617 : Poly :=
[
  term ((22617509 : Rat) / 6433776) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22617509 : Rat) / 12867552) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0617_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0617
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0618 : Poly :=
[
  term (-144 : Rat) [(9, 1), (15, 3)]
]

/-- Partial product 618 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0618 : Poly :=
[
  term (-288 : Rat) [(9, 1), (14, 1), (15, 3)],
  term (144 : Rat) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0618_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0618
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0619 : Poly :=
[
  term ((13397299 : Rat) / 3216888) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 619 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0619 : Poly :=
[
  term ((13397299 : Rat) / 1608444) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-13397299 : Rat) / 3216888) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0619_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0619
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0620 : Poly :=
[
  term ((128807 : Rat) / 29786) [(9, 1), (15, 5), (16, 1)]
]

/-- Partial product 620 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0620 : Poly :=
[
  term ((128807 : Rat) / 14893) [(9, 1), (14, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 29786) [(9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0620_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0620
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0621 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 2)]
]

/-- Partial product 621 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0621 : Poly :=
[
  term ((-9 : Rat) / 2) [(9, 2)],
  term (9 : Rat) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0621_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0621
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0622 : Poly :=
[
  term (9 : Rat) [(9, 2), (12, 1)]
]

/-- Partial product 622 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0622 : Poly :=
[
  term (-9 : Rat) [(9, 2), (12, 1)],
  term (18 : Rat) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0622_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0622
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0623 : Poly :=
[
  term (96 : Rat) [(9, 2), (12, 1), (15, 2)]
]

/-- Partial product 623 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0623 : Poly :=
[
  term (192 : Rat) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term (-96 : Rat) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0623_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0623
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0624 : Poly :=
[
  term ((-2612095 : Rat) / 804222) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 624 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0624 : Poly :=
[
  term ((-2612095 : Rat) / 402111) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 804222) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0624_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0624
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0625 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 2), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 625 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0625 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(9, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 2), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0625_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0625
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0626 : Poly :=
[
  term (48 : Rat) [(9, 2), (15, 2)]
]

/-- Partial product 626 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0626 : Poly :=
[
  term (96 : Rat) [(9, 2), (14, 1), (15, 2)],
  term (-48 : Rat) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0626_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0626
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0627 : Poly :=
[
  term ((-2612095 : Rat) / 1608444) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0627 : Poly :=
[
  term ((-2612095 : Rat) / 804222) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 1608444) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0627_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0627
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0628 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(9, 2), (15, 4), (16, 1)]
]

/-- Partial product 628 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0628 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 2), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0628_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0628
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0629 : Poly :=
[
  term ((179 : Rat) / 16) [(10, 1)]
]

/-- Partial product 629 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0629 : Poly :=
[
  term ((-179 : Rat) / 16) [(10, 1)],
  term ((179 : Rat) / 8) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0629_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0629
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0630 : Poly :=
[
  term (-21 : Rat) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 630 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0630 : Poly :=
[
  term (21 : Rat) [(10, 1), (11, 1), (13, 1)],
  term (-42 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0630_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0630
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0631 : Poly :=
[
  term ((1180595 : Rat) / 1608444) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 631 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0631 : Poly :=
[
  term ((1180595 : Rat) / 804222) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 1608444) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0631_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0631
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0632 : Poly :=
[
  term (21 : Rat) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 632 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0632 : Poly :=
[
  term (42 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term (-21 : Rat) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0632_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0632
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0633 : Poly :=
[
  term ((20603999 : Rat) / 12867552) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0633 : Poly :=
[
  term ((20603999 : Rat) / 6433776) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20603999 : Rat) / 12867552) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0633_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0633
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0634 : Poly :=
[
  term ((-1180595 : Rat) / 3216888) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 634 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0634 : Poly :=
[
  term ((-1180595 : Rat) / 1608444) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 3216888) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0634_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0634
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0635 : Poly :=
[
  term ((49702 : Rat) / 134037) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0635 : Poly :=
[
  term ((-49702 : Rat) / 134037) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0635_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0635
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0636 : Poly :=
[
  term ((191 : Rat) / 2) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 636 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0636 : Poly :=
[
  term (191 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-191 : Rat) / 2) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0636_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0636
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0637 : Poly :=
[
  term ((-84214997 : Rat) / 25735104) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0637 : Poly :=
[
  term ((-84214997 : Rat) / 12867552) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((84214997 : Rat) / 25735104) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0637_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0637
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0638 : Poly :=
[
  term (48 : Rat) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 638 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0638 : Poly :=
[
  term (96 : Rat) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term (-48 : Rat) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0638_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0638
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0639 : Poly :=
[
  term ((-6392867 : Rat) / 1072296) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 639 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0639 : Poly :=
[
  term ((-6392867 : Rat) / 536148) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((6392867 : Rat) / 1072296) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0639_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0639
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0640 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(10, 1), (13, 1), (15, 5), (16, 1)]
]

/-- Partial product 640 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0640 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(10, 1), (13, 1), (14, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(10, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0640_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0640
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0641 : Poly :=
[
  term (-21 : Rat) [(10, 1), (13, 2)]
]

/-- Partial product 641 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0641 : Poly :=
[
  term (21 : Rat) [(10, 1), (13, 2)],
  term (-42 : Rat) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0641_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0641
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0642 : Poly :=
[
  term ((-23 : Rat) / 4) [(10, 1), (15, 2)]
]

/-- Partial product 642 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0642 : Poly :=
[
  term ((-23 : Rat) / 2) [(10, 1), (14, 1), (15, 2)],
  term ((23 : Rat) / 4) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0642_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0642
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0643 : Poly :=
[
  term ((-11197775 : Rat) / 6433776) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 643 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0643 : Poly :=
[
  term ((-11197775 : Rat) / 3216888) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((11197775 : Rat) / 6433776) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0643_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0643
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0644 : Poly :=
[
  term (-24 : Rat) [(10, 1), (15, 4)]
]

/-- Partial product 644 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0644 : Poly :=
[
  term (-48 : Rat) [(10, 1), (14, 1), (15, 4)],
  term (24 : Rat) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0644_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0644
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0645 : Poly :=
[
  term ((230495 : Rat) / 134037) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 645 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0645 : Poly :=
[
  term ((460990 : Rat) / 134037) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-230495 : Rat) / 134037) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0645_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0645
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0646 : Poly :=
[
  term ((128807 : Rat) / 178716) [(10, 1), (15, 6), (16, 1)]
]

/-- Partial product 646 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0646 : Poly :=
[
  term ((128807 : Rat) / 89358) [(10, 1), (14, 1), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 178716) [(10, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0646_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0646
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0647 : Poly :=
[
  term (-21 : Rat) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 647 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0647 : Poly :=
[
  term (21 : Rat) [(11, 1), (12, 1), (13, 1)],
  term (-42 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0647_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0647
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0648 : Poly :=
[
  term ((1180595 : Rat) / 804222) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 648 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0648 : Poly :=
[
  term ((1180595 : Rat) / 402111) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0648_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0648
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0649 : Poly :=
[
  term ((-107 : Rat) / 2) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 649 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0649 : Poly :=
[
  term (-107 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((107 : Rat) / 2) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0649_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0649
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0650 : Poly :=
[
  term ((80374255 : Rat) / 25735104) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 650 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0650 : Poly :=
[
  term ((80374255 : Rat) / 12867552) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80374255 : Rat) / 25735104) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0650_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0650
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0651 : Poly :=
[
  term (-48 : Rat) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 651 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0651 : Poly :=
[
  term (-96 : Rat) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term (48 : Rat) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0651_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0651
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0652 : Poly :=
[
  term ((217178 : Rat) / 44679) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 652 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0652 : Poly :=
[
  term ((434356 : Rat) / 44679) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-217178 : Rat) / 44679) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0652_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0652
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0653 : Poly :=
[
  term ((128807 : Rat) / 89358) [(11, 1), (12, 1), (15, 5), (16, 1)]
]

/-- Partial product 653 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0653 : Poly :=
[
  term ((128807 : Rat) / 44679) [(11, 1), (12, 1), (14, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (12, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0653_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0653
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0654 : Poly :=
[
  term ((21 : Rat) / 2) [(11, 1), (13, 1)]
]

/-- Partial product 654 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0654 : Poly :=
[
  term ((-21 : Rat) / 2) [(11, 1), (13, 1)],
  term (21 : Rat) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0654_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0654
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0655 : Poly :=
[
  term ((-1180595 : Rat) / 3216888) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 655 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0655 : Poly :=
[
  term ((1180595 : Rat) / 3216888) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0655_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0655
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0656 : Poly :=
[
  term ((-1180595 : Rat) / 6433776) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 656 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0656 : Poly :=
[
  term ((-1180595 : Rat) / 3216888) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 6433776) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0656_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0656
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0657 : Poly :=
[
  term ((47 : Rat) / 4) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 657 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0657 : Poly :=
[
  term ((-47 : Rat) / 4) [(11, 1), (14, 1), (15, 1)],
  term ((47 : Rat) / 2) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0657_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0657
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0658 : Poly :=
[
  term ((22867333 : Rat) / 25735104) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0658 : Poly :=
[
  term ((-22867333 : Rat) / 25735104) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22867333 : Rat) / 12867552) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0658_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0658
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0659 : Poly :=
[
  term (24 : Rat) [(11, 1), (14, 1), (15, 3)]
]

/-- Partial product 659 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0659 : Poly :=
[
  term (-24 : Rat) [(11, 1), (14, 1), (15, 3)],
  term (48 : Rat) [(11, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0659_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0659
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0660 : Poly :=
[
  term ((-4074341 : Rat) / 2144592) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 660 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0660 : Poly :=
[
  term ((4074341 : Rat) / 2144592) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4074341 : Rat) / 1072296) [(11, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0660_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0660
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0661 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(11, 1), (14, 1), (15, 5), (16, 1)]
]

/-- Partial product 661 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0661 : Poly :=
[
  term ((128807 : Rat) / 178716) [(11, 1), (14, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (14, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0661_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0661
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0662 : Poly :=
[
  term ((-839 : Rat) / 8) [(11, 1), (15, 1)]
]

/-- Partial product 662 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0662 : Poly :=
[
  term ((-839 : Rat) / 4) [(11, 1), (14, 1), (15, 1)],
  term ((839 : Rat) / 8) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0662_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0662
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0663 : Poly :=
[
  term ((1524727 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0663 : Poly :=
[
  term ((1524727 : Rat) / 3216888) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1524727 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0663_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0663
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0664 : Poly :=
[
  term (-12 : Rat) [(11, 1), (15, 3)]
]

/-- Partial product 664 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0664 : Poly :=
[
  term (-24 : Rat) [(11, 1), (14, 1), (15, 3)],
  term (12 : Rat) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0664_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0664
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0665 : Poly :=
[
  term ((52107269 : Rat) / 12867552) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 665 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0665 : Poly :=
[
  term ((52107269 : Rat) / 6433776) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-52107269 : Rat) / 12867552) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0665_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0665
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0666 : Poly :=
[
  term ((128807 : Rat) / 357432) [(11, 1), (15, 5), (16, 1)]
]

/-- Partial product 666 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0666 : Poly :=
[
  term ((128807 : Rat) / 178716) [(11, 1), (14, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 357432) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0666_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0666
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0667 : Poly :=
[
  term ((21 : Rat) / 4) [(11, 2)]
]

/-- Partial product 667 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0667 : Poly :=
[
  term ((-21 : Rat) / 4) [(11, 2)],
  term ((21 : Rat) / 2) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0667_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0667
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0668 : Poly :=
[
  term (21 : Rat) [(11, 2), (12, 1)]
]

/-- Partial product 668 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0668 : Poly :=
[
  term (-21 : Rat) [(11, 2), (12, 1)],
  term (42 : Rat) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0668_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0668
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0669 : Poly :=
[
  term ((-1180595 : Rat) / 1608444) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 669 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0669 : Poly :=
[
  term ((-1180595 : Rat) / 804222) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 1608444) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0669_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0669
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0670 : Poly :=
[
  term ((-21 : Rat) / 2) [(11, 2), (14, 1)]
]

/-- Partial product 670 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0670 : Poly :=
[
  term ((21 : Rat) / 2) [(11, 2), (14, 1)],
  term (-21 : Rat) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0670_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0670
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0671 : Poly :=
[
  term ((1180595 : Rat) / 3216888) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 671 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0671 : Poly :=
[
  term ((-1180595 : Rat) / 3216888) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 1608444) [(11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0671_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0671
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0672 : Poly :=
[
  term ((-1180595 : Rat) / 6433776) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 672 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0672 : Poly :=
[
  term ((-1180595 : Rat) / 3216888) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 6433776) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0672_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0672
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0673 : Poly :=
[
  term ((-1037 : Rat) / 16) [(12, 1)]
]

/-- Partial product 673 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0673 : Poly :=
[
  term ((1037 : Rat) / 16) [(12, 1)],
  term ((-1037 : Rat) / 8) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0673_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0673
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0674 : Poly :=
[
  term ((66847 : Rat) / 268074) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0674 : Poly :=
[
  term ((-66847 : Rat) / 268074) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((66847 : Rat) / 134037) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0674_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0674
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0675 : Poly :=
[
  term (-190 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 675 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0675 : Poly :=
[
  term (-380 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term (190 : Rat) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0675_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0675
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0676 : Poly :=
[
  term ((28744157 : Rat) / 4289184) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0676 : Poly :=
[
  term ((28744157 : Rat) / 2144592) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28744157 : Rat) / 4289184) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0676_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0676
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0677 : Poly :=
[
  term (96 : Rat) [(12, 1), (13, 1), (15, 3)]
]

/-- Partial product 677 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0677 : Poly :=
[
  term (192 : Rat) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term (-96 : Rat) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0677_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0677
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0678 : Poly :=
[
  term ((-4928507 : Rat) / 1072296) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 678 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0678 : Poly :=
[
  term ((-4928507 : Rat) / 536148) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4928507 : Rat) / 1072296) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0678_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0678
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0679 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(12, 1), (13, 1), (15, 5), (16, 1)]
]

/-- Partial product 679 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0679 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(12, 1), (13, 1), (14, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 44679) [(12, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0679_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0679
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0680 : Poly :=
[
  term (108 : Rat) [(12, 1), (13, 2)]
]

/-- Partial product 680 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0680 : Poly :=
[
  term (-108 : Rat) [(12, 1), (13, 2)],
  term (216 : Rat) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0680_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0680
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0681 : Poly :=
[
  term ((153 : Rat) / 4) [(12, 1), (15, 2)]
]

/-- Partial product 681 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0681 : Poly :=
[
  term ((153 : Rat) / 2) [(12, 1), (14, 1), (15, 2)],
  term ((-153 : Rat) / 4) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0681_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0681
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0682 : Poly :=
[
  term ((-26579387 : Rat) / 4289184) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 682 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0682 : Poly :=
[
  term ((-26579387 : Rat) / 2144592) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((26579387 : Rat) / 4289184) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0682_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0682
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0683 : Poly :=
[
  term (-72 : Rat) [(12, 1), (15, 4)]
]

/-- Partial product 683 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0683 : Poly :=
[
  term (-144 : Rat) [(12, 1), (14, 1), (15, 4)],
  term (72 : Rat) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0683_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0683
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0684 : Poly :=
[
  term ((1254163 : Rat) / 268074) [(12, 1), (15, 4), (16, 1)]
]

/-- Partial product 684 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0684 : Poly :=
[
  term ((1254163 : Rat) / 134037) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1254163 : Rat) / 268074) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0684_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0684
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0685 : Poly :=
[
  term ((128807 : Rat) / 59572) [(12, 1), (15, 6), (16, 1)]
]

/-- Partial product 685 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0685 : Poly :=
[
  term ((128807 : Rat) / 29786) [(12, 1), (14, 1), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 59572) [(12, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0685_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0685
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0686 : Poly :=
[
  term ((325 : Rat) / 4) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 686 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0686 : Poly :=
[
  term ((-325 : Rat) / 4) [(13, 1), (14, 1), (15, 1)],
  term ((325 : Rat) / 2) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0686_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0686
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0687 : Poly :=
[
  term ((-10149115 : Rat) / 8578368) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0687 : Poly :=
[
  term ((10149115 : Rat) / 8578368) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10149115 : Rat) / 4289184) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0687_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0687
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0688 : Poly :=
[
  term (-24 : Rat) [(13, 1), (14, 1), (15, 3)]
]

/-- Partial product 688 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0688 : Poly :=
[
  term (24 : Rat) [(13, 1), (14, 1), (15, 3)],
  term (-48 : Rat) [(13, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0688_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0688
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0689 : Poly :=
[
  term ((-47483 : Rat) / 2144592) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 689 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0689 : Poly :=
[
  term ((47483 : Rat) / 2144592) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-47483 : Rat) / 1072296) [(13, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0689_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0689
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0690 : Poly :=
[
  term ((128807 : Rat) / 178716) [(13, 1), (14, 1), (15, 5), (16, 1)]
]

/-- Partial product 690 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0690 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(13, 1), (14, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(13, 1), (14, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0690_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0690
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0691 : Poly :=
[
  term ((-2503 : Rat) / 8) [(13, 1), (15, 1)]
]

/-- Partial product 691 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0691 : Poly :=
[
  term ((-2503 : Rat) / 4) [(13, 1), (14, 1), (15, 1)],
  term ((2503 : Rat) / 8) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0691_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0691
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0692 : Poly :=
[
  term ((31341239 : Rat) / 51470208) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0692 : Poly :=
[
  term ((31341239 : Rat) / 25735104) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31341239 : Rat) / 51470208) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0692_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0692
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0693 : Poly :=
[
  term (-12 : Rat) [(13, 1), (15, 3)]
]

/-- Partial product 693 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0693 : Poly :=
[
  term (-24 : Rat) [(13, 1), (14, 1), (15, 3)],
  term (12 : Rat) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0693_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0693
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0694 : Poly :=
[
  term ((2798765 : Rat) / 1429728) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 694 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0694 : Poly :=
[
  term ((2798765 : Rat) / 714864) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2798765 : Rat) / 1429728) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0694_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0694
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0695 : Poly :=
[
  term ((128807 : Rat) / 357432) [(13, 1), (15, 5), (16, 1)]
]

/-- Partial product 695 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0695 : Poly :=
[
  term ((128807 : Rat) / 178716) [(13, 1), (14, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 357432) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0695_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0695
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0696 : Poly :=
[
  term ((477 : Rat) / 4) [(13, 2)]
]

/-- Partial product 696 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0696 : Poly :=
[
  term ((-477 : Rat) / 4) [(13, 2)],
  term ((477 : Rat) / 2) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0696_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0696
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0697 : Poly :=
[
  term ((-87 : Rat) / 2) [(13, 2), (14, 1)]
]

/-- Partial product 697 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0697 : Poly :=
[
  term ((87 : Rat) / 2) [(13, 2), (14, 1)],
  term (-87 : Rat) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0697_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0697
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0698 : Poly :=
[
  term ((128807 : Rat) / 1072296) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 698 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0698 : Poly :=
[
  term ((-128807 : Rat) / 1072296) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 536148) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0698_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0698
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 28. -/
def rs_R003_ueqv_R003NN_coefficient_28_0699 : Poly :=
[
  term ((128807 : Rat) / 2144592) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 699 for generator 28. -/
def rs_R003_ueqv_R003NN_partial_28_0699 : Poly :=
[
  term ((128807 : Rat) / 1072296) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 2144592) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 28. -/
theorem rs_R003_ueqv_R003NN_partial_28_0699_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_28_0699
        rs_R003_ueqv_R003NN_generator_28_0600_0699 =
      rs_R003_ueqv_R003NN_partial_28_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_28_0600_0699 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_28_0600,
  rs_R003_ueqv_R003NN_partial_28_0601,
  rs_R003_ueqv_R003NN_partial_28_0602,
  rs_R003_ueqv_R003NN_partial_28_0603,
  rs_R003_ueqv_R003NN_partial_28_0604,
  rs_R003_ueqv_R003NN_partial_28_0605,
  rs_R003_ueqv_R003NN_partial_28_0606,
  rs_R003_ueqv_R003NN_partial_28_0607,
  rs_R003_ueqv_R003NN_partial_28_0608,
  rs_R003_ueqv_R003NN_partial_28_0609,
  rs_R003_ueqv_R003NN_partial_28_0610,
  rs_R003_ueqv_R003NN_partial_28_0611,
  rs_R003_ueqv_R003NN_partial_28_0612,
  rs_R003_ueqv_R003NN_partial_28_0613,
  rs_R003_ueqv_R003NN_partial_28_0614,
  rs_R003_ueqv_R003NN_partial_28_0615,
  rs_R003_ueqv_R003NN_partial_28_0616,
  rs_R003_ueqv_R003NN_partial_28_0617,
  rs_R003_ueqv_R003NN_partial_28_0618,
  rs_R003_ueqv_R003NN_partial_28_0619,
  rs_R003_ueqv_R003NN_partial_28_0620,
  rs_R003_ueqv_R003NN_partial_28_0621,
  rs_R003_ueqv_R003NN_partial_28_0622,
  rs_R003_ueqv_R003NN_partial_28_0623,
  rs_R003_ueqv_R003NN_partial_28_0624,
  rs_R003_ueqv_R003NN_partial_28_0625,
  rs_R003_ueqv_R003NN_partial_28_0626,
  rs_R003_ueqv_R003NN_partial_28_0627,
  rs_R003_ueqv_R003NN_partial_28_0628,
  rs_R003_ueqv_R003NN_partial_28_0629,
  rs_R003_ueqv_R003NN_partial_28_0630,
  rs_R003_ueqv_R003NN_partial_28_0631,
  rs_R003_ueqv_R003NN_partial_28_0632,
  rs_R003_ueqv_R003NN_partial_28_0633,
  rs_R003_ueqv_R003NN_partial_28_0634,
  rs_R003_ueqv_R003NN_partial_28_0635,
  rs_R003_ueqv_R003NN_partial_28_0636,
  rs_R003_ueqv_R003NN_partial_28_0637,
  rs_R003_ueqv_R003NN_partial_28_0638,
  rs_R003_ueqv_R003NN_partial_28_0639,
  rs_R003_ueqv_R003NN_partial_28_0640,
  rs_R003_ueqv_R003NN_partial_28_0641,
  rs_R003_ueqv_R003NN_partial_28_0642,
  rs_R003_ueqv_R003NN_partial_28_0643,
  rs_R003_ueqv_R003NN_partial_28_0644,
  rs_R003_ueqv_R003NN_partial_28_0645,
  rs_R003_ueqv_R003NN_partial_28_0646,
  rs_R003_ueqv_R003NN_partial_28_0647,
  rs_R003_ueqv_R003NN_partial_28_0648,
  rs_R003_ueqv_R003NN_partial_28_0649,
  rs_R003_ueqv_R003NN_partial_28_0650,
  rs_R003_ueqv_R003NN_partial_28_0651,
  rs_R003_ueqv_R003NN_partial_28_0652,
  rs_R003_ueqv_R003NN_partial_28_0653,
  rs_R003_ueqv_R003NN_partial_28_0654,
  rs_R003_ueqv_R003NN_partial_28_0655,
  rs_R003_ueqv_R003NN_partial_28_0656,
  rs_R003_ueqv_R003NN_partial_28_0657,
  rs_R003_ueqv_R003NN_partial_28_0658,
  rs_R003_ueqv_R003NN_partial_28_0659,
  rs_R003_ueqv_R003NN_partial_28_0660,
  rs_R003_ueqv_R003NN_partial_28_0661,
  rs_R003_ueqv_R003NN_partial_28_0662,
  rs_R003_ueqv_R003NN_partial_28_0663,
  rs_R003_ueqv_R003NN_partial_28_0664,
  rs_R003_ueqv_R003NN_partial_28_0665,
  rs_R003_ueqv_R003NN_partial_28_0666,
  rs_R003_ueqv_R003NN_partial_28_0667,
  rs_R003_ueqv_R003NN_partial_28_0668,
  rs_R003_ueqv_R003NN_partial_28_0669,
  rs_R003_ueqv_R003NN_partial_28_0670,
  rs_R003_ueqv_R003NN_partial_28_0671,
  rs_R003_ueqv_R003NN_partial_28_0672,
  rs_R003_ueqv_R003NN_partial_28_0673,
  rs_R003_ueqv_R003NN_partial_28_0674,
  rs_R003_ueqv_R003NN_partial_28_0675,
  rs_R003_ueqv_R003NN_partial_28_0676,
  rs_R003_ueqv_R003NN_partial_28_0677,
  rs_R003_ueqv_R003NN_partial_28_0678,
  rs_R003_ueqv_R003NN_partial_28_0679,
  rs_R003_ueqv_R003NN_partial_28_0680,
  rs_R003_ueqv_R003NN_partial_28_0681,
  rs_R003_ueqv_R003NN_partial_28_0682,
  rs_R003_ueqv_R003NN_partial_28_0683,
  rs_R003_ueqv_R003NN_partial_28_0684,
  rs_R003_ueqv_R003NN_partial_28_0685,
  rs_R003_ueqv_R003NN_partial_28_0686,
  rs_R003_ueqv_R003NN_partial_28_0687,
  rs_R003_ueqv_R003NN_partial_28_0688,
  rs_R003_ueqv_R003NN_partial_28_0689,
  rs_R003_ueqv_R003NN_partial_28_0690,
  rs_R003_ueqv_R003NN_partial_28_0691,
  rs_R003_ueqv_R003NN_partial_28_0692,
  rs_R003_ueqv_R003NN_partial_28_0693,
  rs_R003_ueqv_R003NN_partial_28_0694,
  rs_R003_ueqv_R003NN_partial_28_0695,
  rs_R003_ueqv_R003NN_partial_28_0696,
  rs_R003_ueqv_R003NN_partial_28_0697,
  rs_R003_ueqv_R003NN_partial_28_0698,
  rs_R003_ueqv_R003NN_partial_28_0699
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_28_0600_0699 : Poly :=
[
  term (-238 : Rat) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((140470 : Rat) / 14893) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((3301499 : Rat) / 268074) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (12, 1), (14, 1), (15, 5), (16, 1)],
  term (119 : Rat) [(9, 1), (12, 1), (15, 1)],
  term ((-70235 : Rat) / 14893) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(9, 1), (12, 1), (15, 3)],
  term ((-3301499 : Rat) / 536148) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (12, 1), (15, 5), (16, 1)],
  term (-251 : Rat) [(9, 1), (13, 1)],
  term (541 : Rat) [(9, 1), (13, 1), (14, 1)],
  term (-288 : Rat) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-221659 : Rat) / 268074) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 14893) [(9, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term (-78 : Rat) [(9, 1), (13, 1), (14, 2)],
  term (192 : Rat) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1452832 : Rat) / 402111) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term (96 : Rat) [(9, 1), (13, 1), (15, 2)],
  term ((2117809 : Rat) / 1608444) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term (-41 : Rat) [(9, 1), (14, 1), (15, 1)],
  term ((7890865 : Rat) / 1608444) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term (-288 : Rat) [(9, 1), (14, 1), (15, 3)],
  term ((296525 : Rat) / 30348) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 14893) [(9, 1), (14, 1), (15, 5), (16, 1)],
  term (96 : Rat) [(9, 1), (14, 2), (15, 1)],
  term ((-8945951 : Rat) / 3216888) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-7 : Rat) / 2) [(9, 1), (15, 1)],
  term ((-22617509 : Rat) / 12867552) [(9, 1), (15, 1), (16, 1)],
  term (144 : Rat) [(9, 1), (15, 3)],
  term ((-13397299 : Rat) / 3216888) [(9, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 29786) [(9, 1), (15, 5), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 2)],
  term (-9 : Rat) [(9, 2), (12, 1)],
  term (18 : Rat) [(9, 2), (12, 1), (14, 1)],
  term (192 : Rat) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-2612095 : Rat) / 402111) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term (-96 : Rat) [(9, 2), (12, 1), (15, 2)],
  term ((2612095 : Rat) / 804222) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 2), (12, 1), (15, 4), (16, 1)],
  term (9 : Rat) [(9, 2), (14, 1)],
  term (96 : Rat) [(9, 2), (14, 1), (15, 2)],
  term ((-2612095 : Rat) / 804222) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 2), (14, 1), (15, 4), (16, 1)],
  term (-48 : Rat) [(9, 2), (15, 2)],
  term ((2612095 : Rat) / 1608444) [(9, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(9, 2), (15, 4), (16, 1)],
  term ((-179 : Rat) / 16) [(10, 1)],
  term (21 : Rat) [(10, 1), (11, 1), (13, 1)],
  term (-42 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((1180595 : Rat) / 804222) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 1608444) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (42 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((20603999 : Rat) / 6433776) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 1608444) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term (-21 : Rat) [(10, 1), (11, 1), (15, 1)],
  term ((-20603999 : Rat) / 12867552) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 3216888) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term (191 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-88986389 : Rat) / 12867552) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-6392867 : Rat) / 536148) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(10, 1), (13, 1), (14, 1), (15, 5), (16, 1)],
  term ((99404 : Rat) / 134037) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-191 : Rat) / 2) [(10, 1), (13, 1), (15, 1)],
  term ((84214997 : Rat) / 25735104) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(10, 1), (13, 1), (15, 3)],
  term ((6392867 : Rat) / 1072296) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term (21 : Rat) [(10, 1), (13, 2)],
  term (-42 : Rat) [(10, 1), (13, 2), (14, 1)],
  term ((179 : Rat) / 8) [(10, 1), (14, 1)],
  term ((-23 : Rat) / 2) [(10, 1), (14, 1), (15, 2)],
  term ((-11197775 : Rat) / 3216888) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term (-48 : Rat) [(10, 1), (14, 1), (15, 4)],
  term ((460990 : Rat) / 134037) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(10, 1), (14, 1), (15, 6), (16, 1)],
  term ((23 : Rat) / 4) [(10, 1), (15, 2)],
  term ((11197775 : Rat) / 6433776) [(10, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(10, 1), (15, 4)],
  term ((-230495 : Rat) / 134037) [(10, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 178716) [(10, 1), (15, 6), (16, 1)],
  term (21 : Rat) [(11, 1), (12, 1), (13, 1)],
  term (-42 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1180595 : Rat) / 402111) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-107 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((80374255 : Rat) / 12867552) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((434356 : Rat) / 44679) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(11, 1), (12, 1), (14, 1), (15, 5), (16, 1)],
  term ((107 : Rat) / 2) [(11, 1), (12, 1), (15, 1)],
  term ((-80374255 : Rat) / 25735104) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(11, 1), (12, 1), (15, 3)],
  term ((-217178 : Rat) / 44679) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (12, 1), (15, 5), (16, 1)],
  term ((-21 : Rat) / 2) [(11, 1), (13, 1)],
  term (21 : Rat) [(11, 1), (13, 1), (14, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 6433776) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-443 : Rat) / 2) [(11, 1), (14, 1), (15, 1)],
  term ((-10669517 : Rat) / 25735104) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (14, 1), (15, 3)],
  term ((16082573 : Rat) / 1608444) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(11, 1), (14, 1), (15, 5), (16, 1)],
  term ((47 : Rat) / 2) [(11, 1), (14, 2), (15, 1)],
  term ((22867333 : Rat) / 12867552) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(11, 1), (14, 2), (15, 3)],
  term ((-4074341 : Rat) / 1072296) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (14, 2), (15, 5), (16, 1)],
  term ((839 : Rat) / 8) [(11, 1), (15, 1)],
  term ((-1524727 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (15, 3)],
  term ((-52107269 : Rat) / 12867552) [(11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(11, 1), (15, 5), (16, 1)],
  term ((-21 : Rat) / 4) [(11, 2)],
  term (-21 : Rat) [(11, 2), (12, 1)],
  term (42 : Rat) [(11, 2), (12, 1), (14, 1)],
  term ((-1180595 : Rat) / 804222) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 1608444) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term (21 : Rat) [(11, 2), (14, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term (-21 : Rat) [(11, 2), (14, 2)],
  term ((1180595 : Rat) / 1608444) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 6433776) [(11, 2), (15, 2), (16, 1)],
  term ((1037 : Rat) / 16) [(12, 1)],
  term (-380 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9403127 : Rat) / 714864) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-4928507 : Rat) / 536148) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(12, 1), (13, 1), (14, 1), (15, 5), (16, 1)],
  term ((66847 : Rat) / 134037) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (190 : Rat) [(12, 1), (13, 1), (15, 1)],
  term ((-28744157 : Rat) / 4289184) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(12, 1), (13, 1), (15, 3)],
  term ((4928507 : Rat) / 1072296) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(12, 1), (13, 1), (15, 5), (16, 1)],
  term (-108 : Rat) [(12, 1), (13, 2)],
  term (216 : Rat) [(12, 1), (13, 2), (14, 1)],
  term ((-1037 : Rat) / 8) [(12, 1), (14, 1)],
  term ((153 : Rat) / 2) [(12, 1), (14, 1), (15, 2)],
  term ((-26579387 : Rat) / 2144592) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term (-144 : Rat) [(12, 1), (14, 1), (15, 4)],
  term ((1254163 : Rat) / 134037) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 29786) [(12, 1), (14, 1), (15, 6), (16, 1)],
  term ((-153 : Rat) / 4) [(12, 1), (15, 2)],
  term ((26579387 : Rat) / 4289184) [(12, 1), (15, 2), (16, 1)],
  term (72 : Rat) [(12, 1), (15, 4)],
  term ((-1254163 : Rat) / 268074) [(12, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 59572) [(12, 1), (15, 6), (16, 1)],
  term (-707 : Rat) [(13, 1), (14, 1), (15, 1)],
  term ((7723573 : Rat) / 3216888) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4221889 : Rat) / 1072296) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((325 : Rat) / 2) [(13, 1), (14, 2), (15, 1)],
  term ((-10149115 : Rat) / 4289184) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-48 : Rat) [(13, 1), (14, 2), (15, 3)],
  term ((-47483 : Rat) / 1072296) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(13, 1), (14, 2), (15, 5), (16, 1)],
  term ((2503 : Rat) / 8) [(13, 1), (15, 1)],
  term ((-31341239 : Rat) / 51470208) [(13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 1), (15, 3)],
  term ((-2798765 : Rat) / 1429728) [(13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(13, 1), (15, 5), (16, 1)],
  term ((-477 : Rat) / 4) [(13, 2)],
  term (282 : Rat) [(13, 2), (14, 1)],
  term (-87 : Rat) [(13, 2), (14, 2)],
  term ((128807 : Rat) / 536148) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 2144592) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 600 through 699. -/
theorem rs_R003_ueqv_R003NN_block_28_0600_0699_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_28_0600_0699
      rs_R003_ueqv_R003NN_block_28_0600_0699 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
