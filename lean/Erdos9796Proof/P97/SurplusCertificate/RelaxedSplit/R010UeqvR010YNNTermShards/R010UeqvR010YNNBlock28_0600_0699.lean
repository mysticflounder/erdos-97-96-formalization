/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 28:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_28_0600_0699 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0600 : Poly :=
[
  term ((65436423727922313604 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 600 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0600 : Poly :=
[
  term ((-130872847455844627208 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((65436423727922313604 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-130872847455844627208 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((65436423727922313604 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0600_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0600
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0601 : Poly :=
[
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 601 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0601 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0601_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0601
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0602 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 602 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0602 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0602_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0602
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0603 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0603 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0603_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0603
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0604 : Poly :=
[
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0604 : Poly :=
[
  term ((13555823625881600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0604_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0604
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0605 : Poly :=
[
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 605 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0605 : Poly :=
[
  term ((8703335477043200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0605_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0605
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0606 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0606 : Poly :=
[
  term ((-6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0606_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0606
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0607 : Poly :=
[
  term ((-16165404656525465618 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 607 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0607 : Poly :=
[
  term ((32330809313050931236 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16165404656525465618 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((32330809313050931236 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16165404656525465618 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0607_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0607
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0608 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0608 : Poly :=
[
  term ((-172980456656537600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0608_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0608
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0609 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 609 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0609 : Poly :=
[
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0609_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0609
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0610 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 610 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0610 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0610_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0610
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0611 : Poly :=
[
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 611 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0611 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0611_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0611
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0612 : Poly :=
[
  term ((92926161388738417708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0612 : Poly :=
[
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((92926161388738417708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((92926161388738417708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0612_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0612
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0613 : Poly :=
[
  term ((-210030507010076783542 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0613 : Poly :=
[
  term ((420061014020153567084 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210030507010076783542 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((420061014020153567084 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-210030507010076783542 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0613_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0613
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0614 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 614 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0614 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0614_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0614
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0615 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0615 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0615_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0615
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0616 : Poly :=
[
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 616 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0616 : Poly :=
[
  term ((252396728834252800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0616_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0616
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0617 : Poly :=
[
  term ((15230837084825600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 617 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0617 : Poly :=
[
  term ((-30461674169651200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((15230837084825600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-30461674169651200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((15230837084825600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0617_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0617
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0618 : Poly :=
[
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 618 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0618 : Poly :=
[
  term ((10936412676761600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10936412676761600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0618_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0618
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0619 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 619 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0619 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0619_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0619
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0620 : Poly :=
[
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 620 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0620 : Poly :=
[
  term ((-5468206338380800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0620_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0620
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0621 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0621 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0621_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0621
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0622 : Poly :=
[
  term ((342001658980683520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0622 : Poly :=
[
  term ((-684003317961367040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((342001658980683520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-684003317961367040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((342001658980683520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0622_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0622
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0623 : Poly :=
[
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 623 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0623 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0623_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0623
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0624 : Poly :=
[
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0624 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0624_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0624
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0625 : Poly :=
[
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0625 : Poly :=
[
  term ((302953210184665600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((302953210184665600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0625_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0625
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0626 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 626 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0626 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0626_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0626
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0627 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0627 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0627_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0627
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0628 : Poly :=
[
  term ((47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 628 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0628 : Poly :=
[
  term ((-95736690247475200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0628_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0628
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0629 : Poly :=
[
  term ((2784634023187278080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 629 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0629 : Poly :=
[
  term ((-5569268046374556160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((2784634023187278080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-5569268046374556160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((2784634023187278080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0629_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0629
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0630 : Poly :=
[
  term ((-21167792689899520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 630 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0630 : Poly :=
[
  term ((42335585379799040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-21167792689899520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((42335585379799040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-21167792689899520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0630_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0630
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0631 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 631 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0631 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0631_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0631
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0632 : Poly :=
[
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 632 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0632 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0632_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0632
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0633 : Poly :=
[
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 633 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0633 : Poly :=
[
  term ((1050741408711393280 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0633_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0633
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0634 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 634 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0634 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0634_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0634
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0635 : Poly :=
[
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 635 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0635 : Poly :=
[
  term ((-525370704355696640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0635_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0635
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0636 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0636 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0636_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0636
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0637 : Poly :=
[
  term ((-86675470408110080 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0637 : Poly :=
[
  term ((173350940816220160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-86675470408110080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((173350940816220160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-86675470408110080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0637_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0637
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0638 : Poly :=
[
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 638 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0638 : Poly :=
[
  term ((52437743522044628 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0638_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0638
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0639 : Poly :=
[
  term ((535596024402138625 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 639 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0639 : Poly :=
[
  term ((-1071192048804277250 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((535596024402138625 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1071192048804277250 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((535596024402138625 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0639_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0639
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0640 : Poly :=
[
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0640 : Poly :=
[
  term ((14324988938880830816 : Rat) / 89830441576176585) [(0, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0640_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0640
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0641 : Poly :=
[
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0641 : Poly :=
[
  term ((4402291481031641668 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((4402291481031641668 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0641_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0641
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0642 : Poly :=
[
  term ((-586107971230425619 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 642 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0642 : Poly :=
[
  term ((1172215942460851238 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-586107971230425619 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((1172215942460851238 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-586107971230425619 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0642_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0642
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0643 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 643 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0643 : Poly :=
[
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0643_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0643
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0644 : Poly :=
[
  term ((-25444340621326743043 : Rat) / 449152207880882925) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 644 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0644 : Poly :=
[
  term ((50888681242653486086 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-25444340621326743043 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((50888681242653486086 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-25444340621326743043 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0644_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0644
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0645 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0645 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0645_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0645
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0646 : Poly :=
[
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 646 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0646 : Poly :=
[
  term ((-867804621937612800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0646_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0646
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0647 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 647 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0647 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0647_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0647
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0648 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 648 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0648 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0648_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0648
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0649 : Poly :=
[
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 649 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0649 : Poly :=
[
  term ((-4351667738521600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0649_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0649
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0650 : Poly :=
[
  term ((1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 650 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0650 : Poly :=
[
  term ((-2587525885474432000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2587525885474432000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0650_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0650
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0651 : Poly :=
[
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 651 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0651 : Poly :=
[
  term ((14357279179282350080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0651_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0651
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0652 : Poly :=
[
  term ((-845327215295920000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 652 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0652 : Poly :=
[
  term ((1690654430591840000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-845327215295920000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1690654430591840000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-845327215295920000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0652_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0652
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0653 : Poly :=
[
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 653 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0653 : Poly :=
[
  term ((7178639589641175040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0653_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0653
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0654 : Poly :=
[
  term ((5189172041172002240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 654 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0654 : Poly :=
[
  term ((-10378344082344004480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5189172041172002240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10378344082344004480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5189172041172002240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0654_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0654
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0655 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 655 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0655 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0655_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0655
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0656 : Poly :=
[
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 656 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0656 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0656_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0656
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0657 : Poly :=
[
  term ((1949056007304716800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 657 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0657 : Poly :=
[
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1949056007304716800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1949056007304716800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0657_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0657
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0658 : Poly :=
[
  term ((434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0658 : Poly :=
[
  term ((-868452760721342720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0658_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0658
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0659 : Poly :=
[
  term ((-268945447406269177808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0659 : Poly :=
[
  term ((537890894812538355616 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-268945447406269177808 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((537890894812538355616 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-268945447406269177808 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0659_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0659
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0660 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 660 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0660 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0660_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0660
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0661 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 661 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0661 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0661_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0661
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0662 : Poly :=
[
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 662 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0662 : Poly :=
[
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0662_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0662
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0663 : Poly :=
[
  term ((1440842080287682240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 663 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0663 : Poly :=
[
  term ((-2881684160575364480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1440842080287682240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2881684160575364480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1440842080287682240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0663_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0663
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0664 : Poly :=
[
  term ((-150907826580593600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 664 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0664 : Poly :=
[
  term ((301815653161187200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-150907826580593600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((301815653161187200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-150907826580593600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0664_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0664
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0665 : Poly :=
[
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 665 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0665 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0665_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0665
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0666 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0666 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0666_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0666
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0667 : Poly :=
[
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 667 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0667 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0667_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0667
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0668 : Poly :=
[
  term ((4013960763345057280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 668 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0668 : Poly :=
[
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((4013960763345057280 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4013960763345057280 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0668_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0668
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0669 : Poly :=
[
  term ((2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 669 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0669 : Poly :=
[
  term ((-5352545453093672960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5352545453093672960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0669_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0669
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0670 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 670 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0670 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0670_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0670
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0671 : Poly :=
[
  term ((-514341991702837760 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 671 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0671 : Poly :=
[
  term ((1028683983405675520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-514341991702837760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((1028683983405675520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-514341991702837760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0671_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0671
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0672 : Poly :=
[
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 672 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0672 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0672_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0672
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0673 : Poly :=
[
  term ((9288438635497638400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0673 : Poly :=
[
  term ((-18576877270995276800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((9288438635497638400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-18576877270995276800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((9288438635497638400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0673_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0673
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0674 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0674 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0674_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0674
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0675 : Poly :=
[
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 675 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0675 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 3), (14, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0675_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0675
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0676 : Poly :=
[
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 676 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0676 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0676_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0676
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0677 : Poly :=
[
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0677 : Poly :=
[
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0677_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0677
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0678 : Poly :=
[
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 678 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0678 : Poly :=
[
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0678_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0678
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0679 : Poly :=
[
  term ((48206337072261876832 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 679 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0679 : Poly :=
[
  term ((-96412674144523753664 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((48206337072261876832 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-96412674144523753664 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((48206337072261876832 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0679_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0679
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0680 : Poly :=
[
  term ((53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 680 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0680 : Poly :=
[
  term ((-107328331835209643708 : Rat) / 89830441576176585) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(0, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-107328331835209643708 : Rat) / 89830441576176585) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(1, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0680_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0680
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0681 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 681 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0681 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0681_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0681
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0682 : Poly :=
[
  term ((-144608151691073682098 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 682 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0682 : Poly :=
[
  term ((289216303382147364196 : Rat) / 449152207880882925) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144608151691073682098 : Rat) / 449152207880882925) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((289216303382147364196 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144608151691073682098 : Rat) / 449152207880882925) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0682_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0682
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0683 : Poly :=
[
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 683 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0683 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0683_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0683
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0684 : Poly :=
[
  term ((834442727036430517423 : Rat) / 449152207880882925) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 684 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0684 : Poly :=
[
  term ((-1668885454072861034846 : Rat) / 449152207880882925) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((834442727036430517423 : Rat) / 449152207880882925) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1668885454072861034846 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((834442727036430517423 : Rat) / 449152207880882925) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0684_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0684
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0685 : Poly :=
[
  term ((11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 685 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0685 : Poly :=
[
  term ((-22599271408000000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22599271408000000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0685_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0685
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0686 : Poly :=
[
  term ((-1015516783066643200 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 686 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0686 : Poly :=
[
  term ((2031033566133286400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1015516783066643200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2031033566133286400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1015516783066643200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0686_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0686
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0687 : Poly :=
[
  term ((94165359602847680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0687 : Poly :=
[
  term ((-188330719205695360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((94165359602847680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-188330719205695360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((94165359602847680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0687_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0687
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0688 : Poly :=
[
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 688 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0688 : Poly :=
[
  term ((-120823873476454400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0688_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0688
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0689 : Poly :=
[
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 689 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0689 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0689_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0689
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0690 : Poly :=
[
  term ((52789218969253988260 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0690 : Poly :=
[
  term ((-105578437938507976520 : Rat) / 161694794837117853) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52789218969253988260 : Rat) / 161694794837117853) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-105578437938507976520 : Rat) / 161694794837117853) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((52789218969253988260 : Rat) / 161694794837117853) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0690_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0690
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0691 : Poly :=
[
  term ((28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 691 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0691 : Poly :=
[
  term ((-56056405835012135620 : Rat) / 161694794837117853) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(0, 2), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-56056405835012135620 : Rat) / 161694794837117853) [(1, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(1, 2), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0691_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0691
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0692 : Poly :=
[
  term ((108556595090167840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 692 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0692 : Poly :=
[
  term ((-217113190180335680 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((108556595090167840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-217113190180335680 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((108556595090167840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0692_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0692
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0693 : Poly :=
[
  term ((-14536547884798800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 693 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0693 : Poly :=
[
  term ((29073095769597600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-14536547884798800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((29073095769597600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14536547884798800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0693_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0693
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0694 : Poly :=
[
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 694 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0694 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (14, 2), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0694_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0694
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0695 : Poly :=
[
  term ((-1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 695 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0695 : Poly :=
[
  term ((2175833869260800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0695_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0695
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0696 : Poly :=
[
  term ((-82669221337427200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 696 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0696 : Poly :=
[
  term ((165338442674854400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-82669221337427200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((165338442674854400 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82669221337427200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0696_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0696
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0697 : Poly :=
[
  term ((1846729924034961280 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 697 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0697 : Poly :=
[
  term ((-3693459848069922560 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1846729924034961280 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3693459848069922560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1846729924034961280 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0697_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0697
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0698 : Poly :=
[
  term ((-47379821111746810724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 698 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0698 : Poly :=
[
  term ((94759642223493621448 : Rat) / 449152207880882925) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-47379821111746810724 : Rat) / 449152207880882925) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((94759642223493621448 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47379821111746810724 : Rat) / 449152207880882925) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0698_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0698
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0699 : Poly :=
[
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 699 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0699 : Poly :=
[
  term ((-13551594980403200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13551594980403200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0699_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0699
        rs_R010_ueqv_R010YNN_generator_28_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_28_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_28_0600_0699 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_28_0600,
  rs_R010_ueqv_R010YNN_partial_28_0601,
  rs_R010_ueqv_R010YNN_partial_28_0602,
  rs_R010_ueqv_R010YNN_partial_28_0603,
  rs_R010_ueqv_R010YNN_partial_28_0604,
  rs_R010_ueqv_R010YNN_partial_28_0605,
  rs_R010_ueqv_R010YNN_partial_28_0606,
  rs_R010_ueqv_R010YNN_partial_28_0607,
  rs_R010_ueqv_R010YNN_partial_28_0608,
  rs_R010_ueqv_R010YNN_partial_28_0609,
  rs_R010_ueqv_R010YNN_partial_28_0610,
  rs_R010_ueqv_R010YNN_partial_28_0611,
  rs_R010_ueqv_R010YNN_partial_28_0612,
  rs_R010_ueqv_R010YNN_partial_28_0613,
  rs_R010_ueqv_R010YNN_partial_28_0614,
  rs_R010_ueqv_R010YNN_partial_28_0615,
  rs_R010_ueqv_R010YNN_partial_28_0616,
  rs_R010_ueqv_R010YNN_partial_28_0617,
  rs_R010_ueqv_R010YNN_partial_28_0618,
  rs_R010_ueqv_R010YNN_partial_28_0619,
  rs_R010_ueqv_R010YNN_partial_28_0620,
  rs_R010_ueqv_R010YNN_partial_28_0621,
  rs_R010_ueqv_R010YNN_partial_28_0622,
  rs_R010_ueqv_R010YNN_partial_28_0623,
  rs_R010_ueqv_R010YNN_partial_28_0624,
  rs_R010_ueqv_R010YNN_partial_28_0625,
  rs_R010_ueqv_R010YNN_partial_28_0626,
  rs_R010_ueqv_R010YNN_partial_28_0627,
  rs_R010_ueqv_R010YNN_partial_28_0628,
  rs_R010_ueqv_R010YNN_partial_28_0629,
  rs_R010_ueqv_R010YNN_partial_28_0630,
  rs_R010_ueqv_R010YNN_partial_28_0631,
  rs_R010_ueqv_R010YNN_partial_28_0632,
  rs_R010_ueqv_R010YNN_partial_28_0633,
  rs_R010_ueqv_R010YNN_partial_28_0634,
  rs_R010_ueqv_R010YNN_partial_28_0635,
  rs_R010_ueqv_R010YNN_partial_28_0636,
  rs_R010_ueqv_R010YNN_partial_28_0637,
  rs_R010_ueqv_R010YNN_partial_28_0638,
  rs_R010_ueqv_R010YNN_partial_28_0639,
  rs_R010_ueqv_R010YNN_partial_28_0640,
  rs_R010_ueqv_R010YNN_partial_28_0641,
  rs_R010_ueqv_R010YNN_partial_28_0642,
  rs_R010_ueqv_R010YNN_partial_28_0643,
  rs_R010_ueqv_R010YNN_partial_28_0644,
  rs_R010_ueqv_R010YNN_partial_28_0645,
  rs_R010_ueqv_R010YNN_partial_28_0646,
  rs_R010_ueqv_R010YNN_partial_28_0647,
  rs_R010_ueqv_R010YNN_partial_28_0648,
  rs_R010_ueqv_R010YNN_partial_28_0649,
  rs_R010_ueqv_R010YNN_partial_28_0650,
  rs_R010_ueqv_R010YNN_partial_28_0651,
  rs_R010_ueqv_R010YNN_partial_28_0652,
  rs_R010_ueqv_R010YNN_partial_28_0653,
  rs_R010_ueqv_R010YNN_partial_28_0654,
  rs_R010_ueqv_R010YNN_partial_28_0655,
  rs_R010_ueqv_R010YNN_partial_28_0656,
  rs_R010_ueqv_R010YNN_partial_28_0657,
  rs_R010_ueqv_R010YNN_partial_28_0658,
  rs_R010_ueqv_R010YNN_partial_28_0659,
  rs_R010_ueqv_R010YNN_partial_28_0660,
  rs_R010_ueqv_R010YNN_partial_28_0661,
  rs_R010_ueqv_R010YNN_partial_28_0662,
  rs_R010_ueqv_R010YNN_partial_28_0663,
  rs_R010_ueqv_R010YNN_partial_28_0664,
  rs_R010_ueqv_R010YNN_partial_28_0665,
  rs_R010_ueqv_R010YNN_partial_28_0666,
  rs_R010_ueqv_R010YNN_partial_28_0667,
  rs_R010_ueqv_R010YNN_partial_28_0668,
  rs_R010_ueqv_R010YNN_partial_28_0669,
  rs_R010_ueqv_R010YNN_partial_28_0670,
  rs_R010_ueqv_R010YNN_partial_28_0671,
  rs_R010_ueqv_R010YNN_partial_28_0672,
  rs_R010_ueqv_R010YNN_partial_28_0673,
  rs_R010_ueqv_R010YNN_partial_28_0674,
  rs_R010_ueqv_R010YNN_partial_28_0675,
  rs_R010_ueqv_R010YNN_partial_28_0676,
  rs_R010_ueqv_R010YNN_partial_28_0677,
  rs_R010_ueqv_R010YNN_partial_28_0678,
  rs_R010_ueqv_R010YNN_partial_28_0679,
  rs_R010_ueqv_R010YNN_partial_28_0680,
  rs_R010_ueqv_R010YNN_partial_28_0681,
  rs_R010_ueqv_R010YNN_partial_28_0682,
  rs_R010_ueqv_R010YNN_partial_28_0683,
  rs_R010_ueqv_R010YNN_partial_28_0684,
  rs_R010_ueqv_R010YNN_partial_28_0685,
  rs_R010_ueqv_R010YNN_partial_28_0686,
  rs_R010_ueqv_R010YNN_partial_28_0687,
  rs_R010_ueqv_R010YNN_partial_28_0688,
  rs_R010_ueqv_R010YNN_partial_28_0689,
  rs_R010_ueqv_R010YNN_partial_28_0690,
  rs_R010_ueqv_R010YNN_partial_28_0691,
  rs_R010_ueqv_R010YNN_partial_28_0692,
  rs_R010_ueqv_R010YNN_partial_28_0693,
  rs_R010_ueqv_R010YNN_partial_28_0694,
  rs_R010_ueqv_R010YNN_partial_28_0695,
  rs_R010_ueqv_R010YNN_partial_28_0696,
  rs_R010_ueqv_R010YNN_partial_28_0697,
  rs_R010_ueqv_R010YNN_partial_28_0698,
  rs_R010_ueqv_R010YNN_partial_28_0699
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_28_0600_0699 : Poly :=
[
  term ((-130872847455844627208 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((32330809313050931236 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((420061014020153567084 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30461674169651200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10936412676761600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-684003317961367040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((302953210184665600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5569268046374556160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((42335585379799040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((173350940816220160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1071192048804277250 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(0, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4402291481031641668 : Rat) / 149717402626960975) [(0, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((50888681242653486086 : Rat) / 449152207880882925) [(0, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((1172215942460851238 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1690654430591840000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2587525885474432000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10378344082344004480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((537890894812538355616 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2881684160575364480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((301815653161187200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1028683983405675520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5352545453093672960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-18576877270995276800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 3), (14, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96412674144523753664 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((289216303382147364196 : Rat) / 449152207880882925) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-107328331835209643708 : Rat) / 89830441576176585) [(0, 1), (5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1668885454072861034846 : Rat) / 449152207880882925) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(0, 1), (5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2031033566133286400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22599271408000000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-188330719205695360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-105578437938507976520 : Rat) / 161694794837117853) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-217113190180335680 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((29073095769597600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-56056405835012135620 : Rat) / 161694794837117853) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (14, 2), (16, 1)],
  term ((-3693459848069922560 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((94759642223493621448 : Rat) / 449152207880882925) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((165338442674854400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13551594980403200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((65436423727922313604 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16165404656525465618 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((92926161388738417708 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210030507010076783542 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((15230837084825600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((342001658980683520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((2784634023187278080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-21167792689899520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-86675470408110080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((535596024402138625 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(0, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(0, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-586107971230425619 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25444340621326743043 : Rat) / 449152207880882925) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-845327215295920000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5189172041172002240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1949056007304716800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-268945447406269177808 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1440842080287682240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-150907826580593600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((4013960763345057280 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-514341991702837760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((9288438635497638400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((48206337072261876832 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(0, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-144608151691073682098 : Rat) / 449152207880882925) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((834442727036430517423 : Rat) / 449152207880882925) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1015516783066643200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((94165359602847680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52789218969253988260 : Rat) / 161694794837117853) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(0, 2), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((108556595090167840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14536547884798800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-82669221337427200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1846729924034961280 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47379821111746810724 : Rat) / 449152207880882925) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-130872847455844627208 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32330809313050931236 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-185852322777476835416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((420061014020153567084 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30461674169651200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((10936412676761600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-684003317961367040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((302953210184665600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((42335585379799040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5569268046374556160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((173350940816220160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1071192048804277250 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((4402291481031641668 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1172215942460851238 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((50888681242653486086 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2587525885474432000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1690654430591840000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10378344082344004480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((537890894812538355616 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((301815653161187200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2881684160575364480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5352545453093672960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1028683983405675520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-18576877270995276800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96412674144523753664 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-107328331835209643708 : Rat) / 89830441576176585) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((289216303382147364196 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1668885454072861034846 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-22599271408000000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2031033566133286400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-188330719205695360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-105578437938507976520 : Rat) / 161694794837117853) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56056405835012135620 : Rat) / 161694794837117853) [(1, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((29073095769597600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-217113190180335680 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((165338442674854400 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94759642223493621448 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3693459848069922560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-13551594980403200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((65436423727922313604 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16165404656525465618 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((47203239297256716854 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((92926161388738417708 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210030507010076783542 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((15230837084825600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((342001658980683520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((2784634023187278080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-21167792689899520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-86675470408110080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((535596024402138625 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-586107971230425619 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25444340621326743043 : Rat) / 449152207880882925) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-845327215295920000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5189172041172002240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1949056007304716800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-268945447406269177808 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1440842080287682240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-150907826580593600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((4013960763345057280 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-514341991702837760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((9288438635497638400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((48206337072261876832 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(1, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-144608151691073682098 : Rat) / 449152207880882925) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((834442727036430517423 : Rat) / 449152207880882925) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1015516783066643200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((94165359602847680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((52789218969253988260 : Rat) / 161694794837117853) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(1, 2), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((108556595090167840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14536547884798800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-82669221337427200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1846729924034961280 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47379821111746810724 : Rat) / 449152207880882925) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 600 through 699. -/
theorem rs_R010_ueqv_R010YNN_block_28_0600_0699_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_28_0600_0699
      rs_R010_ueqv_R010YNN_block_28_0600_0699 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
