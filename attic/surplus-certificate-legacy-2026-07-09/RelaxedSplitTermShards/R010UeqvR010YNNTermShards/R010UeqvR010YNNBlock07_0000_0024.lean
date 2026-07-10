/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 7:0-24

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_07_0000_0024 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0000 : Poly :=
[
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0000 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0000
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0001 : Poly :=
[
  term (-1 : Rat) [(4, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0001 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (4, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (4, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0001
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0002 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0002 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0002
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0003 : Poly :=
[
  term ((-212622194131345552 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0003 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0003
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0004 : Poly :=
[
  term ((10478603072537600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0004 : Poly :=
[
  term ((20957206145075200 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20957206145075200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((20957206145075200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10478603072537600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10478603072537600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((10478603072537600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0004
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0005 : Poly :=
[
  term ((31503976548889600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0005 : Poly :=
[
  term ((63007953097779200 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0005
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0006 : Poly :=
[
  term ((7718836332247040 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0006 : Poly :=
[
  term ((15437672664494080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-15437672664494080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((15437672664494080 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7718836332247040 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7718836332247040 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((7718836332247040 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0006
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0007 : Poly :=
[
  term ((63434331728320000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0007 : Poly :=
[
  term ((126868663456640000 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0007
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0008 : Poly :=
[
  term ((57281416246619227852 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0008 : Poly :=
[
  term ((114562832493238455704 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-114562832493238455704 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((114562832493238455704 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-57281416246619227852 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-57281416246619227852 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((57281416246619227852 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0008
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0009 : Poly :=
[
  term ((-129286802627225600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0009 : Poly :=
[
  term ((-258573605254451200 : Rat) / 17966088315235317) [(0, 1), (2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((258573605254451200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-258573605254451200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((129286802627225600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((129286802627225600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-129286802627225600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0009
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0010 : Poly :=
[
  term ((403023195097600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0010 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-403023195097600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-403023195097600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((403023195097600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0010
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0011 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0011 : Poly :=
[
  term ((-157900501949335040 : Rat) / 17966088315235317) [(0, 1), (2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0011
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0012 : Poly :=
[
  term ((721823665330880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0012 : Poly :=
[
  term ((1443647330661760 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((1443647330661760 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-721823665330880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-721823665330880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((721823665330880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0012
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0013 : Poly :=
[
  term ((296878320471040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0013 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-296878320471040 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-296878320471040 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((296878320471040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0013
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0014 : Poly :=
[
  term ((-79039382403215360 : Rat) / 17966088315235317) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0014 : Poly :=
[
  term ((-158078764806430720 : Rat) / 17966088315235317) [(0, 1), (2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((158078764806430720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-158078764806430720 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((79039382403215360 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((79039382403215360 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-79039382403215360 : Rat) / 17966088315235317) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0014
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0015 : Poly :=
[
  term ((-45815121032531233598 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0015 : Poly :=
[
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((45815121032531233598 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((45815121032531233598 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-45815121032531233598 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0015
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0016 : Poly :=
[
  term ((40334040382730583014 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0016 : Poly :=
[
  term ((80668080765461166028 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-80668080765461166028 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((80668080765461166028 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-40334040382730583014 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-40334040382730583014 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((40334040382730583014 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0016
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0017 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 17 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0017 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(2, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(3, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0017
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0018 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 18 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0018 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0018
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0019 : Poly :=
[
  term ((-4653238914371994496 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0019 : Poly :=
[
  term ((-9306477828743988992 : Rat) / 269491324728529755) [(0, 1), (2, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((9306477828743988992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9306477828743988992 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4653238914371994496 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4653238914371994496 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4653238914371994496 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0019
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0020 : Poly :=
[
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 20 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0020 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 2), (8, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0020
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0021 : Poly :=
[
  term ((431413774752647104 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0021 : Poly :=
[
  term ((862827549505294208 : Rat) / 269491324728529755) [(0, 1), (2, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((862827549505294208 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-431413774752647104 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-431413774752647104 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((431413774752647104 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0021
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0022 : Poly :=
[
  term ((-7383872397332098624 : Rat) / 89830441576176585) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0022 : Poly :=
[
  term ((-14767744794664197248 : Rat) / 89830441576176585) [(0, 1), (2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((14767744794664197248 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-14767744794664197248 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((7383872397332098624 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((7383872397332098624 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7383872397332098624 : Rat) / 89830441576176585) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0022
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0023 : Poly :=
[
  term ((948514696307494240 : Rat) / 53898264945705951) [(5, 2), (16, 1)]
]

/-- Partial product 23 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0023 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(2, 2), (5, 2), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(3, 2), (5, 2), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0023
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def rs_R010_ueqv_R010YNN_coefficient_07_0024 : Poly :=
[
  term (1 : Rat) [(16, 1)]
]

/-- Partial product 24 for generator 7. -/
def rs_R010_ueqv_R010YNN_partial_07_0024 : Poly :=
[
  term (2 : Rat) [(0, 1), (2, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (-1 : Rat) [(2, 2), (16, 1)],
  term (-1 : Rat) [(3, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem rs_R010_ueqv_R010YNN_partial_07_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_07_0024
        rs_R010_ueqv_R010YNN_generator_07_0000_0024 =
      rs_R010_ueqv_R010YNN_partial_07_0024 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_07_0000_0024 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_07_0000,
  rs_R010_ueqv_R010YNN_partial_07_0001,
  rs_R010_ueqv_R010YNN_partial_07_0002,
  rs_R010_ueqv_R010YNN_partial_07_0003,
  rs_R010_ueqv_R010YNN_partial_07_0004,
  rs_R010_ueqv_R010YNN_partial_07_0005,
  rs_R010_ueqv_R010YNN_partial_07_0006,
  rs_R010_ueqv_R010YNN_partial_07_0007,
  rs_R010_ueqv_R010YNN_partial_07_0008,
  rs_R010_ueqv_R010YNN_partial_07_0009,
  rs_R010_ueqv_R010YNN_partial_07_0010,
  rs_R010_ueqv_R010YNN_partial_07_0011,
  rs_R010_ueqv_R010YNN_partial_07_0012,
  rs_R010_ueqv_R010YNN_partial_07_0013,
  rs_R010_ueqv_R010YNN_partial_07_0014,
  rs_R010_ueqv_R010YNN_partial_07_0015,
  rs_R010_ueqv_R010YNN_partial_07_0016,
  rs_R010_ueqv_R010YNN_partial_07_0017,
  rs_R010_ueqv_R010YNN_partial_07_0018,
  rs_R010_ueqv_R010YNN_partial_07_0019,
  rs_R010_ueqv_R010YNN_partial_07_0020,
  rs_R010_ueqv_R010YNN_partial_07_0021,
  rs_R010_ueqv_R010YNN_partial_07_0022,
  rs_R010_ueqv_R010YNN_partial_07_0023,
  rs_R010_ueqv_R010YNN_partial_07_0024
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_07_0000_0024 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (2, 1), (4, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (7, 1), (16, 1)],
  term ((20957206145075200 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((63007953097779200 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((15437672664494080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((114562832493238455704 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-258573605254451200 : Rat) / 17966088315235317) [(0, 1), (2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 17966088315235317) [(0, 1), (2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1443647330661760 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-158078764806430720 : Rat) / 17966088315235317) [(0, 1), (2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((80668080765461166028 : Rat) / 1347456623642648775) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 1), (2, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9306477828743988992 : Rat) / 269491324728529755) [(0, 1), (2, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 2), (8, 1), (16, 1)],
  term ((862827549505294208 : Rat) / 269491324728529755) [(0, 1), (2, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-14767744794664197248 : Rat) / 89830441576176585) [(0, 1), (2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (2, 1), (5, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (2, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (4, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-20957206145075200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-15437672664494080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-114562832493238455704 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((258573605254451200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((158078764806430720 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-80668080765461166028 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((9306477828743988992 : Rat) / 269491324728529755) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((14767744794664197248 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((20957206145075200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((15437672664494080 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((114562832493238455704 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-258573605254451200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((1443647330661760 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-158078764806430720 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((80668080765461166028 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-9306477828743988992 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((862827549505294208 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-14767744794664197248 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (4, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((-10478603072537600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-7718836332247040 : Rat) / 5988696105078439) [(2, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-57281416246619227852 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((129286802627225600 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-721823665330880 : Rat) / 53898264945705951) [(2, 2), (5, 1), (9, 1), (16, 1)],
  term ((-296878320471040 : Rat) / 5988696105078439) [(2, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((79039382403215360 : Rat) / 17966088315235317) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((45815121032531233598 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-40334040382730583014 : Rat) / 1347456623642648775) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(2, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(2, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((4653238914371994496 : Rat) / 269491324728529755) [(2, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(2, 2), (5, 2), (8, 1), (16, 1)],
  term ((-431413774752647104 : Rat) / 269491324728529755) [(2, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((7383872397332098624 : Rat) / 89830441576176585) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(2, 2), (5, 2), (16, 1)],
  term (-1 : Rat) [(2, 2), (16, 1)],
  term (1 : Rat) [(3, 2), (4, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-10478603072537600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-7718836332247040 : Rat) / 5988696105078439) [(3, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-57281416246619227852 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((129286802627225600 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-721823665330880 : Rat) / 53898264945705951) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-296878320471040 : Rat) / 5988696105078439) [(3, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((79039382403215360 : Rat) / 17966088315235317) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((45815121032531233598 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((-40334040382730583014 : Rat) / 1347456623642648775) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(3, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(3, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((4653238914371994496 : Rat) / 269491324728529755) [(3, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(3, 2), (5, 2), (8, 1), (16, 1)],
  term ((-431413774752647104 : Rat) / 269491324728529755) [(3, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((7383872397332098624 : Rat) / 89830441576176585) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(3, 2), (5, 2), (16, 1)],
  term (-1 : Rat) [(3, 2), (16, 1)],
  term (-1 : Rat) [(4, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)],
  term ((10478603072537600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((7718836332247040 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((57281416246619227852 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-129286802627225600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((403023195097600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((721823665330880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (16, 1)],
  term ((296878320471040 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-79039382403215360 : Rat) / 17966088315235317) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-45815121032531233598 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)],
  term ((40334040382730583014 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4653238914371994496 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(5, 2), (8, 1), (16, 1)],
  term ((431413774752647104 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7383872397332098624 : Rat) / 89830441576176585) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(5, 2), (16, 1)],
  term (1 : Rat) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 24. -/
theorem rs_R010_ueqv_R010YNN_block_07_0000_0024_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_07_0000_0024
      rs_R010_ueqv_R010YNN_block_07_0000_0024 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
