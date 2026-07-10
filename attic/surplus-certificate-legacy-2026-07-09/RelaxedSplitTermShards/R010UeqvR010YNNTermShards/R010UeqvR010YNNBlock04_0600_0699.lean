/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 4:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_04_0600_0699 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0600 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 600 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0600 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0600_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0600
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0601 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0601 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0601_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0601
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0602 : Poly :=
[
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 602 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0602 : Poly :=
[
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0602_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0602
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0603 : Poly :=
[
  term ((63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 603 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0603 : Poly :=
[
  term ((-126198364417126400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((63099182208563200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0603_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0603
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0604 : Poly :=
[
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 604 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0604 : Poly :=
[
  term ((10936412676761600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0604_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0604
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0605 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 605 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0605 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0605_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0605
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0606 : Poly :=
[
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 606 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0606 : Poly :=
[
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0606_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0606
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0607 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0607 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0607_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0607
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0608 : Poly :=
[
  term ((-1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0608 : Poly :=
[
  term ((3659300884155266560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3659300884155266560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0608_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0608
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0609 : Poly :=
[
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 609 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0609 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0609_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0609
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0610 : Poly :=
[
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0610 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0610_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0610
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0611 : Poly :=
[
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0611 : Poly :=
[
  term ((302953210184665600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-302953210184665600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0611_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0611
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0612 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 612 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0612 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 3), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0612_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0612
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0613 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 613 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0613 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0613_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0613
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0614 : Poly :=
[
  term ((47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 614 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0614 : Poly :=
[
  term ((-95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0614_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0614
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0615 : Poly :=
[
  term ((-373376015799422720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 615 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0615 : Poly :=
[
  term ((746752031598845440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-373376015799422720 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-746752031598845440 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((373376015799422720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((373376015799422720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-373376015799422720 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0615_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0615
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0616 : Poly :=
[
  term ((-41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 616 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0616 : Poly :=
[
  term ((82681687031910400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-41340843515955200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((-82681687031910400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((-41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0616_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0616
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0617 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 617 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0617 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 3), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0617_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0617
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0618 : Poly :=
[
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 618 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0618 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (13, 2), (16, 1)],
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0618_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0618
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0619 : Poly :=
[
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 619 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0619 : Poly :=
[
  term ((1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 3), (14, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0619_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0619
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0620 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 620 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0620 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 3), (15, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0620_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0620
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0621 : Poly :=
[
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 621 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0621 : Poly :=
[
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 3), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0621_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0621
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0622 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0622 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0622_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0622
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0623 : Poly :=
[
  term ((1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0623 : Poly :=
[
  term ((-2642807167499591680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((2642807167499591680 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0623_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0623
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0624 : Poly :=
[
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 624 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0624 : Poly :=
[
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 3), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0624_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0624
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0625 : Poly :=
[
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 625 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0625 : Poly :=
[
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0625_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0625
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0626 : Poly :=
[
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 626 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0626 : Poly :=
[
  term ((14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0626_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0626
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0627 : Poly :=
[
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0627 : Poly :=
[
  term ((4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0627_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0627
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0628 : Poly :=
[
  term ((22490992032104473 : Rat) / 17966088315235317) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 628 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0628 : Poly :=
[
  term ((-44981984064208946 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((22490992032104473 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((44981984064208946 : Rat) / 17966088315235317) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22490992032104473 : Rat) / 17966088315235317) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-22490992032104473 : Rat) / 17966088315235317) [(5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((22490992032104473 : Rat) / 17966088315235317) [(5, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0628_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0628
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0629 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 629 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0629 : Poly :=
[
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0629_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0629
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0630 : Poly :=
[
  term ((-130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 630 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0630 : Poly :=
[
  term ((261188568908210476 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-130594284454105238 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-261188568908210476 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0630_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0630
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0631 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0631 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0631_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0631
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0632 : Poly :=
[
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 632 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0632 : Poly :=
[
  term ((867804621937612800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0632_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0632
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0633 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0633 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0633_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0633
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0634 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 634 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0634 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0634_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0634
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0635 : Poly :=
[
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 635 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0635 : Poly :=
[
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0635_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0635
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0636 : Poly :=
[
  term ((1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 636 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0636 : Poly :=
[
  term ((-2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0636_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0636
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0637 : Poly :=
[
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 637 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0637 : Poly :=
[
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0637_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0637
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0638 : Poly :=
[
  term ((-382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 638 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0638 : Poly :=
[
  term ((764470039512838400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-382235019756419200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-382235019756419200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-764470039512838400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0638_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0638
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0639 : Poly :=
[
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0639 : Poly :=
[
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0639_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0639
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0640 : Poly :=
[
  term ((-1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0640 : Poly :=
[
  term ((2995252400804487040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2995252400804487040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0640_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0640
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0641 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0641 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0641_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0641
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0642 : Poly :=
[
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 642 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0642 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0642_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0642
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0643 : Poly :=
[
  term ((-2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 643 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0643 : Poly :=
[
  term ((4061263082736742400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-4061263082736742400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0643_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0643
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0644 : Poly :=
[
  term ((434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 644 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0644 : Poly :=
[
  term ((-868452760721342720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0644_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0644
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0645 : Poly :=
[
  term ((242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0645 : Poly :=
[
  term ((-484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0645_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0645
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0646 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 646 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0646 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0646_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0646
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0647 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 647 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0647 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0647_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0647
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0648 : Poly :=
[
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 648 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0648 : Poly :=
[
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0648_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0648
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0649 : Poly :=
[
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 649 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0649 : Poly :=
[
  term ((276325878411336320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-276325878411336320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((138162939205668160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((138162939205668160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0649_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0649
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0650 : Poly :=
[
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 650 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0650 : Poly :=
[
  term ((-228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0650_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0650
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0651 : Poly :=
[
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 651 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0651 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0651_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0651
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0652 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0652 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0652_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0652
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0653 : Poly :=
[
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 653 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0653 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0653_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0653
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0654 : Poly :=
[
  term ((-3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 654 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0654 : Poly :=
[
  term ((6959106769741665280 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-6959106769741665280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0654_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0654
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0655 : Poly :=
[
  term ((2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 655 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0655 : Poly :=
[
  term ((-5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0655_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0655
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0656 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 656 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0656 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0656_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0656
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0657 : Poly :=
[
  term ((-478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 657 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0657 : Poly :=
[
  term ((957433186492625920 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-478716593246312960 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-478716593246312960 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-957433186492625920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0657_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0657
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0658 : Poly :=
[
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0658 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0658_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0658
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0659 : Poly :=
[
  term ((-1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0659 : Poly :=
[
  term ((2106870906591001600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2106870906591001600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0659_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0659
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0660 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0660 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0660_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0660
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0661 : Poly :=
[
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 661 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0661 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (14, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0661_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0661
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0662 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 662 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0662 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0662_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0662
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0663 : Poly :=
[
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 663 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0663 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0663_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0663
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0664 : Poly :=
[
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 664 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0664 : Poly :=
[
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0664_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0664
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0665 : Poly :=
[
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 665 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0665 : Poly :=
[
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0665_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0665
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0666 : Poly :=
[
  term ((-159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 666 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0666 : Poly :=
[
  term ((318486201933986169628 : Rat) / 269491324728529755) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-318486201933986169628 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0666_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0666
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0667 : Poly :=
[
  term ((53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 667 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0667 : Poly :=
[
  term ((-107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (6, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0667_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0667
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0668 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0668 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0668_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0668
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0669 : Poly :=
[
  term ((-140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 669 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0669 : Poly :=
[
  term ((280727785643772348676 : Rat) / 449152207880882925) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((-140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-280727785643772348676 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0669_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0669
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0670 : Poly :=
[
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 670 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0670 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0670_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0670
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0671 : Poly :=
[
  term ((-95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0671 : Poly :=
[
  term ((191735058619924345298 : Rat) / 449152207880882925) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-191735058619924345298 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0671_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0671
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0672 : Poly :=
[
  term ((11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 672 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0672 : Poly :=
[
  term ((-22599271408000000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((22599271408000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0672_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0672
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0673 : Poly :=
[
  term ((2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 673 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0673 : Poly :=
[
  term ((-5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0673_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0673
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0674 : Poly :=
[
  term ((115102170853741120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0674 : Poly :=
[
  term ((-230204341707482240 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((115102170853741120 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((115102170853741120 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((230204341707482240 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-115102170853741120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-115102170853741120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0674_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0674
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0675 : Poly :=
[
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 675 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0675 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 2), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0675_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0675
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0676 : Poly :=
[
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0676 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0676_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0676
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0677 : Poly :=
[
  term ((-53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0677 : Poly :=
[
  term ((106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (6, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (7, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0677_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0677
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0678 : Poly :=
[
  term ((28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 678 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0678 : Poly :=
[
  term ((-56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (6, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (7, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0678_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0678
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0679 : Poly :=
[
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 679 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0679 : Poly :=
[
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0679_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0679
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0680 : Poly :=
[
  term ((-28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 680 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0680 : Poly :=
[
  term ((56623645998929656420 : Rat) / 161694794837117853) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-56623645998929656420 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0680_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0680
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0681 : Poly :=
[
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 681 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0681 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 2), (14, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0681_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0681
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0682 : Poly :=
[
  term ((-1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 682 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0682 : Poly :=
[
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (10, 2), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (10, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (12, 2), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0682_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0682
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0683 : Poly :=
[
  term ((-82667107014688000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 683 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0683 : Poly :=
[
  term ((165334214029376000 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-82667107014688000 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-82667107014688000 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-165334214029376000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((82667107014688000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((82667107014688000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0683_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0683
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0684 : Poly :=
[
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 684 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0684 : Poly :=
[
  term ((11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0684_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0684
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0685 : Poly :=
[
  term ((53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 685 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0685 : Poly :=
[
  term ((-106676675828989941448 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((106676675828989941448 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0685_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0685
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0686 : Poly :=
[
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0686 : Poly :=
[
  term ((-13551594980403200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0686_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0686
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0687 : Poly :=
[
  term ((2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0687 : Poly :=
[
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0687_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0687
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0688 : Poly :=
[
  term ((1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 688 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0688 : Poly :=
[
  term ((-2246369543859334880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2246369543859334880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0688_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0688
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0689 : Poly :=
[
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 689 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0689 : Poly :=
[
  term ((-188614930677367040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0689_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0689
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0690 : Poly :=
[
  term ((-115196133656576000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 690 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0690 : Poly :=
[
  term ((230392267313152000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-115196133656576000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-115196133656576000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-230392267313152000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((115196133656576000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((115196133656576000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0690_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0690
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0691 : Poly :=
[
  term ((1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 691 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0691 : Poly :=
[
  term ((-3074607597931206400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((3074607597931206400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0691_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0691
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0692 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

/-- Partial product 692 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0692 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (13, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0692_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0692
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0693 : Poly :=
[
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 693 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0693 : Poly :=
[
  term ((513176631335338880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-513176631335338880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0693_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0693
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0694 : Poly :=
[
  term ((20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0694 : Poly :=
[
  term ((-40715390148592327688 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((40715390148592327688 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0694_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0694
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0695 : Poly :=
[
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 695 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0695 : Poly :=
[
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0695_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0695
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0696 : Poly :=
[
  term ((907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 696 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0696 : Poly :=
[
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0696_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0696
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0697 : Poly :=
[
  term ((428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 697 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0697 : Poly :=
[
  term ((-857225984332276937932 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((857225984332276937932 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0697_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0697
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0698 : Poly :=
[
  term ((32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 698 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0698 : Poly :=
[
  term ((-65585131918463360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((32792565959231680 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((32792565959231680 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((65585131918463360 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0698_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0698
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0699 : Poly :=
[
  term ((909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 699 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0699 : Poly :=
[
  term ((-1818703672242566296 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((909351836121283148 : Rat) / 449152207880882925) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((909351836121283148 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((1818703672242566296 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0699_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0699
        rs_R010_ueqv_R010YNN_generator_04_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_04_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_04_0600_0699 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_04_0600,
  rs_R010_ueqv_R010YNN_partial_04_0601,
  rs_R010_ueqv_R010YNN_partial_04_0602,
  rs_R010_ueqv_R010YNN_partial_04_0603,
  rs_R010_ueqv_R010YNN_partial_04_0604,
  rs_R010_ueqv_R010YNN_partial_04_0605,
  rs_R010_ueqv_R010YNN_partial_04_0606,
  rs_R010_ueqv_R010YNN_partial_04_0607,
  rs_R010_ueqv_R010YNN_partial_04_0608,
  rs_R010_ueqv_R010YNN_partial_04_0609,
  rs_R010_ueqv_R010YNN_partial_04_0610,
  rs_R010_ueqv_R010YNN_partial_04_0611,
  rs_R010_ueqv_R010YNN_partial_04_0612,
  rs_R010_ueqv_R010YNN_partial_04_0613,
  rs_R010_ueqv_R010YNN_partial_04_0614,
  rs_R010_ueqv_R010YNN_partial_04_0615,
  rs_R010_ueqv_R010YNN_partial_04_0616,
  rs_R010_ueqv_R010YNN_partial_04_0617,
  rs_R010_ueqv_R010YNN_partial_04_0618,
  rs_R010_ueqv_R010YNN_partial_04_0619,
  rs_R010_ueqv_R010YNN_partial_04_0620,
  rs_R010_ueqv_R010YNN_partial_04_0621,
  rs_R010_ueqv_R010YNN_partial_04_0622,
  rs_R010_ueqv_R010YNN_partial_04_0623,
  rs_R010_ueqv_R010YNN_partial_04_0624,
  rs_R010_ueqv_R010YNN_partial_04_0625,
  rs_R010_ueqv_R010YNN_partial_04_0626,
  rs_R010_ueqv_R010YNN_partial_04_0627,
  rs_R010_ueqv_R010YNN_partial_04_0628,
  rs_R010_ueqv_R010YNN_partial_04_0629,
  rs_R010_ueqv_R010YNN_partial_04_0630,
  rs_R010_ueqv_R010YNN_partial_04_0631,
  rs_R010_ueqv_R010YNN_partial_04_0632,
  rs_R010_ueqv_R010YNN_partial_04_0633,
  rs_R010_ueqv_R010YNN_partial_04_0634,
  rs_R010_ueqv_R010YNN_partial_04_0635,
  rs_R010_ueqv_R010YNN_partial_04_0636,
  rs_R010_ueqv_R010YNN_partial_04_0637,
  rs_R010_ueqv_R010YNN_partial_04_0638,
  rs_R010_ueqv_R010YNN_partial_04_0639,
  rs_R010_ueqv_R010YNN_partial_04_0640,
  rs_R010_ueqv_R010YNN_partial_04_0641,
  rs_R010_ueqv_R010YNN_partial_04_0642,
  rs_R010_ueqv_R010YNN_partial_04_0643,
  rs_R010_ueqv_R010YNN_partial_04_0644,
  rs_R010_ueqv_R010YNN_partial_04_0645,
  rs_R010_ueqv_R010YNN_partial_04_0646,
  rs_R010_ueqv_R010YNN_partial_04_0647,
  rs_R010_ueqv_R010YNN_partial_04_0648,
  rs_R010_ueqv_R010YNN_partial_04_0649,
  rs_R010_ueqv_R010YNN_partial_04_0650,
  rs_R010_ueqv_R010YNN_partial_04_0651,
  rs_R010_ueqv_R010YNN_partial_04_0652,
  rs_R010_ueqv_R010YNN_partial_04_0653,
  rs_R010_ueqv_R010YNN_partial_04_0654,
  rs_R010_ueqv_R010YNN_partial_04_0655,
  rs_R010_ueqv_R010YNN_partial_04_0656,
  rs_R010_ueqv_R010YNN_partial_04_0657,
  rs_R010_ueqv_R010YNN_partial_04_0658,
  rs_R010_ueqv_R010YNN_partial_04_0659,
  rs_R010_ueqv_R010YNN_partial_04_0660,
  rs_R010_ueqv_R010YNN_partial_04_0661,
  rs_R010_ueqv_R010YNN_partial_04_0662,
  rs_R010_ueqv_R010YNN_partial_04_0663,
  rs_R010_ueqv_R010YNN_partial_04_0664,
  rs_R010_ueqv_R010YNN_partial_04_0665,
  rs_R010_ueqv_R010YNN_partial_04_0666,
  rs_R010_ueqv_R010YNN_partial_04_0667,
  rs_R010_ueqv_R010YNN_partial_04_0668,
  rs_R010_ueqv_R010YNN_partial_04_0669,
  rs_R010_ueqv_R010YNN_partial_04_0670,
  rs_R010_ueqv_R010YNN_partial_04_0671,
  rs_R010_ueqv_R010YNN_partial_04_0672,
  rs_R010_ueqv_R010YNN_partial_04_0673,
  rs_R010_ueqv_R010YNN_partial_04_0674,
  rs_R010_ueqv_R010YNN_partial_04_0675,
  rs_R010_ueqv_R010YNN_partial_04_0676,
  rs_R010_ueqv_R010YNN_partial_04_0677,
  rs_R010_ueqv_R010YNN_partial_04_0678,
  rs_R010_ueqv_R010YNN_partial_04_0679,
  rs_R010_ueqv_R010YNN_partial_04_0680,
  rs_R010_ueqv_R010YNN_partial_04_0681,
  rs_R010_ueqv_R010YNN_partial_04_0682,
  rs_R010_ueqv_R010YNN_partial_04_0683,
  rs_R010_ueqv_R010YNN_partial_04_0684,
  rs_R010_ueqv_R010YNN_partial_04_0685,
  rs_R010_ueqv_R010YNN_partial_04_0686,
  rs_R010_ueqv_R010YNN_partial_04_0687,
  rs_R010_ueqv_R010YNN_partial_04_0688,
  rs_R010_ueqv_R010YNN_partial_04_0689,
  rs_R010_ueqv_R010YNN_partial_04_0690,
  rs_R010_ueqv_R010YNN_partial_04_0691,
  rs_R010_ueqv_R010YNN_partial_04_0692,
  rs_R010_ueqv_R010YNN_partial_04_0693,
  rs_R010_ueqv_R010YNN_partial_04_0694,
  rs_R010_ueqv_R010YNN_partial_04_0695,
  rs_R010_ueqv_R010YNN_partial_04_0696,
  rs_R010_ueqv_R010YNN_partial_04_0697,
  rs_R010_ueqv_R010YNN_partial_04_0698,
  rs_R010_ueqv_R010YNN_partial_04_0699
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_04_0600_0699 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((10936412676761600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3659300884155266560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((302953210184665600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((746752031598845440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((82681687031910400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2642807167499591680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44981984064208946 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((261188568908210476 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((764470039512838400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2995252400804487040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((4061263082736742400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((276325878411336320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((6959106769741665280 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((957433186492625920 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2106870906591001600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((318486201933986169628 : Rat) / 269491324728529755) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((280727785643772348676 : Rat) / 449152207880882925) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((191735058619924345298 : Rat) / 449152207880882925) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-22599271408000000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-230204341707482240 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (6, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((56623645998929656420 : Rat) / 161694794837117853) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((165334214029376000 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-106676675828989941448 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13551594980403200 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2246369543859334880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-188614930677367040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((230392267313152000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3074607597931206400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((513176631335338880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40715390148592327688 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-857225984332276937932 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-65585131918463360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1818703672242566296 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((63099182208563200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-373376015799422720 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-41340843515955200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((22490992032104473 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-130594284454105238 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-382235019756419200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-478716593246312960 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (6, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (6, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((115102170853741120 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (6, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (6, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (10, 2), (16, 1)],
  term ((-82667107014688000 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115196133656576000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((32792565959231680 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((909351836121283148 : Rat) / 449152207880882925) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3659300884155266560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-302953210184665600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-746752031598845440 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-82681687031910400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((373376015799422720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((373376015799422720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 3), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 3), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2642807167499591680 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 3), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 3), (15, 2), (16, 1)],
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 3), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((44981984064208946 : Rat) / 17966088315235317) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-261188568908210476 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-22490992032104473 : Rat) / 17966088315235317) [(5, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-22490992032104473 : Rat) / 17966088315235317) [(5, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-382235019756419200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-478716593246312960 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (7, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (7, 2), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((11299635704000000 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((115102170853741120 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (7, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (7, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1087916934630400 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (10, 2), (16, 1)],
  term ((-82667107014688000 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115196133656576000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((32792565959231680 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((909351836121283148 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (10, 1), (16, 1)],
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1829650442077633280 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 3), (9, 2), (11, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-151476605092332800 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (14, 1), (16, 1)],
  term ((-373376015799422720 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (15, 2), (16, 1)],
  term ((-41340843515955200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (11, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 3), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1321403583749795840 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 3), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 3), (10, 1), (14, 1), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 3), (10, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((22490992032104473 : Rat) / 17966088315235317) [(5, 1), (7, 3), (14, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-130594284454105238 : Rat) / 53898264945705951) [(5, 1), (7, 3), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 4), (15, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-764470039512838400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2995252400804487040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1497626200402243520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((382235019756419200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4061263082736742400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((2030631541368371200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((484599475404637779616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-276325878411336320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((138162939205668160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((138162939205668160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-242299737702318889808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 3), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 3), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6959106769741665280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3479553384870832640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-957433186492625920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2106870906591001600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1053435453295500800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 3), (14, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 3), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 3), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-318486201933986169628 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((159243100966993084814 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-280727785643772348676 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-191735058619924345298 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((95867529309962172649 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 3), (16, 1)],
  term ((22599271408000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((230204341707482240 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-115102170853741120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-115102170853741120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 2), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-56623645998929656420 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((28311822999464828210 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 2), (14, 1), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (12, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (13, 2), (16, 1)],
  term ((-165334214029376000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((106676675828989941448 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2246369543859334880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((82667107014688000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2768482793272051520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1123184771929667440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((82667107014688000 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-230392267313152000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3074607597931206400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((115196133656576000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((115196133656576000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1537303798965603200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (13, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 3), (16, 1)],
  term ((-513176631335338880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((40715390148592327688 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((857225984332276937932 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((65585131918463360 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1818703672242566296 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-428612992166138468966 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-909351836121283148 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 600 through 699. -/
theorem rs_R010_ueqv_R010YNN_block_04_0600_0699_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_04_0600_0699
      rs_R010_ueqv_R010YNN_block_04_0600_0699 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
