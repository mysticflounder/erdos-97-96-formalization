/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 10:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_10_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0100 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0100 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0100
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0101 : Poly :=
[
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0101 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0101
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0102 : Poly :=
[
  term ((1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0102 : Poly :=
[
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0102
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0103 : Poly :=
[
  term ((-2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0103 : Poly :=
[
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0103
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0104 : Poly :=
[
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 104 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0104 : Poly :=
[
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0104
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0105 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0105 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0105
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0106 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0106 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0106
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0107 : Poly :=
[
  term ((-1225465249863840477664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0107 : Poly :=
[
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1225465249863840477664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0107
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0108 : Poly :=
[
  term ((2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0108 : Poly :=
[
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0108
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0109 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0109 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0109
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0110 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0110 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0110
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0111 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0111 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0111
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0112 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0112 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0112
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0113 : Poly :=
[
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 113 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0113 : Poly :=
[
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0113
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0114 : Poly :=
[
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0114 : Poly :=
[
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0114
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0115 : Poly :=
[
  term ((-1716648994661777862532 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0115 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1716648994661777862532 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0115
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0116 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0116 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0116
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0117 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 117 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0117 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0117
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0118 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0118 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0118
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0119 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0119 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0119
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0120 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0120 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0120
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0121 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0121 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0121
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0122 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0122 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0122
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0123 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0123 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0123
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0124 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0124 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0124
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0125 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 125 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0125 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0125
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0126 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0126 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0126
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0127 : Poly :=
[
  term ((862827549505294208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 127 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0127 : Poly :=
[
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0127
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0128 : Poly :=
[
  term ((-1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0128 : Poly :=
[
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0128
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0129 : Poly :=
[
  term ((-211821591221569757264 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0129 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((211821591221569757264 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0129
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0130 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0130 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0130
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0131 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0131 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0131
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0132 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 132 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0132 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0132
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0133 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0133 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0133_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0133
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0134 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 134 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0134 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0134_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0134
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0135 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0135 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (13, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0135_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0135
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0136 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0136 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0136_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0136
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0137 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0137 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0137_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0137
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0138 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0138 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0138_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0138
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0139 : Poly :=
[
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 139 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0139 : Poly :=
[
  term (4 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0139_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0139
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0140 : Poly :=
[
  term (-4 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0140 : Poly :=
[
  term (-8 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0140_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0140
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0141 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 141 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0141 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0141_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0141
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0142 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0142 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0142_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0142
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0143 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0143 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0143_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0143
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0144 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 144 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0144 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0144_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0144
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0145 : Poly :=
[
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 145 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0145 : Poly :=
[
  term ((-395005826415140048 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0145_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0145
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0146 : Poly :=
[
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 146 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0146 : Poly :=
[
  term ((-191473380494950400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0146_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0146
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0147 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0147 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0147_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0147
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0148 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 148 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0148 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0148_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0148
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0149 : Poly :=
[
  term ((272678602443404492 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 149 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0149 : Poly :=
[
  term ((545357204886808984 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0149_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0149
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0150 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 150 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0150 : Poly :=
[
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0150_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0150
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0151 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0151 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0151_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0151
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0152 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 152 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0152 : Poly :=
[
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0152_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0152
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0153 : Poly :=
[
  term ((-78333239738443260454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 153 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0153 : Poly :=
[
  term ((-156666479476886520908 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((78333239738443260454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0153_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0153
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0154 : Poly :=
[
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 154 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0154 : Poly :=
[
  term ((40281548246553600 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0154_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0154
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0155 : Poly :=
[
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0155 : Poly :=
[
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0155_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0155
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0156 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0156 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0156_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0156
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0157 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 157 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0157 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0157_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0157
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0158 : Poly :=
[
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 158 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0158 : Poly :=
[
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0158_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0158
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0159 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0159 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0159_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0159
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0160 : Poly :=
[
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 160 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0160 : Poly :=
[
  term ((51500840302832738036 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0160_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0160
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0161 : Poly :=
[
  term ((3599798397893125120 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0161 : Poly :=
[
  term ((7199596795786250240 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3599798397893125120 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0161_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0161
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0162 : Poly :=
[
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 162 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0162 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0162_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0162
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0163 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 163 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0163 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0163_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0163
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0164 : Poly :=
[
  term ((138554805788356176904 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 164 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0164 : Poly :=
[
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-138554805788356176904 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0164_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0164
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0165 : Poly :=
[
  term ((53317499064990720 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 165 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0165 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0165_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0165
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0166 : Poly :=
[
  term ((869898752894653440 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0166 : Poly :=
[
  term ((1739797505789306880 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-869898752894653440 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0166_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0166
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0167 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 167 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0167 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0167_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0167
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0168 : Poly :=
[
  term ((26757673303976090662 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 168 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0168 : Poly :=
[
  term ((53515346607952181324 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-26757673303976090662 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0168_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0168
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0169 : Poly :=
[
  term ((454167427564475068424 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0169 : Poly :=
[
  term ((908334855128950136848 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-454167427564475068424 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0169_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0169
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0170 : Poly :=
[
  term ((-27699940732493577410 : Rat) / 161694794837117853) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 170 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0170 : Poly :=
[
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((27699940732493577410 : Rat) / 161694794837117853) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0170_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0170
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0171 : Poly :=
[
  term ((-1045803894933418880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0171 : Poly :=
[
  term ((-2091607789866837760 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1045803894933418880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0171_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0171
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0172 : Poly :=
[
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0172 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0172_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0172
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0173 : Poly :=
[
  term ((6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 173 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0173 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0173_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0173
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0174 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0174 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0174_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0174
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0175 : Poly :=
[
  term ((75261236453939200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 175 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0175 : Poly :=
[
  term ((150522472907878400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-75261236453939200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0175_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0175
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0176 : Poly :=
[
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0176 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0176_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0176
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0177 : Poly :=
[
  term ((31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 177 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0177 : Poly :=
[
  term ((62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0177_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0177
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0178 : Poly :=
[
  term ((119661039663058097312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 178 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0178 : Poly :=
[
  term ((239322079326116194624 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-119661039663058097312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0178_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0178
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0179 : Poly :=
[
  term ((3330156256705778612 : Rat) / 29943480525392195) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 179 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0179 : Poly :=
[
  term ((6660312513411557224 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-3330156256705778612 : Rat) / 29943480525392195) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0179_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0179
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0180 : Poly :=
[
  term ((235464596084211200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 180 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0180 : Poly :=
[
  term ((470929192168422400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0180_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0180
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0181 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0181 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0181_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0181
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0182 : Poly :=
[
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0182 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0182_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0182
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0183 : Poly :=
[
  term ((-285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 183 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0183 : Poly :=
[
  term ((-571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0183_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0183
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0184 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0184 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0184_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0184
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0185 : Poly :=
[
  term ((-802369367604044800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 185 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0185 : Poly :=
[
  term ((-1604738735208089600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((802369367604044800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0185_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0185
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0186 : Poly :=
[
  term ((-616680137480653614832 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0186 : Poly :=
[
  term ((-1233360274961307229664 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((616680137480653614832 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0186_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0186
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0187 : Poly :=
[
  term ((-1110220361386823680 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 187 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0187 : Poly :=
[
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0187_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0187
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0188 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0188 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0188_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0188
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0189 : Poly :=
[
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0189 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0189_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0189
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0190 : Poly :=
[
  term ((540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 190 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0190 : Poly :=
[
  term ((1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0190_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0190
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0191 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 191 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0191 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0191_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0191
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0192 : Poly :=
[
  term ((439990883091343360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 192 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0192 : Poly :=
[
  term ((879981766182686720 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-439990883091343360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0192_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0192
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0193 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0193 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0193_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0193
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0194 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 194 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0194 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0194_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0194
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0195 : Poly :=
[
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0195 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0195_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0195
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0196 : Poly :=
[
  term ((6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 196 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0196 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0196_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0196
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0197 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 197 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0197 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0197_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0197
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0198 : Poly :=
[
  term ((-20884666352077693544 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 198 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0198 : Poly :=
[
  term ((-41769332704155387088 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((20884666352077693544 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0198_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0198
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0199 : Poly :=
[
  term (2 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 199 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0199 : Poly :=
[
  term (4 : Rat) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0199_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0199
        rs_R010_ueqv_R010YNN_generator_10_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_10_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_10_0100_0199 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_10_0100,
  rs_R010_ueqv_R010YNN_partial_10_0101,
  rs_R010_ueqv_R010YNN_partial_10_0102,
  rs_R010_ueqv_R010YNN_partial_10_0103,
  rs_R010_ueqv_R010YNN_partial_10_0104,
  rs_R010_ueqv_R010YNN_partial_10_0105,
  rs_R010_ueqv_R010YNN_partial_10_0106,
  rs_R010_ueqv_R010YNN_partial_10_0107,
  rs_R010_ueqv_R010YNN_partial_10_0108,
  rs_R010_ueqv_R010YNN_partial_10_0109,
  rs_R010_ueqv_R010YNN_partial_10_0110,
  rs_R010_ueqv_R010YNN_partial_10_0111,
  rs_R010_ueqv_R010YNN_partial_10_0112,
  rs_R010_ueqv_R010YNN_partial_10_0113,
  rs_R010_ueqv_R010YNN_partial_10_0114,
  rs_R010_ueqv_R010YNN_partial_10_0115,
  rs_R010_ueqv_R010YNN_partial_10_0116,
  rs_R010_ueqv_R010YNN_partial_10_0117,
  rs_R010_ueqv_R010YNN_partial_10_0118,
  rs_R010_ueqv_R010YNN_partial_10_0119,
  rs_R010_ueqv_R010YNN_partial_10_0120,
  rs_R010_ueqv_R010YNN_partial_10_0121,
  rs_R010_ueqv_R010YNN_partial_10_0122,
  rs_R010_ueqv_R010YNN_partial_10_0123,
  rs_R010_ueqv_R010YNN_partial_10_0124,
  rs_R010_ueqv_R010YNN_partial_10_0125,
  rs_R010_ueqv_R010YNN_partial_10_0126,
  rs_R010_ueqv_R010YNN_partial_10_0127,
  rs_R010_ueqv_R010YNN_partial_10_0128,
  rs_R010_ueqv_R010YNN_partial_10_0129,
  rs_R010_ueqv_R010YNN_partial_10_0130,
  rs_R010_ueqv_R010YNN_partial_10_0131,
  rs_R010_ueqv_R010YNN_partial_10_0132,
  rs_R010_ueqv_R010YNN_partial_10_0133,
  rs_R010_ueqv_R010YNN_partial_10_0134,
  rs_R010_ueqv_R010YNN_partial_10_0135,
  rs_R010_ueqv_R010YNN_partial_10_0136,
  rs_R010_ueqv_R010YNN_partial_10_0137,
  rs_R010_ueqv_R010YNN_partial_10_0138,
  rs_R010_ueqv_R010YNN_partial_10_0139,
  rs_R010_ueqv_R010YNN_partial_10_0140,
  rs_R010_ueqv_R010YNN_partial_10_0141,
  rs_R010_ueqv_R010YNN_partial_10_0142,
  rs_R010_ueqv_R010YNN_partial_10_0143,
  rs_R010_ueqv_R010YNN_partial_10_0144,
  rs_R010_ueqv_R010YNN_partial_10_0145,
  rs_R010_ueqv_R010YNN_partial_10_0146,
  rs_R010_ueqv_R010YNN_partial_10_0147,
  rs_R010_ueqv_R010YNN_partial_10_0148,
  rs_R010_ueqv_R010YNN_partial_10_0149,
  rs_R010_ueqv_R010YNN_partial_10_0150,
  rs_R010_ueqv_R010YNN_partial_10_0151,
  rs_R010_ueqv_R010YNN_partial_10_0152,
  rs_R010_ueqv_R010YNN_partial_10_0153,
  rs_R010_ueqv_R010YNN_partial_10_0154,
  rs_R010_ueqv_R010YNN_partial_10_0155,
  rs_R010_ueqv_R010YNN_partial_10_0156,
  rs_R010_ueqv_R010YNN_partial_10_0157,
  rs_R010_ueqv_R010YNN_partial_10_0158,
  rs_R010_ueqv_R010YNN_partial_10_0159,
  rs_R010_ueqv_R010YNN_partial_10_0160,
  rs_R010_ueqv_R010YNN_partial_10_0161,
  rs_R010_ueqv_R010YNN_partial_10_0162,
  rs_R010_ueqv_R010YNN_partial_10_0163,
  rs_R010_ueqv_R010YNN_partial_10_0164,
  rs_R010_ueqv_R010YNN_partial_10_0165,
  rs_R010_ueqv_R010YNN_partial_10_0166,
  rs_R010_ueqv_R010YNN_partial_10_0167,
  rs_R010_ueqv_R010YNN_partial_10_0168,
  rs_R010_ueqv_R010YNN_partial_10_0169,
  rs_R010_ueqv_R010YNN_partial_10_0170,
  rs_R010_ueqv_R010YNN_partial_10_0171,
  rs_R010_ueqv_R010YNN_partial_10_0172,
  rs_R010_ueqv_R010YNN_partial_10_0173,
  rs_R010_ueqv_R010YNN_partial_10_0174,
  rs_R010_ueqv_R010YNN_partial_10_0175,
  rs_R010_ueqv_R010YNN_partial_10_0176,
  rs_R010_ueqv_R010YNN_partial_10_0177,
  rs_R010_ueqv_R010YNN_partial_10_0178,
  rs_R010_ueqv_R010YNN_partial_10_0179,
  rs_R010_ueqv_R010YNN_partial_10_0180,
  rs_R010_ueqv_R010YNN_partial_10_0181,
  rs_R010_ueqv_R010YNN_partial_10_0182,
  rs_R010_ueqv_R010YNN_partial_10_0183,
  rs_R010_ueqv_R010YNN_partial_10_0184,
  rs_R010_ueqv_R010YNN_partial_10_0185,
  rs_R010_ueqv_R010YNN_partial_10_0186,
  rs_R010_ueqv_R010YNN_partial_10_0187,
  rs_R010_ueqv_R010YNN_partial_10_0188,
  rs_R010_ueqv_R010YNN_partial_10_0189,
  rs_R010_ueqv_R010YNN_partial_10_0190,
  rs_R010_ueqv_R010YNN_partial_10_0191,
  rs_R010_ueqv_R010YNN_partial_10_0192,
  rs_R010_ueqv_R010YNN_partial_10_0193,
  rs_R010_ueqv_R010YNN_partial_10_0194,
  rs_R010_ueqv_R010YNN_partial_10_0195,
  rs_R010_ueqv_R010YNN_partial_10_0196,
  rs_R010_ueqv_R010YNN_partial_10_0197,
  rs_R010_ueqv_R010YNN_partial_10_0198,
  rs_R010_ueqv_R010YNN_partial_10_0199
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_10_0100_0199 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (13, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1225465249863840477664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1716648994661777862532 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((211821591221569757264 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((545357204886808984 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-156666479476886520908 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((51500840302832738036 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((7199596795786250240 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((277109611576712353808 : Rat) / 4042369870927946325) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((1739797505789306880 : Rat) / 5988696105078439) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-55399881464987154820 : Rat) / 161694794837117853) [(2, 1), (4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2091607789866837760 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((150522472907878400 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((239322079326116194624 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((6660312513411557224 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((470929192168422400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1604738735208089600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1233360274961307229664 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2220440722773647360 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((879981766182686720 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-41769332704155387088 : Rat) / 449152207880882925) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-272678602443404492 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((78333239738443260454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-3599798397893125120 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-138554805788356176904 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-53317499064990720 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-869898752894653440 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-26757673303976090662 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-454167427564475068424 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((27699940732493577410 : Rat) / 161694794837117853) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((1045803894933418880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6346883630080000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-75261236453939200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-119661039663058097312 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3330156256705778612 : Rat) / 29943480525392195) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-235464596084211200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((285761802735610880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((802369367604044800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((616680137480653614832 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1110220361386823680 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-540046735322931200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-439990883091343360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((20884666352077693544 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 100 through 199. -/
theorem rs_R010_ueqv_R010YNN_block_10_0100_0199_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_10_0100_0199
      rs_R010_ueqv_R010YNN_block_10_0100_0199 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
