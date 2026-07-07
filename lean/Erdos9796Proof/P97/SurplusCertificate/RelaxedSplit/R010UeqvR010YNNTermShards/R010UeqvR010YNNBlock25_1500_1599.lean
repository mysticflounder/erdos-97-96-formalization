/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1500-1599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1500_1599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1500 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1500 : Poly :=
[
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1500 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1500 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1500 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1500_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1500
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1500 := by
  native_decide

/-- Coefficient term 1501 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1501 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1501 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1501 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1501 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1501_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1501
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1501 := by
  native_decide

/-- Coefficient term 1502 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1502 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1502 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1502 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1502 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1502_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1502
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1502 := by
  native_decide

/-- Coefficient term 1503 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1503 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1503 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1503 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1503 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1503_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1503
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1503 := by
  native_decide

/-- Coefficient term 1504 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1504 : Poly :=
[
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 1504 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1504 : Poly :=
[
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1504 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1504_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1504
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1504 := by
  native_decide

/-- Coefficient term 1505 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1505 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 1505 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1505 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1505 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1505_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1505
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1505 := by
  native_decide

/-- Coefficient term 1506 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1506 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1506 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1506 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1506 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1506_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1506
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1506 := by
  native_decide

/-- Coefficient term 1507 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1507 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1507 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1507 : Poly :=
[
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1507 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1507_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1507
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1507 := by
  native_decide

/-- Coefficient term 1508 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1508 : Poly :=
[
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1508 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1508 : Poly :=
[
  term ((76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1508 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1508_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1508
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1508 := by
  native_decide

/-- Coefficient term 1509 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1509 : Poly :=
[
  term ((135832047416087680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1509 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1509 : Poly :=
[
  term ((271664094832175360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-135832047416087680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1509 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1509_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1509
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1509 := by
  native_decide

/-- Coefficient term 1510 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1510 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 1510 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1510 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1510 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1510_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1510
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1510 := by
  native_decide

/-- Coefficient term 1511 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1511 : Poly :=
[
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1511 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1511 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1511 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1511_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1511
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1511 := by
  native_decide

/-- Coefficient term 1512 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1512 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1512 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1512 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1512 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1512_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1512
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1512 := by
  native_decide

/-- Coefficient term 1513 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1513 : Poly :=
[
  term ((-444826893086038304 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1513 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1513 : Poly :=
[
  term ((-889653786172076608 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((444826893086038304 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1513 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1513_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1513
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1513 := by
  native_decide

/-- Coefficient term 1514 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1514 : Poly :=
[
  term ((-166603837426378240 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1514 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1514 : Poly :=
[
  term ((166603837426378240 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333207674852756480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1514 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1514_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1514
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1514 := by
  native_decide

/-- Coefficient term 1515 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1515 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1515 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1515 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1515 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1515_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1515
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1515 := by
  native_decide

/-- Coefficient term 1516 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1516 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1516 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1516 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1516 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1516_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1516
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1516 := by
  native_decide

/-- Coefficient term 1517 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1517 : Poly :=
[
  term ((65213636114081280 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1517 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1517 : Poly :=
[
  term ((130427272228162560 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65213636114081280 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1517 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1517_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1517
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1517 := by
  native_decide

/-- Coefficient term 1518 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1518 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1518 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1518 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1518 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1518_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1518
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1518 := by
  native_decide

/-- Coefficient term 1519 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1519 : Poly :=
[
  term ((11249196381579520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1519 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1519 : Poly :=
[
  term ((22498392763159040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11249196381579520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1519 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1519_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1519
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1519 := by
  native_decide

/-- Coefficient term 1520 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1520 : Poly :=
[
  term ((14285145550824960 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1520 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1520 : Poly :=
[
  term ((28570291101649920 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14285145550824960 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1520 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1520_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1520
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1520 := by
  native_decide

/-- Coefficient term 1521 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1521 : Poly :=
[
  term ((-338686824769018880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1521 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1521 : Poly :=
[
  term ((-677373649538037760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((338686824769018880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1521 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1521_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1521
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1521 := by
  native_decide

/-- Coefficient term 1522 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1522 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1522 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1522 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1522 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1522_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1522
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1522 := by
  native_decide

/-- Coefficient term 1523 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1523 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1523 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1523 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1523 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1523_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1523
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1523 := by
  native_decide

/-- Coefficient term 1524 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1524 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1524 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1524 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1524 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1524_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1524
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1524 := by
  native_decide

/-- Coefficient term 1525 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1525 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1525 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1525 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1525 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1525_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1525
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1525 := by
  native_decide

/-- Coefficient term 1526 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1526 : Poly :=
[
  term ((-51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1526 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1526 : Poly :=
[
  term ((-103353772840192000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1526 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1526_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1526
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1526 := by
  native_decide

/-- Coefficient term 1527 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1527 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1527 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1527 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1527 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1527_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1527
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1527 := by
  native_decide

/-- Coefficient term 1528 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1528 : Poly :=
[
  term ((7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1528 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1528 : Poly :=
[
  term ((15351901638707200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1528 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1528_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1528
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1528 := by
  native_decide

/-- Coefficient term 1529 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1529 : Poly :=
[
  term ((-290200140551145376 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1529 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1529 : Poly :=
[
  term ((290200140551145376 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-580400281102290752 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1529 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1529_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1529
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1529 := by
  native_decide

/-- Coefficient term 1530 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1530 : Poly :=
[
  term ((408625517013146656 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1530 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1530 : Poly :=
[
  term ((817251034026293312 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-408625517013146656 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1530 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1530_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1530
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1530 := by
  native_decide

/-- Coefficient term 1531 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1531 : Poly :=
[
  term ((-52275557161096112 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1531 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1531 : Poly :=
[
  term ((-104551114322192224 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((52275557161096112 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1531 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1531_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1531
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1531 := by
  native_decide

/-- Coefficient term 1532 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1532 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1532 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1532 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1532 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1532_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1532
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1532 := by
  native_decide

/-- Coefficient term 1533 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1533 : Poly :=
[
  term ((-800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1533 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1533 : Poly :=
[
  term ((-1601005635368462092384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1533 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1533_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1533
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1533 := by
  native_decide

/-- Coefficient term 1534 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1534 : Poly :=
[
  term ((-263525446737573968 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1534 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1534 : Poly :=
[
  term ((-527050893475147936 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((263525446737573968 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1534 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1534_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1534
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1534 := by
  native_decide

/-- Coefficient term 1535 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1535 : Poly :=
[
  term ((809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 1535 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1535 : Poly :=
[
  term ((1619594866129718383384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1535 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1535_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1535
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1535 := by
  native_decide

/-- Coefficient term 1536 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1536 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1536 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1536 : Poly :=
[
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1536 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1536_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1536
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1536 := by
  native_decide

/-- Coefficient term 1537 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1537 : Poly :=
[
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1537 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1537 : Poly :=
[
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1537 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1537_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1537
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1537 := by
  native_decide

/-- Coefficient term 1538 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1538 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1538 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1538 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1538 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1538_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1538
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1538 := by
  native_decide

/-- Coefficient term 1539 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1539 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1539 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1539 : Poly :=
[
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1539 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1539_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1539
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1539 := by
  native_decide

/-- Coefficient term 1540 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1540 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1540 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1540 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1540 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1540_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1540
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1540 := by
  native_decide

/-- Coefficient term 1541 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1541 : Poly :=
[
  term ((382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1541 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1541 : Poly :=
[
  term ((765587070475816960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1541 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1541_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1541
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1541 := by
  native_decide

/-- Coefficient term 1542 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1542 : Poly :=
[
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1542 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1542 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1542 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1542_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1542
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1542 := by
  native_decide

/-- Coefficient term 1543 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1543 : Poly :=
[
  term ((-337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1543 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1543 : Poly :=
[
  term ((-674202047966863360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1543 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1543_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1543
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1543 := by
  native_decide

/-- Coefficient term 1544 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1544 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1544 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1544 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1544 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1544_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1544
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1544 := by
  native_decide

/-- Coefficient term 1545 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1545 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1545 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1545 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1545 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1545_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1545
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1545 := by
  native_decide

/-- Coefficient term 1546 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1546 : Poly :=
[
  term ((7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1546 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1546 : Poly :=
[
  term ((14917095082803200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1546 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1546_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1546
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1546 := by
  native_decide

/-- Coefficient term 1547 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1547 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1547 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1547 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1547 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1547_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1547
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1547 := by
  native_decide

/-- Coefficient term 1548 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1548 : Poly :=
[
  term ((-61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 1548 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1548 : Poly :=
[
  term ((-122527696540426240 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1548 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1548_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1548
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1548 := by
  native_decide

/-- Coefficient term 1549 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1549 : Poly :=
[
  term ((-127055728160990720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1549 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1549 : Poly :=
[
  term ((-254111456321981440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((127055728160990720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1549 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1549_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1549
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1549 := by
  native_decide

/-- Coefficient term 1550 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1550 : Poly :=
[
  term ((428561265481538560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1550 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1550 : Poly :=
[
  term ((857122530963077120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-428561265481538560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1550 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1550_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1550
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1550 := by
  native_decide

/-- Coefficient term 1551 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1551 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 1551 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1551 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1551 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1551_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1551
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1551 := by
  native_decide

/-- Coefficient term 1552 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1552 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1552 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1552 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1552 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1552_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1552
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1552 := by
  native_decide

/-- Coefficient term 1553 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1553 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1553 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1553 : Poly :=
[
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1553 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1553_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1553
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1553 := by
  native_decide

/-- Coefficient term 1554 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1554 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1554 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1554 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1554 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1554_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1554
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1554 := by
  native_decide

/-- Coefficient term 1555 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1555 : Poly :=
[
  term ((-260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 1555 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1555 : Poly :=
[
  term ((-520140997537710080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1555 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1555_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1555
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1555 := by
  native_decide

/-- Coefficient term 1556 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1556 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 1556 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1556 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1556 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1556_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1556
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1556 := by
  native_decide

/-- Coefficient term 1557 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1557 : Poly :=
[
  term ((658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 1557 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1557 : Poly :=
[
  term ((1316729599255920640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((-658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1557 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1557_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1557
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1557 := by
  native_decide

/-- Coefficient term 1558 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1558 : Poly :=
[
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1558 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1558 : Poly :=
[
  term ((835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1558 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1558_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1558
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1558 := by
  native_decide

/-- Coefficient term 1559 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1559 : Poly :=
[
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1559 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1559 : Poly :=
[
  term ((-52437743522044628 : Rat) / 5988696105078439) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1559 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1559_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1559
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1559 := by
  native_decide

/-- Coefficient term 1560 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1560 : Poly :=
[
  term ((131094358805111570 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1560 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1560 : Poly :=
[
  term ((262188717610223140 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131094358805111570 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1560 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1560_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1560
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1560 := by
  native_decide

/-- Coefficient term 1561 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1561 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1561 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1561 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1561 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1561_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1561
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1561 := by
  native_decide

/-- Coefficient term 1562 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1562 : Poly :=
[
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1562 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1562 : Poly :=
[
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 5988696105078439) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1562 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1562_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1562
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1562 := by
  native_decide

/-- Coefficient term 1563 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1563 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1563 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1563 : Poly :=
[
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1563 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1563_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1563
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1563 := by
  native_decide

/-- Coefficient term 1564 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1564 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1564 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1564 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1564 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1564_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1564
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1564 := by
  native_decide

/-- Coefficient term 1565 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1565 : Poly :=
[
  term ((7739321328826768448 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1565 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1565 : Poly :=
[
  term ((15478642657653536896 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7739321328826768448 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1565 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1565_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1565
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1565 := by
  native_decide

/-- Coefficient term 1566 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1566 : Poly :=
[
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1566 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1566 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1566 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1566_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1566
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1566 := by
  native_decide

/-- Coefficient term 1567 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1567 : Poly :=
[
  term ((-24283895467172673134 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 1567 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1567 : Poly :=
[
  term ((-48567790934345346268 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((24283895467172673134 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1567 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1567_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1567
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1567 := by
  native_decide

/-- Coefficient term 1568 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1568 : Poly :=
[
  term ((-15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1568 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1568 : Poly :=
[
  term ((-31296572860266695888 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1568 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1568_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1568
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1568 := by
  native_decide

/-- Coefficient term 1569 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1569 : Poly :=
[
  term ((-4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 1569 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1569 : Poly :=
[
  term ((-8357993774441321668 : Rat) / 89830441576176585) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1569 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1569_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1569
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1569 := by
  native_decide

/-- Coefficient term 1570 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1570 : Poly :=
[
  term ((-30598849847127165716 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1570 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1570 : Poly :=
[
  term ((-61197699694254331432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((30598849847127165716 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1570 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1570_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1570
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1570 := by
  native_decide

/-- Coefficient term 1571 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1571 : Poly :=
[
  term ((4469716213418072624 : Rat) / 149717402626960975) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1571 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1571 : Poly :=
[
  term ((8939432426836145248 : Rat) / 149717402626960975) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4469716213418072624 : Rat) / 149717402626960975) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1571 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1571_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1571
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1571 := by
  native_decide

/-- Coefficient term 1572 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1572 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 1572 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1572 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1572 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1572_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1572
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1572 := by
  native_decide

/-- Coefficient term 1573 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1573 : Poly :=
[
  term ((-111640283293145600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1573 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1573 : Poly :=
[
  term ((-223280566586291200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((111640283293145600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1573 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1573_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1573
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1573 := by
  native_decide

/-- Coefficient term 1574 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1574 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1574 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1574 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1574 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1574_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1574
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1574 := by
  native_decide

/-- Coefficient term 1575 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1575 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1575 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1575 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1575 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1575_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1575
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1575 := by
  native_decide

/-- Coefficient term 1576 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1576 : Poly :=
[
  term ((-21450963151278080 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1576 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1576 : Poly :=
[
  term ((-42901926302556160 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((21450963151278080 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1576 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1576_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1576
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1576 := by
  native_decide

/-- Coefficient term 1577 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1577 : Poly :=
[
  term ((69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 1577 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1577 : Poly :=
[
  term ((139253367632691200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1577 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1577_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1577
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1577 := by
  native_decide

/-- Coefficient term 1578 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1578 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 1578 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1578 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1578 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1578_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1578
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1578 := by
  native_decide

/-- Coefficient term 1579 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1579 : Poly :=
[
  term ((-10840247420595315106 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 1579 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1579 : Poly :=
[
  term ((-21680494841190630212 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((10840247420595315106 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1579 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1579_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1579
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1579 := by
  native_decide

/-- Coefficient term 1580 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1580 : Poly :=
[
  term ((941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 1580 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1580 : Poly :=
[
  term ((1882234057367057956 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1580 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1580_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1580
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1580 := by
  native_decide

/-- Coefficient term 1581 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1581 : Poly :=
[
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1581 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1581 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1581 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1581_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1581
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1581 := by
  native_decide

/-- Coefficient term 1582 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1582 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1582 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1582 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1582 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1582_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1582
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1582 := by
  native_decide

/-- Coefficient term 1583 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1583 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1583 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1583 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1583 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1583_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1583
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1583 := by
  native_decide

/-- Coefficient term 1584 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1584 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1584 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1584 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1584 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1584_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1584
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1584 := by
  native_decide

/-- Coefficient term 1585 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1585 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1585 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1585 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1585 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1585_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1585
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1585 := by
  native_decide

/-- Coefficient term 1586 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1586 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1586 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1586 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1586 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1586_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1586
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1586 := by
  native_decide

/-- Coefficient term 1587 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1587 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 1587 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1587 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1587 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1587_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1587
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1587 := by
  native_decide

/-- Coefficient term 1588 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1588 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 1588 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1588 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1588 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1588_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1588
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1588 := by
  native_decide

/-- Coefficient term 1589 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1589 : Poly :=
[
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1589 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1589 : Poly :=
[
  term ((13555823625881600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1589 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1589_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1589
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1589 := by
  native_decide

/-- Coefficient term 1590 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1590 : Poly :=
[
  term ((-31037834640731251236 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1590 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1590 : Poly :=
[
  term ((-62075669281462502472 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((31037834640731251236 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1590 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1590_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1590
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1590 := by
  native_decide

/-- Coefficient term 1591 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1591 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1591 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1591 : Poly :=
[
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1591 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1591_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1591
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1591 := by
  native_decide

/-- Coefficient term 1592 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1592 : Poly :=
[
  term ((-47420822684182796854 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1592 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1592 : Poly :=
[
  term ((-94841645368365593708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((47420822684182796854 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1592 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1592_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1592
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1592 := by
  native_decide

/-- Coefficient term 1593 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1593 : Poly :=
[
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1593 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1593 : Poly :=
[
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1593 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1593_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1593
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1593 := by
  native_decide

/-- Coefficient term 1594 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1594 : Poly :=
[
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1594 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1594 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1594 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1594_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1594
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1594 := by
  native_decide

/-- Coefficient term 1595 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1595 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1595 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1595 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1595 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1595_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1595
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1595 := by
  native_decide

/-- Coefficient term 1596 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1596 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1596 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1596 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1596 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1596_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1596
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1596 := by
  native_decide

/-- Coefficient term 1597 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1597 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1597 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1597 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1597 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1597_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1597
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1597 := by
  native_decide

/-- Coefficient term 1598 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1598 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1598 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1598 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1598 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1598_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1598
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1598 := by
  native_decide

/-- Coefficient term 1599 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1599 : Poly :=
[
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1599 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1599 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1599 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1599_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1599
        rs_R010_ueqv_R010YNN_generator_25_1500_1599 =
      rs_R010_ueqv_R010YNN_partial_25_1599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1500_1599 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1500,
  rs_R010_ueqv_R010YNN_partial_25_1501,
  rs_R010_ueqv_R010YNN_partial_25_1502,
  rs_R010_ueqv_R010YNN_partial_25_1503,
  rs_R010_ueqv_R010YNN_partial_25_1504,
  rs_R010_ueqv_R010YNN_partial_25_1505,
  rs_R010_ueqv_R010YNN_partial_25_1506,
  rs_R010_ueqv_R010YNN_partial_25_1507,
  rs_R010_ueqv_R010YNN_partial_25_1508,
  rs_R010_ueqv_R010YNN_partial_25_1509,
  rs_R010_ueqv_R010YNN_partial_25_1510,
  rs_R010_ueqv_R010YNN_partial_25_1511,
  rs_R010_ueqv_R010YNN_partial_25_1512,
  rs_R010_ueqv_R010YNN_partial_25_1513,
  rs_R010_ueqv_R010YNN_partial_25_1514,
  rs_R010_ueqv_R010YNN_partial_25_1515,
  rs_R010_ueqv_R010YNN_partial_25_1516,
  rs_R010_ueqv_R010YNN_partial_25_1517,
  rs_R010_ueqv_R010YNN_partial_25_1518,
  rs_R010_ueqv_R010YNN_partial_25_1519,
  rs_R010_ueqv_R010YNN_partial_25_1520,
  rs_R010_ueqv_R010YNN_partial_25_1521,
  rs_R010_ueqv_R010YNN_partial_25_1522,
  rs_R010_ueqv_R010YNN_partial_25_1523,
  rs_R010_ueqv_R010YNN_partial_25_1524,
  rs_R010_ueqv_R010YNN_partial_25_1525,
  rs_R010_ueqv_R010YNN_partial_25_1526,
  rs_R010_ueqv_R010YNN_partial_25_1527,
  rs_R010_ueqv_R010YNN_partial_25_1528,
  rs_R010_ueqv_R010YNN_partial_25_1529,
  rs_R010_ueqv_R010YNN_partial_25_1530,
  rs_R010_ueqv_R010YNN_partial_25_1531,
  rs_R010_ueqv_R010YNN_partial_25_1532,
  rs_R010_ueqv_R010YNN_partial_25_1533,
  rs_R010_ueqv_R010YNN_partial_25_1534,
  rs_R010_ueqv_R010YNN_partial_25_1535,
  rs_R010_ueqv_R010YNN_partial_25_1536,
  rs_R010_ueqv_R010YNN_partial_25_1537,
  rs_R010_ueqv_R010YNN_partial_25_1538,
  rs_R010_ueqv_R010YNN_partial_25_1539,
  rs_R010_ueqv_R010YNN_partial_25_1540,
  rs_R010_ueqv_R010YNN_partial_25_1541,
  rs_R010_ueqv_R010YNN_partial_25_1542,
  rs_R010_ueqv_R010YNN_partial_25_1543,
  rs_R010_ueqv_R010YNN_partial_25_1544,
  rs_R010_ueqv_R010YNN_partial_25_1545,
  rs_R010_ueqv_R010YNN_partial_25_1546,
  rs_R010_ueqv_R010YNN_partial_25_1547,
  rs_R010_ueqv_R010YNN_partial_25_1548,
  rs_R010_ueqv_R010YNN_partial_25_1549,
  rs_R010_ueqv_R010YNN_partial_25_1550,
  rs_R010_ueqv_R010YNN_partial_25_1551,
  rs_R010_ueqv_R010YNN_partial_25_1552,
  rs_R010_ueqv_R010YNN_partial_25_1553,
  rs_R010_ueqv_R010YNN_partial_25_1554,
  rs_R010_ueqv_R010YNN_partial_25_1555,
  rs_R010_ueqv_R010YNN_partial_25_1556,
  rs_R010_ueqv_R010YNN_partial_25_1557,
  rs_R010_ueqv_R010YNN_partial_25_1558,
  rs_R010_ueqv_R010YNN_partial_25_1559,
  rs_R010_ueqv_R010YNN_partial_25_1560,
  rs_R010_ueqv_R010YNN_partial_25_1561,
  rs_R010_ueqv_R010YNN_partial_25_1562,
  rs_R010_ueqv_R010YNN_partial_25_1563,
  rs_R010_ueqv_R010YNN_partial_25_1564,
  rs_R010_ueqv_R010YNN_partial_25_1565,
  rs_R010_ueqv_R010YNN_partial_25_1566,
  rs_R010_ueqv_R010YNN_partial_25_1567,
  rs_R010_ueqv_R010YNN_partial_25_1568,
  rs_R010_ueqv_R010YNN_partial_25_1569,
  rs_R010_ueqv_R010YNN_partial_25_1570,
  rs_R010_ueqv_R010YNN_partial_25_1571,
  rs_R010_ueqv_R010YNN_partial_25_1572,
  rs_R010_ueqv_R010YNN_partial_25_1573,
  rs_R010_ueqv_R010YNN_partial_25_1574,
  rs_R010_ueqv_R010YNN_partial_25_1575,
  rs_R010_ueqv_R010YNN_partial_25_1576,
  rs_R010_ueqv_R010YNN_partial_25_1577,
  rs_R010_ueqv_R010YNN_partial_25_1578,
  rs_R010_ueqv_R010YNN_partial_25_1579,
  rs_R010_ueqv_R010YNN_partial_25_1580,
  rs_R010_ueqv_R010YNN_partial_25_1581,
  rs_R010_ueqv_R010YNN_partial_25_1582,
  rs_R010_ueqv_R010YNN_partial_25_1583,
  rs_R010_ueqv_R010YNN_partial_25_1584,
  rs_R010_ueqv_R010YNN_partial_25_1585,
  rs_R010_ueqv_R010YNN_partial_25_1586,
  rs_R010_ueqv_R010YNN_partial_25_1587,
  rs_R010_ueqv_R010YNN_partial_25_1588,
  rs_R010_ueqv_R010YNN_partial_25_1589,
  rs_R010_ueqv_R010YNN_partial_25_1590,
  rs_R010_ueqv_R010YNN_partial_25_1591,
  rs_R010_ueqv_R010YNN_partial_25_1592,
  rs_R010_ueqv_R010YNN_partial_25_1593,
  rs_R010_ueqv_R010YNN_partial_25_1594,
  rs_R010_ueqv_R010YNN_partial_25_1595,
  rs_R010_ueqv_R010YNN_partial_25_1596,
  rs_R010_ueqv_R010YNN_partial_25_1597,
  rs_R010_ueqv_R010YNN_partial_25_1598,
  rs_R010_ueqv_R010YNN_partial_25_1599
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1500_1599 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((271664094832175360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-135832047416087680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-889653786172076608 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((444826893086038304 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((130427272228162560 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((22498392763159040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((28570291101649920 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-177562137258903040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-333207674852756480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65213636114081280 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11249196381579520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-14285145550824960 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((338686824769018880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103353772840192000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((15351901638707200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((51676886420096000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-7675950819353600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((817251034026293312 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-104551114322192224 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1601005635368462092384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1619594866129718383384 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-580400281102290752 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-408625517013146656 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52275557161096112 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((800502817684231046192 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((263525446737573968 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-809797433064859191692 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((765587070475816960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-674202047966863360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-382793535237908480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((337101023983431680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14917095082803200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-122527696540426240 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-254111456321981440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((857122530963077120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7458547541401600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((61263848270213120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((127055728160990720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-428561265481538560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-520140997537710080 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((1316729599255920640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((260070498768855040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((-658364799627960320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 5988696105078439) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((262188717610223140 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-131094358805111570 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15478642657653536896 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-49747640163591350398 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((52437743522044628 : Rat) / 5988696105078439) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7739321328826768448 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((24283895467172673134 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-31296572860266695888 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8357993774441321668 : Rat) / 89830441576176585) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-61197699694254331432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8939432426836145248 : Rat) / 149717402626960975) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((15648286430133347944 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((4178996887220660834 : Rat) / 89830441576176585) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((30598849847127165716 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4469716213418072624 : Rat) / 149717402626960975) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-223280566586291200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((111640283293145600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-42901926302556160 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((21450963151278080 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-21680494841190630212 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1882234057367057956 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((10840247420595315106 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-941117028683528978 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62075669281462502472 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-94841645368365593708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31037834640731251236 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((47420822684182796854 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((377625914378053734832 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1500 through 1599. -/
theorem rs_R010_ueqv_R010YNN_block_25_1500_1599_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1500_1599
      rs_R010_ueqv_R010YNN_block_25_1500_1599 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
