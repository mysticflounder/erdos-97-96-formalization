/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 9:100-122

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_09_0100_0122 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0100 : Poly :=
[
  term ((1683679960 : Rat) / 8578069) [(10, 1), (15, 2)]
]

/-- Partial product 100 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0100 : Poly :=
[
  term ((-3367359920 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((3367359920 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-3367359920 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((3367359920 : Rat) / 8578069) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((1683679960 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((1683679960 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)],
  term ((-1683679960 : Rat) / 8578069) [(10, 1), (12, 2), (15, 2)],
  term ((-1683679960 : Rat) / 8578069) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0100
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0101 : Poly :=
[
  term ((596667141200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 101 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0101 : Poly :=
[
  term ((-1193334282400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((1193334282400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1193334282400 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((1193334282400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((596667141200 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((596667141200 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-596667141200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 3)],
  term ((-596667141200 : Rat) / 150171761) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0101
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0102 : Poly :=
[
  term ((-2007930534162860320 : Rat) / 3864551183128527) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 102 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0102 : Poly :=
[
  term ((4015861068325720640 : Rat) / 3864551183128527) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4015861068325720640 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((4015861068325720640 : Rat) / 3864551183128527) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4015861068325720640 : Rat) / 3864551183128527) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2007930534162860320 : Rat) / 3864551183128527) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2007930534162860320 : Rat) / 3864551183128527) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((2007930534162860320 : Rat) / 3864551183128527) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((2007930534162860320 : Rat) / 3864551183128527) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0102
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0103 : Poly :=
[
  term ((-77065693400 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 103 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0103 : Poly :=
[
  term ((154131386800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-154131386800 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((154131386800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-154131386800 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)],
  term ((-77065693400 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((-77065693400 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((77065693400 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1)],
  term ((77065693400 : Rat) / 150171761) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0103
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0104 : Poly :=
[
  term ((-398621411600 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 104 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0104 : Poly :=
[
  term ((797242823200 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((797242823200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-797242823200 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-398621411600 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-398621411600 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((398621411600 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((398621411600 : Rat) / 150171761) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0104
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0105 : Poly :=
[
  term ((-186788054400 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 105 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0105 : Poly :=
[
  term ((373576108800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((373576108800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-373576108800 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-186788054400 : Rat) / 150171761) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-186788054400 : Rat) / 150171761) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((186788054400 : Rat) / 150171761) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((186788054400 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0105
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0106 : Poly :=
[
  term ((-9631363172921786005 : Rat) / 15458204732514108) [(11, 1), (15, 1)]
]

/-- Partial product 106 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0106 : Poly :=
[
  term ((9631363172921786005 : Rat) / 7729102366257054) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 7729102366257054) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((9631363172921786005 : Rat) / 7729102366257054) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 7729102366257054) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 15458204732514108) [(2, 2), (11, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 15458204732514108) [(3, 2), (11, 1), (15, 1)],
  term ((9631363172921786005 : Rat) / 15458204732514108) [(11, 1), (12, 2), (15, 1)],
  term ((9631363172921786005 : Rat) / 15458204732514108) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0106
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0107 : Poly :=
[
  term ((20248865360 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 107 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0107 : Poly :=
[
  term ((-40497730720 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)],
  term ((40497730720 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)],
  term ((-40497730720 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((40497730720 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((20248865360 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((20248865360 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((-20248865360 : Rat) / 150171761) [(11, 2), (12, 2)],
  term ((-20248865360 : Rat) / 150171761) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0107
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0108 : Poly :=
[
  term ((-3289216000 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 108 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0108 : Poly :=
[
  term ((6578432000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-6578432000 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2)],
  term ((6578432000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((-6578432000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-3289216000 : Rat) / 150171761) [(2, 2), (11, 2), (12, 1)],
  term ((-3289216000 : Rat) / 150171761) [(3, 2), (11, 2), (12, 1)],
  term ((3289216000 : Rat) / 150171761) [(11, 2), (12, 1), (13, 2)],
  term ((3289216000 : Rat) / 150171761) [(11, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0108
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0109 : Poly :=
[
  term ((28741560019144908065 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 109 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0109 : Poly :=
[
  term ((-57483120038289816130 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((57483120038289816130 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-57483120038289816130 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((57483120038289816130 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 3), (15, 1)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(11, 2), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0109
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0110 : Poly :=
[
  term ((7665682068853838210 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 110 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0110 : Poly :=
[
  term ((-15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (15, 2)],
  term ((-15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(11, 2), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0110
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0111 : Poly :=
[
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 111 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0111 : Poly :=
[
  term ((38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((38403325523760772090 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(11, 2), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0111
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0112 : Poly :=
[
  term ((-7424535722943945535 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 112 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0112 : Poly :=
[
  term ((7424535722943945535 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7424535722943945535 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((7424535722943945535 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7424535722943945535 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-7424535722943945535 : Rat) / 2576367455419018) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-7424535722943945535 : Rat) / 2576367455419018) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((7424535722943945535 : Rat) / 2576367455419018) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((7424535722943945535 : Rat) / 2576367455419018) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0112
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0113 : Poly :=
[
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 113 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0113 : Poly :=
[
  term ((17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (14, 1), (15, 2)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((17995226167808632560 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(2, 2), (11, 2), (14, 1), (15, 2)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0113_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0113
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0114 : Poly :=
[
  term ((-5303801248877875590 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 114 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0114 : Poly :=
[
  term ((10607602497755751180 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((-10607602497755751180 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((10607602497755751180 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((-10607602497755751180 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-5303801248877875590 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)],
  term ((-5303801248877875590 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 2)],
  term ((5303801248877875590 : Rat) / 1288183727709509) [(11, 2), (12, 2), (15, 2)],
  term ((5303801248877875590 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0114_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0114
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0115 : Poly :=
[
  term ((-158442107084699200 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 115 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0115 : Poly :=
[
  term ((316884214169398400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-316884214169398400 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (15, 1)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((-316884214169398400 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(2, 2), (11, 3), (12, 1), (15, 1)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(3, 2), (11, 3), (12, 1), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(11, 3), (12, 1), (13, 2), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(11, 3), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0115_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0115
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0116 : Poly :=
[
  term ((975391367946883457 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 116 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0116 : Poly :=
[
  term ((-1950782735893766914 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((1950782735893766914 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1950782735893766914 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((1950782735893766914 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((975391367946883457 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((975391367946883457 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((-975391367946883457 : Rat) / 1288183727709509) [(11, 3), (12, 2), (15, 1)],
  term ((-975391367946883457 : Rat) / 1288183727709509) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0116_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0116
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0117 : Poly :=
[
  term ((255343153804 : Rat) / 25734207) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 117 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0117 : Poly :=
[
  term ((-510686307608 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((510686307608 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-510686307608 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((510686307608 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((255343153804 : Rat) / 25734207) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((255343153804 : Rat) / 25734207) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-255343153804 : Rat) / 25734207) [(12, 1), (13, 3), (15, 1)],
  term ((-255343153804 : Rat) / 25734207) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0117_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0117
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0118 : Poly :=
[
  term ((68986039096 : Rat) / 25734207) [(12, 1), (15, 2)]
]

/-- Partial product 118 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0118 : Poly :=
[
  term ((-137972078192 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((137972078192 : Rat) / 25734207) [(0, 1), (12, 2), (15, 2)],
  term ((-137972078192 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((137972078192 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((68986039096 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)],
  term ((68986039096 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)],
  term ((-68986039096 : Rat) / 25734207) [(12, 1), (13, 2), (15, 2)],
  term ((-68986039096 : Rat) / 25734207) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0118_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0118
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0119 : Poly :=
[
  term ((-222347142652 : Rat) / 25734207) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 119 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0119 : Poly :=
[
  term ((444694285304 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((444694285304 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-444694285304 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-222347142652 : Rat) / 25734207) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-222347142652 : Rat) / 25734207) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((222347142652 : Rat) / 25734207) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((222347142652 : Rat) / 25734207) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0119_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0119
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0120 : Poly :=
[
  term ((-43964454778 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 120 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0120 : Poly :=
[
  term ((87928909556 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-87928909556 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((87928909556 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-87928909556 : Rat) / 25734207) [(1, 1), (13, 2), (15, 1)],
  term ((-43964454778 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((-43964454778 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((43964454778 : Rat) / 25734207) [(12, 2), (13, 1), (15, 1)],
  term ((43964454778 : Rat) / 25734207) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0120_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0120
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0121 : Poly :=
[
  term ((-2490981536 : Rat) / 8578069) [(14, 1), (15, 2)]
]

/-- Partial product 121 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0121 : Poly :=
[
  term ((4981963072 : Rat) / 8578069) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((4981963072 : Rat) / 8578069) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-4981963072 : Rat) / 8578069) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2490981536 : Rat) / 8578069) [(2, 2), (14, 1), (15, 2)],
  term ((-2490981536 : Rat) / 8578069) [(3, 2), (14, 1), (15, 2)],
  term ((2490981536 : Rat) / 8578069) [(12, 2), (14, 1), (15, 2)],
  term ((2490981536 : Rat) / 8578069) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0121_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0121
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 9. -/
def rs_R013_ueqv_R013YNNN_coefficient_09_0122 : Poly :=
[
  term ((-351351768 : Rat) / 8578069) [(15, 2)]
]

/-- Partial product 122 for generator 9. -/
def rs_R013_ueqv_R013YNNN_partial_09_0122 : Poly :=
[
  term ((702703536 : Rat) / 8578069) [(0, 1), (2, 1), (15, 2)],
  term ((-702703536 : Rat) / 8578069) [(0, 1), (12, 1), (15, 2)],
  term ((702703536 : Rat) / 8578069) [(1, 1), (3, 1), (15, 2)],
  term ((-702703536 : Rat) / 8578069) [(1, 1), (13, 1), (15, 2)],
  term ((-351351768 : Rat) / 8578069) [(2, 2), (15, 2)],
  term ((-351351768 : Rat) / 8578069) [(3, 2), (15, 2)],
  term ((351351768 : Rat) / 8578069) [(12, 2), (15, 2)],
  term ((351351768 : Rat) / 8578069) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 9. -/
theorem rs_R013_ueqv_R013YNNN_partial_09_0122_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_09_0122
        rs_R013_ueqv_R013YNNN_generator_09_0100_0122 =
      rs_R013_ueqv_R013YNNN_partial_09_0122 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_09_0100_0122 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_09_0100,
  rs_R013_ueqv_R013YNNN_partial_09_0101,
  rs_R013_ueqv_R013YNNN_partial_09_0102,
  rs_R013_ueqv_R013YNNN_partial_09_0103,
  rs_R013_ueqv_R013YNNN_partial_09_0104,
  rs_R013_ueqv_R013YNNN_partial_09_0105,
  rs_R013_ueqv_R013YNNN_partial_09_0106,
  rs_R013_ueqv_R013YNNN_partial_09_0107,
  rs_R013_ueqv_R013YNNN_partial_09_0108,
  rs_R013_ueqv_R013YNNN_partial_09_0109,
  rs_R013_ueqv_R013YNNN_partial_09_0110,
  rs_R013_ueqv_R013YNNN_partial_09_0111,
  rs_R013_ueqv_R013YNNN_partial_09_0112,
  rs_R013_ueqv_R013YNNN_partial_09_0113,
  rs_R013_ueqv_R013YNNN_partial_09_0114,
  rs_R013_ueqv_R013YNNN_partial_09_0115,
  rs_R013_ueqv_R013YNNN_partial_09_0116,
  rs_R013_ueqv_R013YNNN_partial_09_0117,
  rs_R013_ueqv_R013YNNN_partial_09_0118,
  rs_R013_ueqv_R013YNNN_partial_09_0119,
  rs_R013_ueqv_R013YNNN_partial_09_0120,
  rs_R013_ueqv_R013YNNN_partial_09_0121,
  rs_R013_ueqv_R013YNNN_partial_09_0122
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_09_0100_0122 : Poly :=
[
  term ((-3367359920 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-1193334282400 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((4015861068325720640 : Rat) / 3864551183128527) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((154131386800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((797242823200 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((373576108800 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((9631363172921786005 : Rat) / 7729102366257054) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-40497730720 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)],
  term ((6578432000 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-57483120038289816130 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((7424535722943945535 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (14, 1), (15, 2)],
  term ((10607602497755751180 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1950782735893766914 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-510686307608 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-137972078192 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((444694285304 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((87928909556 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((4981963072 : Rat) / 8578069) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((702703536 : Rat) / 8578069) [(0, 1), (2, 1), (15, 2)],
  term ((3367359920 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-154131386800 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-373576108800 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 7729102366257054) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((1193334282400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-4015861068325720640 : Rat) / 3864551183128527) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((40497730720 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7424535722943945535 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-10607602497755751180 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-6578432000 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2)],
  term ((57483120038289816130 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (15, 2)],
  term ((1950782735893766914 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-316884214169398400 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (15, 1)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-87928909556 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4981963072 : Rat) / 8578069) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-702703536 : Rat) / 8578069) [(0, 1), (12, 1), (15, 2)],
  term ((510686307608 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((137972078192 : Rat) / 25734207) [(0, 1), (12, 2), (15, 2)],
  term ((-3367359920 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-1193334282400 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((4015861068325720640 : Rat) / 3864551183128527) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((154131386800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((797242823200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((373576108800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((9631363172921786005 : Rat) / 7729102366257054) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-40497730720 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((6578432000 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((-57483120038289816130 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((38403325523760772090 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((7424535722943945535 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((17995226167808632560 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2)],
  term ((10607602497755751180 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((316884214169398400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (12, 1), (15, 1)],
  term ((-1950782735893766914 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-510686307608 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-137972078192 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((444694285304 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((87928909556 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((4981963072 : Rat) / 8578069) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((702703536 : Rat) / 8578069) [(1, 1), (3, 1), (15, 2)],
  term ((3367359920 : Rat) / 8578069) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-4015861068325720640 : Rat) / 3864551183128527) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1193334282400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-373576108800 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 7729102366257054) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-154131386800 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)],
  term ((-797242823200 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6578432000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((57483120038289816130 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((40497730720 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((-17995226167808632560 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-10607602497755751180 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-7424535722943945535 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-316884214169398400 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((1950782735893766914 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((137972078192 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((510686307608 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4981963072 : Rat) / 8578069) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-702703536 : Rat) / 8578069) [(1, 1), (13, 1), (15, 2)],
  term ((-444694285304 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-87928909556 : Rat) / 25734207) [(1, 1), (13, 2), (15, 1)],
  term ((1683679960 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((596667141200 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2007930534162860320 : Rat) / 3864551183128527) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-77065693400 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((-398621411600 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-186788054400 : Rat) / 150171761) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 15458204732514108) [(2, 2), (11, 1), (15, 1)],
  term ((20248865360 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((-3289216000 : Rat) / 150171761) [(2, 2), (11, 2), (12, 1)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7424535722943945535 : Rat) / 2576367455419018) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(2, 2), (11, 2), (14, 1), (15, 2)],
  term ((-5303801248877875590 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(2, 2), (11, 3), (12, 1), (15, 1)],
  term ((975391367946883457 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((255343153804 : Rat) / 25734207) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((68986039096 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)],
  term ((-222347142652 : Rat) / 25734207) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-43964454778 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((-2490981536 : Rat) / 8578069) [(2, 2), (14, 1), (15, 2)],
  term ((-351351768 : Rat) / 8578069) [(2, 2), (15, 2)],
  term ((1683679960 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)],
  term ((596667141200 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2007930534162860320 : Rat) / 3864551183128527) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-77065693400 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((-398621411600 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-186788054400 : Rat) / 150171761) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-9631363172921786005 : Rat) / 15458204732514108) [(3, 2), (11, 1), (15, 1)],
  term ((20248865360 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((-3289216000 : Rat) / 150171761) [(3, 2), (11, 2), (12, 1)],
  term ((28741560019144908065 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((7665682068853838210 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7424535722943945535 : Rat) / 2576367455419018) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-8997613083904316280 : Rat) / 1288183727709509) [(3, 2), (11, 2), (14, 1), (15, 2)],
  term ((-5303801248877875590 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 2)],
  term ((-158442107084699200 : Rat) / 1288183727709509) [(3, 2), (11, 3), (12, 1), (15, 1)],
  term ((975391367946883457 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((255343153804 : Rat) / 25734207) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((68986039096 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)],
  term ((-222347142652 : Rat) / 25734207) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-43964454778 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((-2490981536 : Rat) / 8578069) [(3, 2), (14, 1), (15, 2)],
  term ((-351351768 : Rat) / 8578069) [(3, 2), (15, 2)],
  term ((-1683679960 : Rat) / 8578069) [(10, 1), (12, 2), (15, 2)],
  term ((-1683679960 : Rat) / 8578069) [(10, 1), (13, 2), (15, 2)],
  term ((2007930534162860320 : Rat) / 3864551183128527) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-596667141200 : Rat) / 150171761) [(11, 1), (12, 1), (13, 3)],
  term ((77065693400 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1)],
  term ((398621411600 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((186788054400 : Rat) / 150171761) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((9631363172921786005 : Rat) / 15458204732514108) [(11, 1), (12, 2), (15, 1)],
  term ((-596667141200 : Rat) / 150171761) [(11, 1), (12, 3), (13, 1)],
  term ((2007930534162860320 : Rat) / 3864551183128527) [(11, 1), (12, 3), (15, 1)],
  term ((186788054400 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((9631363172921786005 : Rat) / 15458204732514108) [(11, 1), (13, 2), (15, 1)],
  term ((77065693400 : Rat) / 150171761) [(11, 1), (13, 3)],
  term ((398621411600 : Rat) / 150171761) [(11, 1), (13, 3), (14, 1)],
  term ((3289216000 : Rat) / 150171761) [(11, 2), (12, 1), (13, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 3), (15, 1)],
  term ((-20248865360 : Rat) / 150171761) [(11, 2), (12, 2)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((7424535722943945535 : Rat) / 2576367455419018) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((5303801248877875590 : Rat) / 1288183727709509) [(11, 2), (12, 2), (15, 2)],
  term ((3289216000 : Rat) / 150171761) [(11, 2), (12, 3)],
  term ((-28741560019144908065 : Rat) / 1288183727709509) [(11, 2), (12, 3), (13, 1), (15, 1)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(11, 2), (12, 3), (15, 2)],
  term ((-20248865360 : Rat) / 150171761) [(11, 2), (13, 2)],
  term ((8997613083904316280 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((5303801248877875590 : Rat) / 1288183727709509) [(11, 2), (13, 2), (15, 2)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(11, 2), (13, 3), (14, 1), (15, 1)],
  term ((7424535722943945535 : Rat) / 2576367455419018) [(11, 2), (13, 3), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(11, 3), (12, 1), (13, 2), (15, 1)],
  term ((-975391367946883457 : Rat) / 1288183727709509) [(11, 3), (12, 2), (15, 1)],
  term ((158442107084699200 : Rat) / 1288183727709509) [(11, 3), (12, 3), (15, 1)],
  term ((-975391367946883457 : Rat) / 1288183727709509) [(11, 3), (13, 2), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(12, 1), (13, 2), (15, 2)],
  term ((-255343153804 : Rat) / 25734207) [(12, 1), (13, 3), (15, 1)],
  term ((222347142652 : Rat) / 25734207) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((43964454778 : Rat) / 25734207) [(12, 2), (13, 1), (15, 1)],
  term ((2490981536 : Rat) / 8578069) [(12, 2), (14, 1), (15, 2)],
  term ((351351768 : Rat) / 8578069) [(12, 2), (15, 2)],
  term ((-255343153804 : Rat) / 25734207) [(12, 3), (13, 1), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(12, 3), (15, 2)],
  term ((2490981536 : Rat) / 8578069) [(13, 2), (14, 1), (15, 2)],
  term ((351351768 : Rat) / 8578069) [(13, 2), (15, 2)],
  term ((222347142652 : Rat) / 25734207) [(13, 3), (14, 1), (15, 1)],
  term ((43964454778 : Rat) / 25734207) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 122. -/
theorem rs_R013_ueqv_R013YNNN_block_09_0100_0122_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_09_0100_0122
      rs_R013_ueqv_R013YNNN_block_09_0100_0122 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
