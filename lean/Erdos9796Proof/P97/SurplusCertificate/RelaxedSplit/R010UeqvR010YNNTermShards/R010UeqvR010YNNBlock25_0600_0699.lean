/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0600 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 600 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0600 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0600_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0600
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0601 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 601 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0601 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0601_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0601
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0602 : Poly :=
[
  term ((-92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 602 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0602 : Poly :=
[
  term ((-185614000677670400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0602_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0602
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0603 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0603 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0603_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0603
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0604 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 604 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0604 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0604_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0604
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0605 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 605 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0605 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0605_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0605
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0606 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 606 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0606 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0606_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0606
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0607 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0607 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0607_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0607
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0608 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 608 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0608 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0608_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0608
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0609 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 609 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0609 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0609_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0609
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0610 : Poly :=
[
  term ((-134570150491311040 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0610 : Poly :=
[
  term ((-269140300982622080 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((134570150491311040 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0610_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0610
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0611 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 611 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0611 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0611_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0611
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0612 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0612 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0612_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0612
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0613 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0613 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0613_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0613
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0614 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 614 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0614 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0614_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0614
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0615 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 615 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0615 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0615_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0615
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0616 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 616 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0616 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0616_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0616
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0617 : Poly :=
[
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 617 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0617 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0617_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0617
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0618 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 618 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0618 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0618_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0618
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0619 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 619 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0619 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0619_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0619
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0620 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 620 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0620 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0620_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0620
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0621 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0621 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0621_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0621
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0622 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 622 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0622 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0622_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0622
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0623 : Poly :=
[
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 623 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0623 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0623_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0623
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0624 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0624 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0624_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0624
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0625 : Poly :=
[
  term ((-9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 625 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0625 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0625_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0625
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0626 : Poly :=
[
  term ((-27564546455777408 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 626 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0626 : Poly :=
[
  term ((-55129092911554816 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0626_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0626
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0627 : Poly :=
[
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0627 : Poly :=
[
  term ((-1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0627_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0627
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0628 : Poly :=
[
  term ((-1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 628 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0628 : Poly :=
[
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0628_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0628
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0629 : Poly :=
[
  term ((-870888013407246208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 629 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0629 : Poly :=
[
  term ((-1741776026814492416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((870888013407246208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0629_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0629
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0630 : Poly :=
[
  term ((179508982757479552 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0630 : Poly :=
[
  term ((359017965514959104 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-179508982757479552 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0630_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0630
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0631 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 631 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0631 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0631_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0631
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0632 : Poly :=
[
  term ((-4364240517382291744 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 632 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0632 : Poly :=
[
  term ((4364240517382291744 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-8728481034764583488 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0632_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0632
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0633 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0633 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0633_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0633
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0634 : Poly :=
[
  term ((213058300879169054288 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 634 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0634 : Poly :=
[
  term ((426116601758338108576 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-213058300879169054288 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0634_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0634
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0635 : Poly :=
[
  term ((11265958864075557664 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 635 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0635 : Poly :=
[
  term ((22531917728151115328 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11265958864075557664 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0635_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0635
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0636 : Poly :=
[
  term ((-211490816664100428368 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 636 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0636 : Poly :=
[
  term ((-422981633328200856736 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((211490816664100428368 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0636_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0636
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0637 : Poly :=
[
  term ((11421670796186112704 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 637 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0637 : Poly :=
[
  term ((22843341592372225408 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-11421670796186112704 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0637_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0637
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0638 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 638 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0638 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0638_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0638
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0639 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0639 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0639_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0639
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0640 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0640 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0640_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0640
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0641 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 641 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0641 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0641_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0641
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0642 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 642 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0642 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0642_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0642
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0643 : Poly :=
[
  term ((7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0643 : Poly :=
[
  term ((14308929339564061184 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0643_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0643
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0644 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 644 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0644 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0644_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0644
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0645 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0645 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0645_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0645
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0646 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 646 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0646 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0646_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0646
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0647 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 647 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0647 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0647_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0647
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0648 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 648 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0648 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0648_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0648
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0649 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0649 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0649_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0649
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0650 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 650 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0650 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0650_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0650
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0651 : Poly :=
[
  term ((-107588533212485598608 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 651 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0651 : Poly :=
[
  term ((-215177066424971197216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((107588533212485598608 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0651_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0651
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0652 : Poly :=
[
  term ((-112176734249960903242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0652 : Poly :=
[
  term ((-224353468499921806484 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((112176734249960903242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0652_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0652
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0653 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 653 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0653 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0653_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0653
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0654 : Poly :=
[
  term ((2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 654 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0654 : Poly :=
[
  term ((5011248423342626432 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0654_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0654
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0655 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 655 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0655 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0655_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0655
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0656 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 656 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0656 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0656_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0656
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0657 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 657 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0657 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0657_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0657
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0658 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 658 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0658 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0658_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0658
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0659 : Poly :=
[
  term (4 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0659 : Poly :=
[
  term (-4 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0659_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0659
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0660 : Poly :=
[
  term (-4 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 660 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0660 : Poly :=
[
  term (-8 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0660_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0660
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0661 : Poly :=
[
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 661 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0661 : Poly :=
[
  term (-4 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0661_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0661
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0662 : Poly :=
[
  term (2 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 662 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0662 : Poly :=
[
  term (4 : Rat) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0662_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0662
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0663 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 663 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0663 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0663_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0663
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0664 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 664 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0664 : Poly :=
[
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0664_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0664
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0665 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 665 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0665 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0665_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0665
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0666 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 666 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0666 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0666_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0666
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0667 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 667 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0667 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0667_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0667
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0668 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 668 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0668 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0668_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0668
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0669 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 669 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0669 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0669_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0669
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0670 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 670 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0670 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0670_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0670
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0671 : Poly :=
[
  term ((-2331693580767353200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0671 : Poly :=
[
  term ((-4663387161534706400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2331693580767353200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0671_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0671
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0672 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (16, 1)]
]

/-- Partial product 672 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0672 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (12, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0672_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0672
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0673 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0673 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0673_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0673
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0674 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 674 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0674 : Poly :=
[
  term ((101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0674_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0674
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0675 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 675 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0675 : Poly :=
[
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0675_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0675
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0676 : Poly :=
[
  term ((250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 676 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0676 : Poly :=
[
  term ((501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0676_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0676
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0677 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0677 : Poly :=
[
  term ((2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0677_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0677
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0678 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 678 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0678 : Poly :=
[
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0678_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0678
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0679 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 679 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0679 : Poly :=
[
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0679_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0679
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0680 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 680 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0680 : Poly :=
[
  term ((8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0680_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0680
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0681 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 681 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0681 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0681_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0681
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0682 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 682 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0682 : Poly :=
[
  term ((103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0682_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0682
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0683 : Poly :=
[
  term (4 : Rat) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 683 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0683 : Poly :=
[
  term (8 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0683_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0683
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0684 : Poly :=
[
  term (-8 : Rat) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 684 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0684 : Poly :=
[
  term (-16 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0684_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0684
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0685 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 685 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0685 : Poly :=
[
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0685_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0685
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0686 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 686 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0686 : Poly :=
[
  term ((11779099177210697728 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0686_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0686
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0687 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 687 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0687 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0687_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0687
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0688 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 688 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0688 : Poly :=
[
  term ((-101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0688_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0688
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0689 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 689 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0689 : Poly :=
[
  term ((250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0689_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0689
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0690 : Poly :=
[
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0690 : Poly :=
[
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0690_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0690
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0691 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 691 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0691 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0691_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0691
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0692 : Poly :=
[
  term ((2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0692 : Poly :=
[
  term ((4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0692_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0692
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0693 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 693 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0693 : Poly :=
[
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0693_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0693
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0694 : Poly :=
[
  term ((7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 694 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0694 : Poly :=
[
  term ((14811927865666629632 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0694_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0694
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0695 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 695 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0695 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0695_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0695
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0696 : Poly :=
[
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 696 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0696 : Poly :=
[
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0696_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0696
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0697 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 697 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0697 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0697_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0697
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0698 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 698 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0698 : Poly :=
[
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0698_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0698
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0699 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 699 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0699 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0699_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0699
        rs_R010_ueqv_R010YNN_generator_25_0600_0699 =
      rs_R010_ueqv_R010YNN_partial_25_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_0600_0699 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_0600,
  rs_R010_ueqv_R010YNN_partial_25_0601,
  rs_R010_ueqv_R010YNN_partial_25_0602,
  rs_R010_ueqv_R010YNN_partial_25_0603,
  rs_R010_ueqv_R010YNN_partial_25_0604,
  rs_R010_ueqv_R010YNN_partial_25_0605,
  rs_R010_ueqv_R010YNN_partial_25_0606,
  rs_R010_ueqv_R010YNN_partial_25_0607,
  rs_R010_ueqv_R010YNN_partial_25_0608,
  rs_R010_ueqv_R010YNN_partial_25_0609,
  rs_R010_ueqv_R010YNN_partial_25_0610,
  rs_R010_ueqv_R010YNN_partial_25_0611,
  rs_R010_ueqv_R010YNN_partial_25_0612,
  rs_R010_ueqv_R010YNN_partial_25_0613,
  rs_R010_ueqv_R010YNN_partial_25_0614,
  rs_R010_ueqv_R010YNN_partial_25_0615,
  rs_R010_ueqv_R010YNN_partial_25_0616,
  rs_R010_ueqv_R010YNN_partial_25_0617,
  rs_R010_ueqv_R010YNN_partial_25_0618,
  rs_R010_ueqv_R010YNN_partial_25_0619,
  rs_R010_ueqv_R010YNN_partial_25_0620,
  rs_R010_ueqv_R010YNN_partial_25_0621,
  rs_R010_ueqv_R010YNN_partial_25_0622,
  rs_R010_ueqv_R010YNN_partial_25_0623,
  rs_R010_ueqv_R010YNN_partial_25_0624,
  rs_R010_ueqv_R010YNN_partial_25_0625,
  rs_R010_ueqv_R010YNN_partial_25_0626,
  rs_R010_ueqv_R010YNN_partial_25_0627,
  rs_R010_ueqv_R010YNN_partial_25_0628,
  rs_R010_ueqv_R010YNN_partial_25_0629,
  rs_R010_ueqv_R010YNN_partial_25_0630,
  rs_R010_ueqv_R010YNN_partial_25_0631,
  rs_R010_ueqv_R010YNN_partial_25_0632,
  rs_R010_ueqv_R010YNN_partial_25_0633,
  rs_R010_ueqv_R010YNN_partial_25_0634,
  rs_R010_ueqv_R010YNN_partial_25_0635,
  rs_R010_ueqv_R010YNN_partial_25_0636,
  rs_R010_ueqv_R010YNN_partial_25_0637,
  rs_R010_ueqv_R010YNN_partial_25_0638,
  rs_R010_ueqv_R010YNN_partial_25_0639,
  rs_R010_ueqv_R010YNN_partial_25_0640,
  rs_R010_ueqv_R010YNN_partial_25_0641,
  rs_R010_ueqv_R010YNN_partial_25_0642,
  rs_R010_ueqv_R010YNN_partial_25_0643,
  rs_R010_ueqv_R010YNN_partial_25_0644,
  rs_R010_ueqv_R010YNN_partial_25_0645,
  rs_R010_ueqv_R010YNN_partial_25_0646,
  rs_R010_ueqv_R010YNN_partial_25_0647,
  rs_R010_ueqv_R010YNN_partial_25_0648,
  rs_R010_ueqv_R010YNN_partial_25_0649,
  rs_R010_ueqv_R010YNN_partial_25_0650,
  rs_R010_ueqv_R010YNN_partial_25_0651,
  rs_R010_ueqv_R010YNN_partial_25_0652,
  rs_R010_ueqv_R010YNN_partial_25_0653,
  rs_R010_ueqv_R010YNN_partial_25_0654,
  rs_R010_ueqv_R010YNN_partial_25_0655,
  rs_R010_ueqv_R010YNN_partial_25_0656,
  rs_R010_ueqv_R010YNN_partial_25_0657,
  rs_R010_ueqv_R010YNN_partial_25_0658,
  rs_R010_ueqv_R010YNN_partial_25_0659,
  rs_R010_ueqv_R010YNN_partial_25_0660,
  rs_R010_ueqv_R010YNN_partial_25_0661,
  rs_R010_ueqv_R010YNN_partial_25_0662,
  rs_R010_ueqv_R010YNN_partial_25_0663,
  rs_R010_ueqv_R010YNN_partial_25_0664,
  rs_R010_ueqv_R010YNN_partial_25_0665,
  rs_R010_ueqv_R010YNN_partial_25_0666,
  rs_R010_ueqv_R010YNN_partial_25_0667,
  rs_R010_ueqv_R010YNN_partial_25_0668,
  rs_R010_ueqv_R010YNN_partial_25_0669,
  rs_R010_ueqv_R010YNN_partial_25_0670,
  rs_R010_ueqv_R010YNN_partial_25_0671,
  rs_R010_ueqv_R010YNN_partial_25_0672,
  rs_R010_ueqv_R010YNN_partial_25_0673,
  rs_R010_ueqv_R010YNN_partial_25_0674,
  rs_R010_ueqv_R010YNN_partial_25_0675,
  rs_R010_ueqv_R010YNN_partial_25_0676,
  rs_R010_ueqv_R010YNN_partial_25_0677,
  rs_R010_ueqv_R010YNN_partial_25_0678,
  rs_R010_ueqv_R010YNN_partial_25_0679,
  rs_R010_ueqv_R010YNN_partial_25_0680,
  rs_R010_ueqv_R010YNN_partial_25_0681,
  rs_R010_ueqv_R010YNN_partial_25_0682,
  rs_R010_ueqv_R010YNN_partial_25_0683,
  rs_R010_ueqv_R010YNN_partial_25_0684,
  rs_R010_ueqv_R010YNN_partial_25_0685,
  rs_R010_ueqv_R010YNN_partial_25_0686,
  rs_R010_ueqv_R010YNN_partial_25_0687,
  rs_R010_ueqv_R010YNN_partial_25_0688,
  rs_R010_ueqv_R010YNN_partial_25_0689,
  rs_R010_ueqv_R010YNN_partial_25_0690,
  rs_R010_ueqv_R010YNN_partial_25_0691,
  rs_R010_ueqv_R010YNN_partial_25_0692,
  rs_R010_ueqv_R010YNN_partial_25_0693,
  rs_R010_ueqv_R010YNN_partial_25_0694,
  rs_R010_ueqv_R010YNN_partial_25_0695,
  rs_R010_ueqv_R010YNN_partial_25_0696,
  rs_R010_ueqv_R010YNN_partial_25_0697,
  rs_R010_ueqv_R010YNN_partial_25_0698,
  rs_R010_ueqv_R010YNN_partial_25_0699
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_0600_0699 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-185614000677670400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((134570150491311040 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1741776026814492416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7714969840467456 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((870888013407246208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-179508982757479552 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((426116601758338108576 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((22531917728151115328 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((220516371646219264 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((62121506248812851104 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-8728481034764583488 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (12, 2), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-213058300879169054288 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11265958864075557664 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((211490816664100428368 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-11421670796186112704 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((14308929339564061184 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((-7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-215177066424971197216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-414056407761420654484 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((107588533212485598608 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((112176734249960903242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((5011248423342626432 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((-2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 2), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((2331693580767353200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (12, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11779099177210697728 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14811927865666629632 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 600 through 699. -/
theorem rs_R010_ueqv_R010YNN_block_25_0600_0699_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_0600_0699
      rs_R010_ueqv_R010YNN_block_25_0600_0699 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
