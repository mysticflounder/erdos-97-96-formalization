/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 22:100-178

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_22_0100_0178 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0100 : Poly :=
[
  term ((21076676000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 100 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0100 : Poly :=
[
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((21076676000 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0100
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0101 : Poly :=
[
  term ((-4750253720678852 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 101 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0101 : Poly :=
[
  term ((9500507441357704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4750253720678852 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((9500507441357704 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-4750253720678852 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0101
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0102 : Poly :=
[
  term ((-73350826800 : Rat) / 150171761) [(4, 1), (11, 2)]
]

/-- Partial product 102 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0102 : Poly :=
[
  term ((146701653600 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2)],
  term ((-73350826800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 3)],
  term ((-73350826800 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0102
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0103 : Poly :=
[
  term ((1015267150525082450 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 103 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0103 : Poly :=
[
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0103
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0104 : Poly :=
[
  term ((640593775903045555 : Rat) / 2576367455419018) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 104 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0104 : Poly :=
[
  term ((-640593775903045555 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((640593775903045555 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 2), (15, 2)],
  term ((-640593775903045555 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (15, 2)],
  term ((640593775903045555 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0104
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0105 : Poly :=
[
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)]
]

/-- Partial product 105 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0105 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 3), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 4), (15, 1)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0105
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0106 : Poly :=
[
  term ((1848197080 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 106 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0106 : Poly :=
[
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0106
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0107 : Poly :=
[
  term ((13928148754 : Rat) / 25734207) [(4, 1), (15, 2)]
]

/-- Partial product 107 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0107 : Poly :=
[
  term ((-27856297508 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((13928148754 : Rat) / 25734207) [(0, 2), (4, 1), (15, 2)],
  term ((-27856297508 : Rat) / 25734207) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((13928148754 : Rat) / 25734207) [(1, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0107
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0108 : Poly :=
[
  term ((-173065880400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 108 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0108 : Poly :=
[
  term ((346131760800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((-173065880400 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((346131760800 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 2)],
  term ((-173065880400 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0108
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0109 : Poly :=
[
  term ((-8336613574494513105 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 109 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0109 : Poly :=
[
  term ((16673227148989026210 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-8336613574494513105 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((16673227148989026210 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 3), (15, 1)],
  term ((-8336613574494513105 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0109
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0110 : Poly :=
[
  term ((2487386044 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 110 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0110 : Poly :=
[
  term ((-4974772088 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((2487386044 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-4974772088 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((2487386044 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0110
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0111 : Poly :=
[
  term ((209033146700 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 111 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0111 : Poly :=
[
  term ((-418066293400 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((209033146700 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((-418066293400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((209033146700 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0111
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0112 : Poly :=
[
  term ((-21076676000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 112 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0112 : Poly :=
[
  term ((42153352000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-21076676000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((42153352000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (12, 1)],
  term ((-21076676000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0112
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0113 : Poly :=
[
  term ((-60532641600 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 113 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0113 : Poly :=
[
  term ((121065283200 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-60532641600 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((121065283200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (14, 1)],
  term ((-60532641600 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0113_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0113
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0114 : Poly :=
[
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 114 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0114 : Poly :=
[
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0114_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0114
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0115 : Poly :=
[
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 115 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0115 : Poly :=
[
  term ((5831735758616592840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((5831735758616592840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (14, 1), (15, 1)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0115_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0115
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0116 : Poly :=
[
  term ((40276652203677760535 : Rat) / 5152734910838036) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 116 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0116 : Poly :=
[
  term ((-40276652203677760535 : Rat) / 2576367455419018) [(0, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((40276652203677760535 : Rat) / 5152734910838036) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((-40276652203677760535 : Rat) / 2576367455419018) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((40276652203677760535 : Rat) / 5152734910838036) [(1, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0116_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0116
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0117 : Poly :=
[
  term ((-1848197080 : Rat) / 25734207) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 117 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0117 : Poly :=
[
  term ((3696394160 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(1, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0117_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0117
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0118 : Poly :=
[
  term ((-2860957744 : Rat) / 8578069) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 118 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0118 : Poly :=
[
  term ((5721915488 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2860957744 : Rat) / 8578069) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((5721915488 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2860957744 : Rat) / 8578069) [(1, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0118_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0118
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0119 : Poly :=
[
  term ((45607554229 : Rat) / 25734207) [(5, 1), (15, 1)]
]

/-- Partial product 119 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0119 : Poly :=
[
  term ((-91215108458 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((45607554229 : Rat) / 25734207) [(0, 2), (5, 1), (15, 1)],
  term ((-91215108458 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((45607554229 : Rat) / 25734207) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0119_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0119
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0120 : Poly :=
[
  term (-160 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 120 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0120 : Poly :=
[
  term (320 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term (-160 : Rat) [(0, 2), (7, 1), (9, 1)],
  term (320 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term (-160 : Rat) [(1, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0120_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0120
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0121 : Poly :=
[
  term (192 : Rat) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 121 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0121 : Poly :=
[
  term (-384 : Rat) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term (192 : Rat) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term (-384 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term (192 : Rat) [(1, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0121_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0121
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0122 : Poly :=
[
  term (192 : Rat) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 122 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0122 : Poly :=
[
  term (-384 : Rat) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term (192 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term (-384 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term (192 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0122_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0122
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0123 : Poly :=
[
  term ((-3030119297 : Rat) / 8578069) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 123 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0123 : Poly :=
[
  term ((6060238594 : Rat) / 8578069) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-3030119297 : Rat) / 8578069) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((6060238594 : Rat) / 8578069) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3030119297 : Rat) / 8578069) [(1, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0123_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0123
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0124 : Poly :=
[
  term ((3960839396 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 124 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0124 : Poly :=
[
  term ((-7921678792 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((3960839396 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1)],
  term ((-7921678792 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2)],
  term ((3960839396 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0124_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0124
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0125 : Poly :=
[
  term ((-657843200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 125 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0125 : Poly :=
[
  term ((1315686400 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-657843200 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((1315686400 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((-657843200 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0125_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0125
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0126 : Poly :=
[
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 126 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0126 : Poly :=
[
  term ((63376842833879680 : Rat) / 1288183727709509) [(0, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(0, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 3), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0126_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0126
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0127 : Poly :=
[
  term ((4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 127 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0127 : Poly :=
[
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(0, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 3), (15, 1)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0127_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0127
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0128 : Poly :=
[
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 128 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0128 : Poly :=
[
  term ((16256607488 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(1, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0128_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0128
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0129 : Poly :=
[
  term (-192 : Rat) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 129 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0129 : Poly :=
[
  term (384 : Rat) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term (-192 : Rat) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0129_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0129
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0130 : Poly :=
[
  term ((8798135383 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 130 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0130 : Poly :=
[
  term ((-17596270766 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((8798135383 : Rat) / 25734207) [(0, 2), (7, 1), (15, 1)],
  term ((-17596270766 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((8798135383 : Rat) / 25734207) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0130_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0130
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0131 : Poly :=
[
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0131 : Poly :=
[
  term (-4 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0131_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0131
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0132 : Poly :=
[
  term (-32 : Rat) [(7, 2)]
]

/-- Partial product 132 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0132 : Poly :=
[
  term (64 : Rat) [(0, 1), (7, 2), (10, 1)],
  term (-32 : Rat) [(0, 2), (7, 2)],
  term (64 : Rat) [(1, 1), (7, 2), (11, 1)],
  term (-32 : Rat) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0132_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0132
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0133 : Poly :=
[
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 133 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0133 : Poly :=
[
  term ((162800819760 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-81400409880 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((162800819760 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-81400409880 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0133_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0133
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0134 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 134 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0134 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0134_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0134
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0135 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 135 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0135 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0135_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0135
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0136 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 136 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0136 : Poly :=
[
  term ((7842143817216848487 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0136_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0136
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0137 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 137 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0137 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0137_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0137
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0138 : Poly :=
[
  term ((-11121090721 : Rat) / 8578069) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 138 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0138 : Poly :=
[
  term ((22242181442 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-11121090721 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((22242181442 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-11121090721 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0138_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0138
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0139 : Poly :=
[
  term ((-229937578500 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 139 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0139 : Poly :=
[
  term ((459875157000 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-229937578500 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((459875157000 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((-229937578500 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0139_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0139
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0140 : Poly :=
[
  term ((-7719423600 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 140 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0140 : Poly :=
[
  term ((15438847200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-7719423600 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((15438847200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-7719423600 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0140_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0140
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0141 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 141 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0141 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0141_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0141
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0142 : Poly :=
[
  term ((-371845978088199195 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 142 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0142 : Poly :=
[
  term ((743691956176398390 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-371845978088199195 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((743691956176398390 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-371845978088199195 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0142_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0142
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0143 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 143 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0143 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (14, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0143_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0143
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0144 : Poly :=
[
  term ((-44304532673431514925 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 144 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0144 : Poly :=
[
  term ((44304532673431514925 : Rat) / 2576367455419018) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-44304532673431514925 : Rat) / 5152734910838036) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((44304532673431514925 : Rat) / 2576367455419018) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-44304532673431514925 : Rat) / 5152734910838036) [(1, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0144_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0144
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0145 : Poly :=
[
  term ((-15677942124 : Rat) / 8578069) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 145 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0145 : Poly :=
[
  term ((31355884248 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-15677942124 : Rat) / 8578069) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((31355884248 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15677942124 : Rat) / 8578069) [(1, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0145_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0145
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0146 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 146 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0146 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0146_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0146
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0147 : Poly :=
[
  term ((15874573955 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 147 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0147 : Poly :=
[
  term ((-31749147910 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((15874573955 : Rat) / 8578069) [(0, 2), (9, 1), (15, 1)],
  term ((-31749147910 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((15874573955 : Rat) / 8578069) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0147_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0147
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0148 : Poly :=
[
  term (2 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0148 : Poly :=
[
  term (-4 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0148_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0148
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0149 : Poly :=
[
  term (-80 : Rat) [(9, 2)]
]

/-- Partial product 149 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0149 : Poly :=
[
  term (160 : Rat) [(0, 1), (9, 2), (10, 1)],
  term (-80 : Rat) [(0, 2), (9, 2)],
  term (160 : Rat) [(1, 1), (9, 2), (11, 1)],
  term (-80 : Rat) [(1, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0149_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0149
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0150 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 150 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0150 : Poly :=
[
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0150_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0150
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0151 : Poly :=
[
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 151 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0151 : Poly :=
[
  term ((8551961600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-4275980800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((8551961600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-4275980800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0151_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0151
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0152 : Poly :=
[
  term ((19038016682633161 : Rat) / 151551026789354) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 152 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0152 : Poly :=
[
  term ((-19038016682633161 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((19038016682633161 : Rat) / 151551026789354) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-19038016682633161 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((19038016682633161 : Rat) / 151551026789354) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0152_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0152
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0153 : Poly :=
[
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 153 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0153 : Poly :=
[
  term ((-502715706240 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2)],
  term ((251357853120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((-502715706240 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((251357853120 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0153_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0153
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0154 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 154 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0154 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0154_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0154
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0155 : Poly :=
[
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 155 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0155 : Poly :=
[
  term ((411949478420217920 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((411949478420217920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0155_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0155
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0156 : Poly :=
[
  term ((-527837679981724283 : Rat) / 151551026789354) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 156 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0156 : Poly :=
[
  term ((527837679981724283 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((-527837679981724283 : Rat) / 151551026789354) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((527837679981724283 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((-527837679981724283 : Rat) / 151551026789354) [(1, 2), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0156_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0156
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0157 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 157 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0157 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0157_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0157
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0158 : Poly :=
[
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 158 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0158 : Poly :=
[
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0158_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0158
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0159 : Poly :=
[
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 159 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0159 : Poly :=
[
  term ((105667948672 : Rat) / 25734207) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((105667948672 : Rat) / 25734207) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0159_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0159
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0160 : Poly :=
[
  term ((14247081635 : Rat) / 102936828) [(10, 1), (15, 2)]
]

/-- Partial product 160 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0160 : Poly :=
[
  term ((-14247081635 : Rat) / 51468414) [(0, 1), (10, 2), (15, 2)],
  term ((14247081635 : Rat) / 102936828) [(0, 2), (10, 1), (15, 2)],
  term ((-14247081635 : Rat) / 51468414) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((14247081635 : Rat) / 102936828) [(1, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0160_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0160
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0161 : Poly :=
[
  term ((126111117559424416 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 161 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0161 : Poly :=
[
  term ((-252222235118848832 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((126111117559424416 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-252222235118848832 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((126111117559424416 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0161_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0161
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0162 : Poly :=
[
  term ((-287852586400 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 162 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0162 : Poly :=
[
  term ((575705172800 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-287852586400 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((575705172800 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((-287852586400 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0162_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0162
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0163 : Poly :=
[
  term ((5408636024645137240 : Rat) / 1288183727709509) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 163 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0163 : Poly :=
[
  term ((-10817272049290274480 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((5408636024645137240 : Rat) / 1288183727709509) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-10817272049290274480 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((5408636024645137240 : Rat) / 1288183727709509) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0163_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0163
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0164 : Poly :=
[
  term ((-3507536675703924397 : Rat) / 10305469821676072) [(11, 1), (15, 1)]
]

/-- Partial product 164 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0164 : Poly :=
[
  term ((3507536675703924397 : Rat) / 5152734910838036) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3507536675703924397 : Rat) / 10305469821676072) [(0, 2), (11, 1), (15, 1)],
  term ((3507536675703924397 : Rat) / 5152734910838036) [(1, 1), (11, 2), (15, 1)],
  term ((-3507536675703924397 : Rat) / 10305469821676072) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0164_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0164
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0165 : Poly :=
[
  term ((97701735960 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 165 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0165 : Poly :=
[
  term ((-195403471920 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2)],
  term ((97701735960 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((-195403471920 : Rat) / 150171761) [(1, 1), (11, 3)],
  term ((97701735960 : Rat) / 150171761) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0165_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0165
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0166 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 166 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0166 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (11, 3), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0166_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0166
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0167 : Poly :=
[
  term ((7562694699248783730 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 167 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0167 : Poly :=
[
  term ((-15125389398497567460 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((-15125389398497567460 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0167_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0167
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0168 : Poly :=
[
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 168 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0168 : Poly :=
[
  term ((27731818353672381860 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((27731818353672381860 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0168_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0168
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0169 : Poly :=
[
  term ((23493300000 : Rat) / 150171761) [(11, 2), (14, 1)]
]

/-- Partial product 169 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0169 : Poly :=
[
  term ((-46986600000 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((23493300000 : Rat) / 150171761) [(0, 2), (11, 2), (14, 1)],
  term ((-46986600000 : Rat) / 150171761) [(1, 1), (11, 3), (14, 1)],
  term ((23493300000 : Rat) / 150171761) [(1, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0169_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0169
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0170 : Poly :=
[
  term ((28802961137243174571 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 170 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0170 : Poly :=
[
  term ((-57605922274486349142 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((28802961137243174571 : Rat) / 1288183727709509) [(0, 2), (11, 2), (14, 1), (15, 2)],
  term ((-57605922274486349142 : Rat) / 1288183727709509) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((28802961137243174571 : Rat) / 1288183727709509) [(1, 2), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0170_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0170
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0171 : Poly :=
[
  term ((-6211767544859641025 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 171 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0171 : Poly :=
[
  term ((12423535089719282050 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((-6211767544859641025 : Rat) / 1288183727709509) [(0, 2), (11, 2), (15, 2)],
  term ((12423535089719282050 : Rat) / 1288183727709509) [(1, 1), (11, 3), (15, 2)],
  term ((-6211767544859641025 : Rat) / 1288183727709509) [(1, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0171_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0171
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0172 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 172 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0172 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (11, 4), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0172_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0172
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0173 : Poly :=
[
  term ((1131676349127866250 : Rat) / 1288183727709509) [(11, 3), (14, 1), (15, 1)]
]

/-- Partial product 173 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0173 : Poly :=
[
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(0, 2), (11, 3), (14, 1), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 4), (14, 1), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 2), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0173_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0173
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0174 : Poly :=
[
  term ((9412619245033057479 : Rat) / 2576367455419018) [(11, 3), (15, 1)]
]

/-- Partial product 174 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0174 : Poly :=
[
  term ((-9412619245033057479 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((9412619245033057479 : Rat) / 2576367455419018) [(0, 2), (11, 3), (15, 1)],
  term ((-9412619245033057479 : Rat) / 1288183727709509) [(1, 1), (11, 4), (15, 1)],
  term ((9412619245033057479 : Rat) / 2576367455419018) [(1, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0174_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0174
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0175 : Poly :=
[
  term ((14189683976 : Rat) / 8578069) [(12, 1), (15, 2)]
]

/-- Partial product 175 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0175 : Poly :=
[
  term ((-28379367952 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((14189683976 : Rat) / 8578069) [(0, 2), (12, 1), (15, 2)],
  term ((-28379367952 : Rat) / 8578069) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((14189683976 : Rat) / 8578069) [(1, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0175_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0175
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0176 : Poly :=
[
  term ((-135057266168 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 176 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0176 : Poly :=
[
  term ((270114532336 : Rat) / 25734207) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-135057266168 : Rat) / 25734207) [(0, 2), (13, 1), (15, 1)],
  term ((270114532336 : Rat) / 25734207) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-135057266168 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0176_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0176
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0177 : Poly :=
[
  term ((26724463199 : Rat) / 17156138) [(14, 1), (15, 2)]
]

/-- Partial product 177 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0177 : Poly :=
[
  term ((-26724463199 : Rat) / 8578069) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((26724463199 : Rat) / 17156138) [(0, 2), (14, 1), (15, 2)],
  term ((-26724463199 : Rat) / 8578069) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((26724463199 : Rat) / 17156138) [(1, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0177_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0177
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 22. -/
def rs_R013_ueqv_R013YNNN_coefficient_22_0178 : Poly :=
[
  term ((-50872445980 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 178 for generator 22. -/
def rs_R013_ueqv_R013YNNN_partial_22_0178 : Poly :=
[
  term ((101744891960 : Rat) / 25734207) [(0, 1), (10, 1), (15, 2)],
  term ((-50872445980 : Rat) / 25734207) [(0, 2), (15, 2)],
  term ((101744891960 : Rat) / 25734207) [(1, 1), (11, 1), (15, 2)],
  term ((-50872445980 : Rat) / 25734207) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 22. -/
theorem rs_R013_ueqv_R013YNNN_partial_22_0178_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_22_0178
        rs_R013_ueqv_R013YNNN_generator_22_0100_0178 =
      rs_R013_ueqv_R013YNNN_partial_22_0178 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_22_0100_0178 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_22_0100,
  rs_R013_ueqv_R013YNNN_partial_22_0101,
  rs_R013_ueqv_R013YNNN_partial_22_0102,
  rs_R013_ueqv_R013YNNN_partial_22_0103,
  rs_R013_ueqv_R013YNNN_partial_22_0104,
  rs_R013_ueqv_R013YNNN_partial_22_0105,
  rs_R013_ueqv_R013YNNN_partial_22_0106,
  rs_R013_ueqv_R013YNNN_partial_22_0107,
  rs_R013_ueqv_R013YNNN_partial_22_0108,
  rs_R013_ueqv_R013YNNN_partial_22_0109,
  rs_R013_ueqv_R013YNNN_partial_22_0110,
  rs_R013_ueqv_R013YNNN_partial_22_0111,
  rs_R013_ueqv_R013YNNN_partial_22_0112,
  rs_R013_ueqv_R013YNNN_partial_22_0113,
  rs_R013_ueqv_R013YNNN_partial_22_0114,
  rs_R013_ueqv_R013YNNN_partial_22_0115,
  rs_R013_ueqv_R013YNNN_partial_22_0116,
  rs_R013_ueqv_R013YNNN_partial_22_0117,
  rs_R013_ueqv_R013YNNN_partial_22_0118,
  rs_R013_ueqv_R013YNNN_partial_22_0119,
  rs_R013_ueqv_R013YNNN_partial_22_0120,
  rs_R013_ueqv_R013YNNN_partial_22_0121,
  rs_R013_ueqv_R013YNNN_partial_22_0122,
  rs_R013_ueqv_R013YNNN_partial_22_0123,
  rs_R013_ueqv_R013YNNN_partial_22_0124,
  rs_R013_ueqv_R013YNNN_partial_22_0125,
  rs_R013_ueqv_R013YNNN_partial_22_0126,
  rs_R013_ueqv_R013YNNN_partial_22_0127,
  rs_R013_ueqv_R013YNNN_partial_22_0128,
  rs_R013_ueqv_R013YNNN_partial_22_0129,
  rs_R013_ueqv_R013YNNN_partial_22_0130,
  rs_R013_ueqv_R013YNNN_partial_22_0131,
  rs_R013_ueqv_R013YNNN_partial_22_0132,
  rs_R013_ueqv_R013YNNN_partial_22_0133,
  rs_R013_ueqv_R013YNNN_partial_22_0134,
  rs_R013_ueqv_R013YNNN_partial_22_0135,
  rs_R013_ueqv_R013YNNN_partial_22_0136,
  rs_R013_ueqv_R013YNNN_partial_22_0137,
  rs_R013_ueqv_R013YNNN_partial_22_0138,
  rs_R013_ueqv_R013YNNN_partial_22_0139,
  rs_R013_ueqv_R013YNNN_partial_22_0140,
  rs_R013_ueqv_R013YNNN_partial_22_0141,
  rs_R013_ueqv_R013YNNN_partial_22_0142,
  rs_R013_ueqv_R013YNNN_partial_22_0143,
  rs_R013_ueqv_R013YNNN_partial_22_0144,
  rs_R013_ueqv_R013YNNN_partial_22_0145,
  rs_R013_ueqv_R013YNNN_partial_22_0146,
  rs_R013_ueqv_R013YNNN_partial_22_0147,
  rs_R013_ueqv_R013YNNN_partial_22_0148,
  rs_R013_ueqv_R013YNNN_partial_22_0149,
  rs_R013_ueqv_R013YNNN_partial_22_0150,
  rs_R013_ueqv_R013YNNN_partial_22_0151,
  rs_R013_ueqv_R013YNNN_partial_22_0152,
  rs_R013_ueqv_R013YNNN_partial_22_0153,
  rs_R013_ueqv_R013YNNN_partial_22_0154,
  rs_R013_ueqv_R013YNNN_partial_22_0155,
  rs_R013_ueqv_R013YNNN_partial_22_0156,
  rs_R013_ueqv_R013YNNN_partial_22_0157,
  rs_R013_ueqv_R013YNNN_partial_22_0158,
  rs_R013_ueqv_R013YNNN_partial_22_0159,
  rs_R013_ueqv_R013YNNN_partial_22_0160,
  rs_R013_ueqv_R013YNNN_partial_22_0161,
  rs_R013_ueqv_R013YNNN_partial_22_0162,
  rs_R013_ueqv_R013YNNN_partial_22_0163,
  rs_R013_ueqv_R013YNNN_partial_22_0164,
  rs_R013_ueqv_R013YNNN_partial_22_0165,
  rs_R013_ueqv_R013YNNN_partial_22_0166,
  rs_R013_ueqv_R013YNNN_partial_22_0167,
  rs_R013_ueqv_R013YNNN_partial_22_0168,
  rs_R013_ueqv_R013YNNN_partial_22_0169,
  rs_R013_ueqv_R013YNNN_partial_22_0170,
  rs_R013_ueqv_R013YNNN_partial_22_0171,
  rs_R013_ueqv_R013YNNN_partial_22_0172,
  rs_R013_ueqv_R013YNNN_partial_22_0173,
  rs_R013_ueqv_R013YNNN_partial_22_0174,
  rs_R013_ueqv_R013YNNN_partial_22_0175,
  rs_R013_ueqv_R013YNNN_partial_22_0176,
  rs_R013_ueqv_R013YNNN_partial_22_0177,
  rs_R013_ueqv_R013YNNN_partial_22_0178
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_22_0100_0178 : Poly :=
[
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((9500507441357704 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 2)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-640593775903045555 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 3), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-27856297508 : Rat) / 25734207) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-418066293400 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((42153352000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((121065283200 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((5831735758616592840 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-40276652203677760535 : Rat) / 2576367455419018) [(0, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((5721915488 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-91215108458 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((346131760800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((16673227148989026210 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-4974772088 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term (320 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term (-384 : Rat) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-7921678792 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((1315686400 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(0, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(0, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term (384 : Rat) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17596270766 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term (-4 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((6060238594 : Rat) / 8578069) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term (64 : Rat) [(0, 1), (7, 2), (10, 1)],
  term ((459875157000 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((15438847200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((743691956176398390 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((44304532673431514925 : Rat) / 2576367455419018) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((31355884248 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-31749147910 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term (-4 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((162800819760 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((22242181442 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term (160 : Rat) [(0, 1), (9, 2), (10, 1)],
  term ((-252222235118848832 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((575705172800 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-10817272049290274480 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3507536675703924397 : Rat) / 5152734910838036) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-195403471920 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-15125389398497567460 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((27731818353672381860 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-46986600000 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-57605922274486349142 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((12423535089719282050 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-9412619245033057479 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((-28379367952 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((270114532336 : Rat) / 25734207) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-26724463199 : Rat) / 8578069) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((101744891960 : Rat) / 25734207) [(0, 1), (10, 1), (15, 2)],
  term ((-32513214976 : Rat) / 8578069) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((8551961600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-19038016682633161 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-502715706240 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2), (12, 1)],
  term ((411949478420217920 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((527837679981724283 : Rat) / 75775513394677) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (12, 1), (15, 1)],
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (15, 1)],
  term ((105667948672 : Rat) / 25734207) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-14247081635 : Rat) / 51468414) [(0, 1), (10, 2), (15, 2)],
  term ((21076676000 : Rat) / 150171761) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-4750253720678852 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(0, 2), (4, 1), (11, 2)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((640593775903045555 : Rat) / 2576367455419018) [(0, 2), (4, 1), (11, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(0, 2), (4, 1), (11, 3), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((13928148754 : Rat) / 25734207) [(0, 2), (4, 1), (15, 2)],
  term ((-173065880400 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((-8336613574494513105 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((2487386044 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((209033146700 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((-21076676000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-60532641600 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((40276652203677760535 : Rat) / 5152734910838036) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-2860957744 : Rat) / 8578069) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((45607554229 : Rat) / 25734207) [(0, 2), (5, 1), (15, 1)],
  term (-160 : Rat) [(0, 2), (7, 1), (9, 1)],
  term (192 : Rat) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term (192 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-3030119297 : Rat) / 8578069) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((3960839396 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1)],
  term ((-657843200 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(0, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term (-192 : Rat) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((8798135383 : Rat) / 25734207) [(0, 2), (7, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(0, 2), (7, 2)],
  term ((-81400409880 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-11121090721 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-229937578500 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((-7719423600 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-371845978088199195 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-44304532673431514925 : Rat) / 5152734910838036) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-15677942124 : Rat) / 8578069) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((15874573955 : Rat) / 8578069) [(0, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(0, 2), (9, 2)],
  term ((16256607488 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4275980800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((19038016682633161 : Rat) / 151551026789354) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((251357853120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-527837679981724283 : Rat) / 151551026789354) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((14247081635 : Rat) / 102936828) [(0, 2), (10, 1), (15, 2)],
  term ((126111117559424416 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-287852586400 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((5408636024645137240 : Rat) / 1288183727709509) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3507536675703924397 : Rat) / 10305469821676072) [(0, 2), (11, 1), (15, 1)],
  term ((97701735960 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((23493300000 : Rat) / 150171761) [(0, 2), (11, 2), (14, 1)],
  term ((28802961137243174571 : Rat) / 1288183727709509) [(0, 2), (11, 2), (14, 1), (15, 2)],
  term ((-6211767544859641025 : Rat) / 1288183727709509) [(0, 2), (11, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(0, 2), (11, 3), (14, 1), (15, 1)],
  term ((9412619245033057479 : Rat) / 2576367455419018) [(0, 2), (11, 3), (15, 1)],
  term ((14189683976 : Rat) / 8578069) [(0, 2), (12, 1), (15, 2)],
  term ((-135057266168 : Rat) / 25734207) [(0, 2), (13, 1), (15, 1)],
  term ((26724463199 : Rat) / 17156138) [(0, 2), (14, 1), (15, 2)],
  term ((-50872445980 : Rat) / 25734207) [(0, 2), (15, 2)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-27856297508 : Rat) / 25734207) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((9500507441357704 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 3)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (13, 1), (15, 1)],
  term ((-640593775903045555 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 3), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 4), (15, 1)],
  term ((-4974772088 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((346131760800 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 2)],
  term ((16673227148989026210 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 3), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((5721915488 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-91215108458 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-418066293400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((42153352000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (12, 1)],
  term ((121065283200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (14, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (12, 1), (15, 1)],
  term ((5831735758616592840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (14, 1), (15, 1)],
  term ((-40276652203677760535 : Rat) / 2576367455419018) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term (-384 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term (320 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((6060238594 : Rat) / 8578069) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term (-384 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((16256607488 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17596270766 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7921678792 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2)],
  term ((1315686400 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 3), (12, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 3), (15, 1)],
  term (64 : Rat) [(1, 1), (7, 2), (11, 1)],
  term ((-16256607488 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((22242181442 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((162800819760 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((31355884248 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-31749147910 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((459875157000 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((15438847200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((743691956176398390 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (14, 1), (15, 1)],
  term ((44304532673431514925 : Rat) / 2576367455419018) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term (160 : Rat) [(1, 1), (9, 2), (11, 1)],
  term ((105667948672 : Rat) / 25734207) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14247081635 : Rat) / 51468414) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-32513214976 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((8551961600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-19038016682633161 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-502715706240 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3), (12, 1)],
  term ((411949478420217920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((527837679981724283 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (12, 1), (15, 1)],
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((-28379367952 : Rat) / 8578069) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((270114532336 : Rat) / 25734207) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-26724463199 : Rat) / 8578069) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((101744891960 : Rat) / 25734207) [(1, 1), (11, 1), (15, 2)],
  term ((-252222235118848832 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((575705172800 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((-10817272049290274480 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((3507536675703924397 : Rat) / 5152734910838036) [(1, 1), (11, 2), (15, 1)],
  term ((-195403471920 : Rat) / 150171761) [(1, 1), (11, 3)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (11, 3), (12, 1)],
  term ((-15125389398497567460 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((27731818353672381860 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-46986600000 : Rat) / 150171761) [(1, 1), (11, 3), (14, 1)],
  term ((-57605922274486349142 : Rat) / 1288183727709509) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((12423535089719282050 : Rat) / 1288183727709509) [(1, 1), (11, 3), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (11, 4), (12, 1), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 4), (14, 1), (15, 1)],
  term ((-9412619245033057479 : Rat) / 1288183727709509) [(1, 1), (11, 4), (15, 1)],
  term ((21076676000 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-4750253720678852 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 1), (15, 1)],
  term ((-73350826800 : Rat) / 150171761) [(1, 2), (4, 1), (11, 2)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((640593775903045555 : Rat) / 2576367455419018) [(1, 2), (4, 1), (11, 2), (15, 2)],
  term ((-3533322090916748535 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 3), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((13928148754 : Rat) / 25734207) [(1, 2), (4, 1), (15, 2)],
  term ((-173065880400 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-8336613574494513105 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((2487386044 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((209033146700 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)],
  term ((-21076676000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-60532641600 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((40276652203677760535 : Rat) / 5152734910838036) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-2860957744 : Rat) / 8578069) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((45607554229 : Rat) / 25734207) [(1, 2), (5, 1), (15, 1)],
  term (-160 : Rat) [(1, 2), (7, 1), (9, 1)],
  term (192 : Rat) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term (192 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-3030119297 : Rat) / 8578069) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((3960839396 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1)],
  term ((-657843200 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((8798135383 : Rat) / 25734207) [(1, 2), (7, 1), (15, 1)],
  term (2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(1, 2), (7, 2)],
  term ((-81400409880 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((1973529600 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-11121090721 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-229937578500 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)],
  term ((-7719423600 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-371845978088199195 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-44304532673431514925 : Rat) / 5152734910838036) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-15677942124 : Rat) / 8578069) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((15874573955 : Rat) / 8578069) [(1, 2), (9, 1), (15, 1)],
  term (2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-80 : Rat) [(1, 2), (9, 2)],
  term ((16256607488 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4275980800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((19038016682633161 : Rat) / 151551026789354) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((251357853120 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-527837679981724283 : Rat) / 151551026789354) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((14247081635 : Rat) / 102936828) [(1, 2), (10, 1), (15, 2)],
  term ((126111117559424416 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-287852586400 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((5408636024645137240 : Rat) / 1288183727709509) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3507536675703924397 : Rat) / 10305469821676072) [(1, 2), (11, 1), (15, 1)],
  term ((97701735960 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((23493300000 : Rat) / 150171761) [(1, 2), (11, 2), (14, 1)],
  term ((28802961137243174571 : Rat) / 1288183727709509) [(1, 2), (11, 2), (14, 1), (15, 2)],
  term ((-6211767544859641025 : Rat) / 1288183727709509) [(1, 2), (11, 2), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 2), (11, 3), (14, 1), (15, 1)],
  term ((9412619245033057479 : Rat) / 2576367455419018) [(1, 2), (11, 3), (15, 1)],
  term ((14189683976 : Rat) / 8578069) [(1, 2), (12, 1), (15, 2)],
  term ((-135057266168 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)],
  term ((26724463199 : Rat) / 17156138) [(1, 2), (14, 1), (15, 2)],
  term ((-50872445980 : Rat) / 25734207) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 100 through 178. -/
theorem rs_R013_ueqv_R013YNNN_block_22_0100_0178_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_22_0100_0178
      rs_R013_ueqv_R013YNNN_block_22_0100_0178 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
