/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 9:0-42

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_09_0000_0042 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0000 : Poly :=
[
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0000 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0000
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0001 : Poly :=
[
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0001 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0001
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0002 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0002 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0002
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0003 : Poly :=
[
  term ((5693965366860338144 : Rat) / 149717402626960975) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0003 : Poly :=
[
  term ((11387930733720676288 : Rat) / 149717402626960975) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5693965366860338144 : Rat) / 149717402626960975) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5693965366860338144 : Rat) / 149717402626960975) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((5693965366860338144 : Rat) / 149717402626960975) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((11387930733720676288 : Rat) / 149717402626960975) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11387930733720676288 : Rat) / 149717402626960975) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0003
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0004 : Poly :=
[
  term ((390066955068980992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0004 : Poly :=
[
  term ((780133910137961984 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((390066955068980992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((780133910137961984 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-780133910137961984 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0004
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0005 : Poly :=
[
  term ((403023195097600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0005 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-403023195097600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((403023195097600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0005
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0006 : Poly :=
[
  term ((296878320471040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0006 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-296878320471040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (12, 2), (16, 1)],
  term ((-296878320471040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (13, 2), (16, 1)],
  term ((296878320471040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0006
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0007 : Poly :=
[
  term ((-1909976743184165648 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0007 : Poly :=
[
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((3819953486368331296 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((1909976743184165648 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((1909976743184165648 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-1909976743184165648 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)],
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0007
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0008 : Poly :=
[
  term ((-195033477534490496 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0008 : Poly :=
[
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((390066955068980992 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((195033477534490496 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (16, 1)],
  term ((195033477534490496 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((-195033477534490496 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0008
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0009 : Poly :=
[
  term ((33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0009 : Poly :=
[
  term ((67449577438028800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67449577438028800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((67449577438028800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0009
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0010 : Poly :=
[
  term ((51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0010 : Poly :=
[
  term ((102429038551490560 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-102429038551490560 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((102429038551490560 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0010
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0011 : Poly :=
[
  term ((6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0011 : Poly :=
[
  term ((12033302598862523296 : Rat) / 449152207880882925) [(0, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12033302598862523296 : Rat) / 449152207880882925) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((12033302598862523296 : Rat) / 449152207880882925) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0011
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0012 : Poly :=
[
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0012 : Poly :=
[
  term ((-5278098906746795008 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5278098906746795008 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5278098906746795008 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0012
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0013 : Poly :=
[
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0013 : Poly :=
[
  term ((52437743522044628 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0013
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0014 : Poly :=
[
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0014 : Poly :=
[
  term ((-26218871761022314 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0014
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0015 : Poly :=
[
  term ((-16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0015 : Poly :=
[
  term ((-32241855607808000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32241855607808000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32241855607808000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0015
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0016 : Poly :=
[
  term ((-11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0016 : Poly :=
[
  term ((-23750265637683200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((23750265637683200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-23750265637683200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0016
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0017 : Poly :=
[
  term ((-4672777262825960176 : Rat) / 269491324728529755) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0017 : Poly :=
[
  term ((-9345554525651920352 : Rat) / 269491324728529755) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9345554525651920352 : Rat) / 269491324728529755) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9345554525651920352 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4672777262825960176 : Rat) / 269491324728529755) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((4672777262825960176 : Rat) / 269491324728529755) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4672777262825960176 : Rat) / 269491324728529755) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0017
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0018 : Poly :=
[
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0018 : Poly :=
[
  term ((-120823873476454400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0018
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0019 : Poly :=
[
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0019 : Poly :=
[
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0019
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0020 : Poly :=
[
  term ((-146850305428198400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0020 : Poly :=
[
  term ((-293700610856396800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((293700610856396800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-293700610856396800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((146850305428198400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-146850305428198400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((146850305428198400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0020
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0021 : Poly :=
[
  term ((311415047547138080 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0021 : Poly :=
[
  term ((622830095094276160 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-622830095094276160 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((622830095094276160 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-311415047547138080 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-311415047547138080 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((311415047547138080 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0021
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0022 : Poly :=
[
  term ((29802945174016000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0022 : Poly :=
[
  term ((59605890348032000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-59605890348032000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((59605890348032000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-29802945174016000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-29802945174016000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((29802945174016000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0022
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0023 : Poly :=
[
  term ((-226981971552169120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0023 : Poly :=
[
  term ((-453963943104338240 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((453963943104338240 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-453963943104338240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((226981971552169120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-226981971552169120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((226981971552169120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0023
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0024 : Poly :=
[
  term ((529727972235274400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0024 : Poly :=
[
  term ((1059455944470548800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1059455944470548800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1059455944470548800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-529727972235274400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-529727972235274400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((529727972235274400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0024
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0025 : Poly :=
[
  term ((320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0025 : Poly :=
[
  term ((640843183909698560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0025
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0026 : Poly :=
[
  term ((-162882700861664000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0026 : Poly :=
[
  term ((-325765401723328000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((325765401723328000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-325765401723328000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((162882700861664000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((162882700861664000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-162882700861664000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0026
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0027 : Poly :=
[
  term ((-220929372159435520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0027 : Poly :=
[
  term ((-441858744318871040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((441858744318871040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-441858744318871040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (13, 2), (16, 1)],
  term ((220929372159435520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-220929372159435520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((220929372159435520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0027
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0028 : Poly :=
[
  term ((488544287380791040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0028 : Poly :=
[
  term ((977088574761582080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-977088574761582080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((977088574761582080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-488544287380791040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-488544287380791040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((488544287380791040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0028
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0029 : Poly :=
[
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0029 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0029
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0030 : Poly :=
[
  term ((42904100089240808506 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0030 : Poly :=
[
  term ((85808200178481617012 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-85808200178481617012 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((85808200178481617012 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-42904100089240808506 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-42904100089240808506 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((42904100089240808506 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0030
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0031 : Poly :=
[
  term ((-12937618806001584623 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0031 : Poly :=
[
  term ((-25875237612003169246 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((25875237612003169246 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-25875237612003169246 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((12937618806001584623 : Rat) / 1347456623642648775) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-12937618806001584623 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)],
  term ((12937618806001584623 : Rat) / 1347456623642648775) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0031
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0032 : Poly :=
[
  term ((-5872202253094221819 : Rat) / 149717402626960975) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0032 : Poly :=
[
  term ((-11744404506188443638 : Rat) / 149717402626960975) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((11744404506188443638 : Rat) / 149717402626960975) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-11744404506188443638 : Rat) / 149717402626960975) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((5872202253094221819 : Rat) / 149717402626960975) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((5872202253094221819 : Rat) / 149717402626960975) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5872202253094221819 : Rat) / 149717402626960975) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0032
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0033 : Poly :=
[
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0033 : Poly :=
[
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0033
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0034 : Poly :=
[
  term ((-16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0034 : Poly :=
[
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0034
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0035 : Poly :=
[
  term ((1226162619056117248 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0035 : Poly :=
[
  term ((2452325238112234496 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2452325238112234496 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2452325238112234496 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1226162619056117248 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1226162619056117248 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1226162619056117248 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0035
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0036 : Poly :=
[
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0036 : Poly :=
[
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0036
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0037 : Poly :=
[
  term ((-478377434077377088 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0037 : Poly :=
[
  term ((-956754868154754176 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((956754868154754176 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-956754868154754176 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((478377434077377088 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((478377434077377088 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-478377434077377088 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0037
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0038 : Poly :=
[
  term ((-4364240517382291744 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0038 : Poly :=
[
  term ((-8728481034764583488 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((8728481034764583488 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8728481034764583488 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((4364240517382291744 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4364240517382291744 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((4364240517382291744 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0038
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0039 : Poly :=
[
  term ((77301426881150112608 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0039 : Poly :=
[
  term ((154602853762300225216 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-154602853762300225216 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((154602853762300225216 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77301426881150112608 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-77301426881150112608 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((77301426881150112608 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0039
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0040 : Poly :=
[
  term ((-25607259637872640 : Rat) / 53898264945705951) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0040 : Poly :=
[
  term ((-51214519275745280 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((51214519275745280 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (16, 1)],
  term ((-51214519275745280 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((25607259637872640 : Rat) / 53898264945705951) [(5, 2), (9, 2), (12, 2), (16, 1)],
  term ((25607259637872640 : Rat) / 53898264945705951) [(5, 2), (9, 2), (13, 2), (16, 1)],
  term ((-25607259637872640 : Rat) / 53898264945705951) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0040
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0041 : Poly :=
[
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0041 : Poly :=
[
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((6016651299431261648 : Rat) / 449152207880882925) [(0, 1), (5, 2), (16, 1)],
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (12, 2), (16, 1)],
  term ((3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (13, 2), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0041
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010YNN_coefficient_09_0042 : Poly :=
[
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R010_ueqv_R010YNN_partial_09_0042 : Poly :=
[
  term ((2639049453373397504 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 1), (12, 1), (16, 1)],
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 1), (16, 1)],
  term ((2639049453373397504 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (12, 2), (16, 1)],
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (13, 2), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R010_ueqv_R010YNN_partial_09_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_09_0042
        rs_R010_ueqv_R010YNN_generator_09_0000_0042 =
      rs_R010_ueqv_R010YNN_partial_09_0042 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_09_0000_0042 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_09_0000,
  rs_R010_ueqv_R010YNN_partial_09_0001,
  rs_R010_ueqv_R010YNN_partial_09_0002,
  rs_R010_ueqv_R010YNN_partial_09_0003,
  rs_R010_ueqv_R010YNN_partial_09_0004,
  rs_R010_ueqv_R010YNN_partial_09_0005,
  rs_R010_ueqv_R010YNN_partial_09_0006,
  rs_R010_ueqv_R010YNN_partial_09_0007,
  rs_R010_ueqv_R010YNN_partial_09_0008,
  rs_R010_ueqv_R010YNN_partial_09_0009,
  rs_R010_ueqv_R010YNN_partial_09_0010,
  rs_R010_ueqv_R010YNN_partial_09_0011,
  rs_R010_ueqv_R010YNN_partial_09_0012,
  rs_R010_ueqv_R010YNN_partial_09_0013,
  rs_R010_ueqv_R010YNN_partial_09_0014,
  rs_R010_ueqv_R010YNN_partial_09_0015,
  rs_R010_ueqv_R010YNN_partial_09_0016,
  rs_R010_ueqv_R010YNN_partial_09_0017,
  rs_R010_ueqv_R010YNN_partial_09_0018,
  rs_R010_ueqv_R010YNN_partial_09_0019,
  rs_R010_ueqv_R010YNN_partial_09_0020,
  rs_R010_ueqv_R010YNN_partial_09_0021,
  rs_R010_ueqv_R010YNN_partial_09_0022,
  rs_R010_ueqv_R010YNN_partial_09_0023,
  rs_R010_ueqv_R010YNN_partial_09_0024,
  rs_R010_ueqv_R010YNN_partial_09_0025,
  rs_R010_ueqv_R010YNN_partial_09_0026,
  rs_R010_ueqv_R010YNN_partial_09_0027,
  rs_R010_ueqv_R010YNN_partial_09_0028,
  rs_R010_ueqv_R010YNN_partial_09_0029,
  rs_R010_ueqv_R010YNN_partial_09_0030,
  rs_R010_ueqv_R010YNN_partial_09_0031,
  rs_R010_ueqv_R010YNN_partial_09_0032,
  rs_R010_ueqv_R010YNN_partial_09_0033,
  rs_R010_ueqv_R010YNN_partial_09_0034,
  rs_R010_ueqv_R010YNN_partial_09_0035,
  rs_R010_ueqv_R010YNN_partial_09_0036,
  rs_R010_ueqv_R010YNN_partial_09_0037,
  rs_R010_ueqv_R010YNN_partial_09_0038,
  rs_R010_ueqv_R010YNN_partial_09_0039,
  rs_R010_ueqv_R010YNN_partial_09_0040,
  rs_R010_ueqv_R010YNN_partial_09_0041,
  rs_R010_ueqv_R010YNN_partial_09_0042
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_09_0000_0042 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (12, 1), (16, 1)],
  term ((11387930733720676288 : Rat) / 149717402626960975) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((3819953486368331296 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (12, 1), (16, 1)],
  term ((780133910137961984 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((390066955068980992 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((67449577438028800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67449577438028800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((102429038551490560 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-102429038551490560 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((12033302598862523296 : Rat) / 449152207880882925) [(0, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12033302598862523296 : Rat) / 449152207880882925) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5278098906746795008 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5278098906746795008 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-32241855607808000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32241855607808000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23750265637683200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((23750265637683200 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9345554525651920352 : Rat) / 269491324728529755) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9345554525651920352 : Rat) / 269491324728529755) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-293700610856396800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((622830095094276160 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((293700610856396800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1869296331673023680 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((59605890348032000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-59605890348032000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-453963943104338240 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1059455944470548800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((453963943104338240 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1059455944470548800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-325765401723328000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((325765401723328000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-441858744318871040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((977088574761582080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((441858744318871040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-982432384530060800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((85808200178481617012 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-133233934993856329012 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-25875237612003169246 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11744404506188443638 : Rat) / 149717402626960975) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5693965366860338144 : Rat) / 149717402626960975) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((25875237612003169246 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-5693965366860338144 : Rat) / 149717402626960975) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((17438369873048781782 : Rat) / 149717402626960975) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((2452325238112234496 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2452325238112234496 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-956754868154754176 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((956754868154754176 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8728481034764583488 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((154602853762300225216 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((8728481034764583488 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51404262269077081408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-51214519275745280 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((51214519275745280 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (16, 1)],
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(0, 1), (5, 2), (12, 1), (16, 1)],
  term ((6016651299431261648 : Rat) / 449152207880882925) [(0, 1), (5, 2), (16, 1)],
  term ((2639049453373397504 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 1), (12, 1), (16, 1)],
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((11387930733720676288 : Rat) / 149717402626960975) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11387930733720676288 : Rat) / 149717402626960975) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((780133910137961984 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-780133910137961984 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((67449577438028800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((102429038551490560 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((12033302598862523296 : Rat) / 449152207880882925) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5278098906746795008 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-32241855607808000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23750265637683200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9345554525651920352 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-403023195097600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((622830095094276160 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-881504855764288000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((403023195097600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((59605890348032000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1059455944470548800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-453963943104338240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-325765401723328000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-296878320471040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (12, 2), (16, 1)],
  term ((977088574761582080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-444530649203110400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (13, 2), (16, 1)],
  term ((296878320471040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((85808200178481617012 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1909976743184165648 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-11744404506188443638 : Rat) / 149717402626960975) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23965260868819003598 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-1909976743184165648 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((2452325238112234496 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-956754868154754176 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((195033477534490496 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (16, 1)],
  term ((154602853762300225216 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78361295835346760896 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((-195033477534490496 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-51214519275745280 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)],
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((2639049453373397504 : Rat) / 89830441576176585) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((33724788719014400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((51214519275745280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((6016651299431261648 : Rat) / 449152207880882925) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 5988696105078439) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-13109435880511157 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)],
  term ((16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16120927803904000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((4672777262825960176 : Rat) / 269491324728529755) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((4672777262825960176 : Rat) / 269491324728529755) [(5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4672777262825960176 : Rat) / 269491324728529755) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((146850305428198400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-311415047547138080 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-146850305428198400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-311415047547138080 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((146850305428198400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((311415047547138080 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-29802945174016000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-29802945174016000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((29802945174016000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((226981971552169120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-529727972235274400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-226981971552169120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-529727972235274400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((226981971552169120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((529727972235274400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((162882700861664000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((162882700861664000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-162882700861664000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((220929372159435520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-488544287380791040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-220929372159435520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-488544287380791040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((220929372159435520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 3), (16, 1)],
  term ((488544287380791040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-42904100089240808506 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-42904100089240808506 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((42904100089240808506 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)],
  term ((12937618806001584623 : Rat) / 1347456623642648775) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((5872202253094221819 : Rat) / 149717402626960975) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12937618806001584623 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)],
  term ((5872202253094221819 : Rat) / 149717402626960975) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((12937618806001584623 : Rat) / 1347456623642648775) [(5, 1), (13, 3), (16, 1)],
  term ((-5872202253094221819 : Rat) / 149717402626960975) [(5, 1), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-16241225059296160 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1226162619056117248 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1226162619056117248 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1226162619056117248 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((478377434077377088 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((478377434077377088 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-478377434077377088 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((4364240517382291744 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-77301426881150112608 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4364240517382291744 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-77301426881150112608 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4364240517382291744 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 3), (16, 1)],
  term ((77301426881150112608 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((25607259637872640 : Rat) / 53898264945705951) [(5, 2), (9, 2), (12, 2), (16, 1)],
  term ((25607259637872640 : Rat) / 53898264945705951) [(5, 2), (9, 2), (13, 2), (16, 1)],
  term ((-25607259637872640 : Rat) / 53898264945705951) [(5, 2), (9, 2), (16, 1)],
  term ((3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (12, 2), (16, 1)],
  term ((3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (13, 2), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (16, 1)],
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (12, 2), (16, 1)],
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (13, 2), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 42. -/
theorem rs_R010_ueqv_R010YNN_block_09_0000_0042_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_09_0000_0042
      rs_R010_ueqv_R010YNN_block_09_0000_0042 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
