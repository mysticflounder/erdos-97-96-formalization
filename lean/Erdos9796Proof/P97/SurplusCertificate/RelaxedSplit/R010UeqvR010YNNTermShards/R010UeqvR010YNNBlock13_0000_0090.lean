/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 13:0-90

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_13_0000_0090 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0000 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0000 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 2), (5, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0000
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0001 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0001 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0001
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0002 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0002 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (2, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (3, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (3, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0002
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0003 : Poly :=
[
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0003 : Poly :=
[
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0003
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0004 : Poly :=
[
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0004 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (2, 2), (5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0004
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0005 : Poly :=
[
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0005 : Poly :=
[
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0005
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0006 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0006 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (3, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (3, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0006
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0007 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0007 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0007
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0008 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 8 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0008 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (2, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (2, 2), (5, 1), (9, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (9, 2), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (3, 2), (5, 1), (9, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 2), (9, 2), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 2), (9, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0008
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0009 : Poly :=
[
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 9 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0009 : Poly :=
[
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (10, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (10, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (10, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0009
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0010 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0010 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0010
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0011 : Poly :=
[
  term ((15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 11 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0011 : Poly :=
[
  term ((-30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0011
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0012 : Poly :=
[
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0012 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (2, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (2, 2), (5, 2), (9, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 3), (9, 1), (16, 1)],
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (3, 2), (5, 2), (9, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0012
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0013 : Poly :=
[
  term ((-43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 13 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0013 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0013
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0014 : Poly :=
[
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0014 : Poly :=
[
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(2, 1), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-303537986071686178432 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-303537986071686178432 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0014
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0015 : Poly :=
[
  term ((40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0015 : Poly :=
[
  term ((-81933604408069120 : Rat) / 5988696105078439) [(2, 1), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(2, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-81933604408069120 : Rat) / 5988696105078439) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(3, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((81933604408069120 : Rat) / 5988696105078439) [(4, 1), (5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((81933604408069120 : Rat) / 5988696105078439) [(4, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0015
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0016 : Poly :=
[
  term ((-59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 16 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0016 : Poly :=
[
  term ((119611873204920320 : Rat) / 5988696105078439) [(2, 1), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(2, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(3, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 3), (16, 1)],
  term ((59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 3), (16, 1)],
  term ((-119611873204920320 : Rat) / 5988696105078439) [(4, 1), (5, 2), (7, 1), (9, 3), (16, 1)],
  term ((-119611873204920320 : Rat) / 5988696105078439) [(4, 2), (5, 1), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0016
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0017 : Poly :=
[
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0017 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 2), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0017
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0018 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0018 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(2, 1), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(2, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(3, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0018
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0019 : Poly :=
[
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 19 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0019 : Poly :=
[
  term ((43088676976754545664 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 2), (9, 2), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 2), (16, 1)],
  term ((21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-43088676976754545664 : Rat) / 269491324728529755) [(4, 1), (5, 3), (7, 1), (9, 2), (16, 1)],
  term ((-43088676976754545664 : Rat) / 269491324728529755) [(4, 2), (5, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0019
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0020 : Poly :=
[
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0020 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 3), (11, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0020
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0021 : Poly :=
[
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0021 : Poly :=
[
  term ((632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 3), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0021
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0022 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 22 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0022 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 3), (8, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0022
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0023 : Poly :=
[
  term ((653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 23 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0023 : Poly :=
[
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 3), (10, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(5, 2), (7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0023
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0024 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 24 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0024 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 3), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0024
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0025 : Poly :=
[
  term ((-106570260736761947 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 25 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0025 : Poly :=
[
  term ((213140521473523894 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-106570260736761947 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((213140521473523894 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((-106570260736761947 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-213140521473523894 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((106570260736761947 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((106570260736761947 : Rat) / 5988696105078439) [(5, 1), (7, 3), (16, 1)],
  term ((-213140521473523894 : Rat) / 5988696105078439) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0025
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0026 : Poly :=
[
  term ((-1599406843955200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0026 : Poly :=
[
  term ((3198813687910400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1599406843955200 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3198813687910400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1599406843955200 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3198813687910400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3198813687910400 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0026
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0027 : Poly :=
[
  term ((41841876639207876904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 27 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0027 : Poly :=
[
  term ((-83683753278415753808 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((41841876639207876904 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-83683753278415753808 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((41841876639207876904 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-41841876639207876904 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-41841876639207876904 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0027
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0028 : Poly :=
[
  term ((-67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0028 : Poly :=
[
  term ((134797667384576000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0028
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0029 : Poly :=
[
  term ((6455598972999680 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0029 : Poly :=
[
  term ((-12911197945999360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((6455598972999680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-12911197945999360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((6455598972999680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((12911197945999360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((12911197945999360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0029
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0030 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 30 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0030 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0030
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0031 : Poly :=
[
  term ((226942628777042673068 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 31 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0031 : Poly :=
[
  term ((-453885257554085346136 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((226942628777042673068 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-453885257554085346136 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((226942628777042673068 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((453885257554085346136 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-226942628777042673068 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-226942628777042673068 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((453885257554085346136 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0031
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0032 : Poly :=
[
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0032 : Poly :=
[
  term ((203610247244591632456 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((203610247244591632456 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-203610247244591632456 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-203610247244591632456 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0032
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0033 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0033 : Poly :=
[
  term ((-4228645478400 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0033
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0034 : Poly :=
[
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0034 : Poly :=
[
  term ((-26714448232729600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0034
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0035 : Poly :=
[
  term ((-444160515001691192264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 35 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0035 : Poly :=
[
  term ((888321030003382384528 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-444160515001691192264 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((888321030003382384528 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((-444160515001691192264 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-888321030003382384528 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((444160515001691192264 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((444160515001691192264 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-888321030003382384528 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0035
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0036 : Poly :=
[
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0036 : Poly :=
[
  term ((13555823625881600 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0036
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0037 : Poly :=
[
  term ((93142445612070400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0037 : Poly :=
[
  term ((-186284891224140800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((93142445612070400 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-186284891224140800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((93142445612070400 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((186284891224140800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-93142445612070400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-93142445612070400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((186284891224140800 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0037
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0038 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0038 : Poly :=
[
  term ((-6448371121561600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0038
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0039 : Poly :=
[
  term ((-23544177901798400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0039 : Poly :=
[
  term ((47088355803596800 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23544177901798400 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((47088355803596800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23544177901798400 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47088355803596800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((23544177901798400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((23544177901798400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47088355803596800 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0039
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0040 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 40 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0040 : Poly :=
[
  term ((-172980456656537600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0040
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0041 : Poly :=
[
  term ((3501998759033600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 41 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0041 : Poly :=
[
  term ((-7003997518067200 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((3501998759033600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-7003997518067200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((3501998759033600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((7003997518067200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-3501998759033600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-3501998759033600 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((7003997518067200 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0041
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0042 : Poly :=
[
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 42 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0042 : Poly :=
[
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0042
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0043 : Poly :=
[
  term ((-400852945959630559714 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 43 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0043 : Poly :=
[
  term ((801705891919261119428 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-400852945959630559714 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((801705891919261119428 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-400852945959630559714 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-801705891919261119428 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((400852945959630559714 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((400852945959630559714 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-801705891919261119428 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0043
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0044 : Poly :=
[
  term ((153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0044 : Poly :=
[
  term ((-307778124041113600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0044
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0045 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0045 : Poly :=
[
  term ((-10018138818652160 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0045
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0046 : Poly :=
[
  term ((-146470334224076800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0046 : Poly :=
[
  term ((292940668448153600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-146470334224076800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((292940668448153600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-146470334224076800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-292940668448153600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((146470334224076800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((146470334224076800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-292940668448153600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0046
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0047 : Poly :=
[
  term ((-670003605980334080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 47 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0047 : Poly :=
[
  term ((1340007211960668160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1340007211960668160 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0047
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0048 : Poly :=
[
  term ((223822183636943360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 48 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0048 : Poly :=
[
  term ((-447644367273886720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((223822183636943360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-447644367273886720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((223822183636943360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((447644367273886720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-223822183636943360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-223822183636943360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((447644367273886720 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0048
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0049 : Poly :=
[
  term ((-59678560403660800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0049 : Poly :=
[
  term ((119357120807321600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0049
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0050 : Poly :=
[
  term ((55942632389450240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0050 : Poly :=
[
  term ((-111885264778900480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((55942632389450240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-111885264778900480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((55942632389450240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((111885264778900480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-55942632389450240 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-55942632389450240 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((111885264778900480 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0050
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0051 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0051 : Poly :=
[
  term ((-4750053127536640 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0051
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0052 : Poly :=
[
  term ((-26127424143546880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0052 : Poly :=
[
  term ((52254848287093760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-26127424143546880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((52254848287093760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-26127424143546880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-52254848287093760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((26127424143546880 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((26127424143546880 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-52254848287093760 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0052
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0053 : Poly :=
[
  term ((-508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 53 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0053 : Poly :=
[
  term ((1016828298440622080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0053
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0054 : Poly :=
[
  term ((1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 54 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0054 : Poly :=
[
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (14, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 3), (14, 1), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (14, 1), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0054
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0055 : Poly :=
[
  term ((-62926167961896960 : Rat) / 5988696105078439) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 55 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0055 : Poly :=
[
  term ((125852335923793920 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-62926167961896960 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 3), (16, 1)],
  term ((125852335923793920 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 3), (16, 1)],
  term ((-62926167961896960 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 3), (16, 1)],
  term ((-125852335923793920 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((62926167961896960 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((62926167961896960 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 3), (16, 1)],
  term ((-125852335923793920 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0055
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0056 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0056 : Poly :=
[
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0056
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0057 : Poly :=
[
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0057 : Poly :=
[
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0057
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0058 : Poly :=
[
  term ((-23068338090739966234 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 58 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0058 : Poly :=
[
  term ((46136676181479932468 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-23068338090739966234 : Rat) / 269491324728529755) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((46136676181479932468 : Rat) / 269491324728529755) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-23068338090739966234 : Rat) / 269491324728529755) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-46136676181479932468 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((23068338090739966234 : Rat) / 269491324728529755) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((23068338090739966234 : Rat) / 269491324728529755) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-46136676181479932468 : Rat) / 269491324728529755) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0058
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0059 : Poly :=
[
  term ((80718511621062516067 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 59 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0059 : Poly :=
[
  term ((-161437023242125032134 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((80718511621062516067 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-161437023242125032134 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((80718511621062516067 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((161437023242125032134 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-80718511621062516067 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-80718511621062516067 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((161437023242125032134 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0059
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0060 : Poly :=
[
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0060 : Poly :=
[
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0060
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0061 : Poly :=
[
  term ((43531757081746832749 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0061 : Poly :=
[
  term ((-87063514163493665498 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((43531757081746832749 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-87063514163493665498 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((43531757081746832749 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((87063514163493665498 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-43531757081746832749 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-43531757081746832749 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((87063514163493665498 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0061
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0062 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0062 : Poly :=
[
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0062
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0063 : Poly :=
[
  term ((-70906838714058497867 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0063 : Poly :=
[
  term ((141813677428116995734 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-70906838714058497867 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((141813677428116995734 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-70906838714058497867 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-141813677428116995734 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((70906838714058497867 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((70906838714058497867 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-141813677428116995734 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0063
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0064 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 64 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0064 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0064
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0065 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0065 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0065
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0066 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 66 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0066 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 3), (9, 1), (10, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0066
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0067 : Poly :=
[
  term ((-44083325160946720 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 67 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0067 : Poly :=
[
  term ((88166650321893440 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 5988696105078439) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 5988696105078439) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 5988696105078439) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 5988696105078439) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 5988696105078439) [(5, 2), (7, 3), (9, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 5988696105078439) [(5, 3), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0067
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0068 : Poly :=
[
  term ((9506286394053662336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 68 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0068 : Poly :=
[
  term ((-19012572788107324672 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19012572788107324672 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((19012572788107324672 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9506286394053662336 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9506286394053662336 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((19012572788107324672 : Rat) / 269491324728529755) [(5, 3), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0068
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0069 : Poly :=
[
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0069 : Poly :=
[
  term ((2093483068203983104 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2093483068203983104 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2093483068203983104 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2093483068203983104 : Rat) / 89830441576176585) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0069
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0070 : Poly :=
[
  term ((8800855790726907136 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 70 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0070 : Poly :=
[
  term ((-17601711581453814272 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((8800855790726907136 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-17601711581453814272 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)],
  term ((8800855790726907136 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((17601711581453814272 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-8800855790726907136 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((-8800855790726907136 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((17601711581453814272 : Rat) / 269491324728529755) [(5, 3), (7, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0070
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0071 : Poly :=
[
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 71 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0071 : Poly :=
[
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 2), (8, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(5, 3), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0071
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0072 : Poly :=
[
  term ((-43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 72 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0072 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0072
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0073 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0073 : Poly :=
[
  term ((824473105066198016 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 3), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0073
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0074 : Poly :=
[
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0074 : Poly :=
[
  term ((8472359734483698944 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0074
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0075 : Poly :=
[
  term ((-3124035478097483968 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 75 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0075 : Poly :=
[
  term ((6248070956194967936 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3124035478097483968 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((6248070956194967936 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3124035478097483968 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6248070956194967936 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3124035478097483968 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3124035478097483968 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6248070956194967936 : Rat) / 53898264945705951) [(5, 3), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0075
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0076 : Poly :=
[
  term ((-1606794769697758816 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 76 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0076 : Poly :=
[
  term ((3213589539395517632 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1606794769697758816 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((3213589539395517632 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((-1606794769697758816 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3213589539395517632 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1606794769697758816 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((1606794769697758816 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3213589539395517632 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0076
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0077 : Poly :=
[
  term ((3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 77 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0077 : Poly :=
[
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0077
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0078 : Poly :=
[
  term ((-10046960598503541152 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 78 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0078 : Poly :=
[
  term ((20093921197007082304 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-10046960598503541152 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((20093921197007082304 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((-10046960598503541152 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-20093921197007082304 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((10046960598503541152 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((10046960598503541152 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-20093921197007082304 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0078
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0079 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0079 : Poly :=
[
  term ((9802639664947982336 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0079
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0080 : Poly :=
[
  term ((13950917425186661216 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0080 : Poly :=
[
  term ((-27901834850373322432 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((13950917425186661216 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-27901834850373322432 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((13950917425186661216 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((27901834850373322432 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13950917425186661216 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-13950917425186661216 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((27901834850373322432 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0080
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0081 : Poly :=
[
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 81 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0081 : Poly :=
[
  term ((14380180136477110784 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-14380180136477110784 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-14380180136477110784 : Rat) / 89830441576176585) [(5, 3), (7, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0081
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0082 : Poly :=
[
  term ((34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 82 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0082 : Poly :=
[
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 2), (14, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (14, 1), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (14, 1), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0082
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0083 : Poly :=
[
  term ((-6567095747762714176 : Rat) / 269491324728529755) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 83 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0083 : Poly :=
[
  term ((13134191495525428352 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-6567095747762714176 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 2), (16, 1)],
  term ((13134191495525428352 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 2), (16, 1)],
  term ((-6567095747762714176 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 2), (16, 1)],
  term ((-13134191495525428352 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((6567095747762714176 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((6567095747762714176 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-13134191495525428352 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0083
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0084 : Poly :=
[
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 84 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0084 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(2, 2), (5, 2), (10, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(3, 1), (5, 3), (10, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(3, 2), (5, 2), (10, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (6, 1), (10, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (6, 2), (10, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (7, 2), (10, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0084
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0085 : Poly :=
[
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 85 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0085 : Poly :=
[
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(2, 2), (5, 2), (14, 1), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(3, 1), (5, 3), (14, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (14, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (14, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(5, 3), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0085
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0086 : Poly :=
[
  term ((107949311728127469098 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 86 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0086 : Poly :=
[
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((107949311728127469098 : Rat) / 1347456623642648775) [(2, 2), (5, 2), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(3, 1), (5, 3), (16, 1)],
  term ((107949311728127469098 : Rat) / 1347456623642648775) [(3, 2), (5, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-107949311728127469098 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (16, 1)],
  term ((-107949311728127469098 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0086
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0087 : Poly :=
[
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 87 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0087 : Poly :=
[
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(2, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(3, 1), (5, 4), (8, 1), (9, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(3, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(5, 4), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0087
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0088 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 88 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0088 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(2, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(3, 1), (5, 4), (9, 1), (10, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(3, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0088
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0089 : Poly :=
[
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 89 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0089 : Poly :=
[
  term ((16202575714108323584 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(2, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(3, 1), (5, 4), (9, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(3, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(5, 4), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0089
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 13. -/
def rs_R010_ueqv_R010YNN_coefficient_13_0090 : Poly :=
[
  term ((4050643928527080896 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 90 for generator 13. -/
def rs_R010_ueqv_R010YNN_partial_13_0090 : Poly :=
[
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 3), (9, 1), (16, 1)],
  term ((4050643928527080896 : Rat) / 269491324728529755) [(2, 2), (5, 3), (9, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(3, 1), (5, 4), (9, 1), (16, 1)],
  term ((4050643928527080896 : Rat) / 269491324728529755) [(3, 2), (5, 3), (9, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-4050643928527080896 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((-4050643928527080896 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 4), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 13. -/
theorem rs_R010_ueqv_R010YNN_partial_13_0090_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_13_0090
        rs_R010_ueqv_R010YNN_generator_13_0000_0090 =
      rs_R010_ueqv_R010YNN_partial_13_0090 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_13_0000_0090 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_13_0000,
  rs_R010_ueqv_R010YNN_partial_13_0001,
  rs_R010_ueqv_R010YNN_partial_13_0002,
  rs_R010_ueqv_R010YNN_partial_13_0003,
  rs_R010_ueqv_R010YNN_partial_13_0004,
  rs_R010_ueqv_R010YNN_partial_13_0005,
  rs_R010_ueqv_R010YNN_partial_13_0006,
  rs_R010_ueqv_R010YNN_partial_13_0007,
  rs_R010_ueqv_R010YNN_partial_13_0008,
  rs_R010_ueqv_R010YNN_partial_13_0009,
  rs_R010_ueqv_R010YNN_partial_13_0010,
  rs_R010_ueqv_R010YNN_partial_13_0011,
  rs_R010_ueqv_R010YNN_partial_13_0012,
  rs_R010_ueqv_R010YNN_partial_13_0013,
  rs_R010_ueqv_R010YNN_partial_13_0014,
  rs_R010_ueqv_R010YNN_partial_13_0015,
  rs_R010_ueqv_R010YNN_partial_13_0016,
  rs_R010_ueqv_R010YNN_partial_13_0017,
  rs_R010_ueqv_R010YNN_partial_13_0018,
  rs_R010_ueqv_R010YNN_partial_13_0019,
  rs_R010_ueqv_R010YNN_partial_13_0020,
  rs_R010_ueqv_R010YNN_partial_13_0021,
  rs_R010_ueqv_R010YNN_partial_13_0022,
  rs_R010_ueqv_R010YNN_partial_13_0023,
  rs_R010_ueqv_R010YNN_partial_13_0024,
  rs_R010_ueqv_R010YNN_partial_13_0025,
  rs_R010_ueqv_R010YNN_partial_13_0026,
  rs_R010_ueqv_R010YNN_partial_13_0027,
  rs_R010_ueqv_R010YNN_partial_13_0028,
  rs_R010_ueqv_R010YNN_partial_13_0029,
  rs_R010_ueqv_R010YNN_partial_13_0030,
  rs_R010_ueqv_R010YNN_partial_13_0031,
  rs_R010_ueqv_R010YNN_partial_13_0032,
  rs_R010_ueqv_R010YNN_partial_13_0033,
  rs_R010_ueqv_R010YNN_partial_13_0034,
  rs_R010_ueqv_R010YNN_partial_13_0035,
  rs_R010_ueqv_R010YNN_partial_13_0036,
  rs_R010_ueqv_R010YNN_partial_13_0037,
  rs_R010_ueqv_R010YNN_partial_13_0038,
  rs_R010_ueqv_R010YNN_partial_13_0039,
  rs_R010_ueqv_R010YNN_partial_13_0040,
  rs_R010_ueqv_R010YNN_partial_13_0041,
  rs_R010_ueqv_R010YNN_partial_13_0042,
  rs_R010_ueqv_R010YNN_partial_13_0043,
  rs_R010_ueqv_R010YNN_partial_13_0044,
  rs_R010_ueqv_R010YNN_partial_13_0045,
  rs_R010_ueqv_R010YNN_partial_13_0046,
  rs_R010_ueqv_R010YNN_partial_13_0047,
  rs_R010_ueqv_R010YNN_partial_13_0048,
  rs_R010_ueqv_R010YNN_partial_13_0049,
  rs_R010_ueqv_R010YNN_partial_13_0050,
  rs_R010_ueqv_R010YNN_partial_13_0051,
  rs_R010_ueqv_R010YNN_partial_13_0052,
  rs_R010_ueqv_R010YNN_partial_13_0053,
  rs_R010_ueqv_R010YNN_partial_13_0054,
  rs_R010_ueqv_R010YNN_partial_13_0055,
  rs_R010_ueqv_R010YNN_partial_13_0056,
  rs_R010_ueqv_R010YNN_partial_13_0057,
  rs_R010_ueqv_R010YNN_partial_13_0058,
  rs_R010_ueqv_R010YNN_partial_13_0059,
  rs_R010_ueqv_R010YNN_partial_13_0060,
  rs_R010_ueqv_R010YNN_partial_13_0061,
  rs_R010_ueqv_R010YNN_partial_13_0062,
  rs_R010_ueqv_R010YNN_partial_13_0063,
  rs_R010_ueqv_R010YNN_partial_13_0064,
  rs_R010_ueqv_R010YNN_partial_13_0065,
  rs_R010_ueqv_R010YNN_partial_13_0066,
  rs_R010_ueqv_R010YNN_partial_13_0067,
  rs_R010_ueqv_R010YNN_partial_13_0068,
  rs_R010_ueqv_R010YNN_partial_13_0069,
  rs_R010_ueqv_R010YNN_partial_13_0070,
  rs_R010_ueqv_R010YNN_partial_13_0071,
  rs_R010_ueqv_R010YNN_partial_13_0072,
  rs_R010_ueqv_R010YNN_partial_13_0073,
  rs_R010_ueqv_R010YNN_partial_13_0074,
  rs_R010_ueqv_R010YNN_partial_13_0075,
  rs_R010_ueqv_R010YNN_partial_13_0076,
  rs_R010_ueqv_R010YNN_partial_13_0077,
  rs_R010_ueqv_R010YNN_partial_13_0078,
  rs_R010_ueqv_R010YNN_partial_13_0079,
  rs_R010_ueqv_R010YNN_partial_13_0080,
  rs_R010_ueqv_R010YNN_partial_13_0081,
  rs_R010_ueqv_R010YNN_partial_13_0082,
  rs_R010_ueqv_R010YNN_partial_13_0083,
  rs_R010_ueqv_R010YNN_partial_13_0084,
  rs_R010_ueqv_R010YNN_partial_13_0085,
  rs_R010_ueqv_R010YNN_partial_13_0086,
  rs_R010_ueqv_R010YNN_partial_13_0087,
  rs_R010_ueqv_R010YNN_partial_13_0088,
  rs_R010_ueqv_R010YNN_partial_13_0089,
  rs_R010_ueqv_R010YNN_partial_13_0090
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_13_0000_0090 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 2), (5, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (7, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (2, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (3, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (11, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (3, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (3, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-513850508155129520 : Rat) / 53898264945705951) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (3, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((513850508155129520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (2, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (2, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (2, 1), (4, 1), (5, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (2, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (2, 2), (5, 1), (9, 2), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (10, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (14, 1), (16, 1)],
  term ((15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (2, 2), (5, 2), (9, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (9, 2), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((-30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 3), (9, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (3, 2), (5, 1), (9, 2), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (10, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (14, 1), (16, 1)],
  term ((15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (3, 2), (5, 2), (9, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 2), (9, 2), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (14, 1), (16, 1)],
  term ((-15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 2), (9, 2), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((-15460435418089706768 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((30920870836179413536 : Rat) / 449152207880882925) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((1225329958118497792 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((213140521473523894 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((3198813687910400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83683753278415753808 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-12911197945999360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-453885257554085346136 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((203610247244591632456 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((888321030003382384528 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-186284891224140800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((47088355803596800 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-7003997518067200 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((801705891919261119428 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((292940668448153600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1340007211960668160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-447644367273886720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-111885264778900480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((52254848287093760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((125852335923793920 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((46136676181479932468 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-161437023242125032134 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-87063514163493665498 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((141813677428116995734 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-19012572788107324672 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((2093483068203983104 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17601711581453814272 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 2), (8, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6248070956194967936 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3213589539395517632 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((20093921197007082304 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27901834850373322432 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((13134191495525428352 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 2), (14, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 3), (9, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(2, 1), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-81933604408069120 : Rat) / 5988696105078439) [(2, 1), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(2, 1), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(2, 1), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 2), (9, 2), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(2, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(2, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(2, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(2, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(2, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-106570260736761947 : Rat) / 5988696105078439) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-1599406843955200 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((41841876639207876904 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((6455598972999680 : Rat) / 17966088315235317) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((226942628777042673068 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-444160515001691192264 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((93142445612070400 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23544177901798400 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((3501998759033600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-400852945959630559714 : Rat) / 4042369870927946325) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-146470334224076800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((223822183636943360 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((55942632389450240 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26127424143546880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-62926167961896960 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 3), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23068338090739966234 : Rat) / 269491324728529755) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((80718511621062516067 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((43531757081746832749 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70906838714058497867 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(2, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 5988696105078439) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8800855790726907136 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3124035478097483968 : Rat) / 53898264945705951) [(2, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1606794769697758816 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10046960598503541152 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13950917425186661216 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-6567095747762714176 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 2), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(2, 2), (5, 2), (10, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(2, 2), (5, 2), (14, 1), (16, 1)],
  term ((107949311728127469098 : Rat) / 1347456623642648775) [(2, 2), (5, 2), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(2, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(2, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(2, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((4050643928527080896 : Rat) / 269491324728529755) [(2, 2), (5, 3), (9, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-81933604408069120 : Rat) / 5988696105078439) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (11, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((213140521473523894 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((3198813687910400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83683753278415753808 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-12911197945999360 : Rat) / 17966088315235317) [(3, 1), (5, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (8, 1), (9, 3), (16, 1)],
  term ((-453885257554085346136 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((203610247244591632456 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((888321030003382384528 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-186284891224140800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((47088355803596800 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-7003997518067200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (14, 1), (16, 1)],
  term ((801705891919261119428 : Rat) / 4042369870927946325) [(3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((292940668448153600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1340007211960668160 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-447644367273886720 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-111885264778900480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((52254848287093760 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (10, 1), (16, 1)],
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 3), (14, 1), (16, 1)],
  term ((125852335923793920 : Rat) / 5988696105078439) [(3, 1), (5, 2), (9, 3), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (10, 1), (13, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((46136676181479932468 : Rat) / 269491324728529755) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-161437023242125032134 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-87063514163493665498 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((141813677428116995734 : Rat) / 1347456623642648775) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 5988696105078439) [(3, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-19012572788107324672 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((2093483068203983104 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17601711581453814272 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(3, 1), (5, 3), (8, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6248070956194967936 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3213589539395517632 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((20093921197007082304 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27901834850373322432 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)],
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 2), (14, 1), (16, 1)],
  term ((13134191495525428352 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 2), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(3, 1), (5, 3), (10, 1), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(3, 1), (5, 3), (14, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(3, 1), (5, 3), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(3, 1), (5, 4), (8, 1), (9, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(3, 1), (5, 4), (9, 1), (10, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(3, 1), (5, 4), (9, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(3, 1), (5, 4), (9, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(3, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(3, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(3, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(3, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(3, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-106570260736761947 : Rat) / 5988696105078439) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-1599406843955200 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((41841876639207876904 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((6455598972999680 : Rat) / 17966088315235317) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((226942628777042673068 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-444160515001691192264 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((93142445612070400 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23544177901798400 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((3501998759033600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-400852945959630559714 : Rat) / 4042369870927946325) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-146470334224076800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((223822183636943360 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((55942632389450240 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26127424143546880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-62926167961896960 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 3), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23068338090739966234 : Rat) / 269491324728529755) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((80718511621062516067 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((43531757081746832749 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70906838714058497867 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(3, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 5988696105078439) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8800855790726907136 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3124035478097483968 : Rat) / 53898264945705951) [(3, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1606794769697758816 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10046960598503541152 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13950917425186661216 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-6567095747762714176 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 2), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(3, 2), (5, 2), (10, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(3, 2), (5, 2), (14, 1), (16, 1)],
  term ((107949311728127469098 : Rat) / 1347456623642648775) [(3, 2), (5, 2), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(3, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(3, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(3, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((4050643928527080896 : Rat) / 269491324728529755) [(3, 2), (5, 3), (9, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-213140521473523894 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-3198813687910400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((12911197945999360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((453885257554085346136 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-203610247244591632456 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-888321030003382384528 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((186284891224140800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47088355803596800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((7003997518067200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-801705891919261119428 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-292940668448153600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((447644367273886720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((111885264778900480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-52254848287093760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-125852335923793920 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-46136676181479932468 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((161437023242125032134 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((87063514163493665498 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141813677428116995734 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 3), (16, 1)],
  term ((82249748887631900074 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 3), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 5988696105078439) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((19012572788107324672 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2093483068203983104 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((17601711581453814272 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6248070956194967936 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3213589539395517632 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20093921197007082304 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((27901834850373322432 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14380180136477110784 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-13134191495525428352 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (6, 1), (10, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (14, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (16, 1)],
  term ((83101296284708416 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-303537986071686178432 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((81933604408069120 : Rat) / 5988696105078439) [(4, 1), (5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-119611873204920320 : Rat) / 5988696105078439) [(4, 1), (5, 2), (7, 1), (9, 3), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 3), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43088676976754545664 : Rat) / 269491324728529755) [(4, 1), (5, 3), (7, 1), (9, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-303537986071686178432 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((81933604408069120 : Rat) / 5988696105078439) [(4, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-119611873204920320 : Rat) / 5988696105078439) [(4, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43088676976754545664 : Rat) / 269491324728529755) [(4, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((106570260736761947 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41841876639207876904 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 3), (16, 1)],
  term ((-226942628777042673068 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((444160515001691192264 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-93142445612070400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((23544177901798400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3501998759033600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((400852945959630559714 : Rat) / 4042369870927946325) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((146470334224076800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-223822183636943360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-55942632389450240 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((26127424143546880 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 3), (14, 1), (16, 1)],
  term ((62926167961896960 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((23068338090739966234 : Rat) / 269491324728529755) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-80718511621062516067 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-43531757081746832749 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((70906838714058497867 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 3), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 3), (15, 1), (16, 1)],
  term ((1599406843955200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41841876639207876904 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-6455598972999680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 3), (16, 1)],
  term ((-226942628777042673068 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((444160515001691192264 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-93142445612070400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((23544177901798400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3501998759033600 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((400852945959630559714 : Rat) / 4042369870927946325) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((146470334224076800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-223822183636943360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-55942632389450240 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((26127424143546880 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (14, 1), (16, 1)],
  term ((62926167961896960 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 3), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((23068338090739966234 : Rat) / 269491324728529755) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-80718511621062516067 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-43531757081746832749 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((70906838714058497867 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 3), (8, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 3), (10, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 3), (14, 1), (16, 1)],
  term ((106570260736761947 : Rat) / 5988696105078439) [(5, 1), (7, 3), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 5988696105078439) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9506286394053662336 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8800855790726907136 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3124035478097483968 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1606794769697758816 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((10046960598503541152 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13950917425186661216 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (14, 1), (16, 1)],
  term ((6567095747762714176 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (6, 2), (10, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (14, 1), (16, 1)],
  term ((-107949311728127469098 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (15, 1), (16, 1)],
  term ((-3198813687910400 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((12911197945999360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((453885257554085346136 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-203610247244591632456 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-888321030003382384528 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((186284891224140800 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47088355803596800 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((7003997518067200 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-801705891919261119428 : Rat) / 4042369870927946325) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-292940668448153600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((447644367273886720 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((111885264778900480 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-52254848287093760 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (14, 1), (16, 1)],
  term ((-125852335923793920 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-46136676181479932468 : Rat) / 269491324728529755) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((161437023242125032134 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((87063514163493665498 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141813677428116995734 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-9506286394053662336 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8800855790726907136 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-264386217646779090196 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3124035478097483968 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1606794769697758816 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((10046960598503541152 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13950917425186661216 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (14, 1), (16, 1)],
  term ((6567095747762714176 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((99120249429781651874 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (10, 1), (16, 1)],
  term ((264386217646779090196 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (14, 1), (16, 1)],
  term ((-155905929059670345248 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 3), (9, 1), (10, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 5988696105078439) [(5, 2), (7, 3), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-4050643928527080896 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((19012572788107324672 : Rat) / 269491324728529755) [(5, 3), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2093483068203983104 : Rat) / 89830441576176585) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((17601711581453814272 : Rat) / 269491324728529755) [(5, 3), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(5, 3), (7, 1), (8, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 3), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6248070956194967936 : Rat) / 53898264945705951) [(5, 3), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3213589539395517632 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20093921197007082304 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((27901834850373322432 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14380180136477110784 : Rat) / 89830441576176585) [(5, 3), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-13134191495525428352 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 2), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 3), (7, 1), (10, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(5, 3), (7, 1), (14, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 3), (7, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-560077236717720128 : Rat) / 29943480525392195) [(5, 3), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-8018143193012285696 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(5, 4), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 4), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(5, 4), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 4), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 90. -/
theorem rs_R010_ueqv_R010YNN_block_13_0000_0090_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_13_0000_0090
      rs_R010_ueqv_R010YNN_block_13_0000_0090 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
