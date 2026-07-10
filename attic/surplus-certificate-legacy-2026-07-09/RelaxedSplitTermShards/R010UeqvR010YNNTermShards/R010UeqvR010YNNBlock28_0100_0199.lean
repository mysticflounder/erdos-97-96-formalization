/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 28:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_28_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0100 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0100 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0100
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0101 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0101 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0101
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0102 : Poly :=
[
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 102 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0102 : Poly :=
[
  term ((1016828298440622080 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (14, 2), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0102
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0103 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 4), (13, 1), (16, 1)]
]

/-- Partial product 103 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0103 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 4), (13, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (13, 1), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0103
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0104 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0104 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0104
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0105 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 105 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0105 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0105
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0106 : Poly :=
[
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0106 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0106
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0107 : Poly :=
[
  term ((-4736798691501146092 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0107 : Poly :=
[
  term ((9473597383002292184 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-4736798691501146092 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((9473597383002292184 : Rat) / 449152207880882925) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4736798691501146092 : Rat) / 449152207880882925) [(0, 3), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0107
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0108 : Poly :=
[
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0108 : Poly :=
[
  term ((-1567149691260047776 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1567149691260047776 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0108
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0109 : Poly :=
[
  term ((-1457341082075149352 : Rat) / 17966088315235317) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 109 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0109 : Poly :=
[
  term ((2914682164150298704 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1457341082075149352 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((2914682164150298704 : Rat) / 17966088315235317) [(0, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1457341082075149352 : Rat) / 17966088315235317) [(0, 3), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0109
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0110 : Poly :=
[
  term ((-51340966596797079536 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0110 : Poly :=
[
  term ((102681933193594159072 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51340966596797079536 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((102681933193594159072 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51340966596797079536 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0110
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0111 : Poly :=
[
  term ((43500698655534220372 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 111 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0111 : Poly :=
[
  term ((-87001397311068440744 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((43500698655534220372 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-87001397311068440744 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((43500698655534220372 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0111
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0112 : Poly :=
[
  term ((882116699128807696681 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0112 : Poly :=
[
  term ((-1764233398257615393362 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((882116699128807696681 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-1764233398257615393362 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((882116699128807696681 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0112
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0113 : Poly :=
[
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0113 : Poly :=
[
  term ((-76430955438764350304 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76430955438764350304 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0113
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0114 : Poly :=
[
  term ((857554295450135936659 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0114 : Poly :=
[
  term ((-1715108590900271873318 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((857554295450135936659 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1715108590900271873318 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((857554295450135936659 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0114
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0115 : Poly :=
[
  term ((-120649100440485760 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0115 : Poly :=
[
  term ((241298200880971520 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(0, 3), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0115
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0116 : Poly :=
[
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 116 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0116 : Poly :=
[
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 3), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0116
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0117 : Poly :=
[
  term ((120649100440485760 : Rat) / 17966088315235317) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 117 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0117 : Poly :=
[
  term ((-241298200880971520 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(0, 3), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0117
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0118 : Poly :=
[
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 118 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0118 : Poly :=
[
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 3), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0118
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0119 : Poly :=
[
  term ((-127609625465898400 : Rat) / 17966088315235317) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 119 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0119 : Poly :=
[
  term ((255219250931796800 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-127609625465898400 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((255219250931796800 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-127609625465898400 : Rat) / 17966088315235317) [(0, 3), (5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0119
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0120 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 1), (5, 2), (7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0120 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 3), (5, 2), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0120
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0121 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0121 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 3), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0121
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0122 : Poly :=
[
  term ((-297414916400057346176 : Rat) / 269491324728529755) [(0, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0122 : Poly :=
[
  term ((594829832800114692352 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-297414916400057346176 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((594829832800114692352 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-297414916400057346176 : Rat) / 269491324728529755) [(0, 3), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0122
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0123 : Poly :=
[
  term ((-56657962475641339648 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0123 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-56657962475641339648 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56657962475641339648 : Rat) / 53898264945705951) [(0, 3), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0123
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0124 : Poly :=
[
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (8, 1), (16, 1)]
]

/-- Partial product 124 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0124 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (8, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 3), (5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0124
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0125 : Poly :=
[
  term ((-2114322739200 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 125 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0125 : Poly :=
[
  term ((4228645478400 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0125
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0126 : Poly :=
[
  term ((74696624945612032 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 126 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0126 : Poly :=
[
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0126
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0127 : Poly :=
[
  term ((-84081407596697984 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0127 : Poly :=
[
  term ((168162815193395968 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-84081407596697984 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((168162815193395968 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84081407596697984 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0127
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0128 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0128 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0128
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0129 : Poly :=
[
  term ((-210297714774037760 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 129 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0129 : Poly :=
[
  term ((420595429548075520 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-210297714774037760 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((420595429548075520 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-210297714774037760 : Rat) / 53898264945705951) [(0, 3), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0129
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0130 : Poly :=
[
  term ((-321371540647705472 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 130 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0130 : Poly :=
[
  term ((642743081295410944 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-321371540647705472 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((642743081295410944 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-321371540647705472 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0130
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0131 : Poly :=
[
  term ((-94073338848131456 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 131 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0131 : Poly :=
[
  term ((188146677696262912 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94073338848131456 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((188146677696262912 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-94073338848131456 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0131
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0132 : Poly :=
[
  term ((41344387376048368712 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 132 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0132 : Poly :=
[
  term ((-82688774752096737424 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((41344387376048368712 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-82688774752096737424 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((41344387376048368712 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0132
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0133 : Poly :=
[
  term ((-110258185823109632 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0133 : Poly :=
[
  term ((220516371646219264 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((220516371646219264 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0133_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0133
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0134 : Poly :=
[
  term ((134277762667108719368 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0134 : Poly :=
[
  term ((-268555525334217438736 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((134277762667108719368 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-268555525334217438736 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((134277762667108719368 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0134_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0134
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0135 : Poly :=
[
  term ((-5009069409326080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 135 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0135 : Poly :=
[
  term ((10018138818652160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0135_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0135
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0136 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 136 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0136 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 3), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0136_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0136
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0137 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0137 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 3), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0137_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0137
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0138 : Poly :=
[
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 138 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0138 : Poly :=
[
  term ((14380180136477110784 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (14, 2), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0138_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0138
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0139 : Poly :=
[
  term ((-36294879174830080 : Rat) / 53898264945705951) [(0, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 139 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0139 : Poly :=
[
  term ((72589758349660160 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-36294879174830080 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (9, 2), (16, 1)],
  term ((72589758349660160 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-36294879174830080 : Rat) / 53898264945705951) [(0, 3), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0139_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0139
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0140 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 140 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0140 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0140_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0140
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0141 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0141 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0141_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0141
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0142 : Poly :=
[
  term ((-15018536738589576432 : Rat) / 149717402626960975) [(0, 1), (5, 2), (10, 1), (16, 1)]
]

/-- Partial product 142 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0142 : Poly :=
[
  term ((30037073477179152864 : Rat) / 149717402626960975) [(0, 1), (1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-15018536738589576432 : Rat) / 149717402626960975) [(0, 1), (1, 2), (5, 2), (10, 1), (16, 1)],
  term ((30037073477179152864 : Rat) / 149717402626960975) [(0, 2), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-15018536738589576432 : Rat) / 149717402626960975) [(0, 3), (5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0142_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0142
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0143 : Poly :=
[
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 143 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0143 : Poly :=
[
  term ((1567149691260047776 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((1567149691260047776 : Rat) / 53898264945705951) [(0, 2), (5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 3), (5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0143_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0143
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0144 : Poly :=
[
  term ((36805158164725303342 : Rat) / 449152207880882925) [(0, 1), (5, 2), (14, 1), (16, 1)]
]

/-- Partial product 144 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0144 : Poly :=
[
  term ((-73610316329450606684 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((36805158164725303342 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 2), (14, 1), (16, 1)],
  term ((-73610316329450606684 : Rat) / 449152207880882925) [(0, 2), (5, 2), (14, 2), (16, 1)],
  term ((36805158164725303342 : Rat) / 449152207880882925) [(0, 3), (5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0144_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0144
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0145 : Poly :=
[
  term ((130055125120285928 : Rat) / 89830441576176585) [(0, 1), (5, 2), (16, 1)]
]

/-- Partial product 145 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0145 : Poly :=
[
  term ((-260110250240571856 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((130055125120285928 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((-260110250240571856 : Rat) / 89830441576176585) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((130055125120285928 : Rat) / 89830441576176585) [(0, 3), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0145_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0145
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0146 : Poly :=
[
  term ((412236552533099008 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 146 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0146 : Poly :=
[
  term ((-824473105066198016 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(0, 3), (5, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0146_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0146
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0147 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0147 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 2), (5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 3), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0147_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0147
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0148 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 1), (5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 148 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0148 : Poly :=
[
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (14, 2), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 3), (5, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0148_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0148
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0149 : Poly :=
[
  term ((1281846819259418368 : Rat) / 53898264945705951) [(0, 1), (5, 3), (9, 1), (16, 1)]
]

/-- Partial product 149 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0149 : Poly :=
[
  term ((-2563693638518836736 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((1281846819259418368 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-2563693638518836736 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((1281846819259418368 : Rat) / 53898264945705951) [(0, 3), (5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0149_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0149
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0150 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 150 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0150 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 3), (5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0150_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0150
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0151 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0151 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 3), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0151_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0151
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0152 : Poly :=
[
  term (-1 : Rat) [(0, 1), (16, 1)]
]

/-- Partial product 152 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0152 : Poly :=
[
  term (2 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (1, 2), (16, 1)],
  term (2 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0152_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0152
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0153 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 153 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0153 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 2), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 4), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0153_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0153
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0154 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 154 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0154 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 2), (1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 4), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0154_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0154
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0155 : Poly :=
[
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 155 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0155 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 2), (1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 4), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0155_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0155
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0156 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 156 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0156 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 2), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 4), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0156_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0156
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0157 : Poly :=
[
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 157 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0157 : Poly :=
[
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 2), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 4), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0157_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0157
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0158 : Poly :=
[
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 158 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0158 : Poly :=
[
  term ((7639906972736662592 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(0, 2), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((7639906972736662592 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(0, 4), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0158_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0158
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0159 : Poly :=
[
  term ((90754103269284224 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 159 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0159 : Poly :=
[
  term ((-181508206538568448 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((90754103269284224 : Rat) / 269491324728529755) [(0, 2), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-181508206538568448 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((90754103269284224 : Rat) / 269491324728529755) [(0, 4), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0159_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0159
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0160 : Poly :=
[
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 160 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0160 : Poly :=
[
  term ((780133910137961984 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 2), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((780133910137961984 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 4), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0160_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0160
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0161 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 161 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0161 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 4), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0161_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0161
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0162 : Poly :=
[
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)]
]

/-- Partial product 162 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0162 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (1, 2), (5, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 3), (5, 2), (14, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 4), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0162_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0162
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0163 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)]
]

/-- Partial product 163 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0163 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (1, 2), (5, 3), (9, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 3), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 4), (5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0163_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0163
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0164 : Poly :=
[
  term (-4 : Rat) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

/-- Partial product 164 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0164 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (1, 1), (3, 1), (4, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 3), (3, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0164_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0164
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0165 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 165 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0165 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0165_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0165
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0166 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0166 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0166_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0166
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0167 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0167 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0167_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0167
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0168 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 168 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0168 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0168_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0168
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0169 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0169 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0169_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0169
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0170 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 170 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0170 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0170_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0170
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0171 : Poly :=
[
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0171 : Poly :=
[
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0171_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0171
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0172 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0172 : Poly :=
[
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0172_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0172
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0173 : Poly :=
[
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 173 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0173 : Poly :=
[
  term ((-252031812391116800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0173_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0173
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0174 : Poly :=
[
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0174 : Poly :=
[
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0174_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0174
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0175 : Poly :=
[
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 175 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0175 : Poly :=
[
  term ((-507474653826560000 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0175_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0175
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0176 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0176 : Poly :=
[
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 3), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0176_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0176
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0177 : Poly :=
[
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0177 : Poly :=
[
  term ((25415094482300723200 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0177_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0177
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0178 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 178 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0178 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0178_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0178
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0179 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 179 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0179 : Poly :=
[
  term ((9158229113061432320 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0179_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0179
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0180 : Poly :=
[
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 180 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0180 : Poly :=
[
  term ((-5774589322647040 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0180_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0180
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0181 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 181 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0181 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0181_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0181
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0182 : Poly :=
[
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0182 : Poly :=
[
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 2), (3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 3), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0182_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0182
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0183 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0183 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0183_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0183
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0184 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0184 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0184_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0184
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0185 : Poly :=
[
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 185 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0185 : Poly :=
[
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 3), (3, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0185_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0185
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0186 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0186 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 3), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0186_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0186
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0187 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 187 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0187 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0187_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0187
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0188 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 188 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0188 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0188_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0188
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0189 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0189 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(0, 1), (1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(0, 2), (1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 2), (3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 3), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0189_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0189
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0190 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0190 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0190_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0190
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0191 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (16, 1)]
]

/-- Partial product 191 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0191 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0191_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0191
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0192 : Poly :=
[
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 192 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0192 : Poly :=
[
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 3), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0192_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0192
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0193 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0193 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 3), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0193_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0193
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0194 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0194 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0194_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0194
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0195 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0195 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 2), (3, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 3), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0195_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0195
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0196 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (16, 1)]
]

/-- Partial product 196 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0196 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0196_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0196
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0197 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0197 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0197_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0197
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0198 : Poly :=
[
  term (4 : Rat) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 198 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0198 : Poly :=
[
  term (-8 : Rat) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0198_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0198
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 28. -/
def rs_R010_ueqv_R010YNN_coefficient_28_0199 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 199 for generator 28. -/
def rs_R010_ueqv_R010YNN_partial_28_0199 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 3), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 28. -/
theorem rs_R010_ueqv_R010YNN_partial_28_0199_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_28_0199
        rs_R010_ueqv_R010YNN_generator_28_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_28_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_28_0100_0199 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_28_0100,
  rs_R010_ueqv_R010YNN_partial_28_0101,
  rs_R010_ueqv_R010YNN_partial_28_0102,
  rs_R010_ueqv_R010YNN_partial_28_0103,
  rs_R010_ueqv_R010YNN_partial_28_0104,
  rs_R010_ueqv_R010YNN_partial_28_0105,
  rs_R010_ueqv_R010YNN_partial_28_0106,
  rs_R010_ueqv_R010YNN_partial_28_0107,
  rs_R010_ueqv_R010YNN_partial_28_0108,
  rs_R010_ueqv_R010YNN_partial_28_0109,
  rs_R010_ueqv_R010YNN_partial_28_0110,
  rs_R010_ueqv_R010YNN_partial_28_0111,
  rs_R010_ueqv_R010YNN_partial_28_0112,
  rs_R010_ueqv_R010YNN_partial_28_0113,
  rs_R010_ueqv_R010YNN_partial_28_0114,
  rs_R010_ueqv_R010YNN_partial_28_0115,
  rs_R010_ueqv_R010YNN_partial_28_0116,
  rs_R010_ueqv_R010YNN_partial_28_0117,
  rs_R010_ueqv_R010YNN_partial_28_0118,
  rs_R010_ueqv_R010YNN_partial_28_0119,
  rs_R010_ueqv_R010YNN_partial_28_0120,
  rs_R010_ueqv_R010YNN_partial_28_0121,
  rs_R010_ueqv_R010YNN_partial_28_0122,
  rs_R010_ueqv_R010YNN_partial_28_0123,
  rs_R010_ueqv_R010YNN_partial_28_0124,
  rs_R010_ueqv_R010YNN_partial_28_0125,
  rs_R010_ueqv_R010YNN_partial_28_0126,
  rs_R010_ueqv_R010YNN_partial_28_0127,
  rs_R010_ueqv_R010YNN_partial_28_0128,
  rs_R010_ueqv_R010YNN_partial_28_0129,
  rs_R010_ueqv_R010YNN_partial_28_0130,
  rs_R010_ueqv_R010YNN_partial_28_0131,
  rs_R010_ueqv_R010YNN_partial_28_0132,
  rs_R010_ueqv_R010YNN_partial_28_0133,
  rs_R010_ueqv_R010YNN_partial_28_0134,
  rs_R010_ueqv_R010YNN_partial_28_0135,
  rs_R010_ueqv_R010YNN_partial_28_0136,
  rs_R010_ueqv_R010YNN_partial_28_0137,
  rs_R010_ueqv_R010YNN_partial_28_0138,
  rs_R010_ueqv_R010YNN_partial_28_0139,
  rs_R010_ueqv_R010YNN_partial_28_0140,
  rs_R010_ueqv_R010YNN_partial_28_0141,
  rs_R010_ueqv_R010YNN_partial_28_0142,
  rs_R010_ueqv_R010YNN_partial_28_0143,
  rs_R010_ueqv_R010YNN_partial_28_0144,
  rs_R010_ueqv_R010YNN_partial_28_0145,
  rs_R010_ueqv_R010YNN_partial_28_0146,
  rs_R010_ueqv_R010YNN_partial_28_0147,
  rs_R010_ueqv_R010YNN_partial_28_0148,
  rs_R010_ueqv_R010YNN_partial_28_0149,
  rs_R010_ueqv_R010YNN_partial_28_0150,
  rs_R010_ueqv_R010YNN_partial_28_0151,
  rs_R010_ueqv_R010YNN_partial_28_0152,
  rs_R010_ueqv_R010YNN_partial_28_0153,
  rs_R010_ueqv_R010YNN_partial_28_0154,
  rs_R010_ueqv_R010YNN_partial_28_0155,
  rs_R010_ueqv_R010YNN_partial_28_0156,
  rs_R010_ueqv_R010YNN_partial_28_0157,
  rs_R010_ueqv_R010YNN_partial_28_0158,
  rs_R010_ueqv_R010YNN_partial_28_0159,
  rs_R010_ueqv_R010YNN_partial_28_0160,
  rs_R010_ueqv_R010YNN_partial_28_0161,
  rs_R010_ueqv_R010YNN_partial_28_0162,
  rs_R010_ueqv_R010YNN_partial_28_0163,
  rs_R010_ueqv_R010YNN_partial_28_0164,
  rs_R010_ueqv_R010YNN_partial_28_0165,
  rs_R010_ueqv_R010YNN_partial_28_0166,
  rs_R010_ueqv_R010YNN_partial_28_0167,
  rs_R010_ueqv_R010YNN_partial_28_0168,
  rs_R010_ueqv_R010YNN_partial_28_0169,
  rs_R010_ueqv_R010YNN_partial_28_0170,
  rs_R010_ueqv_R010YNN_partial_28_0171,
  rs_R010_ueqv_R010YNN_partial_28_0172,
  rs_R010_ueqv_R010YNN_partial_28_0173,
  rs_R010_ueqv_R010YNN_partial_28_0174,
  rs_R010_ueqv_R010YNN_partial_28_0175,
  rs_R010_ueqv_R010YNN_partial_28_0176,
  rs_R010_ueqv_R010YNN_partial_28_0177,
  rs_R010_ueqv_R010YNN_partial_28_0178,
  rs_R010_ueqv_R010YNN_partial_28_0179,
  rs_R010_ueqv_R010YNN_partial_28_0180,
  rs_R010_ueqv_R010YNN_partial_28_0181,
  rs_R010_ueqv_R010YNN_partial_28_0182,
  rs_R010_ueqv_R010YNN_partial_28_0183,
  rs_R010_ueqv_R010YNN_partial_28_0184,
  rs_R010_ueqv_R010YNN_partial_28_0185,
  rs_R010_ueqv_R010YNN_partial_28_0186,
  rs_R010_ueqv_R010YNN_partial_28_0187,
  rs_R010_ueqv_R010YNN_partial_28_0188,
  rs_R010_ueqv_R010YNN_partial_28_0189,
  rs_R010_ueqv_R010YNN_partial_28_0190,
  rs_R010_ueqv_R010YNN_partial_28_0191,
  rs_R010_ueqv_R010YNN_partial_28_0192,
  rs_R010_ueqv_R010YNN_partial_28_0193,
  rs_R010_ueqv_R010YNN_partial_28_0194,
  rs_R010_ueqv_R010YNN_partial_28_0195,
  rs_R010_ueqv_R010YNN_partial_28_0196,
  rs_R010_ueqv_R010YNN_partial_28_0197,
  rs_R010_ueqv_R010YNN_partial_28_0198,
  rs_R010_ueqv_R010YNN_partial_28_0199
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_28_0100_0199 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(0, 1), (1, 1), (3, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(0, 1), (1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(0, 1), (1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(0, 1), (1, 1), (3, 1), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(0, 1), (1, 1), (3, 1), (5, 2), (14, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(0, 1), (1, 1), (3, 1), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(0, 1), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9473597383002292184 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1567149691260047776 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2914682164150298704 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((102681933193594159072 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-87001397311068440744 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1764233398257615393362 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-76430955438764350304 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1715108590900271873318 : Rat) / 1347456623642648775) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((255219250931796800 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((594829832800114692352 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((168162815193395968 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((420595429548075520 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((642743081295410944 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((188146677696262912 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82688774752096737424 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((220516371646219264 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-268555525334217438736 : Rat) / 269491324728529755) [(0, 1), (1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((72589758349660160 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((30037073477179152864 : Rat) / 149717402626960975) [(0, 1), (1, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((1567149691260047776 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73610316329450606684 : Rat) / 449152207880882925) [(0, 1), (1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-260110250240571856 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 1), (1, 1), (5, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2563693638518836736 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 1), (1, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 4), (13, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4736798691501146092 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1457341082075149352 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51340966596797079536 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((43500698655534220372 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((882116699128807696681 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((857554295450135936659 : Rat) / 1347456623642648775) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-127609625465898400 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-297414916400057346176 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-56657962475641339648 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (8, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-84081407596697984 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-210297714774037760 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-321371540647705472 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-94073338848131456 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((41344387376048368712 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((134277762667108719368 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-36294879174830080 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-15018536738589576432 : Rat) / 149717402626960975) [(0, 1), (1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((36805158164725303342 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 2), (14, 1), (16, 1)],
  term ((130055125120285928 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 1), (1, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((1281846819259418368 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 3), (9, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 1), (1, 2), (16, 1)],
  term (-4 : Rat) [(0, 2), (1, 1), (3, 1), (4, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(0, 2), (1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(0, 2), (1, 1), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(0, 2), (1, 1), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(0, 2), (1, 1), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(0, 2), (1, 1), (3, 1), (5, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(0, 2), (1, 1), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((7639906972736662592 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181508206538568448 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((780133910137961984 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 3), (9, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 2), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 2), (1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 2), (1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 2), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 2), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(0, 2), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((90754103269284224 : Rat) / 269491324728529755) [(0, 2), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 2), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 2), (5, 2), (9, 2), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (1, 2), (5, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (1, 2), (5, 3), (9, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1016828298440622080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (14, 2), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (13, 1), (14, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (14, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((9473597383002292184 : Rat) / 449152207880882925) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1567149691260047776 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((102681933193594159072 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((2914682164150298704 : Rat) / 17966088315235317) [(0, 2), (5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1764233398257615393362 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-87001397311068440744 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1715108590900271873318 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76430955438764350304 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((255219250931796800 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((594829832800114692352 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((168162815193395968 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((642743081295410944 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((420595429548075520 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-82688774752096737424 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((188146677696262912 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-268555525334217438736 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((220516371646219264 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((72589758349660160 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((14380180136477110784 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (14, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((30037073477179152864 : Rat) / 149717402626960975) [(0, 2), (5, 2), (10, 1), (14, 1), (16, 1)],
  term ((1567149691260047776 : Rat) / 53898264945705951) [(0, 2), (5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-260110250240571856 : Rat) / 89830441576176585) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((-73610316329450606684 : Rat) / 449152207880882925) [(0, 2), (5, 2), (14, 2), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 2), (5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2563693638518836736 : Rat) / 53898264945705951) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-1597130413868451968 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (14, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (14, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 4), (13, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4736798691501146092 : Rat) / 449152207880882925) [(0, 3), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((783574845630023888 : Rat) / 53898264945705951) [(0, 3), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90192842295945113824 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51340966596797079536 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((17046868542756960988 : Rat) / 449152207880882925) [(0, 3), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((882116699128807696681 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (13, 1), (16, 1)],
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((857554295450135936659 : Rat) / 1347456623642648775) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(0, 3), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 3), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(0, 3), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(0, 3), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-127609625465898400 : Rat) / 17966088315235317) [(0, 3), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 3), (5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 3), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-297414916400057346176 : Rat) / 269491324728529755) [(0, 3), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-56657962475641339648 : Rat) / 53898264945705951) [(0, 3), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(0, 3), (5, 2), (8, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-84081407596697984 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1232996780408757248 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-321371540647705472 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((228686857096610176 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((41344387376048368712 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-110258185823109632 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((134277762667108719368 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 3), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 3), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7225715466695080192 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-36294879174830080 : Rat) / 53898264945705951) [(0, 3), (5, 2), (9, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 3), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-15018536738589576432 : Rat) / 149717402626960975) [(0, 3), (5, 2), (10, 1), (16, 1)],
  term ((-783574845630023888 : Rat) / 53898264945705951) [(0, 3), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((16988269466140712162 : Rat) / 269491324728529755) [(0, 3), (5, 2), (14, 1), (16, 1)],
  term ((130055125120285928 : Rat) / 89830441576176585) [(0, 3), (5, 2), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(0, 3), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 3), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1459403090655333824 : Rat) / 53898264945705951) [(0, 3), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((1281846819259418368 : Rat) / 53898264945705951) [(0, 3), (5, 3), (9, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 3), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 3), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-1 : Rat) [(0, 3), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 4), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 4), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 4), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 4), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-9553869429845543788 : Rat) / 1347456623642648775) [(0, 4), (5, 1), (11, 1), (16, 1)],
  term ((-3819953486368331296 : Rat) / 1347456623642648775) [(0, 4), (5, 1), (13, 1), (16, 1)],
  term ((90754103269284224 : Rat) / 269491324728529755) [(0, 4), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 4), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 4), (5, 2), (9, 2), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 4), (5, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 4), (5, 3), (9, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 2), (3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 2), (3, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 2), (3, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 3), (3, 1), (4, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 3), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 3), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 3), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 3), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 3), (3, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 3), (3, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 2), (8, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 3), (3, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 3), (3, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 3), (3, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 3), (3, 1), (5, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 3), (3, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 3), (3, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 3), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 199. -/
theorem rs_R010_ueqv_R010YNN_block_28_0100_0199_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_28_0100_0199
      rs_R010_ueqv_R010YNN_block_28_0100_0199 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
