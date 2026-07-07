/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 0:0-71

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 0 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_00_0000_0071 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0000 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0000 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 3), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0000
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0001 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0001 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0001
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0002 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0002 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0002
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0003 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0003 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0003
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0004 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0004 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0004
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0005 : Poly :=
[
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0005 : Poly :=
[
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 3), (11, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0005
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0006 : Poly :=
[
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0006 : Poly :=
[
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (13, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (13, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0006
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0007 : Poly :=
[
  term ((-109199122142063392 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0007 : Poly :=
[
  term ((-109199122142063392 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((109199122142063392 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((109199122142063392 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((-109199122142063392 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0007
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0008 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0008 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0008
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0009 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0009 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0009
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0010 : Poly :=
[
  term ((-487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 10 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0010 : Poly :=
[
  term ((-487455068154207920 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((487455068154207920 : Rat) / 17966088315235317) [(1, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 3), (10, 1), (16, 1)],
  term ((-487455068154207920 : Rat) / 17966088315235317) [(1, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0010
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0011 : Poly :=
[
  term ((-217332094076182360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 11 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0011 : Poly :=
[
  term ((-217332094076182360 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((217332094076182360 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((217332094076182360 : Rat) / 53898264945705951) [(1, 1), (5, 3), (16, 1)],
  term ((-217332094076182360 : Rat) / 53898264945705951) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0011
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0012 : Poly :=
[
  term ((-12744511005900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 12 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0012 : Poly :=
[
  term ((-12744511005900800 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-12744511005900800 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((12744511005900800 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((12744511005900800 : Rat) / 53898264945705951) [(4, 3), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0012
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0013 : Poly :=
[
  term ((-39130868727534771244 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0013 : Poly :=
[
  term ((-39130868727534771244 : Rat) / 449152207880882925) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-39130868727534771244 : Rat) / 449152207880882925) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((39130868727534771244 : Rat) / 449152207880882925) [(4, 1), (5, 3), (9, 1), (16, 1)],
  term ((39130868727534771244 : Rat) / 449152207880882925) [(4, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0013
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0014 : Poly :=
[
  term ((40537898132444160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0014 : Poly :=
[
  term ((40537898132444160 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((40537898132444160 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-40537898132444160 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-40537898132444160 : Rat) / 5988696105078439) [(4, 3), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0014
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0015 : Poly :=
[
  term ((-529359115785973760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 15 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0015 : Poly :=
[
  term ((-529359115785973760 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-529359115785973760 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((529359115785973760 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 3), (16, 1)],
  term ((529359115785973760 : Rat) / 53898264945705951) [(4, 3), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0015
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0016 : Poly :=
[
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0016 : Poly :=
[
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 3), (11, 1), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(4, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0016
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0017 : Poly :=
[
  term ((10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0017 : Poly :=
[
  term ((10496983477856839744 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 4), (9, 1), (11, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(4, 3), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0017
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0018 : Poly :=
[
  term ((-17218508793518395264 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 18 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0018 : Poly :=
[
  term ((-17218508793518395264 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-17218508793518395264 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((17218508793518395264 : Rat) / 269491324728529755) [(4, 1), (5, 4), (9, 2), (16, 1)],
  term ((17218508793518395264 : Rat) / 269491324728529755) [(4, 3), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0018
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0019 : Poly :=
[
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0019 : Poly :=
[
  term ((316170936483744002 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(4, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 3), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0019
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0020 : Poly :=
[
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0020 : Poly :=
[
  term ((-316170936483744002 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(4, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0020
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0021 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 21 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0021 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 3), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0021
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0022 : Poly :=
[
  term ((1623332831137222078 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 22 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0022 : Poly :=
[
  term ((1623332831137222078 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((1623332831137222078 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1623332831137222078 : Rat) / 53898264945705951) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1623332831137222078 : Rat) / 53898264945705951) [(5, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0022
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0023 : Poly :=
[
  term ((158085468241872001 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 23 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0023 : Poly :=
[
  term ((158085468241872001 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((158085468241872001 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-158085468241872001 : Rat) / 53898264945705951) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-158085468241872001 : Rat) / 53898264945705951) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0023
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0024 : Poly :=
[
  term ((-1599406843955200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0024 : Poly :=
[
  term ((-1599406843955200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1599406843955200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0024
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0025 : Poly :=
[
  term ((6397627375820800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 25 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0025 : Poly :=
[
  term ((6397627375820800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((6397627375820800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-6397627375820800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-6397627375820800 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0025
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0026 : Poly :=
[
  term ((-3667402127777541920 : Rat) / 161694794837117853) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 26 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0026 : Poly :=
[
  term ((-3667402127777541920 : Rat) / 161694794837117853) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3667402127777541920 : Rat) / 161694794837117853) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((3667402127777541920 : Rat) / 161694794837117853) [(4, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((3667402127777541920 : Rat) / 161694794837117853) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0026
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0027 : Poly :=
[
  term ((-25822395891998720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0027 : Poly :=
[
  term ((-25822395891998720 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-25822395891998720 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((25822395891998720 : Rat) / 17966088315235317) [(4, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((25822395891998720 : Rat) / 17966088315235317) [(5, 3), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0027
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0028 : Poly :=
[
  term ((6455598972999680 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0028 : Poly :=
[
  term ((6455598972999680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((6455598972999680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0028
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0029 : Poly :=
[
  term ((-583674339759823258876 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0029 : Poly :=
[
  term ((-583674339759823258876 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-583674339759823258876 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((583674339759823258876 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((583674339759823258876 : Rat) / 4042369870927946325) [(5, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0029
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0030 : Poly :=
[
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0030 : Poly :=
[
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0030
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0031 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0031 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0031
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0032 : Poly :=
[
  term ((13350881148147200 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0032 : Poly :=
[
  term ((13350881148147200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((13350881148147200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13350881148147200 : Rat) / 17966088315235317) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13350881148147200 : Rat) / 17966088315235317) [(5, 3), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0032
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0033 : Poly :=
[
  term ((-67398833692288000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 33 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0033 : Poly :=
[
  term ((-67398833692288000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0033
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0034 : Poly :=
[
  term ((393722051927581115032 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 34 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0034 : Poly :=
[
  term ((393722051927581115032 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((393722051927581115032 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-393722051927581115032 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-393722051927581115032 : Rat) / 4042369870927946325) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0034
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0035 : Poly :=
[
  term ((16046833516985600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0035 : Poly :=
[
  term ((16046833516985600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((16046833516985600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16046833516985600 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16046833516985600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0035
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0036 : Poly :=
[
  term ((-20838711080633600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0036 : Poly :=
[
  term ((-20838711080633600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20838711080633600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((20838711080633600 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((20838711080633600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0036
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0037 : Poly :=
[
  term ((16862394359507200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 37 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0037 : Poly :=
[
  term ((16862394359507200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((16862394359507200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-16862394359507200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-16862394359507200 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0037
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0038 : Poly :=
[
  term ((1339324255341998306 : Rat) / 449152207880882925) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 38 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0038 : Poly :=
[
  term ((1339324255341998306 : Rat) / 449152207880882925) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((1339324255341998306 : Rat) / 449152207880882925) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-1339324255341998306 : Rat) / 449152207880882925) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-1339324255341998306 : Rat) / 449152207880882925) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0038
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0039 : Poly :=
[
  term ((-8344358714639360 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 39 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0039 : Poly :=
[
  term ((-8344358714639360 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8344358714639360 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((8344358714639360 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((8344358714639360 : Rat) / 5988696105078439) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0039
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0040 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 40 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0040 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0040
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0041 : Poly :=
[
  term ((-191551958908011520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0041 : Poly :=
[
  term ((-191551958908011520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-191551958908011520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((191551958908011520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((191551958908011520 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0041
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0042 : Poly :=
[
  term ((-5699389910556160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0042 : Poly :=
[
  term ((-5699389910556160 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5699389910556160 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((5699389910556160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((5699389910556160 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0042
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0043 : Poly :=
[
  term ((-2277362472573440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 43 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0043 : Poly :=
[
  term ((-2277362472573440 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2277362472573440 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2277362472573440 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2277362472573440 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0043
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0044 : Poly :=
[
  term ((75404961457548800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0044 : Poly :=
[
  term ((75404961457548800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((75404961457548800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-75404961457548800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-75404961457548800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0044
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0045 : Poly :=
[
  term ((568092709623971840 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 45 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0045 : Poly :=
[
  term ((568092709623971840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((568092709623971840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-568092709623971840 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-568092709623971840 : Rat) / 53898264945705951) [(5, 3), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0045
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0046 : Poly :=
[
  term ((-35183089970309120 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 46 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0046 : Poly :=
[
  term ((-35183089970309120 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((-35183089970309120 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((35183089970309120 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((35183089970309120 : Rat) / 53898264945705951) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0046
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0047 : Poly :=
[
  term ((89248449765445144904 : Rat) / 4042369870927946325) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 47 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0047 : Poly :=
[
  term ((89248449765445144904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((89248449765445144904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-89248449765445144904 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-89248449765445144904 : Rat) / 4042369870927946325) [(5, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0047
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0048 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0048 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0048
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0049 : Poly :=
[
  term ((3331808330612543692 : Rat) / 449152207880882925) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0049 : Poly :=
[
  term ((3331808330612543692 : Rat) / 449152207880882925) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3331808330612543692 : Rat) / 449152207880882925) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3331808330612543692 : Rat) / 449152207880882925) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3331808330612543692 : Rat) / 449152207880882925) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0049
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0050 : Poly :=
[
  term ((3008325649715630824 : Rat) / 449152207880882925) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 50 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0050 : Poly :=
[
  term ((3008325649715630824 : Rat) / 449152207880882925) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((3008325649715630824 : Rat) / 449152207880882925) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0050
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0051 : Poly :=
[
  term ((-2109155666206370639 : Rat) / 149717402626960975) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0051 : Poly :=
[
  term ((-2109155666206370639 : Rat) / 149717402626960975) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-2109155666206370639 : Rat) / 149717402626960975) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((2109155666206370639 : Rat) / 149717402626960975) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((2109155666206370639 : Rat) / 149717402626960975) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0051
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0052 : Poly :=
[
  term ((43543053791478836993 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0052 : Poly :=
[
  term ((43543053791478836993 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((43543053791478836993 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-43543053791478836993 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-43543053791478836993 : Rat) / 1347456623642648775) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0052
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0053 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0053 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 4), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0053
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0054 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0054 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 4), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0054
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0055 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 55 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0055 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 4), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0055
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0056 : Poly :=
[
  term ((44083325160946720 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 56 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0056 : Poly :=
[
  term ((44083325160946720 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 17966088315235317) [(4, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 17966088315235317) [(5, 4), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0056
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0057 : Poly :=
[
  term ((-15516445794003136384 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 57 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0057 : Poly :=
[
  term ((-15516445794003136384 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-15516445794003136384 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((15516445794003136384 : Rat) / 269491324728529755) [(4, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((15516445794003136384 : Rat) / 269491324728529755) [(5, 4), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0057
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0058 : Poly :=
[
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0058 : Poly :=
[
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(4, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 4), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0058
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0059 : Poly :=
[
  term ((12911197945999360 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 59 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0059 : Poly :=
[
  term ((12911197945999360 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((12911197945999360 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-12911197945999360 : Rat) / 17966088315235317) [(4, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-12911197945999360 : Rat) / 17966088315235317) [(5, 4), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0059
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0060 : Poly :=
[
  term ((16685000687299580912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 60 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0060 : Poly :=
[
  term ((16685000687299580912 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((16685000687299580912 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((-16685000687299580912 : Rat) / 89830441576176585) [(4, 2), (5, 2), (8, 1), (16, 1)],
  term ((-16685000687299580912 : Rat) / 89830441576176585) [(5, 4), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0060
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0061 : Poly :=
[
  term ((1005819568134299904 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 61 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0061 : Poly :=
[
  term ((1005819568134299904 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1005819568134299904 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1005819568134299904 : Rat) / 29943480525392195) [(4, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1005819568134299904 : Rat) / 29943480525392195) [(5, 4), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0061
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0062 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 62 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0062 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 4), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0062
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0063 : Poly :=
[
  term ((-2999470209642552448 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0063 : Poly :=
[
  term ((-2999470209642552448 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2999470209642552448 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2999470209642552448 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2999470209642552448 : Rat) / 269491324728529755) [(5, 4), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0063
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0064 : Poly :=
[
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 64 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0064 : Poly :=
[
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0064
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0065 : Poly :=
[
  term ((-1453639515727749152 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 65 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0065 : Poly :=
[
  term ((-1453639515727749152 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1453639515727749152 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((1453639515727749152 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((1453639515727749152 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0065
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0066 : Poly :=
[
  term ((6181757199625459936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0066 : Poly :=
[
  term ((6181757199625459936 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((6181757199625459936 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6181757199625459936 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6181757199625459936 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0066
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0067 : Poly :=
[
  term ((18827139624928172288 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 67 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0067 : Poly :=
[
  term ((18827139624928172288 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((18827139624928172288 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-18827139624928172288 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-18827139624928172288 : Rat) / 269491324728529755) [(5, 4), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0067
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0068 : Poly :=
[
  term ((324295414548477504 : Rat) / 29943480525392195) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 68 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0068 : Poly :=
[
  term ((324295414548477504 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((324295414548477504 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-324295414548477504 : Rat) / 29943480525392195) [(4, 2), (5, 2), (9, 2), (16, 1)],
  term ((-324295414548477504 : Rat) / 29943480525392195) [(5, 4), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0068
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0069 : Poly :=
[
  term ((-43642039019857557838 : Rat) / 269491324728529755) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 69 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0069 : Poly :=
[
  term ((-43642039019857557838 : Rat) / 269491324728529755) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((-43642039019857557838 : Rat) / 269491324728529755) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((43642039019857557838 : Rat) / 269491324728529755) [(4, 2), (5, 2), (10, 1), (16, 1)],
  term ((43642039019857557838 : Rat) / 269491324728529755) [(5, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0069
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0070 : Poly :=
[
  term ((2485423510382607872 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 70 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0070 : Poly :=
[
  term ((2485423510382607872 : Rat) / 53898264945705951) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((2485423510382607872 : Rat) / 53898264945705951) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-2485423510382607872 : Rat) / 53898264945705951) [(4, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-2485423510382607872 : Rat) / 53898264945705951) [(5, 5), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0070
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 0. -/
def rs_R010_ueqv_R010YNN_coefficient_00_0071 : Poly :=
[
  term ((-3829728573514918976 : Rat) / 53898264945705951) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 71 for generator 0. -/
def rs_R010_ueqv_R010YNN_partial_00_0071 : Poly :=
[
  term ((-3829728573514918976 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-3829728573514918976 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((3829728573514918976 : Rat) / 53898264945705951) [(4, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((3829728573514918976 : Rat) / 53898264945705951) [(5, 5), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 0. -/
theorem rs_R010_ueqv_R010YNN_partial_00_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_00_0071
        rs_R010_ueqv_R010YNN_generator_00_0000_0071 =
      rs_R010_ueqv_R010YNN_partial_00_0071 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_00_0000_0071 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_00_0000,
  rs_R010_ueqv_R010YNN_partial_00_0001,
  rs_R010_ueqv_R010YNN_partial_00_0002,
  rs_R010_ueqv_R010YNN_partial_00_0003,
  rs_R010_ueqv_R010YNN_partial_00_0004,
  rs_R010_ueqv_R010YNN_partial_00_0005,
  rs_R010_ueqv_R010YNN_partial_00_0006,
  rs_R010_ueqv_R010YNN_partial_00_0007,
  rs_R010_ueqv_R010YNN_partial_00_0008,
  rs_R010_ueqv_R010YNN_partial_00_0009,
  rs_R010_ueqv_R010YNN_partial_00_0010,
  rs_R010_ueqv_R010YNN_partial_00_0011,
  rs_R010_ueqv_R010YNN_partial_00_0012,
  rs_R010_ueqv_R010YNN_partial_00_0013,
  rs_R010_ueqv_R010YNN_partial_00_0014,
  rs_R010_ueqv_R010YNN_partial_00_0015,
  rs_R010_ueqv_R010YNN_partial_00_0016,
  rs_R010_ueqv_R010YNN_partial_00_0017,
  rs_R010_ueqv_R010YNN_partial_00_0018,
  rs_R010_ueqv_R010YNN_partial_00_0019,
  rs_R010_ueqv_R010YNN_partial_00_0020,
  rs_R010_ueqv_R010YNN_partial_00_0021,
  rs_R010_ueqv_R010YNN_partial_00_0022,
  rs_R010_ueqv_R010YNN_partial_00_0023,
  rs_R010_ueqv_R010YNN_partial_00_0024,
  rs_R010_ueqv_R010YNN_partial_00_0025,
  rs_R010_ueqv_R010YNN_partial_00_0026,
  rs_R010_ueqv_R010YNN_partial_00_0027,
  rs_R010_ueqv_R010YNN_partial_00_0028,
  rs_R010_ueqv_R010YNN_partial_00_0029,
  rs_R010_ueqv_R010YNN_partial_00_0030,
  rs_R010_ueqv_R010YNN_partial_00_0031,
  rs_R010_ueqv_R010YNN_partial_00_0032,
  rs_R010_ueqv_R010YNN_partial_00_0033,
  rs_R010_ueqv_R010YNN_partial_00_0034,
  rs_R010_ueqv_R010YNN_partial_00_0035,
  rs_R010_ueqv_R010YNN_partial_00_0036,
  rs_R010_ueqv_R010YNN_partial_00_0037,
  rs_R010_ueqv_R010YNN_partial_00_0038,
  rs_R010_ueqv_R010YNN_partial_00_0039,
  rs_R010_ueqv_R010YNN_partial_00_0040,
  rs_R010_ueqv_R010YNN_partial_00_0041,
  rs_R010_ueqv_R010YNN_partial_00_0042,
  rs_R010_ueqv_R010YNN_partial_00_0043,
  rs_R010_ueqv_R010YNN_partial_00_0044,
  rs_R010_ueqv_R010YNN_partial_00_0045,
  rs_R010_ueqv_R010YNN_partial_00_0046,
  rs_R010_ueqv_R010YNN_partial_00_0047,
  rs_R010_ueqv_R010YNN_partial_00_0048,
  rs_R010_ueqv_R010YNN_partial_00_0049,
  rs_R010_ueqv_R010YNN_partial_00_0050,
  rs_R010_ueqv_R010YNN_partial_00_0051,
  rs_R010_ueqv_R010YNN_partial_00_0052,
  rs_R010_ueqv_R010YNN_partial_00_0053,
  rs_R010_ueqv_R010YNN_partial_00_0054,
  rs_R010_ueqv_R010YNN_partial_00_0055,
  rs_R010_ueqv_R010YNN_partial_00_0056,
  rs_R010_ueqv_R010YNN_partial_00_0057,
  rs_R010_ueqv_R010YNN_partial_00_0058,
  rs_R010_ueqv_R010YNN_partial_00_0059,
  rs_R010_ueqv_R010YNN_partial_00_0060,
  rs_R010_ueqv_R010YNN_partial_00_0061,
  rs_R010_ueqv_R010YNN_partial_00_0062,
  rs_R010_ueqv_R010YNN_partial_00_0063,
  rs_R010_ueqv_R010YNN_partial_00_0064,
  rs_R010_ueqv_R010YNN_partial_00_0065,
  rs_R010_ueqv_R010YNN_partial_00_0066,
  rs_R010_ueqv_R010YNN_partial_00_0067,
  rs_R010_ueqv_R010YNN_partial_00_0068,
  rs_R010_ueqv_R010YNN_partial_00_0069,
  rs_R010_ueqv_R010YNN_partial_00_0070,
  rs_R010_ueqv_R010YNN_partial_00_0071
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_00_0000_0071 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 2), (5, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 3), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-109199122142063392 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (13, 1), (16, 1)],
  term ((109199122142063392 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 3), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (13, 1), (16, 1)],
  term ((109199122142063392 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (15, 1), (16, 1)],
  term ((-487455068154207920 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-217332094076182360 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-12744511005900800 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-39130868727534771244 : Rat) / 449152207880882925) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((40537898132444160 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-529359115785973760 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-17218508793518395264 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((1623332831137222078 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((158085468241872001 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-1599406843955200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6397627375820800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-3667402127777541920 : Rat) / 161694794837117853) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-25822395891998720 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((6455598972999680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-583674339759823258876 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13350881148147200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((393722051927581115032 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((16046833516985600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20838711080633600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((16862394359507200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((1339324255341998306 : Rat) / 449152207880882925) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-8344358714639360 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-191551958908011520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5699389910556160 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2277362472573440 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((75404961457548800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((568092709623971840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-35183089970309120 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((89248449765445144904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((3331808330612543692 : Rat) / 449152207880882925) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3008325649715630824 : Rat) / 449152207880882925) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-2109155666206370639 : Rat) / 149717402626960975) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((43543053791478836993 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-15516445794003136384 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((12911197945999360 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((16685000687299580912 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((1005819568134299904 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2999470209642552448 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1453639515727749152 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((6181757199625459936 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((18827139624928172288 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((324295414548477504 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-43642039019857557838 : Rat) / 269491324728529755) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((2485423510382607872 : Rat) / 53898264945705951) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-3829728573514918976 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (1, 1), (5, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (16, 1)],
  term ((-109199122142063392 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((487455068154207920 : Rat) / 17966088315235317) [(1, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((217332094076182360 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((487455068154207920 : Rat) / 17966088315235317) [(1, 1), (5, 3), (10, 1), (16, 1)],
  term ((217332094076182360 : Rat) / 53898264945705951) [(1, 1), (5, 3), (16, 1)],
  term ((-12744511005900800 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-39130868727534771244 : Rat) / 449152207880882925) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((40537898132444160 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-529359115785973760 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((149457421392810238222 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((10496983477856839744 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-17218508793518395264 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((1623332831137222078 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((158085468241872001 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-1599406843955200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6397627375820800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-3667402127777541920 : Rat) / 161694794837117853) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-25822395891998720 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((6455598972999680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-583674339759823258876 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13350881148147200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((393722051927581115032 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((16046833516985600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20838711080633600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((16862394359507200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((1339324255341998306 : Rat) / 449152207880882925) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-8344358714639360 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-191551958908011520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5699389910556160 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2277362472573440 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((75404961457548800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((568092709623971840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-35183089970309120 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((89248449765445144904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((3331808330612543692 : Rat) / 449152207880882925) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3008325649715630824 : Rat) / 449152207880882925) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-2109155666206370639 : Rat) / 149717402626960975) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((43543053791478836993 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-15516445794003136384 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((12911197945999360 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((16685000687299580912 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((1005819568134299904 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2999470209642552448 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1453639515727749152 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((6181757199625459936 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((18827139624928172288 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((324295414548477504 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-43642039019857557838 : Rat) / 269491324728529755) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((2485423510382607872 : Rat) / 53898264945705951) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-3829728573514918976 : Rat) / 53898264945705951) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-487455068154207920 : Rat) / 17966088315235317) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-217332094076182360 : Rat) / 53898264945705951) [(1, 3), (5, 1), (16, 1)],
  term ((12744511005900800 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((39130868727534771244 : Rat) / 449152207880882925) [(4, 1), (5, 3), (9, 1), (16, 1)],
  term ((-40537898132444160 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((529359115785973760 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 3), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(4, 1), (5, 3), (11, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(4, 1), (5, 4), (9, 1), (11, 1), (16, 1)],
  term ((17218508793518395264 : Rat) / 269491324728529755) [(4, 1), (5, 4), (9, 2), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(4, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(4, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1623332831137222078 : Rat) / 53898264945705951) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-158085468241872001 : Rat) / 53898264945705951) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6397627375820800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((3667402127777541920 : Rat) / 161694794837117853) [(4, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((25822395891998720 : Rat) / 17966088315235317) [(4, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((583674339759823258876 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13350881148147200 : Rat) / 17966088315235317) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-393722051927581115032 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-16046833516985600 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((20838711080633600 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16862394359507200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1339324255341998306 : Rat) / 449152207880882925) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((8344358714639360 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((191551958908011520 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5699389910556160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((2277362472573440 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-75404961457548800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-568092709623971840 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((35183089970309120 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-89248449765445144904 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3331808330612543692 : Rat) / 449152207880882925) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((2109155666206370639 : Rat) / 149717402626960975) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-43543053791478836993 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 17966088315235317) [(4, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((15516445794003136384 : Rat) / 269491324728529755) [(4, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(4, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12911197945999360 : Rat) / 17966088315235317) [(4, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-16685000687299580912 : Rat) / 89830441576176585) [(4, 2), (5, 2), (8, 1), (16, 1)],
  term ((-1005819568134299904 : Rat) / 29943480525392195) [(4, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2999470209642552448 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1453639515727749152 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-6181757199625459936 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18827139624928172288 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-324295414548477504 : Rat) / 29943480525392195) [(4, 2), (5, 2), (9, 2), (16, 1)],
  term ((43642039019857557838 : Rat) / 269491324728529755) [(4, 2), (5, 2), (10, 1), (16, 1)],
  term ((-2485423510382607872 : Rat) / 53898264945705951) [(4, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((3829728573514918976 : Rat) / 53898264945705951) [(4, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((12744511005900800 : Rat) / 53898264945705951) [(4, 3), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((39130868727534771244 : Rat) / 449152207880882925) [(4, 3), (5, 1), (9, 1), (16, 1)],
  term ((-40537898132444160 : Rat) / 5988696105078439) [(4, 3), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((529359115785973760 : Rat) / 53898264945705951) [(4, 3), (5, 1), (9, 3), (16, 1)],
  term ((-149457421392810238222 : Rat) / 1347456623642648775) [(4, 3), (5, 1), (11, 1), (16, 1)],
  term ((-10496983477856839744 : Rat) / 269491324728529755) [(4, 3), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((17218508793518395264 : Rat) / 269491324728529755) [(4, 3), (5, 2), (9, 2), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 3), (6, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 3), (6, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 3), (7, 1), (8, 1), (16, 1)],
  term ((-1623332831137222078 : Rat) / 53898264945705951) [(5, 3), (7, 1), (10, 1), (16, 1)],
  term ((-158085468241872001 : Rat) / 53898264945705951) [(5, 3), (7, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6397627375820800 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((3667402127777541920 : Rat) / 161694794837117853) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((25822395891998720 : Rat) / 17966088315235317) [(5, 3), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(5, 3), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((583674339759823258876 : Rat) / 4042369870927946325) [(5, 3), (8, 1), (11, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13350881148147200 : Rat) / 17966088315235317) [(5, 3), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-393722051927581115032 : Rat) / 4042369870927946325) [(5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-16046833516985600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((20838711080633600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16862394359507200 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-1339324255341998306 : Rat) / 449152207880882925) [(5, 3), (9, 1), (16, 1)],
  term ((8344358714639360 : Rat) / 5988696105078439) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((191551958908011520 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5699389910556160 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((2277362472573440 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-75404961457548800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-568092709623971840 : Rat) / 53898264945705951) [(5, 3), (9, 3), (10, 1), (16, 1)],
  term ((35183089970309120 : Rat) / 53898264945705951) [(5, 3), (9, 3), (16, 1)],
  term ((-89248449765445144904 : Rat) / 4042369870927946325) [(5, 3), (10, 1), (11, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 3), (10, 1), (13, 1), (16, 1)],
  term ((-3331808330612543692 : Rat) / 449152207880882925) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 3), (11, 1), (16, 1)],
  term ((2109155666206370639 : Rat) / 149717402626960975) [(5, 3), (13, 1), (16, 1)],
  term ((-43543053791478836993 : Rat) / 1347456623642648775) [(5, 3), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 4), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 4), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 4), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 17966088315235317) [(5, 4), (7, 1), (9, 1), (16, 1)],
  term ((15516445794003136384 : Rat) / 269491324728529755) [(5, 4), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 4), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12911197945999360 : Rat) / 17966088315235317) [(5, 4), (8, 1), (9, 2), (16, 1)],
  term ((-16685000687299580912 : Rat) / 89830441576176585) [(5, 4), (8, 1), (16, 1)],
  term ((-1005819568134299904 : Rat) / 29943480525392195) [(5, 4), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 4), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2999470209642552448 : Rat) / 269491324728529755) [(5, 4), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)],
  term ((1453639515727749152 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (16, 1)],
  term ((-6181757199625459936 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)],
  term ((-18827139624928172288 : Rat) / 269491324728529755) [(5, 4), (9, 2), (10, 1), (16, 1)],
  term ((-324295414548477504 : Rat) / 29943480525392195) [(5, 4), (9, 2), (16, 1)],
  term ((43642039019857557838 : Rat) / 269491324728529755) [(5, 4), (10, 1), (16, 1)],
  term ((-2485423510382607872 : Rat) / 53898264945705951) [(5, 5), (8, 1), (9, 1), (16, 1)],
  term ((3829728573514918976 : Rat) / 53898264945705951) [(5, 5), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 0 through 71. -/
theorem rs_R010_ueqv_R010YNN_block_00_0000_0071_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_00_0000_0071
      rs_R010_ueqv_R010YNN_block_00_0000_0071 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
