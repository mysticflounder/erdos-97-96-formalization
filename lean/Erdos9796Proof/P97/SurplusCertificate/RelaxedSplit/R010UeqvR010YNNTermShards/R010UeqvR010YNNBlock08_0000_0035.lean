/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 8:0-35

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_08_0000_0035 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0000 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0000 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0000
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0001 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0001 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0001
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0002 : Poly :=
[
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0002 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0002
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0003 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0003 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0003
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0004 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0004 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0004
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0005 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 5 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0005 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (4, 2), (5, 1), (9, 2), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 3), (9, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 2), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0005
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0006 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 6 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0006 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 3), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0006
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0007 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0007 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 3), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0007
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0008 : Poly :=
[
  term ((10027133066185147768 : Rat) / 449152207880882925) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 8 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0008 : Poly :=
[
  term ((20054266132370295536 : Rat) / 449152207880882925) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-20054266132370295536 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-10027133066185147768 : Rat) / 449152207880882925) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((10027133066185147768 : Rat) / 449152207880882925) [(1, 1), (5, 1), (16, 1)],
  term ((-10027133066185147768 : Rat) / 449152207880882925) [(1, 1), (5, 3), (16, 1)],
  term ((20054266132370295536 : Rat) / 449152207880882925) [(1, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0008
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0009 : Poly :=
[
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0009 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (4, 2), (5, 2), (9, 1), (16, 1)],
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 4), (9, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0009
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0010 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0010 : Poly :=
[
  term ((4228645478400 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0010
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0011 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 11 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0011 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0011
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0012 : Poly :=
[
  term ((16056347969312000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0012 : Poly :=
[
  term ((32112695938624000 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-32112695938624000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((32112695938624000 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16056347969312000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((16056347969312000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16056347969312000 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0012
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0013 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0013 : Poly :=
[
  term ((6448371121561600 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0013
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0014 : Poly :=
[
  term ((1694477953235200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0014 : Poly :=
[
  term ((3388955906470400 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3388955906470400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1694477953235200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1694477953235200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1694477953235200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0014
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0015 : Poly :=
[
  term ((-1057161369600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 15 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0015 : Poly :=
[
  term ((-2114322739200 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((1057161369600 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1057161369600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((1057161369600 : Rat) / 5988696105078439) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0015
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0016 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0016 : Poly :=
[
  term ((10018138818652160 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0016
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0017 : Poly :=
[
  term ((-2504534704663040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0017 : Poly :=
[
  term ((-5009069409326080 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((2504534704663040 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2504534704663040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((2504534704663040 : Rat) / 5988696105078439) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0017
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0018 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 18 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0018 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0018
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0019 : Poly :=
[
  term ((20263449869393920 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0019 : Poly :=
[
  term ((40526899738787840 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-40526899738787840 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((40526899738787840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((-20263449869393920 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((20263449869393920 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-20263449869393920 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0019
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0020 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0020 : Poly :=
[
  term ((4750053127536640 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0020
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0021 : Poly :=
[
  term ((14919640100915200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0021 : Poly :=
[
  term ((29839280201830400 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-14919640100915200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((14919640100915200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14919640100915200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0021
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0022 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0022 : Poly :=
[
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0022
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0023 : Poly :=
[
  term ((434664188152364720 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 23 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0023 : Poly :=
[
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(5, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0023
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0024 : Poly :=
[
  term ((-25590982860182940944 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0024 : Poly :=
[
  term ((-51181965720365881888 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((51181965720365881888 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-51181965720365881888 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((25590982860182940944 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-25590982860182940944 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)],
  term ((25590982860182940944 : Rat) / 1347456623642648775) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0024
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0025 : Poly :=
[
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 25 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0025 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0025
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0026 : Poly :=
[
  term ((2656445158278805168 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0026 : Poly :=
[
  term ((5312890316557610336 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-5312890316557610336 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((5312890316557610336 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((-2656445158278805168 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((2656445158278805168 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)],
  term ((-2656445158278805168 : Rat) / 1347456623642648775) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0026
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0027 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0027 : Poly :=
[
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0027
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0028 : Poly :=
[
  term ((-5189506778810986712 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0028 : Poly :=
[
  term ((-10379013557621973424 : Rat) / 449152207880882925) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((10379013557621973424 : Rat) / 449152207880882925) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-10379013557621973424 : Rat) / 449152207880882925) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((5189506778810986712 : Rat) / 449152207880882925) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-5189506778810986712 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)],
  term ((5189506778810986712 : Rat) / 449152207880882925) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0028
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0029 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0029 : Poly :=
[
  term ((-824473105066198016 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 4), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0029
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0030 : Poly :=
[
  term ((206118276266549504 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0030 : Poly :=
[
  term ((412236552533099008 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((-206118276266549504 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((206118276266549504 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-206118276266549504 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0030
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0031 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 31 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0031 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0031
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0032 : Poly :=
[
  term ((-2733244221941598464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0032 : Poly :=
[
  term ((-5466488443883196928 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((5466488443883196928 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5466488443883196928 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((2733244221941598464 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2733244221941598464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((2733244221941598464 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0032
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0033 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0033 : Poly :=
[
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 4), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0033
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0034 : Poly :=
[
  term ((-1507914263823100672 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0034 : Poly :=
[
  term ((-3015828527646201344 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3015828527646201344 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3015828527646201344 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((1507914263823100672 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1507914263823100672 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1507914263823100672 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0034
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 8. -/
def rs_R010_ueqv_R010YNN_coefficient_08_0035 : Poly :=
[
  term (-1 : Rat) [(16, 1)]
]

/-- Partial product 35 for generator 8. -/
def rs_R010_ueqv_R010YNN_partial_08_0035 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (5, 1), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)],
  term (1 : Rat) [(5, 2), (16, 1)],
  term (-1 : Rat) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 8. -/
theorem rs_R010_ueqv_R010YNN_partial_08_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_08_0035
        rs_R010_ueqv_R010YNN_generator_08_0000_0035 =
      rs_R010_ueqv_R010YNN_partial_08_0035 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_08_0000_0035 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_08_0000,
  rs_R010_ueqv_R010YNN_partial_08_0001,
  rs_R010_ueqv_R010YNN_partial_08_0002,
  rs_R010_ueqv_R010YNN_partial_08_0003,
  rs_R010_ueqv_R010YNN_partial_08_0004,
  rs_R010_ueqv_R010YNN_partial_08_0005,
  rs_R010_ueqv_R010YNN_partial_08_0006,
  rs_R010_ueqv_R010YNN_partial_08_0007,
  rs_R010_ueqv_R010YNN_partial_08_0008,
  rs_R010_ueqv_R010YNN_partial_08_0009,
  rs_R010_ueqv_R010YNN_partial_08_0010,
  rs_R010_ueqv_R010YNN_partial_08_0011,
  rs_R010_ueqv_R010YNN_partial_08_0012,
  rs_R010_ueqv_R010YNN_partial_08_0013,
  rs_R010_ueqv_R010YNN_partial_08_0014,
  rs_R010_ueqv_R010YNN_partial_08_0015,
  rs_R010_ueqv_R010YNN_partial_08_0016,
  rs_R010_ueqv_R010YNN_partial_08_0017,
  rs_R010_ueqv_R010YNN_partial_08_0018,
  rs_R010_ueqv_R010YNN_partial_08_0019,
  rs_R010_ueqv_R010YNN_partial_08_0020,
  rs_R010_ueqv_R010YNN_partial_08_0021,
  rs_R010_ueqv_R010YNN_partial_08_0022,
  rs_R010_ueqv_R010YNN_partial_08_0023,
  rs_R010_ueqv_R010YNN_partial_08_0024,
  rs_R010_ueqv_R010YNN_partial_08_0025,
  rs_R010_ueqv_R010YNN_partial_08_0026,
  rs_R010_ueqv_R010YNN_partial_08_0027,
  rs_R010_ueqv_R010YNN_partial_08_0028,
  rs_R010_ueqv_R010YNN_partial_08_0029,
  rs_R010_ueqv_R010YNN_partial_08_0030,
  rs_R010_ueqv_R010YNN_partial_08_0031,
  rs_R010_ueqv_R010YNN_partial_08_0032,
  rs_R010_ueqv_R010YNN_partial_08_0033,
  rs_R010_ueqv_R010YNN_partial_08_0034,
  rs_R010_ueqv_R010YNN_partial_08_0035
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_08_0000_0035 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((20054266132370295536 : Rat) / 449152207880882925) [(0, 1), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-20054266132370295536 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((32112695938624000 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((40526899738787840 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51181965720365881888 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((5312890316557610336 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10379013557621973424 : Rat) / 449152207880882925) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5466488443883196928 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3015828527646201344 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32112695938624000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32112695938624000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-40526899738787840 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-40526899738787840 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((51181965720365881888 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5312890316557610336 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((18399977091129745664 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((5466488443883196928 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5466488443883196928 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 4), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (4, 2), (5, 1), (9, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (10, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (14, 1), (16, 1)],
  term ((-10027133066185147768 : Rat) / 449152207880882925) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (4, 2), (5, 2), (9, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((9128828650423381918 : Rat) / 449152207880882925) [(1, 1), (5, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((32112695938624000 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((40526899738787840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-51181965720365881888 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((5312890316557610336 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10379013557621973424 : Rat) / 449152207880882925) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1232679425648321024 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5466488443883196928 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3015828527646201344 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 3), (9, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 3), (10, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 3), (14, 1), (16, 1)],
  term ((-10027133066185147768 : Rat) / 449152207880882925) [(1, 1), (5, 3), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 4), (9, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (14, 1), (16, 1)],
  term ((20054266132370295536 : Rat) / 449152207880882925) [(1, 2), (5, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16056347969312000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1694477953235200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1057161369600 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((2504534704663040 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-20263449869393920 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14919640100915200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((25590982860182940944 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2656445158278805168 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((5189506778810986712 : Rat) / 449152207880882925) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-206118276266549504 : Rat) / 89830441576176585) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2733244221941598464 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1507914263823100672 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((16056347969312000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1694477953235200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1057161369600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2504534704663040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((20263449869393920 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((14919640100915200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25590982860182940944 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((2656445158278805168 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5189506778810986712 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((206118276266549504 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2733244221941598464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1507914263823100672 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(5, 2), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16056347969312000 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1694477953235200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1057161369600 : Rat) / 5988696105078439) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((2504534704663040 : Rat) / 5988696105078439) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-20263449869393920 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14919640100915200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 3), (10, 1), (15, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(5, 3), (11, 1), (14, 1), (16, 1)],
  term ((25590982860182940944 : Rat) / 1347456623642648775) [(5, 3), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((-2656445158278805168 : Rat) / 1347456623642648775) [(5, 3), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((5189506778810986712 : Rat) / 449152207880882925) [(5, 3), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 4), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-206118276266549504 : Rat) / 89830441576176585) [(5, 4), (9, 1), (11, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2733244221941598464 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 4), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1507914263823100672 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 0 through 35. -/
theorem rs_R010_ueqv_R010YNN_block_08_0000_0035_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_08_0000_0035
      rs_R010_ueqv_R010YNN_block_08_0000_0035 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
