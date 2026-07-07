/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 26:100-144

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_26_0100_0144 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0100 : Poly :=
[
  term ((-11733644891976534424 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 100 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0100 : Poly :=
[
  term ((-23467289783953068848 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((11733644891976534424 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-23467289783953068848 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((11733644891976534424 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0100
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0101 : Poly :=
[
  term ((4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0101 : Poly :=
[
  term ((8722364381696000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 3), (16, 1)],
  term ((8722364381696000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0101
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0102 : Poly :=
[
  term ((320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0102 : Poly :=
[
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0102
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0103 : Poly :=
[
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0103 : Poly :=
[
  term ((-1281686367819397120 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1281686367819397120 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0103
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0104 : Poly :=
[
  term ((21539685419221760 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0104 : Poly :=
[
  term ((43079370838443520 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-21539685419221760 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((43079370838443520 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-21539685419221760 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0104
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0105 : Poly :=
[
  term ((3612996787429120 : Rat) / 17966088315235317) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0105 : Poly :=
[
  term ((7225993574858240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3612996787429120 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((7225993574858240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-3612996787429120 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0105
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0106 : Poly :=
[
  term ((-203972624297086788944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0106 : Poly :=
[
  term ((-407945248594173577888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((203972624297086788944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-407945248594173577888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((203972624297086788944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0106
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0107 : Poly :=
[
  term ((-54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 107 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0107 : Poly :=
[
  term ((-109099773778616320 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 2), (16, 1)],
  term ((-109099773778616320 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (12, 1), (16, 1)],
  term ((54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0107
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0108 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0108 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0108
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0109 : Poly :=
[
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 109 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0109 : Poly :=
[
  term ((-3586611801579520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0109
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0110 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0110 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 2), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0110
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0111 : Poly :=
[
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0111 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0111
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0112 : Poly :=
[
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0112 : Poly :=
[
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0112
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0113 : Poly :=
[
  term ((2911020943290425092 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0113 : Poly :=
[
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2911020943290425092 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2911020943290425092 : Rat) / 1347456623642648775) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0113
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0114 : Poly :=
[
  term ((13883605965696577859 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0114 : Poly :=
[
  term ((27767211931393155718 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13883605965696577859 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((27767211931393155718 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-13883605965696577859 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0114
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0115 : Poly :=
[
  term ((-37624143650006453525 : Rat) / 53898264945705951) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0115 : Poly :=
[
  term ((-75248287300012907050 : Rat) / 53898264945705951) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((37624143650006453525 : Rat) / 53898264945705951) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-75248287300012907050 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((37624143650006453525 : Rat) / 53898264945705951) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0115
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0116 : Poly :=
[
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 116 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0116 : Poly :=
[
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0116
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0117 : Poly :=
[
  term ((32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 117 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0117 : Poly :=
[
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0117
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0118 : Poly :=
[
  term ((-64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0118 : Poly :=
[
  term ((-129929800474369280 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0118
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0119 : Poly :=
[
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 119 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0119 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0119
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0120 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 120 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0120 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0120
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0121 : Poly :=
[
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 121 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0121 : Poly :=
[
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0121
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0122 : Poly :=
[
  term ((-34802625127063200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 122 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0122 : Poly :=
[
  term ((-69605250254126400 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((34802625127063200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-69605250254126400 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((34802625127063200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0122
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0123 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0123 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0123
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0124 : Poly :=
[
  term ((-4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 124 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0124 : Poly :=
[
  term ((-9999765481844909312 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-9999765481844909312 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0124
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0125 : Poly :=
[
  term ((1894373021495730688 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 125 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0125 : Poly :=
[
  term ((3788746042991461376 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1894373021495730688 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((3788746042991461376 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1894373021495730688 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0125
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0126 : Poly :=
[
  term ((52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0126 : Poly :=
[
  term ((105474548736485857280 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((105474548736485857280 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0126
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0127 : Poly :=
[
  term ((70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 127 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0127 : Poly :=
[
  term ((140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0127
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0128 : Poly :=
[
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 128 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0128 : Poly :=
[
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0128
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0129 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 129 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0129 : Poly :=
[
  term ((4228645478400 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0129
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0130 : Poly :=
[
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0130 : Poly :=
[
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0130
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0131 : Poly :=
[
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0131 : Poly :=
[
  term ((298786499782448128 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((298786499782448128 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0131
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0132 : Poly :=
[
  term ((15654553108243328 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 132 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0132 : Poly :=
[
  term ((31309106216486656 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-15654553108243328 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((31309106216486656 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15654553108243328 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0132
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0133 : Poly :=
[
  term ((175062625358773856 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0133 : Poly :=
[
  term ((350125250717547712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-175062625358773856 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((350125250717547712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-175062625358773856 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0133_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0133
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0134 : Poly :=
[
  term ((-16260006286494774440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0134 : Poly :=
[
  term ((-32520012572989548880 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16260006286494774440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-32520012572989548880 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16260006286494774440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0134_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0134
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0135 : Poly :=
[
  term ((1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 135 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0135 : Poly :=
[
  term ((3692238239884277504 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((3692238239884277504 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0135_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0135
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0136 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0136 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0136_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0136
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0137 : Poly :=
[
  term ((2595397470834723584 : Rat) / 89830441576176585) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 137 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0137 : Poly :=
[
  term ((5190794941669447168 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-2595397470834723584 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (16, 1)],
  term ((5190794941669447168 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2595397470834723584 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0137_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0137
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0138 : Poly :=
[
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0138 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 2), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0138_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0138
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0139 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 139 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0139 : Poly :=
[
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (11, 2), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (12, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0139_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0139
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0140 : Poly :=
[
  term ((3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (16, 1)]
]

/-- Partial product 140 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0140 : Poly :=
[
  term ((6016651299431261648 : Rat) / 449152207880882925) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (10, 2), (16, 1)],
  term ((6016651299431261648 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0140_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0140
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0141 : Poly :=
[
  term ((-648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 141 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0141 : Poly :=
[
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0141_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0141
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0142 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 142 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0142 : Poly :=
[
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0142_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0142
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0143 : Poly :=
[
  term ((-1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 143 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0143 : Poly :=
[
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0143_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0143
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010YNN_coefficient_26_0144 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 26. -/
def rs_R010_ueqv_R010YNN_partial_26_0144 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 26. -/
theorem rs_R010_ueqv_R010YNN_partial_26_0144_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_26_0144
        rs_R010_ueqv_R010YNN_generator_26_0100_0144 =
      rs_R010_ueqv_R010YNN_partial_26_0144 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_26_0100_0144 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_26_0100,
  rs_R010_ueqv_R010YNN_partial_26_0101,
  rs_R010_ueqv_R010YNN_partial_26_0102,
  rs_R010_ueqv_R010YNN_partial_26_0103,
  rs_R010_ueqv_R010YNN_partial_26_0104,
  rs_R010_ueqv_R010YNN_partial_26_0105,
  rs_R010_ueqv_R010YNN_partial_26_0106,
  rs_R010_ueqv_R010YNN_partial_26_0107,
  rs_R010_ueqv_R010YNN_partial_26_0108,
  rs_R010_ueqv_R010YNN_partial_26_0109,
  rs_R010_ueqv_R010YNN_partial_26_0110,
  rs_R010_ueqv_R010YNN_partial_26_0111,
  rs_R010_ueqv_R010YNN_partial_26_0112,
  rs_R010_ueqv_R010YNN_partial_26_0113,
  rs_R010_ueqv_R010YNN_partial_26_0114,
  rs_R010_ueqv_R010YNN_partial_26_0115,
  rs_R010_ueqv_R010YNN_partial_26_0116,
  rs_R010_ueqv_R010YNN_partial_26_0117,
  rs_R010_ueqv_R010YNN_partial_26_0118,
  rs_R010_ueqv_R010YNN_partial_26_0119,
  rs_R010_ueqv_R010YNN_partial_26_0120,
  rs_R010_ueqv_R010YNN_partial_26_0121,
  rs_R010_ueqv_R010YNN_partial_26_0122,
  rs_R010_ueqv_R010YNN_partial_26_0123,
  rs_R010_ueqv_R010YNN_partial_26_0124,
  rs_R010_ueqv_R010YNN_partial_26_0125,
  rs_R010_ueqv_R010YNN_partial_26_0126,
  rs_R010_ueqv_R010YNN_partial_26_0127,
  rs_R010_ueqv_R010YNN_partial_26_0128,
  rs_R010_ueqv_R010YNN_partial_26_0129,
  rs_R010_ueqv_R010YNN_partial_26_0130,
  rs_R010_ueqv_R010YNN_partial_26_0131,
  rs_R010_ueqv_R010YNN_partial_26_0132,
  rs_R010_ueqv_R010YNN_partial_26_0133,
  rs_R010_ueqv_R010YNN_partial_26_0134,
  rs_R010_ueqv_R010YNN_partial_26_0135,
  rs_R010_ueqv_R010YNN_partial_26_0136,
  rs_R010_ueqv_R010YNN_partial_26_0137,
  rs_R010_ueqv_R010YNN_partial_26_0138,
  rs_R010_ueqv_R010YNN_partial_26_0139,
  rs_R010_ueqv_R010YNN_partial_26_0140,
  rs_R010_ueqv_R010YNN_partial_26_0141,
  rs_R010_ueqv_R010YNN_partial_26_0142,
  rs_R010_ueqv_R010YNN_partial_26_0143,
  rs_R010_ueqv_R010YNN_partial_26_0144
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_26_0100_0144 : Poly :=
[
  term ((-23467289783953068848 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((11733644891976534424 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-23467289783953068848 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((11733644891976534424 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((43079370838443520 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1281686367819397120 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-241920312519585280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 3), (16, 1)],
  term ((7225993574858240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-407945248594173577888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((8722364381696000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-21539685419221760 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1281686367819397120 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3612996787429120 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((203972624297086788944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-4361182190848000 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 3), (11, 1), (16, 1)],
  term ((-320421591954849280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (13, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (15, 1), (16, 1)],
  term ((-407945248594173577888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7225993574858240 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((125625115727901440 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((203972624297086788944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-21539685419221760 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 3), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-109099773778616320 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 2), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-109099773778616320 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (12, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((54549886889308160 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 3), (16, 1)],
  term ((-3586611801579520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 2), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 2), (15, 1), (16, 1)],
  term ((5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((27767211931393155718 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-75248287300012907050 : Rat) / 53898264945705951) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2911020943290425092 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13883605965696577859 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((37624143650006453525 : Rat) / 53898264945705951) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5822041886580850184 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (15, 1), (16, 1)],
  term ((-75248287300012907050 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((27767211931393155718 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-107487521054876369 : Rat) / 17966088315235317) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((37624143650006453525 : Rat) / 53898264945705951) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2911020943290425092 : Rat) / 1347456623642648775) [(5, 1), (11, 3), (16, 1)],
  term ((241298200880971520 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((69605250254126400 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-120649100440485760 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 3), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (10, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-69605250254126400 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-241298200880971520 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((34802625127063200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((120649100440485760 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 3), (16, 1)],
  term ((-69605250254126400 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((34802625127063200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-9999765481844909312 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3788746042991461376 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((105474548736485857280 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1894373021495730688 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((105474548736485857280 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3788746042991461376 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19471630589323562752 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((-5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (11, 2), (16, 1)],
  term ((31309106216486656 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((298786499782448128 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((74886913992140032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((350125250717547712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32520012572989548880 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-15654553108243328 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((298786499782448128 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-175062625358773856 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((16260006286494774440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 3), (11, 1), (16, 1)],
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-32520012572989548880 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((350125250717547712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-28750703828457440 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((16260006286494774440 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-15654553108243328 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 3), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3692238239884277504 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((5190794941669447168 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3692238239884277504 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-2595397470834723584 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 3), (16, 1)],
  term ((5190794941669447168 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2595397470834723584 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 3), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 2), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 2), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (11, 2), (16, 1)],
  term ((6016651299431261648 : Rat) / 449152207880882925) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (12, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (10, 2), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 3), (16, 1)],
  term ((6016651299431261648 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3008325649715630824 : Rat) / 449152207880882925) [(5, 2), (11, 2), (16, 1)],
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 3), (16, 1)],
  term ((-2639049453373397504 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1319524726686698752 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 100 through 144. -/
theorem rs_R010_ueqv_R010YNN_block_26_0100_0144_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_26_0100_0144
      rs_R010_ueqv_R010YNN_block_26_0100_0144 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
