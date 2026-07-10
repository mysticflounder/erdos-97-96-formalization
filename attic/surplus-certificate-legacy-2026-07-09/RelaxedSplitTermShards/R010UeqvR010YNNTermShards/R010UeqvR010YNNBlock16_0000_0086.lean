/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 16:0-86

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_16_0000_0086 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0000 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0000 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0000
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0001 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0001 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0001
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0002 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0002 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0002
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0003 : Poly :=
[
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0003 : Poly :=
[
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0003
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0004 : Poly :=
[
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0004 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0004
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0005 : Poly :=
[
  term ((-45282156787717416 : Rat) / 5988696105078439) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0005 : Poly :=
[
  term ((90564313575434832 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-45282156787717416 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-90564313575434832 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((45282156787717416 : Rat) / 5988696105078439) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((90564313575434832 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-45282156787717416 : Rat) / 5988696105078439) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0005
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0006 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0006 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0006
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0007 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0007 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0007
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0008 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0008 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 3), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0008
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0009 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0009 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 3), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0009
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0010 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 10 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0010 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0010
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0011 : Poly :=
[
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 11 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0011 : Poly :=
[
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0011
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0012 : Poly :=
[
  term ((13366217853335396404 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 12 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0012 : Poly :=
[
  term ((-26732435706670792808 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((13366217853335396404 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((26732435706670792808 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-13366217853335396404 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)],
  term ((-26732435706670792808 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((13366217853335396404 : Rat) / 1347456623642648775) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0012
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0013 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0013 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 3), (5, 2), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0013
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0014 : Poly :=
[
  term ((-4148750468791806592 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0014 : Poly :=
[
  term ((8297500937583613184 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((-4148750468791806592 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-8297500937583613184 : Rat) / 269491324728529755) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((4148750468791806592 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((8297500937583613184 : Rat) / 269491324728529755) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4148750468791806592 : Rat) / 269491324728529755) [(1, 3), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0014
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0015 : Poly :=
[
  term ((-43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0015 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0015
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0016 : Poly :=
[
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 16 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0016 : Poly :=
[
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-303537986071686178432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0016
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0017 : Poly :=
[
  term ((40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0017 : Poly :=
[
  term ((-81933604408069120 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-81933604408069120 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((81933604408069120 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0017
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0018 : Poly :=
[
  term ((-59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 18 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0018 : Poly :=
[
  term ((119611873204920320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-119611873204920320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0018
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0019 : Poly :=
[
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0019 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0019
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0020 : Poly :=
[
  term ((316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0020 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0020
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0021 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0021 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0021
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0022 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0022 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0022
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0023 : Poly :=
[
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 23 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0023 : Poly :=
[
  term ((43088676976754545664 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-43088676976754545664 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0023
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0024 : Poly :=
[
  term ((316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0024 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0024
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0025 : Poly :=
[
  term ((-342280942914873602 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0025 : Poly :=
[
  term ((684561885829747204 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-342280942914873602 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((684561885829747204 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-342280942914873602 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((342280942914873602 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-684561885829747204 : Rat) / 53898264945705951) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0025
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0026 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 26 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0026 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0026
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0027 : Poly :=
[
  term ((653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 27 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0027 : Poly :=
[
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0027
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0028 : Poly :=
[
  term ((-51244600167783467 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 28 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0028 : Poly :=
[
  term ((102489200335566934 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-51244600167783467 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((102489200335566934 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-51244600167783467 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-102489200335566934 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((51244600167783467 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0028
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0029 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0029 : Poly :=
[
  term ((-86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0029
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0030 : Poly :=
[
  term ((-19006077798041600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0030 : Poly :=
[
  term ((38012155596083200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19006077798041600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((38012155596083200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19006077798041600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-38012155596083200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((19006077798041600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0030
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0031 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0031 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0031
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0032 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 32 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0032 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0032
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0033 : Poly :=
[
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 33 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0033 : Poly :=
[
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((229146535849988209808 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-114573267924994104904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0033
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0034 : Poly :=
[
  term ((-67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0034 : Poly :=
[
  term ((134797667384576000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0034
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0035 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0035 : Poly :=
[
  term ((-107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0035
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0036 : Poly :=
[
  term ((158620164551690240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0036 : Poly :=
[
  term ((-317240329103380480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((158620164551690240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-317240329103380480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((158620164551690240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((317240329103380480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-158620164551690240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0036
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0037 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 37 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0037 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0037
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0038 : Poly :=
[
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 38 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0038 : Poly :=
[
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((502372851744609498136 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-251186425872304749068 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0038
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0039 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0039 : Poly :=
[
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0039
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0040 : Poly :=
[
  term ((-93207246281948518328 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0040 : Poly :=
[
  term ((186414492563897036656 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-93207246281948518328 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((186414492563897036656 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-93207246281948518328 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-186414492563897036656 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((93207246281948518328 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0040
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0041 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0041 : Poly :=
[
  term ((-4228645478400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0041
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0042 : Poly :=
[
  term ((31368336872051200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0042 : Poly :=
[
  term ((-62736673744102400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((31368336872051200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-62736673744102400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((31368336872051200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((62736673744102400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31368336872051200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0042
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0043 : Poly :=
[
  term ((-39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0043 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0043
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0044 : Poly :=
[
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 44 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0044 : Poly :=
[
  term ((1033783812574954840528 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((1033783812574954840528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1033783812574954840528 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0044
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0045 : Poly :=
[
  term ((-53350108577830400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0045 : Poly :=
[
  term ((106700217155660800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-53350108577830400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((106700217155660800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-53350108577830400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-106700217155660800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((53350108577830400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0045
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0046 : Poly :=
[
  term ((43032491849533760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0046 : Poly :=
[
  term ((-86064983699067520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((43032491849533760 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86064983699067520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((43032491849533760 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((86064983699067520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43032491849533760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0046
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0047 : Poly :=
[
  term ((28070928203628800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 47 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0047 : Poly :=
[
  term ((-56141856407257600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((28070928203628800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-56141856407257600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((28070928203628800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((56141856407257600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-28070928203628800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0047
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0048 : Poly :=
[
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0048 : Poly :=
[
  term ((39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0048
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0049 : Poly :=
[
  term ((-19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0049 : Poly :=
[
  term ((39475125487333760 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0049
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0050 : Poly :=
[
  term ((5441014347282418994 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 50 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0050 : Poly :=
[
  term ((-10882028694564837988 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((5441014347282418994 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-10882028694564837988 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((5441014347282418994 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((10882028694564837988 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-5441014347282418994 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0050
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0051 : Poly :=
[
  term ((153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 51 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0051 : Poly :=
[
  term ((-307778124041113600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0051
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0052 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 52 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0052 : Poly :=
[
  term ((-10018138818652160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0052
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0053 : Poly :=
[
  term ((-73482895259648000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0053 : Poly :=
[
  term ((146965790519296000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-73482895259648000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((146965790519296000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-73482895259648000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-146965790519296000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((73482895259648000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0053
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0054 : Poly :=
[
  term ((-91597114529876480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 54 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0054 : Poly :=
[
  term ((183194229059752960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-91597114529876480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((183194229059752960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-91597114529876480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-183194229059752960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((91597114529876480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0054
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0055 : Poly :=
[
  term ((6452589978508800 : Rat) / 5988696105078439) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 55 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0055 : Poly :=
[
  term ((-12905179957017600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((6452589978508800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12905179957017600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((6452589978508800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((12905179957017600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-6452589978508800 : Rat) / 5988696105078439) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0055
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0056 : Poly :=
[
  term ((259955726282828800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0056 : Poly :=
[
  term ((-519911452565657600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((259955726282828800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-519911452565657600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((259955726282828800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((519911452565657600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-259955726282828800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0056
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0057 : Poly :=
[
  term ((-508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 57 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0057 : Poly :=
[
  term ((1016828298440622080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0057
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0058 : Poly :=
[
  term ((-158823092549703680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 58 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0058 : Poly :=
[
  term ((317646185099407360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-158823092549703680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((317646185099407360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((-158823092549703680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((-317646185099407360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((158823092549703680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0058
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0059 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 59 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0059 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0059
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0060 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 60 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0060 : Poly :=
[
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0060
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0061 : Poly :=
[
  term ((37904093089379266114 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0061 : Poly :=
[
  term ((-75808186178758532228 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((37904093089379266114 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-75808186178758532228 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((37904093089379266114 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((75808186178758532228 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37904093089379266114 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0061
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0062 : Poly :=
[
  term ((35028485698153221407 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 62 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0062 : Poly :=
[
  term ((-70056971396306442814 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((35028485698153221407 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-70056971396306442814 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((35028485698153221407 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((70056971396306442814 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-35028485698153221407 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0062
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0063 : Poly :=
[
  term ((-24802239831089947558 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 63 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0063 : Poly :=
[
  term ((49604479662179895116 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-24802239831089947558 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((49604479662179895116 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-24802239831089947558 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-49604479662179895116 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((24802239831089947558 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0063
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0064 : Poly :=
[
  term ((-52822659670340878684 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0064 : Poly :=
[
  term ((105645319340681757368 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-52822659670340878684 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((105645319340681757368 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-52822659670340878684 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-105645319340681757368 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((52822659670340878684 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0064
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0065 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 65 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0065 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0065
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0066 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0066 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0066
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0067 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 67 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0067 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0067
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0068 : Poly :=
[
  term ((-44083325160946720 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 68 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0068 : Poly :=
[
  term ((88166650321893440 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 5988696105078439) [(5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0068
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0069 : Poly :=
[
  term ((8861051622817502336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 69 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0069 : Poly :=
[
  term ((-17722103245635004672 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((8861051622817502336 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-17722103245635004672 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((8861051622817502336 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((17722103245635004672 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-8861051622817502336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0069
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0070 : Poly :=
[
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 70 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0070 : Poly :=
[
  term ((3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0070
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0071 : Poly :=
[
  term ((-5251905363447763456 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0071 : Poly :=
[
  term ((10503810726895526912 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5251905363447763456 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10503810726895526912 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5251905363447763456 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10503810726895526912 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5251905363447763456 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0071
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0072 : Poly :=
[
  term ((8531829287082849536 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 72 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0072 : Poly :=
[
  term ((-17063658574165699072 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((8531829287082849536 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-17063658574165699072 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((8531829287082849536 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((17063658574165699072 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-8531829287082849536 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0072
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0073 : Poly :=
[
  term ((126934274011244400142 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 73 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0073 : Poly :=
[
  term ((-253868548022488800284 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((126934274011244400142 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((-253868548022488800284 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((126934274011244400142 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((253868548022488800284 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-126934274011244400142 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0073
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0074 : Poly :=
[
  term ((-43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 74 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0074 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0074
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0075 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 75 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0075 : Poly :=
[
  term ((824473105066198016 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0075
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0076 : Poly :=
[
  term ((-2588855611227524672 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0076 : Poly :=
[
  term ((5177711222455049344 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2588855611227524672 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5177711222455049344 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2588855611227524672 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5177711222455049344 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2588855611227524672 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0076
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0077 : Poly :=
[
  term ((-4271491090035831712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 77 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0077 : Poly :=
[
  term ((8542982180071663424 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4271491090035831712 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((8542982180071663424 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4271491090035831712 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8542982180071663424 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((4271491090035831712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0077
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0078 : Poly :=
[
  term ((2681627917360625728 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 78 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0078 : Poly :=
[
  term ((-5363255834721251456 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((2681627917360625728 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5363255834721251456 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((2681627917360625728 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((5363255834721251456 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2681627917360625728 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0078
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0079 : Poly :=
[
  term ((14366959658144354432 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0079 : Poly :=
[
  term ((-28733919316288708864 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((14366959658144354432 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-28733919316288708864 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((14366959658144354432 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((28733919316288708864 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14366959658144354432 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0079
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0080 : Poly :=
[
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 80 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0080 : Poly :=
[
  term ((14380180136477110784 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-14380180136477110784 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0080
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0081 : Poly :=
[
  term ((10294558656808362688 : Rat) / 269491324728529755) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 81 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0081 : Poly :=
[
  term ((-20589117313616725376 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((10294558656808362688 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-20589117313616725376 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((10294558656808362688 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((20589117313616725376 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-10294558656808362688 : Rat) / 269491324728529755) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0081
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0082 : Poly :=
[
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 82 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0082 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 1), (5, 2), (6, 1), (10, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0082
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0083 : Poly :=
[
  term ((86518952013579545879 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 83 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0083 : Poly :=
[
  term ((-173037904027159091758 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((86518952013579545879 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)],
  term ((-173037904027159091758 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((86518952013579545879 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (16, 1)],
  term ((173037904027159091758 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)],
  term ((-86518952013579545879 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0083
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0084 : Poly :=
[
  term ((23142501054866315584 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 84 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0084 : Poly :=
[
  term ((-46285002109732631168 : Rat) / 269491324728529755) [(0, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((23142501054866315584 : Rat) / 269491324728529755) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-46285002109732631168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((23142501054866315584 : Rat) / 269491324728529755) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((46285002109732631168 : Rat) / 269491324728529755) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-23142501054866315584 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0084
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0085 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 85 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0085 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 1), (5, 3), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0085
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 16. -/
def rs_R010_ueqv_R010YNN_coefficient_16_0086 : Poly :=
[
  term ((-1566838035486827488 : Rat) / 29943480525392195) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 86 for generator 16. -/
def rs_R010_ueqv_R010YNN_partial_16_0086 : Poly :=
[
  term ((3133676070973654976 : Rat) / 29943480525392195) [(0, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-1566838035486827488 : Rat) / 29943480525392195) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((3133676070973654976 : Rat) / 29943480525392195) [(1, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-1566838035486827488 : Rat) / 29943480525392195) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-3133676070973654976 : Rat) / 29943480525392195) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((1566838035486827488 : Rat) / 29943480525392195) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 16. -/
theorem rs_R010_ueqv_R010YNN_partial_16_0086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_16_0086
        rs_R010_ueqv_R010YNN_generator_16_0000_0086 =
      rs_R010_ueqv_R010YNN_partial_16_0086 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_16_0000_0086 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_16_0000,
  rs_R010_ueqv_R010YNN_partial_16_0001,
  rs_R010_ueqv_R010YNN_partial_16_0002,
  rs_R010_ueqv_R010YNN_partial_16_0003,
  rs_R010_ueqv_R010YNN_partial_16_0004,
  rs_R010_ueqv_R010YNN_partial_16_0005,
  rs_R010_ueqv_R010YNN_partial_16_0006,
  rs_R010_ueqv_R010YNN_partial_16_0007,
  rs_R010_ueqv_R010YNN_partial_16_0008,
  rs_R010_ueqv_R010YNN_partial_16_0009,
  rs_R010_ueqv_R010YNN_partial_16_0010,
  rs_R010_ueqv_R010YNN_partial_16_0011,
  rs_R010_ueqv_R010YNN_partial_16_0012,
  rs_R010_ueqv_R010YNN_partial_16_0013,
  rs_R010_ueqv_R010YNN_partial_16_0014,
  rs_R010_ueqv_R010YNN_partial_16_0015,
  rs_R010_ueqv_R010YNN_partial_16_0016,
  rs_R010_ueqv_R010YNN_partial_16_0017,
  rs_R010_ueqv_R010YNN_partial_16_0018,
  rs_R010_ueqv_R010YNN_partial_16_0019,
  rs_R010_ueqv_R010YNN_partial_16_0020,
  rs_R010_ueqv_R010YNN_partial_16_0021,
  rs_R010_ueqv_R010YNN_partial_16_0022,
  rs_R010_ueqv_R010YNN_partial_16_0023,
  rs_R010_ueqv_R010YNN_partial_16_0024,
  rs_R010_ueqv_R010YNN_partial_16_0025,
  rs_R010_ueqv_R010YNN_partial_16_0026,
  rs_R010_ueqv_R010YNN_partial_16_0027,
  rs_R010_ueqv_R010YNN_partial_16_0028,
  rs_R010_ueqv_R010YNN_partial_16_0029,
  rs_R010_ueqv_R010YNN_partial_16_0030,
  rs_R010_ueqv_R010YNN_partial_16_0031,
  rs_R010_ueqv_R010YNN_partial_16_0032,
  rs_R010_ueqv_R010YNN_partial_16_0033,
  rs_R010_ueqv_R010YNN_partial_16_0034,
  rs_R010_ueqv_R010YNN_partial_16_0035,
  rs_R010_ueqv_R010YNN_partial_16_0036,
  rs_R010_ueqv_R010YNN_partial_16_0037,
  rs_R010_ueqv_R010YNN_partial_16_0038,
  rs_R010_ueqv_R010YNN_partial_16_0039,
  rs_R010_ueqv_R010YNN_partial_16_0040,
  rs_R010_ueqv_R010YNN_partial_16_0041,
  rs_R010_ueqv_R010YNN_partial_16_0042,
  rs_R010_ueqv_R010YNN_partial_16_0043,
  rs_R010_ueqv_R010YNN_partial_16_0044,
  rs_R010_ueqv_R010YNN_partial_16_0045,
  rs_R010_ueqv_R010YNN_partial_16_0046,
  rs_R010_ueqv_R010YNN_partial_16_0047,
  rs_R010_ueqv_R010YNN_partial_16_0048,
  rs_R010_ueqv_R010YNN_partial_16_0049,
  rs_R010_ueqv_R010YNN_partial_16_0050,
  rs_R010_ueqv_R010YNN_partial_16_0051,
  rs_R010_ueqv_R010YNN_partial_16_0052,
  rs_R010_ueqv_R010YNN_partial_16_0053,
  rs_R010_ueqv_R010YNN_partial_16_0054,
  rs_R010_ueqv_R010YNN_partial_16_0055,
  rs_R010_ueqv_R010YNN_partial_16_0056,
  rs_R010_ueqv_R010YNN_partial_16_0057,
  rs_R010_ueqv_R010YNN_partial_16_0058,
  rs_R010_ueqv_R010YNN_partial_16_0059,
  rs_R010_ueqv_R010YNN_partial_16_0060,
  rs_R010_ueqv_R010YNN_partial_16_0061,
  rs_R010_ueqv_R010YNN_partial_16_0062,
  rs_R010_ueqv_R010YNN_partial_16_0063,
  rs_R010_ueqv_R010YNN_partial_16_0064,
  rs_R010_ueqv_R010YNN_partial_16_0065,
  rs_R010_ueqv_R010YNN_partial_16_0066,
  rs_R010_ueqv_R010YNN_partial_16_0067,
  rs_R010_ueqv_R010YNN_partial_16_0068,
  rs_R010_ueqv_R010YNN_partial_16_0069,
  rs_R010_ueqv_R010YNN_partial_16_0070,
  rs_R010_ueqv_R010YNN_partial_16_0071,
  rs_R010_ueqv_R010YNN_partial_16_0072,
  rs_R010_ueqv_R010YNN_partial_16_0073,
  rs_R010_ueqv_R010YNN_partial_16_0074,
  rs_R010_ueqv_R010YNN_partial_16_0075,
  rs_R010_ueqv_R010YNN_partial_16_0076,
  rs_R010_ueqv_R010YNN_partial_16_0077,
  rs_R010_ueqv_R010YNN_partial_16_0078,
  rs_R010_ueqv_R010YNN_partial_16_0079,
  rs_R010_ueqv_R010YNN_partial_16_0080,
  rs_R010_ueqv_R010YNN_partial_16_0081,
  rs_R010_ueqv_R010YNN_partial_16_0082,
  rs_R010_ueqv_R010YNN_partial_16_0083,
  rs_R010_ueqv_R010YNN_partial_16_0084,
  rs_R010_ueqv_R010YNN_partial_16_0085,
  rs_R010_ueqv_R010YNN_partial_16_0086
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_16_0000_0086 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((68119033924078631192 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((90564313575434832 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((8297500937583613184 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-45282156787717416 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-81933604408069120 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((102489200335566934 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((38012155596083200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-317240329103380480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((186414492563897036656 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-62736673744102400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1033783812574954840528 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((103476031594880000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-86064983699067520 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56141856407257600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10882028694564837988 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((146965790519296000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((183194229059752960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-15280206520785920 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-519911452565657600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((317646185099407360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-75808186178758532228 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-91790180803924678814 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((321738033316100612 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((85268348786208920168 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((684561885829747204 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((45282156787717416 : Rat) / 5988696105078439) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-17722103245635004672 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((10503810726895526912 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17063658574165699072 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-253868548022488800284 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((5177711222455049344 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8542982180071663424 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2237689534337952640 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-27063393310189675264 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-20589117313616725376 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(0, 1), (5, 2), (6, 1), (10, 1), (16, 1)],
  term ((-173037904027159091758 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-46285002109732631168 : Rat) / 269491324728529755) [(0, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((3133676070973654976 : Rat) / 29943480525392195) [(0, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((13366217853335396404 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-4148750468791806592 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((131722145865385938 : Rat) / 5988696105078439) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((472797879264039886 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-51244600167783467 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19006077798041600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((158620164551690240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-93207246281948518328 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((31368336872051200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-53350108577830400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((43032491849533760 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28070928203628800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((5441014347282418994 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-73482895259648000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-91597114529876480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((6452589978508800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((259955726282828800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-158823092549703680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((37904093089379266114 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((35028485698153221407 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-24802239831089947558 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-52822659670340878684 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-199535050728495680 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-44083325160946720 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((8861051622817502336 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5251905363447763456 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8531829287082849536 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((126934274011244400142 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2588855611227524672 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4271491090035831712 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2681627917360625728 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((14366959658144354432 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((10294558656808362688 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((86518952013579545879 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)],
  term ((23142501054866315584 : Rat) / 269491324728529755) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-1566838035486827488 : Rat) / 29943480525392195) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (1, 1), (5, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (16, 1)],
  term ((-45282156787717416 : Rat) / 5988696105078439) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-81933604408069120 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((684561885829747204 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((26732435706670792808 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((38012155596083200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-317240329103380480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((186414492563897036656 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-62736673744102400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1033783812574954840528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((106700217155660800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-86064983699067520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56141856407257600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10882028694564837988 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((146965790519296000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((183194229059752960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-12905179957017600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-519911452565657600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((317646185099407360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-75808186178758532228 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70056971396306442814 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((49604479662179895116 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((105645319340681757368 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((102489200335566934 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-13366217853335396404 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8297500937583613184 : Rat) / 269491324728529755) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((-17722103245635004672 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((10503810726895526912 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17063658574165699072 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-253868548022488800284 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((5177711222455049344 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8542982180071663424 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5363255834721251456 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-28733919316288708864 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-20589117313616725376 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(1, 1), (5, 2), (7, 1), (10, 1), (16, 1)],
  term ((-173037904027159091758 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((4148750468791806592 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-46285002109732631168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(1, 1), (5, 3), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((3133676070973654976 : Rat) / 29943480525392195) [(1, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((40966802204034560 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-342280942914873602 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1820240660335865248 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-71915809659330134 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-38262470744422072883 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19006077798041600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((158620164551690240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-93207246281948518328 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((31368336872051200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-53350108577830400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((43032491849533760 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28070928203628800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((5441014347282418994 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-73482895259648000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-91597114529876480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((6452589978508800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((259955726282828800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-158823092549703680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((37904093089379266114 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((35028485698153221407 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-24802239831089947558 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-52822659670340878684 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((6313751305341010784 : Rat) / 269491324728529755) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((8861051622817502336 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5251905363447763456 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8531829287082849536 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((126934274011244400142 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2588855611227524672 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4271491090035831712 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2681627917360625728 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((14366959658144354432 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((10294558656808362688 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((86518952013579545879 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (16, 1)],
  term ((23142501054866315584 : Rat) / 269491324728529755) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-1566838035486827488 : Rat) / 29943480525392195) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 3), (5, 1), (8, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 3), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((13366217853335396404 : Rat) / 1347456623642648775) [(1, 3), (5, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 3), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-4148750468791806592 : Rat) / 269491324728529755) [(1, 3), (5, 2), (9, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-303537986071686178432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((81933604408069120 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-119611873204920320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((151768993035843089216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-40966802204034560 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((59805936602460160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-43088676976754545664 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((21544338488377272832 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-102489200335566934 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-38012155596083200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((229146535849988209808 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((317240329103380480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((502372851744609498136 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-186414492563897036656 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((62736673744102400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1033783812574954840528 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-106700217155660800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((86064983699067520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((56141856407257600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((10882028694564837988 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-146965790519296000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-183194229059752960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((12905179957017600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((519911452565657600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((-317646185099407360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((75808186178758532228 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((62152697984212842764 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-49604479662179895116 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-32362765255936639106 : Rat) / 449152207880882925) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-684561885829747204 : Rat) / 53898264945705951) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((51244600167783467 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((19006077798041600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-114573267924994104904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-158620164551690240 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-251186425872304749068 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((93207246281948518328 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-31368336872051200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)],
  term ((53350108577830400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-43032491849533760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28070928203628800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5441014347282418994 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((73482895259648000 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((91597114529876480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-6452589978508800 : Rat) / 5988696105078439) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-259955726282828800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)],
  term ((158823092549703680 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-37904093089379266114 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-35028485698153221407 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)],
  term ((24802239831089947558 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)],
  term ((52822659670340878684 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 5988696105078439) [(5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((17722103245635004672 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-10503810726895526912 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((17063658574165699072 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((253868548022488800284 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-5177711222455049344 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2994605143893710208 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((5363255834721251456 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((30056419071117110464 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14380180136477110784 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((20589117313616725376 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-14764711569654377772 : Rat) / 149717402626960975) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((173037904027159091758 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((44083325160946720 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-8861051622817502336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((5251905363447763456 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8531829287082849536 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-126934274011244400142 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2588855611227524672 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4271491090035831712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2681627917360625728 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-14366959658144354432 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-10294558656808362688 : Rat) / 269491324728529755) [(5, 2), (9, 2), (16, 1)],
  term ((7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (10, 1), (16, 1)],
  term ((-86518952013579545879 : Rat) / 1347456623642648775) [(5, 2), (16, 1)],
  term ((46285002109732631168 : Rat) / 269491324728529755) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((1597130413868451968 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-3133676070973654976 : Rat) / 29943480525392195) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-23142501054866315584 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)],
  term ((1566838035486827488 : Rat) / 29943480525392195) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 86. -/
theorem rs_R010_ueqv_R010YNN_block_16_0000_0086_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_16_0000_0086
      rs_R010_ueqv_R010YNN_block_16_0000_0086 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
