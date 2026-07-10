/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 25:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0100 : Poly :=
[
  term ((5 : Rat) / 7) [(0, 2), (13, 2), (16, 1)]
]

/-- Partial product 100 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0100 : Poly :=
[
  term ((-10 : Rat) / 7) [(0, 2), (1, 1), (13, 3), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (1, 2), (13, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 3), (12, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 7) [(0, 4), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0100
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0101 : Poly :=
[
  term ((-50436208360 : Rat) / 187359291) [(0, 2), (15, 2)]
]

/-- Partial product 101 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0101 : Poly :=
[
  term ((100872416720 : Rat) / 187359291) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((-50436208360 : Rat) / 187359291) [(0, 2), (1, 2), (15, 2)],
  term ((100872416720 : Rat) / 187359291) [(0, 3), (12, 1), (15, 2)],
  term ((-50436208360 : Rat) / 187359291) [(0, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0101
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0102 : Poly :=
[
  term ((8 : Rat) / 7) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0102 : Poly :=
[
  term ((-16 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 7) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 3), (12, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 7) [(0, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0102
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0103 : Poly :=
[
  term ((-320 : Rat) / 21) [(1, 1), (3, 1)]
]

/-- Partial product 103 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0103 : Poly :=
[
  term ((640 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-320 : Rat) / 21) [(0, 2), (1, 1), (3, 1)],
  term ((640 : Rat) / 21) [(1, 2), (3, 1), (13, 1)],
  term ((-320 : Rat) / 21) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0103
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0104 : Poly :=
[
  term ((-1505101399578125 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 104 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0104 : Poly :=
[
  term ((1505101399578125 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((-1505101399578125 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((1505101399578125 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-1505101399578125 : Rat) / 39164462034894) [(1, 3), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0104
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0105 : Poly :=
[
  term ((2101893202014605 : Rat) / 39164462034894) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 105 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0105 : Poly :=
[
  term ((-2101893202014605 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((2101893202014605 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-2101893202014605 : Rat) / 19582231017447) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((2101893202014605 : Rat) / 39164462034894) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0105
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0106 : Poly :=
[
  term ((-8192672238679723 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 106 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0106 : Poly :=
[
  term ((16385344477359446 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0106
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0107 : Poly :=
[
  term ((6788130415625 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 107 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0107 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0107
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0108 : Poly :=
[
  term ((4429612052419699 : Rat) / 3729948765228) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 108 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0108 : Poly :=
[
  term ((-4429612052419699 : Rat) / 1864974382614) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((4429612052419699 : Rat) / 3729948765228) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-4429612052419699 : Rat) / 1864974382614) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((4429612052419699 : Rat) / 3729948765228) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0108
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0109 : Poly :=
[
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 109 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0109 : Poly :=
[
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 3), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0109
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0110 : Poly :=
[
  term ((-9027763436335891 : Rat) / 19582231017447) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 110 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0110 : Poly :=
[
  term ((18055526872671782 : Rat) / 19582231017447) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-9027763436335891 : Rat) / 19582231017447) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((18055526872671782 : Rat) / 19582231017447) [(1, 2), (6, 1), (13, 2)],
  term ((-9027763436335891 : Rat) / 19582231017447) [(1, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0110
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0111 : Poly :=
[
  term ((-85 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0111 : Poly :=
[
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0111
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0112 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 112 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0112 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 3), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0112
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0113 : Poly :=
[
  term ((-4565229160600973 : Rat) / 4351606892766) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 113 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0113 : Poly :=
[
  term ((4565229160600973 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-4565229160600973 : Rat) / 4351606892766) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((4565229160600973 : Rat) / 2175803446383) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-4565229160600973 : Rat) / 4351606892766) [(1, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0113
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0114 : Poly :=
[
  term ((16 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0114 : Poly :=
[
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0114
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0115 : Poly :=
[
  term ((-522480125937869 : Rat) / 1450535630922) [(1, 1), (7, 1)]
]

/-- Partial product 115 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0115 : Poly :=
[
  term ((522480125937869 : Rat) / 725267815461) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-522480125937869 : Rat) / 1450535630922) [(0, 2), (1, 1), (7, 1)],
  term ((522480125937869 : Rat) / 725267815461) [(1, 2), (7, 1), (13, 1)],
  term ((-522480125937869 : Rat) / 1450535630922) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0115
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0116 : Poly :=
[
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 116 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0116 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 2), (14, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 3), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0116
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0117 : Poly :=
[
  term ((4361787269395481 : Rat) / 2901071261844) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 117 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0117 : Poly :=
[
  term ((-4361787269395481 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((4361787269395481 : Rat) / 2901071261844) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-4361787269395481 : Rat) / 1450535630922) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((4361787269395481 : Rat) / 2901071261844) [(1, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0117
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0118 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 2)]
]

/-- Partial product 118 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0118 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (1, 1), (7, 1), (14, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 3), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0118
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0119 : Poly :=
[
  term ((584322266177 : Rat) / 17986491936) [(1, 1), (9, 1)]
]

/-- Partial product 119 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0119 : Poly :=
[
  term ((-584322266177 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((584322266177 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1)],
  term ((-584322266177 : Rat) / 8993245968) [(1, 2), (9, 1), (13, 1)],
  term ((584322266177 : Rat) / 17986491936) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0119
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0120 : Poly :=
[
  term ((-10861008665 : Rat) / 428249808) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 120 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0120 : Poly :=
[
  term ((10861008665 : Rat) / 214124904) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-10861008665 : Rat) / 428249808) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((10861008665 : Rat) / 214124904) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10861008665 : Rat) / 428249808) [(1, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0120
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0121 : Poly :=
[
  term ((-10861008665 : Rat) / 214124904) [(1, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 121 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0121 : Poly :=
[
  term ((10861008665 : Rat) / 107062452) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-10861008665 : Rat) / 214124904) [(0, 2), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((10861008665 : Rat) / 107062452) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-10861008665 : Rat) / 214124904) [(1, 3), (9, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0121
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0122 : Poly :=
[
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 122 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0122 : Poly :=
[
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 2), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-10861008665 : Rat) / 53531226) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((10861008665 : Rat) / 107062452) [(1, 3), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0122
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0123 : Poly :=
[
  term ((-1157783523689 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 123 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0123 : Poly :=
[
  term ((1157783523689 : Rat) / 4496622984) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((-1157783523689 : Rat) / 8993245968) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((1157783523689 : Rat) / 4496622984) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1157783523689 : Rat) / 8993245968) [(1, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0123
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0124 : Poly :=
[
  term ((831953263739 : Rat) / 5995497312) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 124 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0124 : Poly :=
[
  term ((-831953263739 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (12, 2), (14, 1)],
  term ((831953263739 : Rat) / 5995497312) [(0, 2), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-831953263739 : Rat) / 2997748656) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((831953263739 : Rat) / 5995497312) [(1, 3), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0124
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0125 : Poly :=
[
  term ((-84857060699645 : Rat) / 323756854848) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 125 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0125 : Poly :=
[
  term ((84857060699645 : Rat) / 161878427424) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-84857060699645 : Rat) / 323756854848) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((84857060699645 : Rat) / 161878427424) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-84857060699645 : Rat) / 323756854848) [(1, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0125
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0126 : Poly :=
[
  term ((-601699880041 : Rat) / 2997748656) [(1, 1), (9, 1), (14, 2)]
]

/-- Partial product 126 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0126 : Poly :=
[
  term ((601699880041 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-601699880041 : Rat) / 2997748656) [(0, 2), (1, 1), (9, 1), (14, 2)],
  term ((601699880041 : Rat) / 1498874328) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-601699880041 : Rat) / 2997748656) [(1, 3), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0126
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0127 : Poly :=
[
  term ((4706213285 : Rat) / 107062452) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 127 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0127 : Poly :=
[
  term ((-4706213285 : Rat) / 53531226) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 2), (10, 1), (12, 1), (13, 2)],
  term ((4706213285 : Rat) / 107062452) [(1, 3), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0127
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0128 : Poly :=
[
  term ((-5 : Rat) / 2) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 128 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0128 : Poly :=
[
  term (5 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term (5 : Rat) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 3), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0128
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0129 : Poly :=
[
  term ((96490250 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 129 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0129 : Poly :=
[
  term ((-192980500 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term ((96490250 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-192980500 : Rat) / 3823659) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((96490250 : Rat) / 3823659) [(1, 3), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0129
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0130 : Poly :=
[
  term (2 : Rat) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0130 : Poly :=
[
  term (-4 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0130
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0131 : Poly :=
[
  term ((4706213285 : Rat) / 214124904) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 131 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0131 : Poly :=
[
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((4706213285 : Rat) / 214124904) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-4706213285 : Rat) / 107062452) [(1, 2), (10, 1), (13, 2)],
  term ((4706213285 : Rat) / 214124904) [(1, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0131
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0132 : Poly :=
[
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 132 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0132 : Poly :=
[
  term ((4706213285 : Rat) / 26765613) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4706213285 : Rat) / 53531226) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 26765613) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 3), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0132
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0133 : Poly :=
[
  term (5 : Rat) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 133 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0133 : Poly :=
[
  term (-10 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (5 : Rat) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (5 : Rat) [(1, 3), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0133
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0134 : Poly :=
[
  term ((-5 : Rat) / 4) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 134 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0134 : Poly :=
[
  term ((5 : Rat) / 2) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 2) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(1, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0134
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0135 : Poly :=
[
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 135 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0135 : Poly :=
[
  term ((385961000 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-192980500 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((385961000 : Rat) / 3823659) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-192980500 : Rat) / 3823659) [(1, 3), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0135
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0136 : Poly :=
[
  term (-4 : Rat) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0136 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 3), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0136
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0137 : Poly :=
[
  term ((48245125 : Rat) / 3823659) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 137 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0137 : Poly :=
[
  term ((-96490250 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((48245125 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-96490250 : Rat) / 3823659) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((48245125 : Rat) / 3823659) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0137
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0138 : Poly :=
[
  term (1 : Rat) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0138 : Poly :=
[
  term (-2 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (1 : Rat) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0138
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0139 : Poly :=
[
  term ((2088182355335987 : Rat) / 3315510013536) [(1, 1), (11, 1)]
]

/-- Partial product 139 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0139 : Poly :=
[
  term ((-2088182355335987 : Rat) / 1657755006768) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((2088182355335987 : Rat) / 3315510013536) [(0, 2), (1, 1), (11, 1)],
  term ((-2088182355335987 : Rat) / 1657755006768) [(1, 2), (11, 1), (13, 1)],
  term ((2088182355335987 : Rat) / 3315510013536) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0139
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0140 : Poly :=
[
  term ((179712 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 140 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0140 : Poly :=
[
  term ((-359424 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1)],
  term ((179712 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-359424 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((179712 : Rat) / 553) [(1, 3), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0140
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0141 : Poly :=
[
  term ((-5843781994395763 : Rat) / 3729948765228) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 141 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0141 : Poly :=
[
  term ((5843781994395763 : Rat) / 1864974382614) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5843781994395763 : Rat) / 3729948765228) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((5843781994395763 : Rat) / 1864974382614) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-5843781994395763 : Rat) / 3729948765228) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0141
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0142 : Poly :=
[
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (14, 2)]
]

/-- Partial product 142 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0142 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(1, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0142
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0143 : Poly :=
[
  term ((4706213285 : Rat) / 55513864) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 143 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0143 : Poly :=
[
  term ((-4706213285 : Rat) / 27756932) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((4706213285 : Rat) / 55513864) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((-4706213285 : Rat) / 27756932) [(1, 2), (12, 1), (13, 2)],
  term ((4706213285 : Rat) / 55513864) [(1, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0143
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0144 : Poly :=
[
  term ((-360495937631 : Rat) / 2997748656) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 144 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0144 : Poly :=
[
  term ((360495937631 : Rat) / 1498874328) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-360495937631 : Rat) / 2997748656) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((360495937631 : Rat) / 1498874328) [(1, 2), (12, 1), (13, 2), (14, 1)],
  term ((-360495937631 : Rat) / 2997748656) [(1, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0144
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0145 : Poly :=
[
  term ((1135 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 145 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0145 : Poly :=
[
  term ((-1135 : Rat) / 28) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1135 : Rat) / 56) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1135 : Rat) / 28) [(1, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1135 : Rat) / 56) [(1, 3), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0145
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0146 : Poly :=
[
  term ((-135 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0146 : Poly :=
[
  term ((135 : Rat) / 14) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-135 : Rat) / 28) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((135 : Rat) / 14) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-135 : Rat) / 28) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0146
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0147 : Poly :=
[
  term ((4854827766745 : Rat) / 59205535956) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 147 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0147 : Poly :=
[
  term ((-4854827766745 : Rat) / 29602767978) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1)],
  term ((4854827766745 : Rat) / 59205535956) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4854827766745 : Rat) / 29602767978) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4854827766745 : Rat) / 59205535956) [(1, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0147
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0148 : Poly :=
[
  term ((-239 : Rat) / 14) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0148 : Poly :=
[
  term ((239 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-239 : Rat) / 14) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-239 : Rat) / 14) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0148
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0149 : Poly :=
[
  term ((-14876033252587 : Rat) / 88808303934) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 149 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0149 : Poly :=
[
  term ((14876033252587 : Rat) / 44404151967) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-14876033252587 : Rat) / 88808303934) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((14876033252587 : Rat) / 44404151967) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-14876033252587 : Rat) / 88808303934) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0149
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0150 : Poly :=
[
  term ((27 : Rat) / 7) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0150 : Poly :=
[
  term ((-54 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((27 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 7) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0150
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0151 : Poly :=
[
  term ((-5211493534092163 : Rat) / 9946530040608) [(1, 1), (13, 1)]
]

/-- Partial product 151 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0151 : Poly :=
[
  term ((5211493534092163 : Rat) / 4973265020304) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-5211493534092163 : Rat) / 9946530040608) [(0, 2), (1, 1), (13, 1)],
  term ((5211493534092163 : Rat) / 4973265020304) [(1, 2), (13, 2)],
  term ((-5211493534092163 : Rat) / 9946530040608) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0151
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0152 : Poly :=
[
  term ((217264641898518551 : Rat) / 626631392558304) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 152 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0152 : Poly :=
[
  term ((-217264641898518551 : Rat) / 313315696279152) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((217264641898518551 : Rat) / 626631392558304) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-217264641898518551 : Rat) / 313315696279152) [(1, 2), (13, 2), (14, 1)],
  term ((217264641898518551 : Rat) / 626631392558304) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0152
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0153 : Poly :=
[
  term ((-11555 : Rat) / 1008) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 153 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0153 : Poly :=
[
  term ((11555 : Rat) / 504) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11555 : Rat) / 1008) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((11555 : Rat) / 504) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-11555 : Rat) / 1008) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0153
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0154 : Poly :=
[
  term ((7415538672713 : Rat) / 39470357304) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 154 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0154 : Poly :=
[
  term ((-7415538672713 : Rat) / 19735178652) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((7415538672713 : Rat) / 39470357304) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((-7415538672713 : Rat) / 19735178652) [(1, 2), (13, 2), (14, 2)],
  term ((7415538672713 : Rat) / 39470357304) [(1, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0154
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0155 : Poly :=
[
  term ((-485 : Rat) / 28) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 155 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0155 : Poly :=
[
  term ((485 : Rat) / 14) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-485 : Rat) / 28) [(0, 2), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((485 : Rat) / 14) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((-485 : Rat) / 28) [(1, 3), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0155
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0156 : Poly :=
[
  term ((255 : Rat) / 56) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 156 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0156 : Poly :=
[
  term ((-255 : Rat) / 28) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((255 : Rat) / 56) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-255 : Rat) / 28) [(1, 2), (13, 2), (16, 1)],
  term ((255 : Rat) / 56) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0156
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0157 : Poly :=
[
  term ((201549127606977439 : Rat) / 104438565426384) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 157 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0157 : Poly :=
[
  term ((-201549127606977439 : Rat) / 52219282713192) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((201549127606977439 : Rat) / 104438565426384) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-201549127606977439 : Rat) / 52219282713192) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((201549127606977439 : Rat) / 104438565426384) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0157
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0158 : Poly :=
[
  term ((341 : Rat) / 36) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0158 : Poly :=
[
  term ((-341 : Rat) / 18) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((341 : Rat) / 36) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-341 : Rat) / 18) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((341 : Rat) / 36) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0158
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0159 : Poly :=
[
  term ((-179069327797984 : Rat) / 725267815461) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 159 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0159 : Poly :=
[
  term ((358138655595968 : Rat) / 725267815461) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-179069327797984 : Rat) / 725267815461) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((358138655595968 : Rat) / 725267815461) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-179069327797984 : Rat) / 725267815461) [(1, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0159
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0160 : Poly :=
[
  term ((101 : Rat) / 7) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0160 : Poly :=
[
  term ((-202 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((101 : Rat) / 7) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-202 : Rat) / 7) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((101 : Rat) / 7) [(1, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0160
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0161 : Poly :=
[
  term ((-13494853776492943 : Rat) / 34812855142128) [(1, 1), (15, 1)]
]

/-- Partial product 161 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0161 : Poly :=
[
  term ((13494853776492943 : Rat) / 17406427571064) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-13494853776492943 : Rat) / 34812855142128) [(0, 2), (1, 1), (15, 1)],
  term ((13494853776492943 : Rat) / 17406427571064) [(1, 2), (13, 1), (15, 1)],
  term ((-13494853776492943 : Rat) / 34812855142128) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0161
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0162 : Poly :=
[
  term ((-55 : Rat) / 14) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0162 : Poly :=
[
  term ((55 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 7) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0162
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0163 : Poly :=
[
  term ((-2496 : Rat) / 553) [(1, 2)]
]

/-- Partial product 163 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0163 : Poly :=
[
  term ((4992 : Rat) / 553) [(0, 1), (1, 2), (12, 1)],
  term ((-2496 : Rat) / 553) [(0, 2), (1, 2)],
  term ((4992 : Rat) / 553) [(1, 3), (13, 1)],
  term ((-2496 : Rat) / 553) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0163
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0164 : Poly :=
[
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 2), (6, 1)]
]

/-- Partial product 164 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0164 : Poly :=
[
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (12, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(0, 2), (1, 2), (6, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 3), (6, 1), (13, 1)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 4), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0164
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0165 : Poly :=
[
  term ((-4992 : Rat) / 553) [(1, 2), (12, 1)]
]

/-- Partial product 165 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0165 : Poly :=
[
  term ((9984 : Rat) / 553) [(0, 1), (1, 2), (12, 2)],
  term ((-4992 : Rat) / 553) [(0, 2), (1, 2), (12, 1)],
  term ((9984 : Rat) / 553) [(1, 3), (12, 1), (13, 1)],
  term ((-4992 : Rat) / 553) [(1, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0165
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0166 : Poly :=
[
  term ((281559681116099 : Rat) / 13054820678298) [(1, 2), (14, 1)]
]

/-- Partial product 166 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0166 : Poly :=
[
  term ((-281559681116099 : Rat) / 6527410339149) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((281559681116099 : Rat) / 13054820678298) [(0, 2), (1, 2), (14, 1)],
  term ((-281559681116099 : Rat) / 6527410339149) [(1, 3), (13, 1), (14, 1)],
  term ((281559681116099 : Rat) / 13054820678298) [(1, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0166
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0167 : Poly :=
[
  term ((19223636304660689 : Rat) / 52219282713192) [(2, 1)]
]

/-- Partial product 167 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0167 : Poly :=
[
  term ((-19223636304660689 : Rat) / 26109641356596) [(0, 1), (2, 1), (12, 1)],
  term ((19223636304660689 : Rat) / 52219282713192) [(0, 2), (2, 1)],
  term ((-19223636304660689 : Rat) / 26109641356596) [(1, 1), (2, 1), (13, 1)],
  term ((19223636304660689 : Rat) / 52219282713192) [(1, 2), (2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0167
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0168 : Poly :=
[
  term ((2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1)]
]

/-- Partial product 168 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0168 : Poly :=
[
  term ((-2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (12, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0168
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0169 : Poly :=
[
  term ((-2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 1)]
]

/-- Partial product 169 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0169 : Poly :=
[
  term ((2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1), (14, 1)],
  term ((2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0169
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0170 : Poly :=
[
  term ((-13170102002364901 : Rat) / 17406427571064) [(2, 1), (14, 1)]
]

/-- Partial product 170 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0170 : Poly :=
[
  term ((13170102002364901 : Rat) / 8703213785532) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((-13170102002364901 : Rat) / 17406427571064) [(0, 2), (2, 1), (14, 1)],
  term ((13170102002364901 : Rat) / 8703213785532) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-13170102002364901 : Rat) / 17406427571064) [(1, 2), (2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0170
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0171 : Poly :=
[
  term ((10143334851217007 : Rat) / 26109641356596) [(2, 1), (14, 2)]
]

/-- Partial product 171 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0171 : Poly :=
[
  term ((-10143334851217007 : Rat) / 13054820678298) [(0, 1), (2, 1), (12, 1), (14, 2)],
  term ((10143334851217007 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 2)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((10143334851217007 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0171
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0172 : Poly :=
[
  term ((-640 : Rat) / 21) [(3, 1), (5, 1)]
]

/-- Partial product 172 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0172 : Poly :=
[
  term ((1280 : Rat) / 21) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((-640 : Rat) / 21) [(0, 2), (3, 1), (5, 1)],
  term ((1280 : Rat) / 21) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-640 : Rat) / 21) [(1, 2), (3, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0172
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0173 : Poly :=
[
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 173 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0173 : Poly :=
[
  term ((-640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((320 : Rat) / 7) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((320 : Rat) / 7) [(1, 2), (3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0173
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0174 : Poly :=
[
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 174 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0174 : Poly :=
[
  term ((-194560 : Rat) / 343) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(0, 2), (3, 1), (5, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(1, 2), (3, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0174
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0175 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 175 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0175 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0175
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0176 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 176 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0176 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0176
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0177 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 177 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0177 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0177
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0178 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 178 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0178 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0178
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0179 : Poly :=
[
  term ((93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 179 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0179 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0179
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0180 : Poly :=
[
  term ((-5333862422735093 : Rat) / 11189846295684) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 180 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0180 : Poly :=
[
  term ((5333862422735093 : Rat) / 5594923147842) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-5333862422735093 : Rat) / 11189846295684) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((5333862422735093 : Rat) / 5594923147842) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-5333862422735093 : Rat) / 11189846295684) [(1, 2), (3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0180
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0181 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 181 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0181 : Poly :=
[
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0181
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0182 : Poly :=
[
  term ((191524972851125 : Rat) / 322341251316) [(3, 1), (7, 1)]
]

/-- Partial product 182 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0182 : Poly :=
[
  term ((-191524972851125 : Rat) / 161170625658) [(0, 1), (3, 1), (7, 1), (12, 1)],
  term ((191524972851125 : Rat) / 322341251316) [(0, 2), (3, 1), (7, 1)],
  term ((-191524972851125 : Rat) / 161170625658) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((191524972851125 : Rat) / 322341251316) [(1, 2), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0182
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0183 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 183 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0183 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 2), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0183
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0184 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 184 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0184 : Poly :=
[
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 2), (15, 2)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0184
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0185 : Poly :=
[
  term ((2732697516060325 : Rat) / 156657848139576) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 185 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0185 : Poly :=
[
  term ((-2732697516060325 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((2732697516060325 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-2732697516060325 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((2732697516060325 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0185
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0186 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 186 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0186 : Poly :=
[
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0186
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0187 : Poly :=
[
  term ((-93440 : Rat) / 3087) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 187 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0187 : Poly :=
[
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0187
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0188 : Poly :=
[
  term ((320 : Rat) / 21) [(3, 1), (9, 1)]
]

/-- Partial product 188 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0188 : Poly :=
[
  term ((-640 : Rat) / 21) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((320 : Rat) / 21) [(0, 2), (3, 1), (9, 1)],
  term ((-640 : Rat) / 21) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((320 : Rat) / 21) [(1, 2), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0188
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0189 : Poly :=
[
  term ((-160 : Rat) / 7) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 189 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0189 : Poly :=
[
  term ((320 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((320 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0189
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0190 : Poly :=
[
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 190 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0190 : Poly :=
[
  term ((97280 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0190
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0191 : Poly :=
[
  term ((-160 : Rat) / 21) [(3, 1), (11, 1)]
]

/-- Partial product 191 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0191 : Poly :=
[
  term ((320 : Rat) / 21) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-160 : Rat) / 21) [(0, 2), (3, 1), (11, 1)],
  term ((320 : Rat) / 21) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-160 : Rat) / 21) [(1, 2), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0191
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0192 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 192 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0192 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0192
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0193 : Poly :=
[
  term ((-320 : Rat) / 21) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 193 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0193 : Poly :=
[
  term ((640 : Rat) / 21) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-320 : Rat) / 21) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((640 : Rat) / 21) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-320 : Rat) / 21) [(1, 2), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0193
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0194 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 194 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0194 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 2), (15, 3)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (12, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0194
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0195 : Poly :=
[
  term ((-320 : Rat) / 21) [(3, 1), (13, 1)]
]

/-- Partial product 195 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0195 : Poly :=
[
  term ((640 : Rat) / 21) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-320 : Rat) / 21) [(0, 2), (3, 1), (13, 1)],
  term ((640 : Rat) / 21) [(1, 1), (3, 1), (13, 2)],
  term ((-320 : Rat) / 21) [(1, 2), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0195
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0196 : Poly :=
[
  term ((-32751163035133565 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 196 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0196 : Poly :=
[
  term ((32751163035133565 : Rat) / 39164462034894) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-32751163035133565 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((32751163035133565 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-32751163035133565 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0196
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0197 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 197 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0197 : Poly :=
[
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0197
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0198 : Poly :=
[
  term ((9082371646885487 : Rat) / 26109641356596) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 198 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0198 : Poly :=
[
  term ((-9082371646885487 : Rat) / 13054820678298) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((9082371646885487 : Rat) / 26109641356596) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-9082371646885487 : Rat) / 13054820678298) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((9082371646885487 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0198
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YNNNN_coefficient_25_0199 : Poly :=
[
  term ((-93440 : Rat) / 3087) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 199 for generator 25. -/
def rs_R009_ueqv_R009YNNNN_partial_25_0199 : Poly :=
[
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 25. -/
theorem rs_R009_ueqv_R009YNNNN_partial_25_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_25_0199
        rs_R009_ueqv_R009YNNNN_generator_25_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_25_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_25_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_25_0100,
  rs_R009_ueqv_R009YNNNN_partial_25_0101,
  rs_R009_ueqv_R009YNNNN_partial_25_0102,
  rs_R009_ueqv_R009YNNNN_partial_25_0103,
  rs_R009_ueqv_R009YNNNN_partial_25_0104,
  rs_R009_ueqv_R009YNNNN_partial_25_0105,
  rs_R009_ueqv_R009YNNNN_partial_25_0106,
  rs_R009_ueqv_R009YNNNN_partial_25_0107,
  rs_R009_ueqv_R009YNNNN_partial_25_0108,
  rs_R009_ueqv_R009YNNNN_partial_25_0109,
  rs_R009_ueqv_R009YNNNN_partial_25_0110,
  rs_R009_ueqv_R009YNNNN_partial_25_0111,
  rs_R009_ueqv_R009YNNNN_partial_25_0112,
  rs_R009_ueqv_R009YNNNN_partial_25_0113,
  rs_R009_ueqv_R009YNNNN_partial_25_0114,
  rs_R009_ueqv_R009YNNNN_partial_25_0115,
  rs_R009_ueqv_R009YNNNN_partial_25_0116,
  rs_R009_ueqv_R009YNNNN_partial_25_0117,
  rs_R009_ueqv_R009YNNNN_partial_25_0118,
  rs_R009_ueqv_R009YNNNN_partial_25_0119,
  rs_R009_ueqv_R009YNNNN_partial_25_0120,
  rs_R009_ueqv_R009YNNNN_partial_25_0121,
  rs_R009_ueqv_R009YNNNN_partial_25_0122,
  rs_R009_ueqv_R009YNNNN_partial_25_0123,
  rs_R009_ueqv_R009YNNNN_partial_25_0124,
  rs_R009_ueqv_R009YNNNN_partial_25_0125,
  rs_R009_ueqv_R009YNNNN_partial_25_0126,
  rs_R009_ueqv_R009YNNNN_partial_25_0127,
  rs_R009_ueqv_R009YNNNN_partial_25_0128,
  rs_R009_ueqv_R009YNNNN_partial_25_0129,
  rs_R009_ueqv_R009YNNNN_partial_25_0130,
  rs_R009_ueqv_R009YNNNN_partial_25_0131,
  rs_R009_ueqv_R009YNNNN_partial_25_0132,
  rs_R009_ueqv_R009YNNNN_partial_25_0133,
  rs_R009_ueqv_R009YNNNN_partial_25_0134,
  rs_R009_ueqv_R009YNNNN_partial_25_0135,
  rs_R009_ueqv_R009YNNNN_partial_25_0136,
  rs_R009_ueqv_R009YNNNN_partial_25_0137,
  rs_R009_ueqv_R009YNNNN_partial_25_0138,
  rs_R009_ueqv_R009YNNNN_partial_25_0139,
  rs_R009_ueqv_R009YNNNN_partial_25_0140,
  rs_R009_ueqv_R009YNNNN_partial_25_0141,
  rs_R009_ueqv_R009YNNNN_partial_25_0142,
  rs_R009_ueqv_R009YNNNN_partial_25_0143,
  rs_R009_ueqv_R009YNNNN_partial_25_0144,
  rs_R009_ueqv_R009YNNNN_partial_25_0145,
  rs_R009_ueqv_R009YNNNN_partial_25_0146,
  rs_R009_ueqv_R009YNNNN_partial_25_0147,
  rs_R009_ueqv_R009YNNNN_partial_25_0148,
  rs_R009_ueqv_R009YNNNN_partial_25_0149,
  rs_R009_ueqv_R009YNNNN_partial_25_0150,
  rs_R009_ueqv_R009YNNNN_partial_25_0151,
  rs_R009_ueqv_R009YNNNN_partial_25_0152,
  rs_R009_ueqv_R009YNNNN_partial_25_0153,
  rs_R009_ueqv_R009YNNNN_partial_25_0154,
  rs_R009_ueqv_R009YNNNN_partial_25_0155,
  rs_R009_ueqv_R009YNNNN_partial_25_0156,
  rs_R009_ueqv_R009YNNNN_partial_25_0157,
  rs_R009_ueqv_R009YNNNN_partial_25_0158,
  rs_R009_ueqv_R009YNNNN_partial_25_0159,
  rs_R009_ueqv_R009YNNNN_partial_25_0160,
  rs_R009_ueqv_R009YNNNN_partial_25_0161,
  rs_R009_ueqv_R009YNNNN_partial_25_0162,
  rs_R009_ueqv_R009YNNNN_partial_25_0163,
  rs_R009_ueqv_R009YNNNN_partial_25_0164,
  rs_R009_ueqv_R009YNNNN_partial_25_0165,
  rs_R009_ueqv_R009YNNNN_partial_25_0166,
  rs_R009_ueqv_R009YNNNN_partial_25_0167,
  rs_R009_ueqv_R009YNNNN_partial_25_0168,
  rs_R009_ueqv_R009YNNNN_partial_25_0169,
  rs_R009_ueqv_R009YNNNN_partial_25_0170,
  rs_R009_ueqv_R009YNNNN_partial_25_0171,
  rs_R009_ueqv_R009YNNNN_partial_25_0172,
  rs_R009_ueqv_R009YNNNN_partial_25_0173,
  rs_R009_ueqv_R009YNNNN_partial_25_0174,
  rs_R009_ueqv_R009YNNNN_partial_25_0175,
  rs_R009_ueqv_R009YNNNN_partial_25_0176,
  rs_R009_ueqv_R009YNNNN_partial_25_0177,
  rs_R009_ueqv_R009YNNNN_partial_25_0178,
  rs_R009_ueqv_R009YNNNN_partial_25_0179,
  rs_R009_ueqv_R009YNNNN_partial_25_0180,
  rs_R009_ueqv_R009YNNNN_partial_25_0181,
  rs_R009_ueqv_R009YNNNN_partial_25_0182,
  rs_R009_ueqv_R009YNNNN_partial_25_0183,
  rs_R009_ueqv_R009YNNNN_partial_25_0184,
  rs_R009_ueqv_R009YNNNN_partial_25_0185,
  rs_R009_ueqv_R009YNNNN_partial_25_0186,
  rs_R009_ueqv_R009YNNNN_partial_25_0187,
  rs_R009_ueqv_R009YNNNN_partial_25_0188,
  rs_R009_ueqv_R009YNNNN_partial_25_0189,
  rs_R009_ueqv_R009YNNNN_partial_25_0190,
  rs_R009_ueqv_R009YNNNN_partial_25_0191,
  rs_R009_ueqv_R009YNNNN_partial_25_0192,
  rs_R009_ueqv_R009YNNNN_partial_25_0193,
  rs_R009_ueqv_R009YNNNN_partial_25_0194,
  rs_R009_ueqv_R009YNNNN_partial_25_0195,
  rs_R009_ueqv_R009YNNNN_partial_25_0196,
  rs_R009_ueqv_R009YNNNN_partial_25_0197,
  rs_R009_ueqv_R009YNNNN_partial_25_0198,
  rs_R009_ueqv_R009YNNNN_partial_25_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_25_0100_0199 : Poly :=
[
  term ((1505101399578125 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((640 : Rat) / 21) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-2101893202014605 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-4429612052419699 : Rat) / 1864974382614) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((18055526872671782 : Rat) / 19582231017447) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((4565229160600973 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term ((522480125937869 : Rat) / 725267815461) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((-4361787269395481 : Rat) / 1450535630922) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 2)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 2), (14, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-584322266177 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((84857060699645 : Rat) / 161878427424) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((601699880041 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((1157783523689 : Rat) / 4496622984) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((-831953263739 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (12, 2), (14, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((4706213285 : Rat) / 26765613) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term (-10 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((385961000 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96490250 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 53531226) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1)],
  term (5 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term (-4 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2088182355335987 : Rat) / 1657755006768) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((5843781994395763 : Rat) / 1864974382614) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-359424 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1)],
  term ((5211493534092163 : Rat) / 4973265020304) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-217264641898518551 : Rat) / 313315696279152) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((11555 : Rat) / 504) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7415538672713 : Rat) / 19735178652) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((485 : Rat) / 14) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-255 : Rat) / 28) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-201549127606977439 : Rat) / 52219282713192) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-341 : Rat) / 18) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((358138655595968 : Rat) / 725267815461) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-202 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((13494853776492943 : Rat) / 17406427571064) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((55 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 27756932) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((360495937631 : Rat) / 1498874328) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1135 : Rat) / 28) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((135 : Rat) / 14) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4854827766745 : Rat) / 29602767978) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1)],
  term ((239 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((14876033252587 : Rat) / 44404151967) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-54 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (12, 1)],
  term ((4992 : Rat) / 553) [(0, 1), (1, 2), (12, 1)],
  term ((-281559681116099 : Rat) / 6527410339149) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((9984 : Rat) / 553) [(0, 1), (1, 2), (12, 2)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (12, 1)],
  term ((2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-19223636304660689 : Rat) / 26109641356596) [(0, 1), (2, 1), (12, 1)],
  term ((13170102002364901 : Rat) / 8703213785532) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(0, 1), (2, 1), (12, 1), (14, 2)],
  term ((1280 : Rat) / 21) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((-640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((5333862422735093 : Rat) / 5594923147842) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-191524972851125 : Rat) / 161170625658) [(0, 1), (3, 1), (7, 1), (12, 1)],
  term ((-2732697516060325 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 2), (14, 1)],
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 2), (15, 2)],
  term ((-640 : Rat) / 21) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((320 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((320 : Rat) / 21) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((640 : Rat) / 21) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((32751163035133565 : Rat) / 39164462034894) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9082371646885487 : Rat) / 13054820678298) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((640 : Rat) / 21) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 2), (15, 3)],
  term ((-320 : Rat) / 21) [(0, 2), (1, 1), (3, 1)],
  term ((-1505101399578125 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((2101893202014605 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((4429612052419699 : Rat) / 3729948765228) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-9027763436335891 : Rat) / 19582231017447) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-4565229160600973 : Rat) / 4351606892766) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-522480125937869 : Rat) / 1450535630922) [(0, 2), (1, 1), (7, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((4361787269395481 : Rat) / 2901071261844) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (1, 1), (7, 1), (14, 2)],
  term ((584322266177 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1)],
  term ((-10861008665 : Rat) / 428249808) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-10861008665 : Rat) / 214124904) [(0, 2), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 2), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1157783523689 : Rat) / 8993245968) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((831953263739 : Rat) / 5995497312) [(0, 2), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-84857060699645 : Rat) / 323756854848) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((-601699880041 : Rat) / 2997748656) [(0, 2), (1, 1), (9, 1), (14, 2)],
  term ((4706213285 : Rat) / 107062452) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((96490250 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 214124904) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-4706213285 : Rat) / 53531226) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1)],
  term (5 : Rat) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-192980500 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((48245125 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term (1 : Rat) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((2088182355335987 : Rat) / 3315510013536) [(0, 2), (1, 1), (11, 1)],
  term ((179712 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5843781994395763 : Rat) / 3729948765228) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((4706213285 : Rat) / 55513864) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((-360495937631 : Rat) / 2997748656) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((1135 : Rat) / 56) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 28) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((4854827766745 : Rat) / 59205535956) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-239 : Rat) / 14) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14876033252587 : Rat) / 88808303934) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((27 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5211493534092163 : Rat) / 9946530040608) [(0, 2), (1, 1), (13, 1)],
  term ((217264641898518551 : Rat) / 626631392558304) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-11555 : Rat) / 1008) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((7415538672713 : Rat) / 39470357304) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((-485 : Rat) / 28) [(0, 2), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((100872416720 : Rat) / 187359291) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((255 : Rat) / 56) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 2), (1, 1), (13, 3), (16, 1)],
  term ((201549127606977439 : Rat) / 104438565426384) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((341 : Rat) / 36) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-179069327797984 : Rat) / 725267815461) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((101 : Rat) / 7) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13494853776492943 : Rat) / 34812855142128) [(0, 2), (1, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 553) [(0, 2), (1, 2)],
  term ((-45864690786755 : Rat) / 13054820678298) [(0, 2), (1, 2), (6, 1)],
  term ((-4992 : Rat) / 553) [(0, 2), (1, 2), (12, 1)],
  term ((5 : Rat) / 7) [(0, 2), (1, 2), (13, 2), (16, 1)],
  term ((281559681116099 : Rat) / 13054820678298) [(0, 2), (1, 2), (14, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 2), (1, 2), (15, 2)],
  term ((8 : Rat) / 7) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((19223636304660689 : Rat) / 52219282713192) [(0, 2), (2, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1), (14, 1)],
  term ((-13170102002364901 : Rat) / 17406427571064) [(0, 2), (2, 1), (14, 1)],
  term ((10143334851217007 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 2)],
  term ((-640 : Rat) / 21) [(0, 2), (3, 1), (5, 1)],
  term ((320 : Rat) / 7) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(0, 2), (3, 1), (5, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5333862422735093 : Rat) / 11189846295684) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (15, 3)],
  term ((191524972851125 : Rat) / 322341251316) [(0, 2), (3, 1), (7, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((2732697516060325 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (15, 2)],
  term ((320 : Rat) / 21) [(0, 2), (3, 1), (9, 1)],
  term ((-160 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((-160 : Rat) / 21) [(0, 2), (3, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-320 : Rat) / 21) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (12, 1), (15, 3)],
  term ((-320 : Rat) / 21) [(0, 2), (3, 1), (13, 1)],
  term ((-32751163035133565 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((9082371646885487 : Rat) / 26109641356596) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((-10 : Rat) / 7) [(0, 3), (12, 1), (13, 2), (16, 1)],
  term ((100872416720 : Rat) / 187359291) [(0, 3), (12, 1), (15, 2)],
  term ((-16 : Rat) / 7) [(0, 3), (12, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 7) [(0, 4), (13, 2), (16, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 4), (15, 2)],
  term ((8 : Rat) / 7) [(0, 4), (15, 2), (16, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-19223636304660689 : Rat) / 26109641356596) [(1, 1), (2, 1), (13, 1)],
  term ((13170102002364901 : Rat) / 8703213785532) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((1280 : Rat) / 21) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((5333862422735093 : Rat) / 5594923147842) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-191524972851125 : Rat) / 161170625658) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-2732697516060325 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((320 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((320 : Rat) / 21) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((640 : Rat) / 21) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)],
  term ((-9082371646885487 : Rat) / 13054820678298) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((640 : Rat) / 21) [(1, 1), (3, 1), (13, 2)],
  term ((32751163035133565 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (14, 1), (15, 2)],
  term ((19223636304660689 : Rat) / 52219282713192) [(1, 2), (2, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-13170102002364901 : Rat) / 17406427571064) [(1, 2), (2, 1), (14, 1)],
  term ((10143334851217007 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)],
  term ((-640 : Rat) / 21) [(1, 2), (3, 1), (5, 1)],
  term ((320 : Rat) / 7) [(1, 2), (3, 1), (5, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((39965152238319025 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-5333862422735093 : Rat) / 11189846295684) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (15, 3)],
  term ((191524972851125 : Rat) / 322341251316) [(1, 2), (3, 1), (7, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((2732697516060325 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((320 : Rat) / 21) [(1, 2), (3, 1), (9, 1)],
  term ((-160 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((-160 : Rat) / 21) [(1, 2), (3, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-320 : Rat) / 21) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (12, 1), (15, 3)],
  term ((320 : Rat) / 21) [(1, 2), (3, 1), (13, 1)],
  term ((-41158735843191985 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((9082371646885487 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((16385344477359446 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-4429612052419699 : Rat) / 1864974382614) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((4565229160600973 : Rat) / 2175803446383) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((18055526872671782 : Rat) / 19582231017447) [(1, 2), (6, 1), (13, 2)],
  term ((170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((522480125937869 : Rat) / 725267815461) [(1, 2), (7, 1), (13, 1)],
  term ((-4361787269395481 : Rat) / 1450535630922) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((10861008665 : Rat) / 107062452) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((10861008665 : Rat) / 214124904) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10861008665 : Rat) / 53531226) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1157783523689 : Rat) / 4496622984) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-831953263739 : Rat) / 2997748656) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-584322266177 : Rat) / 8993245968) [(1, 2), (9, 1), (13, 1)],
  term ((84857060699645 : Rat) / 161878427424) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((601699880041 : Rat) / 1498874328) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-192980500 : Rat) / 3823659) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 2), (10, 1), (12, 1), (13, 2)],
  term (5 : Rat) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((385961000 : Rat) / 3823659) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (8 : Rat) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96490250 : Rat) / 3823659) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term (-2 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 107062452) [(1, 2), (10, 1), (13, 2)],
  term ((4706213285 : Rat) / 26765613) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term (-10 : Rat) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-359424 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2088182355335987 : Rat) / 1657755006768) [(1, 2), (11, 1), (13, 1)],
  term ((5843781994395763 : Rat) / 1864974382614) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-4854827766745 : Rat) / 29602767978) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((239 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14876033252587 : Rat) / 44404151967) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-54 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 27756932) [(1, 2), (12, 1), (13, 2)],
  term ((360495937631 : Rat) / 1498874328) [(1, 2), (12, 1), (13, 2), (14, 1)],
  term ((-1135 : Rat) / 28) [(1, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((135 : Rat) / 14) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-201549127606977439 : Rat) / 52219282713192) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-341 : Rat) / 18) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((358138655595968 : Rat) / 725267815461) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-202 : Rat) / 7) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13494853776492943 : Rat) / 17406427571064) [(1, 2), (13, 1), (15, 1)],
  term ((55 : Rat) / 7) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((5211493534092163 : Rat) / 4973265020304) [(1, 2), (13, 2)],
  term ((-217264641898518551 : Rat) / 313315696279152) [(1, 2), (13, 2), (14, 1)],
  term ((11555 : Rat) / 504) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-7415538672713 : Rat) / 19735178652) [(1, 2), (13, 2), (14, 2)],
  term ((485 : Rat) / 14) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((-255 : Rat) / 28) [(1, 2), (13, 2), (16, 1)],
  term ((-320 : Rat) / 21) [(1, 3), (3, 1)],
  term ((-1505101399578125 : Rat) / 39164462034894) [(1, 3), (3, 1), (6, 1)],
  term ((2101893202014605 : Rat) / 39164462034894) [(1, 3), (3, 1), (14, 1)],
  term ((-8192672238679723 : Rat) / 6527410339149) [(1, 3), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(1, 3), (6, 1), (9, 1)],
  term ((4429612052419699 : Rat) / 3729948765228) [(1, 3), (6, 1), (11, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 3), (6, 1), (12, 1), (15, 1)],
  term ((-8890169363975626 : Rat) / 19582231017447) [(1, 3), (6, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 3), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 3), (6, 1), (14, 1), (15, 1)],
  term ((-4565229160600973 : Rat) / 4351606892766) [(1, 3), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((-522480125937869 : Rat) / 1450535630922) [(1, 3), (7, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 3), (7, 1), (12, 1), (14, 1)],
  term ((4361787269395481 : Rat) / 2901071261844) [(1, 3), (7, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 3), (7, 1), (14, 2)],
  term ((584322266177 : Rat) / 17986491936) [(1, 3), (9, 1)],
  term ((-10861008665 : Rat) / 428249808) [(1, 3), (9, 1), (10, 1)],
  term ((-10861008665 : Rat) / 214124904) [(1, 3), (9, 1), (10, 1), (12, 1)],
  term ((10861008665 : Rat) / 107062452) [(1, 3), (9, 1), (10, 1), (14, 1)],
  term ((-1157783523689 : Rat) / 8993245968) [(1, 3), (9, 1), (12, 1)],
  term ((831953263739 : Rat) / 5995497312) [(1, 3), (9, 1), (12, 1), (14, 1)],
  term ((-84857060699645 : Rat) / 323756854848) [(1, 3), (9, 1), (14, 1)],
  term ((-601699880041 : Rat) / 2997748656) [(1, 3), (9, 1), (14, 2)],
  term ((4706213285 : Rat) / 107062452) [(1, 3), (10, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(1, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((96490250 : Rat) / 3823659) [(1, 3), (10, 1), (12, 1), (15, 1)],
  term (2 : Rat) [(1, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 214124904) [(1, 3), (10, 1), (13, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 3), (10, 1), (13, 1), (14, 1)],
  term (5 : Rat) [(1, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(1, 3), (10, 1), (13, 1), (16, 1)],
  term ((-192980500 : Rat) / 3823659) [(1, 3), (10, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(1, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((48245125 : Rat) / 3823659) [(1, 3), (10, 1), (15, 1)],
  term (1 : Rat) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((2088182355335987 : Rat) / 3315510013536) [(1, 3), (11, 1)],
  term ((179712 : Rat) / 553) [(1, 3), (11, 1), (12, 1), (14, 1)],
  term ((-5843781994395763 : Rat) / 3729948765228) [(1, 3), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 3), (11, 1), (14, 2)],
  term ((450969480683 : Rat) / 4385595256) [(1, 3), (12, 1), (13, 1)],
  term ((-360495937631 : Rat) / 2997748656) [(1, 3), (12, 1), (13, 1), (14, 1)],
  term ((1135 : Rat) / 56) [(1, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 28) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((4854827766745 : Rat) / 59205535956) [(1, 3), (12, 1), (14, 1), (15, 1)],
  term ((-239 : Rat) / 14) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14876033252587 : Rat) / 88808303934) [(1, 3), (12, 1), (15, 1)],
  term ((27 : Rat) / 7) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5121704966347651 : Rat) / 9946530040608) [(1, 3), (13, 1)],
  term ((190234912511373047 : Rat) / 626631392558304) [(1, 3), (13, 1), (14, 1)],
  term ((-11555 : Rat) / 1008) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((7415538672713 : Rat) / 39470357304) [(1, 3), (13, 1), (14, 2)],
  term ((-485 : Rat) / 28) [(1, 3), (13, 1), (14, 2), (16, 1)],
  term ((255 : Rat) / 56) [(1, 3), (13, 1), (16, 1)],
  term ((201549127606977439 : Rat) / 104438565426384) [(1, 3), (14, 1), (15, 1)],
  term ((341 : Rat) / 36) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((-179069327797984 : Rat) / 725267815461) [(1, 3), (14, 2), (15, 1)],
  term ((101 : Rat) / 7) [(1, 3), (14, 2), (15, 1), (16, 1)],
  term ((-13494853776492943 : Rat) / 34812855142128) [(1, 3), (15, 1)],
  term ((-55 : Rat) / 14) [(1, 3), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 553) [(1, 4)],
  term ((-45864690786755 : Rat) / 13054820678298) [(1, 4), (6, 1)],
  term ((-4992 : Rat) / 553) [(1, 4), (12, 1)],
  term ((281559681116099 : Rat) / 13054820678298) [(1, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_25_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_25_0100_0199
      rs_R009_ueqv_R009YNNNN_block_25_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
