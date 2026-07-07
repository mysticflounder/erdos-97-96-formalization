/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 27:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_27_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0100 : Poly :=
[
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 100 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0100 : Poly :=
[
  term ((797242823200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (12, 1), (13, 1)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((398621411600 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((797242823200 : Rat) / 150171761) [(0, 2), (11, 1), (12, 2), (13, 1)],
  term ((-398621411600 : Rat) / 150171761) [(0, 3), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0100
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0101 : Poly :=
[
  term ((8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 101 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0101 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 3), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 2), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 3), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0101
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0102 : Poly :=
[
  term ((1547698849921453032 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 102 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0102 : Poly :=
[
  term ((-3095397699842906064 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1547698849921453032 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 1), (12, 1), (15, 1)],
  term ((3095397699842906064 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1547698849921453032 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1547698849921453032 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((3095397699842906064 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3095397699842906064 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 2), (15, 1)],
  term ((1547698849921453032 : Rat) / 1288183727709509) [(0, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0102
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0103 : Poly :=
[
  term ((-248888472000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 103 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0103 : Poly :=
[
  term ((497776944000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-248888472000 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-497776944000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((248888472000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((248888472000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-497776944000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((497776944000 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-248888472000 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0103
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0104 : Poly :=
[
  term ((187753245200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 104 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0104 : Poly :=
[
  term ((-375506490400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2), (14, 1)],
  term ((187753245200 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1), (14, 1)],
  term ((375506490400 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-187753245200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-187753245200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((375506490400 : Rat) / 150171761) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-375506490400 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((187753245200 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0104
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0105 : Poly :=
[
  term ((-25570106743 : Rat) / 17156138) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 105 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0105 : Poly :=
[
  term ((25570106743 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-25570106743 : Rat) / 17156138) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-25570106743 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-25570106743 : Rat) / 8578069) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((25570106743 : Rat) / 17156138) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((25570106743 : Rat) / 17156138) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((25570106743 : Rat) / 8578069) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25570106743 : Rat) / 17156138) [(0, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0105
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0106 : Poly :=
[
  term ((-9110021713773354823 : Rat) / 5152734910838036) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 106 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0106 : Poly :=
[
  term ((9110021713773354823 : Rat) / 2576367455419018) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9110021713773354823 : Rat) / 5152734910838036) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-9110021713773354823 : Rat) / 2576367455419018) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9110021713773354823 : Rat) / 2576367455419018) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((9110021713773354823 : Rat) / 5152734910838036) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((9110021713773354823 : Rat) / 5152734910838036) [(0, 1), (11, 1), (15, 3)],
  term ((9110021713773354823 : Rat) / 2576367455419018) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-9110021713773354823 : Rat) / 5152734910838036) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0106
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0107 : Poly :=
[
  term ((-111870499440 : Rat) / 150171761) [(0, 1), (11, 2)]
]

/-- Partial product 107 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0107 : Poly :=
[
  term ((223740998880 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((-111870499440 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2)],
  term ((-223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((111870499440 : Rat) / 150171761) [(0, 1), (11, 2), (14, 2)],
  term ((111870499440 : Rat) / 150171761) [(0, 1), (11, 2), (15, 2)],
  term ((223740998880 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((-111870499440 : Rat) / 150171761) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0107
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0108 : Poly :=
[
  term ((24480064800 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 108 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0108 : Poly :=
[
  term ((-48960129600 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1)],
  term ((24480064800 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (12, 1)],
  term ((48960129600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-24480064800 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 2)],
  term ((-24480064800 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((48960129600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2), (14, 1)],
  term ((-48960129600 : Rat) / 150171761) [(0, 2), (11, 2), (12, 2)],
  term ((24480064800 : Rat) / 150171761) [(0, 3), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0108
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0109 : Poly :=
[
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 109 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0109 : Poly :=
[
  term ((38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((38403325523760772090 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(0, 3), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0109
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0110 : Poly :=
[
  term ((1973529600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 110 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0110 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (12, 1), (14, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 3)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2), (14, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 2), (11, 2), (12, 2), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 3), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0110
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0111 : Poly :=
[
  term ((3694597378809780856 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 111 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0111 : Poly :=
[
  term ((-7389194757619561712 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((3694597378809780856 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (12, 1), (15, 2)],
  term ((7389194757619561712 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-3694597378809780856 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-3694597378809780856 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 4)],
  term ((7389194757619561712 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-7389194757619561712 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 2), (15, 2)],
  term ((3694597378809780856 : Rat) / 1288183727709509) [(0, 3), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0111
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0112 : Poly :=
[
  term ((9044106492695580365 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 112 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0112 : Poly :=
[
  term ((-18088212985391160730 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((9044106492695580365 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((18088212985391160730 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-9044106492695580365 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((-9044106492695580365 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((18088212985391160730 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 2), (14, 1), (15, 2)],
  term ((-18088212985391160730 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9044106492695580365 : Rat) / 1288183727709509) [(0, 3), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0112
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0113 : Poly :=
[
  term ((-11989001005945233900 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 113 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0113 : Poly :=
[
  term ((23978002011890467800 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-11989001005945233900 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-23978002011890467800 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((11989001005945233900 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((11989001005945233900 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((-23978002011890467800 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 2), (15, 2)],
  term ((23978002011890467800 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11989001005945233900 : Rat) / 1288183727709509) [(0, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0113_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0113
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0114 : Poly :=
[
  term ((-223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (14, 1)]
]

/-- Partial product 114 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0114 : Poly :=
[
  term ((447481997760 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-223740998880 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (14, 1)],
  term ((-447481997760 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 2)],
  term ((-447481997760 : Rat) / 150171761) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (14, 3)],
  term ((447481997760 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((-223740998880 : Rat) / 150171761) [(0, 3), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0114_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0114
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0115 : Poly :=
[
  term ((-7398585178510817855 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 115 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0115 : Poly :=
[
  term ((14797170357021635710 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-7398585178510817855 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (15, 2)],
  term ((-14797170357021635710 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-14797170357021635710 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((7398585178510817855 : Rat) / 1288183727709509) [(0, 1), (11, 2), (14, 2), (15, 2)],
  term ((7398585178510817855 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 4)],
  term ((14797170357021635710 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((-7398585178510817855 : Rat) / 1288183727709509) [(0, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0115_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0115
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0116 : Poly :=
[
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 116 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0116 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 3), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (14, 2), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 3), (11, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0116_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0116
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0117 : Poly :=
[
  term ((1179208981253276010 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 117 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0117 : Poly :=
[
  term ((-2358417962506552020 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((1179208981253276010 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (12, 1), (15, 1)],
  term ((2358417962506552020 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-1179208981253276010 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-1179208981253276010 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 3)],
  term ((2358417962506552020 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-2358417962506552020 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 2), (15, 1)],
  term ((1179208981253276010 : Rat) / 1288183727709509) [(0, 3), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0117_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0117
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0118 : Poly :=
[
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 118 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0118 : Poly :=
[
  term ((365343825416276868 : Rat) / 21833622503551) [(0, 1), (1, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 1), (1, 2), (11, 3), (14, 1), (15, 1)],
  term ((-365343825416276868 : Rat) / 21833622503551) [(0, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-365343825416276868 : Rat) / 21833622503551) [(0, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (14, 1), (15, 3)],
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (14, 3), (15, 1)],
  term ((365343825416276868 : Rat) / 21833622503551) [(0, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 3), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0118_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0118
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0119 : Poly :=
[
  term ((-91335956354069217 : Rat) / 21833622503551) [(0, 1), (11, 3), (15, 1)]
]

/-- Partial product 119 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0119 : Poly :=
[
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 1), (1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-91335956354069217 : Rat) / 21833622503551) [(0, 1), (1, 2), (11, 3), (15, 1)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (13, 1), (15, 2)],
  term ((91335956354069217 : Rat) / 21833622503551) [(0, 1), (11, 3), (14, 2), (15, 1)],
  term ((91335956354069217 : Rat) / 21833622503551) [(0, 1), (11, 3), (15, 3)],
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((-91335956354069217 : Rat) / 21833622503551) [(0, 3), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0119_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0119
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0120 : Poly :=
[
  term ((-222347142652 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 120 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0120 : Poly :=
[
  term ((444694285304 : Rat) / 25734207) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-222347142652 : Rat) / 25734207) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1)],
  term ((222347142652 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((222347142652 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((444694285304 : Rat) / 25734207) [(0, 2), (12, 2), (13, 1), (15, 1)],
  term ((-222347142652 : Rat) / 25734207) [(0, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0120_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0120
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0121 : Poly :=
[
  term ((-105519584171 : Rat) / 51468414) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 121 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0121 : Poly :=
[
  term ((105519584171 : Rat) / 25734207) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-105519584171 : Rat) / 51468414) [(0, 1), (1, 2), (12, 1), (15, 2)],
  term ((-105519584171 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((105519584171 : Rat) / 51468414) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((105519584171 : Rat) / 51468414) [(0, 1), (12, 1), (15, 4)],
  term ((-105519584171 : Rat) / 25734207) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((105519584171 : Rat) / 25734207) [(0, 2), (12, 2), (15, 2)],
  term ((-105519584171 : Rat) / 51468414) [(0, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0121_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0121
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0122 : Poly :=
[
  term ((82904840284 : Rat) / 25734207) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 122 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0122 : Poly :=
[
  term ((-165809680568 : Rat) / 25734207) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((82904840284 : Rat) / 25734207) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1)],
  term ((165809680568 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-82904840284 : Rat) / 25734207) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((-82904840284 : Rat) / 25734207) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((165809680568 : Rat) / 25734207) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((-165809680568 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((82904840284 : Rat) / 25734207) [(0, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0122_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0122
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0123 : Poly :=
[
  term ((-59070852560 : Rat) / 8578069) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 123 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0123 : Poly :=
[
  term ((118141705120 : Rat) / 8578069) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-59070852560 : Rat) / 8578069) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-118141705120 : Rat) / 8578069) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((59070852560 : Rat) / 8578069) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((59070852560 : Rat) / 8578069) [(0, 1), (13, 1), (15, 3)],
  term ((-118141705120 : Rat) / 8578069) [(0, 1), (13, 2), (15, 2)],
  term ((118141705120 : Rat) / 8578069) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-59070852560 : Rat) / 8578069) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0123_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0123
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0124 : Poly :=
[
  term ((2842643372 : Rat) / 25734207) [(0, 1), (15, 2)]
]

/-- Partial product 124 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0124 : Poly :=
[
  term ((-5685286744 : Rat) / 25734207) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((2842643372 : Rat) / 25734207) [(0, 1), (1, 2), (15, 2)],
  term ((5685286744 : Rat) / 25734207) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((5685286744 : Rat) / 25734207) [(0, 1), (13, 1), (15, 3)],
  term ((-2842643372 : Rat) / 25734207) [(0, 1), (14, 2), (15, 2)],
  term ((-2842643372 : Rat) / 25734207) [(0, 1), (15, 4)],
  term ((-5685286744 : Rat) / 25734207) [(0, 2), (12, 1), (15, 2)],
  term ((2842643372 : Rat) / 25734207) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0124_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0124
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0125 : Poly :=
[
  term ((11131685600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)]
]

/-- Partial product 125 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0125 : Poly :=
[
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((11131685600 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 2)],
  term ((-11131685600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((-22263371200 : Rat) / 150171761) [(1, 2), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((11131685600 : Rat) / 150171761) [(1, 3), (2, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0125_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0125
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0126 : Poly :=
[
  term ((536215232404440470 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 126 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0126 : Poly :=
[
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 3)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(1, 2), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(1, 3), (2, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0126_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0126
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0127 : Poly :=
[
  term ((-8895511928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (15, 1)]
]

/-- Partial product 127 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0127 : Poly :=
[
  term ((17791023856 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((8895511928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((17791023856 : Rat) / 25734207) [(1, 2), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(1, 3), (2, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0127_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0127
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0128 : Poly :=
[
  term ((-769299563600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 128 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0128 : Poly :=
[
  term ((1538599127200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-769299563600 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-1538599127200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1538599127200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((769299563600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((769299563600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1538599127200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-769299563600 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0128_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0128
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0129 : Poly :=
[
  term ((-515840553200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1)]
]

/-- Partial product 129 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0129 : Poly :=
[
  term ((1031681106400 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-515840553200 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-1031681106400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((515840553200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 2)],
  term ((515840553200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1031681106400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1)],
  term ((1031681106400 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-515840553200 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0129_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0129
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0130 : Poly :=
[
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

/-- Partial product 130 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0130 : Poly :=
[
  term ((-351312737600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((175656368800 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((351312737600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 2)],
  term ((351312737600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 3)],
  term ((-351312737600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0130_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0130
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0131 : Poly :=
[
  term ((-24848129210348263715 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 131 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0131 : Poly :=
[
  term ((49696258420696527430 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-24848129210348263715 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-49696258420696527430 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((24848129210348263715 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((24848129210348263715 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 3)],
  term ((-49696258420696527430 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((49696258420696527430 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-24848129210348263715 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0131_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0131
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0132 : Poly :=
[
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 132 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0132 : Poly :=
[
  term ((-16922795702999751620 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((16922795702999751620 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((16922795702999751620 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 3)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 3), (15, 1)],
  term ((-16922795702999751620 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0132_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0132
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0133 : Poly :=
[
  term ((-37057293846352310945 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 133 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0133 : Poly :=
[
  term ((74114587692704621890 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-37057293846352310945 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-74114587692704621890 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-74114587692704621890 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((37057293846352310945 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((37057293846352310945 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 3)],
  term ((74114587692704621890 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-37057293846352310945 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0133_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0133
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0134 : Poly :=
[
  term ((-329511895204 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 134 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0134 : Poly :=
[
  term ((659023790408 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-329511895204 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-659023790408 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((329511895204 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((329511895204 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (15, 3)],
  term ((-659023790408 : Rat) / 25734207) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((659023790408 : Rat) / 25734207) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-329511895204 : Rat) / 25734207) [(1, 3), (2, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0134_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0134
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0135 : Poly :=
[
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (14, 1), (15, 1)]
]

/-- Partial product 135 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0135 : Poly :=
[
  term ((-32736913072 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((32736913072 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((32736913072 : Rat) / 25734207) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (14, 1), (15, 3)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (14, 3), (15, 1)],
  term ((-32736913072 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(1, 3), (2, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0135_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0135
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0136 : Poly :=
[
  term ((-299476344172 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 136 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0136 : Poly :=
[
  term ((598952688344 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-299476344172 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-598952688344 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-598952688344 : Rat) / 25734207) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((299476344172 : Rat) / 25734207) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((299476344172 : Rat) / 25734207) [(1, 1), (2, 1), (15, 3)],
  term ((598952688344 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-299476344172 : Rat) / 25734207) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0136_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0136
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0137 : Poly :=
[
  term ((-154579692800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)]
]

/-- Partial product 137 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0137 : Poly :=
[
  term ((309159385600 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-154579692800 : Rat) / 150171761) [(0, 2), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-309159385600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-309159385600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((154579692800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 2)],
  term ((154579692800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((309159385600 : Rat) / 150171761) [(1, 2), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-154579692800 : Rat) / 150171761) [(1, 3), (3, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0137_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0137
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0138 : Poly :=
[
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 138 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0138 : Poly :=
[
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(0, 2), (1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 3)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(1, 2), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(1, 3), (3, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0138_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0138
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0139 : Poly :=
[
  term ((-14520259456 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 139 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0139 : Poly :=
[
  term ((29040518912 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-29040518912 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-29040518912 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((14520259456 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((14520259456 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((29040518912 : Rat) / 25734207) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(1, 3), (3, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0139_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0139
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0140 : Poly :=
[
  term ((-124976936000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)]
]

/-- Partial product 140 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0140 : Poly :=
[
  term ((249953872000 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 2), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-249953872000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-249953872000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 2)],
  term ((124976936000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((249953872000 : Rat) / 150171761) [(1, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-124976936000 : Rat) / 150171761) [(1, 3), (3, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0140_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0140
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0141 : Poly :=
[
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 141 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0141 : Poly :=
[
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 2), (1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 3)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 2), (3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(1, 3), (3, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0141_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0141
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0142 : Poly :=
[
  term ((16761444560 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)]
]

/-- Partial product 142 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0142 : Poly :=
[
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((33522889120 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((33522889120 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((-33522889120 : Rat) / 25734207) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(1, 3), (3, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0142_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0142
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0143 : Poly :=
[
  term ((-22524642800 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (13, 1)]
]

/-- Partial product 143 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0143 : Poly :=
[
  term ((45049285600 : Rat) / 6529207) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-22524642800 : Rat) / 6529207) [(0, 2), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-45049285600 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((22524642800 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2)],
  term ((22524642800 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((-45049285600 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((45049285600 : Rat) / 6529207) [(1, 2), (3, 1), (11, 1), (13, 2)],
  term ((-22524642800 : Rat) / 6529207) [(1, 3), (3, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0143_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0143
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0144 : Poly :=
[
  term ((362444423200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (15, 1)]
]

/-- Partial product 144 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0144 : Poly :=
[
  term ((-724888846400 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((362444423200 : Rat) / 150171761) [(0, 2), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((724888846400 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((724888846400 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((-362444423200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((-362444423200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-724888846400 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((362444423200 : Rat) / 150171761) [(1, 3), (3, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0144_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0144
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0145 : Poly :=
[
  term ((-1085015963245405235 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 145 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0145 : Poly :=
[
  term ((2170031926490810470 : Rat) / 56007988161283) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1085015963245405235 : Rat) / 56007988161283) [(0, 2), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2170031926490810470 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1085015963245405235 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((1085015963245405235 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 3)],
  term ((-2170031926490810470 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (13, 2), (15, 2)],
  term ((2170031926490810470 : Rat) / 56007988161283) [(1, 2), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1085015963245405235 : Rat) / 56007988161283) [(1, 3), (3, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0145_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0145
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0146 : Poly :=
[
  term ((17459010935404192090 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 2)]
]

/-- Partial product 146 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0146 : Poly :=
[
  term ((-34918021870808384180 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((17459010935404192090 : Rat) / 1288183727709509) [(0, 2), (1, 1), (3, 1), (11, 2), (15, 2)],
  term ((34918021870808384180 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((34918021870808384180 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 3)],
  term ((-17459010935404192090 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (14, 2), (15, 2)],
  term ((-17459010935404192090 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 4)],
  term ((-34918021870808384180 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((17459010935404192090 : Rat) / 1288183727709509) [(1, 3), (3, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0146_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0146
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0147 : Poly :=
[
  term ((-178768166108 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 147 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0147 : Poly :=
[
  term ((357536332216 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-178768166108 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-357536332216 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((178768166108 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((178768166108 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-357536332216 : Rat) / 25734207) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((357536332216 : Rat) / 25734207) [(1, 2), (3, 1), (13, 2), (15, 1)],
  term ((-178768166108 : Rat) / 25734207) [(1, 3), (3, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0147_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0147
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0148 : Poly :=
[
  term ((23841401144 : Rat) / 25734207) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 148 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0148 : Poly :=
[
  term ((-47682802288 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (12, 1), (15, 2)],
  term ((23841401144 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (15, 2)],
  term ((47682802288 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((47682802288 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-23841401144 : Rat) / 25734207) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-23841401144 : Rat) / 25734207) [(1, 1), (3, 1), (15, 4)],
  term ((-47682802288 : Rat) / 25734207) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((23841401144 : Rat) / 25734207) [(1, 3), (3, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0148_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0148
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0149 : Poly :=
[
  term ((6109752000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1)]
]

/-- Partial product 149 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0149 : Poly :=
[
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (1, 1), (3, 2), (11, 1), (12, 1)],
  term ((6109752000 : Rat) / 8833633) [(0, 2), (1, 1), (3, 2), (11, 1)],
  term ((12219504000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1)],
  term ((12219504000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-6109752000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (14, 2)],
  term ((-6109752000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((-12219504000 : Rat) / 8833633) [(1, 2), (3, 2), (11, 1), (13, 1)],
  term ((6109752000 : Rat) / 8833633) [(1, 3), (3, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0149_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0149
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0150 : Poly :=
[
  term ((294307817013219900 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (15, 1)]
]

/-- Partial product 150 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0150 : Poly :=
[
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 2), (1, 1), (3, 2), (11, 2), (15, 1)],
  term ((588615634026439800 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((588615634026439800 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (13, 1), (15, 2)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (14, 2), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (15, 3)],
  term ((-588615634026439800 : Rat) / 75775513394677) [(1, 2), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(1, 3), (3, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0150_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0150
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0151 : Poly :=
[
  term ((1322644080 : Rat) / 8578069) [(1, 1), (3, 2), (15, 1)]
]

/-- Partial product 151 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0151 : Poly :=
[
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 2), (1, 1), (3, 2), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-1322644080 : Rat) / 8578069) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(1, 1), (3, 2), (15, 3)],
  term ((-2645288160 : Rat) / 8578069) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(1, 3), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0151_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0151
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0152 : Poly :=
[
  term ((3263921200 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1)]
]

/-- Partial product 152 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0152 : Poly :=
[
  term ((-6527842400 : Rat) / 8833633) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1), (12, 1)],
  term ((3263921200 : Rat) / 8833633) [(0, 2), (1, 1), (4, 1), (10, 1), (11, 1)],
  term ((6527842400 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((6527842400 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3263921200 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 2)],
  term ((-3263921200 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((-6527842400 : Rat) / 8833633) [(1, 2), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((3263921200 : Rat) / 8833633) [(1, 3), (4, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0152_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0152
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0153 : Poly :=
[
  term ((157223652167087815 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 153 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0153 : Poly :=
[
  term ((-314447304334175630 : Rat) / 75775513394677) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((157223652167087815 : Rat) / 75775513394677) [(0, 2), (1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((314447304334175630 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((314447304334175630 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 3)],
  term ((-314447304334175630 : Rat) / 75775513394677) [(1, 2), (4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((157223652167087815 : Rat) / 75775513394677) [(1, 3), (4, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0153_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0153
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0154 : Poly :=
[
  term ((13846265908 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (15, 1)]
]

/-- Partial product 154 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0154 : Poly :=
[
  term ((-27692531816 : Rat) / 25734207) [(0, 1), (1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((13846265908 : Rat) / 25734207) [(0, 2), (1, 1), (4, 1), (10, 1), (15, 1)],
  term ((27692531816 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((27692531816 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((-13846265908 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (14, 2), (15, 1)],
  term ((-13846265908 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (15, 3)],
  term ((-27692531816 : Rat) / 25734207) [(1, 2), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((13846265908 : Rat) / 25734207) [(1, 3), (4, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0154_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0154
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0155 : Poly :=
[
  term ((43597958000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 155 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0155 : Poly :=
[
  term ((-87195916000 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1)],
  term ((43597958000 : Rat) / 150171761) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((87195916000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((87195916000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43597958000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((-43597958000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((-87195916000 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((43597958000 : Rat) / 150171761) [(1, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0155_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0155
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0156 : Poly :=
[
  term ((2100121223449666475 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 156 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0156 : Poly :=
[
  term ((-4200242446899332950 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((2100121223449666475 : Rat) / 1288183727709509) [(0, 2), (1, 1), (4, 1), (11, 2), (15, 1)],
  term ((4200242446899332950 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4200242446899332950 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2100121223449666475 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2100121223449666475 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 3)],
  term ((-4200242446899332950 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((2100121223449666475 : Rat) / 1288183727709509) [(1, 3), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0156_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0156
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0157 : Poly :=
[
  term ((-20812341500 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 157 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0157 : Poly :=
[
  term ((41624683000 : Rat) / 25734207) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-20812341500 : Rat) / 25734207) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((-41624683000 : Rat) / 25734207) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-41624683000 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((20812341500 : Rat) / 25734207) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((20812341500 : Rat) / 25734207) [(1, 1), (4, 1), (15, 3)],
  term ((41624683000 : Rat) / 25734207) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-20812341500 : Rat) / 25734207) [(1, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0157_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0157
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0158 : Poly :=
[
  term ((94047051200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 158 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0158 : Poly :=
[
  term ((-188094102400 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((94047051200 : Rat) / 150171761) [(0, 2), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((188094102400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-94047051200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((-94047051200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((188094102400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-188094102400 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((94047051200 : Rat) / 150171761) [(1, 3), (5, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0158_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0158
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0159 : Poly :=
[
  term ((2860957744 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 159 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0159 : Poly :=
[
  term ((-5721915488 : Rat) / 8578069) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((2860957744 : Rat) / 8578069) [(0, 2), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((5721915488 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5721915488 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2860957744 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2860957744 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (15, 3)],
  term ((-5721915488 : Rat) / 8578069) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((2860957744 : Rat) / 8578069) [(1, 3), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0159_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0159
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0160 : Poly :=
[
  term ((60532641600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)]
]

/-- Partial product 160 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0160 : Poly :=
[
  term ((-121065283200 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 2), (12, 1)],
  term ((60532641600 : Rat) / 150171761) [(0, 2), (1, 1), (5, 1), (11, 2)],
  term ((121065283200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (12, 1), (14, 1)],
  term ((121065283200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-60532641600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (14, 2)],
  term ((-60532641600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((-121065283200 : Rat) / 150171761) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((60532641600 : Rat) / 150171761) [(1, 3), (5, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0160_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0160
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0161 : Poly :=
[
  term ((4530262821666496940 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 161 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0161 : Poly :=
[
  term ((-9060525643332993880 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((4530262821666496940 : Rat) / 1288183727709509) [(0, 2), (1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((9060525643332993880 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4530262821666496940 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-4530262821666496940 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 3)],
  term ((9060525643332993880 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 2), (15, 2)],
  term ((-9060525643332993880 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((4530262821666496940 : Rat) / 1288183727709509) [(1, 3), (5, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0161_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0161
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0162 : Poly :=
[
  term ((2915867879308296420 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (15, 1)]
]

/-- Partial product 162 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0162 : Poly :=
[
  term ((-5831735758616592840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 3), (12, 1), (15, 1)],
  term ((2915867879308296420 : Rat) / 1288183727709509) [(0, 2), (1, 1), (5, 1), (11, 3), (15, 1)],
  term ((5831735758616592840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((5831735758616592840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (13, 1), (15, 2)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (14, 2), (15, 1)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (15, 3)],
  term ((-5831735758616592840 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 3), (13, 1), (15, 1)],
  term ((2915867879308296420 : Rat) / 1288183727709509) [(1, 3), (5, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0162_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0162
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0163 : Poly :=
[
  term ((5937386224 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 163 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0163 : Poly :=
[
  term ((-11874772448 : Rat) / 25734207) [(0, 1), (1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((5937386224 : Rat) / 25734207) [(0, 2), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((11874772448 : Rat) / 25734207) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5937386224 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5937386224 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((11874772448 : Rat) / 25734207) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-11874772448 : Rat) / 25734207) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term ((5937386224 : Rat) / 25734207) [(1, 3), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0163_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0163
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0164 : Poly :=
[
  term (288 : Rat) [(1, 1), (7, 1)]
]

/-- Partial product 164 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0164 : Poly :=
[
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term (288 : Rat) [(0, 2), (1, 1), (7, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (-288 : Rat) [(1, 1), (7, 1), (14, 2)],
  term (-288 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-576 : Rat) [(1, 2), (7, 1), (13, 1)],
  term (288 : Rat) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0164_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0164
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0165 : Poly :=
[
  term (-96 : Rat) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 165 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0165 : Poly :=
[
  term (192 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term (-96 : Rat) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term (96 : Rat) [(1, 1), (7, 1), (10, 1), (14, 2)],
  term (96 : Rat) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term (192 : Rat) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term (-96 : Rat) [(1, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0165_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0165
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0166 : Poly :=
[
  term (96 : Rat) [(1, 1), (7, 1), (10, 2)]
]

/-- Partial product 166 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0166 : Poly :=
[
  term (-192 : Rat) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (7, 1), (10, 2)],
  term (192 : Rat) [(1, 1), (7, 1), (10, 2), (12, 1), (14, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (10, 2), (14, 2)],
  term (-96 : Rat) [(1, 1), (7, 1), (10, 2), (15, 2)],
  term (-192 : Rat) [(1, 2), (7, 1), (10, 2), (13, 1)],
  term (96 : Rat) [(1, 3), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0166_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0166
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0167 : Poly :=
[
  term ((124976936000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 167 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0167 : Poly :=
[
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((249953872000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-124976936000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((-124976936000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((249953872000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-249953872000 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (13, 2)],
  term ((124976936000 : Rat) / 150171761) [(1, 3), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0167_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0167
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0168 : Poly :=
[
  term (192 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 168 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0168 : Poly :=
[
  term (-384 : Rat) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term (192 : Rat) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term (-192 : Rat) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term (-384 : Rat) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term (192 : Rat) [(1, 3), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0168_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0168
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0169 : Poly :=
[
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 169 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0169 : Poly :=
[
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 2), (1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 2), (15, 2)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 3), (7, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0169_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0169
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0170 : Poly :=
[
  term (-576 : Rat) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 170 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0170 : Poly :=
[
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term (-576 : Rat) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term (-1152 : Rat) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term (576 : Rat) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term (-1152 : Rat) [(1, 1), (7, 1), (12, 2), (14, 1)],
  term (1152 : Rat) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term (-576 : Rat) [(1, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0170_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0170
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0171 : Poly :=
[
  term ((-21702412304 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 171 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0171 : Poly :=
[
  term ((43404824608 : Rat) / 25734207) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21702412304 : Rat) / 25734207) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-43404824608 : Rat) / 25734207) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((21702412304 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((21702412304 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((-43404824608 : Rat) / 25734207) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((43404824608 : Rat) / 25734207) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-21702412304 : Rat) / 25734207) [(1, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0171_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0171
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0172 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 172 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0172 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 2), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 3), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0172_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0172
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0173 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 173 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0173 : Poly :=
[
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((-1721558592 : Rat) / 8578069) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 3), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0173_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0173
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0174 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)]
]

/-- Partial product 174 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0174 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 2), (1, 1), (9, 1), (11, 2)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (14, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((27092083200 : Rat) / 150171761) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((-13546041600 : Rat) / 150171761) [(1, 3), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0174_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0174
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0175 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 175 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0175 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 2), (1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 3)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 2), (15, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 3), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0175_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0175
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0176 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (15, 1)]
]

/-- Partial product 176 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0176 : Poly :=
[
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 2), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (13, 1), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (14, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (15, 3)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 3), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0176_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0176
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0177 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 177 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0177 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0177_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0177
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0178 : Poly :=
[
  term ((18906924720 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 178 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0178 : Poly :=
[
  term ((-37813849440 : Rat) / 8833633) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((18906924720 : Rat) / 8833633) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((37813849440 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((37813849440 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18906924720 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-18906924720 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-37813849440 : Rat) / 8833633) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((18906924720 : Rat) / 8833633) [(1, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0178_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0178
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0179 : Poly :=
[
  term ((910749853803637839 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 179 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0179 : Poly :=
[
  term ((-1821499707607275678 : Rat) / 75775513394677) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((910749853803637839 : Rat) / 75775513394677) [(0, 2), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((1821499707607275678 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1821499707607275678 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-910749853803637839 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-910749853803637839 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((-1821499707607275678 : Rat) / 75775513394677) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((910749853803637839 : Rat) / 75775513394677) [(1, 3), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0179_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0179
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0180 : Poly :=
[
  term ((17204868151 : Rat) / 34312276) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 180 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0180 : Poly :=
[
  term ((-17204868151 : Rat) / 17156138) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((17204868151 : Rat) / 34312276) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((17204868151 : Rat) / 17156138) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((17204868151 : Rat) / 17156138) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-17204868151 : Rat) / 34312276) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-17204868151 : Rat) / 34312276) [(1, 1), (10, 1), (15, 3)],
  term ((-17204868151 : Rat) / 17156138) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((17204868151 : Rat) / 34312276) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0180_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0180
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0181 : Poly :=
[
  term ((-229870109440 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1)]
]

/-- Partial product 181 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0181 : Poly :=
[
  term ((459740218880 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-229870109440 : Rat) / 150171761) [(0, 2), (1, 1), (10, 2), (11, 1)],
  term ((-459740218880 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-459740218880 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((229870109440 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (14, 2)],
  term ((229870109440 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((459740218880 : Rat) / 150171761) [(1, 2), (10, 2), (11, 1), (13, 1)],
  term ((-229870109440 : Rat) / 150171761) [(1, 3), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0181_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0181
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0182 : Poly :=
[
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (15, 1)]
]

/-- Partial product 182 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0182 : Poly :=
[
  term ((22145766343994437856 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(0, 2), (1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-22145766343994437856 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-22145766343994437856 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (15, 3)],
  term ((22145766343994437856 : Rat) / 1288183727709509) [(1, 2), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(1, 3), (10, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0182_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0182
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0183 : Poly :=
[
  term ((-80598095189 : Rat) / 102936828) [(1, 1), (10, 2), (15, 1)]
]

/-- Partial product 183 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0183 : Poly :=
[
  term ((80598095189 : Rat) / 51468414) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-80598095189 : Rat) / 102936828) [(0, 2), (1, 1), (10, 2), (15, 1)],
  term ((-80598095189 : Rat) / 51468414) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-80598095189 : Rat) / 51468414) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((80598095189 : Rat) / 102936828) [(1, 1), (10, 2), (14, 2), (15, 1)],
  term ((80598095189 : Rat) / 102936828) [(1, 1), (10, 2), (15, 3)],
  term ((80598095189 : Rat) / 51468414) [(1, 2), (10, 2), (13, 1), (15, 1)],
  term ((-80598095189 : Rat) / 102936828) [(1, 3), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0183_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0183
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0184 : Poly :=
[
  term ((-15928686120 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 184 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0184 : Poly :=
[
  term ((31857372240 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-15928686120 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1)],
  term ((-31857372240 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-31857372240 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((15928686120 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2)],
  term ((15928686120 : Rat) / 150171761) [(1, 1), (11, 1), (15, 2)],
  term ((31857372240 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-15928686120 : Rat) / 150171761) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0184_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0184
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0185 : Poly :=
[
  term ((305811940440 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 185 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0185 : Poly :=
[
  term ((-611623880880 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((305811940440 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((611623880880 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-305811940440 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-305811940440 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((611623880880 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-611623880880 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((305811940440 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0185_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0185
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0186 : Poly :=
[
  term ((62488516600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 186 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0186 : Poly :=
[
  term ((-124977033200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1)],
  term ((62488516600 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((124977033200 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-62488516600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-62488516600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 3)],
  term ((124977033200 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (14, 2)],
  term ((-124977033200 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((62488516600 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0186_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0186
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0187 : Poly :=
[
  term ((301108936200 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2)]
]

/-- Partial product 187 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0187 : Poly :=
[
  term ((-602217872400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 3)],
  term ((301108936200 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 2)],
  term ((602217872400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-301108936200 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (14, 2)],
  term ((-301108936200 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((602217872400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 3), (14, 1)],
  term ((-602217872400 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (13, 1)],
  term ((301108936200 : Rat) / 150171761) [(1, 3), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0187_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0187
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0188 : Poly :=
[
  term ((3083969105733730640 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 188 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0188 : Poly :=
[
  term ((-6167938211467461280 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((3083969105733730640 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((6167938211467461280 : Rat) / 1288183727709509) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3083969105733730640 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3083969105733730640 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((6167938211467461280 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-6167938211467461280 : Rat) / 1288183727709509) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((3083969105733730640 : Rat) / 1288183727709509) [(1, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0188_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0188
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0189 : Poly :=
[
  term ((-89618357000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)]
]

/-- Partial product 189 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0189 : Poly :=
[
  term ((179236714000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-89618357000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (13, 2)],
  term ((-179236714000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((89618357000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((89618357000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-179236714000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((179236714000 : Rat) / 150171761) [(1, 2), (11, 1), (13, 3)],
  term ((-89618357000 : Rat) / 150171761) [(1, 3), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0189_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0189
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0190 : Poly :=
[
  term ((-44499601800 : Rat) / 150171761) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 190 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0190 : Poly :=
[
  term ((88999203600 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-44499601800 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-88999203600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-88999203600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((44499601800 : Rat) / 150171761) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((44499601800 : Rat) / 150171761) [(1, 1), (11, 1), (14, 3)],
  term ((88999203600 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-44499601800 : Rat) / 150171761) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0190_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0190
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0191 : Poly :=
[
  term ((-1243499100 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2)]
]

/-- Partial product 191 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0191 : Poly :=
[
  term ((2486998200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1243499100 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((-2486998200 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 3)],
  term ((-2486998200 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1243499100 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((1243499100 : Rat) / 150171761) [(1, 1), (11, 1), (14, 4)],
  term ((2486998200 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-1243499100 : Rat) / 150171761) [(1, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0191_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0191
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0192 : Poly :=
[
  term ((-3787440458854100631 : Rat) / 2576367455419018) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 192 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0192 : Poly :=
[
  term ((3787440458854100631 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3787440458854100631 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((-3787440458854100631 : Rat) / 1288183727709509) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3787440458854100631 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((3787440458854100631 : Rat) / 2576367455419018) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((3787440458854100631 : Rat) / 2576367455419018) [(1, 1), (11, 1), (15, 4)],
  term ((3787440458854100631 : Rat) / 1288183727709509) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-3787440458854100631 : Rat) / 2576367455419018) [(1, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0192_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0192
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0193 : Poly :=
[
  term ((102036702318813385 : Rat) / 43667245007102) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 193 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0193 : Poly :=
[
  term ((-102036702318813385 : Rat) / 21833622503551) [(0, 1), (1, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((102036702318813385 : Rat) / 43667245007102) [(0, 2), (1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((102036702318813385 : Rat) / 21833622503551) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-102036702318813385 : Rat) / 43667245007102) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((-102036702318813385 : Rat) / 43667245007102) [(1, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((102036702318813385 : Rat) / 21833622503551) [(1, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((-102036702318813385 : Rat) / 21833622503551) [(1, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((102036702318813385 : Rat) / 43667245007102) [(1, 3), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0193_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0193
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0194 : Poly :=
[
  term ((29462028772190171631 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 194 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0194 : Poly :=
[
  term ((-29462028772190171631 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((29462028772190171631 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((29462028772190171631 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-29462028772190171631 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-29462028772190171631 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (15, 3)],
  term ((29462028772190171631 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-29462028772190171631 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((29462028772190171631 : Rat) / 2576367455419018) [(1, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0194_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0194
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0195 : Poly :=
[
  term ((29008939706945521005 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 195 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0195 : Poly :=
[
  term ((-29008939706945521005 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 3), (15, 1)],
  term ((29008939706945521005 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((29008939706945521005 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (13, 1), (15, 2)],
  term ((-29008939706945521005 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((-29008939706945521005 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 2), (15, 3)],
  term ((29008939706945521005 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 3), (14, 1), (15, 1)],
  term ((-29008939706945521005 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((29008939706945521005 : Rat) / 2576367455419018) [(1, 3), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0195_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0195
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0196 : Poly :=
[
  term ((23493300000 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)]
]

/-- Partial product 196 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0196 : Poly :=
[
  term ((-46986600000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1)],
  term ((23493300000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 2), (13, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-46986600000 : Rat) / 150171761) [(1, 2), (11, 2), (13, 2)],
  term ((23493300000 : Rat) / 150171761) [(1, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0196_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0196
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0197 : Poly :=
[
  term ((31497573179820712157 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 197 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0197 : Poly :=
[
  term ((-31497573179820712157 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((31497573179820712157 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (13, 1), (15, 2)],
  term ((31497573179820712157 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-31497573179820712157 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-31497573179820712157 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 4)],
  term ((31497573179820712157 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (15, 3)],
  term ((-31497573179820712157 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 2), (15, 2)],
  term ((31497573179820712157 : Rat) / 2576367455419018) [(1, 3), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0197_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0197
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0198 : Poly :=
[
  term ((-8633863702808694925 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 198 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0198 : Poly :=
[
  term ((8633863702808694925 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-8633863702808694925 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-8633863702808694925 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((8633863702808694925 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((8633863702808694925 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (15, 3)],
  term ((-8633863702808694925 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 3), (15, 2)],
  term ((8633863702808694925 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 3), (15, 1)],
  term ((-8633863702808694925 : Rat) / 2576367455419018) [(1, 3), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0198_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0198
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 27. -/
def rs_R013_ueqv_R013YNNN_coefficient_27_0199 : Poly :=
[
  term ((-4287107124385916445 : Rat) / 2576367455419018) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 199 for generator 27. -/
def rs_R013_ueqv_R013YNNN_partial_27_0199 : Poly :=
[
  term ((4287107124385916445 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4287107124385916445 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4287107124385916445 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-4287107124385916445 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((4287107124385916445 : Rat) / 2576367455419018) [(1, 1), (11, 2), (14, 1), (15, 3)],
  term ((4287107124385916445 : Rat) / 2576367455419018) [(1, 1), (11, 2), (14, 3), (15, 1)],
  term ((4287107124385916445 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4287107124385916445 : Rat) / 2576367455419018) [(1, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 27. -/
theorem rs_R013_ueqv_R013YNNN_partial_27_0199_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_27_0199
        rs_R013_ueqv_R013YNNN_generator_27_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_27_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_27_0100_0199 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_27_0100,
  rs_R013_ueqv_R013YNNN_partial_27_0101,
  rs_R013_ueqv_R013YNNN_partial_27_0102,
  rs_R013_ueqv_R013YNNN_partial_27_0103,
  rs_R013_ueqv_R013YNNN_partial_27_0104,
  rs_R013_ueqv_R013YNNN_partial_27_0105,
  rs_R013_ueqv_R013YNNN_partial_27_0106,
  rs_R013_ueqv_R013YNNN_partial_27_0107,
  rs_R013_ueqv_R013YNNN_partial_27_0108,
  rs_R013_ueqv_R013YNNN_partial_27_0109,
  rs_R013_ueqv_R013YNNN_partial_27_0110,
  rs_R013_ueqv_R013YNNN_partial_27_0111,
  rs_R013_ueqv_R013YNNN_partial_27_0112,
  rs_R013_ueqv_R013YNNN_partial_27_0113,
  rs_R013_ueqv_R013YNNN_partial_27_0114,
  rs_R013_ueqv_R013YNNN_partial_27_0115,
  rs_R013_ueqv_R013YNNN_partial_27_0116,
  rs_R013_ueqv_R013YNNN_partial_27_0117,
  rs_R013_ueqv_R013YNNN_partial_27_0118,
  rs_R013_ueqv_R013YNNN_partial_27_0119,
  rs_R013_ueqv_R013YNNN_partial_27_0120,
  rs_R013_ueqv_R013YNNN_partial_27_0121,
  rs_R013_ueqv_R013YNNN_partial_27_0122,
  rs_R013_ueqv_R013YNNN_partial_27_0123,
  rs_R013_ueqv_R013YNNN_partial_27_0124,
  rs_R013_ueqv_R013YNNN_partial_27_0125,
  rs_R013_ueqv_R013YNNN_partial_27_0126,
  rs_R013_ueqv_R013YNNN_partial_27_0127,
  rs_R013_ueqv_R013YNNN_partial_27_0128,
  rs_R013_ueqv_R013YNNN_partial_27_0129,
  rs_R013_ueqv_R013YNNN_partial_27_0130,
  rs_R013_ueqv_R013YNNN_partial_27_0131,
  rs_R013_ueqv_R013YNNN_partial_27_0132,
  rs_R013_ueqv_R013YNNN_partial_27_0133,
  rs_R013_ueqv_R013YNNN_partial_27_0134,
  rs_R013_ueqv_R013YNNN_partial_27_0135,
  rs_R013_ueqv_R013YNNN_partial_27_0136,
  rs_R013_ueqv_R013YNNN_partial_27_0137,
  rs_R013_ueqv_R013YNNN_partial_27_0138,
  rs_R013_ueqv_R013YNNN_partial_27_0139,
  rs_R013_ueqv_R013YNNN_partial_27_0140,
  rs_R013_ueqv_R013YNNN_partial_27_0141,
  rs_R013_ueqv_R013YNNN_partial_27_0142,
  rs_R013_ueqv_R013YNNN_partial_27_0143,
  rs_R013_ueqv_R013YNNN_partial_27_0144,
  rs_R013_ueqv_R013YNNN_partial_27_0145,
  rs_R013_ueqv_R013YNNN_partial_27_0146,
  rs_R013_ueqv_R013YNNN_partial_27_0147,
  rs_R013_ueqv_R013YNNN_partial_27_0148,
  rs_R013_ueqv_R013YNNN_partial_27_0149,
  rs_R013_ueqv_R013YNNN_partial_27_0150,
  rs_R013_ueqv_R013YNNN_partial_27_0151,
  rs_R013_ueqv_R013YNNN_partial_27_0152,
  rs_R013_ueqv_R013YNNN_partial_27_0153,
  rs_R013_ueqv_R013YNNN_partial_27_0154,
  rs_R013_ueqv_R013YNNN_partial_27_0155,
  rs_R013_ueqv_R013YNNN_partial_27_0156,
  rs_R013_ueqv_R013YNNN_partial_27_0157,
  rs_R013_ueqv_R013YNNN_partial_27_0158,
  rs_R013_ueqv_R013YNNN_partial_27_0159,
  rs_R013_ueqv_R013YNNN_partial_27_0160,
  rs_R013_ueqv_R013YNNN_partial_27_0161,
  rs_R013_ueqv_R013YNNN_partial_27_0162,
  rs_R013_ueqv_R013YNNN_partial_27_0163,
  rs_R013_ueqv_R013YNNN_partial_27_0164,
  rs_R013_ueqv_R013YNNN_partial_27_0165,
  rs_R013_ueqv_R013YNNN_partial_27_0166,
  rs_R013_ueqv_R013YNNN_partial_27_0167,
  rs_R013_ueqv_R013YNNN_partial_27_0168,
  rs_R013_ueqv_R013YNNN_partial_27_0169,
  rs_R013_ueqv_R013YNNN_partial_27_0170,
  rs_R013_ueqv_R013YNNN_partial_27_0171,
  rs_R013_ueqv_R013YNNN_partial_27_0172,
  rs_R013_ueqv_R013YNNN_partial_27_0173,
  rs_R013_ueqv_R013YNNN_partial_27_0174,
  rs_R013_ueqv_R013YNNN_partial_27_0175,
  rs_R013_ueqv_R013YNNN_partial_27_0176,
  rs_R013_ueqv_R013YNNN_partial_27_0177,
  rs_R013_ueqv_R013YNNN_partial_27_0178,
  rs_R013_ueqv_R013YNNN_partial_27_0179,
  rs_R013_ueqv_R013YNNN_partial_27_0180,
  rs_R013_ueqv_R013YNNN_partial_27_0181,
  rs_R013_ueqv_R013YNNN_partial_27_0182,
  rs_R013_ueqv_R013YNNN_partial_27_0183,
  rs_R013_ueqv_R013YNNN_partial_27_0184,
  rs_R013_ueqv_R013YNNN_partial_27_0185,
  rs_R013_ueqv_R013YNNN_partial_27_0186,
  rs_R013_ueqv_R013YNNN_partial_27_0187,
  rs_R013_ueqv_R013YNNN_partial_27_0188,
  rs_R013_ueqv_R013YNNN_partial_27_0189,
  rs_R013_ueqv_R013YNNN_partial_27_0190,
  rs_R013_ueqv_R013YNNN_partial_27_0191,
  rs_R013_ueqv_R013YNNN_partial_27_0192,
  rs_R013_ueqv_R013YNNN_partial_27_0193,
  rs_R013_ueqv_R013YNNN_partial_27_0194,
  rs_R013_ueqv_R013YNNN_partial_27_0195,
  rs_R013_ueqv_R013YNNN_partial_27_0196,
  rs_R013_ueqv_R013YNNN_partial_27_0197,
  rs_R013_ueqv_R013YNNN_partial_27_0198,
  rs_R013_ueqv_R013YNNN_partial_27_0199
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_27_0100_0199 : Poly :=
[
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((1538599127200 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-351312737600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((1031681106400 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-16922795702999751620 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((74114587692704621890 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((49696258420696527430 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-32736913072 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((598952688344 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((659023790408 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 2), (15, 1)],
  term ((309159385600 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((249953872000 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((45049285600 : Rat) / 6529207) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-724888846400 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((2170031926490810470 : Rat) / 56007988161283) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-34918021870808384180 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1), (15, 2)],
  term ((357536332216 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-47682802288 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-12219504000 : Rat) / 8833633) [(0, 1), (1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-588615634026439800 : Rat) / 75775513394677) [(0, 1), (1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2645288160 : Rat) / 8578069) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-6527842400 : Rat) / 8833633) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 1), (12, 1)],
  term ((-314447304334175630 : Rat) / 75775513394677) [(0, 1), (1, 1), (4, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-27692531816 : Rat) / 25734207) [(0, 1), (1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-87195916000 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-4200242446899332950 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((41624683000 : Rat) / 25734207) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-188094102400 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5721915488 : Rat) / 8578069) [(0, 1), (1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-121065283200 : Rat) / 150171761) [(0, 1), (1, 1), (5, 1), (11, 2), (12, 1)],
  term ((-9060525643332993880 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5831735758616592840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (5, 1), (11, 3), (12, 1), (15, 1)],
  term ((-11874772448 : Rat) / 25734207) [(0, 1), (1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term (192 : Rat) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term (-192 : Rat) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1)],
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term (-384 : Rat) [(0, 1), (1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term (-576 : Rat) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((43404824608 : Rat) / 25734207) [(0, 1), (1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term (1152 : Rat) [(0, 1), (1, 1), (7, 1), (12, 2)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-37813849440 : Rat) / 8833633) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1821499707607275678 : Rat) / 75775513394677) [(0, 1), (1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-17204868151 : Rat) / 17156138) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((459740218880 : Rat) / 150171761) [(0, 1), (1, 1), (10, 2), (11, 1), (12, 1)],
  term ((22145766343994437856 : Rat) / 1288183727709509) [(0, 1), (1, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((80598095189 : Rat) / 51468414) [(0, 1), (1, 1), (10, 2), (12, 1), (15, 1)],
  term ((31857372240 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9263335911310367344 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((976479537200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (13, 2)],
  term ((88999203600 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((2486998200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2)],
  term ((3787440458854100631 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-611623880880 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-124977033200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-602217872400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 3)],
  term ((25570106743 : Rat) / 8578069) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((9110021713773354823 : Rat) / 2576367455419018) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((497776944000 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-375506490400 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-95946729600 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-38886767937440273869 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((47037189226569467015 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((4287107124385916445 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-102036702318813385 : Rat) / 21833622503551) [(0, 1), (1, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-29462028772190171631 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-29008939706945521005 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 3), (15, 1)],
  term ((223740998880 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((447481997760 : Rat) / 150171761) [(0, 1), (1, 1), (11, 2), (13, 1), (14, 1)],
  term ((14797170357021635710 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-18088212985391160730 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((23978002011890467800 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2358417962506552020 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 3), (12, 1), (13, 1), (15, 1)],
  term ((365343825416276868 : Rat) / 21833622503551) [(0, 1), (1, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 1), (1, 1), (11, 3), (13, 1), (15, 1)],
  term ((105519584171 : Rat) / 25734207) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2)],
  term ((444694285304 : Rat) / 25734207) [(0, 1), (1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5685286744 : Rat) / 25734207) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-165809680568 : Rat) / 25734207) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((118141705120 : Rat) / 8578069) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-398621411600 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (12, 1), (13, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 1), (1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1547698849921453032 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-248888472000 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((187753245200 : Rat) / 150171761) [(0, 1), (1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-25570106743 : Rat) / 17156138) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-9110021713773354823 : Rat) / 5152734910838036) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-111870499440 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2)],
  term ((24480064800 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (12, 1)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (12, 1), (14, 1)],
  term ((3694597378809780856 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (12, 1), (15, 2)],
  term ((9044106492695580365 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-11989001005945233900 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-223740998880 : Rat) / 150171761) [(0, 1), (1, 2), (11, 2), (14, 1)],
  term ((-7398585178510817855 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((1179208981253276010 : Rat) / 1288183727709509) [(0, 1), (1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 1), (1, 2), (11, 3), (14, 1), (15, 1)],
  term ((-91335956354069217 : Rat) / 21833622503551) [(0, 1), (1, 2), (11, 3), (15, 1)],
  term ((-222347142652 : Rat) / 25734207) [(0, 1), (1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-105519584171 : Rat) / 51468414) [(0, 1), (1, 2), (12, 1), (15, 2)],
  term ((82904840284 : Rat) / 25734207) [(0, 1), (1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-59070852560 : Rat) / 8578069) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((2842643372 : Rat) / 25734207) [(0, 1), (1, 2), (15, 2)],
  term ((-497776944000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((774127902000 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((6514799673425106464 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-9110021713773354823 : Rat) / 2576367455419018) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-5387606808475737455 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 1), (11, 1), (12, 1), (14, 3), (15, 1)],
  term ((-1547698849921453032 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-797242823200 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((3095397699842906064 : Rat) / 1288183727709509) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-5450468250853803223 : Rat) / 1288183727709509) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((248888472000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-187753245200 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((-12378661743049153 : Rat) / 6589175077798) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((375506490400 : Rat) / 150171761) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-497776944000 : Rat) / 150171761) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((25570106743 : Rat) / 17156138) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((9110021713773354823 : Rat) / 5152734910838036) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((25570106743 : Rat) / 17156138) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((9110021713773354823 : Rat) / 5152734910838036) [(0, 1), (11, 1), (15, 3)],
  term ((-23944143865725783000 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((37289875747271546775 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((48960129600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((26590857519499947757 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-14814099430103978110 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-471962062560 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 2)],
  term ((-3694597378809780856 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-1973529600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (14, 3)],
  term ((-24480064800 : Rat) / 150171761) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-3694597378809780856 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 1), (15, 4)],
  term ((-38403325523760772090 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((48960129600 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2), (14, 1)],
  term ((7389194757619561712 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (14, 1), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (11, 2), (12, 2), (14, 2)],
  term ((-447481997760 : Rat) / 150171761) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-9044106492695580365 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 3)],
  term ((11989001005945233900 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-9044106492695580365 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (14, 3), (15, 1)],
  term ((-223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7182018800706910 : Rat) / 3294587538899) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((18088212985391160730 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 2), (14, 1), (15, 2)],
  term ((-23978002011890467800 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 2), (15, 2)],
  term ((223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((111870499440 : Rat) / 150171761) [(0, 1), (11, 2), (14, 2)],
  term ((7398585178510817855 : Rat) / 1288183727709509) [(0, 1), (11, 2), (14, 2), (15, 2)],
  term ((223740998880 : Rat) / 150171761) [(0, 1), (11, 2), (14, 3)],
  term ((111870499440 : Rat) / 150171761) [(0, 1), (11, 2), (15, 2)],
  term ((7398585178510817855 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 4)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2358417962506552020 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-22734494680813611222 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (14, 3), (15, 1)],
  term ((-1179208981253276010 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 1), (15, 3)],
  term ((2358417962506552020 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (11, 3), (12, 2), (14, 2), (15, 1)],
  term ((-365343825416276868 : Rat) / 21833622503551) [(0, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (13, 1), (15, 2)],
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (14, 1), (15, 3)],
  term ((91335956354069217 : Rat) / 21833622503551) [(0, 1), (11, 3), (14, 2), (15, 1)],
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 1), (11, 3), (14, 3), (15, 1)],
  term ((91335956354069217 : Rat) / 21833622503551) [(0, 1), (11, 3), (15, 3)],
  term ((-118141705120 : Rat) / 8578069) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((129385607740 : Rat) / 8578069) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((116827558481 : Rat) / 25734207) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((5685286744 : Rat) / 25734207) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((105519584171 : Rat) / 51468414) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((105519584171 : Rat) / 51468414) [(0, 1), (12, 1), (15, 4)],
  term ((-444694285304 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-105519584171 : Rat) / 25734207) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-82904840284 : Rat) / 25734207) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((59070852560 : Rat) / 8578069) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-82904840284 : Rat) / 25734207) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((182897844424 : Rat) / 25734207) [(0, 1), (13, 1), (15, 3)],
  term ((165809680568 : Rat) / 25734207) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((-118141705120 : Rat) / 8578069) [(0, 1), (13, 2), (15, 2)],
  term ((-2842643372 : Rat) / 25734207) [(0, 1), (14, 2), (15, 2)],
  term ((-2842643372 : Rat) / 25734207) [(0, 1), (15, 4)],
  term ((11131685600 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-769299563600 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-515840553200 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((175656368800 : Rat) / 150171761) [(0, 2), (1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-24848129210348263715 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((-37057293846352310945 : Rat) / 1288183727709509) [(0, 2), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-329511895204 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-299476344172 : Rat) / 25734207) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-154579692800 : Rat) / 150171761) [(0, 2), (1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(0, 2), (1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-124976936000 : Rat) / 150171761) [(0, 2), (1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 2), (1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-22524642800 : Rat) / 6529207) [(0, 2), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((362444423200 : Rat) / 150171761) [(0, 2), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-1085015963245405235 : Rat) / 56007988161283) [(0, 2), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((17459010935404192090 : Rat) / 1288183727709509) [(0, 2), (1, 1), (3, 1), (11, 2), (15, 2)],
  term ((-178768166108 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((23841401144 : Rat) / 25734207) [(0, 2), (1, 1), (3, 1), (15, 2)],
  term ((6109752000 : Rat) / 8833633) [(0, 2), (1, 1), (3, 2), (11, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 2), (1, 1), (3, 2), (11, 2), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(0, 2), (1, 1), (3, 2), (15, 1)],
  term ((3263921200 : Rat) / 8833633) [(0, 2), (1, 1), (4, 1), (10, 1), (11, 1)],
  term ((157223652167087815 : Rat) / 75775513394677) [(0, 2), (1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((13846265908 : Rat) / 25734207) [(0, 2), (1, 1), (4, 1), (10, 1), (15, 1)],
  term ((43597958000 : Rat) / 150171761) [(0, 2), (1, 1), (4, 1), (11, 1)],
  term ((2100121223449666475 : Rat) / 1288183727709509) [(0, 2), (1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-20812341500 : Rat) / 25734207) [(0, 2), (1, 1), (4, 1), (15, 1)],
  term ((94047051200 : Rat) / 150171761) [(0, 2), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((2860957744 : Rat) / 8578069) [(0, 2), (1, 1), (5, 1), (11, 1), (15, 1)],
  term ((60532641600 : Rat) / 150171761) [(0, 2), (1, 1), (5, 1), (11, 2)],
  term ((4530262821666496940 : Rat) / 1288183727709509) [(0, 2), (1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2915867879308296420 : Rat) / 1288183727709509) [(0, 2), (1, 1), (5, 1), (11, 3), (15, 1)],
  term ((5937386224 : Rat) / 25734207) [(0, 2), (1, 1), (5, 1), (13, 1), (15, 1)],
  term (288 : Rat) [(0, 2), (1, 1), (7, 1)],
  term (-96 : Rat) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (7, 1), (10, 2)],
  term ((124976936000 : Rat) / 150171761) [(0, 2), (1, 1), (7, 1), (11, 1), (13, 1)],
  term (192 : Rat) [(0, 2), (1, 1), (7, 1), (11, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 2), (1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term (-576 : Rat) [(0, 2), (1, 1), (7, 1), (12, 1)],
  term ((-21702412304 : Rat) / 25734207) [(0, 2), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 2), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((860779296 : Rat) / 8578069) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 2), (1, 1), (9, 1), (11, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 2), (1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 2), (1, 1), (9, 1), (11, 3), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((18906924720 : Rat) / 8833633) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((910749853803637839 : Rat) / 75775513394677) [(0, 2), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((17204868151 : Rat) / 34312276) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-229870109440 : Rat) / 150171761) [(0, 2), (1, 1), (10, 2), (11, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(0, 2), (1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-80598095189 : Rat) / 102936828) [(0, 2), (1, 1), (10, 2), (15, 1)],
  term ((-15928686120 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1)],
  term ((305811940440 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((62488516600 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((301108936200 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (12, 2)],
  term ((3083969105733730640 : Rat) / 1288183727709509) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-89618357000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (13, 2)],
  term ((-44499601800 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-1243499100 : Rat) / 150171761) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((-3787440458854100631 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((102036702318813385 : Rat) / 43667245007102) [(0, 2), (1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((29462028772190171631 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (12, 1), (15, 1)],
  term ((29008939706945521005 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((23493300000 : Rat) / 150171761) [(0, 2), (1, 1), (11, 2), (13, 1)],
  term ((31497573179820712157 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-8633863702808694925 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-4287107124385916445 : Rat) / 2576367455419018) [(0, 2), (1, 1), (11, 2), (14, 1), (15, 1)],
  term ((497776944000 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-375506490400 : Rat) / 150171761) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((25570106743 : Rat) / 8578069) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((9110021713773354823 : Rat) / 2576367455419018) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((797242823200 : Rat) / 150171761) [(0, 2), (11, 1), (12, 2), (13, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 2), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3095397699842906064 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 2), (15, 1)],
  term ((223740998880 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((-18088212985391160730 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((23978002011890467800 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((447481997760 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((14797170357021635710 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((-48960129600 : Rat) / 150171761) [(0, 2), (11, 2), (12, 2)],
  term ((38403325523760772090 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 2), (11, 2), (12, 2), (14, 1)],
  term ((-7389194757619561712 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 2), (15, 2)],
  term ((365343825416276868 : Rat) / 21833622503551) [(0, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((182671912708138434 : Rat) / 21833622503551) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-2358417962506552020 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 2), (15, 1)],
  term ((-165809680568 : Rat) / 25734207) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((118141705120 : Rat) / 8578069) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5685286744 : Rat) / 25734207) [(0, 2), (12, 1), (15, 2)],
  term ((444694285304 : Rat) / 25734207) [(0, 2), (12, 2), (13, 1), (15, 1)],
  term ((105519584171 : Rat) / 25734207) [(0, 2), (12, 2), (15, 2)],
  term ((-398621411600 : Rat) / 150171761) [(0, 3), (11, 1), (12, 1), (13, 1)],
  term ((8128303744 : Rat) / 8578069) [(0, 3), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1547698849921453032 : Rat) / 1288183727709509) [(0, 3), (11, 1), (12, 1), (15, 1)],
  term ((-248888472000 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1)],
  term ((187753245200 : Rat) / 150171761) [(0, 3), (11, 1), (13, 1), (14, 1)],
  term ((-25570106743 : Rat) / 17156138) [(0, 3), (11, 1), (14, 1), (15, 1)],
  term ((-9110021713773354823 : Rat) / 5152734910838036) [(0, 3), (11, 1), (15, 1)],
  term ((-111870499440 : Rat) / 150171761) [(0, 3), (11, 2)],
  term ((24480064800 : Rat) / 150171761) [(0, 3), (11, 2), (12, 1)],
  term ((-19201662761880386045 : Rat) / 1288183727709509) [(0, 3), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1973529600 : Rat) / 150171761) [(0, 3), (11, 2), (12, 1), (14, 1)],
  term ((3694597378809780856 : Rat) / 1288183727709509) [(0, 3), (11, 2), (12, 1), (15, 2)],
  term ((9044106492695580365 : Rat) / 1288183727709509) [(0, 3), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-11989001005945233900 : Rat) / 1288183727709509) [(0, 3), (11, 2), (13, 1), (15, 1)],
  term ((-223740998880 : Rat) / 150171761) [(0, 3), (11, 2), (14, 1)],
  term ((-7398585178510817855 : Rat) / 1288183727709509) [(0, 3), (11, 2), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(0, 3), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((1179208981253276010 : Rat) / 1288183727709509) [(0, 3), (11, 3), (12, 1), (15, 1)],
  term ((-182671912708138434 : Rat) / 21833622503551) [(0, 3), (11, 3), (14, 1), (15, 1)],
  term ((-91335956354069217 : Rat) / 21833622503551) [(0, 3), (11, 3), (15, 1)],
  term ((-222347142652 : Rat) / 25734207) [(0, 3), (12, 1), (13, 1), (15, 1)],
  term ((-105519584171 : Rat) / 51468414) [(0, 3), (12, 1), (15, 2)],
  term ((82904840284 : Rat) / 25734207) [(0, 3), (13, 1), (14, 1), (15, 1)],
  term ((-59070852560 : Rat) / 8578069) [(0, 3), (13, 1), (15, 1)],
  term ((2842643372 : Rat) / 25734207) [(0, 3), (15, 2)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 2)],
  term ((-11131685600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 3)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((8895511928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((-1031681106400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1538599127200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((867153290800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 2)],
  term ((515840553200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1031681106400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1)],
  term ((351312737600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1538599127200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((769299563600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (14, 3)],
  term ((769299563600 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-49696258420696527430 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-74114587692704621890 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((41770924913348015335 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((24848129210348263715 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 3)],
  term ((-49696258420696527430 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((16922795702999751620 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-74114587692704621890 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 1), (15, 2)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 3)],
  term ((37057293846352310945 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 2), (15, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (14, 3), (15, 1)],
  term ((37057293846352310945 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 3)],
  term ((-659023790408 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((-598952688344 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((362248808276 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((329511895204 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (15, 3)],
  term ((-659023790408 : Rat) / 25734207) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((32736913072 : Rat) / 25734207) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((-598952688344 : Rat) / 25734207) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (14, 1), (15, 3)],
  term ((299476344172 : Rat) / 25734207) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (14, 3), (15, 1)],
  term ((299476344172 : Rat) / 25734207) [(1, 1), (2, 1), (15, 3)],
  term ((-309159385600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-309159385600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((154579692800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 2)],
  term ((154579692800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-14892261401949586720 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (14, 2), (15, 1)],
  term ((7446130700974793360 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 3)],
  term ((-29040518912 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-29040518912 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((14520259456 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((14520259456 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-249953872000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-249953872000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 2)],
  term ((124976936000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 3)],
  term ((33522889120 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((33522889120 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((-45049285600 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((724888846400 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((22524642800 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2)],
  term ((1242955630800 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((-45049285600 : Rat) / 6529207) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((-362444423200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((-362444423200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-2170031926490810470 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((34918021870808384180 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((1085015963245405235 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((59873389025452704585 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 3)],
  term ((-2170031926490810470 : Rat) / 56007988161283) [(1, 1), (3, 1), (11, 2), (13, 2), (15, 2)],
  term ((-17459010935404192090 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (14, 2), (15, 2)],
  term ((-17459010935404192090 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 4)],
  term ((-357536332216 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((47682802288 : Rat) / 25734207) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((178768166108 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((75483656132 : Rat) / 8578069) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-357536332216 : Rat) / 25734207) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-23841401144 : Rat) / 25734207) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-23841401144 : Rat) / 25734207) [(1, 1), (3, 1), (15, 4)],
  term ((12219504000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (12, 1), (14, 1)],
  term ((12219504000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-6109752000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (14, 2)],
  term ((-6109752000 : Rat) / 8833633) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((588615634026439800 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((588615634026439800 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (13, 1), (15, 2)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (14, 2), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(1, 1), (3, 2), (11, 2), (15, 3)],
  term ((2645288160 : Rat) / 8578069) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-1322644080 : Rat) / 8578069) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(1, 1), (3, 2), (15, 3)],
  term ((6527842400 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((6527842400 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3263921200 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 2)],
  term ((-3263921200 : Rat) / 8833633) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((314447304334175630 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((314447304334175630 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-157223652167087815 : Rat) / 75775513394677) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 3)],
  term ((27692531816 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((27692531816 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((-13846265908 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (14, 2), (15, 1)],
  term ((-13846265908 : Rat) / 25734207) [(1, 1), (4, 1), (10, 1), (15, 3)],
  term ((87195916000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((87195916000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43597958000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((-43597958000 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((4200242446899332950 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4200242446899332950 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2100121223449666475 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2100121223449666475 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 3)],
  term ((-41624683000 : Rat) / 25734207) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-41624683000 : Rat) / 25734207) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((20812341500 : Rat) / 25734207) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((20812341500 : Rat) / 25734207) [(1, 1), (4, 1), (15, 3)],
  term ((188094102400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((5721915488 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-94047051200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((52528030686001568 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((188094102400 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2860957744 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2860957744 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (15, 3)],
  term ((9060525643332993880 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((121065283200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (12, 1), (14, 1)],
  term ((-4530262821666496940 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((121065283200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4530262821666496940 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 3)],
  term ((9060525643332993880 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 2), (15, 2)],
  term ((-60532641600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (14, 2)],
  term ((-60532641600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((5831735758616592840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((5831735758616592840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (13, 1), (15, 2)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (14, 2), (15, 1)],
  term ((-2915867879308296420 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (15, 3)],
  term ((11874772448 : Rat) / 25734207) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5937386224 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5937386224 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((11874772448 : Rat) / 25734207) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term (96 : Rat) [(1, 1), (7, 1), (10, 1), (14, 2)],
  term (96 : Rat) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term (192 : Rat) [(1, 1), (7, 1), (10, 2), (12, 1), (14, 1)],
  term (192 : Rat) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (10, 2), (14, 2)],
  term (-96 : Rat) [(1, 1), (7, 1), (10, 2), (15, 2)],
  term ((249953872000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124976936000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 2)],
  term ((-67310979776 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((249953872000 : Rat) / 150171761) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 3)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 2), (13, 2), (15, 2)],
  term ((-43404824608 : Rat) / 25734207) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-1152 : Rat) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term (576 : Rat) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term (-1152 : Rat) [(1, 1), (7, 1), (12, 2), (14, 1)],
  term ((21702412304 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term (576 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((21702412304 : Rat) / 25734207) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((-43404824608 : Rat) / 25734207) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term (-288 : Rat) [(1, 1), (7, 1), (14, 2)],
  term (-288 : Rat) [(1, 1), (7, 1), (15, 2)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((142330605903650112 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 3)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 2), (13, 2), (15, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (14, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (13, 1), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (14, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (15, 3)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((37813849440 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((37813849440 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18906924720 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-18906924720 : Rat) / 8833633) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((1821499707607275678 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1821499707607275678 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-910749853803637839 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-910749853803637839 : Rat) / 75775513394677) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((17204868151 : Rat) / 17156138) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((17204868151 : Rat) / 17156138) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-17204868151 : Rat) / 34312276) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-17204868151 : Rat) / 34312276) [(1, 1), (10, 1), (15, 3)],
  term ((-459740218880 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-459740218880 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((229870109440 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (14, 2)],
  term ((229870109440 : Rat) / 150171761) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-22145766343994437856 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-22145766343994437856 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (14, 2), (15, 1)],
  term ((11072883171997218928 : Rat) / 1288183727709509) [(1, 1), (10, 2), (11, 2), (15, 3)],
  term ((-80598095189 : Rat) / 51468414) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-80598095189 : Rat) / 51468414) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((80598095189 : Rat) / 102936828) [(1, 1), (10, 2), (14, 2), (15, 1)],
  term ((80598095189 : Rat) / 102936828) [(1, 1), (10, 2), (15, 3)],
  term ((7239999825672352080 : Rat) / 1288183727709509) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((611623880880 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-179236714000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-31857372240 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4323471265956546031 : Rat) / 1288183727709509) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-394811144040 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-64975514800 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (14, 3)],
  term ((-305811940440 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((602217872400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((611623880880 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-176131903000 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (14, 2)],
  term ((-301108936200 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((602217872400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 3), (14, 1)],
  term ((-88999203600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3105302747896206440 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-31857372240 : Rat) / 150171761) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6871409564587831271 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((89618357000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((6936690661480094280 : Rat) / 1288183727709509) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-179236714000 : Rat) / 150171761) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((44499601800 : Rat) / 150171761) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((15928686120 : Rat) / 150171761) [(1, 1), (11, 1), (14, 2)],
  term ((3808774101016576431 : Rat) / 2576367455419018) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((44499601800 : Rat) / 150171761) [(1, 1), (11, 1), (14, 3)],
  term ((1243499100 : Rat) / 150171761) [(1, 1), (11, 1), (14, 4)],
  term ((15928686120 : Rat) / 150171761) [(1, 1), (11, 1), (15, 2)],
  term ((3787440458854100631 : Rat) / 2576367455419018) [(1, 1), (11, 1), (15, 4)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((37517738616630701872 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((29462028772190171631 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-8633863702808694925 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-102036702318813385 : Rat) / 43667245007102) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((-38036243020962004521 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-102036702318813385 : Rat) / 43667245007102) [(1, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((-29462028772190171631 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (15, 3)],
  term ((29008939706945521005 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (13, 1), (15, 2)],
  term ((29462028772190171631 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-16968608833325541575 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((-29008939706945521005 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 2), (15, 3)],
  term ((29008939706945521005 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 3), (14, 1), (15, 1)],
  term ((-4287107124385916445 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((-31497573179820712157 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-23493300000 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-31497573179820712157 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 4)],
  term ((8633863702808694925 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((46986600000 : Rat) / 150171761) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((71629010062450119239 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (15, 3)],
  term ((-8633863702808694925 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 3), (15, 2)],
  term ((4287107124385916445 : Rat) / 2576367455419018) [(1, 1), (11, 2), (14, 1), (15, 3)],
  term ((4287107124385916445 : Rat) / 2576367455419018) [(1, 1), (11, 2), (14, 3), (15, 1)],
  term ((-22263371200 : Rat) / 150171761) [(1, 2), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(1, 2), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(1, 2), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((1031681106400 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((1538599127200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-351312737600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((49696258420696527430 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-16922795702999751620 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((74114587692704621890 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((659023790408 : Rat) / 25734207) [(1, 2), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-32736913072 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((598952688344 : Rat) / 25734207) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((309159385600 : Rat) / 150171761) [(1, 2), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((14892261401949586720 : Rat) / 1288183727709509) [(1, 2), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((29040518912 : Rat) / 25734207) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((249953872000 : Rat) / 150171761) [(1, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((12040321509338151400 : Rat) / 1288183727709509) [(1, 2), (3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-33522889120 : Rat) / 25734207) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-724888846400 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((45049285600 : Rat) / 6529207) [(1, 2), (3, 1), (11, 1), (13, 2)],
  term ((-34918021870808384180 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((2170031926490810470 : Rat) / 56007988161283) [(1, 2), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-47682802288 : Rat) / 25734207) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((357536332216 : Rat) / 25734207) [(1, 2), (3, 1), (13, 2), (15, 1)],
  term ((-12219504000 : Rat) / 8833633) [(1, 2), (3, 2), (11, 1), (13, 1)],
  term ((-588615634026439800 : Rat) / 75775513394677) [(1, 2), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2645288160 : Rat) / 8578069) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((-6527842400 : Rat) / 8833633) [(1, 2), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-314447304334175630 : Rat) / 75775513394677) [(1, 2), (4, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-27692531816 : Rat) / 25734207) [(1, 2), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-87195916000 : Rat) / 150171761) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-4200242446899332950 : Rat) / 1288183727709509) [(1, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((41624683000 : Rat) / 25734207) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-5721915488 : Rat) / 8578069) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-188094102400 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((-121065283200 : Rat) / 150171761) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((-9060525643332993880 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-5831735758616592840 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 3), (13, 1), (15, 1)],
  term ((-11874772448 : Rat) / 25734207) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term (192 : Rat) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (10, 2), (13, 1)],
  term (-384 : Rat) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-249953872000 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (13, 2)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (13, 2), (15, 1)],
  term (1152 : Rat) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term (-576 : Rat) [(1, 2), (7, 1), (13, 1)],
  term ((43404824608 : Rat) / 25734207) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((27092083200 : Rat) / 150171761) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((-37813849440 : Rat) / 8833633) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-1821499707607275678 : Rat) / 75775513394677) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-17204868151 : Rat) / 17156138) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((459740218880 : Rat) / 150171761) [(1, 2), (10, 2), (11, 1), (13, 1)],
  term ((22145766343994437856 : Rat) / 1288183727709509) [(1, 2), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((80598095189 : Rat) / 51468414) [(1, 2), (10, 2), (13, 1), (15, 1)],
  term ((-611623880880 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-124977033200 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-602217872400 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (13, 1)],
  term ((31857372240 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((88999203600 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((2486998200 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((3787440458854100631 : Rat) / 1288183727709509) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-6167938211467461280 : Rat) / 1288183727709509) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((179236714000 : Rat) / 150171761) [(1, 2), (11, 1), (13, 3)],
  term ((-102036702318813385 : Rat) / 21833622503551) [(1, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-29462028772190171631 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-29008939706945521005 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((4287107124385916445 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-46986600000 : Rat) / 150171761) [(1, 2), (11, 2), (13, 2)],
  term ((-31497573179820712157 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 2), (15, 2)],
  term ((8633863702808694925 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 3), (15, 1)],
  term ((11131685600 : Rat) / 150171761) [(1, 3), (2, 1), (4, 1), (11, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(1, 3), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(1, 3), (2, 1), (4, 1), (15, 1)],
  term ((-769299563600 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1)],
  term ((-515840553200 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1), (12, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 3), (2, 1), (11, 1), (14, 1)],
  term ((-24848129210348263715 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((-37057293846352310945 : Rat) / 1288183727709509) [(1, 3), (2, 1), (11, 2), (15, 1)],
  term ((-329511895204 : Rat) / 25734207) [(1, 3), (2, 1), (12, 1), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(1, 3), (2, 1), (14, 1), (15, 1)],
  term ((-299476344172 : Rat) / 25734207) [(1, 3), (2, 1), (15, 1)],
  term ((-154579692800 : Rat) / 150171761) [(1, 3), (3, 1), (5, 1), (11, 1)],
  term ((-7446130700974793360 : Rat) / 1288183727709509) [(1, 3), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-14520259456 : Rat) / 25734207) [(1, 3), (3, 1), (5, 1), (15, 1)],
  term ((-124976936000 : Rat) / 150171761) [(1, 3), (3, 1), (7, 1), (11, 1)],
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(1, 3), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((16761444560 : Rat) / 25734207) [(1, 3), (3, 1), (7, 1), (15, 1)],
  term ((-22524642800 : Rat) / 6529207) [(1, 3), (3, 1), (11, 1), (13, 1)],
  term ((362444423200 : Rat) / 150171761) [(1, 3), (3, 1), (11, 1), (15, 1)],
  term ((-1085015963245405235 : Rat) / 56007988161283) [(1, 3), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((17459010935404192090 : Rat) / 1288183727709509) [(1, 3), (3, 1), (11, 2), (15, 2)],
  term ((-178768166108 : Rat) / 25734207) [(1, 3), (3, 1), (13, 1), (15, 1)],
  term ((23841401144 : Rat) / 25734207) [(1, 3), (3, 1), (15, 2)],
  term ((6109752000 : Rat) / 8833633) [(1, 3), (3, 2), (11, 1)],
  term ((294307817013219900 : Rat) / 75775513394677) [(1, 3), (3, 2), (11, 2), (15, 1)],
  term ((1322644080 : Rat) / 8578069) [(1, 3), (3, 2), (15, 1)],
  term ((3263921200 : Rat) / 8833633) [(1, 3), (4, 1), (10, 1), (11, 1)],
  term ((157223652167087815 : Rat) / 75775513394677) [(1, 3), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((13846265908 : Rat) / 25734207) [(1, 3), (4, 1), (10, 1), (15, 1)],
  term ((43597958000 : Rat) / 150171761) [(1, 3), (4, 1), (11, 1)],
  term ((2100121223449666475 : Rat) / 1288183727709509) [(1, 3), (4, 1), (11, 2), (15, 1)],
  term ((-20812341500 : Rat) / 25734207) [(1, 3), (4, 1), (15, 1)],
  term ((94047051200 : Rat) / 150171761) [(1, 3), (5, 1), (11, 1), (13, 1)],
  term ((2860957744 : Rat) / 8578069) [(1, 3), (5, 1), (11, 1), (15, 1)],
  term ((60532641600 : Rat) / 150171761) [(1, 3), (5, 1), (11, 2)],
  term ((4530262821666496940 : Rat) / 1288183727709509) [(1, 3), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2915867879308296420 : Rat) / 1288183727709509) [(1, 3), (5, 1), (11, 3), (15, 1)],
  term ((5937386224 : Rat) / 25734207) [(1, 3), (5, 1), (13, 1), (15, 1)],
  term (288 : Rat) [(1, 3), (7, 1)],
  term (-96 : Rat) [(1, 3), (7, 1), (10, 1)],
  term (96 : Rat) [(1, 3), (7, 1), (10, 2)],
  term ((124976936000 : Rat) / 150171761) [(1, 3), (7, 1), (11, 1), (13, 1)],
  term (192 : Rat) [(1, 3), (7, 1), (11, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 3), (7, 1), (11, 2), (13, 1), (15, 1)],
  term (-576 : Rat) [(1, 3), (7, 1), (12, 1)],
  term ((-21702412304 : Rat) / 25734207) [(1, 3), (7, 1), (13, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 3), (9, 1), (11, 1), (13, 1)],
  term ((860779296 : Rat) / 8578069) [(1, 3), (9, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(1, 3), (9, 1), (11, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 3), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 3), (9, 1), (11, 3), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(1, 3), (9, 1), (13, 1), (15, 1)],
  term ((18906924720 : Rat) / 8833633) [(1, 3), (10, 1), (11, 1)],
  term ((910749853803637839 : Rat) / 75775513394677) [(1, 3), (10, 1), (11, 2), (15, 1)],
  term ((17204868151 : Rat) / 34312276) [(1, 3), (10, 1), (15, 1)],
  term ((-229870109440 : Rat) / 150171761) [(1, 3), (10, 2), (11, 1)],
  term ((-11072883171997218928 : Rat) / 1288183727709509) [(1, 3), (10, 2), (11, 2), (15, 1)],
  term ((-80598095189 : Rat) / 102936828) [(1, 3), (10, 2), (15, 1)],
  term ((-15928686120 : Rat) / 150171761) [(1, 3), (11, 1)],
  term ((305811940440 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1)],
  term ((62488516600 : Rat) / 150171761) [(1, 3), (11, 1), (12, 1), (14, 1)],
  term ((301108936200 : Rat) / 150171761) [(1, 3), (11, 1), (12, 2)],
  term ((3083969105733730640 : Rat) / 1288183727709509) [(1, 3), (11, 1), (13, 1), (15, 1)],
  term ((-89618357000 : Rat) / 150171761) [(1, 3), (11, 1), (13, 2)],
  term ((-44499601800 : Rat) / 150171761) [(1, 3), (11, 1), (14, 1)],
  term ((-1243499100 : Rat) / 150171761) [(1, 3), (11, 1), (14, 2)],
  term ((-3787440458854100631 : Rat) / 2576367455419018) [(1, 3), (11, 1), (15, 2)],
  term ((102036702318813385 : Rat) / 43667245007102) [(1, 3), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((29462028772190171631 : Rat) / 2576367455419018) [(1, 3), (11, 2), (12, 1), (15, 1)],
  term ((29008939706945521005 : Rat) / 2576367455419018) [(1, 3), (11, 2), (12, 2), (15, 1)],
  term ((23493300000 : Rat) / 150171761) [(1, 3), (11, 2), (13, 1)],
  term ((31497573179820712157 : Rat) / 2576367455419018) [(1, 3), (11, 2), (13, 1), (15, 2)],
  term ((-8633863702808694925 : Rat) / 2576367455419018) [(1, 3), (11, 2), (13, 2), (15, 1)],
  term ((-4287107124385916445 : Rat) / 2576367455419018) [(1, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 199. -/
theorem rs_R013_ueqv_R013YNNN_block_27_0100_0199_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_27_0100_0199
      rs_R013_ueqv_R013YNNN_block_27_0100_0199 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
