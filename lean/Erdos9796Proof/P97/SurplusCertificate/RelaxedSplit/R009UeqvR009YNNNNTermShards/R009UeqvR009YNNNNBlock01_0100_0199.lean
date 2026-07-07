/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 1:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0100 : Poly :=
[
  term ((-333576329821813 : Rat) / 532849823604) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 100 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0100 : Poly :=
[
  term ((-333576329821813 : Rat) / 532849823604) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (8, 2), (10, 1), (13, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (9, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0100
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0101 : Poly :=
[
  term ((505 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0101 : Poly :=
[
  term ((505 : Rat) / 42) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((505 : Rat) / 42) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-505 : Rat) / 42) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-505 : Rat) / 42) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0101
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0102 : Poly :=
[
  term ((104270354348416189 : Rat) / 78328924069788) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 102 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0102 : Poly :=
[
  term ((104270354348416189 : Rat) / 78328924069788) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((104270354348416189 : Rat) / 78328924069788) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (8, 2), (10, 1), (15, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0102
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0103 : Poly :=
[
  term ((-194 : Rat) / 21) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0103 : Poly :=
[
  term ((-194 : Rat) / 21) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-194 : Rat) / 21) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((194 : Rat) / 21) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((194 : Rat) / 21) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0103
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0104 : Poly :=
[
  term ((-327683327437187 : Rat) / 2175803446383) [(3, 1), (11, 1)]
]

/-- Partial product 104 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0104 : Poly :=
[
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 2), (3, 1), (11, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(1, 2), (3, 1), (11, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(3, 1), (8, 2), (11, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0104
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0105 : Poly :=
[
  term ((-11509472182985360 : Rat) / 19582231017447) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 105 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0105 : Poly :=
[
  term ((-11509472182985360 : Rat) / 19582231017447) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-11509472182985360 : Rat) / 19582231017447) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (8, 2), (11, 1), (14, 1)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0105
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0106 : Poly :=
[
  term ((-34541538442443005 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 106 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0106 : Poly :=
[
  term ((-34541538442443005 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-34541538442443005 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((34541538442443005 : Rat) / 78328924069788) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((34541538442443005 : Rat) / 78328924069788) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0106
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0107 : Poly :=
[
  term ((-88640 : Rat) / 1029) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 107 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0107 : Poly :=
[
  term ((-88640 : Rat) / 1029) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-88640 : Rat) / 1029) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((88640 : Rat) / 1029) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((88640 : Rat) / 1029) [(3, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0107
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0108 : Poly :=
[
  term ((-10817732676426155 : Rat) / 156657848139576) [(3, 1), (15, 1)]
]

/-- Partial product 108 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0108 : Poly :=
[
  term ((-10817732676426155 : Rat) / 156657848139576) [(0, 2), (3, 1), (15, 1)],
  term ((-10817732676426155 : Rat) / 156657848139576) [(1, 2), (3, 1), (15, 1)],
  term ((10817732676426155 : Rat) / 156657848139576) [(3, 1), (8, 2), (15, 1)],
  term ((10817732676426155 : Rat) / 156657848139576) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0108
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0109 : Poly :=
[
  term ((-1328274198856205 : Rat) / 26109641356596) [(3, 2)]
]

/-- Partial product 109 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0109 : Poly :=
[
  term ((-1328274198856205 : Rat) / 26109641356596) [(0, 2), (3, 2)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(1, 2), (3, 2)],
  term ((1328274198856205 : Rat) / 26109641356596) [(3, 2), (8, 2)],
  term ((1328274198856205 : Rat) / 26109641356596) [(3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0109
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0110 : Poly :=
[
  term ((-1372480999036685 : Rat) / 13054820678298) [(3, 2), (10, 1)]
]

/-- Partial product 110 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0110 : Poly :=
[
  term ((-1372480999036685 : Rat) / 13054820678298) [(0, 2), (3, 2), (10, 1)],
  term ((-1372480999036685 : Rat) / 13054820678298) [(1, 2), (3, 2), (10, 1)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (8, 2), (10, 1)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0110
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0111 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 2), (14, 1)]
]

/-- Partial product 111 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0111 : Poly :=
[
  term ((640 : Rat) / 21) [(0, 2), (3, 2), (14, 1)],
  term ((640 : Rat) / 21) [(1, 2), (3, 2), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (8, 2), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0111
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0112 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1)]
]

/-- Partial product 112 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0112 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(0, 2), (4, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(1, 2), (4, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (8, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0112
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0113 : Poly :=
[
  term ((4 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0113 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0113
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0114 : Poly :=
[
  term ((719495470537705 : Rat) / 5802142523688) [(6, 1)]
]

/-- Partial product 114 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0114 : Poly :=
[
  term ((719495470537705 : Rat) / 5802142523688) [(0, 2), (6, 1)],
  term ((719495470537705 : Rat) / 5802142523688) [(1, 2), (6, 1)],
  term ((-719495470537705 : Rat) / 5802142523688) [(6, 1), (8, 2)],
  term ((-719495470537705 : Rat) / 5802142523688) [(6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0114
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0115 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 115 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0115 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0115
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0116 : Poly :=
[
  term ((11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 116 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0116 : Poly :=
[
  term ((11548189763031433 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((11548189763031433 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0116
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0117 : Poly :=
[
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 117 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0117 : Poly :=
[
  term ((2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0117
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0118 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 118 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0118 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0118
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0119 : Poly :=
[
  term ((-985353530115407 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 119 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0119 : Poly :=
[
  term ((-985353530115407 : Rat) / 799274735406) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-985353530115407 : Rat) / 799274735406) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((985353530115407 : Rat) / 799274735406) [(6, 1), (8, 2), (9, 1), (11, 1)],
  term ((985353530115407 : Rat) / 799274735406) [(6, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0119
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0120 : Poly :=
[
  term ((-13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 120 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0120 : Poly :=
[
  term ((-13804982796901 : Rat) / 20234803428) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-13804982796901 : Rat) / 20234803428) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(6, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0120
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0121 : Poly :=
[
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 121 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0121 : Poly :=
[
  term ((-725 : Rat) / 42) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0121
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0122 : Poly :=
[
  term ((223402835779553401 : Rat) / 156657848139576) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 122 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0122 : Poly :=
[
  term ((223402835779553401 : Rat) / 156657848139576) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((223402835779553401 : Rat) / 156657848139576) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-223402835779553401 : Rat) / 156657848139576) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((-223402835779553401 : Rat) / 156657848139576) [(6, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0122
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0123 : Poly :=
[
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0123 : Poly :=
[
  term ((314 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0123
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0124 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2)]
]

/-- Partial product 124 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0124 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(0, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 166541592) [(1, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (8, 2), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0124
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0125 : Poly :=
[
  term ((-74661298286369 : Rat) / 138146250564) [(6, 1), (10, 1)]
]

/-- Partial product 125 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0125 : Poly :=
[
  term ((-74661298286369 : Rat) / 138146250564) [(0, 2), (6, 1), (10, 1)],
  term ((-74661298286369 : Rat) / 138146250564) [(1, 2), (6, 1), (10, 1)],
  term ((74661298286369 : Rat) / 138146250564) [(6, 1), (8, 2), (10, 1)],
  term ((74661298286369 : Rat) / 138146250564) [(6, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0125
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0126 : Poly :=
[
  term ((24075835681337126 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 126 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0126 : Poly :=
[
  term ((24075835681337126 : Rat) / 19582231017447) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((24075835681337126 : Rat) / 19582231017447) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-24075835681337126 : Rat) / 19582231017447) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((-24075835681337126 : Rat) / 19582231017447) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0126
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0127 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 127 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0127 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0127
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0128 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 128 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0128 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0128
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0129 : Poly :=
[
  term ((338835024887419 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 129 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0129 : Poly :=
[
  term ((338835024887419 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((338835024887419 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-338835024887419 : Rat) / 6527410339149) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((-338835024887419 : Rat) / 6527410339149) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0129
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0130 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0130 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0130
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0131 : Poly :=
[
  term ((-7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2)]
]

/-- Partial product 131 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0131 : Poly :=
[
  term ((-7337393541563251 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 2)],
  term ((-7337393541563251 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 2)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (8, 2), (11, 2)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0131
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0132 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 132 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0132 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0132
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0133 : Poly :=
[
  term ((-73167476510108759 : Rat) / 39164462034894) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 133 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0133 : Poly :=
[
  term ((-73167476510108759 : Rat) / 39164462034894) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-73167476510108759 : Rat) / 39164462034894) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((73167476510108759 : Rat) / 39164462034894) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((73167476510108759 : Rat) / 39164462034894) [(6, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0133
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0134 : Poly :=
[
  term ((349 : Rat) / 42) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0134 : Poly :=
[
  term ((349 : Rat) / 42) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((349 : Rat) / 42) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349 : Rat) / 42) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349 : Rat) / 42) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0134
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0135 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

/-- Partial product 135 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0135 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (8, 2), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0135
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0136 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 136 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0136 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (8, 2), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0136
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0137 : Poly :=
[
  term ((1532199782809 : Rat) / 107447083772) [(6, 1), (14, 1)]
]

/-- Partial product 137 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0137 : Poly :=
[
  term ((1532199782809 : Rat) / 107447083772) [(0, 2), (6, 1), (14, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(1, 2), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 1), (8, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0137
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0138 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 138 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0138 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 2), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0138
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0139 : Poly :=
[
  term ((13718602083010135 : Rat) / 13054820678298) [(6, 1), (15, 2)]
]

/-- Partial product 139 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0139 : Poly :=
[
  term ((13718602083010135 : Rat) / 13054820678298) [(0, 2), (6, 1), (15, 2)],
  term ((13718602083010135 : Rat) / 13054820678298) [(1, 2), (6, 1), (15, 2)],
  term ((-13718602083010135 : Rat) / 13054820678298) [(6, 1), (8, 2), (15, 2)],
  term ((-13718602083010135 : Rat) / 13054820678298) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0139
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0140 : Poly :=
[
  term ((-494 : Rat) / 63) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 140 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0140 : Poly :=
[
  term ((-494 : Rat) / 63) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 63) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 63) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((494 : Rat) / 63) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0140
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0141 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1)]
]

/-- Partial product 141 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0141 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (8, 2), (9, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0141
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0142 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 142 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0142 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0142
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0143 : Poly :=
[
  term ((-205192938256542655 : Rat) / 156657848139576) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 143 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0143 : Poly :=
[
  term ((-205192938256542655 : Rat) / 156657848139576) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-205192938256542655 : Rat) / 156657848139576) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((205192938256542655 : Rat) / 156657848139576) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((205192938256542655 : Rat) / 156657848139576) [(7, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0143
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0144 : Poly :=
[
  term ((-671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 144 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0144 : Poly :=
[
  term ((-671624185440367 : Rat) / 6527410339149) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-671624185440367 : Rat) / 6527410339149) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0144
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0145 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 145 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0145 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (9, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0145
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0146 : Poly :=
[
  term ((170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0146 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0146
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0147 : Poly :=
[
  term ((-778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 147 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0147 : Poly :=
[
  term ((-778138690868335 : Rat) / 725267815461) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-778138690868335 : Rat) / 725267815461) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0147
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0148 : Poly :=
[
  term ((-32 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0148 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0148
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0149 : Poly :=
[
  term ((2978180803873216 : Rat) / 6527410339149) [(7, 1), (11, 1)]
]

/-- Partial product 149 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0149 : Poly :=
[
  term ((2978180803873216 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1)],
  term ((2978180803873216 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1)],
  term ((-2978180803873216 : Rat) / 6527410339149) [(7, 1), (8, 2), (11, 1)],
  term ((-2978180803873216 : Rat) / 6527410339149) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0149
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0150 : Poly :=
[
  term ((-27208160598739489 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 150 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0150 : Poly :=
[
  term ((-27208160598739489 : Rat) / 26109641356596) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-27208160598739489 : Rat) / 26109641356596) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((27208160598739489 : Rat) / 26109641356596) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((27208160598739489 : Rat) / 26109641356596) [(7, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0150
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0151 : Poly :=
[
  term ((-108031449958214659 : Rat) / 156657848139576) [(7, 1), (13, 1)]
]

/-- Partial product 151 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0151 : Poly :=
[
  term ((-108031449958214659 : Rat) / 156657848139576) [(0, 2), (7, 1), (13, 1)],
  term ((-108031449958214659 : Rat) / 156657848139576) [(1, 2), (7, 1), (13, 1)],
  term ((108031449958214659 : Rat) / 156657848139576) [(7, 1), (8, 2), (13, 1)],
  term ((108031449958214659 : Rat) / 156657848139576) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0151
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0152 : Poly :=
[
  term ((77712280655990167 : Rat) / 78328924069788) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 152 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0152 : Poly :=
[
  term ((77712280655990167 : Rat) / 78328924069788) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((77712280655990167 : Rat) / 78328924069788) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-77712280655990167 : Rat) / 78328924069788) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-77712280655990167 : Rat) / 78328924069788) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0152
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0153 : Poly :=
[
  term ((-1495 : Rat) / 126) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 153 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0153 : Poly :=
[
  term ((-1495 : Rat) / 126) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0153
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0154 : Poly :=
[
  term ((1495 : Rat) / 252) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 154 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0154 : Poly :=
[
  term ((1495 : Rat) / 252) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0154
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0155 : Poly :=
[
  term ((-7417787862338948 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 155 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0155 : Poly :=
[
  term ((-7417787862338948 : Rat) / 6527410339149) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-7417787862338948 : Rat) / 6527410339149) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((7417787862338948 : Rat) / 6527410339149) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((7417787862338948 : Rat) / 6527410339149) [(7, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0155
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0156 : Poly :=
[
  term ((494 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0156 : Poly :=
[
  term ((494 : Rat) / 63) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0156
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0157 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 157 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0157 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (8, 2), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (9, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0157
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0158 : Poly :=
[
  term ((271318535678836 : Rat) / 310829063769) [(7, 1), (15, 1)]
]

/-- Partial product 158 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0158 : Poly :=
[
  term ((271318535678836 : Rat) / 310829063769) [(0, 2), (7, 1), (15, 1)],
  term ((271318535678836 : Rat) / 310829063769) [(1, 2), (7, 1), (15, 1)],
  term ((-271318535678836 : Rat) / 310829063769) [(7, 1), (8, 2), (15, 1)],
  term ((-271318535678836 : Rat) / 310829063769) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0158
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0159 : Poly :=
[
  term ((-247 : Rat) / 63) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0159 : Poly :=
[
  term ((-247 : Rat) / 63) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0159
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0160 : Poly :=
[
  term ((-5712040790311952 : Rat) / 6527410339149) [(7, 2)]
]

/-- Partial product 160 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0160 : Poly :=
[
  term ((-5712040790311952 : Rat) / 6527410339149) [(0, 2), (7, 2)],
  term ((-5712040790311952 : Rat) / 6527410339149) [(1, 2), (7, 2)],
  term ((5712040790311952 : Rat) / 6527410339149) [(7, 2), (8, 2)],
  term ((5712040790311952 : Rat) / 6527410339149) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0160
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0161 : Poly :=
[
  term ((-2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1)]
]

/-- Partial product 161 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0161 : Poly :=
[
  term ((-2600143031426873 : Rat) / 13054820678298) [(0, 2), (7, 2), (10, 1)],
  term ((-2600143031426873 : Rat) / 13054820678298) [(1, 2), (7, 2), (10, 1)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (8, 2), (10, 1)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0161
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0162 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (14, 1)]
]

/-- Partial product 162 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0162 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 2), (7, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 2), (7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (8, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0162
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0163 : Poly :=
[
  term ((8961336245329 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 163 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0163 : Poly :=
[
  term ((8961336245329 : Rat) / 26313571536) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((8961336245329 : Rat) / 26313571536) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-8961336245329 : Rat) / 26313571536) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-8961336245329 : Rat) / 26313571536) [(9, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0163
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0164 : Poly :=
[
  term ((1898393964997 : Rat) / 39470357304) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 164 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0164 : Poly :=
[
  term ((1898393964997 : Rat) / 39470357304) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((1898393964997 : Rat) / 39470357304) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1898393964997 : Rat) / 39470357304) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1898393964997 : Rat) / 39470357304) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0164
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0165 : Poly :=
[
  term ((95 : Rat) / 14) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 165 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0165 : Poly :=
[
  term ((95 : Rat) / 14) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((95 : Rat) / 14) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-95 : Rat) / 14) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-95 : Rat) / 14) [(9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0165
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0166 : Poly :=
[
  term ((9064813900522519 : Rat) / 25576791532992) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 166 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0166 : Poly :=
[
  term ((9064813900522519 : Rat) / 25576791532992) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((9064813900522519 : Rat) / 25576791532992) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-9064813900522519 : Rat) / 25576791532992) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-9064813900522519 : Rat) / 25576791532992) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0166
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0167 : Poly :=
[
  term (-6 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0167 : Poly :=
[
  term (-6 : Rat) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0167
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0168 : Poly :=
[
  term ((3022034658955 : Rat) / 26313571536) [(9, 1), (11, 1)]
]

/-- Partial product 168 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0168 : Poly :=
[
  term ((3022034658955 : Rat) / 26313571536) [(0, 2), (9, 1), (11, 1)],
  term ((3022034658955 : Rat) / 26313571536) [(1, 2), (9, 1), (11, 1)],
  term ((-3022034658955 : Rat) / 26313571536) [(8, 2), (9, 1), (11, 1)],
  term ((-3022034658955 : Rat) / 26313571536) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0168
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0169 : Poly :=
[
  term ((20287551525801613 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 169 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0169 : Poly :=
[
  term ((20287551525801613 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((20287551525801613 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-20287551525801613 : Rat) / 25576791532992) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-20287551525801613 : Rat) / 25576791532992) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0169
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0170 : Poly :=
[
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 170 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0170 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0170
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0171 : Poly :=
[
  term ((1744309222178023 : Rat) / 8525597177664) [(9, 1), (13, 1)]
]

/-- Partial product 171 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0171 : Poly :=
[
  term ((1744309222178023 : Rat) / 8525597177664) [(0, 2), (9, 1), (13, 1)],
  term ((1744309222178023 : Rat) / 8525597177664) [(1, 2), (9, 1), (13, 1)],
  term ((-1744309222178023 : Rat) / 8525597177664) [(8, 2), (9, 1), (13, 1)],
  term ((-1744309222178023 : Rat) / 8525597177664) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0171
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0172 : Poly :=
[
  term ((3940048014230159 : Rat) / 12788395766496) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 172 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0172 : Poly :=
[
  term ((3940048014230159 : Rat) / 12788395766496) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((3940048014230159 : Rat) / 12788395766496) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3940048014230159 : Rat) / 12788395766496) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3940048014230159 : Rat) / 12788395766496) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0172
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0173 : Poly :=
[
  term ((715 : Rat) / 84) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 173 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0173 : Poly :=
[
  term ((715 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((715 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-715 : Rat) / 84) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-715 : Rat) / 84) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0173
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0174 : Poly :=
[
  term ((-12753863657789 : Rat) / 59205535956) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 174 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0174 : Poly :=
[
  term ((-12753863657789 : Rat) / 59205535956) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-12753863657789 : Rat) / 59205535956) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((12753863657789 : Rat) / 59205535956) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((12753863657789 : Rat) / 59205535956) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0174
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0175 : Poly :=
[
  term ((305 : Rat) / 28) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 175 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0175 : Poly :=
[
  term ((305 : Rat) / 28) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0175
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0176 : Poly :=
[
  term ((-1415 : Rat) / 336) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 176 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0176 : Poly :=
[
  term ((-1415 : Rat) / 336) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1415 : Rat) / 336) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((1415 : Rat) / 336) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((1415 : Rat) / 336) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0176
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0177 : Poly :=
[
  term ((18565491994814585 : Rat) / 69625710284256) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 177 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0177 : Poly :=
[
  term ((18565491994814585 : Rat) / 69625710284256) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((18565491994814585 : Rat) / 69625710284256) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-18565491994814585 : Rat) / 69625710284256) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-18565491994814585 : Rat) / 69625710284256) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0177
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0178 : Poly :=
[
  term ((-137 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0178 : Poly :=
[
  term ((-137 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-137 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((137 : Rat) / 21) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((137 : Rat) / 21) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0178
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0179 : Poly :=
[
  term ((-22932435978840733 : Rat) / 25576791532992) [(9, 1), (15, 1)]
]

/-- Partial product 179 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0179 : Poly :=
[
  term ((-22932435978840733 : Rat) / 25576791532992) [(0, 2), (9, 1), (15, 1)],
  term ((-22932435978840733 : Rat) / 25576791532992) [(1, 2), (9, 1), (15, 1)],
  term ((22932435978840733 : Rat) / 25576791532992) [(8, 2), (9, 1), (15, 1)],
  term ((22932435978840733 : Rat) / 25576791532992) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0179
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0180 : Poly :=
[
  term ((263 : Rat) / 84) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0180 : Poly :=
[
  term ((263 : Rat) / 84) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((263 : Rat) / 84) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-263 : Rat) / 84) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-263 : Rat) / 84) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0180
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0181 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (15, 3)]
]

/-- Partial product 181 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0181 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (9, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(8, 2), (9, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0181
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0182 : Poly :=
[
  term ((-65 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 182 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0182 : Poly :=
[
  term ((-65 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0182
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0183 : Poly :=
[
  term ((-1357626083125 : Rat) / 5138997696) [(9, 2)]
]

/-- Partial product 183 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0183 : Poly :=
[
  term ((-1357626083125 : Rat) / 5138997696) [(0, 2), (9, 2)],
  term ((-1357626083125 : Rat) / 5138997696) [(1, 2), (9, 2)],
  term ((1357626083125 : Rat) / 5138997696) [(8, 2), (9, 2)],
  term ((1357626083125 : Rat) / 5138997696) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0183
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0184 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1)]
]

/-- Partial product 184 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0184 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(0, 2), (9, 2), (10, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 2), (9, 2), (10, 1)],
  term ((2172201733 : Rat) / 166541592) [(8, 2), (9, 2), (10, 1)],
  term ((2172201733 : Rat) / 166541592) [(9, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0184
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0185 : Poly :=
[
  term ((2439382546159 : Rat) / 8993245968) [(9, 2), (14, 1)]
]

/-- Partial product 185 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0185 : Poly :=
[
  term ((2439382546159 : Rat) / 8993245968) [(0, 2), (9, 2), (14, 1)],
  term ((2439382546159 : Rat) / 8993245968) [(1, 2), (9, 2), (14, 1)],
  term ((-2439382546159 : Rat) / 8993245968) [(8, 2), (9, 2), (14, 1)],
  term ((-2439382546159 : Rat) / 8993245968) [(9, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0185
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0186 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (15, 2)]
]

/-- Partial product 186 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0186 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(0, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(1, 2), (9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(8, 2), (9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0186
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0187 : Poly :=
[
  term ((-9984 : Rat) / 553) [(10, 1)]
]

/-- Partial product 187 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0187 : Poly :=
[
  term ((-9984 : Rat) / 553) [(0, 2), (10, 1)],
  term ((-9984 : Rat) / 553) [(1, 2), (10, 1)],
  term ((9984 : Rat) / 553) [(8, 2), (10, 1)],
  term ((9984 : Rat) / 553) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0187
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0188 : Poly :=
[
  term ((-16014052963429 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 188 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0188 : Poly :=
[
  term ((-16014052963429 : Rat) / 118411071912) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-16014052963429 : Rat) / 118411071912) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((16014052963429 : Rat) / 118411071912) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((16014052963429 : Rat) / 118411071912) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0188
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0189 : Poly :=
[
  term ((-165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 189 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0189 : Poly :=
[
  term ((-165 : Rat) / 28) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-165 : Rat) / 28) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((165 : Rat) / 28) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((165 : Rat) / 28) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0189
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0190 : Poly :=
[
  term ((5124459241500700 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 190 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0190 : Poly :=
[
  term ((5124459241500700 : Rat) / 6527410339149) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((5124459241500700 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5124459241500700 : Rat) / 6527410339149) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-5124459241500700 : Rat) / 6527410339149) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0190
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0191 : Poly :=
[
  term ((37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0191 : Poly :=
[
  term ((37 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 7) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 7) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0191
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0192 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2)]
]

/-- Partial product 192 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0192 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(8, 2), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(9, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0192
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0193 : Poly :=
[
  term ((-4047153293403883 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 193 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0193 : Poly :=
[
  term ((-4047153293403883 : Rat) / 12788395766496) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4047153293403883 : Rat) / 12788395766496) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((4047153293403883 : Rat) / 12788395766496) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((4047153293403883 : Rat) / 12788395766496) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0193
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0194 : Poly :=
[
  term ((-9881 : Rat) / 1008) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0194 : Poly :=
[
  term ((-9881 : Rat) / 1008) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9881 : Rat) / 1008) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9881 : Rat) / 1008) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9881 : Rat) / 1008) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0194
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0195 : Poly :=
[
  term ((-4706213285 : Rat) / 107062452) [(10, 1), (13, 2)]
]

/-- Partial product 195 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0195 : Poly :=
[
  term ((-4706213285 : Rat) / 107062452) [(0, 2), (10, 1), (13, 2)],
  term ((-4706213285 : Rat) / 107062452) [(1, 2), (10, 1), (13, 2)],
  term ((4706213285 : Rat) / 107062452) [(8, 2), (10, 1), (13, 2)],
  term ((4706213285 : Rat) / 107062452) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0195
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0196 : Poly :=
[
  term ((5 : Rat) / 2) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 196 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0196 : Poly :=
[
  term ((5 : Rat) / 2) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 2) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0196
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0197 : Poly :=
[
  term ((-2480257240307321 : Rat) / 17406427571064) [(10, 1), (14, 1)]
]

/-- Partial product 197 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0197 : Poly :=
[
  term ((-2480257240307321 : Rat) / 17406427571064) [(0, 2), (10, 1), (14, 1)],
  term ((-2480257240307321 : Rat) / 17406427571064) [(1, 2), (10, 1), (14, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(8, 2), (10, 1), (14, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0197
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0198 : Poly :=
[
  term ((11294698751879279 : Rat) / 52219282713192) [(10, 1), (15, 2)]
]

/-- Partial product 198 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0198 : Poly :=
[
  term ((11294698751879279 : Rat) / 52219282713192) [(0, 2), (10, 1), (15, 2)],
  term ((11294698751879279 : Rat) / 52219282713192) [(1, 2), (10, 1), (15, 2)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(8, 2), (10, 1), (15, 2)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0198
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0199 : Poly :=
[
  term ((1865 : Rat) / 252) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 199 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0199 : Poly :=
[
  term ((1865 : Rat) / 252) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((1865 : Rat) / 252) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1865 : Rat) / 252) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1865 : Rat) / 252) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0199
        rs_R009_ueqv_R009YNNNN_generator_01_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_01_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_01_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_01_0100,
  rs_R009_ueqv_R009YNNNN_partial_01_0101,
  rs_R009_ueqv_R009YNNNN_partial_01_0102,
  rs_R009_ueqv_R009YNNNN_partial_01_0103,
  rs_R009_ueqv_R009YNNNN_partial_01_0104,
  rs_R009_ueqv_R009YNNNN_partial_01_0105,
  rs_R009_ueqv_R009YNNNN_partial_01_0106,
  rs_R009_ueqv_R009YNNNN_partial_01_0107,
  rs_R009_ueqv_R009YNNNN_partial_01_0108,
  rs_R009_ueqv_R009YNNNN_partial_01_0109,
  rs_R009_ueqv_R009YNNNN_partial_01_0110,
  rs_R009_ueqv_R009YNNNN_partial_01_0111,
  rs_R009_ueqv_R009YNNNN_partial_01_0112,
  rs_R009_ueqv_R009YNNNN_partial_01_0113,
  rs_R009_ueqv_R009YNNNN_partial_01_0114,
  rs_R009_ueqv_R009YNNNN_partial_01_0115,
  rs_R009_ueqv_R009YNNNN_partial_01_0116,
  rs_R009_ueqv_R009YNNNN_partial_01_0117,
  rs_R009_ueqv_R009YNNNN_partial_01_0118,
  rs_R009_ueqv_R009YNNNN_partial_01_0119,
  rs_R009_ueqv_R009YNNNN_partial_01_0120,
  rs_R009_ueqv_R009YNNNN_partial_01_0121,
  rs_R009_ueqv_R009YNNNN_partial_01_0122,
  rs_R009_ueqv_R009YNNNN_partial_01_0123,
  rs_R009_ueqv_R009YNNNN_partial_01_0124,
  rs_R009_ueqv_R009YNNNN_partial_01_0125,
  rs_R009_ueqv_R009YNNNN_partial_01_0126,
  rs_R009_ueqv_R009YNNNN_partial_01_0127,
  rs_R009_ueqv_R009YNNNN_partial_01_0128,
  rs_R009_ueqv_R009YNNNN_partial_01_0129,
  rs_R009_ueqv_R009YNNNN_partial_01_0130,
  rs_R009_ueqv_R009YNNNN_partial_01_0131,
  rs_R009_ueqv_R009YNNNN_partial_01_0132,
  rs_R009_ueqv_R009YNNNN_partial_01_0133,
  rs_R009_ueqv_R009YNNNN_partial_01_0134,
  rs_R009_ueqv_R009YNNNN_partial_01_0135,
  rs_R009_ueqv_R009YNNNN_partial_01_0136,
  rs_R009_ueqv_R009YNNNN_partial_01_0137,
  rs_R009_ueqv_R009YNNNN_partial_01_0138,
  rs_R009_ueqv_R009YNNNN_partial_01_0139,
  rs_R009_ueqv_R009YNNNN_partial_01_0140,
  rs_R009_ueqv_R009YNNNN_partial_01_0141,
  rs_R009_ueqv_R009YNNNN_partial_01_0142,
  rs_R009_ueqv_R009YNNNN_partial_01_0143,
  rs_R009_ueqv_R009YNNNN_partial_01_0144,
  rs_R009_ueqv_R009YNNNN_partial_01_0145,
  rs_R009_ueqv_R009YNNNN_partial_01_0146,
  rs_R009_ueqv_R009YNNNN_partial_01_0147,
  rs_R009_ueqv_R009YNNNN_partial_01_0148,
  rs_R009_ueqv_R009YNNNN_partial_01_0149,
  rs_R009_ueqv_R009YNNNN_partial_01_0150,
  rs_R009_ueqv_R009YNNNN_partial_01_0151,
  rs_R009_ueqv_R009YNNNN_partial_01_0152,
  rs_R009_ueqv_R009YNNNN_partial_01_0153,
  rs_R009_ueqv_R009YNNNN_partial_01_0154,
  rs_R009_ueqv_R009YNNNN_partial_01_0155,
  rs_R009_ueqv_R009YNNNN_partial_01_0156,
  rs_R009_ueqv_R009YNNNN_partial_01_0157,
  rs_R009_ueqv_R009YNNNN_partial_01_0158,
  rs_R009_ueqv_R009YNNNN_partial_01_0159,
  rs_R009_ueqv_R009YNNNN_partial_01_0160,
  rs_R009_ueqv_R009YNNNN_partial_01_0161,
  rs_R009_ueqv_R009YNNNN_partial_01_0162,
  rs_R009_ueqv_R009YNNNN_partial_01_0163,
  rs_R009_ueqv_R009YNNNN_partial_01_0164,
  rs_R009_ueqv_R009YNNNN_partial_01_0165,
  rs_R009_ueqv_R009YNNNN_partial_01_0166,
  rs_R009_ueqv_R009YNNNN_partial_01_0167,
  rs_R009_ueqv_R009YNNNN_partial_01_0168,
  rs_R009_ueqv_R009YNNNN_partial_01_0169,
  rs_R009_ueqv_R009YNNNN_partial_01_0170,
  rs_R009_ueqv_R009YNNNN_partial_01_0171,
  rs_R009_ueqv_R009YNNNN_partial_01_0172,
  rs_R009_ueqv_R009YNNNN_partial_01_0173,
  rs_R009_ueqv_R009YNNNN_partial_01_0174,
  rs_R009_ueqv_R009YNNNN_partial_01_0175,
  rs_R009_ueqv_R009YNNNN_partial_01_0176,
  rs_R009_ueqv_R009YNNNN_partial_01_0177,
  rs_R009_ueqv_R009YNNNN_partial_01_0178,
  rs_R009_ueqv_R009YNNNN_partial_01_0179,
  rs_R009_ueqv_R009YNNNN_partial_01_0180,
  rs_R009_ueqv_R009YNNNN_partial_01_0181,
  rs_R009_ueqv_R009YNNNN_partial_01_0182,
  rs_R009_ueqv_R009YNNNN_partial_01_0183,
  rs_R009_ueqv_R009YNNNN_partial_01_0184,
  rs_R009_ueqv_R009YNNNN_partial_01_0185,
  rs_R009_ueqv_R009YNNNN_partial_01_0186,
  rs_R009_ueqv_R009YNNNN_partial_01_0187,
  rs_R009_ueqv_R009YNNNN_partial_01_0188,
  rs_R009_ueqv_R009YNNNN_partial_01_0189,
  rs_R009_ueqv_R009YNNNN_partial_01_0190,
  rs_R009_ueqv_R009YNNNN_partial_01_0191,
  rs_R009_ueqv_R009YNNNN_partial_01_0192,
  rs_R009_ueqv_R009YNNNN_partial_01_0193,
  rs_R009_ueqv_R009YNNNN_partial_01_0194,
  rs_R009_ueqv_R009YNNNN_partial_01_0195,
  rs_R009_ueqv_R009YNNNN_partial_01_0196,
  rs_R009_ueqv_R009YNNNN_partial_01_0197,
  rs_R009_ueqv_R009YNNNN_partial_01_0198,
  rs_R009_ueqv_R009YNNNN_partial_01_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_01_0100_0199 : Poly :=
[
  term ((-333576329821813 : Rat) / 532849823604) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((505 : Rat) / 42) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((104270354348416189 : Rat) / 78328924069788) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-194 : Rat) / 21) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(0, 2), (3, 1), (11, 1)],
  term ((-11509472182985360 : Rat) / 19582231017447) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-34541538442443005 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-88640 : Rat) / 1029) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-10817732676426155 : Rat) / 156657848139576) [(0, 2), (3, 1), (15, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(0, 2), (3, 2)],
  term ((-1372480999036685 : Rat) / 13054820678298) [(0, 2), (3, 2), (10, 1)],
  term ((640 : Rat) / 21) [(0, 2), (3, 2), (14, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(0, 2), (4, 1)],
  term ((4 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((719495470537705 : Rat) / 5802142523688) [(0, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((11548189763031433 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-985353530115407 : Rat) / 799274735406) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-13804982796901 : Rat) / 20234803428) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((223402835779553401 : Rat) / 156657848139576) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((314 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 166541592) [(0, 2), (6, 1), (9, 2)],
  term ((-74661298286369 : Rat) / 138146250564) [(0, 2), (6, 1), (10, 1)],
  term ((24075835681337126 : Rat) / 19582231017447) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((338835024887419 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7337393541563251 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-73167476510108759 : Rat) / 39164462034894) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((349 : Rat) / 42) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(0, 2), (6, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((13718602083010135 : Rat) / 13054820678298) [(0, 2), (6, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-205192938256542655 : Rat) / 156657848139576) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-671624185440367 : Rat) / 6527410339149) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-778138690868335 : Rat) / 725267815461) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2978180803873216 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1)],
  term ((-27208160598739489 : Rat) / 26109641356596) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-108031449958214659 : Rat) / 156657848139576) [(0, 2), (7, 1), (13, 1)],
  term ((77712280655990167 : Rat) / 78328924069788) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 126) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-7417787862338948 : Rat) / 6527410339149) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((271318535678836 : Rat) / 310829063769) [(0, 2), (7, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5712040790311952 : Rat) / 6527410339149) [(0, 2), (7, 2)],
  term ((-2600143031426873 : Rat) / 13054820678298) [(0, 2), (7, 2), (10, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 2), (7, 2), (14, 1)],
  term ((8961336245329 : Rat) / 26313571536) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((1898393964997 : Rat) / 39470357304) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((95 : Rat) / 14) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((9064813900522519 : Rat) / 25576791532992) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term (-6 : Rat) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3022034658955 : Rat) / 26313571536) [(0, 2), (9, 1), (11, 1)],
  term ((20287551525801613 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((1744309222178023 : Rat) / 8525597177664) [(0, 2), (9, 1), (13, 1)],
  term ((3940048014230159 : Rat) / 12788395766496) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((715 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12753863657789 : Rat) / 59205535956) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1415 : Rat) / 336) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((18565491994814585 : Rat) / 69625710284256) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-137 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22932435978840733 : Rat) / 25576791532992) [(0, 2), (9, 1), (15, 1)],
  term ((263 : Rat) / 84) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1357626083125 : Rat) / 5138997696) [(0, 2), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(0, 2), (9, 2), (10, 1)],
  term ((2439382546159 : Rat) / 8993245968) [(0, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(0, 2), (9, 2), (15, 2)],
  term ((-9984 : Rat) / 553) [(0, 2), (10, 1)],
  term ((-16014052963429 : Rat) / 118411071912) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-165 : Rat) / 28) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5124459241500700 : Rat) / 6527410339149) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((37 : Rat) / 7) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (10, 1), (11, 2)],
  term ((-4047153293403883 : Rat) / 12788395766496) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-9881 : Rat) / 1008) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 2), (10, 1), (13, 2)],
  term ((5 : Rat) / 2) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2480257240307321 : Rat) / 17406427571064) [(0, 2), (10, 1), (14, 1)],
  term ((11294698751879279 : Rat) / 52219282713192) [(0, 2), (10, 1), (15, 2)],
  term ((1865 : Rat) / 252) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((505 : Rat) / 42) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((104270354348416189 : Rat) / 78328924069788) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-194 : Rat) / 21) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-327683327437187 : Rat) / 2175803446383) [(1, 2), (3, 1), (11, 1)],
  term ((-11509472182985360 : Rat) / 19582231017447) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-34541538442443005 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-88640 : Rat) / 1029) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-10817732676426155 : Rat) / 156657848139576) [(1, 2), (3, 1), (15, 1)],
  term ((-1328274198856205 : Rat) / 26109641356596) [(1, 2), (3, 2)],
  term ((-1372480999036685 : Rat) / 13054820678298) [(1, 2), (3, 2), (10, 1)],
  term ((640 : Rat) / 21) [(1, 2), (3, 2), (14, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(1, 2), (4, 1)],
  term ((4 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((719495470537705 : Rat) / 5802142523688) [(1, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((11548189763031433 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((-985353530115407 : Rat) / 799274735406) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-13804982796901 : Rat) / 20234803428) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((223402835779553401 : Rat) / 156657848139576) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((314 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 2), (6, 1), (9, 2)],
  term ((-74661298286369 : Rat) / 138146250564) [(1, 2), (6, 1), (10, 1)],
  term ((24075835681337126 : Rat) / 19582231017447) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((338835024887419 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7337393541563251 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-73167476510108759 : Rat) / 39164462034894) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((349 : Rat) / 42) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(1, 2), (6, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)],
  term ((13718602083010135 : Rat) / 13054820678298) [(1, 2), (6, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((-205192938256542655 : Rat) / 156657848139576) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((-671624185440367 : Rat) / 6527410339149) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((170 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-778138690868335 : Rat) / 725267815461) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2978180803873216 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1)],
  term ((-27208160598739489 : Rat) / 26109641356596) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-108031449958214659 : Rat) / 156657848139576) [(1, 2), (7, 1), (13, 1)],
  term ((77712280655990167 : Rat) / 78328924069788) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 126) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-7417787862338948 : Rat) / 6527410339149) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((271318535678836 : Rat) / 310829063769) [(1, 2), (7, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5712040790311952 : Rat) / 6527410339149) [(1, 2), (7, 2)],
  term ((-2600143031426873 : Rat) / 13054820678298) [(1, 2), (7, 2), (10, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 2), (7, 2), (14, 1)],
  term ((8961336245329 : Rat) / 26313571536) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((1898393964997 : Rat) / 39470357304) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((95 : Rat) / 14) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((9064813900522519 : Rat) / 25576791532992) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term (-6 : Rat) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3022034658955 : Rat) / 26313571536) [(1, 2), (9, 1), (11, 1)],
  term ((20287551525801613 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((1744309222178023 : Rat) / 8525597177664) [(1, 2), (9, 1), (13, 1)],
  term ((3940048014230159 : Rat) / 12788395766496) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((715 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12753863657789 : Rat) / 59205535956) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1415 : Rat) / 336) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((18565491994814585 : Rat) / 69625710284256) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-137 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22932435978840733 : Rat) / 25576791532992) [(1, 2), (9, 1), (15, 1)],
  term ((263 : Rat) / 84) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1357626083125 : Rat) / 5138997696) [(1, 2), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(1, 2), (9, 2), (10, 1)],
  term ((2439382546159 : Rat) / 8993245968) [(1, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(1, 2), (9, 2), (15, 2)],
  term ((-9984 : Rat) / 553) [(1, 2), (10, 1)],
  term ((-16014052963429 : Rat) / 118411071912) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-165 : Rat) / 28) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5124459241500700 : Rat) / 6527410339149) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((37 : Rat) / 7) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (10, 1), (11, 2)],
  term ((-4047153293403883 : Rat) / 12788395766496) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-9881 : Rat) / 1008) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 107062452) [(1, 2), (10, 1), (13, 2)],
  term ((5 : Rat) / 2) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2480257240307321 : Rat) / 17406427571064) [(1, 2), (10, 1), (14, 1)],
  term ((11294698751879279 : Rat) / 52219282713192) [(1, 2), (10, 1), (15, 2)],
  term ((1865 : Rat) / 252) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (8, 2), (10, 1), (13, 1)],
  term ((-505 : Rat) / 42) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (8, 2), (10, 1), (15, 1)],
  term ((194 : Rat) / 21) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(3, 1), (8, 2), (11, 1)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (8, 2), (11, 1), (14, 1)],
  term ((34541538442443005 : Rat) / 78328924069788) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((88640 : Rat) / 1029) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((10817732676426155 : Rat) / 156657848139576) [(3, 1), (8, 2), (15, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(3, 1), (9, 2), (10, 1), (13, 1)],
  term ((-505 : Rat) / 42) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-104270354348416189 : Rat) / 78328924069788) [(3, 1), (9, 2), (10, 1), (15, 1)],
  term ((194 : Rat) / 21) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((327683327437187 : Rat) / 2175803446383) [(3, 1), (9, 2), (11, 1)],
  term ((11509472182985360 : Rat) / 19582231017447) [(3, 1), (9, 2), (11, 1), (14, 1)],
  term ((34541538442443005 : Rat) / 78328924069788) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((88640 : Rat) / 1029) [(3, 1), (9, 2), (14, 1), (15, 1)],
  term ((10817732676426155 : Rat) / 156657848139576) [(3, 1), (9, 2), (15, 1)],
  term ((1328274198856205 : Rat) / 26109641356596) [(3, 2), (8, 2)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (8, 2), (10, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (8, 2), (14, 1)],
  term ((1328274198856205 : Rat) / 26109641356596) [(3, 2), (9, 2)],
  term ((1372480999036685 : Rat) / 13054820678298) [(3, 2), (9, 2), (10, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (9, 2), (14, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (8, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1), (9, 2)],
  term ((-4 : Rat) / 3) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (8, 2), (11, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((-11548189763031433 : Rat) / 13054820678298) [(6, 1), (7, 1), (9, 2), (11, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 2), (13, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 2), (15, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 3)],
  term ((-719495470537705 : Rat) / 5802142523688) [(6, 1), (8, 2)],
  term ((985353530115407 : Rat) / 799274735406) [(6, 1), (8, 2), (9, 1), (11, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((725 : Rat) / 42) [(6, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-223402835779553401 : Rat) / 156657848139576) [(6, 1), (8, 2), (9, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (8, 2), (9, 2)],
  term ((74661298286369 : Rat) / 138146250564) [(6, 1), (8, 2), (10, 1)],
  term ((-24075835681337126 : Rat) / 19582231017447) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-338835024887419 : Rat) / 6527410339149) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (8, 2), (11, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((73167476510108759 : Rat) / 39164462034894) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((-349 : Rat) / 42) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (8, 2), (13, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (8, 2), (13, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 1), (8, 2), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 2), (14, 1), (15, 2)],
  term ((-13718602083010135 : Rat) / 13054820678298) [(6, 1), (8, 2), (15, 2)],
  term ((494 : Rat) / 63) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-719495470537705 : Rat) / 5802142523688) [(6, 1), (9, 2)],
  term ((74661298286369 : Rat) / 138146250564) [(6, 1), (9, 2), (10, 1)],
  term ((-24075835681337126 : Rat) / 19582231017447) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-338835024887419 : Rat) / 6527410339149) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (9, 2), (11, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((73167476510108759 : Rat) / 39164462034894) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-349 : Rat) / 42) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (9, 2), (13, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (9, 2), (13, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 1), (9, 2), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (9, 2), (14, 1), (15, 2)],
  term ((-13718602083010135 : Rat) / 13054820678298) [(6, 1), (9, 2), (15, 2)],
  term ((494 : Rat) / 63) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((985353530115407 : Rat) / 799274735406) [(6, 1), (9, 3), (11, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(6, 1), (9, 3), (13, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 3), (13, 1), (16, 1)],
  term ((-223402835779553401 : Rat) / 156657848139576) [(6, 1), (9, 3), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 4)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (8, 2), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((205192938256542655 : Rat) / 156657848139576) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((32 : Rat) / 9) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2978180803873216 : Rat) / 6527410339149) [(7, 1), (8, 2), (11, 1)],
  term ((27208160598739489 : Rat) / 26109641356596) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((108031449958214659 : Rat) / 156657848139576) [(7, 1), (8, 2), (13, 1)],
  term ((-77712280655990167 : Rat) / 78328924069788) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((7417787862338948 : Rat) / 6527410339149) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (8, 2), (14, 2), (15, 1)],
  term ((-271318535678836 : Rat) / 310829063769) [(7, 1), (8, 2), (15, 1)],
  term ((247 : Rat) / 63) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (9, 2), (10, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (9, 2), (10, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (9, 2), (10, 1), (15, 1)],
  term ((32 : Rat) / 9) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2978180803873216 : Rat) / 6527410339149) [(7, 1), (9, 2), (11, 1)],
  term ((27208160598739489 : Rat) / 26109641356596) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((108031449958214659 : Rat) / 156657848139576) [(7, 1), (9, 2), (13, 1)],
  term ((-77712280655990167 : Rat) / 78328924069788) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((7417787862338948 : Rat) / 6527410339149) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (9, 2), (14, 2), (15, 1)],
  term ((-271318535678836 : Rat) / 310829063769) [(7, 1), (9, 2), (15, 1)],
  term ((247 : Rat) / 63) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 3)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 3), (10, 1)],
  term ((205192938256542655 : Rat) / 156657848139576) [(7, 1), (9, 3), (14, 1)],
  term ((5712040790311952 : Rat) / 6527410339149) [(7, 2), (8, 2)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (8, 2), (10, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (8, 2), (14, 1)],
  term ((5712040790311952 : Rat) / 6527410339149) [(7, 2), (9, 2)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (9, 2), (10, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (9, 2), (14, 1)],
  term ((-8961336245329 : Rat) / 26313571536) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1898393964997 : Rat) / 39470357304) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-95 : Rat) / 14) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-9064813900522519 : Rat) / 25576791532992) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term (6 : Rat) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3022034658955 : Rat) / 26313571536) [(8, 2), (9, 1), (11, 1)],
  term ((-20287551525801613 : Rat) / 25576791532992) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-1744309222178023 : Rat) / 8525597177664) [(8, 2), (9, 1), (13, 1)],
  term ((-3940048014230159 : Rat) / 12788395766496) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-715 : Rat) / 84) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12753863657789 : Rat) / 59205535956) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1415 : Rat) / 336) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-18565491994814585 : Rat) / 69625710284256) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((137 : Rat) / 21) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((22932435978840733 : Rat) / 25576791532992) [(8, 2), (9, 1), (15, 1)],
  term ((-263 : Rat) / 84) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(8, 2), (9, 1), (15, 3)],
  term ((65 : Rat) / 7) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((1357626083125 : Rat) / 5138997696) [(8, 2), (9, 2)],
  term ((2172201733 : Rat) / 166541592) [(8, 2), (9, 2), (10, 1)],
  term ((-2439382546159 : Rat) / 8993245968) [(8, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(8, 2), (9, 2), (15, 2)],
  term ((9984 : Rat) / 553) [(8, 2), (10, 1)],
  term ((16014052963429 : Rat) / 118411071912) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((165 : Rat) / 28) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5124459241500700 : Rat) / 6527410339149) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-37 : Rat) / 7) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(8, 2), (10, 1), (11, 2)],
  term ((4047153293403883 : Rat) / 12788395766496) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((9881 : Rat) / 1008) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 107062452) [(8, 2), (10, 1), (13, 2)],
  term ((-5 : Rat) / 2) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(8, 2), (10, 1), (14, 1)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(8, 2), (10, 1), (15, 2)],
  term ((-1865 : Rat) / 252) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((9984 : Rat) / 553) [(9, 2), (10, 1)],
  term ((16014052963429 : Rat) / 118411071912) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((165 : Rat) / 28) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5124459241500700 : Rat) / 6527410339149) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-37 : Rat) / 7) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(9, 2), (10, 1), (11, 2)],
  term ((4047153293403883 : Rat) / 12788395766496) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((9881 : Rat) / 1008) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 107062452) [(9, 2), (10, 1), (13, 2)],
  term ((-5 : Rat) / 2) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(9, 2), (10, 1), (14, 1)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(9, 2), (10, 1), (15, 2)],
  term ((-1865 : Rat) / 252) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-8961336245329 : Rat) / 26313571536) [(9, 3), (10, 1), (11, 1)],
  term ((-1898393964997 : Rat) / 39470357304) [(9, 3), (10, 1), (13, 1)],
  term ((-95 : Rat) / 14) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-9064813900522519 : Rat) / 25576791532992) [(9, 3), (10, 1), (15, 1)],
  term (6 : Rat) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-3022034658955 : Rat) / 26313571536) [(9, 3), (11, 1)],
  term ((-20287551525801613 : Rat) / 25576791532992) [(9, 3), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(9, 3), (11, 1), (15, 2)],
  term ((-1744309222178023 : Rat) / 8525597177664) [(9, 3), (13, 1)],
  term ((-3940048014230159 : Rat) / 12788395766496) [(9, 3), (13, 1), (14, 1)],
  term ((-715 : Rat) / 84) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((12753863657789 : Rat) / 59205535956) [(9, 3), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((1415 : Rat) / 336) [(9, 3), (13, 1), (16, 1)],
  term ((-18565491994814585 : Rat) / 69625710284256) [(9, 3), (14, 1), (15, 1)],
  term ((137 : Rat) / 21) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((22932435978840733 : Rat) / 25576791532992) [(9, 3), (15, 1)],
  term ((-263 : Rat) / 84) [(9, 3), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 3), (15, 3)],
  term ((65 : Rat) / 7) [(9, 3), (15, 3), (16, 1)],
  term ((1357626083125 : Rat) / 5138997696) [(9, 4)],
  term ((2172201733 : Rat) / 166541592) [(9, 4), (10, 1)],
  term ((-2439382546159 : Rat) / 8993245968) [(9, 4), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_01_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_01_0100_0199
      rs_R009_ueqv_R009YNNNN_block_01_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
