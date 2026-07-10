/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 3:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_03_0000_0099 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0000 : Poly :=
[
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 0 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0000 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0000
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0001 : Poly :=
[
  term ((-8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0001 : Poly :=
[
  term ((16120927803904000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16120927803904000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0001
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0002 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0002 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0002
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0003 : Poly :=
[
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 3 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0003 : Poly :=
[
  term ((-63007953097779200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((63007953097779200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0003
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0004 : Poly :=
[
  term ((-5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0004 : Poly :=
[
  term ((11875132818841600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-11875132818841600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0004
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0005 : Poly :=
[
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0005 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0005
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0006 : Poly :=
[
  term ((63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0006 : Poly :=
[
  term ((-126868663456640000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0006
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0007 : Poly :=
[
  term ((-141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0007 : Poly :=
[
  term ((282950591279167184 : Rat) / 29943480525392195) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-282950591279167184 : Rat) / 29943480525392195) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0007
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0008 : Poly :=
[
  term ((45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0008 : Poly :=
[
  term ((-90805146472247534824 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((90805146472247534824 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0008
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0009 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 9 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0009 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 3), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0009
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0010 : Poly :=
[
  term ((947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0010 : Poly :=
[
  term ((-1894373021495730688 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((1894373021495730688 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0010
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0011 : Poly :=
[
  term ((-529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0011 : Poly :=
[
  term ((1058554911154467584 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1058554911154467584 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0011
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0012 : Poly :=
[
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (16, 1)]
]

/-- Partial product 12 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0012 : Poly :=
[
  term ((2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 2), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 2), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 2), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0012
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0013 : Poly :=
[
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 13 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0013 : Poly :=
[
  term ((1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 2), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 2), (16, 1)],
  term ((-1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (8, 2), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0013
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0014 : Poly :=
[
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 14 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0014 : Poly :=
[
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (7, 2), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0014
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0015 : Poly :=
[
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 15 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0015 : Poly :=
[
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (8, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0015
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0016 : Poly :=
[
  term ((-63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 16 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0016 : Poly :=
[
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0016
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0017 : Poly :=
[
  term ((94497105859839176 : Rat) / 53898264945705951) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 17 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0017 : Poly :=
[
  term ((-188994211719678352 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((94497105859839176 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((94497105859839176 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((188994211719678352 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-94497105859839176 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((-94497105859839176 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0017
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0018 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 18 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0018 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 3), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0018
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0019 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 19 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0019 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 2), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0019
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0020 : Poly :=
[
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 20 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0020 : Poly :=
[
  term ((-1264683745934976008 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((1264683745934976008 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0020
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0021 : Poly :=
[
  term ((-6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0021 : Poly :=
[
  term ((13564280916838400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13564280916838400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0021
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0022 : Poly :=
[
  term ((64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0022 : Poly :=
[
  term ((-128488841563801600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((128488841563801600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0022
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0023 : Poly :=
[
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 23 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0023 : Poly :=
[
  term ((73796461068108800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0023
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0024 : Poly :=
[
  term ((551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 24 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0024 : Poly :=
[
  term ((-1102705119457505872 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0024
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0025 : Poly :=
[
  term ((82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0025 : Poly :=
[
  term ((-165878834201400320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0025
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0026 : Poly :=
[
  term ((-149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0026 : Poly :=
[
  term ((299683619543060480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-299683619543060480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0026
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0027 : Poly :=
[
  term ((126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0027 : Poly :=
[
  term ((-252270848323020800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((252270848323020800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0027
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0028 : Poly :=
[
  term ((1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 28 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0028 : Poly :=
[
  term ((-3586611801579520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 3), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 3), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 3), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0028
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0029 : Poly :=
[
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0029 : Poly :=
[
  term ((52552193082500979808 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-52552193082500979808 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0029
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0030 : Poly :=
[
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0030 : Poly :=
[
  term ((39905141946216908888 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-39905141946216908888 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0030
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0031 : Poly :=
[
  term ((8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0031 : Poly :=
[
  term ((-16029814778345146624 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((16029814778345146624 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0031
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0032 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 32 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0032 : Poly :=
[
  term ((-352666601287573760 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((352666601287573760 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 3), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0032
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0033 : Poly :=
[
  term ((7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 33 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0033 : Poly :=
[
  term ((-14798327737018845184 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((14798327737018845184 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0033
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0034 : Poly :=
[
  term ((5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0034 : Poly :=
[
  term ((-11720153721668387072 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((11720153721668387072 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0034
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0035 : Poly :=
[
  term ((-2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0035 : Poly :=
[
  term ((4867874618146276352 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4867874618146276352 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0035
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0036 : Poly :=
[
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 36 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0036 : Poly :=
[
  term ((15316312228629615104 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 2), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0036
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0037 : Poly :=
[
  term (-1 : Rat) [(4, 1), (16, 1)]
]

/-- Partial product 37 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0037 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (6, 2), (16, 1)],
  term (-1 : Rat) [(4, 1), (7, 2), (16, 1)],
  term (-2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (8, 2), (16, 1)],
  term (1 : Rat) [(4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0037
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0038 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 38 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0038 : Poly :=
[
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 3), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0038
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0039 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 39 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0039 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 3), (9, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0039
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0040 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 40 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0040 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0040
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0041 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0041 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0041
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0042 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0042 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0042
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0043 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0043 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0043
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0044 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 44 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0044 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0044
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0045 : Poly :=
[
  term ((642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 45 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0045 : Poly :=
[
  term ((642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((1285646250126979048 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-1285646250126979048 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0045
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0046 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 46 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0046 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 4), (11, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0046
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0047 : Poly :=
[
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0047 : Poly :=
[
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 4), (13, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0047
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0048 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0048 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 4), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0048
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0049 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 49 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0049 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 3), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 5), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0049
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0050 : Poly :=
[
  term ((-1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 50 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0050 : Poly :=
[
  term ((-1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-2498621703408431068 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((2498621703408431068 : Rat) / 53898264945705951) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0050
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0051 : Poly :=
[
  term ((-136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 51 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0051 : Poly :=
[
  term ((-136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term ((-273318543128256880 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((273318543128256880 : Rat) / 17966088315235317) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0051
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0052 : Poly :=
[
  term ((51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0052 : Poly :=
[
  term ((51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((103793057694782908 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-103793057694782908 : Rat) / 5988696105078439) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0052
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0053 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 53 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0053 : Poly :=
[
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 4), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 3), (9, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 3), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0053
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0054 : Poly :=
[
  term ((-630233295608883764 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 54 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0054 : Poly :=
[
  term ((1260466591217767528 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-630233295608883764 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((630233295608883764 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-1260466591217767528 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((630233295608883764 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (16, 1)],
  term ((-630233295608883764 : Rat) / 53898264945705951) [(5, 1), (7, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0054
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0055 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0055 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0055
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0056 : Poly :=
[
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0056 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0056
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0057 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 57 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0057 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 4), (10, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0057
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0058 : Poly :=
[
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 58 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0058 : Poly :=
[
  term ((-69626683816345600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 4), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0058
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0059 : Poly :=
[
  term ((1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 59 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0059 : Poly :=
[
  term ((-2487427395236702428 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((2487427395236702428 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((-1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0059
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0060 : Poly :=
[
  term ((-75646540564940861 : Rat) / 17966088315235317) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 60 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0060 : Poly :=
[
  term ((151293081129881722 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-75646540564940861 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-151293081129881722 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((75646540564940861 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((75646540564940861 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-75646540564940861 : Rat) / 17966088315235317) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0060
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0061 : Poly :=
[
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0061 : Poly :=
[
  term ((31775960676812800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-31775960676812800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0061
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0062 : Poly :=
[
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0062 : Poly :=
[
  term ((-31775960676812800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((31775960676812800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0062
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0063 : Poly :=
[
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 63 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0063 : Poly :=
[
  term ((-23897700494617600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 2), (16, 1)],
  term ((23897700494617600 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0063
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0064 : Poly :=
[
  term ((73978351554867200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 64 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0064 : Poly :=
[
  term ((-147956703109734400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((73978351554867200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((73978351554867200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-73978351554867200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((147956703109734400 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-73978351554867200 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0064
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0065 : Poly :=
[
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 65 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0065 : Poly :=
[
  term ((246245521858273280 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 4), (11, 1), (16, 1)],
  term ((-246245521858273280 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0065
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0066 : Poly :=
[
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 66 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0066 : Poly :=
[
  term ((-358931907438469120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 4), (13, 1), (16, 1)],
  term ((358931907438469120 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0066
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0067 : Poly :=
[
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0067 : Poly :=
[
  term ((358931907438469120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 4), (15, 1), (16, 1)],
  term ((-358931907438469120 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0067
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0068 : Poly :=
[
  term ((-16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 68 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0068 : Poly :=
[
  term ((33945374298492699008 : Rat) / 449152207880882925) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-33945374298492699008 : Rat) / 449152207880882925) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0068
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0069 : Poly :=
[
  term ((144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 69 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0069 : Poly :=
[
  term ((-289704545701749047416 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((289704545701749047416 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0069
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0070 : Poly :=
[
  term ((-146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0070 : Poly :=
[
  term ((293654338978252023416 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-293654338978252023416 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0070
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0071 : Poly :=
[
  term ((13902278899174400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 71 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0071 : Poly :=
[
  term ((-27804557798348800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13902278899174400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13902278899174400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((27804557798348800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13902278899174400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13902278899174400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0071
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0072 : Poly :=
[
  term ((-111717514804313600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0072 : Poly :=
[
  term ((223435029608627200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-111717514804313600 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-111717514804313600 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-223435029608627200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((111717514804313600 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((111717514804313600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0072
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0073 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 73 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0073 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0073
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0074 : Poly :=
[
  term ((16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 74 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0074 : Poly :=
[
  term ((-33599575119857075008 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((33599575119857075008 : Rat) / 449152207880882925) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0074
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0075 : Poly :=
[
  term ((367383803935724800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 75 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0075 : Poly :=
[
  term ((-734767607871449600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((367383803935724800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((367383803935724800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((734767607871449600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-367383803935724800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-367383803935724800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0075
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0076 : Poly :=
[
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0076 : Poly :=
[
  term ((-3224185560780800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0076
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0077 : Poly :=
[
  term ((-329526431202234560 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0077 : Poly :=
[
  term ((659052862404469120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-329526431202234560 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-329526431202234560 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-659052862404469120 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((329526431202234560 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((329526431202234560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0077
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0078 : Poly :=
[
  term ((35005339053395200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 78 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0078 : Poly :=
[
  term ((-70010678106790400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((35005339053395200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((35005339053395200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((70010678106790400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-35005339053395200 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((-35005339053395200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0078
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0079 : Poly :=
[
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0079 : Poly :=
[
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0079
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0080 : Poly :=
[
  term ((-193879289752298080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 80 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0080 : Poly :=
[
  term ((387758579504596160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-193879289752298080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-193879289752298080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-387758579504596160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((193879289752298080 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((193879289752298080 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0080
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0081 : Poly :=
[
  term ((-12799609057389280 : Rat) / 53898264945705951) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 81 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0081 : Poly :=
[
  term ((25599218114778560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-12799609057389280 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-12799609057389280 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-25599218114778560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((12799609057389280 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((12799609057389280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0081
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0082 : Poly :=
[
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 82 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0082 : Poly :=
[
  term ((23897700494617600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-23897700494617600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0082
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0083 : Poly :=
[
  term ((51644791783997440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 83 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0083 : Poly :=
[
  term ((-103289583567994880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((51644791783997440 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((51644791783997440 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((103289583567994880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-51644791783997440 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-51644791783997440 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0083
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0084 : Poly :=
[
  term ((469448379253073920 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0084 : Poly :=
[
  term ((-938896758506147840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((469448379253073920 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((469448379253073920 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((938896758506147840 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-469448379253073920 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-469448379253073920 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0084
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0085 : Poly :=
[
  term ((-260546585518535680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 85 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0085 : Poly :=
[
  term ((521093171037071360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-260546585518535680 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-260546585518535680 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-521093171037071360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((260546585518535680 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((260546585518535680 : Rat) / 53898264945705951) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0085
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0086 : Poly :=
[
  term ((744977540233875200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 86 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0086 : Poly :=
[
  term ((-1489955080467750400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((744977540233875200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((744977540233875200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((1489955080467750400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-744977540233875200 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-744977540233875200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0086
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0087 : Poly :=
[
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0087 : Poly :=
[
  term ((-7125079691304960 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (8, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0087
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0088 : Poly :=
[
  term ((-672678951533290240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0088 : Poly :=
[
  term ((1345357903066580480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-672678951533290240 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-672678951533290240 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1345357903066580480 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((672678951533290240 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((672678951533290240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0088
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0089 : Poly :=
[
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 89 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0089 : Poly :=
[
  term ((-246245521858273280 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((246245521858273280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 3), (10, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (9, 5), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0089
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0090 : Poly :=
[
  term ((-5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 90 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0090 : Poly :=
[
  term ((10734513176390545568 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10734513176390545568 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0090_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0090
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0091 : Poly :=
[
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0091 : Poly :=
[
  term ((-3387950307008575256 : Rat) / 89830441576176585) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((3387950307008575256 : Rat) / 89830441576176585) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0091_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0091
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0092 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 92 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0092 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0092_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0092
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0093 : Poly :=
[
  term ((-33664088338798572818 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 93 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0093 : Poly :=
[
  term ((67328176677597145636 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-33664088338798572818 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-33664088338798572818 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-67328176677597145636 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((33664088338798572818 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((33664088338798572818 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0093_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0093
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0094 : Poly :=
[
  term ((85009337985111510178 : Rat) / 449152207880882925) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 94 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0094 : Poly :=
[
  term ((-170018675970223020356 : Rat) / 449152207880882925) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((85009337985111510178 : Rat) / 449152207880882925) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((85009337985111510178 : Rat) / 449152207880882925) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((170018675970223020356 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-85009337985111510178 : Rat) / 449152207880882925) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-85009337985111510178 : Rat) / 449152207880882925) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0094_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0094
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0095 : Poly :=
[
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0095 : Poly :=
[
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0095_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0095
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0096 : Poly :=
[
  term ((-264436973993969434082 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0096 : Poly :=
[
  term ((528873947987938868164 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-264436973993969434082 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-264436973993969434082 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-528873947987938868164 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((264436973993969434082 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((264436973993969434082 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0096_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0096
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0097 : Poly :=
[
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 97 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0097 : Poly :=
[
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((83526300304951680 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-83526300304951680 : Rat) / 5988696105078439) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0097_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0097
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0098 : Poly :=
[
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 98 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0098 : Poly :=
[
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((928070003388352000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((-928070003388352000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0098_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0098
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010YNN_coefficient_03_0099 : Poly :=
[
  term ((-199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 3. -/
def rs_R010_ueqv_R010YNN_partial_03_0099 : Poly :=
[
  term ((-199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-399070101456991360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((399070101456991360 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 3. -/
theorem rs_R010_ueqv_R010YNN_partial_03_0099_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_03_0099
        rs_R010_ueqv_R010YNN_generator_03_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_03_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_03_0000_0099 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_03_0000,
  rs_R010_ueqv_R010YNN_partial_03_0001,
  rs_R010_ueqv_R010YNN_partial_03_0002,
  rs_R010_ueqv_R010YNN_partial_03_0003,
  rs_R010_ueqv_R010YNN_partial_03_0004,
  rs_R010_ueqv_R010YNN_partial_03_0005,
  rs_R010_ueqv_R010YNN_partial_03_0006,
  rs_R010_ueqv_R010YNN_partial_03_0007,
  rs_R010_ueqv_R010YNN_partial_03_0008,
  rs_R010_ueqv_R010YNN_partial_03_0009,
  rs_R010_ueqv_R010YNN_partial_03_0010,
  rs_R010_ueqv_R010YNN_partial_03_0011,
  rs_R010_ueqv_R010YNN_partial_03_0012,
  rs_R010_ueqv_R010YNN_partial_03_0013,
  rs_R010_ueqv_R010YNN_partial_03_0014,
  rs_R010_ueqv_R010YNN_partial_03_0015,
  rs_R010_ueqv_R010YNN_partial_03_0016,
  rs_R010_ueqv_R010YNN_partial_03_0017,
  rs_R010_ueqv_R010YNN_partial_03_0018,
  rs_R010_ueqv_R010YNN_partial_03_0019,
  rs_R010_ueqv_R010YNN_partial_03_0020,
  rs_R010_ueqv_R010YNN_partial_03_0021,
  rs_R010_ueqv_R010YNN_partial_03_0022,
  rs_R010_ueqv_R010YNN_partial_03_0023,
  rs_R010_ueqv_R010YNN_partial_03_0024,
  rs_R010_ueqv_R010YNN_partial_03_0025,
  rs_R010_ueqv_R010YNN_partial_03_0026,
  rs_R010_ueqv_R010YNN_partial_03_0027,
  rs_R010_ueqv_R010YNN_partial_03_0028,
  rs_R010_ueqv_R010YNN_partial_03_0029,
  rs_R010_ueqv_R010YNN_partial_03_0030,
  rs_R010_ueqv_R010YNN_partial_03_0031,
  rs_R010_ueqv_R010YNN_partial_03_0032,
  rs_R010_ueqv_R010YNN_partial_03_0033,
  rs_R010_ueqv_R010YNN_partial_03_0034,
  rs_R010_ueqv_R010YNN_partial_03_0035,
  rs_R010_ueqv_R010YNN_partial_03_0036,
  rs_R010_ueqv_R010YNN_partial_03_0037,
  rs_R010_ueqv_R010YNN_partial_03_0038,
  rs_R010_ueqv_R010YNN_partial_03_0039,
  rs_R010_ueqv_R010YNN_partial_03_0040,
  rs_R010_ueqv_R010YNN_partial_03_0041,
  rs_R010_ueqv_R010YNN_partial_03_0042,
  rs_R010_ueqv_R010YNN_partial_03_0043,
  rs_R010_ueqv_R010YNN_partial_03_0044,
  rs_R010_ueqv_R010YNN_partial_03_0045,
  rs_R010_ueqv_R010YNN_partial_03_0046,
  rs_R010_ueqv_R010YNN_partial_03_0047,
  rs_R010_ueqv_R010YNN_partial_03_0048,
  rs_R010_ueqv_R010YNN_partial_03_0049,
  rs_R010_ueqv_R010YNN_partial_03_0050,
  rs_R010_ueqv_R010YNN_partial_03_0051,
  rs_R010_ueqv_R010YNN_partial_03_0052,
  rs_R010_ueqv_R010YNN_partial_03_0053,
  rs_R010_ueqv_R010YNN_partial_03_0054,
  rs_R010_ueqv_R010YNN_partial_03_0055,
  rs_R010_ueqv_R010YNN_partial_03_0056,
  rs_R010_ueqv_R010YNN_partial_03_0057,
  rs_R010_ueqv_R010YNN_partial_03_0058,
  rs_R010_ueqv_R010YNN_partial_03_0059,
  rs_R010_ueqv_R010YNN_partial_03_0060,
  rs_R010_ueqv_R010YNN_partial_03_0061,
  rs_R010_ueqv_R010YNN_partial_03_0062,
  rs_R010_ueqv_R010YNN_partial_03_0063,
  rs_R010_ueqv_R010YNN_partial_03_0064,
  rs_R010_ueqv_R010YNN_partial_03_0065,
  rs_R010_ueqv_R010YNN_partial_03_0066,
  rs_R010_ueqv_R010YNN_partial_03_0067,
  rs_R010_ueqv_R010YNN_partial_03_0068,
  rs_R010_ueqv_R010YNN_partial_03_0069,
  rs_R010_ueqv_R010YNN_partial_03_0070,
  rs_R010_ueqv_R010YNN_partial_03_0071,
  rs_R010_ueqv_R010YNN_partial_03_0072,
  rs_R010_ueqv_R010YNN_partial_03_0073,
  rs_R010_ueqv_R010YNN_partial_03_0074,
  rs_R010_ueqv_R010YNN_partial_03_0075,
  rs_R010_ueqv_R010YNN_partial_03_0076,
  rs_R010_ueqv_R010YNN_partial_03_0077,
  rs_R010_ueqv_R010YNN_partial_03_0078,
  rs_R010_ueqv_R010YNN_partial_03_0079,
  rs_R010_ueqv_R010YNN_partial_03_0080,
  rs_R010_ueqv_R010YNN_partial_03_0081,
  rs_R010_ueqv_R010YNN_partial_03_0082,
  rs_R010_ueqv_R010YNN_partial_03_0083,
  rs_R010_ueqv_R010YNN_partial_03_0084,
  rs_R010_ueqv_R010YNN_partial_03_0085,
  rs_R010_ueqv_R010YNN_partial_03_0086,
  rs_R010_ueqv_R010YNN_partial_03_0087,
  rs_R010_ueqv_R010YNN_partial_03_0088,
  rs_R010_ueqv_R010YNN_partial_03_0089,
  rs_R010_ueqv_R010YNN_partial_03_0090,
  rs_R010_ueqv_R010YNN_partial_03_0091,
  rs_R010_ueqv_R010YNN_partial_03_0092,
  rs_R010_ueqv_R010YNN_partial_03_0093,
  rs_R010_ueqv_R010YNN_partial_03_0094,
  rs_R010_ueqv_R010YNN_partial_03_0095,
  rs_R010_ueqv_R010YNN_partial_03_0096,
  rs_R010_ueqv_R010YNN_partial_03_0097,
  rs_R010_ueqv_R010YNN_partial_03_0098,
  rs_R010_ueqv_R010YNN_partial_03_0099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_03_0000_0099 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((16120927803904000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((11875132818841600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((282950591279167184 : Rat) / 29943480525392195) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-90805146472247534824 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 3), (16, 1)],
  term ((-16120927803904000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((63007953097779200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-11875132818841600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-282950591279167184 : Rat) / 29943480525392195) [(0, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((90805146472247534824 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((141475295639583592 : Rat) / 29943480525392195) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-45402573236123767412 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((8060463901952000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (16, 1)],
  term ((5937566409420800 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 4), (13, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-1894373021495730688 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((1058554911154467584 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 3), (16, 1)],
  term ((947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 3), (9, 1), (16, 1)],
  term ((1894373021495730688 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1058554911154467584 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (16, 1)],
  term ((-947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 2), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (16, 1)],
  term ((-947186510747865344 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((529277455577233792 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (6, 2), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 2), (16, 1)],
  term ((-1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (8, 2), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (7, 2), (16, 1)],
  term ((-120745478388303968 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-188994211719678352 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (8, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (10, 1), (16, 1)],
  term ((519741494122530280 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 3), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (8, 1), (16, 1)],
  term ((-63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (10, 1), (16, 1)],
  term ((94497105859839176 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((188994211719678352 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-157505058957618376 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 3), (16, 1)],
  term ((63434331728320000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-94497105859839176 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 3), (16, 1)],
  term ((92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 2), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 3), (9, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 2), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 2), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 3), (16, 1)],
  term ((-1264683745934976008 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((13564280916838400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128488841563801600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1102705119457505872 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-165878834201400320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((299683619543060480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-252270848323020800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((52552193082500979808 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((39905141946216908888 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-16029814778345146624 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 3), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((1264683745934976008 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 3), (16, 1)],
  term ((-26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (16, 1)],
  term ((-13564280916838400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((128488841563801600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-73796461068108800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((1102705119457505872 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((165878834201400320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-299683619543060480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((252270848323020800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-52552193082500979808 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-39905141946216908888 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((16029814778345146624 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 3), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((26276096541250489904 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((19952570973108454444 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-8014907389172573312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((6782140458419200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-64244420781900800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((36898230534054400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-551352559728752936 : Rat) / 149717402626960975) [(4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-82939417100700160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (11, 1), (16, 1)],
  term ((149841809771530240 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (13, 1), (16, 1)],
  term ((-126135424161510400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 5), (16, 1)],
  term ((-352666601287573760 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-14798327737018845184 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-11720153721668387072 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((4867874618146276352 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((15316312228629615104 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 2), (16, 1)],
  term ((352666601287573760 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 3), (16, 1)],
  term ((7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 3), (9, 1), (16, 1)],
  term ((14798327737018845184 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((11720153721668387072 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4867874618146276352 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15316312228629615104 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 2), (16, 1)],
  term ((-7399163868509422592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-5860076860834193536 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((2433937309073138176 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 4), (16, 1)],
  term (2 : Rat) [(4, 1), (6, 1), (16, 1)],
  term (-1 : Rat) [(4, 1), (6, 2), (16, 1)],
  term (-1 : Rat) [(4, 1), (7, 2), (16, 1)],
  term (-2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (1 : Rat) [(4, 1), (8, 2), (16, 1)],
  term (1 : Rat) [(4, 1), (9, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((1156026565493249128 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-2487427395236702428 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((151293081129881722 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 3), (16, 1)],
  term ((-1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (13, 1), (16, 1)],
  term ((51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 3), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-72664065047705600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((20444052185446400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23897700494617600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((379229849005748216 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((298465534720532480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-150051855989432320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((254491881713950720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((39370580310267320324 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-310203436436368313416 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((317007776959578177716 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-538383099338971124 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 3), (16, 1)],
  term ((1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((-51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 3), (9, 1), (16, 1)],
  term ((-27804557798348800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((223435029608627200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-33599575119857075008 : Rat) / 449152207880882925) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-734767607871449600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((659052862404469120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70010678106790400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((387758579504596160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((25599218114778560 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((23897700494617600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-103289583567994880 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-938896758506147840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1770404022741286894 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1079977265775365080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-7125079691304960 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((878289143440057394 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-220135515427143680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((-642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 4), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 4), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 4), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 5), (16, 1)],
  term ((10734513176390545568 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3387950307008575256 : Rat) / 89830441576176585) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((67328176677597145636 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-170018675970223020356 : Rat) / 449152207880882925) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((528873947987938868164 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-630233295608883764 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-13611066218922687 : Rat) / 5988696105078439) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-30461674169651200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((-146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((13902278899174400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-111717514804313600 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((5744984777926899168 : Rat) / 149717402626960975) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((471823829660243200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-381746444064493760 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((35005339053395200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((601995663681839840 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-430730042676300640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1298445859184368328 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((51644791783997440 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((469448379253073920 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-312766598380794880 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((536097488784838400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-568238925808771840 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((-5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((28801454246412203882 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((91842301563317932178 : Rat) / 449152207880882925) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-287790411975295588382 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (7, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (8, 1), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (15, 2), (16, 1)],
  term ((642823125063489524 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 2), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 2), (13, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 3), (16, 1)],
  term ((-1249310851704215534 : Rat) / 53898264945705951) [(5, 1), (6, 3), (11, 1), (16, 1)],
  term ((-136659271564128440 : Rat) / 17966088315235317) [(5, 1), (6, 3), (13, 1), (16, 1)],
  term ((51896528847391454 : Rat) / 5988696105078439) [(5, 1), (6, 3), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((839113347057920564 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 4), (16, 1)],
  term ((2487427395236702428 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-151293081129881722 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((-1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((-1033526969522944945 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 3), (9, 2), (16, 1)],
  term ((630233295608883764 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (16, 1)],
  term ((-1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((75646540564940861 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 4), (10, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 4), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((73978351554867200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((13902278899174400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-111717514804313600 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((367383803935724800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-329526431202234560 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((35005339053395200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-193879289752298080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-12799609057389280 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((51644791783997440 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((469448379253073920 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-260546585518535680 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((744977540233875200 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-672678951533290240 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((-5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-33664088338798572818 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((85009337985111510178 : Rat) / 449152207880882925) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-264436973993969434082 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 3), (8, 1), (9, 2), (16, 1)],
  term ((-630233295608883764 : Rat) / 53898264945705951) [(5, 1), (7, 3), (8, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (10, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 3), (9, 2), (16, 1)],
  term ((1243713697618351214 : Rat) / 53898264945705951) [(5, 1), (7, 3), (10, 1), (16, 1)],
  term ((-75646540564940861 : Rat) / 17966088315235317) [(5, 1), (7, 3), (16, 1)],
  term ((27804557798348800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-223435029608627200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((33599575119857075008 : Rat) / 449152207880882925) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((734767607871449600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-659052862404469120 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((70010678106790400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-387758579504596160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-25599218114778560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-23897700494617600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((103289583567994880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((938896758506147840 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((37890732171812264512 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-107603395839180763708 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((113193221912461499708 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((246245521858273280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 2), (16, 1)],
  term ((-73978351554867200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 4), (11, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 4), (13, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 4), (15, 1), (16, 1)],
  term ((-10734513176390545568 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((3387950307008575256 : Rat) / 89830441576176585) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-67328176677597145636 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((170018675970223020356 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-528873947987938868164 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13902278899174400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((111717514804313600 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-399159764612537600 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((40144710208783040 : Rat) / 5988696105078439) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1234182062086400 : Rat) / 5988696105078439) [(5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((193879289752298080 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((160756312167123680 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-51644791783997440 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-469448379253073920 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((14301063660262400 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((-386045632795406080 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (8, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((104582348031607040 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 3), (10, 1), (16, 1)],
  term ((5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-68172034556679524206 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((34676531746414516882 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3246373887142509926 : Rat) / 149717402626960975) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-15887980338406400 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11948850247308800 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (11, 2), (16, 1)],
  term ((-73978351554867200 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (16, 1)],
  term ((123122760929136640 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 2), (11, 1), (16, 1)],
  term ((-179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 2), (13, 1), (16, 1)],
  term ((179465953719234560 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 2), (15, 1), (16, 1)],
  term ((16972687149246349504 : Rat) / 449152207880882925) [(5, 1), (8, 3), (11, 1), (16, 1)],
  term ((-144852272850874523708 : Rat) / 1347456623642648775) [(5, 1), (8, 3), (13, 1), (16, 1)],
  term ((146827169489126011708 : Rat) / 1347456623642648775) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((5367256588195272784 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((33664088338798572818 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-85009337985111510178 : Rat) / 449152207880882925) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((264436973993969434082 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-13902278899174400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((111717514804313600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((-16799787559928537504 : Rat) / 449152207880882925) [(5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-367383803935724800 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((329526431202234560 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-35005339053395200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((193879289752298080 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((12799609057389280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)],
  term ((11948850247308800 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (11, 1), (16, 1)],
  term ((-51644791783997440 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)],
  term ((-469448379253073920 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)],
  term ((260546585518535680 : Rat) / 53898264945705951) [(5, 1), (9, 4), (11, 1), (16, 1)],
  term ((-744977540233875200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((672678951533290240 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-123122760929136640 : Rat) / 53898264945705951) [(5, 1), (9, 5), (10, 1), (16, 1)],
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((83526300304951680 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((928070003388352000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-399070101456991360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-83526300304951680 : Rat) / 5988696105078439) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-928070003388352000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((399070101456991360 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((41763150152475840 : Rat) / 5988696105078439) [(5, 2), (6, 3), (9, 1), (11, 1), (16, 1)],
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (13, 1), (16, 1)],
  term ((-199535050728495680 : Rat) / 17966088315235317) [(5, 2), (6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 0 through 99. -/
theorem rs_R010_ueqv_R010YNN_block_03_0000_0099_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_03_0000_0099
      rs_R010_ueqv_R010YNN_block_03_0000_0099 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
