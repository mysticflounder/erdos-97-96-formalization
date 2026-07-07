/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:1600-1699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_1600_1699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1600 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1600 : Poly :=
[
  term ((-396 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1600 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1600 : Poly :=
[
  term ((-792 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((396 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1600 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1600_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1600
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1600 := by
  native_decide

/-- Coefficient term 1601 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1601 : Poly :=
[
  term ((132 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1601 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1601 : Poly :=
[
  term ((264 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1601 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1601_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1601
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1601 := by
  native_decide

/-- Coefficient term 1602 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1602 : Poly :=
[
  term ((264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1602 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1602 : Poly :=
[
  term ((528 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1602 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1602_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1602
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1602 := by
  native_decide

/-- Coefficient term 1603 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1603 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (9, 1), (10, 2)]
]

/-- Partial product 1603 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1603 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2)],
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1603 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1603_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1603
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1603 := by
  native_decide

/-- Coefficient term 1604 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1604 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (14, 1)]
]

/-- Partial product 1604 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1604 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1)],
  term ((288 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1604 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1604_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1604
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1604 := by
  native_decide

/-- Coefficient term 1605 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1605 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 1605 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1605 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1605 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1605_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1605
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1605 := by
  native_decide

/-- Coefficient term 1606 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1606 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 1606 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1606 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1606 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1606_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1606
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1606 := by
  native_decide

/-- Coefficient term 1607 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1607 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1607 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1607 : Poly :=
[
  term ((-2304 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((1152 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1607 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1607_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1607
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1607 := by
  native_decide

/-- Coefficient term 1608 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1608 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1608 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1608 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1608 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1608_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1608
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1608 := by
  native_decide

/-- Coefficient term 1609 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1609 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1609 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1609 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1609 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1609_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1609
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1609 := by
  native_decide

/-- Coefficient term 1610 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1610 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1610 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1610 : Poly :=
[
  term ((768 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1610 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1610_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1610
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1610 := by
  native_decide

/-- Coefficient term 1611 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1611 : Poly :=
[
  term ((324 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1611 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1611 : Poly :=
[
  term ((648 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-324 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1611 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1611_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1611
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1611 := by
  native_decide

/-- Coefficient term 1612 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1612 : Poly :=
[
  term ((-36 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1612 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1612 : Poly :=
[
  term ((-72 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1612 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1612_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1612
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1612 := by
  native_decide

/-- Coefficient term 1613 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1613 : Poly :=
[
  term ((-3605088 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1613 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1613 : Poly :=
[
  term ((-7210176 : Rat) / 10675) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((3605088 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1613 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1613_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1613
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1613 := by
  native_decide

/-- Coefficient term 1614 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1614 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1614 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1614 : Poly :=
[
  term ((1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1614 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1614_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1614
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1614 := by
  native_decide

/-- Coefficient term 1615 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1615 : Poly :=
[
  term ((-192 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1615 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1615 : Poly :=
[
  term ((-384 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1615 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1615_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1615
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1615 := by
  native_decide

/-- Coefficient term 1616 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1616 : Poly :=
[
  term ((3936 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1616 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1616 : Poly :=
[
  term ((7872 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3936 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1616 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1616_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1616
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1616 := by
  native_decide

/-- Coefficient term 1617 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1617 : Poly :=
[
  term ((-176 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1617 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1617 : Poly :=
[
  term ((-352 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((176 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1617 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1617_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1617
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1617 := by
  native_decide

/-- Coefficient term 1618 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1618 : Poly :=
[
  term ((48 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1618 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1618 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1618 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1618_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1618
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1618 := by
  native_decide

/-- Coefficient term 1619 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1619 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 1), (9, 1), (11, 2)]
]

/-- Partial product 1619 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1619 : Poly :=
[
  term ((-5184 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2)],
  term ((2592 : Rat) / 35) [(3, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1619 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1619_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1619
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1619 := by
  native_decide

/-- Coefficient term 1620 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1620 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1)]
]

/-- Partial product 1620 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1620 : Poly :=
[
  term ((-5184 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1)],
  term ((2592 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1620 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1620_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1620
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1620 := by
  native_decide

/-- Coefficient term 1621 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1621 : Poly :=
[
  term ((-1296 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 1621 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1621 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((1296 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1621 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1621_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1621
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1621 := by
  native_decide

/-- Coefficient term 1622 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1622 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1622 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1622 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1622 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1622_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1622
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1622 := by
  native_decide

/-- Coefficient term 1623 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1623 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1623 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1623 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1623 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1623_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1623
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1623 := by
  native_decide

/-- Coefficient term 1624 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1624 : Poly :=
[
  term ((-1296 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 1624 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1624 : Poly :=
[
  term ((-2592 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (14, 1)],
  term ((1296 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1624 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1624_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1624
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1624 := by
  native_decide

/-- Coefficient term 1625 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1625 : Poly :=
[
  term ((432 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1625 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1625 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1625 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1625_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1625
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1625 := by
  native_decide

/-- Coefficient term 1626 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1626 : Poly :=
[
  term ((864 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1626 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1626 : Poly :=
[
  term ((1728 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1626 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1626_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1626
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1626 := by
  native_decide

/-- Coefficient term 1627 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1627 : Poly :=
[
  term ((-612 : Rat) / 35) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 1627 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1627 : Poly :=
[
  term ((-1224 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((612 : Rat) / 35) [(3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1627 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1627_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1627
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1627 := by
  native_decide

/-- Coefficient term 1628 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1628 : Poly :=
[
  term ((-513 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1628 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1628 : Poly :=
[
  term ((-1026 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((513 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1628 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1628_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1628
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1628 := by
  native_decide

/-- Coefficient term 1629 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1629 : Poly :=
[
  term ((81 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1629 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1629 : Poly :=
[
  term ((162 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1629 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1629_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1629
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1629 := by
  native_decide

/-- Coefficient term 1630 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1630 : Poly :=
[
  term ((-348 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1630 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1630 : Poly :=
[
  term ((-696 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((348 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1630 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1630_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1630
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1630 := by
  native_decide

/-- Coefficient term 1631 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1631 : Poly :=
[
  term ((12 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1631 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1631 : Poly :=
[
  term ((24 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1631 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1631_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1631
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1631 := by
  native_decide

/-- Coefficient term 1632 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1632 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1632 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1632 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1632 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1632_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1632
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1632 := by
  native_decide

/-- Coefficient term 1633 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1633 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 1), (9, 1), (12, 2)]
]

/-- Partial product 1633 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1633 : Poly :=
[
  term ((-3456 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2)],
  term ((1728 : Rat) / 35) [(3, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1633 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1633_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1633
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1633 := by
  native_decide

/-- Coefficient term 1634 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1634 : Poly :=
[
  term ((-864 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 1634 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1634 : Poly :=
[
  term ((-1728 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1)],
  term ((864 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1634 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1634_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1634
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1634 := by
  native_decide

/-- Coefficient term 1635 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1635 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1635 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1635 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1635 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1635_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1635
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1635 := by
  native_decide

/-- Coefficient term 1636 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1636 : Poly :=
[
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 1636 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1636 : Poly :=
[
  term ((1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1636 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1636_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1636
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1636 := by
  native_decide

/-- Coefficient term 1637 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1637 : Poly :=
[
  term ((-1971 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1637 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1637 : Poly :=
[
  term ((-1971 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((1971 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1637 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1637_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1637
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1637 := by
  native_decide

/-- Coefficient term 1638 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1638 : Poly :=
[
  term ((291 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1638 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1638 : Poly :=
[
  term ((291 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-291 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1638 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1638_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1638
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1638 := by
  native_decide

/-- Coefficient term 1639 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1639 : Poly :=
[
  term ((1612 : Rat) / 35) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 1639 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1639 : Poly :=
[
  term ((3224 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (14, 1)],
  term ((-1612 : Rat) / 35) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1639 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1639_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1639
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1639 := by
  native_decide

/-- Coefficient term 1640 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1640 : Poly :=
[
  term ((-108 : Rat) / 35) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1640 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1640 : Poly :=
[
  term ((-216 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((108 : Rat) / 35) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1640 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1640_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1640
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1640 := by
  native_decide

/-- Coefficient term 1641 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1641 : Poly :=
[
  term ((-4 : Rat) / 7) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 1641 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1641 : Poly :=
[
  term ((-8 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((4 : Rat) / 7) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1641 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1641_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1641
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1641 := by
  native_decide

/-- Coefficient term 1642 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1642 : Poly :=
[
  term ((13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1)]
]

/-- Partial product 1642 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1642 : Poly :=
[
  term ((27648 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1)],
  term ((-13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1642 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1642_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1642
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1642 := by
  native_decide

/-- Coefficient term 1643 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1643 : Poly :=
[
  term ((13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1)]
]

/-- Partial product 1643 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1643 : Poly :=
[
  term ((27648 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1)],
  term ((-13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1643 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1643_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1643
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1643 := by
  native_decide

/-- Coefficient term 1644 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1644 : Poly :=
[
  term ((6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1644 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1644 : Poly :=
[
  term ((13824 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((-6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1644 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1644_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1644
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1644 := by
  native_decide

/-- Coefficient term 1645 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1645 : Poly :=
[
  term ((-2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1645 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1645 : Poly :=
[
  term ((-4608 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1645 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1645_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1645
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1645 := by
  native_decide

/-- Coefficient term 1646 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1646 : Poly :=
[
  term ((-4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1646 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1646 : Poly :=
[
  term ((-9216 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1646 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1646_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1646
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1646 := by
  native_decide

/-- Coefficient term 1647 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1647 : Poly :=
[
  term ((6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (14, 1)]
]

/-- Partial product 1647 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1647 : Poly :=
[
  term ((13824 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (14, 1)],
  term ((-6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1647 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1647_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1647
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1647 := by
  native_decide

/-- Coefficient term 1648 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1648 : Poly :=
[
  term ((-2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1648 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1648 : Poly :=
[
  term ((-4608 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1648 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1648_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1648
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1648 := by
  native_decide

/-- Coefficient term 1649 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1649 : Poly :=
[
  term ((-4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1649 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1649 : Poly :=
[
  term ((-9216 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1649 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1649_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1649
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1649 := by
  native_decide

/-- Coefficient term 1650 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1650 : Poly :=
[
  term (189 : Rat) [(3, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 1650 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1650 : Poly :=
[
  term (378 : Rat) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term (-189 : Rat) [(3, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1650 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1650_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1650
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1650 := by
  native_decide

/-- Coefficient term 1651 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1651 : Poly :=
[
  term ((-129 : Rat) / 5) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1651 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1651 : Poly :=
[
  term ((-258 : Rat) / 5) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((129 : Rat) / 5) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1651 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1651_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1651
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1651 := by
  native_decide

/-- Coefficient term 1652 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1652 : Poly :=
[
  term (189 : Rat) [(3, 1), (9, 2), (15, 1)]
]

/-- Partial product 1652 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1652 : Poly :=
[
  term (378 : Rat) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term (-189 : Rat) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1652 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1652_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1652
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1652 := by
  native_decide

/-- Coefficient term 1653 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1653 : Poly :=
[
  term ((-129 : Rat) / 5) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1653 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1653 : Poly :=
[
  term ((-258 : Rat) / 5) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((129 : Rat) / 5) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1653 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1653_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1653
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1653 := by
  native_decide

/-- Coefficient term 1654 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1654 : Poly :=
[
  term ((-576 : Rat) / 7) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 1654 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1654 : Poly :=
[
  term ((-1152 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((576 : Rat) / 7) [(3, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1654 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1654_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1654
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1654 := by
  native_decide

/-- Coefficient term 1655 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1655 : Poly :=
[
  term ((288 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1655 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1655 : Poly :=
[
  term ((576 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-288 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1655 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1655_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1655
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1655 := by
  native_decide

/-- Coefficient term 1656 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1656 : Poly :=
[
  term ((144 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1656 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1656 : Poly :=
[
  term ((288 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1656 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1656_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1656
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1656 := by
  native_decide

/-- Coefficient term 1657 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1657 : Poly :=
[
  term ((-48 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1657 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1657 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1657 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1657_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1657
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1657 := by
  native_decide

/-- Coefficient term 1658 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1658 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1658 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1658 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((96 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1658 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1658_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1658
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1658 := by
  native_decide

/-- Coefficient term 1659 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1659 : Poly :=
[
  term ((-288 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1659 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1659 : Poly :=
[
  term ((-576 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((288 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1659 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1659_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1659
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1659 := by
  native_decide

/-- Coefficient term 1660 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1660 : Poly :=
[
  term ((96 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1660 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1660 : Poly :=
[
  term ((192 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1660 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1660_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1660
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1660 := by
  native_decide

/-- Coefficient term 1661 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1661 : Poly :=
[
  term ((192 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1661 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1661 : Poly :=
[
  term ((384 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1661 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1661_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1661
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1661 := by
  native_decide

/-- Coefficient term 1662 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1662 : Poly :=
[
  term ((81 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1662 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1662 : Poly :=
[
  term ((162 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-81 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1662 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1662_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1662
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1662 := by
  native_decide

/-- Coefficient term 1663 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1663 : Poly :=
[
  term ((-9 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1663 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1663 : Poly :=
[
  term ((-18 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1663 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1663_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1663
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1663 := by
  native_decide

/-- Coefficient term 1664 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1664 : Poly :=
[
  term ((792 : Rat) / 35) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 1664 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1664 : Poly :=
[
  term ((1584 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-792 : Rat) / 35) [(3, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1664 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1664_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1664
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1664 := by
  native_decide

/-- Coefficient term 1665 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1665 : Poly :=
[
  term ((396 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1665 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1665 : Poly :=
[
  term ((792 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-396 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1665 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1665_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1665
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1665 := by
  native_decide

/-- Coefficient term 1666 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1666 : Poly :=
[
  term ((-132 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1666 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1666 : Poly :=
[
  term ((-264 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((132 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1666 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1666_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1666
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1666 := by
  native_decide

/-- Coefficient term 1667 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1667 : Poly :=
[
  term ((-264 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1667 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1667 : Poly :=
[
  term ((-528 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((264 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1667 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1667_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1667
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1667 := by
  native_decide

/-- Coefficient term 1668 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1668 : Poly :=
[
  term ((-1539 : Rat) / 20) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 1668 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1668 : Poly :=
[
  term ((-1539 : Rat) / 10) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1539 : Rat) / 20) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1668 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1668_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1668
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1668 := by
  native_decide

/-- Coefficient term 1669 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1669 : Poly :=
[
  term ((171 : Rat) / 20) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1669 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1669 : Poly :=
[
  term ((171 : Rat) / 10) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-171 : Rat) / 20) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1669 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1669_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1669
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1669 := by
  native_decide

/-- Coefficient term 1670 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1670 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 1), (10, 2), (13, 1)]
]

/-- Partial product 1670 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1670 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((144 : Rat) / 35) [(3, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1670 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1670_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1670
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1670 := by
  native_decide

/-- Coefficient term 1671 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1671 : Poly :=
[
  term ((-72 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 1671 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1671 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((72 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1671 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1671_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1671
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1671 := by
  native_decide

/-- Coefficient term 1672 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1672 : Poly :=
[
  term ((24 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1672 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1672 : Poly :=
[
  term ((48 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1672 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1672_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1672
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1672 := by
  native_decide

/-- Coefficient term 1673 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1673 : Poly :=
[
  term ((48 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 1673 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1673 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-48 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1673 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1673_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1673
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1673 := by
  native_decide

/-- Coefficient term 1674 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1674 : Poly :=
[
  term ((-612 : Rat) / 5) [(3, 1), (11, 1)]
]

/-- Partial product 1674 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1674 : Poly :=
[
  term ((-1224 : Rat) / 5) [(3, 1), (8, 1), (11, 1)],
  term ((612 : Rat) / 5) [(3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1674 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1674_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1674
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1674 := by
  native_decide

/-- Coefficient term 1675 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1675 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 1675 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1675 : Poly :=
[
  term ((-1152 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((576 : Rat) / 35) [(3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1675 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1675_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1675
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1675 := by
  native_decide

/-- Coefficient term 1676 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1676 : Poly :=
[
  term ((1222 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1676 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1676 : Poly :=
[
  term ((2444 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1222 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1676 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1676_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1676
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1676 := by
  native_decide

/-- Coefficient term 1677 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1677 : Poly :=
[
  term ((-30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1677 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1677 : Poly :=
[
  term ((-60 : Rat) / 7) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1677 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1677_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1677
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1677 := by
  native_decide

/-- Coefficient term 1678 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1678 : Poly :=
[
  term ((572784 : Rat) / 10675) [(3, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1678 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1678 : Poly :=
[
  term ((1145568 : Rat) / 10675) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-572784 : Rat) / 10675) [(3, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1678 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1678_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1678
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1678 := by
  native_decide

/-- Coefficient term 1679 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1679 : Poly :=
[
  term ((-2304 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1679 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1679 : Poly :=
[
  term ((-4608 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((2304 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1679 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1679_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1679
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1679 := by
  native_decide

/-- Coefficient term 1680 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1680 : Poly :=
[
  term ((768 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1680 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1680 : Poly :=
[
  term ((1536 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-768 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1680 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1680_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1680
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1680 := by
  native_decide

/-- Coefficient term 1681 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1681 : Poly :=
[
  term ((-624 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1681 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1681 : Poly :=
[
  term ((-1248 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((624 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1681 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1681_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1681
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1681 := by
  native_decide

/-- Coefficient term 1682 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1682 : Poly :=
[
  term ((-288 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1682 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1682 : Poly :=
[
  term ((-576 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((288 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1682 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1682_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1682
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1682 := by
  native_decide

/-- Coefficient term 1683 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1683 : Poly :=
[
  term ((96 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1683 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1683 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1683 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1683_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1683
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1683 := by
  native_decide

/-- Coefficient term 1684 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1684 : Poly :=
[
  term ((192 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1684 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1684 : Poly :=
[
  term ((384 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1684 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1684_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1684
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1684 := by
  native_decide

/-- Coefficient term 1685 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1685 : Poly :=
[
  term ((6336 : Rat) / 35) [(3, 1), (11, 1), (12, 2)]
]

/-- Partial product 1685 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1685 : Poly :=
[
  term ((12672 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((-6336 : Rat) / 35) [(3, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1685 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1685_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1685
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1685 := by
  native_decide

/-- Coefficient term 1686 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1686 : Poly :=
[
  term ((3168 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

/-- Partial product 1686 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1686 : Poly :=
[
  term ((6336 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-3168 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1686 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1686_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1686
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1686 := by
  native_decide

/-- Coefficient term 1687 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1687 : Poly :=
[
  term ((-1056 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1687 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1687 : Poly :=
[
  term ((-2112 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1056 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1687 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1687_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1687
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1687 := by
  native_decide

/-- Coefficient term 1688 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1688 : Poly :=
[
  term ((-2112 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1688 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1688 : Poly :=
[
  term ((-4224 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((2112 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1688 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1688_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1688
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1688 := by
  native_decide

/-- Coefficient term 1689 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1689 : Poly :=
[
  term ((-1046 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1689 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1689 : Poly :=
[
  term ((-2092 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1046 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1689 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1689_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1689
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1689 := by
  native_decide

/-- Coefficient term 1690 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1690 : Poly :=
[
  term ((102 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1690 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1690 : Poly :=
[
  term ((204 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-102 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1690 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1690_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1690
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1690 := by
  native_decide

/-- Coefficient term 1691 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1691 : Poly :=
[
  term ((748464 : Rat) / 10675) [(3, 1), (11, 1), (13, 2)]
]

/-- Partial product 1691 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1691 : Poly :=
[
  term ((1496928 : Rat) / 10675) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((-748464 : Rat) / 10675) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1691 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1691_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1691
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1691 := by
  native_decide

/-- Coefficient term 1692 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1692 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1692 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1692 : Poly :=
[
  term ((-576 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((288 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1692 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1692_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1692
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1692 := by
  native_decide

/-- Coefficient term 1693 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1693 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1693 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1693 : Poly :=
[
  term ((192 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1693 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1693_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1693
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1693 := by
  native_decide

/-- Coefficient term 1694 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1694 : Poly :=
[
  term ((-816 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1694 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1694 : Poly :=
[
  term ((-1632 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((816 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1694 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1694_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1694
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1694 := by
  native_decide

/-- Coefficient term 1695 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1695 : Poly :=
[
  term ((-306 : Rat) / 5) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 1695 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1695 : Poly :=
[
  term ((-612 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((306 : Rat) / 5) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1695 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1695_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1695
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1695 := by
  native_decide

/-- Coefficient term 1696 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1696 : Poly :=
[
  term ((102 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1696 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1696 : Poly :=
[
  term ((204 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-102 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1696 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1696_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1696
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1696 := by
  native_decide

/-- Coefficient term 1697 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1697 : Poly :=
[
  term ((204 : Rat) / 5) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1697 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1697 : Poly :=
[
  term ((408 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-204 : Rat) / 5) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1697 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1697_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1697
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1697 := by
  native_decide

/-- Coefficient term 1698 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1698 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

/-- Partial product 1698 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1698 : Poly :=
[
  term ((288 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1698 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1698_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1698
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1698 := by
  native_decide

/-- Coefficient term 1699 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_1699 : Poly :=
[
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 1699 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_1699 : Poly :=
[
  term ((144 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1699 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_1699_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_1699
        rs_R003_ueqv_R003YY_generator_19_1600_1699 =
      rs_R003_ueqv_R003YY_partial_19_1699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_1600_1699 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_1600,
  rs_R003_ueqv_R003YY_partial_19_1601,
  rs_R003_ueqv_R003YY_partial_19_1602,
  rs_R003_ueqv_R003YY_partial_19_1603,
  rs_R003_ueqv_R003YY_partial_19_1604,
  rs_R003_ueqv_R003YY_partial_19_1605,
  rs_R003_ueqv_R003YY_partial_19_1606,
  rs_R003_ueqv_R003YY_partial_19_1607,
  rs_R003_ueqv_R003YY_partial_19_1608,
  rs_R003_ueqv_R003YY_partial_19_1609,
  rs_R003_ueqv_R003YY_partial_19_1610,
  rs_R003_ueqv_R003YY_partial_19_1611,
  rs_R003_ueqv_R003YY_partial_19_1612,
  rs_R003_ueqv_R003YY_partial_19_1613,
  rs_R003_ueqv_R003YY_partial_19_1614,
  rs_R003_ueqv_R003YY_partial_19_1615,
  rs_R003_ueqv_R003YY_partial_19_1616,
  rs_R003_ueqv_R003YY_partial_19_1617,
  rs_R003_ueqv_R003YY_partial_19_1618,
  rs_R003_ueqv_R003YY_partial_19_1619,
  rs_R003_ueqv_R003YY_partial_19_1620,
  rs_R003_ueqv_R003YY_partial_19_1621,
  rs_R003_ueqv_R003YY_partial_19_1622,
  rs_R003_ueqv_R003YY_partial_19_1623,
  rs_R003_ueqv_R003YY_partial_19_1624,
  rs_R003_ueqv_R003YY_partial_19_1625,
  rs_R003_ueqv_R003YY_partial_19_1626,
  rs_R003_ueqv_R003YY_partial_19_1627,
  rs_R003_ueqv_R003YY_partial_19_1628,
  rs_R003_ueqv_R003YY_partial_19_1629,
  rs_R003_ueqv_R003YY_partial_19_1630,
  rs_R003_ueqv_R003YY_partial_19_1631,
  rs_R003_ueqv_R003YY_partial_19_1632,
  rs_R003_ueqv_R003YY_partial_19_1633,
  rs_R003_ueqv_R003YY_partial_19_1634,
  rs_R003_ueqv_R003YY_partial_19_1635,
  rs_R003_ueqv_R003YY_partial_19_1636,
  rs_R003_ueqv_R003YY_partial_19_1637,
  rs_R003_ueqv_R003YY_partial_19_1638,
  rs_R003_ueqv_R003YY_partial_19_1639,
  rs_R003_ueqv_R003YY_partial_19_1640,
  rs_R003_ueqv_R003YY_partial_19_1641,
  rs_R003_ueqv_R003YY_partial_19_1642,
  rs_R003_ueqv_R003YY_partial_19_1643,
  rs_R003_ueqv_R003YY_partial_19_1644,
  rs_R003_ueqv_R003YY_partial_19_1645,
  rs_R003_ueqv_R003YY_partial_19_1646,
  rs_R003_ueqv_R003YY_partial_19_1647,
  rs_R003_ueqv_R003YY_partial_19_1648,
  rs_R003_ueqv_R003YY_partial_19_1649,
  rs_R003_ueqv_R003YY_partial_19_1650,
  rs_R003_ueqv_R003YY_partial_19_1651,
  rs_R003_ueqv_R003YY_partial_19_1652,
  rs_R003_ueqv_R003YY_partial_19_1653,
  rs_R003_ueqv_R003YY_partial_19_1654,
  rs_R003_ueqv_R003YY_partial_19_1655,
  rs_R003_ueqv_R003YY_partial_19_1656,
  rs_R003_ueqv_R003YY_partial_19_1657,
  rs_R003_ueqv_R003YY_partial_19_1658,
  rs_R003_ueqv_R003YY_partial_19_1659,
  rs_R003_ueqv_R003YY_partial_19_1660,
  rs_R003_ueqv_R003YY_partial_19_1661,
  rs_R003_ueqv_R003YY_partial_19_1662,
  rs_R003_ueqv_R003YY_partial_19_1663,
  rs_R003_ueqv_R003YY_partial_19_1664,
  rs_R003_ueqv_R003YY_partial_19_1665,
  rs_R003_ueqv_R003YY_partial_19_1666,
  rs_R003_ueqv_R003YY_partial_19_1667,
  rs_R003_ueqv_R003YY_partial_19_1668,
  rs_R003_ueqv_R003YY_partial_19_1669,
  rs_R003_ueqv_R003YY_partial_19_1670,
  rs_R003_ueqv_R003YY_partial_19_1671,
  rs_R003_ueqv_R003YY_partial_19_1672,
  rs_R003_ueqv_R003YY_partial_19_1673,
  rs_R003_ueqv_R003YY_partial_19_1674,
  rs_R003_ueqv_R003YY_partial_19_1675,
  rs_R003_ueqv_R003YY_partial_19_1676,
  rs_R003_ueqv_R003YY_partial_19_1677,
  rs_R003_ueqv_R003YY_partial_19_1678,
  rs_R003_ueqv_R003YY_partial_19_1679,
  rs_R003_ueqv_R003YY_partial_19_1680,
  rs_R003_ueqv_R003YY_partial_19_1681,
  rs_R003_ueqv_R003YY_partial_19_1682,
  rs_R003_ueqv_R003YY_partial_19_1683,
  rs_R003_ueqv_R003YY_partial_19_1684,
  rs_R003_ueqv_R003YY_partial_19_1685,
  rs_R003_ueqv_R003YY_partial_19_1686,
  rs_R003_ueqv_R003YY_partial_19_1687,
  rs_R003_ueqv_R003YY_partial_19_1688,
  rs_R003_ueqv_R003YY_partial_19_1689,
  rs_R003_ueqv_R003YY_partial_19_1690,
  rs_R003_ueqv_R003YY_partial_19_1691,
  rs_R003_ueqv_R003YY_partial_19_1692,
  rs_R003_ueqv_R003YY_partial_19_1693,
  rs_R003_ueqv_R003YY_partial_19_1694,
  rs_R003_ueqv_R003YY_partial_19_1695,
  rs_R003_ueqv_R003YY_partial_19_1696,
  rs_R003_ueqv_R003YY_partial_19_1697,
  rs_R003_ueqv_R003YY_partial_19_1698,
  rs_R003_ueqv_R003YY_partial_19_1699
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_1600_1699 : Poly :=
[
  term ((-792 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((264 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((528 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2)],
  term ((-576 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1)],
  term ((192 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-2304 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((768 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((648 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7210176 : Rat) / 10675) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7872 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-352 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((96 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2)],
  term ((-5184 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1)],
  term ((-2592 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((864 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2592 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (14, 1)],
  term ((864 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1224 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-1026 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((162 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-696 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3456 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2)],
  term ((-1728 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1)],
  term ((576 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-1971 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((291 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3224 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (14, 1)],
  term ((-216 : Rat) / 35) [(3, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((27648 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1)],
  term ((27648 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1)],
  term ((13824 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9216 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((13824 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-9216 : Rat) / 35) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term (378 : Rat) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term ((-258 : Rat) / 5) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term (378 : Rat) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((-258 : Rat) / 5) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1)],
  term ((576 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((288 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-576 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((192 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 7) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((162 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1584 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((792 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-528 : Rat) / 35) [(3, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1539 : Rat) / 10) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((171 : Rat) / 10) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((48 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 35) [(3, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1224 : Rat) / 5) [(3, 1), (8, 1), (11, 1)],
  term ((-1152 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1)],
  term ((2444 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1145568 : Rat) / 10675) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((-4608 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((1536 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((192 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((12672 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((6336 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-2112 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4224 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2092 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((204 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1496928 : Rat) / 10675) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((-576 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((192 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1632 : Rat) / 35) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-612 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((204 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((408 : Rat) / 5) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((288 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((144 : Rat) / 35) [(3, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((396 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-132 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-264 : Rat) / 35) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (10, 2)],
  term ((288 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (9, 1), (10, 2), (16, 1)],
  term ((1152 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((576 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-324 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((36 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3605088 : Rat) / 10675) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-576 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3936 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((176 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-48 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2592 : Rat) / 35) [(3, 1), (9, 1), (11, 2)],
  term ((2592 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1)],
  term ((1296 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((1296 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((-432 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-864 : Rat) / 35) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((612 : Rat) / 35) [(3, 1), (9, 1), (12, 1)],
  term ((513 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-81 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((348 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((1728 : Rat) / 35) [(3, 1), (9, 1), (12, 2)],
  term ((864 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((1971 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-291 : Rat) / 10) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1612 : Rat) / 35) [(3, 1), (9, 1), (14, 1)],
  term ((108 : Rat) / 35) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 7) [(3, 1), (9, 1), (16, 1)],
  term ((-13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1)],
  term ((-13824 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1)],
  term ((-6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-6912 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((4608 : Rat) / 35) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term (-189 : Rat) [(3, 1), (9, 2), (12, 1), (15, 1)],
  term ((129 : Rat) / 5) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term (-189 : Rat) [(3, 1), (9, 2), (15, 1)],
  term ((129 : Rat) / 5) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 7) [(3, 1), (10, 1), (11, 1)],
  term ((-288 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((288 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-81 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((9 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-792 : Rat) / 35) [(3, 1), (10, 1), (13, 1)],
  term ((-396 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((132 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((264 : Rat) / 35) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((1539 : Rat) / 20) [(3, 1), (10, 1), (15, 1)],
  term ((-171 : Rat) / 20) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (10, 2), (13, 1)],
  term ((72 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((-24 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 35) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((612 : Rat) / 5) [(3, 1), (11, 1)],
  term ((576 : Rat) / 35) [(3, 1), (11, 1), (12, 1)],
  term ((-1222 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-572784 : Rat) / 10675) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((2304 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-768 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((624 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6336 : Rat) / 35) [(3, 1), (11, 1), (12, 2)],
  term ((-3168 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((1056 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((2112 : Rat) / 35) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((1046 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-102 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-748464 : Rat) / 10675) [(3, 1), (11, 1), (13, 2)],
  term ((288 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((816 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((306 : Rat) / 5) [(3, 1), (11, 1), (14, 1)],
  term ((-102 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-204 : Rat) / 5) [(3, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (11, 2), (13, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1600 through 1699. -/
theorem rs_R003_ueqv_R003YY_block_19_1600_1699_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_1600_1699
      rs_R003_ueqv_R003YY_block_19_1600_1699 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
