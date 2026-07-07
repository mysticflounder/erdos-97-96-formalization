/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 2:100-130

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_02_0100_0130 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0100 : Poly :=
[
  term ((100981829800 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 100 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0100 : Poly :=
[
  term ((100981829800 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((100981829800 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)],
  term ((-100981829800 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((-100981829800 : Rat) / 150171761) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0100
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0101 : Poly :=
[
  term ((221219600 : Rat) / 6529207) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 101 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0101 : Poly :=
[
  term ((221219600 : Rat) / 6529207) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((221219600 : Rat) / 6529207) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-221219600 : Rat) / 6529207) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-221219600 : Rat) / 6529207) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0101
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0102 : Poly :=
[
  term ((10656186626975645 : Rat) / 56007988161283) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 102 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0102 : Poly :=
[
  term ((10656186626975645 : Rat) / 56007988161283) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((10656186626975645 : Rat) / 56007988161283) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10656186626975645 : Rat) / 56007988161283) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-10656186626975645 : Rat) / 56007988161283) [(9, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0102
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0103 : Poly :=
[
  term ((9728624627133316145 : Rat) / 2576367455419018) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 103 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0103 : Poly :=
[
  term ((9728624627133316145 : Rat) / 2576367455419018) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((9728624627133316145 : Rat) / 2576367455419018) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-9728624627133316145 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-9728624627133316145 : Rat) / 2576367455419018) [(9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0103
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0104 : Poly :=
[
  term ((14520611396 : Rat) / 25734207) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 104 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0104 : Poly :=
[
  term ((14520611396 : Rat) / 25734207) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((14520611396 : Rat) / 25734207) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-14520611396 : Rat) / 25734207) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-14520611396 : Rat) / 25734207) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0104
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0105 : Poly :=
[
  term ((-7595098474 : Rat) / 25734207) [(9, 1), (15, 1)]
]

/-- Partial product 105 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0105 : Poly :=
[
  term ((-7595098474 : Rat) / 25734207) [(0, 2), (9, 1), (15, 1)],
  term ((-7595098474 : Rat) / 25734207) [(1, 2), (9, 1), (15, 1)],
  term ((7595098474 : Rat) / 25734207) [(9, 1), (10, 2), (15, 1)],
  term ((7595098474 : Rat) / 25734207) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0105
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0106 : Poly :=
[
  term (-2 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0106 : Poly :=
[
  term (-2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0106
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0107 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 107 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0107 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0107
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0108 : Poly :=
[
  term ((4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 108 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0108 : Poly :=
[
  term ((4275980800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 3), (13, 1)],
  term ((-4275980800 : Rat) / 150171761) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0108
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0109 : Poly :=
[
  term ((140714679800060663 : Rat) / 2576367455419018) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 109 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0109 : Poly :=
[
  term ((140714679800060663 : Rat) / 2576367455419018) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((140714679800060663 : Rat) / 2576367455419018) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-140714679800060663 : Rat) / 2576367455419018) [(10, 1), (11, 3), (15, 1)],
  term ((-140714679800060663 : Rat) / 2576367455419018) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0109
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0110 : Poly :=
[
  term ((-251357853120 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 110 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0110 : Poly :=
[
  term ((-251357853120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((-251357853120 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 4)],
  term ((251357853120 : Rat) / 150171761) [(10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0110
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0111 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 111 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0111 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 4), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 3), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0111
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0112 : Poly :=
[
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 112 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0112 : Poly :=
[
  term ((205974739210108960 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 4), (13, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0112
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0113 : Poly :=
[
  term ((5790430520344152028 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 113 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0113 : Poly :=
[
  term ((5790430520344152028 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((5790430520344152028 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((-5790430520344152028 : Rat) / 1288183727709509) [(10, 1), (11, 4), (15, 2)],
  term ((-5790430520344152028 : Rat) / 1288183727709509) [(10, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0113_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0113
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0114 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 114 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0114 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 5), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 3), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0114_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0114
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0115 : Poly :=
[
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 115 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0115 : Poly :=
[
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 5), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 3), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0115_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0115
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0116 : Poly :=
[
  term ((52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 116 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0116 : Poly :=
[
  term ((52833974336 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0116_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0116
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0117 : Poly :=
[
  term ((82724357909 : Rat) / 102936828) [(10, 1), (15, 2)]
]

/-- Partial product 117 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0117 : Poly :=
[
  term ((82724357909 : Rat) / 102936828) [(0, 2), (10, 1), (15, 2)],
  term ((82724357909 : Rat) / 102936828) [(1, 2), (10, 1), (15, 2)],
  term ((-82724357909 : Rat) / 102936828) [(10, 1), (11, 2), (15, 2)],
  term ((-82724357909 : Rat) / 102936828) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0117_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0117
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0118 : Poly :=
[
  term ((1686511584037097760 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 118 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0118 : Poly :=
[
  term ((1686511584037097760 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((1686511584037097760 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1686511584037097760 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1686511584037097760 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0118_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0118
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0119 : Poly :=
[
  term ((286783591200 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 119 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0119 : Poly :=
[
  term ((286783591200 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((286783591200 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-286783591200 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1)],
  term ((-286783591200 : Rat) / 150171761) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0119_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0119
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0120 : Poly :=
[
  term ((-54523791301542199715 : Rat) / 30916409465028216) [(11, 1), (15, 1)]
]

/-- Partial product 120 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0120 : Poly :=
[
  term ((-54523791301542199715 : Rat) / 30916409465028216) [(0, 2), (11, 1), (15, 1)],
  term ((-54523791301542199715 : Rat) / 30916409465028216) [(1, 2), (11, 1), (15, 1)],
  term ((54523791301542199715 : Rat) / 30916409465028216) [(10, 2), (11, 1), (15, 1)],
  term ((54523791301542199715 : Rat) / 30916409465028216) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0120_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0120
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0121 : Poly :=
[
  term ((-76477846240 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 121 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0121 : Poly :=
[
  term ((-76477846240 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((-76477846240 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((76477846240 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((76477846240 : Rat) / 150171761) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0121_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0121
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0122 : Poly :=
[
  term ((4933824000 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 122 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0122 : Poly :=
[
  term ((4933824000 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((4933824000 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((-4933824000 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1)],
  term ((-4933824000 : Rat) / 150171761) [(11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0122_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0122
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0123 : Poly :=
[
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 123 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0123 : Poly :=
[
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0123_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0123
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0124 : Poly :=
[
  term ((13814415492033663690 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 124 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0124 : Poly :=
[
  term ((13814415492033663690 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((13814415492033663690 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-13814415492033663690 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-13814415492033663690 : Rat) / 1288183727709509) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0124_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0124
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0125 : Poly :=
[
  term ((-5073021802651523011 : Rat) / 2576367455419018) [(11, 2), (15, 2)]
]

/-- Partial product 125 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0125 : Poly :=
[
  term ((-5073021802651523011 : Rat) / 2576367455419018) [(0, 2), (11, 2), (15, 2)],
  term ((-5073021802651523011 : Rat) / 2576367455419018) [(1, 2), (11, 2), (15, 2)],
  term ((5073021802651523011 : Rat) / 2576367455419018) [(10, 2), (11, 2), (15, 2)],
  term ((5073021802651523011 : Rat) / 2576367455419018) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0125_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0125
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0126 : Poly :=
[
  term ((237663160627048800 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 126 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0126 : Poly :=
[
  term ((237663160627048800 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((237663160627048800 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-237663160627048800 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (15, 1)],
  term ((-237663160627048800 : Rat) / 1288183727709509) [(11, 5), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0126_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0126
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0127 : Poly :=
[
  term ((-3683951161482018838 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 127 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0127 : Poly :=
[
  term ((-3683951161482018838 : Rat) / 1288183727709509) [(0, 2), (11, 3), (15, 1)],
  term ((-3683951161482018838 : Rat) / 1288183727709509) [(1, 2), (11, 3), (15, 1)],
  term ((3683951161482018838 : Rat) / 1288183727709509) [(10, 2), (11, 3), (15, 1)],
  term ((3683951161482018838 : Rat) / 1288183727709509) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0127_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0127
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0128 : Poly :=
[
  term ((-68986039096 : Rat) / 25734207) [(12, 1), (15, 2)]
]

/-- Partial product 128 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0128 : Poly :=
[
  term ((-68986039096 : Rat) / 25734207) [(0, 2), (12, 1), (15, 2)],
  term ((-68986039096 : Rat) / 25734207) [(1, 2), (12, 1), (15, 2)],
  term ((68986039096 : Rat) / 25734207) [(10, 2), (12, 1), (15, 2)],
  term ((68986039096 : Rat) / 25734207) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0128_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0128
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0129 : Poly :=
[
  term ((40616257528 : Rat) / 8578069) [(13, 1), (15, 1)]
]

/-- Partial product 129 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0129 : Poly :=
[
  term ((40616257528 : Rat) / 8578069) [(0, 2), (13, 1), (15, 1)],
  term ((40616257528 : Rat) / 8578069) [(1, 2), (13, 1), (15, 1)],
  term ((-40616257528 : Rat) / 8578069) [(10, 2), (13, 1), (15, 1)],
  term ((-40616257528 : Rat) / 8578069) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0129_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0129
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 2. -/
def rs_R013_ueqv_R013YNNN_coefficient_02_0130 : Poly :=
[
  term ((77681981795 : Rat) / 102936828) [(15, 2)]
]

/-- Partial product 130 for generator 2. -/
def rs_R013_ueqv_R013YNNN_partial_02_0130 : Poly :=
[
  term ((77681981795 : Rat) / 102936828) [(0, 2), (15, 2)],
  term ((77681981795 : Rat) / 102936828) [(1, 2), (15, 2)],
  term ((-77681981795 : Rat) / 102936828) [(10, 2), (15, 2)],
  term ((-77681981795 : Rat) / 102936828) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 2. -/
theorem rs_R013_ueqv_R013YNNN_partial_02_0130_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_02_0130
        rs_R013_ueqv_R013YNNN_generator_02_0100_0130 =
      rs_R013_ueqv_R013YNNN_partial_02_0130 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_02_0100_0130 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_02_0100,
  rs_R013_ueqv_R013YNNN_partial_02_0101,
  rs_R013_ueqv_R013YNNN_partial_02_0102,
  rs_R013_ueqv_R013YNNN_partial_02_0103,
  rs_R013_ueqv_R013YNNN_partial_02_0104,
  rs_R013_ueqv_R013YNNN_partial_02_0105,
  rs_R013_ueqv_R013YNNN_partial_02_0106,
  rs_R013_ueqv_R013YNNN_partial_02_0107,
  rs_R013_ueqv_R013YNNN_partial_02_0108,
  rs_R013_ueqv_R013YNNN_partial_02_0109,
  rs_R013_ueqv_R013YNNN_partial_02_0110,
  rs_R013_ueqv_R013YNNN_partial_02_0111,
  rs_R013_ueqv_R013YNNN_partial_02_0112,
  rs_R013_ueqv_R013YNNN_partial_02_0113,
  rs_R013_ueqv_R013YNNN_partial_02_0114,
  rs_R013_ueqv_R013YNNN_partial_02_0115,
  rs_R013_ueqv_R013YNNN_partial_02_0116,
  rs_R013_ueqv_R013YNNN_partial_02_0117,
  rs_R013_ueqv_R013YNNN_partial_02_0118,
  rs_R013_ueqv_R013YNNN_partial_02_0119,
  rs_R013_ueqv_R013YNNN_partial_02_0120,
  rs_R013_ueqv_R013YNNN_partial_02_0121,
  rs_R013_ueqv_R013YNNN_partial_02_0122,
  rs_R013_ueqv_R013YNNN_partial_02_0123,
  rs_R013_ueqv_R013YNNN_partial_02_0124,
  rs_R013_ueqv_R013YNNN_partial_02_0125,
  rs_R013_ueqv_R013YNNN_partial_02_0126,
  rs_R013_ueqv_R013YNNN_partial_02_0127,
  rs_R013_ueqv_R013YNNN_partial_02_0128,
  rs_R013_ueqv_R013YNNN_partial_02_0129,
  rs_R013_ueqv_R013YNNN_partial_02_0130
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_02_0100_0130 : Poly :=
[
  term ((100981829800 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((221219600 : Rat) / 6529207) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((10656186626975645 : Rat) / 56007988161283) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((9728624627133316145 : Rat) / 2576367455419018) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((14520611396 : Rat) / 25734207) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-7595098474 : Rat) / 25734207) [(0, 2), (9, 1), (15, 1)],
  term (-2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4275980800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((140714679800060663 : Rat) / 2576367455419018) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-251357853120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((5790430520344152028 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((82724357909 : Rat) / 102936828) [(0, 2), (10, 1), (15, 2)],
  term ((1686511584037097760 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((286783591200 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((-54523791301542199715 : Rat) / 30916409465028216) [(0, 2), (11, 1), (15, 1)],
  term ((-76477846240 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((4933824000 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((13814415492033663690 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5073021802651523011 : Rat) / 2576367455419018) [(0, 2), (11, 2), (15, 2)],
  term ((237663160627048800 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((-3683951161482018838 : Rat) / 1288183727709509) [(0, 2), (11, 3), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(0, 2), (12, 1), (15, 2)],
  term ((40616257528 : Rat) / 8578069) [(0, 2), (13, 1), (15, 1)],
  term ((77681981795 : Rat) / 102936828) [(0, 2), (15, 2)],
  term ((100981829800 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)],
  term ((221219600 : Rat) / 6529207) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((10656186626975645 : Rat) / 56007988161283) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((9728624627133316145 : Rat) / 2576367455419018) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((14520611396 : Rat) / 25734207) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-7595098474 : Rat) / 25734207) [(1, 2), (9, 1), (15, 1)],
  term (-2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16256607488 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((140714679800060663 : Rat) / 2576367455419018) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-251357853120 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((5790430520344152028 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((82724357909 : Rat) / 102936828) [(1, 2), (10, 1), (15, 2)],
  term ((1686511584037097760 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((286783591200 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-54523791301542199715 : Rat) / 30916409465028216) [(1, 2), (11, 1), (15, 1)],
  term ((-76477846240 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((4933824000 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)],
  term ((13814415492033663690 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5073021802651523011 : Rat) / 2576367455419018) [(1, 2), (11, 2), (15, 2)],
  term ((237663160627048800 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-3683951161482018838 : Rat) / 1288183727709509) [(1, 2), (11, 3), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(1, 2), (12, 1), (15, 2)],
  term ((40616257528 : Rat) / 8578069) [(1, 2), (13, 1), (15, 1)],
  term ((77681981795 : Rat) / 102936828) [(1, 2), (15, 2)],
  term ((-100981829800 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((-221219600 : Rat) / 6529207) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-10656186626975645 : Rat) / 56007988161283) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-9728624627133316145 : Rat) / 2576367455419018) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-14520611396 : Rat) / 25734207) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((7595098474 : Rat) / 25734207) [(9, 1), (10, 2), (15, 1)],
  term (2 : Rat) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-14520611396 : Rat) / 25734207) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((7595098474 : Rat) / 25734207) [(9, 1), (11, 2), (15, 1)],
  term (2 : Rat) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-100981829800 : Rat) / 150171761) [(9, 1), (11, 3)],
  term ((-221219600 : Rat) / 6529207) [(9, 1), (11, 3), (12, 1)],
  term ((-10656186626975645 : Rat) / 56007988161283) [(9, 1), (11, 4), (12, 1), (15, 1)],
  term ((-9728624627133316145 : Rat) / 2576367455419018) [(9, 1), (11, 4), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-82724357909 : Rat) / 102936828) [(10, 1), (11, 2), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 3), (13, 1)],
  term ((-140714679800060663 : Rat) / 2576367455419018) [(10, 1), (11, 3), (15, 1)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 4)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 4), (12, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 4), (13, 1), (15, 1)],
  term ((-5790430520344152028 : Rat) / 1288183727709509) [(10, 1), (11, 4), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 5), (12, 1), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 5), (15, 1)],
  term ((-1686511584037097760 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-286783591200 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1)],
  term ((54523791301542199715 : Rat) / 30916409465028216) [(10, 2), (11, 1), (15, 1)],
  term ((76477846240 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((-4933824000 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-13814415492033663690 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((5073021802651523011 : Rat) / 2576367455419018) [(10, 2), (11, 2), (15, 2)],
  term ((-237663160627048800 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (15, 1)],
  term ((3683951161482018838 : Rat) / 1288183727709509) [(10, 2), (11, 3), (15, 1)],
  term ((68986039096 : Rat) / 25734207) [(10, 2), (12, 1), (15, 2)],
  term ((-40616257528 : Rat) / 8578069) [(10, 2), (13, 1), (15, 1)],
  term ((-77681981795 : Rat) / 102936828) [(10, 2), (15, 2)],
  term ((16256607488 : Rat) / 8578069) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term ((-4275980800 : Rat) / 150171761) [(10, 3), (11, 1), (13, 1)],
  term ((-140714679800060663 : Rat) / 2576367455419018) [(10, 3), (11, 1), (15, 1)],
  term ((251357853120 : Rat) / 150171761) [(10, 3), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(10, 3), (11, 2), (12, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 3), (11, 2), (13, 1), (15, 1)],
  term ((-5790430520344152028 : Rat) / 1288183727709509) [(10, 3), (11, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 3), (11, 3), (12, 1), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 3), (11, 3), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 3), (13, 1), (15, 1)],
  term ((-82724357909 : Rat) / 102936828) [(10, 3), (15, 2)],
  term ((68986039096 : Rat) / 25734207) [(11, 2), (12, 1), (15, 2)],
  term ((-40616257528 : Rat) / 8578069) [(11, 2), (13, 1), (15, 1)],
  term ((-77681981795 : Rat) / 102936828) [(11, 2), (15, 2)],
  term ((-1686511584037097760 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)],
  term ((-286783591200 : Rat) / 150171761) [(11, 3), (13, 1)],
  term ((54523791301542199715 : Rat) / 30916409465028216) [(11, 3), (15, 1)],
  term ((76477846240 : Rat) / 150171761) [(11, 4)],
  term ((-4933824000 : Rat) / 150171761) [(11, 4), (12, 1)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)],
  term ((-13814415492033663690 : Rat) / 1288183727709509) [(11, 4), (13, 1), (15, 1)],
  term ((5073021802651523011 : Rat) / 2576367455419018) [(11, 4), (15, 2)],
  term ((-237663160627048800 : Rat) / 1288183727709509) [(11, 5), (12, 1), (15, 1)],
  term ((3683951161482018838 : Rat) / 1288183727709509) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 130. -/
theorem rs_R013_ueqv_R013YNNN_block_02_0100_0130_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_02_0100_0130
      rs_R013_ueqv_R013YNNN_block_02_0100_0130 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
