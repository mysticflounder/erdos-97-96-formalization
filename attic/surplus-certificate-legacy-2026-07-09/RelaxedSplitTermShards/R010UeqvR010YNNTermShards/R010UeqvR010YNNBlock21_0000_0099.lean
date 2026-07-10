/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 21:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_21_0000_0099 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0000 : Poly :=
[
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0000 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0000
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0001 : Poly :=
[
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0001 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0001
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0002 : Poly :=
[
  term ((-275483870322458888 : Rat) / 17966088315235317) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0002 : Poly :=
[
  term ((-550967740644917776 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-550967740644917776 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((275483870322458888 : Rat) / 17966088315235317) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((275483870322458888 : Rat) / 17966088315235317) [(0, 1), (5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0002
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0003 : Poly :=
[
  term ((9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0003 : Poly :=
[
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0003
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0004 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0004 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 3), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0004
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0005 : Poly :=
[
  term ((-27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0005 : Poly :=
[
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0005
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0006 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0006 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0006
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0007 : Poly :=
[
  term ((403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0007 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0007
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0008 : Poly :=
[
  term ((890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0008 : Poly :=
[
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((-890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0008
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0009 : Poly :=
[
  term ((-1070577781647611816 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0009 : Poly :=
[
  term ((-2141155563295223632 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-2141155563295223632 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1070577781647611816 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (11, 2), (16, 1)],
  term ((1070577781647611816 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0009
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0010 : Poly :=
[
  term ((17864013559330764706 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0010 : Poly :=
[
  term ((35728027118661529412 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((35728027118661529412 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-17864013559330764706 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-17864013559330764706 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0010
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0011 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0011 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 3), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0011
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0012 : Poly :=
[
  term ((-264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0012 : Poly :=
[
  term ((-529277455577233792 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0012
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0013 : Poly :=
[
  term ((6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0013 : Poly :=
[
  term ((13555823625881600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0013
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0014 : Poly :=
[
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0014 : Poly :=
[
  term ((-4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0014
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0015 : Poly :=
[
  term ((-153889062020556800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0015 : Poly :=
[
  term ((-307778124041113600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 4), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0015
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0016 : Poly :=
[
  term ((-30889514646578351096 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0016 : Poly :=
[
  term ((-61779029293156702192 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((30889514646578351096 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((30889514646578351096 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-61779029293156702192 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0016
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0017 : Poly :=
[
  term ((147005105176007680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0017 : Poly :=
[
  term ((294010210352015360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-147005105176007680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-147005105176007680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 3), (16, 1)],
  term ((294010210352015360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0017
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0018 : Poly :=
[
  term ((59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0018 : Poly :=
[
  term ((119357120807321600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0018
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0019 : Poly :=
[
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0019 : Poly :=
[
  term ((-10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0019
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0020 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0020 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0020
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0021 : Poly :=
[
  term ((362542129840758410414 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0021 : Poly :=
[
  term ((725084259681516820828 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((725084259681516820828 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-362542129840758410414 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-362542129840758410414 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0021
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0022 : Poly :=
[
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0022 : Poly :=
[
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0022
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0023 : Poly :=
[
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0023 : Poly :=
[
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0023
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0024 : Poly :=
[
  term ((8296259691505596992 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0024 : Poly :=
[
  term ((16592519383011193984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-8296259691505596992 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-8296259691505596992 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 3), (16, 1)],
  term ((16592519383011193984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0024
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0025 : Poly :=
[
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0025 : Poly :=
[
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0025
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0026 : Poly :=
[
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0026 : Poly :=
[
  term ((824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0026
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0027 : Poly :=
[
  term ((6109588643616199936 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0027 : Poly :=
[
  term ((12219177287232399872 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((12219177287232399872 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0027
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0028 : Poly :=
[
  term ((12825926084082369796 : Rat) / 269491324728529755) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 28 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0028 : Poly :=
[
  term ((25651852168164739592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((25651852168164739592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-12825926084082369796 : Rat) / 269491324728529755) [(4, 1), (5, 2), (10, 2), (16, 1)],
  term ((-12825926084082369796 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0028
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0029 : Poly :=
[
  term ((-298734458473846912 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 1), (16, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0029 : Poly :=
[
  term ((-597468916947693824 : Rat) / 5988696105078439) [(4, 1), (5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-597468916947693824 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0029
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0030 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0030 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0030
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0031 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 31 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0031 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0031
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0032 : Poly :=
[
  term ((-229298578321478420 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0032 : Poly :=
[
  term ((-458597156642956840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((229298578321478420 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((229298578321478420 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-458597156642956840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0032
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0033 : Poly :=
[
  term ((-60923348339302400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 33 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0033 : Poly :=
[
  term ((-121846696678604800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((60923348339302400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((60923348339302400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 3), (16, 1)],
  term ((-121846696678604800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0033
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0034 : Poly :=
[
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0034 : Poly :=
[
  term ((-211360978174151680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-211360978174151680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0034
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0035 : Poly :=
[
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0035 : Poly :=
[
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 2), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 2), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0035
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0036 : Poly :=
[
  term ((-21149399011708954 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0036 : Poly :=
[
  term ((-42298798023417908 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-42298798023417908 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((21149399011708954 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((21149399011708954 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0036
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0037 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0037 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0037
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0038 : Poly :=
[
  term ((-417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0038 : Poly :=
[
  term ((-835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0038
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0039 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0039 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0039
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0040 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0040 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0040
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0041 : Poly :=
[
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 41 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0041 : Poly :=
[
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0041
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0042 : Poly :=
[
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 42 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0042 : Poly :=
[
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0042
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0043 : Poly :=
[
  term ((-47868345123737600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0043 : Poly :=
[
  term ((-95736690247475200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((47868345123737600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((47868345123737600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 3), (16, 1)],
  term ((-95736690247475200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0043
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0044 : Poly :=
[
  term ((-98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0044 : Poly :=
[
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0044
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0045 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 45 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0045 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0045
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0046 : Poly :=
[
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 46 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0046 : Poly :=
[
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0046
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0047 : Poly :=
[
  term ((344400026948536634 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 47 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0047 : Poly :=
[
  term ((688800053897073268 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((688800053897073268 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-344400026948536634 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-344400026948536634 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0047
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0048 : Poly :=
[
  term ((-74839971890490496 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 48 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0048 : Poly :=
[
  term ((-149679943780980992 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-149679943780980992 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((74839971890490496 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((74839971890490496 : Rat) / 53898264945705951) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0048
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0049 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 49 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0049 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0049
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0050 : Poly :=
[
  term ((33699416846144000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 50 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0050 : Poly :=
[
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 4), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 3), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0050
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0051 : Poly :=
[
  term ((1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 51 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0051 : Poly :=
[
  term ((-1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1084293277787314400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((2168586555574628800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2168586555574628800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0051
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0052 : Poly :=
[
  term ((17215692794961920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 52 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0052 : Poly :=
[
  term ((-17215692794961920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-17215692794961920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 3), (16, 1)],
  term ((34431385589923840 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 2), (16, 1)],
  term ((34431385589923840 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0052
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0053 : Poly :=
[
  term ((94849652003251419998 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0053 : Poly :=
[
  term ((189699304006502839996 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-94849652003251419998 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-94849652003251419998 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (11, 3), (16, 1)],
  term ((189699304006502839996 : Rat) / 4042369870927946325) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0053
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0054 : Poly :=
[
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0054 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0054
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0055 : Poly :=
[
  term ((-22592928439782400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 55 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0055 : Poly :=
[
  term ((-45185856879564800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((22592928439782400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 3), (13, 1), (16, 1)],
  term ((22592928439782400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 3), (11, 1), (13, 1), (16, 1)],
  term ((-45185856879564800 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0055
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0056 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0056 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0056
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0057 : Poly :=
[
  term ((36395380815255879098 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 57 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0057 : Poly :=
[
  term ((72790761630511758196 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-36395380815255879098 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-36395380815255879098 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 3), (16, 1)],
  term ((72790761630511758196 : Rat) / 4042369870927946325) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0057
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0058 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 58 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0058 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 3), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 4), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0058
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0059 : Poly :=
[
  term ((-89559324400716800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 59 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0059 : Poly :=
[
  term ((-179118648801433600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((89559324400716800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((89559324400716800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-179118648801433600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0059
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0060 : Poly :=
[
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0060 : Poly :=
[
  term ((3224185560780800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0060
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0061 : Poly :=
[
  term ((178167703762737920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0061 : Poly :=
[
  term ((356335407525475840 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-178167703762737920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-178167703762737920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((356335407525475840 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0061
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0062 : Poly :=
[
  term ((81246326182336000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 62 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0062 : Poly :=
[
  term ((162492652364672000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-81246326182336000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-81246326182336000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 4), (16, 1)],
  term ((162492652364672000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0062
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0063 : Poly :=
[
  term ((-128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0063 : Poly :=
[
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0063
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0064 : Poly :=
[
  term ((253091977983298720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 64 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0064 : Poly :=
[
  term ((506183955966597440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-253091977983298720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-253091977983298720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((506183955966597440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0064
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0065 : Poly :=
[
  term ((1852816038888487208 : Rat) / 449152207880882925) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 65 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0065 : Poly :=
[
  term ((3705632077776974416 : Rat) / 449152207880882925) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1852816038888487208 : Rat) / 449152207880882925) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1852816038888487208 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((3705632077776974416 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0065
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0066 : Poly :=
[
  term ((33699416846144000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 66 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0066 : Poly :=
[
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 3), (16, 1)],
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (11, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0066
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0067 : Poly :=
[
  term ((90738470446131200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0067 : Poly :=
[
  term ((181476940892262400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-90738470446131200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-90738470446131200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (13, 1), (16, 1)],
  term ((181476940892262400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0067
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0068 : Poly :=
[
  term ((-44381911108165120 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 68 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0068 : Poly :=
[
  term ((-88763822216330240 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((44381911108165120 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((44381911108165120 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 3), (16, 1)],
  term ((-88763822216330240 : Rat) / 5988696105078439) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0068
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0069 : Poly :=
[
  term ((216896019624712960 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 69 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0069 : Poly :=
[
  term ((433792039249425920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-216896019624712960 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-216896019624712960 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((433792039249425920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0069
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0070 : Poly :=
[
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0070 : Poly :=
[
  term ((7125079691304960 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0070
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0071 : Poly :=
[
  term ((-83634221728072960 : Rat) / 17966088315235317) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0071 : Poly :=
[
  term ((-167268443456145920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((83634221728072960 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((83634221728072960 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-167268443456145920 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0071
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0072 : Poly :=
[
  term ((-35004320067297280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 72 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0072 : Poly :=
[
  term ((-70008640134594560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (10, 2), (16, 1)],
  term ((35004320067297280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 2), (16, 1)],
  term ((35004320067297280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 3), (16, 1)],
  term ((-70008640134594560 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0072
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0073 : Poly :=
[
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 73 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0073 : Poly :=
[
  term ((3586611801579520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0073
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0074 : Poly :=
[
  term ((15111540216874069052 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 74 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0074 : Poly :=
[
  term ((30223080433748138104 : Rat) / 269491324728529755) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((30223080433748138104 : Rat) / 269491324728529755) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-15111540216874069052 : Rat) / 269491324728529755) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15111540216874069052 : Rat) / 269491324728529755) [(5, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0074
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0075 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 75 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0075 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0075
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0076 : Poly :=
[
  term ((-67313759836453378814 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 76 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0076 : Poly :=
[
  term ((-134627519672906757628 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-134627519672906757628 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((67313759836453378814 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((67313759836453378814 : Rat) / 1347456623642648775) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0076
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0077 : Poly :=
[
  term ((-655211517970671757 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 77 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0077 : Poly :=
[
  term ((-1310423035941343514 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1310423035941343514 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((655211517970671757 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((655211517970671757 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0077
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0078 : Poly :=
[
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0078 : Poly :=
[
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0078
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0079 : Poly :=
[
  term ((18822673759502942053 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0079 : Poly :=
[
  term ((37645347519005884106 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((37645347519005884106 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18822673759502942053 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-18822673759502942053 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0079
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0080 : Poly :=
[
  term ((51043850186359360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 80 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0080 : Poly :=
[
  term ((102087700372718720 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-51043850186359360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-51043850186359360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 3), (16, 1)],
  term ((102087700372718720 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0080
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0081 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 81 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0081 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0081
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0082 : Poly :=
[
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0082 : Poly :=
[
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0082
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0083 : Poly :=
[
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 83 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0083 : Poly :=
[
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 2), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0083
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0084 : Poly :=
[
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 84 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0084 : Poly :=
[
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0084
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0085 : Poly :=
[
  term ((-51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 85 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0085 : Poly :=
[
  term ((-102087700372718720 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 3), (16, 1)],
  term ((-102087700372718720 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0085
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0086 : Poly :=
[
  term ((482596401761943040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 86 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0086 : Poly :=
[
  term ((965192803523886080 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-482596401761943040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-482596401761943040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((965192803523886080 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0086
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0087 : Poly :=
[
  term ((-1975583483567928256 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 87 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0087 : Poly :=
[
  term ((1975583483567928256 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((1975583483567928256 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-3951166967135856512 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-3951166967135856512 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0087
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0088 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 88 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0088 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0088
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0089 : Poly :=
[
  term ((-239060424611119232 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 89 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0089 : Poly :=
[
  term ((-478120849222238464 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((239060424611119232 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((239060424611119232 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-478120849222238464 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0089
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0090 : Poly :=
[
  term ((1530703213329198272 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 90 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0090 : Poly :=
[
  term ((3061406426658396544 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1530703213329198272 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1530703213329198272 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 3), (16, 1)],
  term ((3061406426658396544 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0090_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0090
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0091 : Poly :=
[
  term ((-6324419773604260064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 91 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0091 : Poly :=
[
  term ((-12648839547208520128 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((6324419773604260064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((6324419773604260064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-12648839547208520128 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0091_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0091
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0092 : Poly :=
[
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0092 : Poly :=
[
  term ((110258185823109632 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0092_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0092
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0093 : Poly :=
[
  term ((1246228880297602784 : Rat) / 29943480525392195) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0093 : Poly :=
[
  term ((2492457760595205568 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1246228880297602784 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1246228880297602784 : Rat) / 29943480525392195) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2492457760595205568 : Rat) / 29943480525392195) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0093_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0093
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0094 : Poly :=
[
  term ((-302767659890441152 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 94 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0094 : Poly :=
[
  term ((-605535319780882304 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((302767659890441152 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((302767659890441152 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 3), (16, 1)],
  term ((-605535319780882304 : Rat) / 29943480525392195) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0094_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0094
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0095 : Poly :=
[
  term ((-1014114991371369728 : Rat) / 29943480525392195) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 95 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0095 : Poly :=
[
  term ((-2028229982742739456 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((1014114991371369728 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 2), (16, 1)],
  term ((1014114991371369728 : Rat) / 29943480525392195) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-2028229982742739456 : Rat) / 29943480525392195) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0095_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0095
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0096 : Poly :=
[
  term ((-223980297485327155118 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 96 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0096 : Poly :=
[
  term ((-447960594970654310236 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((-447960594970654310236 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((223980297485327155118 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (11, 2), (16, 1)],
  term ((223980297485327155118 : Rat) / 1347456623642648775) [(5, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0096_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0096
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0097 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 97 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0097 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0097_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0097
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0098 : Poly :=
[
  term ((43789549927203086212 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 98 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0098 : Poly :=
[
  term ((87579099854406172424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((87579099854406172424 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-43789549927203086212 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (16, 1)],
  term ((-43789549927203086212 : Rat) / 1347456623642648775) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0098_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0098
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 21. -/
def rs_R010_ueqv_R010YNN_coefficient_21_0099 : Poly :=
[
  term ((-10676283133090895936 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 99 for generator 21. -/
def rs_R010_ueqv_R010YNN_partial_21_0099 : Poly :=
[
  term ((-21352566266181791872 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((10676283133090895936 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((10676283133090895936 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 3), (16, 1)],
  term ((-21352566266181791872 : Rat) / 269491324728529755) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 21. -/
theorem rs_R010_ueqv_R010YNN_partial_21_0099_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_21_0099
        rs_R010_ueqv_R010YNN_generator_21_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_21_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_21_0000_0099 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_21_0000,
  rs_R010_ueqv_R010YNN_partial_21_0001,
  rs_R010_ueqv_R010YNN_partial_21_0002,
  rs_R010_ueqv_R010YNN_partial_21_0003,
  rs_R010_ueqv_R010YNN_partial_21_0004,
  rs_R010_ueqv_R010YNN_partial_21_0005,
  rs_R010_ueqv_R010YNN_partial_21_0006,
  rs_R010_ueqv_R010YNN_partial_21_0007,
  rs_R010_ueqv_R010YNN_partial_21_0008,
  rs_R010_ueqv_R010YNN_partial_21_0009,
  rs_R010_ueqv_R010YNN_partial_21_0010,
  rs_R010_ueqv_R010YNN_partial_21_0011,
  rs_R010_ueqv_R010YNN_partial_21_0012,
  rs_R010_ueqv_R010YNN_partial_21_0013,
  rs_R010_ueqv_R010YNN_partial_21_0014,
  rs_R010_ueqv_R010YNN_partial_21_0015,
  rs_R010_ueqv_R010YNN_partial_21_0016,
  rs_R010_ueqv_R010YNN_partial_21_0017,
  rs_R010_ueqv_R010YNN_partial_21_0018,
  rs_R010_ueqv_R010YNN_partial_21_0019,
  rs_R010_ueqv_R010YNN_partial_21_0020,
  rs_R010_ueqv_R010YNN_partial_21_0021,
  rs_R010_ueqv_R010YNN_partial_21_0022,
  rs_R010_ueqv_R010YNN_partial_21_0023,
  rs_R010_ueqv_R010YNN_partial_21_0024,
  rs_R010_ueqv_R010YNN_partial_21_0025,
  rs_R010_ueqv_R010YNN_partial_21_0026,
  rs_R010_ueqv_R010YNN_partial_21_0027,
  rs_R010_ueqv_R010YNN_partial_21_0028,
  rs_R010_ueqv_R010YNN_partial_21_0029,
  rs_R010_ueqv_R010YNN_partial_21_0030,
  rs_R010_ueqv_R010YNN_partial_21_0031,
  rs_R010_ueqv_R010YNN_partial_21_0032,
  rs_R010_ueqv_R010YNN_partial_21_0033,
  rs_R010_ueqv_R010YNN_partial_21_0034,
  rs_R010_ueqv_R010YNN_partial_21_0035,
  rs_R010_ueqv_R010YNN_partial_21_0036,
  rs_R010_ueqv_R010YNN_partial_21_0037,
  rs_R010_ueqv_R010YNN_partial_21_0038,
  rs_R010_ueqv_R010YNN_partial_21_0039,
  rs_R010_ueqv_R010YNN_partial_21_0040,
  rs_R010_ueqv_R010YNN_partial_21_0041,
  rs_R010_ueqv_R010YNN_partial_21_0042,
  rs_R010_ueqv_R010YNN_partial_21_0043,
  rs_R010_ueqv_R010YNN_partial_21_0044,
  rs_R010_ueqv_R010YNN_partial_21_0045,
  rs_R010_ueqv_R010YNN_partial_21_0046,
  rs_R010_ueqv_R010YNN_partial_21_0047,
  rs_R010_ueqv_R010YNN_partial_21_0048,
  rs_R010_ueqv_R010YNN_partial_21_0049,
  rs_R010_ueqv_R010YNN_partial_21_0050,
  rs_R010_ueqv_R010YNN_partial_21_0051,
  rs_R010_ueqv_R010YNN_partial_21_0052,
  rs_R010_ueqv_R010YNN_partial_21_0053,
  rs_R010_ueqv_R010YNN_partial_21_0054,
  rs_R010_ueqv_R010YNN_partial_21_0055,
  rs_R010_ueqv_R010YNN_partial_21_0056,
  rs_R010_ueqv_R010YNN_partial_21_0057,
  rs_R010_ueqv_R010YNN_partial_21_0058,
  rs_R010_ueqv_R010YNN_partial_21_0059,
  rs_R010_ueqv_R010YNN_partial_21_0060,
  rs_R010_ueqv_R010YNN_partial_21_0061,
  rs_R010_ueqv_R010YNN_partial_21_0062,
  rs_R010_ueqv_R010YNN_partial_21_0063,
  rs_R010_ueqv_R010YNN_partial_21_0064,
  rs_R010_ueqv_R010YNN_partial_21_0065,
  rs_R010_ueqv_R010YNN_partial_21_0066,
  rs_R010_ueqv_R010YNN_partial_21_0067,
  rs_R010_ueqv_R010YNN_partial_21_0068,
  rs_R010_ueqv_R010YNN_partial_21_0069,
  rs_R010_ueqv_R010YNN_partial_21_0070,
  rs_R010_ueqv_R010YNN_partial_21_0071,
  rs_R010_ueqv_R010YNN_partial_21_0072,
  rs_R010_ueqv_R010YNN_partial_21_0073,
  rs_R010_ueqv_R010YNN_partial_21_0074,
  rs_R010_ueqv_R010YNN_partial_21_0075,
  rs_R010_ueqv_R010YNN_partial_21_0076,
  rs_R010_ueqv_R010YNN_partial_21_0077,
  rs_R010_ueqv_R010YNN_partial_21_0078,
  rs_R010_ueqv_R010YNN_partial_21_0079,
  rs_R010_ueqv_R010YNN_partial_21_0080,
  rs_R010_ueqv_R010YNN_partial_21_0081,
  rs_R010_ueqv_R010YNN_partial_21_0082,
  rs_R010_ueqv_R010YNN_partial_21_0083,
  rs_R010_ueqv_R010YNN_partial_21_0084,
  rs_R010_ueqv_R010YNN_partial_21_0085,
  rs_R010_ueqv_R010YNN_partial_21_0086,
  rs_R010_ueqv_R010YNN_partial_21_0087,
  rs_R010_ueqv_R010YNN_partial_21_0088,
  rs_R010_ueqv_R010YNN_partial_21_0089,
  rs_R010_ueqv_R010YNN_partial_21_0090,
  rs_R010_ueqv_R010YNN_partial_21_0091,
  rs_R010_ueqv_R010YNN_partial_21_0092,
  rs_R010_ueqv_R010YNN_partial_21_0093,
  rs_R010_ueqv_R010YNN_partial_21_0094,
  rs_R010_ueqv_R010YNN_partial_21_0095,
  rs_R010_ueqv_R010YNN_partial_21_0096,
  rs_R010_ueqv_R010YNN_partial_21_0097,
  rs_R010_ueqv_R010YNN_partial_21_0098,
  rs_R010_ueqv_R010YNN_partial_21_0099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_21_0000_0099 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-550967740644917776 : Rat) / 17966088315235317) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-550967740644917776 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((3731716988088320 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((275483870322458888 : Rat) / 17966088315235317) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((275483870322458888 : Rat) / 17966088315235317) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((27564546455777408 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 3), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 2), (11, 2), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((35728027118661529412 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-2141155563295223632 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-2141155563295223632 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((35728027118661529412 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-403023195097600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((-890634961413120 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((-1865858494044160 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((1070577781647611816 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (11, 2), (16, 1)],
  term ((-17864013559330764706 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((1070577781647611816 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 3), (16, 1)],
  term ((-17864013559330764706 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 3), (16, 1)],
  term ((264638727788616896 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-529277455577233792 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-307778124041113600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-61779029293156702192 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((294010210352015360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((725084259681516820828 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((30889514646578351096 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((251991258109365057308 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 4), (16, 1)],
  term ((-147005105176007680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-61779029293156702192 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((62323852229273600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((5004840763847680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-748793439569136640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 2), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((864242003783710720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 4), (11, 1), (16, 1)],
  term ((-362542129840758410414 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-362542129840758410414 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (11, 3), (16, 1)],
  term ((16592519383011193984 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((12219177287232399872 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((25651852168164739592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-8296259691505596992 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((25651852168164739592 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8296259691505596992 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 3), (16, 1)],
  term ((-6109588643616199936 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((43667969505417382016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((12219177287232399872 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-12825926084082369796 : Rat) / 269491324728529755) [(4, 1), (5, 2), (10, 2), (16, 1)],
  term ((-12825926084082369796 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 2), (16, 1)],
  term ((-597468916947693824 : Rat) / 5988696105078439) [(4, 1), (5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((298734458473846912 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-597468916947693824 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-458597156642956840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-121846696678604800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-211360978174151680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((-42298798023417908 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((229298578321478420 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-835222202955076424 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((102402184251224696 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((60923348339302400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-458597156642956840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((53460476224816640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((60923348339302400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 3), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 2), (16, 1)],
  term ((-211360978174151680 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-348133419081728000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 2), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 4), (11, 1), (16, 1)],
  term ((21149399011708954 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((417611101477538212 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((21149399011708954 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 3), (16, 1)],
  term ((-95736690247475200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((295913406219468800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((-149679943780980992 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((2813846142548965864 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((688800053897073268 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((47868345123737600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-149679943780980992 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((98687813718334400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((47868345123737600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 3), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 3), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-322023412650598400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-344400026948536634 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((74839971890490496 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-344400026948536634 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 3), (16, 1)],
  term ((74839971890490496 : Rat) / 53898264945705951) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-179118648801433600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((356335407525475840 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((136382645933542400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((506183955966597440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((3705632077776974416 : Rat) / 449152207880882925) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-45185856879564800 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8531234203536821804 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 3), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((108377308172454259996 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 4), (16, 1)],
  term ((-248884795694904320 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((433792039249425920 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-167268443456145920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((50183140897326080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((181476940892262400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((2168586555574628800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((50183140897326080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 3), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (10, 1), (16, 1)],
  term ((-70008640134594560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (10, 2), (16, 1)],
  term ((34431385589923840 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (11, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-134627519672906757628 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1310423035941343514 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((37645347519005884106 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-94849652003251419998 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((9365619497478227528 : Rat) / 89830441576176585) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-94849652003251419998 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (11, 3), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((2168586555574628800 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (8, 2), (9, 1), (10, 2), (16, 1)],
  term ((34431385589923840 : Rat) / 53898264945705951) [(5, 1), (8, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((189699304006502839996 : Rat) / 4042369870927946325) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((30223080433748138104 : Rat) / 269491324728529755) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36395380815255879098 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((22592928439782400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 3), (13, 1), (16, 1)],
  term ((89559324400716800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178167703762737920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-68191322966771200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-253091977983298720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1852816038888487208 : Rat) / 449152207880882925) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((22592928439782400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 3), (11, 1), (13, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-36395380815255879098 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 3), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 4), (16, 1)],
  term ((-1310423035941343514 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((37645347519005884106 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((128294157833834720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-253091977983298720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-140185967789572219252 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((89559324400716800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-178167703762737920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-81246326182336000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 4), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((72790761630511758196 : Rat) / 4042369870927946325) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-226296041084825600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 3), (16, 1)],
  term ((124442397847452160 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-216896019624712960 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((83634221728072960 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-33699416846144000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (11, 1), (16, 1)],
  term ((-90738470446131200 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (13, 1), (16, 1)],
  term ((-256588315667669440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((506183955966597440 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((3705632077776974416 : Rat) / 449152207880882925) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-396014668426146560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-7463433976176640 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((607238072709694720 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((561929852338158080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 3), (16, 1)],
  term ((181476940892262400 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((102403153759585280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 2), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((35004320067297280 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 3), (16, 1)],
  term ((433792039249425920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-167268443456145920 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-800667705847761920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-70008640134594560 : Rat) / 53898264945705951) [(5, 1), (9, 4), (10, 1), (11, 1), (16, 1)],
  term ((3586611801579520 : Rat) / 53898264945705951) [(5, 1), (9, 4), (11, 1), (16, 1)],
  term ((-15111540216874069052 : Rat) / 269491324728529755) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((67313759836453378814 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((655211517970671757 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18822673759502942053 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-15111540216874069052 : Rat) / 269491324728529755) [(5, 1), (10, 3), (13, 1), (16, 1)],
  term ((655211517970671757 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18822673759502942053 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((67313759836453378814 : Rat) / 1347456623642648775) [(5, 1), (11, 3), (16, 1)],
  term ((102087700372718720 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-51043850186359360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-51043850186359360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 3), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((352666601287573760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((965192803523886080 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-352666601287573760 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-482596401761943040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((51043850186359360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 3), (16, 1)],
  term ((-482596401761943040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-102087700372718720 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((965192803523886080 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((3061406426658396544 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12648839547208520128 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2492457760595205568 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1975583483567928256 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-700857650035442944 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1975583483567928256 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-2028229982742739456 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-605535319780882304 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3951166967135856512 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((87579099854406172424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-447960594970654310236 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((-3951166967135856512 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-447960594970654310236 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((239060424611119232 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1530703213329198272 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((6324419773604260064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1246228880297602784 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((239060424611119232 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((87579099854406172424 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((6324419773604260064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1246228880297602784 : Rat) / 29943480525392195) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1530703213329198272 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 3), (16, 1)],
  term ((-478120849222238464 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((302767659890441152 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((1014114991371369728 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 2), (16, 1)],
  term ((302767659890441152 : Rat) / 29943480525392195) [(5, 2), (9, 2), (10, 3), (16, 1)],
  term ((-12648839547208520128 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2492457760595205568 : Rat) / 29943480525392195) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((12188441349000724096 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-605535319780882304 : Rat) / 29943480525392195) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((-2028229982742739456 : Rat) / 29943480525392195) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((223980297485327155118 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (11, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((-43789549927203086212 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (16, 1)],
  term ((223980297485327155118 : Rat) / 1347456623642648775) [(5, 2), (10, 3), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((-43789549927203086212 : Rat) / 1347456623642648775) [(5, 2), (11, 2), (16, 1)],
  term ((-21352566266181791872 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((10676283133090895936 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((10676283133090895936 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 3), (16, 1)],
  term ((-21352566266181791872 : Rat) / 269491324728529755) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 99. -/
theorem rs_R010_ueqv_R010YNN_block_21_0000_0099_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_21_0000_0099
      rs_R010_ueqv_R010YNN_block_21_0000_0099 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
