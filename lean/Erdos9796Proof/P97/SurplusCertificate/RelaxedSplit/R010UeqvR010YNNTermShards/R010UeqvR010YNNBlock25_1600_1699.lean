/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1600-1699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1600_1699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1600 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1600 : Poly :=
[
  term ((-124230507897379004944 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1600 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1600 : Poly :=
[
  term ((-248461015794758009888 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((124230507897379004944 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1600 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1600_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1600
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1600 := by
  native_decide

/-- Coefficient term 1601 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1601 : Poly :=
[
  term ((-132662575126588875166 : Rat) / 808473974185589265) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1601 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1601 : Poly :=
[
  term ((-265325150253177750332 : Rat) / 808473974185589265) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((132662575126588875166 : Rat) / 808473974185589265) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1601 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1601_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1601
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1601 := by
  native_decide

/-- Coefficient term 1602 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1602 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1602 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1602 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1602 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1602_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1602
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1602 := by
  native_decide

/-- Coefficient term 1603 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1603 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1603 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1603 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1603 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1603_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1603
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1603 := by
  native_decide

/-- Coefficient term 1604 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1604 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1604 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1604 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1604 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1604_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1604
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1604 := by
  native_decide

/-- Coefficient term 1605 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1605 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1605 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1605 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1605 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1605_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1605
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1605 := by
  native_decide

/-- Coefficient term 1606 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1606 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1606 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1606 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1606 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1606_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1606
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1606 := by
  native_decide

/-- Coefficient term 1607 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1607 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1607 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1607 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1607 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1607_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1607
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1607 := by
  native_decide

/-- Coefficient term 1608 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1608 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1608 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1608 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1608 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1608_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1608
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1608 := by
  native_decide

/-- Coefficient term 1609 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1609 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1609 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1609 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1609 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1609_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1609
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1609 := by
  native_decide

/-- Coefficient term 1610 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1610 : Poly :=
[
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1610 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1610 : Poly :=
[
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1610 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1610_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1610
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1610 := by
  native_decide

/-- Coefficient term 1611 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1611 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1611 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1611 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1611 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1611_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1611
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1611 := by
  native_decide

/-- Coefficient term 1612 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1612 : Poly :=
[
  term ((-15230837084825600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 1612 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1612 : Poly :=
[
  term ((-30461674169651200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((15230837084825600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1612 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1612_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1612
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1612 := by
  native_decide

/-- Coefficient term 1613 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1613 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)]
]

/-- Partial product 1613 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1613 : Poly :=
[
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1613 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1613_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1613
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1613 := by
  native_decide

/-- Coefficient term 1614 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1614 : Poly :=
[
  term ((10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1614 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1614 : Poly :=
[
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21872825353523200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1614 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1614_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1614
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1614 := by
  native_decide

/-- Coefficient term 1615 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1615 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1615 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1615 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1615 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1615_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1615
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1615 := by
  native_decide

/-- Coefficient term 1616 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1616 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1616 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1616 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1616 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1616_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1616
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1616 := by
  native_decide

/-- Coefficient term 1617 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1617 : Poly :=
[
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1617 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1617 : Poly :=
[
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1617 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1617_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1617
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1617 := by
  native_decide

/-- Coefficient term 1618 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1618 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1618 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1618 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1618 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1618_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1618
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1618 := by
  native_decide

/-- Coefficient term 1619 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1619 : Poly :=
[
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1619 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1619 : Poly :=
[
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1619 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1619_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1619
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1619 := by
  native_decide

/-- Coefficient term 1620 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1620 : Poly :=
[
  term ((723884033686105600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1620 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1620 : Poly :=
[
  term ((1447768067372211200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-723884033686105600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1620 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1620_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1620
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1620 := by
  native_decide

/-- Coefficient term 1621 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1621 : Poly :=
[
  term ((1878864299123060480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1621 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1621 : Poly :=
[
  term ((3757728598246120960 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1878864299123060480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1621 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1621_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1621
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1621 := by
  native_decide

/-- Coefficient term 1622 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1622 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1622 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1622 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1622 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1622_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1622
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1622 := by
  native_decide

/-- Coefficient term 1623 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1623 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1623 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1623 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1623 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1623_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1623
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1623 := by
  native_decide

/-- Coefficient term 1624 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1624 : Poly :=
[
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 1624 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1624 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1624 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1624_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1624
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1624 := by
  native_decide

/-- Coefficient term 1625 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1625 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1625 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1625 : Poly :=
[
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3158010038986700800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1625 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1625_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1625
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1625 := by
  native_decide

/-- Coefficient term 1626 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1626 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 1626 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1626 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 4), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1626 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1626_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1626
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1626 := by
  native_decide

/-- Coefficient term 1627 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1627 : Poly :=
[
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1627 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1627 : Poly :=
[
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1627 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1627_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1627
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1627 := by
  native_decide

/-- Coefficient term 1628 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1628 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1628 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1628 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1628 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1628_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1628
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1628 := by
  native_decide

/-- Coefficient term 1629 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1629 : Poly :=
[
  term ((151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1629 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1629 : Poly :=
[
  term ((302953210184665600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1629 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1629_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1629
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1629 := by
  native_decide

/-- Coefficient term 1630 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1630 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1630 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1630 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1630 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1630_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1630
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1630 := by
  native_decide

/-- Coefficient term 1631 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1631 : Poly :=
[
  term ((3158010038986700800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1631 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1631 : Poly :=
[
  term ((6316020077973401600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3158010038986700800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1631 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1631_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1631
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1631 := by
  native_decide

/-- Coefficient term 1632 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1632 : Poly :=
[
  term ((-63689728211271680 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1632 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1632 : Poly :=
[
  term ((-127379456422543360 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((63689728211271680 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1632 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1632_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1632
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1632 := by
  native_decide

/-- Coefficient term 1633 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1633 : Poly :=
[
  term ((-416126493947252480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1633 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1633 : Poly :=
[
  term ((-832252987894504960 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((416126493947252480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1633 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1633_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1633
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1633 := by
  native_decide

/-- Coefficient term 1634 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1634 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)]
]

/-- Partial product 1634 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1634 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 4), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1634 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1634_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1634
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1634 := by
  native_decide

/-- Coefficient term 1635 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1635 : Poly :=
[
  term ((41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 1635 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1635 : Poly :=
[
  term ((82681687031910400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1635 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1635_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1635
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1635 := by
  native_decide

/-- Coefficient term 1636 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1636 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1636 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1636 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1636 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1636_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1636
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1636 := by
  native_decide

/-- Coefficient term 1637 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1637 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1637 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1637 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1637 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1637_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1637
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1637 := by
  native_decide

/-- Coefficient term 1638 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1638 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1638 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1638 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1638 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1638_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1638
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1638 := by
  native_decide

/-- Coefficient term 1639 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1639 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1639 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1639 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1639 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1639_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1639
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1639 := by
  native_decide

/-- Coefficient term 1640 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1640 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1640 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1640 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1640 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1640_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1640
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1640 := by
  native_decide

/-- Coefficient term 1641 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1641 : Poly :=
[
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 1641 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1641 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1641 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1641_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1641
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1641 := by
  native_decide

/-- Coefficient term 1642 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1642 : Poly :=
[
  term ((1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1642 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1642 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1642 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1642_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1642
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1642 := by
  native_decide

/-- Coefficient term 1643 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1643 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1643 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1643 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1643 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1643_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1643
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1643 := by
  native_decide

/-- Coefficient term 1644 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1644 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1644 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1644 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1644 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1644_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1644
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1644 := by
  native_decide

/-- Coefficient term 1645 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1645 : Poly :=
[
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1645 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1645 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1645 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1645_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1645
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1645 := by
  native_decide

/-- Coefficient term 1646 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1646 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1646 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1646 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1646 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1646_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1646
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1646 := by
  native_decide

/-- Coefficient term 1647 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1647 : Poly :=
[
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 1647 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1647 : Poly :=
[
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1647 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1647_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1647
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1647 := by
  native_decide

/-- Coefficient term 1648 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1648 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1648 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1648 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1648 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1648_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1648
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1648 := by
  native_decide

/-- Coefficient term 1649 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1649 : Poly :=
[
  term ((-265344293131366400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1649 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1649 : Poly :=
[
  term ((-530688586262732800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((265344293131366400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1649 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1649_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1649
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1649 := by
  native_decide

/-- Coefficient term 1650 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1650 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)]
]

/-- Partial product 1650 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1650 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1650 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1650_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1650
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1650 := by
  native_decide

/-- Coefficient term 1651 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1651 : Poly :=
[
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1651 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1651 : Poly :=
[
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1651 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1651_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1651
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1651 := by
  native_decide

/-- Coefficient term 1652 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1652 : Poly :=
[
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 1652 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1652 : Poly :=
[
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1652 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1652_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1652
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1652 := by
  native_decide

/-- Coefficient term 1653 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1653 : Poly :=
[
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (16, 1)]
]

/-- Partial product 1653 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1653 : Poly :=
[
  term ((-835222202955076424 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1653 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1653_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1653
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1653 := by
  native_decide

/-- Coefficient term 1654 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1654 : Poly :=
[
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1654 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1654 : Poly :=
[
  term ((14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1654 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1654_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1654
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1654 := by
  native_decide

/-- Coefficient term 1655 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1655 : Poly :=
[
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1655 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1655 : Poly :=
[
  term ((4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1655 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1655_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1655
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1655 := by
  native_decide

/-- Coefficient term 1656 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1656 : Poly :=
[
  term ((53792393604992740754 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1656 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1656 : Poly :=
[
  term ((107584787209985481508 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-53792393604992740754 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1656 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1656_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1656
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1656 := by
  native_decide

/-- Coefficient term 1657 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1657 : Poly :=
[
  term ((1623332831137222078 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 1657 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1657 : Poly :=
[
  term ((3246665662274444156 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1623332831137222078 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1657 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1657_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1657
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1657 := by
  native_decide

/-- Coefficient term 1658 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1658 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1658 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1658 : Poly :=
[
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1658 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1658_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1658
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1658 := by
  native_decide

/-- Coefficient term 1659 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1659 : Poly :=
[
  term ((130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 1659 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1659 : Poly :=
[
  term ((261188568908210476 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1659 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1659_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1659
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1659 := by
  native_decide

/-- Coefficient term 1660 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1660 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 1660 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1660 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1660 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1660_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1660
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1660 := by
  native_decide

/-- Coefficient term 1661 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1661 : Poly :=
[
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1661 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1661 : Poly :=
[
  term ((867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1661 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1661_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1661
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1661 := by
  native_decide

/-- Coefficient term 1662 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1662 : Poly :=
[
  term ((867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1662 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1662 : Poly :=
[
  term ((1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1662 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1662_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1662
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1662 := by
  native_decide

/-- Coefficient term 1663 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1663 : Poly :=
[
  term ((3921241726523161600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1663 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1663 : Poly :=
[
  term ((7842483453046323200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3921241726523161600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1663 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1663_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1663
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1663 := by
  native_decide

/-- Coefficient term 1664 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1664 : Poly :=
[
  term ((-7803232813328691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1664 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1664 : Poly :=
[
  term ((-15606465626657382400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7803232813328691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1664 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1664_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1664
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1664 := by
  native_decide

/-- Coefficient term 1665 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1665 : Poly :=
[
  term ((4361182190848000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 1665 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1665 : Poly :=
[
  term ((8722364381696000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-4361182190848000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1665 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1665_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1665
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1665 := by
  native_decide

/-- Coefficient term 1666 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1666 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1666 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1666 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1666 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1666_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1666
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1666 := by
  native_decide

/-- Coefficient term 1667 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1667 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1667 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1667 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1667 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1667_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1667
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1667 := by
  native_decide

/-- Coefficient term 1668 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1668 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1668 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1668 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1668 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1668_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1668
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1668 := by
  native_decide

/-- Coefficient term 1669 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1669 : Poly :=
[
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1669 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1669 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1669 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1669_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1669
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1669 := by
  native_decide

/-- Coefficient term 1670 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1670 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1670 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1670 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1670 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1670_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1670
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1670 := by
  native_decide

/-- Coefficient term 1671 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1671 : Poly :=
[
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1671 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1671 : Poly :=
[
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1671 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1671_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1671
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1671 := by
  native_decide

/-- Coefficient term 1672 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1672 : Poly :=
[
  term ((-2090008942926867200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1672 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1672 : Poly :=
[
  term ((2090008942926867200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4180017885853734400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1672 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1672_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1672
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1672 := by
  native_decide

/-- Coefficient term 1673 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1673 : Poly :=
[
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1673 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1673 : Poly :=
[
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1673 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1673_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1673
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1673 := by
  native_decide

/-- Coefficient term 1674 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1674 : Poly :=
[
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1674 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1674 : Poly :=
[
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1674 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1674_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1674
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1674 := by
  native_decide

/-- Coefficient term 1675 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1675 : Poly :=
[
  term ((265415333396550400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1675 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1675 : Poly :=
[
  term ((530830666793100800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-265415333396550400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1675 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1675_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1675
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1675 := by
  native_decide

/-- Coefficient term 1676 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1676 : Poly :=
[
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1676 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1676 : Poly :=
[
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1676 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1676_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1676
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1676 := by
  native_decide

/-- Coefficient term 1677 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1677 : Poly :=
[
  term ((382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1677 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1677 : Poly :=
[
  term ((764470039512838400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1677 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1677_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1677
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1677 := by
  native_decide

/-- Coefficient term 1678 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1678 : Poly :=
[
  term ((6185761878639817600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1678 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1678 : Poly :=
[
  term ((12371523757279635200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6185761878639817600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1678 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1678_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1678
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1678 := by
  native_decide

/-- Coefficient term 1679 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1679 : Poly :=
[
  term ((452621728938809920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1679 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1679 : Poly :=
[
  term ((905243457877619840 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-452621728938809920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1679 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1679_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1679
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1679 := by
  native_decide

/-- Coefficient term 1680 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1680 : Poly :=
[
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1680 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1680 : Poly :=
[
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1680 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1680_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1680
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1680 := by
  native_decide

/-- Coefficient term 1681 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1681 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1681 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1681 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1681 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1681_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1681
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1681 := by
  native_decide

/-- Coefficient term 1682 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1682 : Poly :=
[
  term ((-16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1682 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1682 : Poly :=
[
  term ((16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-32241855607808000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1682 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1682_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1682
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1682 := by
  native_decide

/-- Coefficient term 1683 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1683 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1683 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1683 : Poly :=
[
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1683 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1683_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1683
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1683 := by
  native_decide

/-- Coefficient term 1684 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1684 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1684 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1684 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1684 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1684_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1684
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1684 := by
  native_decide

/-- Coefficient term 1685 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1685 : Poly :=
[
  term ((3855787120263411200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1685 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1685 : Poly :=
[
  term ((7711574240526822400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3855787120263411200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1685 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1685_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1685
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1685 := by
  native_decide

/-- Coefficient term 1686 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1686 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1686 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1686 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1686 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1686_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1686
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1686 := by
  native_decide

/-- Coefficient term 1687 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1687 : Poly :=
[
  term ((2022571077466419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1687 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1687 : Poly :=
[
  term ((4045142154932838400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2022571077466419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1687 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1687_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1687
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1687 := by
  native_decide

/-- Coefficient term 1688 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1688 : Poly :=
[
  term ((452032496877587427616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1688 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1688 : Poly :=
[
  term ((-452032496877587427616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((904064993755174855232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1688 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1688_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1688
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1688 := by
  native_decide

/-- Coefficient term 1689 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1689 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 1689 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1689 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1689 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1689_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1689
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1689 := by
  native_decide

/-- Coefficient term 1690 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1690 : Poly :=
[
  term ((-484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1690 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1690 : Poly :=
[
  term ((-969198950809275559232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1690 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1690_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1690
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1690 := by
  native_decide

/-- Coefficient term 1691 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1691 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1691 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1691 : Poly :=
[
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1691 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1691_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1691
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1691 := by
  native_decide

/-- Coefficient term 1692 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1692 : Poly :=
[
  term ((-242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1692 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1692 : Poly :=
[
  term ((-484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1692 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1692_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1692
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1692 := by
  native_decide

/-- Coefficient term 1693 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1693 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1693 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1693 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1693 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1693_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1693
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1693 := by
  native_decide

/-- Coefficient term 1694 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1694 : Poly :=
[
  term ((1736905521442685440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1694 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1694 : Poly :=
[
  term ((3473811042885370880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1736905521442685440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1694 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1694_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1694
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1694 := by
  native_decide

/-- Coefficient term 1695 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1695 : Poly :=
[
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1695 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1695 : Poly :=
[
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1695 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1695_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1695
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1695 := by
  native_decide

/-- Coefficient term 1696 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1696 : Poly :=
[
  term ((236378468879218825808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1696 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1696 : Poly :=
[
  term ((472756937758437651616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-236378468879218825808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1696 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1696_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1696
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1696 := by
  native_decide

/-- Coefficient term 1697 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1697 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)]
]

/-- Partial product 1697 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1697 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1697 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1697_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1697
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1697 := by
  native_decide

/-- Coefficient term 1698 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1698 : Poly :=
[
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1698 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1698 : Poly :=
[
  term ((-228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1698 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1698_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1698
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1698 := by
  native_decide

/-- Coefficient term 1699 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1699 : Poly :=
[
  term ((-54549886889308160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1699 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1699 : Poly :=
[
  term ((-109099773778616320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((54549886889308160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1699 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1699_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1699
        rs_R010_ueqv_R010YNN_generator_25_1600_1699 =
      rs_R010_ueqv_R010YNN_partial_25_1699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1600_1699 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1600,
  rs_R010_ueqv_R010YNN_partial_25_1601,
  rs_R010_ueqv_R010YNN_partial_25_1602,
  rs_R010_ueqv_R010YNN_partial_25_1603,
  rs_R010_ueqv_R010YNN_partial_25_1604,
  rs_R010_ueqv_R010YNN_partial_25_1605,
  rs_R010_ueqv_R010YNN_partial_25_1606,
  rs_R010_ueqv_R010YNN_partial_25_1607,
  rs_R010_ueqv_R010YNN_partial_25_1608,
  rs_R010_ueqv_R010YNN_partial_25_1609,
  rs_R010_ueqv_R010YNN_partial_25_1610,
  rs_R010_ueqv_R010YNN_partial_25_1611,
  rs_R010_ueqv_R010YNN_partial_25_1612,
  rs_R010_ueqv_R010YNN_partial_25_1613,
  rs_R010_ueqv_R010YNN_partial_25_1614,
  rs_R010_ueqv_R010YNN_partial_25_1615,
  rs_R010_ueqv_R010YNN_partial_25_1616,
  rs_R010_ueqv_R010YNN_partial_25_1617,
  rs_R010_ueqv_R010YNN_partial_25_1618,
  rs_R010_ueqv_R010YNN_partial_25_1619,
  rs_R010_ueqv_R010YNN_partial_25_1620,
  rs_R010_ueqv_R010YNN_partial_25_1621,
  rs_R010_ueqv_R010YNN_partial_25_1622,
  rs_R010_ueqv_R010YNN_partial_25_1623,
  rs_R010_ueqv_R010YNN_partial_25_1624,
  rs_R010_ueqv_R010YNN_partial_25_1625,
  rs_R010_ueqv_R010YNN_partial_25_1626,
  rs_R010_ueqv_R010YNN_partial_25_1627,
  rs_R010_ueqv_R010YNN_partial_25_1628,
  rs_R010_ueqv_R010YNN_partial_25_1629,
  rs_R010_ueqv_R010YNN_partial_25_1630,
  rs_R010_ueqv_R010YNN_partial_25_1631,
  rs_R010_ueqv_R010YNN_partial_25_1632,
  rs_R010_ueqv_R010YNN_partial_25_1633,
  rs_R010_ueqv_R010YNN_partial_25_1634,
  rs_R010_ueqv_R010YNN_partial_25_1635,
  rs_R010_ueqv_R010YNN_partial_25_1636,
  rs_R010_ueqv_R010YNN_partial_25_1637,
  rs_R010_ueqv_R010YNN_partial_25_1638,
  rs_R010_ueqv_R010YNN_partial_25_1639,
  rs_R010_ueqv_R010YNN_partial_25_1640,
  rs_R010_ueqv_R010YNN_partial_25_1641,
  rs_R010_ueqv_R010YNN_partial_25_1642,
  rs_R010_ueqv_R010YNN_partial_25_1643,
  rs_R010_ueqv_R010YNN_partial_25_1644,
  rs_R010_ueqv_R010YNN_partial_25_1645,
  rs_R010_ueqv_R010YNN_partial_25_1646,
  rs_R010_ueqv_R010YNN_partial_25_1647,
  rs_R010_ueqv_R010YNN_partial_25_1648,
  rs_R010_ueqv_R010YNN_partial_25_1649,
  rs_R010_ueqv_R010YNN_partial_25_1650,
  rs_R010_ueqv_R010YNN_partial_25_1651,
  rs_R010_ueqv_R010YNN_partial_25_1652,
  rs_R010_ueqv_R010YNN_partial_25_1653,
  rs_R010_ueqv_R010YNN_partial_25_1654,
  rs_R010_ueqv_R010YNN_partial_25_1655,
  rs_R010_ueqv_R010YNN_partial_25_1656,
  rs_R010_ueqv_R010YNN_partial_25_1657,
  rs_R010_ueqv_R010YNN_partial_25_1658,
  rs_R010_ueqv_R010YNN_partial_25_1659,
  rs_R010_ueqv_R010YNN_partial_25_1660,
  rs_R010_ueqv_R010YNN_partial_25_1661,
  rs_R010_ueqv_R010YNN_partial_25_1662,
  rs_R010_ueqv_R010YNN_partial_25_1663,
  rs_R010_ueqv_R010YNN_partial_25_1664,
  rs_R010_ueqv_R010YNN_partial_25_1665,
  rs_R010_ueqv_R010YNN_partial_25_1666,
  rs_R010_ueqv_R010YNN_partial_25_1667,
  rs_R010_ueqv_R010YNN_partial_25_1668,
  rs_R010_ueqv_R010YNN_partial_25_1669,
  rs_R010_ueqv_R010YNN_partial_25_1670,
  rs_R010_ueqv_R010YNN_partial_25_1671,
  rs_R010_ueqv_R010YNN_partial_25_1672,
  rs_R010_ueqv_R010YNN_partial_25_1673,
  rs_R010_ueqv_R010YNN_partial_25_1674,
  rs_R010_ueqv_R010YNN_partial_25_1675,
  rs_R010_ueqv_R010YNN_partial_25_1676,
  rs_R010_ueqv_R010YNN_partial_25_1677,
  rs_R010_ueqv_R010YNN_partial_25_1678,
  rs_R010_ueqv_R010YNN_partial_25_1679,
  rs_R010_ueqv_R010YNN_partial_25_1680,
  rs_R010_ueqv_R010YNN_partial_25_1681,
  rs_R010_ueqv_R010YNN_partial_25_1682,
  rs_R010_ueqv_R010YNN_partial_25_1683,
  rs_R010_ueqv_R010YNN_partial_25_1684,
  rs_R010_ueqv_R010YNN_partial_25_1685,
  rs_R010_ueqv_R010YNN_partial_25_1686,
  rs_R010_ueqv_R010YNN_partial_25_1687,
  rs_R010_ueqv_R010YNN_partial_25_1688,
  rs_R010_ueqv_R010YNN_partial_25_1689,
  rs_R010_ueqv_R010YNN_partial_25_1690,
  rs_R010_ueqv_R010YNN_partial_25_1691,
  rs_R010_ueqv_R010YNN_partial_25_1692,
  rs_R010_ueqv_R010YNN_partial_25_1693,
  rs_R010_ueqv_R010YNN_partial_25_1694,
  rs_R010_ueqv_R010YNN_partial_25_1695,
  rs_R010_ueqv_R010YNN_partial_25_1696,
  rs_R010_ueqv_R010YNN_partial_25_1697,
  rs_R010_ueqv_R010YNN_partial_25_1698,
  rs_R010_ueqv_R010YNN_partial_25_1699
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1600_1699 : Poly :=
[
  term ((-248461015794758009888 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-265325150253177750332 : Rat) / 808473974185589265) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((124230507897379004944 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((132662575126588875166 : Rat) / 808473974185589265) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-30461674169651200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((15230837084825600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1447768067372211200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3659300884155266560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21872825353523200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-723884033686105600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1878864299123060480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((302953210184665600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((6316020077973401600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-127379456422543360 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((746752031598845440 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((82681687031910400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-3158010038986700800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 4), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3158010038986700800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((63689728211271680 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((416126493947252480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((-41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2642807167499591680 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 3), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((265344293131366400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-835222202955076424 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((107584787209985481508 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((3246665662274444156 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((261188568908210476 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53792393604992740754 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1623332831137222078 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7842483453046323200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7796224029218867200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3921241726523161600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((7803232813328691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8722364381696000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-4361182190848000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((530830666793100800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((764470039512838400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((12371523757279635200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2995252400804487040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4180017885853734400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-265415333396550400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6185761878639817600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-452621728938809920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7711574240526822400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((4061263082736742400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-32241855607808000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3855787120263411200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2022571077466419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-969198950809275559232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3473811042885370880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((276325878411336320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((904064993755174855232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 4), (16, 1)],
  term ((484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1736905521442685440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-236378468879218825808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)],
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-109099773778616320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((54549886889308160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1600 through 1699. -/
theorem rs_R010_ueqv_R010YNN_block_25_1600_1699_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1600_1699
      rs_R010_ueqv_R010YNN_block_25_1600_1699 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
