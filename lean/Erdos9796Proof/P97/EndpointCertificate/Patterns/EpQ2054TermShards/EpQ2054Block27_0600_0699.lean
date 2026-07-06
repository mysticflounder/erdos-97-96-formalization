/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0600 : Poly :=
[
  term ((1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 1), (13, 1)]
]

/-- Partial product 600 for generator 27. -/
def ep_Q2_054_partial_27_0600 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((2115818529840 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 27. -/
theorem ep_Q2_054_partial_27_0600_valid :
    mulPoly ep_Q2_054_coefficient_27_0600
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0601 : Poly :=
[
  term ((-264477316230 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 601 for generator 27. -/
def ep_Q2_054_partial_27_0601 : Poly :=
[
  term ((264477316230 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 27. -/
theorem ep_Q2_054_partial_27_0601_valid :
    mulPoly ep_Q2_054_coefficient_27_0601
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0602 : Poly :=
[
  term ((-528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

/-- Partial product 602 for generator 27. -/
def ep_Q2_054_partial_27_0602 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 27. -/
theorem ep_Q2_054_partial_27_0602_valid :
    mulPoly ep_Q2_054_coefficient_27_0602
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0603 : Poly :=
[
  term ((-1244961160560 : Rat) / 45033486517) [(6, 1)]
]

/-- Partial product 603 for generator 27. -/
def ep_Q2_054_partial_27_0603 : Poly :=
[
  term ((1244961160560 : Rat) / 45033486517) [(6, 1)],
  term ((-2489922321120 : Rat) / 45033486517) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 27. -/
theorem ep_Q2_054_partial_27_0603_valid :
    mulPoly ep_Q2_054_coefficient_27_0603
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0604 : Poly :=
[
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 604 for generator 27. -/
def ep_Q2_054_partial_27_0604 : Poly :=
[
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 27. -/
theorem ep_Q2_054_partial_27_0604_valid :
    mulPoly ep_Q2_054_coefficient_27_0604
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0605 : Poly :=
[
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 605 for generator 27. -/
def ep_Q2_054_partial_27_0605 : Poly :=
[
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 27. -/
theorem ep_Q2_054_partial_27_0605_valid :
    mulPoly ep_Q2_054_coefficient_27_0605
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0606 : Poly :=
[
  term ((-631487137500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 606 for generator 27. -/
def ep_Q2_054_partial_27_0606 : Poly :=
[
  term ((631487137500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-1262974275000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 27. -/
theorem ep_Q2_054_partial_27_0606_valid :
    mulPoly ep_Q2_054_coefficient_27_0606
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0607 : Poly :=
[
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 607 for generator 27. -/
def ep_Q2_054_partial_27_0607 : Poly :=
[
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 27. -/
theorem ep_Q2_054_partial_27_0607_valid :
    mulPoly ep_Q2_054_coefficient_27_0607
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0608 : Poly :=
[
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 608 for generator 27. -/
def ep_Q2_054_partial_27_0608 : Poly :=
[
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 27. -/
theorem ep_Q2_054_partial_27_0608_valid :
    mulPoly ep_Q2_054_coefficient_27_0608
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0609 : Poly :=
[
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 609 for generator 27. -/
def ep_Q2_054_partial_27_0609 : Poly :=
[
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 27. -/
theorem ep_Q2_054_partial_27_0609_valid :
    mulPoly ep_Q2_054_coefficient_27_0609
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0610 : Poly :=
[
  term ((-210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 610 for generator 27. -/
def ep_Q2_054_partial_27_0610 : Poly :=
[
  term ((210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 27. -/
theorem ep_Q2_054_partial_27_0610_valid :
    mulPoly ep_Q2_054_coefficient_27_0610
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0611 : Poly :=
[
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 611 for generator 27. -/
def ep_Q2_054_partial_27_0611 : Poly :=
[
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 27. -/
theorem ep_Q2_054_partial_27_0611_valid :
    mulPoly ep_Q2_054_coefficient_27_0611
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0612 : Poly :=
[
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 612 for generator 27. -/
def ep_Q2_054_partial_27_0612 : Poly :=
[
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 27. -/
theorem ep_Q2_054_partial_27_0612_valid :
    mulPoly ep_Q2_054_coefficient_27_0612
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0613 : Poly :=
[
  term ((91603424268 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 613 for generator 27. -/
def ep_Q2_054_partial_27_0613 : Poly :=
[
  term ((-91603424268 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)],
  term ((183206848536 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 27. -/
theorem ep_Q2_054_partial_27_0613_valid :
    mulPoly ep_Q2_054_coefficient_27_0613
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0614 : Poly :=
[
  term ((210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 614 for generator 27. -/
def ep_Q2_054_partial_27_0614 : Poly :=
[
  term ((-210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 27. -/
theorem ep_Q2_054_partial_27_0614_valid :
    mulPoly ep_Q2_054_coefficient_27_0614
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0615 : Poly :=
[
  term ((-1431131601654 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 615 for generator 27. -/
def ep_Q2_054_partial_27_0615 : Poly :=
[
  term ((1431131601654 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-2862263203308 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 27. -/
theorem ep_Q2_054_partial_27_0615_valid :
    mulPoly ep_Q2_054_coefficient_27_0615
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0616 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 616 for generator 27. -/
def ep_Q2_054_partial_27_0616 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 27. -/
theorem ep_Q2_054_partial_27_0616_valid :
    mulPoly ep_Q2_054_coefficient_27_0616
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0617 : Poly :=
[
  term ((1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 617 for generator 27. -/
def ep_Q2_054_partial_27_0617 : Poly :=
[
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 27. -/
theorem ep_Q2_054_partial_27_0617_valid :
    mulPoly ep_Q2_054_coefficient_27_0617
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0618 : Poly :=
[
  term ((-9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 618 for generator 27. -/
def ep_Q2_054_partial_27_0618 : Poly :=
[
  term ((9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 27. -/
theorem ep_Q2_054_partial_27_0618_valid :
    mulPoly ep_Q2_054_coefficient_27_0618
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0619 : Poly :=
[
  term ((-3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 619 for generator 27. -/
def ep_Q2_054_partial_27_0619 : Poly :=
[
  term ((-3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 27. -/
theorem ep_Q2_054_partial_27_0619_valid :
    mulPoly ep_Q2_054_coefficient_27_0619
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0620 : Poly :=
[
  term ((10382104246905 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 620 for generator 27. -/
def ep_Q2_054_partial_27_0620 : Poly :=
[
  term ((-10382104246905 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1)],
  term ((10382104246905 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 27. -/
theorem ep_Q2_054_partial_27_0620_valid :
    mulPoly ep_Q2_054_coefficient_27_0620
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0621 : Poly :=
[
  term ((9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 621 for generator 27. -/
def ep_Q2_054_partial_27_0621 : Poly :=
[
  term ((-9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 27. -/
theorem ep_Q2_054_partial_27_0621_valid :
    mulPoly ep_Q2_054_coefficient_27_0621
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0622 : Poly :=
[
  term ((3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 622 for generator 27. -/
def ep_Q2_054_partial_27_0622 : Poly :=
[
  term ((-3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 27. -/
theorem ep_Q2_054_partial_27_0622_valid :
    mulPoly ep_Q2_054_coefficient_27_0622
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0623 : Poly :=
[
  term ((-267619708935 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 623 for generator 27. -/
def ep_Q2_054_partial_27_0623 : Poly :=
[
  term ((267619708935 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-267619708935 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 27. -/
theorem ep_Q2_054_partial_27_0623_valid :
    mulPoly ep_Q2_054_coefficient_27_0623
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0624 : Poly :=
[
  term ((-2367848989305 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 624 for generator 27. -/
def ep_Q2_054_partial_27_0624 : Poly :=
[
  term ((-2367848989305 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((2367848989305 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 27. -/
theorem ep_Q2_054_partial_27_0624_valid :
    mulPoly ep_Q2_054_coefficient_27_0624
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0625 : Poly :=
[
  term ((2253266799363 : Rat) / 180133946068) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 625 for generator 27. -/
def ep_Q2_054_partial_27_0625 : Poly :=
[
  term ((-2253266799363 : Rat) / 180133946068) [(6, 1), (7, 1), (13, 1)],
  term ((2253266799363 : Rat) / 90066973034) [(6, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 27. -/
theorem ep_Q2_054_partial_27_0625_valid :
    mulPoly ep_Q2_054_coefficient_27_0625
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0626 : Poly :=
[
  term ((2367848989305 : Rat) / 90066973034) [(6, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 626 for generator 27. -/
def ep_Q2_054_partial_27_0626 : Poly :=
[
  term ((-2367848989305 : Rat) / 90066973034) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((2367848989305 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 27. -/
theorem ep_Q2_054_partial_27_0626_valid :
    mulPoly ep_Q2_054_coefficient_27_0626
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0627 : Poly :=
[
  term ((-617704118127 : Rat) / 90066973034) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 627 for generator 27. -/
def ep_Q2_054_partial_27_0627 : Poly :=
[
  term ((-617704118127 : Rat) / 45033486517) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((617704118127 : Rat) / 90066973034) [(6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 27. -/
theorem ep_Q2_054_partial_27_0627_valid :
    mulPoly ep_Q2_054_coefficient_27_0627
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0628 : Poly :=
[
  term ((-9375610844043 : Rat) / 180133946068) [(6, 1), (8, 1)]
]

/-- Partial product 628 for generator 27. -/
def ep_Q2_054_partial_27_0628 : Poly :=
[
  term ((9375610844043 : Rat) / 180133946068) [(6, 1), (8, 1)],
  term ((-9375610844043 : Rat) / 90066973034) [(6, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 27. -/
theorem ep_Q2_054_partial_27_0628_valid :
    mulPoly ep_Q2_054_coefficient_27_0628
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0629 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 629 for generator 27. -/
def ep_Q2_054_partial_27_0629 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 27. -/
theorem ep_Q2_054_partial_27_0629_valid :
    mulPoly ep_Q2_054_coefficient_27_0629
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0630 : Poly :=
[
  term ((-6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 630 for generator 27. -/
def ep_Q2_054_partial_27_0630 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 27. -/
theorem ep_Q2_054_partial_27_0630_valid :
    mulPoly ep_Q2_054_coefficient_27_0630
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0631 : Poly :=
[
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 631 for generator 27. -/
def ep_Q2_054_partial_27_0631 : Poly :=
[
  term ((-28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 27. -/
theorem ep_Q2_054_partial_27_0631_valid :
    mulPoly ep_Q2_054_coefficient_27_0631
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0632 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 27. -/
def ep_Q2_054_partial_27_0632 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 27. -/
theorem ep_Q2_054_partial_27_0632_valid :
    mulPoly ep_Q2_054_coefficient_27_0632
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0633 : Poly :=
[
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 633 for generator 27. -/
def ep_Q2_054_partial_27_0633 : Poly :=
[
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 27. -/
theorem ep_Q2_054_partial_27_0633_valid :
    mulPoly ep_Q2_054_coefficient_27_0633
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0634 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 634 for generator 27. -/
def ep_Q2_054_partial_27_0634 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 27. -/
theorem ep_Q2_054_partial_27_0634_valid :
    mulPoly ep_Q2_054_coefficient_27_0634
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0635 : Poly :=
[
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 635 for generator 27. -/
def ep_Q2_054_partial_27_0635 : Poly :=
[
  term ((28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 27. -/
theorem ep_Q2_054_partial_27_0635_valid :
    mulPoly ep_Q2_054_coefficient_27_0635
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0636 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 27. -/
def ep_Q2_054_partial_27_0636 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 27. -/
theorem ep_Q2_054_partial_27_0636_valid :
    mulPoly ep_Q2_054_coefficient_27_0636
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0637 : Poly :=
[
  term ((-7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 637 for generator 27. -/
def ep_Q2_054_partial_27_0637 : Poly :=
[
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 27. -/
theorem ep_Q2_054_partial_27_0637_valid :
    mulPoly ep_Q2_054_coefficient_27_0637
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0638 : Poly :=
[
  term ((10521962267076 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 638 for generator 27. -/
def ep_Q2_054_partial_27_0638 : Poly :=
[
  term ((21043924534152 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10521962267076 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 27. -/
theorem ep_Q2_054_partial_27_0638_valid :
    mulPoly ep_Q2_054_coefficient_27_0638
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0639 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 27. -/
def ep_Q2_054_partial_27_0639 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 27. -/
theorem ep_Q2_054_partial_27_0639_valid :
    mulPoly ep_Q2_054_coefficient_27_0639
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0640 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 640 for generator 27. -/
def ep_Q2_054_partial_27_0640 : Poly :=
[
  term ((48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 27. -/
theorem ep_Q2_054_partial_27_0640_valid :
    mulPoly ep_Q2_054_coefficient_27_0640
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0641 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 641 for generator 27. -/
def ep_Q2_054_partial_27_0641 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 27. -/
theorem ep_Q2_054_partial_27_0641_valid :
    mulPoly ep_Q2_054_coefficient_27_0641
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0642 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 642 for generator 27. -/
def ep_Q2_054_partial_27_0642 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 27. -/
theorem ep_Q2_054_partial_27_0642_valid :
    mulPoly ep_Q2_054_coefficient_27_0642
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0643 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)]
]

/-- Partial product 643 for generator 27. -/
def ep_Q2_054_partial_27_0643 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 27. -/
theorem ep_Q2_054_partial_27_0643_valid :
    mulPoly ep_Q2_054_coefficient_27_0643
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0644 : Poly :=
[
  term ((-7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 644 for generator 27. -/
def ep_Q2_054_partial_27_0644 : Poly :=
[
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 27. -/
theorem ep_Q2_054_partial_27_0644_valid :
    mulPoly ep_Q2_054_coefficient_27_0644
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0645 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 645 for generator 27. -/
def ep_Q2_054_partial_27_0645 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 27. -/
theorem ep_Q2_054_partial_27_0645_valid :
    mulPoly ep_Q2_054_coefficient_27_0645
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0646 : Poly :=
[
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 646 for generator 27. -/
def ep_Q2_054_partial_27_0646 : Poly :=
[
  term ((-7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 27. -/
theorem ep_Q2_054_partial_27_0646_valid :
    mulPoly ep_Q2_054_coefficient_27_0646
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0647 : Poly :=
[
  term ((3507320755692 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 647 for generator 27. -/
def ep_Q2_054_partial_27_0647 : Poly :=
[
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3507320755692 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 27. -/
theorem ep_Q2_054_partial_27_0647_valid :
    mulPoly ep_Q2_054_coefficient_27_0647
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0648 : Poly :=
[
  term ((-1435400728371 : Rat) / 90066973034) [(6, 1), (8, 1), (14, 1)]
]

/-- Partial product 648 for generator 27. -/
def ep_Q2_054_partial_27_0648 : Poly :=
[
  term ((1435400728371 : Rat) / 90066973034) [(6, 1), (8, 1), (14, 1)],
  term ((-1435400728371 : Rat) / 45033486517) [(6, 1), (8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 27. -/
theorem ep_Q2_054_partial_27_0648_valid :
    mulPoly ep_Q2_054_coefficient_27_0648
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0649 : Poly :=
[
  term ((-7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 649 for generator 27. -/
def ep_Q2_054_partial_27_0649 : Poly :=
[
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 27. -/
theorem ep_Q2_054_partial_27_0649_valid :
    mulPoly ep_Q2_054_coefficient_27_0649
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0650 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 650 for generator 27. -/
def ep_Q2_054_partial_27_0650 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 27. -/
theorem ep_Q2_054_partial_27_0650_valid :
    mulPoly ep_Q2_054_coefficient_27_0650
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0651 : Poly :=
[
  term ((2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 651 for generator 27. -/
def ep_Q2_054_partial_27_0651 : Poly :=
[
  term ((-2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((2020885192953 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 27. -/
theorem ep_Q2_054_partial_27_0651_valid :
    mulPoly ep_Q2_054_coefficient_27_0651
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0652 : Poly :=
[
  term ((689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 652 for generator 27. -/
def ep_Q2_054_partial_27_0652 : Poly :=
[
  term ((-689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 27. -/
theorem ep_Q2_054_partial_27_0652_valid :
    mulPoly ep_Q2_054_coefficient_27_0652
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0653 : Poly :=
[
  term ((-6300337613733 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 653 for generator 27. -/
def ep_Q2_054_partial_27_0653 : Poly :=
[
  term ((-6300337613733 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((6300337613733 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 27. -/
theorem ep_Q2_054_partial_27_0653_valid :
    mulPoly ep_Q2_054_coefficient_27_0653
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0654 : Poly :=
[
  term ((-2045290492953 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 654 for generator 27. -/
def ep_Q2_054_partial_27_0654 : Poly :=
[
  term ((2045290492953 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1)],
  term ((-2045290492953 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 27. -/
theorem ep_Q2_054_partial_27_0654_valid :
    mulPoly ep_Q2_054_coefficient_27_0654
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0655 : Poly :=
[
  term ((-689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 655 for generator 27. -/
def ep_Q2_054_partial_27_0655 : Poly :=
[
  term ((689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 27. -/
theorem ep_Q2_054_partial_27_0655_valid :
    mulPoly ep_Q2_054_coefficient_27_0655
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0656 : Poly :=
[
  term ((-665493297651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 656 for generator 27. -/
def ep_Q2_054_partial_27_0656 : Poly :=
[
  term ((665493297651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-665493297651 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 27. -/
theorem ep_Q2_054_partial_27_0656_valid :
    mulPoly ep_Q2_054_coefficient_27_0656
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0657 : Poly :=
[
  term ((-1939233265965 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 657 for generator 27. -/
def ep_Q2_054_partial_27_0657 : Poly :=
[
  term ((1939233265965 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1939233265965 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 27. -/
theorem ep_Q2_054_partial_27_0657_valid :
    mulPoly ep_Q2_054_coefficient_27_0657
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0658 : Poly :=
[
  term ((45216650820609 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 658 for generator 27. -/
def ep_Q2_054_partial_27_0658 : Poly :=
[
  term ((45216650820609 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-45216650820609 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 27. -/
theorem ep_Q2_054_partial_27_0658_valid :
    mulPoly ep_Q2_054_coefficient_27_0658
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0659 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 27. -/
def ep_Q2_054_partial_27_0659 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 27. -/
theorem ep_Q2_054_partial_27_0659_valid :
    mulPoly ep_Q2_054_coefficient_27_0659
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0660 : Poly :=
[
  term ((-4764359847051 : Rat) / 180133946068) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 660 for generator 27. -/
def ep_Q2_054_partial_27_0660 : Poly :=
[
  term ((4764359847051 : Rat) / 180133946068) [(6, 1), (9, 1), (13, 1)],
  term ((-4764359847051 : Rat) / 90066973034) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 27. -/
theorem ep_Q2_054_partial_27_0660_valid :
    mulPoly ep_Q2_054_coefficient_27_0660
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0661 : Poly :=
[
  term ((420537516687 : Rat) / 90066973034) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 661 for generator 27. -/
def ep_Q2_054_partial_27_0661 : Poly :=
[
  term ((-420537516687 : Rat) / 90066973034) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((420537516687 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 27. -/
theorem ep_Q2_054_partial_27_0661_valid :
    mulPoly ep_Q2_054_coefficient_27_0661
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0662 : Poly :=
[
  term ((510289952571 : Rat) / 90066973034) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 662 for generator 27. -/
def ep_Q2_054_partial_27_0662 : Poly :=
[
  term ((510289952571 : Rat) / 45033486517) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-510289952571 : Rat) / 90066973034) [(6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 27. -/
theorem ep_Q2_054_partial_27_0662_valid :
    mulPoly ep_Q2_054_coefficient_27_0662
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0663 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(6, 1), (9, 2)]
]

/-- Partial product 663 for generator 27. -/
def ep_Q2_054_partial_27_0663 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(6, 1), (9, 2)],
  term ((653215415904 : Rat) / 45033486517) [(6, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 27. -/
theorem ep_Q2_054_partial_27_0663_valid :
    mulPoly ep_Q2_054_coefficient_27_0663
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0664 : Poly :=
[
  term ((40825963494 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)]
]

/-- Partial product 664 for generator 27. -/
def ep_Q2_054_partial_27_0664 : Poly :=
[
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 27. -/
theorem ep_Q2_054_partial_27_0664_valid :
    mulPoly ep_Q2_054_coefficient_27_0664
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0665 : Poly :=
[
  term ((-13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 665 for generator 27. -/
def ep_Q2_054_partial_27_0665 : Poly :=
[
  term ((-26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 27. -/
theorem ep_Q2_054_partial_27_0665_valid :
    mulPoly ep_Q2_054_coefficient_27_0665
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0666 : Poly :=
[
  term ((312515105154 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 27. -/
def ep_Q2_054_partial_27_0666 : Poly :=
[
  term ((625030210308 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-312515105154 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 27. -/
theorem ep_Q2_054_partial_27_0666_valid :
    mulPoly ep_Q2_054_coefficient_27_0666
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0667 : Poly :=
[
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 667 for generator 27. -/
def ep_Q2_054_partial_27_0667 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 27. -/
theorem ep_Q2_054_partial_27_0667_valid :
    mulPoly ep_Q2_054_coefficient_27_0667
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0668 : Poly :=
[
  term ((67632897661299 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 668 for generator 27. -/
def ep_Q2_054_partial_27_0668 : Poly :=
[
  term ((135265795322598 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-67632897661299 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 27. -/
theorem ep_Q2_054_partial_27_0668_valid :
    mulPoly ep_Q2_054_coefficient_27_0668
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0669 : Poly :=
[
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 27. -/
def ep_Q2_054_partial_27_0669 : Poly :=
[
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 27. -/
theorem ep_Q2_054_partial_27_0669_valid :
    mulPoly ep_Q2_054_coefficient_27_0669
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0670 : Poly :=
[
  term ((-6365520229131 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2)]
]

/-- Partial product 670 for generator 27. -/
def ep_Q2_054_partial_27_0670 : Poly :=
[
  term ((-12731040458262 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((6365520229131 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 27. -/
theorem ep_Q2_054_partial_27_0670_valid :
    mulPoly ep_Q2_054_coefficient_27_0670
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0671 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 671 for generator 27. -/
def ep_Q2_054_partial_27_0671 : Poly :=
[
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 27. -/
theorem ep_Q2_054_partial_27_0671_valid :
    mulPoly ep_Q2_054_coefficient_27_0671
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0672 : Poly :=
[
  term ((473642722245 : Rat) / 90066973034) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 672 for generator 27. -/
def ep_Q2_054_partial_27_0672 : Poly :=
[
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-473642722245 : Rat) / 90066973034) [(6, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 27. -/
theorem ep_Q2_054_partial_27_0672_valid :
    mulPoly ep_Q2_054_coefficient_27_0672
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0673 : Poly :=
[
  term ((-67632897661299 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 673 for generator 27. -/
def ep_Q2_054_partial_27_0673 : Poly :=
[
  term ((-135265795322598 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((67632897661299 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 27. -/
theorem ep_Q2_054_partial_27_0673_valid :
    mulPoly ep_Q2_054_coefficient_27_0673
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0674 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 27. -/
def ep_Q2_054_partial_27_0674 : Poly :=
[
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 27. -/
theorem ep_Q2_054_partial_27_0674_valid :
    mulPoly ep_Q2_054_coefficient_27_0674
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0675 : Poly :=
[
  term ((6365520229131 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 675 for generator 27. -/
def ep_Q2_054_partial_27_0675 : Poly :=
[
  term ((-6365520229131 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((12731040458262 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 27. -/
theorem ep_Q2_054_partial_27_0675_valid :
    mulPoly ep_Q2_054_coefficient_27_0675
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0676 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 27. -/
def ep_Q2_054_partial_27_0676 : Poly :=
[
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 27. -/
theorem ep_Q2_054_partial_27_0676_valid :
    mulPoly ep_Q2_054_coefficient_27_0676
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0677 : Poly :=
[
  term ((14334999143193 : Rat) / 90066973034) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 677 for generator 27. -/
def ep_Q2_054_partial_27_0677 : Poly :=
[
  term ((14334999143193 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-14334999143193 : Rat) / 90066973034) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 27. -/
theorem ep_Q2_054_partial_27_0677_valid :
    mulPoly ep_Q2_054_coefficient_27_0677
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0678 : Poly :=
[
  term ((-629900274822 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 678 for generator 27. -/
def ep_Q2_054_partial_27_0678 : Poly :=
[
  term ((-1259800549644 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((629900274822 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 27. -/
theorem ep_Q2_054_partial_27_0678_valid :
    mulPoly ep_Q2_054_coefficient_27_0678
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0679 : Poly :=
[
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 679 for generator 27. -/
def ep_Q2_054_partial_27_0679 : Poly :=
[
  term ((3789141777960 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 27. -/
theorem ep_Q2_054_partial_27_0679_valid :
    mulPoly ep_Q2_054_coefficient_27_0679
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0680 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 680 for generator 27. -/
def ep_Q2_054_partial_27_0680 : Poly :=
[
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 27. -/
theorem ep_Q2_054_partial_27_0680_valid :
    mulPoly ep_Q2_054_coefficient_27_0680
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0681 : Poly :=
[
  term ((1420928166735 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 681 for generator 27. -/
def ep_Q2_054_partial_27_0681 : Poly :=
[
  term ((2841856333470 : Rat) / 45033486517) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 27. -/
theorem ep_Q2_054_partial_27_0681_valid :
    mulPoly ep_Q2_054_coefficient_27_0681
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0682 : Poly :=
[
  term ((-1531329288120 : Rat) / 45033486517) [(6, 1), (12, 1)]
]

/-- Partial product 682 for generator 27. -/
def ep_Q2_054_partial_27_0682 : Poly :=
[
  term ((1531329288120 : Rat) / 45033486517) [(6, 1), (12, 1)],
  term ((-3062658576240 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 27. -/
theorem ep_Q2_054_partial_27_0682_valid :
    mulPoly ep_Q2_054_coefficient_27_0682
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0683 : Poly :=
[
  term ((1859887110627 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 683 for generator 27. -/
def ep_Q2_054_partial_27_0683 : Poly :=
[
  term ((3719774221254 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1859887110627 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 27. -/
theorem ep_Q2_054_partial_27_0683_valid :
    mulPoly ep_Q2_054_coefficient_27_0683
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0684 : Poly :=
[
  term ((2033775000 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1)]
]

/-- Partial product 684 for generator 27. -/
def ep_Q2_054_partial_27_0684 : Poly :=
[
  term ((-2033775000 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 27. -/
theorem ep_Q2_054_partial_27_0684_valid :
    mulPoly ep_Q2_054_coefficient_27_0684
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0685 : Poly :=
[
  term ((9395942355531 : Rat) / 45033486517) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 685 for generator 27. -/
def ep_Q2_054_partial_27_0685 : Poly :=
[
  term ((18791884711062 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-9395942355531 : Rat) / 45033486517) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 27. -/
theorem ep_Q2_054_partial_27_0685_valid :
    mulPoly ep_Q2_054_coefficient_27_0685
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0686 : Poly :=
[
  term ((473642722245 : Rat) / 90066973034) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 686 for generator 27. -/
def ep_Q2_054_partial_27_0686 : Poly :=
[
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-473642722245 : Rat) / 90066973034) [(6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 27. -/
theorem ep_Q2_054_partial_27_0686_valid :
    mulPoly ep_Q2_054_coefficient_27_0686
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0687 : Poly :=
[
  term ((-9395942355531 : Rat) / 45033486517) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 687 for generator 27. -/
def ep_Q2_054_partial_27_0687 : Poly :=
[
  term ((9395942355531 : Rat) / 45033486517) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18791884711062 : Rat) / 45033486517) [(6, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 27. -/
theorem ep_Q2_054_partial_27_0687_valid :
    mulPoly ep_Q2_054_coefficient_27_0687
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0688 : Poly :=
[
  term ((-27427695780105 : Rat) / 90066973034) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 688 for generator 27. -/
def ep_Q2_054_partial_27_0688 : Poly :=
[
  term ((-27427695780105 : Rat) / 45033486517) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((27427695780105 : Rat) / 90066973034) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 27. -/
theorem ep_Q2_054_partial_27_0688_valid :
    mulPoly ep_Q2_054_coefficient_27_0688
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0689 : Poly :=
[
  term ((941478132186 : Rat) / 45033486517) [(6, 1), (14, 1)]
]

/-- Partial product 689 for generator 27. -/
def ep_Q2_054_partial_27_0689 : Poly :=
[
  term ((-941478132186 : Rat) / 45033486517) [(6, 1), (14, 1)],
  term ((1882956264372 : Rat) / 45033486517) [(6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 27. -/
theorem ep_Q2_054_partial_27_0689_valid :
    mulPoly ep_Q2_054_coefficient_27_0689
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0690 : Poly :=
[
  term ((-4598155042731 : Rat) / 45033486517) [(6, 1), (15, 2)]
]

/-- Partial product 690 for generator 27. -/
def ep_Q2_054_partial_27_0690 : Poly :=
[
  term ((-9196310085462 : Rat) / 45033486517) [(6, 1), (14, 1), (15, 2)],
  term ((4598155042731 : Rat) / 45033486517) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 27. -/
theorem ep_Q2_054_partial_27_0690_valid :
    mulPoly ep_Q2_054_coefficient_27_0690
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0691 : Poly :=
[
  term ((473642722245 : Rat) / 90066973034) [(6, 1), (16, 1)]
]

/-- Partial product 691 for generator 27. -/
def ep_Q2_054_partial_27_0691 : Poly :=
[
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (14, 1), (16, 1)],
  term ((-473642722245 : Rat) / 90066973034) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 27. -/
theorem ep_Q2_054_partial_27_0691_valid :
    mulPoly ep_Q2_054_coefficient_27_0691
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0692 : Poly :=
[
  term ((1957038669999 : Rat) / 90066973034) [(6, 2)]
]

/-- Partial product 692 for generator 27. -/
def ep_Q2_054_partial_27_0692 : Poly :=
[
  term ((-1957038669999 : Rat) / 90066973034) [(6, 2)],
  term ((1957038669999 : Rat) / 45033486517) [(6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 27. -/
theorem ep_Q2_054_partial_27_0692_valid :
    mulPoly ep_Q2_054_coefficient_27_0692
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0693 : Poly :=
[
  term ((-245559985209 : Rat) / 45033486517) [(6, 2), (14, 1)]
]

/-- Partial product 693 for generator 27. -/
def ep_Q2_054_partial_27_0693 : Poly :=
[
  term ((245559985209 : Rat) / 45033486517) [(6, 2), (14, 1)],
  term ((-491119970418 : Rat) / 45033486517) [(6, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 27. -/
theorem ep_Q2_054_partial_27_0693_valid :
    mulPoly ep_Q2_054_coefficient_27_0693
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0694 : Poly :=
[
  term ((-248815814202 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 694 for generator 27. -/
def ep_Q2_054_partial_27_0694 : Poly :=
[
  term ((248815814202 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)],
  term ((-497631628404 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 27. -/
theorem ep_Q2_054_partial_27_0694_valid :
    mulPoly ep_Q2_054_coefficient_27_0694
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0695 : Poly :=
[
  term ((77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)]
]

/-- Partial product 695 for generator 27. -/
def ep_Q2_054_partial_27_0695 : Poly :=
[
  term ((-77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 27. -/
theorem ep_Q2_054_partial_27_0695_valid :
    mulPoly ep_Q2_054_coefficient_27_0695
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0696 : Poly :=
[
  term ((-118617857244 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 696 for generator 27. -/
def ep_Q2_054_partial_27_0696 : Poly :=
[
  term ((118617857244 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-237235714488 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 27. -/
theorem ep_Q2_054_partial_27_0696_valid :
    mulPoly ep_Q2_054_coefficient_27_0696
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0697 : Poly :=
[
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 697 for generator 27. -/
def ep_Q2_054_partial_27_0697 : Poly :=
[
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 27. -/
theorem ep_Q2_054_partial_27_0697_valid :
    mulPoly ep_Q2_054_coefficient_27_0697
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0698 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 698 for generator 27. -/
def ep_Q2_054_partial_27_0698 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 27. -/
theorem ep_Q2_054_partial_27_0698_valid :
    mulPoly ep_Q2_054_coefficient_27_0698
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0699 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 699 for generator 27. -/
def ep_Q2_054_partial_27_0699 : Poly :=
[
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 27. -/
theorem ep_Q2_054_partial_27_0699_valid :
    mulPoly ep_Q2_054_coefficient_27_0699
        ep_Q2_054_generator_27_0600_0699 =
      ep_Q2_054_partial_27_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0600_0699 : List Poly :=
[
  ep_Q2_054_partial_27_0600,
  ep_Q2_054_partial_27_0601,
  ep_Q2_054_partial_27_0602,
  ep_Q2_054_partial_27_0603,
  ep_Q2_054_partial_27_0604,
  ep_Q2_054_partial_27_0605,
  ep_Q2_054_partial_27_0606,
  ep_Q2_054_partial_27_0607,
  ep_Q2_054_partial_27_0608,
  ep_Q2_054_partial_27_0609,
  ep_Q2_054_partial_27_0610,
  ep_Q2_054_partial_27_0611,
  ep_Q2_054_partial_27_0612,
  ep_Q2_054_partial_27_0613,
  ep_Q2_054_partial_27_0614,
  ep_Q2_054_partial_27_0615,
  ep_Q2_054_partial_27_0616,
  ep_Q2_054_partial_27_0617,
  ep_Q2_054_partial_27_0618,
  ep_Q2_054_partial_27_0619,
  ep_Q2_054_partial_27_0620,
  ep_Q2_054_partial_27_0621,
  ep_Q2_054_partial_27_0622,
  ep_Q2_054_partial_27_0623,
  ep_Q2_054_partial_27_0624,
  ep_Q2_054_partial_27_0625,
  ep_Q2_054_partial_27_0626,
  ep_Q2_054_partial_27_0627,
  ep_Q2_054_partial_27_0628,
  ep_Q2_054_partial_27_0629,
  ep_Q2_054_partial_27_0630,
  ep_Q2_054_partial_27_0631,
  ep_Q2_054_partial_27_0632,
  ep_Q2_054_partial_27_0633,
  ep_Q2_054_partial_27_0634,
  ep_Q2_054_partial_27_0635,
  ep_Q2_054_partial_27_0636,
  ep_Q2_054_partial_27_0637,
  ep_Q2_054_partial_27_0638,
  ep_Q2_054_partial_27_0639,
  ep_Q2_054_partial_27_0640,
  ep_Q2_054_partial_27_0641,
  ep_Q2_054_partial_27_0642,
  ep_Q2_054_partial_27_0643,
  ep_Q2_054_partial_27_0644,
  ep_Q2_054_partial_27_0645,
  ep_Q2_054_partial_27_0646,
  ep_Q2_054_partial_27_0647,
  ep_Q2_054_partial_27_0648,
  ep_Q2_054_partial_27_0649,
  ep_Q2_054_partial_27_0650,
  ep_Q2_054_partial_27_0651,
  ep_Q2_054_partial_27_0652,
  ep_Q2_054_partial_27_0653,
  ep_Q2_054_partial_27_0654,
  ep_Q2_054_partial_27_0655,
  ep_Q2_054_partial_27_0656,
  ep_Q2_054_partial_27_0657,
  ep_Q2_054_partial_27_0658,
  ep_Q2_054_partial_27_0659,
  ep_Q2_054_partial_27_0660,
  ep_Q2_054_partial_27_0661,
  ep_Q2_054_partial_27_0662,
  ep_Q2_054_partial_27_0663,
  ep_Q2_054_partial_27_0664,
  ep_Q2_054_partial_27_0665,
  ep_Q2_054_partial_27_0666,
  ep_Q2_054_partial_27_0667,
  ep_Q2_054_partial_27_0668,
  ep_Q2_054_partial_27_0669,
  ep_Q2_054_partial_27_0670,
  ep_Q2_054_partial_27_0671,
  ep_Q2_054_partial_27_0672,
  ep_Q2_054_partial_27_0673,
  ep_Q2_054_partial_27_0674,
  ep_Q2_054_partial_27_0675,
  ep_Q2_054_partial_27_0676,
  ep_Q2_054_partial_27_0677,
  ep_Q2_054_partial_27_0678,
  ep_Q2_054_partial_27_0679,
  ep_Q2_054_partial_27_0680,
  ep_Q2_054_partial_27_0681,
  ep_Q2_054_partial_27_0682,
  ep_Q2_054_partial_27_0683,
  ep_Q2_054_partial_27_0684,
  ep_Q2_054_partial_27_0685,
  ep_Q2_054_partial_27_0686,
  ep_Q2_054_partial_27_0687,
  ep_Q2_054_partial_27_0688,
  ep_Q2_054_partial_27_0689,
  ep_Q2_054_partial_27_0690,
  ep_Q2_054_partial_27_0691,
  ep_Q2_054_partial_27_0692,
  ep_Q2_054_partial_27_0693,
  ep_Q2_054_partial_27_0694,
  ep_Q2_054_partial_27_0695,
  ep_Q2_054_partial_27_0696,
  ep_Q2_054_partial_27_0697,
  ep_Q2_054_partial_27_0698,
  ep_Q2_054_partial_27_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0600_0699 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((2115818529840 : Rat) / 45033486517) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 1)],
  term ((264477316230 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(5, 1), (7, 2), (13, 1), (14, 2)],
  term ((1244961160560 : Rat) / 45033486517) [(6, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((631487137500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1683965700000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((841982850000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-91603424268 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1)],
  term ((-210495712500 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((420991425000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((1431131601654 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-2862263203308 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((73215900000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((183206848536 : Rat) / 45033486517) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-1404775043127 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (11, 1)],
  term ((1404775043127 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((3253256365635 : Rat) / 90066973034) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-10382104246905 : Rat) / 180133946068) [(6, 1), (7, 1), (11, 1)],
  term ((-9046464453135 : Rat) / 90066973034) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((9046464453135 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((3564423940635 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((3253256365635 : Rat) / 45033486517) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((267619708935 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-267619708935 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2367848989305 : Rat) / 45033486517) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((2367848989305 : Rat) / 90066973034) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2253266799363 : Rat) / 180133946068) [(6, 1), (7, 1), (13, 1)],
  term ((-57291094971 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((2367848989305 : Rat) / 45033486517) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-617704118127 : Rat) / 45033486517) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((617704118127 : Rat) / 90066973034) [(6, 1), (7, 1), (15, 1)],
  term ((9375610844043 : Rat) / 180133946068) [(6, 1), (8, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((28058566045536 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-10521962267076 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3507320755692 : Rat) / 45033486517) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-3970105057836 : Rat) / 45033486517) [(6, 1), (8, 1), (14, 1)],
  term ((-14029283022768 : Rat) / 45033486517) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((6101325000 : Rat) / 45033486517) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-1435400728371 : Rat) / 45033486517) [(6, 1), (8, 1), (14, 2)],
  term ((7014641511384 : Rat) / 45033486517) [(6, 1), (8, 1), (15, 2)],
  term ((-3050662500 : Rat) / 45033486517) [(6, 1), (8, 1), (16, 1)],
  term ((-2020885192953 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((2020885192953 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-6300337613733 : Rat) / 45033486517) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((6300337613733 : Rat) / 90066973034) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((2045290492953 : Rat) / 180133946068) [(6, 1), (9, 1), (11, 1)],
  term ((689898597651 : Rat) / 90066973034) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-689898597651 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-665493297651 : Rat) / 45033486517) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((1939233265965 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1939233265965 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((45216650820609 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45216650820609 : Rat) / 90066973034) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4764359847051 : Rat) / 180133946068) [(6, 1), (9, 1), (13, 1)],
  term ((-2592448681869 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((420537516687 : Rat) / 45033486517) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((510289952571 : Rat) / 45033486517) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-510289952571 : Rat) / 90066973034) [(6, 1), (9, 1), (15, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(6, 1), (9, 2)],
  term ((-40825963494 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1)],
  term ((81651926988 : Rat) / 45033486517) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((653215415904 : Rat) / 45033486517) [(6, 1), (9, 2), (14, 1)],
  term ((-26130916929042 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((625030210308 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13065458464521 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-312515105154 : Rat) / 45033486517) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((135265795322598 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67632897661299 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12731040458262 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((6365520229131 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2)],
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-473642722245 : Rat) / 90066973034) [(6, 1), (10, 1), (16, 1)],
  term ((-135265795322598 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((67632897661299 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7969478914062 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12731040458262 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14334999143193 : Rat) / 90066973034) [(6, 1), (11, 1), (15, 1)],
  term ((629900274822 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3789141777960 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((3789141777960 : Rat) / 45033486517) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1420928166735 : Rat) / 45033486517) [(6, 1), (11, 2), (16, 1)],
  term ((1531329288120 : Rat) / 45033486517) [(6, 1), (12, 1)],
  term ((3719774221254 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1859887110627 : Rat) / 45033486517) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3064692351240 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1)],
  term ((18791884711062 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((4067550000 : Rat) / 45033486517) [(6, 1), (12, 1), (14, 2)],
  term ((-9395942355531 : Rat) / 45033486517) [(6, 1), (12, 1), (15, 2)],
  term ((-473642722245 : Rat) / 90066973034) [(6, 1), (12, 1), (16, 1)],
  term ((-18031753424574 : Rat) / 45033486517) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18791884711062 : Rat) / 45033486517) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((27427695780105 : Rat) / 90066973034) [(6, 1), (13, 1), (15, 1)],
  term ((-3431400453306 : Rat) / 45033486517) [(6, 1), (14, 1)],
  term ((-9196310085462 : Rat) / 45033486517) [(6, 1), (14, 1), (15, 2)],
  term ((473642722245 : Rat) / 45033486517) [(6, 1), (14, 1), (16, 1)],
  term ((1882956264372 : Rat) / 45033486517) [(6, 1), (14, 2)],
  term ((4598155042731 : Rat) / 45033486517) [(6, 1), (15, 2)],
  term ((-473642722245 : Rat) / 90066973034) [(6, 1), (16, 1)],
  term ((-1957038669999 : Rat) / 90066973034) [(6, 2)],
  term ((2202598655208 : Rat) / 45033486517) [(6, 2), (14, 1)],
  term ((-491119970418 : Rat) / 45033486517) [(6, 2), (14, 2)],
  term ((248815814202 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)],
  term ((-77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((118617857244 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((-237235714488 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-497631628404 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 600 through 699. -/
theorem ep_Q2_054_block_27_0600_0699_valid :
    checkProductSumEq ep_Q2_054_partials_27_0600_0699
      ep_Q2_054_block_27_0600_0699 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
