/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 27:700-799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_27_0700_0799 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 700 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0700 : Poly :=
[
  term ((470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 700 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0700 : Poly :=
[
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0700_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0700
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0701 : Poly :=
[
  term ((-235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 701 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0701 : Poly :=
[
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0701_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0701
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0702 : Poly :=
[
  term ((185295396013020160 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 702 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0702 : Poly :=
[
  term ((370590792026040320 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((370590792026040320 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-185295396013020160 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-185295396013020160 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0702_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0702
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0703 : Poly :=
[
  term ((-22828422881098240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 703 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0703 : Poly :=
[
  term ((-45656845762196480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((22828422881098240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((22828422881098240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((-45656845762196480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0703_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0703
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0704 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 704 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0704 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0704_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0704
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0705 : Poly :=
[
  term ((611041995657853582832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 705 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0705 : Poly :=
[
  term ((1222083991315707165664 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-611041995657853582832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-611041995657853582832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1222083991315707165664 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0705_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0705
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0706 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 706 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0706 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0706_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0706
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0707 : Poly :=
[
  term ((18182172232672000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 707 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0707 : Poly :=
[
  term ((36364344465344000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((36364344465344000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18182172232672000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18182172232672000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0707_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0707
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0708 : Poly :=
[
  term ((-538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 708 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0708 : Poly :=
[
  term ((-1076964014574622720 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1076964014574622720 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0708_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0708
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0709 : Poly :=
[
  term ((51167886713108480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 709 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0709 : Poly :=
[
  term ((102335773426216960 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((102335773426216960 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51167886713108480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51167886713108480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0709_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0709
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0710 : Poly :=
[
  term ((304404431503052967416 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 710 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0710 : Poly :=
[
  term ((608808863006105934832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((608808863006105934832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-304404431503052967416 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-304404431503052967416 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0710_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0710
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0711 : Poly :=
[
  term ((-871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 711 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0711 : Poly :=
[
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0711_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0711
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0712 : Poly :=
[
  term ((-67093482838294881648 : Rat) / 149717402626960975) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 712 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0712 : Poly :=
[
  term ((-134186965676589763296 : Rat) / 149717402626960975) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((67093482838294881648 : Rat) / 149717402626960975) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((67093482838294881648 : Rat) / 149717402626960975) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((-134186965676589763296 : Rat) / 149717402626960975) [(5, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0712_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0712
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0713 : Poly :=
[
  term ((-3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 713 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0713 : Poly :=
[
  term ((-7360125403875097393984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((-7360125403875097393984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0713_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0713
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0714 : Poly :=
[
  term ((303949707794468087416 : Rat) / 269491324728529755) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 714 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0714 : Poly :=
[
  term ((607899415588936174832 : Rat) / 269491324728529755) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-303949707794468087416 : Rat) / 269491324728529755) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-303949707794468087416 : Rat) / 269491324728529755) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((607899415588936174832 : Rat) / 269491324728529755) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0714_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0714
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0715 : Poly :=
[
  term ((14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 715 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0715 : Poly :=
[
  term ((29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0715_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0715
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0716 : Poly :=
[
  term ((1840298541457198284496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 716 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0716 : Poly :=
[
  term ((3680597082914396568992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3680597082914396568992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1840298541457198284496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1840298541457198284496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0716_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0716
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0717 : Poly :=
[
  term ((-101517274964440690472 : Rat) / 89830441576176585) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 717 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0717 : Poly :=
[
  term ((-203034549928881380944 : Rat) / 89830441576176585) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-203034549928881380944 : Rat) / 89830441576176585) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((101517274964440690472 : Rat) / 89830441576176585) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((101517274964440690472 : Rat) / 89830441576176585) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0717_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0717
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0718 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 718 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0718 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0718_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0718
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0719 : Poly :=
[
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 719 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0719 : Poly :=
[
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0719_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0719
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0720 : Poly :=
[
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 720 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0720 : Poly :=
[
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0720_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0720
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0721 : Poly :=
[
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 721 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0721 : Poly :=
[
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 2), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0721_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0721
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0722 : Poly :=
[
  term ((63551921353625600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 722 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0722 : Poly :=
[
  term ((127103842707251200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((127103842707251200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0722_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0722
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0723 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 723 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0723 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0723_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0723
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0724 : Poly :=
[
  term ((1048319232750540800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 724 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0724 : Poly :=
[
  term ((2096638465501081600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1048319232750540800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1048319232750540800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2096638465501081600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0724_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0724
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0725 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 725 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0725 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0725_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0725
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0726 : Poly :=
[
  term ((158879803384064000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 726 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0726 : Poly :=
[
  term ((317759606768128000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((317759606768128000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-158879803384064000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-158879803384064000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0726_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0726
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0727 : Poly :=
[
  term ((-31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

/-- Partial product 727 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0727 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (14, 2), (16, 1)],
  term ((31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0727_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0727
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0728 : Poly :=
[
  term ((882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 728 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0728 : Poly :=
[
  term ((1764884360123637760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((1764884360123637760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0728_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0728
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0729 : Poly :=
[
  term ((-161037007720744960 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 729 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0729 : Poly :=
[
  term ((-322074015441489920 : Rat) / 17966088315235317) [(5, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((-322074015441489920 : Rat) / 17966088315235317) [(5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((161037007720744960 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((161037007720744960 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0729_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0729
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0730 : Poly :=
[
  term ((264285651735848960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 730 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0730 : Poly :=
[
  term ((528571303471697920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((528571303471697920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-264285651735848960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((-264285651735848960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0730_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0730
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0731 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 731 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0731 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0731_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0731
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0732 : Poly :=
[
  term ((358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

/-- Partial product 732 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0732 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (14, 2), (16, 1)],
  term ((-358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0732_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0732
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0733 : Poly :=
[
  term ((-717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 733 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0733 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 3), (16, 1)],
  term ((-1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0733_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0733
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0734 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 734 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0734 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 4), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0734_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0734
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0735 : Poly :=
[
  term ((1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)]
]

/-- Partial product 735 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0735 : Poly :=
[
  term ((3589319074384691200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 2), (16, 1)],
  term ((-1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((3589319074384691200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0735_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0735
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0736 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 736 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0736 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 1), (15, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0736_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0736
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0737 : Poly :=
[
  term ((-1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 737 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0737 : Poly :=
[
  term ((-3589319074384691200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3589319074384691200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (14, 2), (15, 1), (16, 1)],
  term ((1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0737_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0737
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0738 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 738 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0738 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0738_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0738
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0739 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 739 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0739 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0739_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0739
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0740 : Poly :=
[
  term ((-18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 740 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0740 : Poly :=
[
  term ((-36843510417362451632 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36843510417362451632 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0740_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0740
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0741 : Poly :=
[
  term ((-17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 741 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0741 : Poly :=
[
  term ((-35242340067813581372 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((-35242340067813581372 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0741_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0741
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0742 : Poly :=
[
  term ((925090292764479700309 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 742 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0742 : Poly :=
[
  term ((1850180585528959400618 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-925090292764479700309 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-925090292764479700309 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1850180585528959400618 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0742_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0742
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0743 : Poly :=
[
  term ((57154955643271116757 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 743 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0743 : Poly :=
[
  term ((114309911286542233514 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114309911286542233514 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57154955643271116757 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57154955643271116757 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0743_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0743
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0744 : Poly :=
[
  term ((31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 744 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0744 : Poly :=
[
  term ((62829310671200410168 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62829310671200410168 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0744_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0744
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0745 : Poly :=
[
  term ((23381966859282196472 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 745 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0745 : Poly :=
[
  term ((46763933718564392944 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((46763933718564392944 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23381966859282196472 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23381966859282196472 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0745_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0745
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0746 : Poly :=
[
  term ((974660057119105201171 : Rat) / 2694913247285297550) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 746 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0746 : Poly :=
[
  term ((974660057119105201171 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((974660057119105201171 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-974660057119105201171 : Rat) / 2694913247285297550) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-974660057119105201171 : Rat) / 2694913247285297550) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0746_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0746
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0747 : Poly :=
[
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 747 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0747 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0747_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0747
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0748 : Poly :=
[
  term ((-285121597609754401937 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 748 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0748 : Poly :=
[
  term ((-570243195219508803874 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((285121597609754401937 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((285121597609754401937 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((-570243195219508803874 : Rat) / 1347456623642648775) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0748_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0748
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0749 : Poly :=
[
  term ((-613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 749 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0749 : Poly :=
[
  term ((-1227932627633601643568 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1227932627633601643568 : Rat) / 449152207880882925) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0749_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0749
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0750 : Poly :=
[
  term ((646381074311538658639 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 750 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0750 : Poly :=
[
  term ((1292762148623077317278 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-646381074311538658639 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-646381074311538658639 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1292762148623077317278 : Rat) / 1347456623642648775) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0750_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0750
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0751 : Poly :=
[
  term ((-20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 751 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0751 : Poly :=
[
  term ((-40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0751_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0751
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0752 : Poly :=
[
  term ((876367604702037795884 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 752 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0752 : Poly :=
[
  term ((1752735209404075591768 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1752735209404075591768 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-876367604702037795884 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-876367604702037795884 : Rat) / 1347456623642648775) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0752_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0752
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0753 : Poly :=
[
  term ((-1628126592544979845463 : Rat) / 2694913247285297550) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 753 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0753 : Poly :=
[
  term ((-1628126592544979845463 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1628126592544979845463 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1628126592544979845463 : Rat) / 2694913247285297550) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((1628126592544979845463 : Rat) / 2694913247285297550) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0753_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0753
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0754 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 754 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0754 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0754_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0754
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0755 : Poly :=
[
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 755 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0755 : Poly :=
[
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0755_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0755
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0756 : Poly :=
[
  term ((422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 756 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0756 : Poly :=
[
  term ((844672304456715520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((844672304456715520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0756_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0756
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0757 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 757 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0757 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0757_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0757
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0758 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 758 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0758 : Poly :=
[
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0758_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0758
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0759 : Poly :=
[
  term ((32482450118592320 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 759 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0759 : Poly :=
[
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0759_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0759
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0760 : Poly :=
[
  term ((-148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0760 : Poly :=
[
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0760_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0760
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0761 : Poly :=
[
  term ((-931523542298206336 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 761 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0761 : Poly :=
[
  term ((-1863047084596412672 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1863047084596412672 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((931523542298206336 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((931523542298206336 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0761_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0761
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0762 : Poly :=
[
  term ((3223509687012969248 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 762 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0762 : Poly :=
[
  term ((6447019374025938496 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6447019374025938496 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3223509687012969248 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3223509687012969248 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0762_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0762
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0763 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 763 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0763 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0763_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0763
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0764 : Poly :=
[
  term ((6866920058341919488 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 764 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0764 : Poly :=
[
  term ((13733840116683838976 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6866920058341919488 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6866920058341919488 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((13733840116683838976 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0764_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0764
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0765 : Poly :=
[
  term ((-1551610409085096016 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 765 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0765 : Poly :=
[
  term ((-3103220818170192032 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1551610409085096016 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((1551610409085096016 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3103220818170192032 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0765_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0765
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0766 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 766 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0766 : Poly :=
[
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0766_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0766
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0767 : Poly :=
[
  term ((886131054086216768 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 767 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0767 : Poly :=
[
  term ((1772262108172433536 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1772262108172433536 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-886131054086216768 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-886131054086216768 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0767_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0767
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0768 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 768 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0768 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0768_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0768
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0769 : Poly :=
[
  term ((92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 769 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0769 : Poly :=
[
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0769_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0769
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0770 : Poly :=
[
  term ((34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 770 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0770 : Poly :=
[
  term ((68761256372732947456 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((68761256372732947456 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0770_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0770
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0771 : Poly :=
[
  term ((-34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 771 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0771 : Poly :=
[
  term ((-68196743995847462656 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-68196743995847462656 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 2), (16, 1)],
  term ((34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0771_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0771
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0772 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 772 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0772 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0772_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0772
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0773 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 773 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0773 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0773_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0773
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0774 : Poly :=
[
  term ((-74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 774 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0774 : Poly :=
[
  term ((-149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0774_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0774
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0775 : Poly :=
[
  term ((141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 775 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0775 : Poly :=
[
  term ((282472163121631584784 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((282472163121631584784 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (14, 2), (16, 1)],
  term ((-141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0775_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0775
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0776 : Poly :=
[
  term ((-343385901253690240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 776 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0776 : Poly :=
[
  term ((-686771802507380480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-686771802507380480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((343385901253690240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((343385901253690240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0776_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0776
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0777 : Poly :=
[
  term ((-5268956983535848064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 777 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0777 : Poly :=
[
  term ((-10537913967071696128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10537913967071696128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5268956983535848064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((5268956983535848064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0777_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0777
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0778 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 778 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0778 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0778_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0778
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0779 : Poly :=
[
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 779 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0779 : Poly :=
[
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0779_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0779
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0780 : Poly :=
[
  term ((16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 780 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0780 : Poly :=
[
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0780_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0780
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0781 : Poly :=
[
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 781 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0781 : Poly :=
[
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0781_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0781
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0782 : Poly :=
[
  term ((589984658069400607688 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 782 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0782 : Poly :=
[
  term ((1179969316138801215376 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-589984658069400607688 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-589984658069400607688 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1179969316138801215376 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0782_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0782
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0783 : Poly :=
[
  term ((30162275110121440 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 783 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0783 : Poly :=
[
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30162275110121440 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-30162275110121440 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0783_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0783
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0784 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 784 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0784 : Poly :=
[
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0784_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0784
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0785 : Poly :=
[
  term ((6838806623050568864 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 785 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0785 : Poly :=
[
  term ((13677613246101137728 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((13677613246101137728 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6838806623050568864 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-6838806623050568864 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0785_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0785
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0786 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 786 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0786 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0786_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0786
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0787 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 787 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0787 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0787_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0787
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0788 : Poly :=
[
  term ((-2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 788 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0788 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0788_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0788
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0789 : Poly :=
[
  term ((5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 789 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0789 : Poly :=
[
  term ((10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0789_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0789
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0790 : Poly :=
[
  term ((23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 790 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0790 : Poly :=
[
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0790_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0790
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0791 : Poly :=
[
  term ((-2600755723794336064 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 791 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0791 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2600755723794336064 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((2600755723794336064 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0791_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0791
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0792 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 792 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0792 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0792_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0792
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0793 : Poly :=
[
  term ((73299157042942679488 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 793 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0793 : Poly :=
[
  term ((146598314085885358976 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((146598314085885358976 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-73299157042942679488 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-73299157042942679488 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0793_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0793
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0794 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 794 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0794 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0794_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0794
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0795 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 795 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0795 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0795_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0795
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0796 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 796 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0796 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0796_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0796
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0797 : Poly :=
[
  term ((-74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 797 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0797 : Poly :=
[
  term ((-149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0797_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0797
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0798 : Poly :=
[
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 798 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0798 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0798_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0798
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0799 : Poly :=
[
  term ((-17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 799 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0799 : Poly :=
[
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0799_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0799
        rs_R010_ueqv_R010YNN_generator_27_0700_0799 =
      rs_R010_ueqv_R010YNN_partial_27_0799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_27_0700_0799 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_27_0700,
  rs_R010_ueqv_R010YNN_partial_27_0701,
  rs_R010_ueqv_R010YNN_partial_27_0702,
  rs_R010_ueqv_R010YNN_partial_27_0703,
  rs_R010_ueqv_R010YNN_partial_27_0704,
  rs_R010_ueqv_R010YNN_partial_27_0705,
  rs_R010_ueqv_R010YNN_partial_27_0706,
  rs_R010_ueqv_R010YNN_partial_27_0707,
  rs_R010_ueqv_R010YNN_partial_27_0708,
  rs_R010_ueqv_R010YNN_partial_27_0709,
  rs_R010_ueqv_R010YNN_partial_27_0710,
  rs_R010_ueqv_R010YNN_partial_27_0711,
  rs_R010_ueqv_R010YNN_partial_27_0712,
  rs_R010_ueqv_R010YNN_partial_27_0713,
  rs_R010_ueqv_R010YNN_partial_27_0714,
  rs_R010_ueqv_R010YNN_partial_27_0715,
  rs_R010_ueqv_R010YNN_partial_27_0716,
  rs_R010_ueqv_R010YNN_partial_27_0717,
  rs_R010_ueqv_R010YNN_partial_27_0718,
  rs_R010_ueqv_R010YNN_partial_27_0719,
  rs_R010_ueqv_R010YNN_partial_27_0720,
  rs_R010_ueqv_R010YNN_partial_27_0721,
  rs_R010_ueqv_R010YNN_partial_27_0722,
  rs_R010_ueqv_R010YNN_partial_27_0723,
  rs_R010_ueqv_R010YNN_partial_27_0724,
  rs_R010_ueqv_R010YNN_partial_27_0725,
  rs_R010_ueqv_R010YNN_partial_27_0726,
  rs_R010_ueqv_R010YNN_partial_27_0727,
  rs_R010_ueqv_R010YNN_partial_27_0728,
  rs_R010_ueqv_R010YNN_partial_27_0729,
  rs_R010_ueqv_R010YNN_partial_27_0730,
  rs_R010_ueqv_R010YNN_partial_27_0731,
  rs_R010_ueqv_R010YNN_partial_27_0732,
  rs_R010_ueqv_R010YNN_partial_27_0733,
  rs_R010_ueqv_R010YNN_partial_27_0734,
  rs_R010_ueqv_R010YNN_partial_27_0735,
  rs_R010_ueqv_R010YNN_partial_27_0736,
  rs_R010_ueqv_R010YNN_partial_27_0737,
  rs_R010_ueqv_R010YNN_partial_27_0738,
  rs_R010_ueqv_R010YNN_partial_27_0739,
  rs_R010_ueqv_R010YNN_partial_27_0740,
  rs_R010_ueqv_R010YNN_partial_27_0741,
  rs_R010_ueqv_R010YNN_partial_27_0742,
  rs_R010_ueqv_R010YNN_partial_27_0743,
  rs_R010_ueqv_R010YNN_partial_27_0744,
  rs_R010_ueqv_R010YNN_partial_27_0745,
  rs_R010_ueqv_R010YNN_partial_27_0746,
  rs_R010_ueqv_R010YNN_partial_27_0747,
  rs_R010_ueqv_R010YNN_partial_27_0748,
  rs_R010_ueqv_R010YNN_partial_27_0749,
  rs_R010_ueqv_R010YNN_partial_27_0750,
  rs_R010_ueqv_R010YNN_partial_27_0751,
  rs_R010_ueqv_R010YNN_partial_27_0752,
  rs_R010_ueqv_R010YNN_partial_27_0753,
  rs_R010_ueqv_R010YNN_partial_27_0754,
  rs_R010_ueqv_R010YNN_partial_27_0755,
  rs_R010_ueqv_R010YNN_partial_27_0756,
  rs_R010_ueqv_R010YNN_partial_27_0757,
  rs_R010_ueqv_R010YNN_partial_27_0758,
  rs_R010_ueqv_R010YNN_partial_27_0759,
  rs_R010_ueqv_R010YNN_partial_27_0760,
  rs_R010_ueqv_R010YNN_partial_27_0761,
  rs_R010_ueqv_R010YNN_partial_27_0762,
  rs_R010_ueqv_R010YNN_partial_27_0763,
  rs_R010_ueqv_R010YNN_partial_27_0764,
  rs_R010_ueqv_R010YNN_partial_27_0765,
  rs_R010_ueqv_R010YNN_partial_27_0766,
  rs_R010_ueqv_R010YNN_partial_27_0767,
  rs_R010_ueqv_R010YNN_partial_27_0768,
  rs_R010_ueqv_R010YNN_partial_27_0769,
  rs_R010_ueqv_R010YNN_partial_27_0770,
  rs_R010_ueqv_R010YNN_partial_27_0771,
  rs_R010_ueqv_R010YNN_partial_27_0772,
  rs_R010_ueqv_R010YNN_partial_27_0773,
  rs_R010_ueqv_R010YNN_partial_27_0774,
  rs_R010_ueqv_R010YNN_partial_27_0775,
  rs_R010_ueqv_R010YNN_partial_27_0776,
  rs_R010_ueqv_R010YNN_partial_27_0777,
  rs_R010_ueqv_R010YNN_partial_27_0778,
  rs_R010_ueqv_R010YNN_partial_27_0779,
  rs_R010_ueqv_R010YNN_partial_27_0780,
  rs_R010_ueqv_R010YNN_partial_27_0781,
  rs_R010_ueqv_R010YNN_partial_27_0782,
  rs_R010_ueqv_R010YNN_partial_27_0783,
  rs_R010_ueqv_R010YNN_partial_27_0784,
  rs_R010_ueqv_R010YNN_partial_27_0785,
  rs_R010_ueqv_R010YNN_partial_27_0786,
  rs_R010_ueqv_R010YNN_partial_27_0787,
  rs_R010_ueqv_R010YNN_partial_27_0788,
  rs_R010_ueqv_R010YNN_partial_27_0789,
  rs_R010_ueqv_R010YNN_partial_27_0790,
  rs_R010_ueqv_R010YNN_partial_27_0791,
  rs_R010_ueqv_R010YNN_partial_27_0792,
  rs_R010_ueqv_R010YNN_partial_27_0793,
  rs_R010_ueqv_R010YNN_partial_27_0794,
  rs_R010_ueqv_R010YNN_partial_27_0795,
  rs_R010_ueqv_R010YNN_partial_27_0796,
  rs_R010_ueqv_R010YNN_partial_27_0797,
  rs_R010_ueqv_R010YNN_partial_27_0798,
  rs_R010_ueqv_R010YNN_partial_27_0799
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_27_0700_0799 : Poly :=
[
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((370590792026040320 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((370590792026040320 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-470929192168422400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-185295396013020160 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((235464596084211200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 3), (16, 1)],
  term ((-185295396013020160 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1222083991315707165664 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-45656845762196480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((36364344465344000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-608773584916241920 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-611041995657853582832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((22828422881098240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((-203377629015406660944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((-45656845762196480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1222083991315707165664 : Rat) / 449152207880882925) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-18182172232672000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-18182172232672000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((-1076964014574622720 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((608808863006105934832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((102335773426216960 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((102335773426216960 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((608808863006105934832 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((538482007287311360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1076964014574622720 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-51167886713108480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-304404431503052967416 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-51167886713108480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (14, 3), (16, 1)],
  term ((-304404431503052967416 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((871286997628149760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7360125403875097393984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((607899415588936174832 : Rat) / 269491324728529755) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-134186965676589763296 : Rat) / 149717402626960975) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203034549928881380944 : Rat) / 89830441576176585) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3680597082914396568992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4284438428459050503824 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-303949707794468087416 : Rat) / 269491324728529755) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((67093482838294881648 : Rat) / 149717402626960975) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((-913053357581112230248 : Rat) / 269491324728529755) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((3680062701937548696992 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((-134186965676589763296 : Rat) / 149717402626960975) [(5, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14596935719726080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((607899415588936174832 : Rat) / 269491324728529755) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-7360490327268090545984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((29193871439452160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1840298541457198284496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((101517274964440690472 : Rat) / 89830441576176585) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1840298541457198284496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((101517274964440690472 : Rat) / 89830441576176585) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2220440722773647360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 2), (16, 1)],
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (14, 3), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2096638465501081600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((317759606768128000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-444863449475379200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1048319232750540800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-730559625982412800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((127103842707251200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2096638465501081600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-158879803384064000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-158879803384064000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (14, 2), (16, 1)],
  term ((31775960676812800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (15, 2), (16, 1)],
  term ((1764884360123637760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((528571303471697920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-322074015441489920 : Rat) / 17966088315235317) [(5, 1), (9, 3), (12, 1), (14, 2), (16, 1)],
  term ((-322074015441489920 : Rat) / 17966088315235317) [(5, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((528571303471697920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-882442180061818880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((1764884360123637760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((161037007720744960 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((-264285651735848960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((161037007720744960 : Rat) / 17966088315235317) [(5, 1), (9, 3), (14, 3), (16, 1)],
  term ((-264285651735848960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (14, 2), (16, 1)],
  term ((-358931907438469120 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3589319074384691200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3589319074384691200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5025046704138567680 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (14, 3), (16, 1)],
  term ((-1794659537192345600 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 4), (16, 1)],
  term ((-1435727629753876480 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3589319074384691200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 2), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 2), (15, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 1), (15, 3), (16, 1)],
  term ((1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (14, 2), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (14, 3), (15, 1), (16, 1)],
  term ((1794659537192345600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 3), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36843510417362451632 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-36843510417362451632 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (14, 3), (16, 1)],
  term ((18421755208681225816 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1850180585528959400618 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35242340067813581372 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((114309911286542233514 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-925090292764479700309 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((17621170033906790686 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((-162156076295587493359 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35242340067813581372 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1850180585528959400618 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-57154955643271116757 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57154955643271116757 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((62829310671200410168 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((974660057119105201171 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((46763933718564392944 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((46763933718564392944 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((974660057119105201171 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31414655335600205084 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62829310671200410168 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-23381966859282196472 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-974660057119105201171 : Rat) / 2694913247285297550) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-23381966859282196472 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((-974660057119105201171 : Rat) / 2694913247285297550) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1227932627633601643568 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1292762148623077317278 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-570243195219508803874 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1628126592544979845463 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1752735209404075591768 : Rat) / 1347456623642648775) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((135857120467588666247 : Rat) / 89830441576176585) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-646381074311538658639 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((285121597609754401937 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((-252723074095168722678 : Rat) / 149717402626960975) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((613966313816800821784 : Rat) / 449152207880882925) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-570243195219508803874 : Rat) / 1347456623642648775) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((20362790043448309444 : Rat) / 449152207880882925) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1292762148623077317278 : Rat) / 1347456623642648775) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1207569837590153334124 : Rat) / 449152207880882925) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-40725580086896618888 : Rat) / 449152207880882925) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-876367604702037795884 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((1628126592544979845463 : Rat) / 2694913247285297550) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-876367604702037795884 : Rat) / 1347456623642648775) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((1628126592544979845463 : Rat) / 2694913247285297550) [(5, 1), (15, 3), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((844672304456715520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10817851675528576192 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6447019374025938496 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1863047084596412672 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1863047084596412672 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6447019374025938496 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((148576934791013120 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((931523542298206336 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3223509687012969248 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((931523542298206336 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-3223509687012969248 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3103220818170192032 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13733840116683838976 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1772262108172433536 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5556519907763300608 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1551610409085096016 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6866920058341919488 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((25046418244448873776 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13733840116683838976 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3103220818170192032 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-886131054086216768 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-886131054086216768 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68196743995847462656 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((68761256372732947456 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((68761256372732947456 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-68196743995847462656 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-92892734587712000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 2), (16, 1)],
  term ((-34380628186366473728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 3), (16, 1)],
  term ((34098371997923731328 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((282472163121631584784 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((282472163121631584784 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (14, 2), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 3), (16, 1)],
  term ((-141236081560815792392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-10537913967071696128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-686771802507380480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-686771802507380480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10537913967071696128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((343385901253690240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((5268956983535848064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((343385901253690240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (14, 3), (16, 1)],
  term ((5268956983535848064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (14, 3), (16, 1)],
  term ((-16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((1179969316138801215376 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13677613246101137728 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-589984658069400607688 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13677613246101137728 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-212999285464713506456 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1179969316138801215376 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-30162275110121440 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6838806623050568864 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-30162275110121440 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-6838806623050568864 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (15, 4), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((146598314085885358976 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-36410580133120704896 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2600755723794336064 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((185609649942800399936 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-73299157042942679488 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((-73299157042942679488 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-458236903443264354092 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((74600965622782846082 : Rat) / 449152207880882925) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 700 through 799. -/
theorem rs_R010_ueqv_R010YNN_block_27_0700_0799_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_27_0700_0799
      rs_R010_ueqv_R010YNN_block_27_0700_0799 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
