/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 27:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_27_0600_0699 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0600 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 600 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0600 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0600_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0600
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0601 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0601 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0601_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0601
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0602 : Poly :=
[
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 602 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0602 : Poly :=
[
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0602_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0602
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0603 : Poly :=
[
  term ((63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 603 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0603 : Poly :=
[
  term ((126198364417126400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0603_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0603
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0604 : Poly :=
[
  term ((-5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 604 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0604 : Poly :=
[
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0604_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0604
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0605 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 605 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0605 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0605_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0605
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0606 : Poly :=
[
  term ((13670515845952000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 606 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0606 : Poly :=
[
  term ((27341031691904000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13670515845952000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13670515845952000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((27341031691904000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0606_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0606
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0607 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0607 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0607_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0607
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0608 : Poly :=
[
  term ((-1977292013213914880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0608 : Poly :=
[
  term ((-3954584026427829760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3954584026427829760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1977292013213914880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1977292013213914880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0608_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0608
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0609 : Poly :=
[
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 609 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0609 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (14, 2), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0609_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0609
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0610 : Poly :=
[
  term ((789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0610 : Poly :=
[
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0610_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0610
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0611 : Poly :=
[
  term ((-2033434834770348800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0611 : Poly :=
[
  term ((-4066869669540697600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2033434834770348800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2033434834770348800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4066869669540697600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0611_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0611
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0612 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 612 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0612 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 5), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0612_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0612
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0613 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 613 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0613 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 4), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0613_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0613
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0614 : Poly :=
[
  term ((47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 614 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0614 : Poly :=
[
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0614_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0614
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0615 : Poly :=
[
  term ((1995131513440602880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 615 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0615 : Poly :=
[
  term ((3990263026881205760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3990263026881205760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1995131513440602880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1995131513440602880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0615_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0615
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0616 : Poly :=
[
  term ((-203937837707806720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 616 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0616 : Poly :=
[
  term ((-407875675415613440 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-407875675415613440 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((203937837707806720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((203937837707806720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0616_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0616
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0617 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 617 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0617 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0617_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0617
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0618 : Poly :=
[
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 618 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0618 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (14, 2), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0618_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0618
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0619 : Poly :=
[
  term ((-525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 619 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0619 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 3), (16, 1)],
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0619_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0619
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0620 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 620 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0620 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 4), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0620_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0620
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0621 : Poly :=
[
  term ((1313426760889241600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 621 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0621 : Poly :=
[
  term ((2626853521778483200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1313426760889241600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((-1313426760889241600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((2626853521778483200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0621_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0621
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0622 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0622 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 3), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0622_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0622
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0623 : Poly :=
[
  term ((-254708529317294080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0623 : Poly :=
[
  term ((-509417058634588160 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-509417058634588160 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((254708529317294080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((254708529317294080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0623_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0623
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0624 : Poly :=
[
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 624 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0624 : Poly :=
[
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0624_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0624
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0625 : Poly :=
[
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 625 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0625 : Poly :=
[
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0625_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0625
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0626 : Poly :=
[
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 626 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0626 : Poly :=
[
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0626_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0626
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0627 : Poly :=
[
  term ((-2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0627 : Poly :=
[
  term ((-4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0627_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0627
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0628 : Poly :=
[
  term ((-1555859855040908659 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 628 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0628 : Poly :=
[
  term ((-3111719710081817318 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3111719710081817318 : Rat) / 53898264945705951) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1555859855040908659 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1555859855040908659 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0628_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0628
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0629 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 629 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0629 : Poly :=
[
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0629_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0629
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0630 : Poly :=
[
  term ((-61693698191868217504 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 630 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0630 : Poly :=
[
  term ((-123387396383736435008 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-123387396383736435008 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((61693698191868217504 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((61693698191868217504 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0630_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0630
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0631 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0631 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0631_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0631
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0632 : Poly :=
[
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 632 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0632 : Poly :=
[
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0632_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0632
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0633 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0633 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0633_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0633
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0634 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 634 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0634 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0634_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0634
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0635 : Poly :=
[
  term ((2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 635 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0635 : Poly :=
[
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0635_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0635
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0636 : Poly :=
[
  term ((1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 636 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0636 : Poly :=
[
  term ((2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0636_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0636
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0637 : Poly :=
[
  term ((7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 637 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0637 : Poly :=
[
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0637_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0637
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0638 : Poly :=
[
  term ((-2919215230418883200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 638 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0638 : Poly :=
[
  term ((-5838430460837766400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2919215230418883200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2919215230418883200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5838430460837766400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0638_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0638
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0639 : Poly :=
[
  term ((-3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0639 : Poly :=
[
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0639_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0639
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0640 : Poly :=
[
  term ((251827816709062720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0640 : Poly :=
[
  term ((503655633418125440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((503655633418125440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-251827816709062720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-251827816709062720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0640_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0640
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0641 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0641 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0641_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0641
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0642 : Poly :=
[
  term ((14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 642 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0642 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0642_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0642
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0643 : Poly :=
[
  term ((-1991380901650739200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 643 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0643 : Poly :=
[
  term ((-3982761803301478400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3982761803301478400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1991380901650739200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((1991380901650739200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0643_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0643
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0644 : Poly :=
[
  term ((434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 644 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0644 : Poly :=
[
  term ((868452760721342720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((868452760721342720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0644_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0644
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0645 : Poly :=
[
  term ((183087049471318249808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0645 : Poly :=
[
  term ((366174098942636499616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-183087049471318249808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-183087049471318249808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((366174098942636499616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0645_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0645
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0646 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 646 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0646 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 5), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0646_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0646
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0647 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 647 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0647 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0647_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0647
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0648 : Poly :=
[
  term ((-125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 648 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0648 : Poly :=
[
  term ((-251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0648_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0648
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0649 : Poly :=
[
  term ((335538566642336960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 649 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0649 : Poly :=
[
  term ((671077133284673920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((671077133284673920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-335538566642336960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-335538566642336960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0649_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0649
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0650 : Poly :=
[
  term ((114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 650 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0650 : Poly :=
[
  term ((228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0650_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0650
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0651 : Poly :=
[
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 651 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0651 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0651_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0651
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0652 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0652 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0652_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0652
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0653 : Poly :=
[
  term ((-53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 653 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0653 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0653_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0653
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0654 : Poly :=
[
  term ((-3534103271760140800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 654 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0654 : Poly :=
[
  term ((-7068206543520281600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7068206543520281600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3534103271760140800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((3534103271760140800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0654_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0654
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0655 : Poly :=
[
  term ((2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 655 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0655 : Poly :=
[
  term ((5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0655_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0655
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0656 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 656 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0656 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0656_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0656
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0657 : Poly :=
[
  term ((-736198906480576000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 657 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0657 : Poly :=
[
  term ((-1472397812961152000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((736198906480576000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((736198906480576000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1472397812961152000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0657_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0657
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0658 : Poly :=
[
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0658 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0658_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0658
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0659 : Poly :=
[
  term ((2180898793986859520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0659 : Poly :=
[
  term ((4361797587973719040 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4361797587973719040 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2180898793986859520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2180898793986859520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0659_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0659
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0660 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0660 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0660_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0660
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0661 : Poly :=
[
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 661 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0661 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0661_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0661
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0662 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 662 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0662 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0662_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0662
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0663 : Poly :=
[
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 663 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0663 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0663_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0663
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0664 : Poly :=
[
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 664 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0664 : Poly :=
[
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0664_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0664
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0665 : Poly :=
[
  term ((-239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 665 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0665 : Poly :=
[
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0665_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0665
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0666 : Poly :=
[
  term ((-872659614026428680842 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 666 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0666 : Poly :=
[
  term ((-1745319228052857361684 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1745319228052857361684 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((872659614026428680842 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((872659614026428680842 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0666_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0666
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0667 : Poly :=
[
  term ((53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 667 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0667 : Poly :=
[
  term ((107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 1), (14, 3), (16, 1)],
  term ((107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0667_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0667
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0668 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0668 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 4), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0668_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0668
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0669 : Poly :=
[
  term ((-599931732624144468212 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 669 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0669 : Poly :=
[
  term ((-1199863465248288936424 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((599931732624144468212 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((599931732624144468212 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1199863465248288936424 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0669_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0669
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0670 : Poly :=
[
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 670 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0670 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0670_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0670
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0671 : Poly :=
[
  term ((1641478075805461116607 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0671 : Poly :=
[
  term ((3282956151610922233214 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3282956151610922233214 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1641478075805461116607 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1641478075805461116607 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0671_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0671
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0672 : Poly :=
[
  term ((11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 672 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0672 : Poly :=
[
  term ((22599271408000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((22599271408000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0672_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0672
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0673 : Poly :=
[
  term ((2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 673 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0673 : Poly :=
[
  term ((5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0673_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0673
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0674 : Poly :=
[
  term ((2310147444834880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0674 : Poly :=
[
  term ((4620294889669760 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4620294889669760 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2310147444834880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2310147444834880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0674_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0674
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0675 : Poly :=
[
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 675 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0675 : Poly :=
[
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 2), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0675_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0675
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0676 : Poly :=
[
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0676 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0676_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0676
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0677 : Poly :=
[
  term ((-53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0677 : Poly :=
[
  term ((-106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0677_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0677
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0678 : Poly :=
[
  term ((28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 678 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0678 : Poly :=
[
  term ((56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0678_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0678
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0679 : Poly :=
[
  term ((49343906859167200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 679 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0679 : Poly :=
[
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-49343906859167200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-49343906859167200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0679_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0679
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0680 : Poly :=
[
  term ((-28292240494641481010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 680 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0680 : Poly :=
[
  term ((-56584480989282962020 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-56584480989282962020 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((28292240494641481010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((28292240494641481010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0680_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0680
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0681 : Poly :=
[
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 681 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0681 : Poly :=
[
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0681_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0681
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0682 : Poly :=
[
  term ((-1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 682 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0682 : Poly :=
[
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (14, 2), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0682_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0682
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0683 : Poly :=
[
  term ((-75891309524486400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 683 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0683 : Poly :=
[
  term ((-151782619048972800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((75891309524486400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((75891309524486400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-151782619048972800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0683_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0683
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0684 : Poly :=
[
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 684 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0684 : Poly :=
[
  term ((-11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0684_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0684
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0685 : Poly :=
[
  term ((22416778003649416908 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 685 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0685 : Poly :=
[
  term ((44833556007298833816 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22416778003649416908 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-22416778003649416908 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((44833556007298833816 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0685_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0685
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0686 : Poly :=
[
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0686 : Poly :=
[
  term ((13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0686_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0686
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0687 : Poly :=
[
  term ((923364962017480640 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0687 : Poly :=
[
  term ((1846729924034961280 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1846729924034961280 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-923364962017480640 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-923364962017480640 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0687_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0687
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0688 : Poly :=
[
  term ((-1441763889824439440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 688 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0688 : Poly :=
[
  term ((-2883527779648878880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2883527779648878880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1441763889824439440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1441763889824439440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0688_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0688
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0689 : Poly :=
[
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 689 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0689 : Poly :=
[
  term ((188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0689_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0689
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0690 : Poly :=
[
  term ((-67228787328281600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 690 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0690 : Poly :=
[
  term ((-134457574656563200 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-134457574656563200 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((67228787328281600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((67228787328281600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0690_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0690
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0691 : Poly :=
[
  term ((1697959217438019200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 691 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0691 : Poly :=
[
  term ((3395918434876038400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3395918434876038400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1697959217438019200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1697959217438019200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0691_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0691
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0692 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

/-- Partial product 692 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0692 : Poly :=
[
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (14, 2), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0692_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0692
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0693 : Poly :=
[
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 693 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0693 : Poly :=
[
  term ((-513176631335338880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-513176631335338880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0693_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0693
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0694 : Poly :=
[
  term ((74642659609159471532 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0694 : Poly :=
[
  term ((149285319218318943064 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74642659609159471532 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-74642659609159471532 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((149285319218318943064 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0694_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0694
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0695 : Poly :=
[
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 695 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0695 : Poly :=
[
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 5), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0695_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0695
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0696 : Poly :=
[
  term ((907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 696 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0696 : Poly :=
[
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0696_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0696
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0697 : Poly :=
[
  term ((149464208163551458838 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 697 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0697 : Poly :=
[
  term ((298928416327102917676 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((298928416327102917676 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149464208163551458838 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-149464208163551458838 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0697_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0697
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0698 : Poly :=
[
  term ((-720421040143841120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 698 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0698 : Poly :=
[
  term ((-1440842080287682240 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1440842080287682240 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((720421040143841120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((720421040143841120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0698_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0698
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0699 : Poly :=
[
  term ((49252852842128351132 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 699 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0699 : Poly :=
[
  term ((98505705684256702264 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((98505705684256702264 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49252852842128351132 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-49252852842128351132 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0699_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0699
        rs_R010_ueqv_R010YNN_generator_27_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_27_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_27_0600_0699 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_27_0600,
  rs_R010_ueqv_R010YNN_partial_27_0601,
  rs_R010_ueqv_R010YNN_partial_27_0602,
  rs_R010_ueqv_R010YNN_partial_27_0603,
  rs_R010_ueqv_R010YNN_partial_27_0604,
  rs_R010_ueqv_R010YNN_partial_27_0605,
  rs_R010_ueqv_R010YNN_partial_27_0606,
  rs_R010_ueqv_R010YNN_partial_27_0607,
  rs_R010_ueqv_R010YNN_partial_27_0608,
  rs_R010_ueqv_R010YNN_partial_27_0609,
  rs_R010_ueqv_R010YNN_partial_27_0610,
  rs_R010_ueqv_R010YNN_partial_27_0611,
  rs_R010_ueqv_R010YNN_partial_27_0612,
  rs_R010_ueqv_R010YNN_partial_27_0613,
  rs_R010_ueqv_R010YNN_partial_27_0614,
  rs_R010_ueqv_R010YNN_partial_27_0615,
  rs_R010_ueqv_R010YNN_partial_27_0616,
  rs_R010_ueqv_R010YNN_partial_27_0617,
  rs_R010_ueqv_R010YNN_partial_27_0618,
  rs_R010_ueqv_R010YNN_partial_27_0619,
  rs_R010_ueqv_R010YNN_partial_27_0620,
  rs_R010_ueqv_R010YNN_partial_27_0621,
  rs_R010_ueqv_R010YNN_partial_27_0622,
  rs_R010_ueqv_R010YNN_partial_27_0623,
  rs_R010_ueqv_R010YNN_partial_27_0624,
  rs_R010_ueqv_R010YNN_partial_27_0625,
  rs_R010_ueqv_R010YNN_partial_27_0626,
  rs_R010_ueqv_R010YNN_partial_27_0627,
  rs_R010_ueqv_R010YNN_partial_27_0628,
  rs_R010_ueqv_R010YNN_partial_27_0629,
  rs_R010_ueqv_R010YNN_partial_27_0630,
  rs_R010_ueqv_R010YNN_partial_27_0631,
  rs_R010_ueqv_R010YNN_partial_27_0632,
  rs_R010_ueqv_R010YNN_partial_27_0633,
  rs_R010_ueqv_R010YNN_partial_27_0634,
  rs_R010_ueqv_R010YNN_partial_27_0635,
  rs_R010_ueqv_R010YNN_partial_27_0636,
  rs_R010_ueqv_R010YNN_partial_27_0637,
  rs_R010_ueqv_R010YNN_partial_27_0638,
  rs_R010_ueqv_R010YNN_partial_27_0639,
  rs_R010_ueqv_R010YNN_partial_27_0640,
  rs_R010_ueqv_R010YNN_partial_27_0641,
  rs_R010_ueqv_R010YNN_partial_27_0642,
  rs_R010_ueqv_R010YNN_partial_27_0643,
  rs_R010_ueqv_R010YNN_partial_27_0644,
  rs_R010_ueqv_R010YNN_partial_27_0645,
  rs_R010_ueqv_R010YNN_partial_27_0646,
  rs_R010_ueqv_R010YNN_partial_27_0647,
  rs_R010_ueqv_R010YNN_partial_27_0648,
  rs_R010_ueqv_R010YNN_partial_27_0649,
  rs_R010_ueqv_R010YNN_partial_27_0650,
  rs_R010_ueqv_R010YNN_partial_27_0651,
  rs_R010_ueqv_R010YNN_partial_27_0652,
  rs_R010_ueqv_R010YNN_partial_27_0653,
  rs_R010_ueqv_R010YNN_partial_27_0654,
  rs_R010_ueqv_R010YNN_partial_27_0655,
  rs_R010_ueqv_R010YNN_partial_27_0656,
  rs_R010_ueqv_R010YNN_partial_27_0657,
  rs_R010_ueqv_R010YNN_partial_27_0658,
  rs_R010_ueqv_R010YNN_partial_27_0659,
  rs_R010_ueqv_R010YNN_partial_27_0660,
  rs_R010_ueqv_R010YNN_partial_27_0661,
  rs_R010_ueqv_R010YNN_partial_27_0662,
  rs_R010_ueqv_R010YNN_partial_27_0663,
  rs_R010_ueqv_R010YNN_partial_27_0664,
  rs_R010_ueqv_R010YNN_partial_27_0665,
  rs_R010_ueqv_R010YNN_partial_27_0666,
  rs_R010_ueqv_R010YNN_partial_27_0667,
  rs_R010_ueqv_R010YNN_partial_27_0668,
  rs_R010_ueqv_R010YNN_partial_27_0669,
  rs_R010_ueqv_R010YNN_partial_27_0670,
  rs_R010_ueqv_R010YNN_partial_27_0671,
  rs_R010_ueqv_R010YNN_partial_27_0672,
  rs_R010_ueqv_R010YNN_partial_27_0673,
  rs_R010_ueqv_R010YNN_partial_27_0674,
  rs_R010_ueqv_R010YNN_partial_27_0675,
  rs_R010_ueqv_R010YNN_partial_27_0676,
  rs_R010_ueqv_R010YNN_partial_27_0677,
  rs_R010_ueqv_R010YNN_partial_27_0678,
  rs_R010_ueqv_R010YNN_partial_27_0679,
  rs_R010_ueqv_R010YNN_partial_27_0680,
  rs_R010_ueqv_R010YNN_partial_27_0681,
  rs_R010_ueqv_R010YNN_partial_27_0682,
  rs_R010_ueqv_R010YNN_partial_27_0683,
  rs_R010_ueqv_R010YNN_partial_27_0684,
  rs_R010_ueqv_R010YNN_partial_27_0685,
  rs_R010_ueqv_R010YNN_partial_27_0686,
  rs_R010_ueqv_R010YNN_partial_27_0687,
  rs_R010_ueqv_R010YNN_partial_27_0688,
  rs_R010_ueqv_R010YNN_partial_27_0689,
  rs_R010_ueqv_R010YNN_partial_27_0690,
  rs_R010_ueqv_R010YNN_partial_27_0691,
  rs_R010_ueqv_R010YNN_partial_27_0692,
  rs_R010_ueqv_R010YNN_partial_27_0693,
  rs_R010_ueqv_R010YNN_partial_27_0694,
  rs_R010_ueqv_R010YNN_partial_27_0695,
  rs_R010_ueqv_R010YNN_partial_27_0696,
  rs_R010_ueqv_R010YNN_partial_27_0697,
  rs_R010_ueqv_R010YNN_partial_27_0698,
  rs_R010_ueqv_R010YNN_partial_27_0699
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_27_0600_0699 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 3), (16, 1)],
  term ((-63099182208563200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((27341031691904000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3954584026427829760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((38277444368665600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-13670515845952000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((5468206338380800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-4077618669041397760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-10936412676761600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((27341031691904000 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1977292013213914880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((1977292013213914880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (14, 2), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-4066869669540697600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3990263026881205760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-407875675415613440 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5526517568226726400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2033434834770348800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-407875675415613440 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((6023697861651554560 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 5), (16, 1)],
  term ((1579005019493350400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4066869669540697600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 4), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 4), (16, 1)],
  term ((-1995131513440602880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((203937837707806720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 3), (15, 2), (16, 1)],
  term ((-47868345123737600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 3), (16, 1)],
  term ((203937837707806720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1995131513440602880 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (14, 2), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2626853521778483200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-509417058634588160 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3677594930489876480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1313426760889241600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (14, 3), (16, 1)],
  term ((-1822843819523829760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 4), (16, 1)],
  term ((-1050741408711393280 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2626853521778483200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 3), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 3), (16, 1)],
  term ((254708529317294080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (14, 3), (15, 1), (16, 1)],
  term ((254708529317294080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (14, 3), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-123387396383736435008 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3111719710081817318 : Rat) / 53898264945705951) [(5, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3111719710081817318 : Rat) / 53898264945705951) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2201145740515820834 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-123387396383736435008 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((70758565991587085938 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4402291481031641668 : Rat) / 149717402626960975) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1555859855040908659 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((61693698191868217504 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((1555859855040908659 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((61693698191868217504 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 3), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5838430460837766400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((503655633418125440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-941378059153154560 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2919215230418883200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1293762942737216000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((7452115931182012160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((2587525885474432000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5838430460837766400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-251827816709062720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3589319794820587520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-251827816709062720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3982761803301478400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3982761803301478400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1991380901650739200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (14, 3), (16, 1)],
  term ((1991380901650739200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((366174098942636499616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((868452760721342720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((671077133284673920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-251706091589624593808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3039584662524699520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-183087049471318249808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-434226380360671360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((228260822084871553808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32094694482266617808 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 5), (16, 1)],
  term ((868452760721342720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((366174098942636499616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 4), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((-335538566642336960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (14, 3), (15, 2), (16, 1)],
  term ((125853045794812296904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (14, 3), (16, 1)],
  term ((-114130411042435776904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-335538566642336960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7068206543520281600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7068206543520281600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3534103271760140800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((53317499064990720 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 3), (16, 1)],
  term ((3534103271760140800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1472397812961152000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((4361797587973719040 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18195511224670151680 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((736198906480576000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-2676272726546836480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((6570394307415447040 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((5352545453093672960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1472397812961152000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-2180898793986859520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((-2180898793986859520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 2), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1745319228052857361684 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1745319228052857361684 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((872659614026428680842 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((239233201442576815958 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (14, 3), (16, 1)],
  term ((872659614026428680842 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1199863465248288936424 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3282956151610922233214 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1744024643971861518782 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((599931732624144468212 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-53664165917604821854 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 1), (14, 3), (16, 1)],
  term ((203310053979334225514 : Rat) / 53898264945705951) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 4), (16, 1)],
  term ((107328331835209643708 : Rat) / 89830441576176585) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1199863465248288936424 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1641478075805461116607 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1641478075805461116607 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((22599271408000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((4620294889669760 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2884441691125702400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-11299635704000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-2842859037118674560 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((22599271408000000 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((5768883382251404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2310147444834880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2310147444834880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 2), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56584480989282962020 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((56056405835012135620 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((53381345851563994660 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-56584480989282962020 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((53677409292718997860 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-106762691703127989320 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49343906859167200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((28292240494641481010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-28028202917506067810 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 3), (16, 1)],
  term ((28292240494641481010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-49343906859167200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 4), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (14, 2), (16, 1)],
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 3), (16, 1)],
  term ((1087916934630400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((44833556007298833816 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-151782619048972800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2883527779648878880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1846729924034961280 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2074403852608420480 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22416778003649416908 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((75891309524486400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-273839196524066724172 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-151782619048972800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((44833556007298833816 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11134913350500020480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-923364962017480640 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1441763889824439440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-923364962017480640 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((1441763889824439440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3395918434876038400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-134457574656563200 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-134457574656563200 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3395918434876038400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((67228787328281600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1697959217438019200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((67228787328281600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 3), (16, 1)],
  term ((-1697959217438019200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (14, 2), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 2), (15, 1), (16, 1)],
  term ((149285319218318943064 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-513176631335338880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1440842080287682240 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((98505705684256702264 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((298928416327102917676 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((298928416327102917676 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((690814696028340800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-74642659609159471532 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((98505705684256702264 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12295967957372391948 : Rat) / 149717402626960975) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 5), (16, 1)],
  term ((-513176631335338880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((149285319218318943064 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 4), (16, 1)],
  term ((-149464208163551458838 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((720421040143841120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-49252852842128351132 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)],
  term ((-149464208163551458838 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 3), (16, 1)],
  term ((-49252852842128351132 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((720421040143841120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 600 through 699. -/
theorem rs_R010_ueqv_R010YNN_block_27_0600_0699_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_27_0600_0699
      rs_R010_ueqv_R010YNN_block_27_0600_0699 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
