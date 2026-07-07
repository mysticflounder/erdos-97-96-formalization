/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 24:0-89

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_24_0000_0089 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0000 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0000 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0000
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0001 : Poly :=
[
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0001 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0001
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0002 : Poly :=
[
  term ((842203599241821464 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0002 : Poly :=
[
  term ((-1684407198483642928 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 2), (16, 1)],
  term ((842203599241821464 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((1684407198483642928 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-842203599241821464 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((1684407198483642928 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-842203599241821464 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1684407198483642928 : Rat) / 53898264945705951) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((842203599241821464 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0002
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0003 : Poly :=
[
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0003 : Poly :=
[
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0003
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0004 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0004 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0004
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0005 : Poly :=
[
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0005 : Poly :=
[
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0005
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0006 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (16, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0006 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0006
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0007 : Poly :=
[
  term ((-403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0007 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(1, 3), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0007
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0008 : Poly :=
[
  term ((-890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0008 : Poly :=
[
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-890634961413120 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 2), (9, 2), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 4), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-890634961413120 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0008
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0009 : Poly :=
[
  term ((351608597791055672 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0009 : Poly :=
[
  term ((-703217195582111344 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (10, 2), (16, 1)],
  term ((351608597791055672 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((703217195582111344 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-351608597791055672 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((703217195582111344 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-351608597791055672 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-703217195582111344 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((351608597791055672 : Rat) / 17966088315235317) [(1, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0009
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0010 : Poly :=
[
  term ((-5426051755374254902 : Rat) / 449152207880882925) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0010 : Poly :=
[
  term ((10852103510748509804 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-5426051755374254902 : Rat) / 449152207880882925) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-10852103510748509804 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((5426051755374254902 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((-10852103510748509804 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((5426051755374254902 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((10852103510748509804 : Rat) / 449152207880882925) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-5426051755374254902 : Rat) / 449152207880882925) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0010
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0011 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0011 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 3), (10, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 3), (5, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0011
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0012 : Poly :=
[
  term ((264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0012 : Poly :=
[
  term ((-529277455577233792 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((529277455577233792 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 2), (9, 1), (16, 1)],
  term ((529277455577233792 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((-264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(1, 3), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0012
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0013 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0013 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0013
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0014 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0014 : Poly :=
[
  term ((-4228645478400 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0014
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0015 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0015 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0015
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0016 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0016 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0016
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0017 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0017 : Poly :=
[
  term ((-10018138818652160 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0017
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0018 : Poly :=
[
  term ((120916126164344862 : Rat) / 5988696105078439) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0018 : Poly :=
[
  term ((-241832252328689724 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((120916126164344862 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-241832252328689724 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((120916126164344862 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((241832252328689724 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-120916126164344862 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((241832252328689724 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-120916126164344862 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0018
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0019 : Poly :=
[
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0019 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0019
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0020 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0020 : Poly :=
[
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0020
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0021 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0021 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0021
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0022 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0022 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0022
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0023 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0023 : Poly :=
[
  term ((824473105066198016 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0023
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0024 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0024 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0024
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0025 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0025 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0025
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0026 : Poly :=
[
  term ((-622493102787962380 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 26 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0026 : Poly :=
[
  term ((1244986205575924760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-622493102787962380 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((1244986205575924760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-622493102787962380 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1244986205575924760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((622493102787962380 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-1244986205575924760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((622493102787962380 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0026
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0027 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0027 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0027
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0028 : Poly :=
[
  term ((105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0028 : Poly :=
[
  term ((-211360978174151680 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-211360978174151680 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((211360978174151680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((211360978174151680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0028
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0029 : Poly :=
[
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 29 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0029 : Poly :=
[
  term ((452573444806246400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 3), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 4), (11, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0029
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0030 : Poly :=
[
  term ((106311097065672776 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0030 : Poly :=
[
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0030
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0031 : Poly :=
[
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0031 : Poly :=
[
  term ((-835222202955076424 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-835222202955076424 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0031
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0032 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0032 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0032
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0033 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0033 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0033
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0034 : Poly :=
[
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 34 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0034 : Poly :=
[
  term ((-452573444806246400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 4), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0034
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0035 : Poly :=
[
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 35 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0035 : Poly :=
[
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0035
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0036 : Poly :=
[
  term ((21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0036 : Poly :=
[
  term ((-43516677385216000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((21758338692608000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43516677385216000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((21758338692608000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0036
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0037 : Poly :=
[
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0037 : Poly :=
[
  term ((-197375627436668800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0037
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0038 : Poly :=
[
  term ((-200176715971993600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 38 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0038 : Poly :=
[
  term ((400353431943987200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-200176715971993600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((400353431943987200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-200176715971993600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-400353431943987200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((200176715971993600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 2), (16, 1)],
  term ((-400353431943987200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((200176715971993600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0038
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0039 : Poly :=
[
  term ((-106311097065672776 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 39 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0039 : Poly :=
[
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0039
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0040 : Poly :=
[
  term ((-106250170177390574 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 40 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0040 : Poly :=
[
  term ((212500340354781148 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-106250170177390574 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((212500340354781148 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-106250170177390574 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-212500340354781148 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((106250170177390574 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-212500340354781148 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((106250170177390574 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0040
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0041 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 41 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0041 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0041
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0042 : Poly :=
[
  term ((-1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 42 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0042 : Poly :=
[
  term ((2168586555574628800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1084293277787314400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((2168586555574628800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1084293277787314400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2168586555574628800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-2168586555574628800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0042
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0043 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0043 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 3), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 4), (11, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0043
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0044 : Poly :=
[
  term ((-911136995505492326 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0044 : Poly :=
[
  term ((1822273991010984652 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-911136995505492326 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1822273991010984652 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-911136995505492326 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1822273991010984652 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((911136995505492326 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1822273991010984652 : Rat) / 53898264945705951) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((911136995505492326 : Rat) / 53898264945705951) [(5, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0044
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0045 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0045 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0045
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0046 : Poly :=
[
  term ((9509381867238400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 46 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0046 : Poly :=
[
  term ((-19018763734476800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((9509381867238400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19018763734476800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((9509381867238400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((19018763734476800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9509381867238400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((19018763734476800 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-9509381867238400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0046
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0047 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0047 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0047
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0048 : Poly :=
[
  term ((-131746712998885114 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 48 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0048 : Poly :=
[
  term ((263493425997770228 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-131746712998885114 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((263493425997770228 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-131746712998885114 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-263493425997770228 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((131746712998885114 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-263493425997770228 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((131746712998885114 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0048
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0049 : Poly :=
[
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 49 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0049 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 3), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 3), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0049
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0050 : Poly :=
[
  term ((55912951605145600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0050 : Poly :=
[
  term ((-111825903210291200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((55912951605145600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-111825903210291200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((55912951605145600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((111825903210291200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-55912951605145600 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((111825903210291200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-55912951605145600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0050
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0051 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0051 : Poly :=
[
  term ((3224185560780800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0051
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0052 : Poly :=
[
  term ((-62945796903512320 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0052 : Poly :=
[
  term ((125891593807024640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-62945796903512320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((125891593807024640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-62945796903512320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-125891593807024640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((62945796903512320 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-125891593807024640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((62945796903512320 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0052
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0053 : Poly :=
[
  term ((-61621006323520000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 53 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0053 : Poly :=
[
  term ((123242012647040000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-61621006323520000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((123242012647040000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((-61621006323520000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-123242012647040000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((61621006323520000 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((-123242012647040000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 3), (16, 1)],
  term ((61621006323520000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0053
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0054 : Poly :=
[
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0054 : Poly :=
[
  term ((-256588315667669440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0054
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0055 : Poly :=
[
  term ((-82136472818398880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 55 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0055 : Poly :=
[
  term ((164272945636797760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-82136472818398880 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((164272945636797760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-82136472818398880 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-164272945636797760 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((82136472818398880 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-164272945636797760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((82136472818398880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0055
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0056 : Poly :=
[
  term ((-57599377318416654136 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 56 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0056 : Poly :=
[
  term ((115198754636833308272 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-57599377318416654136 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((115198754636833308272 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-57599377318416654136 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-115198754636833308272 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((57599377318416654136 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-115198754636833308272 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((57599377318416654136 : Rat) / 1347456623642648775) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0056
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0057 : Poly :=
[
  term ((-12062861185607680 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0057 : Poly :=
[
  term ((24125722371215360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-12062861185607680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((24125722371215360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12062861185607680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-24125722371215360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((12062861185607680 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-24125722371215360 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((12062861185607680 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0057
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0058 : Poly :=
[
  term ((384111106776140800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 58 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0058 : Poly :=
[
  term ((-768222213552281600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((384111106776140800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-768222213552281600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((384111106776140800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((768222213552281600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-384111106776140800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((768222213552281600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-384111106776140800 : Rat) / 53898264945705951) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0058
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0059 : Poly :=
[
  term ((-215102713723923200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 59 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0059 : Poly :=
[
  term ((430205427447846400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-215102713723923200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((430205427447846400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-215102713723923200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-430205427447846400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((215102713723923200 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-430205427447846400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((215102713723923200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0059
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0060 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0060 : Poly :=
[
  term ((7125079691304960 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7125079691304960 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (8, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7125079691304960 : Rat) / 5988696105078439) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0060
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0061 : Poly :=
[
  term ((-352696852883083520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0061 : Poly :=
[
  term ((705393705766167040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-352696852883083520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((705393705766167040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-352696852883083520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-705393705766167040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((352696852883083520 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-705393705766167040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((352696852883083520 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0061
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0062 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 62 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0062 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (10, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 3), (10, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 3), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (9, 5), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0062
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0063 : Poly :=
[
  term ((-41638688943308800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 63 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0063 : Poly :=
[
  term ((83277377886617600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-41638688943308800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((83277377886617600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((-41638688943308800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((-83277377886617600 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((41638688943308800 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 3), (16, 1)],
  term ((-83277377886617600 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)],
  term ((41638688943308800 : Rat) / 17966088315235317) [(5, 1), (9, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0063
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0064 : Poly :=
[
  term ((98489789676990168 : Rat) / 149717402626960975) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0064 : Poly :=
[
  term ((-196979579353980336 : Rat) / 149717402626960975) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((98489789676990168 : Rat) / 149717402626960975) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-196979579353980336 : Rat) / 149717402626960975) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((98489789676990168 : Rat) / 149717402626960975) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((196979579353980336 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-98489789676990168 : Rat) / 149717402626960975) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((196979579353980336 : Rat) / 149717402626960975) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-98489789676990168 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0064
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0065 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 65 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0065 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0065
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0066 : Poly :=
[
  term ((9697235080240583476 : Rat) / 449152207880882925) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 66 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0066 : Poly :=
[
  term ((-19394470160481166952 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((9697235080240583476 : Rat) / 449152207880882925) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-19394470160481166952 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((9697235080240583476 : Rat) / 449152207880882925) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((19394470160481166952 : Rat) / 449152207880882925) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9697235080240583476 : Rat) / 449152207880882925) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((19394470160481166952 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-9697235080240583476 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0066
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0067 : Poly :=
[
  term ((12388856409947206181 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0067 : Poly :=
[
  term ((-24777712819894412362 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((12388856409947206181 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-24777712819894412362 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((12388856409947206181 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((24777712819894412362 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-12388856409947206181 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((24777712819894412362 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12388856409947206181 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0067
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0068 : Poly :=
[
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0068 : Poly :=
[
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0068
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0069 : Poly :=
[
  term ((-31729044088453802713 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0069 : Poly :=
[
  term ((63458088176907605426 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-31729044088453802713 : Rat) / 449152207880882925) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((63458088176907605426 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31729044088453802713 : Rat) / 449152207880882925) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-63458088176907605426 : Rat) / 449152207880882925) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((31729044088453802713 : Rat) / 449152207880882925) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-63458088176907605426 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((31729044088453802713 : Rat) / 449152207880882925) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0069
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0070 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 70 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0070 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0070
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0071 : Poly :=
[
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0071 : Poly :=
[
  term ((241298200880971520 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0071
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0072 : Poly :=
[
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 72 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0072 : Poly :=
[
  term ((-92807000338835200 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(1, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (9, 2), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0072
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0073 : Poly :=
[
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 73 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0073 : Poly :=
[
  term ((92807000338835200 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0073
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0074 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 74 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0074 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0074
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0075 : Poly :=
[
  term ((227377150830146240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 75 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0075 : Poly :=
[
  term ((-454754301660292480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((227377150830146240 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-454754301660292480 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((227377150830146240 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((454754301660292480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-227377150830146240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((454754301660292480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-227377150830146240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0075
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0076 : Poly :=
[
  term ((106728050389660480 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 76 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0076 : Poly :=
[
  term ((-213456100779320960 : Rat) / 17966088315235317) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-213456100779320960 : Rat) / 17966088315235317) [(1, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((213456100779320960 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((213456100779320960 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(5, 2), (8, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0076
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0077 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 77 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0077 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0077
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0078 : Poly :=
[
  term ((-191893651915550464 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 78 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0078 : Poly :=
[
  term ((383787303831100928 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-191893651915550464 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((383787303831100928 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-191893651915550464 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-383787303831100928 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((191893651915550464 : Rat) / 29943480525392195) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-383787303831100928 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((191893651915550464 : Rat) / 29943480525392195) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0078
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0079 : Poly :=
[
  term ((784747004461757056 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 79 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0079 : Poly :=
[
  term ((-1569494008923514112 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((784747004461757056 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1569494008923514112 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((784747004461757056 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1569494008923514112 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-784747004461757056 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((1569494008923514112 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-784747004461757056 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0079
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0080 : Poly :=
[
  term ((-1333736340710547488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 80 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0080 : Poly :=
[
  term ((2667472681421094976 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1333736340710547488 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((2667472681421094976 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1333736340710547488 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2667472681421094976 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1333736340710547488 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2667472681421094976 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1333736340710547488 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0080
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0081 : Poly :=
[
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0081 : Poly :=
[
  term ((110258185823109632 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0081
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0082 : Poly :=
[
  term ((1999162533139995872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0082 : Poly :=
[
  term ((-3998325066279991744 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1999162533139995872 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3998325066279991744 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1999162533139995872 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3998325066279991744 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1999162533139995872 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((3998325066279991744 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1999162533139995872 : Rat) / 269491324728529755) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0082
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0083 : Poly :=
[
  term ((-106728050389660480 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 83 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0083 : Poly :=
[
  term ((213456100779320960 : Rat) / 17966088315235317) [(0, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((213456100779320960 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-213456100779320960 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((-213456100779320960 : Rat) / 17966088315235317) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0083
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0084 : Poly :=
[
  term ((4227123197942046976 : Rat) / 89830441576176585) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 84 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0084 : Poly :=
[
  term ((-8454246395884093952 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((4227123197942046976 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-8454246395884093952 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((4227123197942046976 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((8454246395884093952 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-4227123197942046976 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 2), (16, 1)],
  term ((8454246395884093952 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-4227123197942046976 : Rat) / 89830441576176585) [(5, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0084
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0085 : Poly :=
[
  term ((-39497750556206906 : Rat) / 17966088315235317) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 85 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0085 : Poly :=
[
  term ((78995501112413812 : Rat) / 17966088315235317) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((-39497750556206906 : Rat) / 17966088315235317) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((78995501112413812 : Rat) / 17966088315235317) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-39497750556206906 : Rat) / 17966088315235317) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-78995501112413812 : Rat) / 17966088315235317) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((39497750556206906 : Rat) / 17966088315235317) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((-78995501112413812 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((39497750556206906 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0085
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0086 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 86 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0086 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(0, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (8, 2), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0086
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0087 : Poly :=
[
  term ((-22015891234142527066 : Rat) / 449152207880882925) [(5, 2), (16, 1)]
]

/-- Partial product 87 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0087 : Poly :=
[
  term ((44031782468285054132 : Rat) / 449152207880882925) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-22015891234142527066 : Rat) / 449152207880882925) [(0, 2), (5, 2), (16, 1)],
  term ((44031782468285054132 : Rat) / 449152207880882925) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-22015891234142527066 : Rat) / 449152207880882925) [(1, 2), (5, 2), (16, 1)],
  term ((-44031782468285054132 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((22015891234142527066 : Rat) / 449152207880882925) [(5, 2), (8, 2), (16, 1)],
  term ((-44031782468285054132 : Rat) / 449152207880882925) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((22015891234142527066 : Rat) / 449152207880882925) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0087
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0088 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 88 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0088 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 3), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0088
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010YNN_coefficient_24_0089 : Poly :=
[
  term ((3166184541746547904 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 89 for generator 24. -/
def rs_R010_ueqv_R010YNN_partial_24_0089 : Poly :=
[
  term ((-6332369083493095808 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((3166184541746547904 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((-6332369083493095808 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((3166184541746547904 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((6332369083493095808 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-3166184541746547904 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (16, 1)],
  term ((6332369083493095808 : Rat) / 269491324728529755) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-3166184541746547904 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 24. -/
theorem rs_R010_ueqv_R010YNN_partial_24_0089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_24_0089
        rs_R010_ueqv_R010YNN_generator_24_0000_0089 =
      rs_R010_ueqv_R010YNN_partial_24_0089 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_24_0000_0089 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_24_0000,
  rs_R010_ueqv_R010YNN_partial_24_0001,
  rs_R010_ueqv_R010YNN_partial_24_0002,
  rs_R010_ueqv_R010YNN_partial_24_0003,
  rs_R010_ueqv_R010YNN_partial_24_0004,
  rs_R010_ueqv_R010YNN_partial_24_0005,
  rs_R010_ueqv_R010YNN_partial_24_0006,
  rs_R010_ueqv_R010YNN_partial_24_0007,
  rs_R010_ueqv_R010YNN_partial_24_0008,
  rs_R010_ueqv_R010YNN_partial_24_0009,
  rs_R010_ueqv_R010YNN_partial_24_0010,
  rs_R010_ueqv_R010YNN_partial_24_0011,
  rs_R010_ueqv_R010YNN_partial_24_0012,
  rs_R010_ueqv_R010YNN_partial_24_0013,
  rs_R010_ueqv_R010YNN_partial_24_0014,
  rs_R010_ueqv_R010YNN_partial_24_0015,
  rs_R010_ueqv_R010YNN_partial_24_0016,
  rs_R010_ueqv_R010YNN_partial_24_0017,
  rs_R010_ueqv_R010YNN_partial_24_0018,
  rs_R010_ueqv_R010YNN_partial_24_0019,
  rs_R010_ueqv_R010YNN_partial_24_0020,
  rs_R010_ueqv_R010YNN_partial_24_0021,
  rs_R010_ueqv_R010YNN_partial_24_0022,
  rs_R010_ueqv_R010YNN_partial_24_0023,
  rs_R010_ueqv_R010YNN_partial_24_0024,
  rs_R010_ueqv_R010YNN_partial_24_0025,
  rs_R010_ueqv_R010YNN_partial_24_0026,
  rs_R010_ueqv_R010YNN_partial_24_0027,
  rs_R010_ueqv_R010YNN_partial_24_0028,
  rs_R010_ueqv_R010YNN_partial_24_0029,
  rs_R010_ueqv_R010YNN_partial_24_0030,
  rs_R010_ueqv_R010YNN_partial_24_0031,
  rs_R010_ueqv_R010YNN_partial_24_0032,
  rs_R010_ueqv_R010YNN_partial_24_0033,
  rs_R010_ueqv_R010YNN_partial_24_0034,
  rs_R010_ueqv_R010YNN_partial_24_0035,
  rs_R010_ueqv_R010YNN_partial_24_0036,
  rs_R010_ueqv_R010YNN_partial_24_0037,
  rs_R010_ueqv_R010YNN_partial_24_0038,
  rs_R010_ueqv_R010YNN_partial_24_0039,
  rs_R010_ueqv_R010YNN_partial_24_0040,
  rs_R010_ueqv_R010YNN_partial_24_0041,
  rs_R010_ueqv_R010YNN_partial_24_0042,
  rs_R010_ueqv_R010YNN_partial_24_0043,
  rs_R010_ueqv_R010YNN_partial_24_0044,
  rs_R010_ueqv_R010YNN_partial_24_0045,
  rs_R010_ueqv_R010YNN_partial_24_0046,
  rs_R010_ueqv_R010YNN_partial_24_0047,
  rs_R010_ueqv_R010YNN_partial_24_0048,
  rs_R010_ueqv_R010YNN_partial_24_0049,
  rs_R010_ueqv_R010YNN_partial_24_0050,
  rs_R010_ueqv_R010YNN_partial_24_0051,
  rs_R010_ueqv_R010YNN_partial_24_0052,
  rs_R010_ueqv_R010YNN_partial_24_0053,
  rs_R010_ueqv_R010YNN_partial_24_0054,
  rs_R010_ueqv_R010YNN_partial_24_0055,
  rs_R010_ueqv_R010YNN_partial_24_0056,
  rs_R010_ueqv_R010YNN_partial_24_0057,
  rs_R010_ueqv_R010YNN_partial_24_0058,
  rs_R010_ueqv_R010YNN_partial_24_0059,
  rs_R010_ueqv_R010YNN_partial_24_0060,
  rs_R010_ueqv_R010YNN_partial_24_0061,
  rs_R010_ueqv_R010YNN_partial_24_0062,
  rs_R010_ueqv_R010YNN_partial_24_0063,
  rs_R010_ueqv_R010YNN_partial_24_0064,
  rs_R010_ueqv_R010YNN_partial_24_0065,
  rs_R010_ueqv_R010YNN_partial_24_0066,
  rs_R010_ueqv_R010YNN_partial_24_0067,
  rs_R010_ueqv_R010YNN_partial_24_0068,
  rs_R010_ueqv_R010YNN_partial_24_0069,
  rs_R010_ueqv_R010YNN_partial_24_0070,
  rs_R010_ueqv_R010YNN_partial_24_0071,
  rs_R010_ueqv_R010YNN_partial_24_0072,
  rs_R010_ueqv_R010YNN_partial_24_0073,
  rs_R010_ueqv_R010YNN_partial_24_0074,
  rs_R010_ueqv_R010YNN_partial_24_0075,
  rs_R010_ueqv_R010YNN_partial_24_0076,
  rs_R010_ueqv_R010YNN_partial_24_0077,
  rs_R010_ueqv_R010YNN_partial_24_0078,
  rs_R010_ueqv_R010YNN_partial_24_0079,
  rs_R010_ueqv_R010YNN_partial_24_0080,
  rs_R010_ueqv_R010YNN_partial_24_0081,
  rs_R010_ueqv_R010YNN_partial_24_0082,
  rs_R010_ueqv_R010YNN_partial_24_0083,
  rs_R010_ueqv_R010YNN_partial_24_0084,
  rs_R010_ueqv_R010YNN_partial_24_0085,
  rs_R010_ueqv_R010YNN_partial_24_0086,
  rs_R010_ueqv_R010YNN_partial_24_0087,
  rs_R010_ueqv_R010YNN_partial_24_0088,
  rs_R010_ueqv_R010YNN_partial_24_0089
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_24_0000_0089 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((10852103510748509804 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-703217195582111344 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (10, 2), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1684407198483642928 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((842203599241821464 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-241832252328689724 : Rat) / 5988696105078439) [(0, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(0, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(0, 1), (4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1244986205575924760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-211360978174151680 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-835222202955076424 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-43516677385216000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((400353431943987200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((212500340354781148 : Rat) / 5988696105078439) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2168586555574628800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((3506681189494627580 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-842203599241821464 : Rat) / 53898264945705951) [(0, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-111825903210291200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((125891593807024640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((123242012647040000 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((164272945636797760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((115198754636833308272 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-19018763734476800 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((263493425997770228 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 3), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1684407198483642928 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-768222213552281600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((430205427447846400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((705393705766167040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((24125722371215360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-842203599241821464 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((83277377886617600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (10, 2), (16, 1)],
  term ((9881573146762240 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19394470160481166952 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-24777712819894412362 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((63458088176907605426 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-196979579353980336 : Rat) / 149717402626960975) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-454754301660292480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-324824501185923200 : Rat) / 17966088315235317) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 2), (16, 1)],
  term ((-1569494008923514112 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2667472681421094976 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3998325066279991744 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((383787303831100928 : Rat) / 29943480525392195) [(0, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-8454246395884093952 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((213456100779320960 : Rat) / 17966088315235317) [(0, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(0, 1), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((44031782468285054132 : Rat) / 449152207880882925) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((78995501112413812 : Rat) / 17966088315235317) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((-6332369083493095808 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-890634961413120 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((351608597791055672 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-5426051755374254902 : Rat) / 449152207880882925) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((120916126164344862 : Rat) / 5988696105078439) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-622493102787962380 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((21758338692608000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-200176715971993600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-106250170177390574 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1084293277787314400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-911136995505492326 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((9509381867238400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131746712998885114 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((55912951605145600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62945796903512320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-61621006323520000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82136472818398880 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-57599377318416654136 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-12062861185607680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((384111106776140800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-215102713723923200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-352696852883083520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-41638688943308800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((-1684407198483642928 : Rat) / 53898264945705951) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((98489789676990168 : Rat) / 149717402626960975) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((9697235080240583476 : Rat) / 449152207880882925) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((12388856409947206181 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31729044088453802713 : Rat) / 449152207880882925) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((227377150830146240 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-191893651915550464 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((784747004461757056 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1333736340710547488 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1999162533139995872 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((4227123197942046976 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((3675565533561356242 : Rat) / 53898264945705951) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((-22015891234142527066 : Rat) / 449152207880882925) [(0, 2), (5, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((3166184541746547904 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((842203599241821464 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (5, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-241832252328689724 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1244986205575924760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-211360978174151680 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-835222202955076424 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43516677385216000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((400353431943987200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((212500340354781148 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((16600624563891200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2168586555574628800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-10852103510748509804 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((703217195582111344 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1822273991010984652 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 2), (9, 2), (16, 1)],
  term ((-351608597791055672 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((5426051755374254902 : Rat) / 449152207880882925) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2373145012744104260 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19018763734476800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((164272945636797760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((16528488820917555772 : Rat) / 269491324728529755) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-111825903210291200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((125891593807024640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((123242012647040000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((24125722371215360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-351608597791055672 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((430205427447846400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((705393705766167040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-770640352722867200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((5426051755374254902 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((26112197104412160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 4), (16, 1)],
  term ((-196979579353980336 : Rat) / 149717402626960975) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-24777712819894412362 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((63458088176907605426 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19394470160481166952 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(1, 1), (5, 2), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-454754301660292480 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((529277455577233792 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-213456100779320960 : Rat) / 17966088315235317) [(1, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 2), (9, 1), (16, 1)],
  term ((383787303831100928 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2667472681421094976 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3998325066279991744 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1569494008923514112 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((324824501185923200 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1584993788061372032 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 3), (10, 1), (16, 1)],
  term ((-264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (16, 1)],
  term ((78995501112413812 : Rat) / 17966088315235317) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((44031782468285054132 : Rat) / 449152207880882925) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6332369083493095808 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((120916126164344862 : Rat) / 5988696105078439) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-622493102787962380 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((21758338692608000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-200176715971993600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-106250170177390574 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1084293277787314400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-911136995505492326 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((9509381867238400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131746712998885114 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((55912951605145600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62945796903512320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59202867152934400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82136472818398880 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-57599377318416654136 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-12062861185607680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((400142536081576960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-215102713723923200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-352696852883083520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-41638688943308800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((-703217195582111344 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((98489789676990168 : Rat) / 149717402626960975) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1369955906065939552 : Rat) / 29943480525392195) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((12388856409947206181 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31729044088453802713 : Rat) / 449152207880882925) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((227377150830146240 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-191893651915550464 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-160617072453988864 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1333736340710547488 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1999162533139995872 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((4227123197942046976 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-39497750556206906 : Rat) / 17966088315235317) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (14, 1), (16, 1)],
  term ((-22015891234142527066 : Rat) / 449152207880882925) [(1, 2), (5, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((3166184541746547904 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(1, 3), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-890634961413120 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (16, 1)],
  term ((351608597791055672 : Rat) / 17966088315235317) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-5426051755374254902 : Rat) / 449152207880882925) [(1, 3), (5, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 3), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(1, 3), (5, 2), (9, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((241832252328689724 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-120916126164344862 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((241832252328689724 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((283752877380620774 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((19763146293524480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((10016024495912960 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 4), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1244986205575924760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((211360978174151680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((622493102787962380 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (9, 3), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1351297302641597536 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((185250971743022080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((622493102787962380 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-487386786714419200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 4), (11, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 4), (15, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 5), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-400353431943987200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((487386786714419200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 4), (16, 1)],
  term ((-212500340354781148 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((200176715971993600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 2), (16, 1)],
  term ((1601203058781164896 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((106250170177390574 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (9, 1), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (9, 1), (15, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (9, 2), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 3), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-212500340354781148 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((106250170177390574 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-422111770636595200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((200176715971993600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 4), (16, 1)],
  term ((111825903210291200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125891593807024640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-123242012647040000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-164272945636797760 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-115198754636833308272 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((19018763734476800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-263493425997770228 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 3), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1822273991010984652 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((716002200690022400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-430205427447846400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-7125079691304960 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-705393705766167040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-24125722371215360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-1257449560069136474 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-24858014136524800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 3), (10, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 3), (11, 2), (16, 1)],
  term ((1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 4), (11, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((19394470160481166952 : Rat) / 449152207880882925) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((24777712819894412362 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63458088176907605426 : Rat) / 449152207880882925) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((196979579353980336 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-9509381867238400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-678946614191914562 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-21758338692608000 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 2), (16, 1)],
  term ((-55912951605145600 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((62945796903512320 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((61621006323520000 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((82136472818398880 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((57599377318416654136 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((12062861185607680 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-384111106776140800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((215102713723923200 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (13, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (8, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((352696852883083520 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 3), (10, 1), (16, 1)],
  term ((41638688943308800 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 3), (16, 1)],
  term ((-1822273991010984652 : Rat) / 53898264945705951) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-22148627520227466712 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-9697235080240583476 : Rat) / 449152207880882925) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-12388856409947206181 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((31729044088453802713 : Rat) / 449152207880882925) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 3), (9, 1), (10, 1), (16, 1)],
  term ((1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 3), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 3), (9, 2), (11, 1), (16, 1)],
  term ((911136995505492326 : Rat) / 53898264945705951) [(5, 1), (8, 3), (11, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 3), (13, 1), (16, 1)],
  term ((196979579353980336 : Rat) / 149717402626960975) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((24777712819894412362 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63458088176907605426 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((19394470160481166952 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-263493425997770228 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((19018763734476800 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-98489789676990168 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-164272945636797760 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5771618395102202348 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((111825903210291200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-125891593807024640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-123242012647040000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 3), (16, 1)],
  term ((-12388856409947206181 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((31729044088453802713 : Rat) / 449152207880882925) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-11211701412817920 : Rat) / 5988696105078439) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((131746712998885114 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-486118379052992000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-19763146293524480 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-214149302954218240 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((92204802208422400 : Rat) / 5988696105078439) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((82136472818398880 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((57599377318416654136 : Rat) / 1347456623642648775) [(5, 1), (9, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (11, 1), (16, 1)],
  term ((12062861185607680 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)],
  term ((-633943240435993600 : Rat) / 53898264945705951) [(5, 1), (9, 4), (11, 1), (16, 1)],
  term ((215102713723923200 : Rat) / 53898264945705951) [(5, 1), (9, 4), (13, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((352696852883083520 : Rat) / 53898264945705951) [(5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (9, 5), (10, 1), (16, 1)],
  term ((41638688943308800 : Rat) / 17966088315235317) [(5, 1), (9, 5), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (9, 2), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 4), (16, 1)],
  term ((454754301660292480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-227377150830146240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 3), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((454754301660292480 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-227377150830146240 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (16, 1)],
  term ((1569494008923514112 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2667472681421094976 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3998325066279991744 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-383787303831100928 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((8454246395884093952 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-213456100779320960 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((213456100779320960 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-44031782468285054132 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-78995501112413812 : Rat) / 17966088315235317) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((213456100779320960 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-550562350795131136 : Rat) / 29943480525392195) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-784747004461757056 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((1333736340710547488 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1999162533139995872 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((-4227123197942046976 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 2), (16, 1)],
  term ((39497750556206906 : Rat) / 17966088315235317) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (8, 2), (14, 1), (16, 1)],
  term ((22015891234142527066 : Rat) / 449152207880882925) [(5, 2), (8, 2), (16, 1)],
  term ((-106728050389660480 : Rat) / 17966088315235317) [(5, 2), (8, 3), (9, 1), (11, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 3), (9, 1), (13, 1), (16, 1)],
  term ((-78995501112413812 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-44031782468285054132 : Rat) / 449152207880882925) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-383787303831100928 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39497750556206906 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-2667472681421094976 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3998325066279991744 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1569494008923514112 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((22015891234142527066 : Rat) / 449152207880882925) [(5, 2), (9, 2), (16, 1)],
  term ((-213456100779320960 : Rat) / 17966088315235317) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((191893651915550464 : Rat) / 29943480525392195) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((4915598436638104960 : Rat) / 53898264945705951) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((1333736340710547488 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1999162533139995872 : Rat) / 269491324728529755) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (10, 1), (16, 1)],
  term ((-4227123197942046976 : Rat) / 89830441576176585) [(5, 2), (9, 4), (16, 1)],
  term ((6332369083493095808 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-3166184541746547904 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((6332369083493095808 : Rat) / 269491324728529755) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 3), (9, 3), (10, 1), (16, 1)],
  term ((-3166184541746547904 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 89. -/
theorem rs_R010_ueqv_R010YNN_block_24_0000_0089_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_24_0000_0089
      rs_R010_ueqv_R010YNN_block_24_0000_0089 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
