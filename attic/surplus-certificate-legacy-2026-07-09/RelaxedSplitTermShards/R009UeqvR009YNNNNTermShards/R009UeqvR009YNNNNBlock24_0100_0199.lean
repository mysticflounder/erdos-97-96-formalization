/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 24:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0100 : Poly :=
[
  term ((103117777868939719 : Rat) / 52219282713192) [(2, 1), (11, 2)]
]

/-- Partial product 100 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0100 : Poly :=
[
  term ((-103117777868939719 : Rat) / 26109641356596) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((103117777868939719 : Rat) / 52219282713192) [(0, 2), (2, 1), (11, 2)],
  term ((-103117777868939719 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 3)],
  term ((103117777868939719 : Rat) / 52219282713192) [(1, 2), (2, 1), (11, 2)],
  term ((103117777868939719 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 2), (14, 1)],
  term ((-103117777868939719 : Rat) / 52219282713192) [(2, 1), (11, 2), (14, 2)],
  term ((-103117777868939719 : Rat) / 52219282713192) [(2, 1), (11, 2), (15, 2)],
  term ((103117777868939719 : Rat) / 26109641356596) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0100
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0101 : Poly :=
[
  term ((8206433451626359 : Rat) / 12788395766496) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 101 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0101 : Poly :=
[
  term ((-8206433451626359 : Rat) / 6394197883248) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((8206433451626359 : Rat) / 12788395766496) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-8206433451626359 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((8206433451626359 : Rat) / 12788395766496) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((8206433451626359 : Rat) / 6394197883248) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((8206433451626359 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8206433451626359 : Rat) / 12788395766496) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-8206433451626359 : Rat) / 12788395766496) [(2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0101
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0102 : Poly :=
[
  term ((3965 : Rat) / 1008) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0102 : Poly :=
[
  term ((-3965 : Rat) / 504) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3965 : Rat) / 1008) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3965 : Rat) / 504) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3965 : Rat) / 1008) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((3965 : Rat) / 504) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3965 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3965 : Rat) / 1008) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3965 : Rat) / 1008) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0102
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0103 : Poly :=
[
  term ((1294767049718059 : Rat) / 26109641356596) [(2, 1), (14, 1)]
]

/-- Partial product 103 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0103 : Poly :=
[
  term ((-1294767049718059 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((1294767049718059 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 1)],
  term ((-1294767049718059 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((1294767049718059 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 1)],
  term ((1294767049718059 : Rat) / 13054820678298) [(2, 1), (10, 1), (14, 2)],
  term ((1294767049718059 : Rat) / 13054820678298) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1294767049718059 : Rat) / 26109641356596) [(2, 1), (14, 1), (15, 2)],
  term ((-1294767049718059 : Rat) / 26109641356596) [(2, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0103
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0104 : Poly :=
[
  term ((-81437404915439653 : Rat) / 52219282713192) [(2, 1), (15, 2)]
]

/-- Partial product 104 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0104 : Poly :=
[
  term ((81437404915439653 : Rat) / 26109641356596) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-81437404915439653 : Rat) / 52219282713192) [(0, 2), (2, 1), (15, 2)],
  term ((81437404915439653 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-81437404915439653 : Rat) / 52219282713192) [(1, 2), (2, 1), (15, 2)],
  term ((-81437404915439653 : Rat) / 26109641356596) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-81437404915439653 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 3)],
  term ((81437404915439653 : Rat) / 52219282713192) [(2, 1), (14, 2), (15, 2)],
  term ((81437404915439653 : Rat) / 52219282713192) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0104
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0105 : Poly :=
[
  term ((-1133 : Rat) / 252) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0105 : Poly :=
[
  term ((1133 : Rat) / 126) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1133 : Rat) / 252) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((1133 : Rat) / 126) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1133 : Rat) / 252) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-1133 : Rat) / 126) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1133 : Rat) / 126) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((1133 : Rat) / 252) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((1133 : Rat) / 252) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0105
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0106 : Poly :=
[
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2)]
]

/-- Partial product 106 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0106 : Poly :=
[
  term ((1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 2), (10, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(2, 2), (10, 1), (14, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(2, 2), (11, 1), (15, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (14, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0106
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0107 : Poly :=
[
  term ((-1873880334375407 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 107 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0107 : Poly :=
[
  term ((1873880334375407 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-1873880334375407 : Rat) / 13054820678298) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((1873880334375407 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-1873880334375407 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-1873880334375407 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((-1873880334375407 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((1873880334375407 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((1873880334375407 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0107
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0108 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 108 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0108 : Poly :=
[
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(1, 1), (3, 1), (6, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0108
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0109 : Poly :=
[
  term ((-28544163861425599 : Rat) / 26109641356596) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 109 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0109 : Poly :=
[
  term ((28544163861425599 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-28544163861425599 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((28544163861425599 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((-28544163861425599 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-28544163861425599 : Rat) / 13054820678298) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((28544163861425599 : Rat) / 26109641356596) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((28544163861425599 : Rat) / 26109641356596) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-28544163861425599 : Rat) / 13054820678298) [(3, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0109
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0110 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 110 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0110 : Poly :=
[
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0110
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0111 : Poly :=
[
  term ((-340 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0111 : Poly :=
[
  term ((680 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((680 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((340 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((340 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0111
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0112 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 112 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0112 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0112
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0113 : Poly :=
[
  term ((6628453501018739 : Rat) / 3729948765228) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 113 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0113 : Poly :=
[
  term ((-6628453501018739 : Rat) / 1864974382614) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((6628453501018739 : Rat) / 3729948765228) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-6628453501018739 : Rat) / 1864974382614) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((6628453501018739 : Rat) / 3729948765228) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((6628453501018739 : Rat) / 1864974382614) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((6628453501018739 : Rat) / 1864974382614) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-6628453501018739 : Rat) / 3729948765228) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-6628453501018739 : Rat) / 3729948765228) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0113
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0114 : Poly :=
[
  term ((64 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0114 : Poly :=
[
  term ((-128 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 9) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0114
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0115 : Poly :=
[
  term ((-40086765847094873 : Rat) / 52219282713192) [(3, 1), (7, 1)]
]

/-- Partial product 115 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0115 : Poly :=
[
  term ((40086765847094873 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-40086765847094873 : Rat) / 52219282713192) [(0, 2), (3, 1), (7, 1)],
  term ((40086765847094873 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-40086765847094873 : Rat) / 52219282713192) [(1, 2), (3, 1), (7, 1)],
  term ((-40086765847094873 : Rat) / 26109641356596) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-40086765847094873 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((40086765847094873 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 2)],
  term ((40086765847094873 : Rat) / 52219282713192) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0115
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0116 : Poly :=
[
  term ((-1947425923950239 : Rat) / 17406427571064) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 116 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0116 : Poly :=
[
  term ((1947425923950239 : Rat) / 8703213785532) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((-1947425923950239 : Rat) / 17406427571064) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((1947425923950239 : Rat) / 8703213785532) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-1947425923950239 : Rat) / 17406427571064) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-1947425923950239 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((1947425923950239 : Rat) / 17406427571064) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((1947425923950239 : Rat) / 17406427571064) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((-1947425923950239 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0116
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0117 : Poly :=
[
  term ((44433793701461 : Rat) / 207219375846) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 117 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0117 : Poly :=
[
  term ((-44433793701461 : Rat) / 103609687923) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((44433793701461 : Rat) / 207219375846) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-44433793701461 : Rat) / 103609687923) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((44433793701461 : Rat) / 207219375846) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((44433793701461 : Rat) / 103609687923) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((44433793701461 : Rat) / 103609687923) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-44433793701461 : Rat) / 207219375846) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-44433793701461 : Rat) / 207219375846) [(3, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0117
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0118 : Poly :=
[
  term ((-469979739153613 : Rat) / 323756854848) [(3, 1), (9, 1)]
]

/-- Partial product 118 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0118 : Poly :=
[
  term ((469979739153613 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((-469979739153613 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1)],
  term ((469979739153613 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-469979739153613 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1)],
  term ((-469979739153613 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-469979739153613 : Rat) / 161878427424) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((469979739153613 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 2)],
  term ((469979739153613 : Rat) / 323756854848) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0118
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0119 : Poly :=
[
  term ((-50631850194497 : Rat) / 53959475808) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 119 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0119 : Poly :=
[
  term ((50631850194497 : Rat) / 26979737904) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((-50631850194497 : Rat) / 53959475808) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((50631850194497 : Rat) / 26979737904) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-50631850194497 : Rat) / 53959475808) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-50631850194497 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((50631850194497 : Rat) / 53959475808) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((50631850194497 : Rat) / 53959475808) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-50631850194497 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0119
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0120 : Poly :=
[
  term ((10281030802289 : Rat) / 35972983872) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 120 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0120 : Poly :=
[
  term ((-10281030802289 : Rat) / 17986491936) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((10281030802289 : Rat) / 35972983872) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-10281030802289 : Rat) / 17986491936) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((10281030802289 : Rat) / 35972983872) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((10281030802289 : Rat) / 17986491936) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((10281030802289 : Rat) / 17986491936) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10281030802289 : Rat) / 35972983872) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-10281030802289 : Rat) / 35972983872) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0120
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0121 : Poly :=
[
  term ((2746689497209405 : Rat) / 17406427571064) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 121 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0121 : Poly :=
[
  term ((-2746689497209405 : Rat) / 8703213785532) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((2746689497209405 : Rat) / 17406427571064) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-2746689497209405 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((2746689497209405 : Rat) / 17406427571064) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-2746689497209405 : Rat) / 17406427571064) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-2746689497209405 : Rat) / 17406427571064) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((2746689497209405 : Rat) / 8703213785532) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((2746689497209405 : Rat) / 8703213785532) [(3, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0121
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0122 : Poly :=
[
  term ((2082652186154339 : Rat) / 2131399294416) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 122 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0122 : Poly :=
[
  term ((-2082652186154339 : Rat) / 1065699647208) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((2082652186154339 : Rat) / 2131399294416) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-2082652186154339 : Rat) / 1065699647208) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((2082652186154339 : Rat) / 2131399294416) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((2082652186154339 : Rat) / 1065699647208) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2082652186154339 : Rat) / 2131399294416) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-2082652186154339 : Rat) / 2131399294416) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((2082652186154339 : Rat) / 1065699647208) [(3, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0122
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0123 : Poly :=
[
  term ((-3935 : Rat) / 168) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0123 : Poly :=
[
  term ((3935 : Rat) / 84) [(0, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-3935 : Rat) / 168) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((3935 : Rat) / 84) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3935 : Rat) / 168) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3935 : Rat) / 84) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3935 : Rat) / 168) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((3935 : Rat) / 168) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3935 : Rat) / 84) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0123
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0124 : Poly :=
[
  term ((-326307722320892771 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 124 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0124 : Poly :=
[
  term ((326307722320892771 : Rat) / 78328924069788) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-326307722320892771 : Rat) / 156657848139576) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((326307722320892771 : Rat) / 78328924069788) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-326307722320892771 : Rat) / 156657848139576) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-326307722320892771 : Rat) / 78328924069788) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((326307722320892771 : Rat) / 156657848139576) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((326307722320892771 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 3)],
  term ((-326307722320892771 : Rat) / 78328924069788) [(3, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0124
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0125 : Poly :=
[
  term ((767 : Rat) / 42) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0125 : Poly :=
[
  term ((-767 : Rat) / 21) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((767 : Rat) / 42) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-767 : Rat) / 21) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((767 : Rat) / 42) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((767 : Rat) / 21) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-767 : Rat) / 42) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-767 : Rat) / 42) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((767 : Rat) / 21) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0125
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0126 : Poly :=
[
  term ((22115843261516593 : Rat) / 52219282713192) [(3, 1), (11, 1)]
]

/-- Partial product 126 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0126 : Poly :=
[
  term ((-22115843261516593 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((22115843261516593 : Rat) / 52219282713192) [(0, 2), (3, 1), (11, 1)],
  term ((-22115843261516593 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 2)],
  term ((22115843261516593 : Rat) / 52219282713192) [(1, 2), (3, 1), (11, 1)],
  term ((22115843261516593 : Rat) / 26109641356596) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-22115843261516593 : Rat) / 52219282713192) [(3, 1), (11, 1), (14, 2)],
  term ((-22115843261516593 : Rat) / 52219282713192) [(3, 1), (11, 1), (15, 2)],
  term ((22115843261516593 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0126
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0127 : Poly :=
[
  term ((-13253571547156877 : Rat) / 22379692591368) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 127 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0127 : Poly :=
[
  term ((13253571547156877 : Rat) / 11189846295684) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-13253571547156877 : Rat) / 22379692591368) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((13253571547156877 : Rat) / 11189846295684) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-13253571547156877 : Rat) / 22379692591368) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-13253571547156877 : Rat) / 11189846295684) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((13253571547156877 : Rat) / 22379692591368) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((13253571547156877 : Rat) / 22379692591368) [(3, 1), (11, 1), (14, 3)],
  term ((-13253571547156877 : Rat) / 11189846295684) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0127
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0128 : Poly :=
[
  term ((358735671857022361 : Rat) / 208877130852768) [(3, 1), (13, 1)]
]

/-- Partial product 128 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0128 : Poly :=
[
  term ((-358735671857022361 : Rat) / 104438565426384) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((358735671857022361 : Rat) / 208877130852768) [(0, 2), (3, 1), (13, 1)],
  term ((-358735671857022361 : Rat) / 104438565426384) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((358735671857022361 : Rat) / 208877130852768) [(1, 2), (3, 1), (13, 1)],
  term ((358735671857022361 : Rat) / 104438565426384) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((358735671857022361 : Rat) / 104438565426384) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-358735671857022361 : Rat) / 208877130852768) [(3, 1), (13, 1), (14, 2)],
  term ((-358735671857022361 : Rat) / 208877130852768) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0128
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0129 : Poly :=
[
  term ((-60305982811061 : Rat) / 202990408992) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 129 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0129 : Poly :=
[
  term ((60305982811061 : Rat) / 101495204496) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-60305982811061 : Rat) / 202990408992) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((60305982811061 : Rat) / 101495204496) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-60305982811061 : Rat) / 202990408992) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-60305982811061 : Rat) / 101495204496) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-60305982811061 : Rat) / 101495204496) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((60305982811061 : Rat) / 202990408992) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((60305982811061 : Rat) / 202990408992) [(3, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0129
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0130 : Poly :=
[
  term ((815 : Rat) / 112) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 130 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0130 : Poly :=
[
  term ((-815 : Rat) / 56) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((815 : Rat) / 112) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-815 : Rat) / 56) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((815 : Rat) / 112) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((815 : Rat) / 56) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((815 : Rat) / 56) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-815 : Rat) / 112) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-815 : Rat) / 112) [(3, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0130
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0131 : Poly :=
[
  term ((-50515 : Rat) / 1008) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 131 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0131 : Poly :=
[
  term ((50515 : Rat) / 504) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-50515 : Rat) / 1008) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((50515 : Rat) / 504) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-50515 : Rat) / 1008) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-50515 : Rat) / 504) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-50515 : Rat) / 504) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((50515 : Rat) / 1008) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((50515 : Rat) / 1008) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0131
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0132 : Poly :=
[
  term ((13107408701510153 : Rat) / 52219282713192) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 132 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0132 : Poly :=
[
  term ((-13107408701510153 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((13107408701510153 : Rat) / 52219282713192) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-13107408701510153 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((13107408701510153 : Rat) / 52219282713192) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((13107408701510153 : Rat) / 26109641356596) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((13107408701510153 : Rat) / 26109641356596) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13107408701510153 : Rat) / 52219282713192) [(3, 1), (14, 1), (15, 3)],
  term ((-13107408701510153 : Rat) / 52219282713192) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0132
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0133 : Poly :=
[
  term ((-159 : Rat) / 28) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0133 : Poly :=
[
  term ((159 : Rat) / 14) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-159 : Rat) / 28) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((159 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-159 : Rat) / 28) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-159 : Rat) / 14) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-159 : Rat) / 14) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((159 : Rat) / 28) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((159 : Rat) / 28) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0133
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0134 : Poly :=
[
  term ((-47596471867050544 : Rat) / 19582231017447) [(3, 1), (15, 1)]
]

/-- Partial product 134 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0134 : Poly :=
[
  term ((95192943734101088 : Rat) / 19582231017447) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-47596471867050544 : Rat) / 19582231017447) [(0, 2), (3, 1), (15, 1)],
  term ((95192943734101088 : Rat) / 19582231017447) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-47596471867050544 : Rat) / 19582231017447) [(1, 2), (3, 1), (15, 1)],
  term ((-95192943734101088 : Rat) / 19582231017447) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-95192943734101088 : Rat) / 19582231017447) [(3, 1), (11, 1), (15, 2)],
  term ((47596471867050544 : Rat) / 19582231017447) [(3, 1), (14, 2), (15, 1)],
  term ((47596471867050544 : Rat) / 19582231017447) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0134
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0135 : Poly :=
[
  term ((10147 : Rat) / 252) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0135 : Poly :=
[
  term ((-10147 : Rat) / 126) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((10147 : Rat) / 252) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-10147 : Rat) / 126) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((10147 : Rat) / 252) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((10147 : Rat) / 126) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10147 : Rat) / 126) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10147 : Rat) / 252) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10147 : Rat) / 252) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0135
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0136 : Poly :=
[
  term ((52872648474478825 : Rat) / 156657848139576) [(3, 2)]
]

/-- Partial product 136 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0136 : Poly :=
[
  term ((-52872648474478825 : Rat) / 78328924069788) [(0, 1), (3, 2), (10, 1)],
  term ((52872648474478825 : Rat) / 156657848139576) [(0, 2), (3, 2)],
  term ((-52872648474478825 : Rat) / 78328924069788) [(1, 1), (3, 2), (11, 1)],
  term ((52872648474478825 : Rat) / 156657848139576) [(1, 2), (3, 2)],
  term ((52872648474478825 : Rat) / 78328924069788) [(3, 2), (10, 1), (14, 1)],
  term ((52872648474478825 : Rat) / 78328924069788) [(3, 2), (11, 1), (15, 1)],
  term ((-52872648474478825 : Rat) / 156657848139576) [(3, 2), (14, 2)],
  term ((-52872648474478825 : Rat) / 156657848139576) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0136
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0137 : Poly :=
[
  term ((-58581379599448375 : Rat) / 78328924069788) [(3, 2), (6, 1)]
]

/-- Partial product 137 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0137 : Poly :=
[
  term ((58581379599448375 : Rat) / 39164462034894) [(0, 1), (3, 2), (6, 1), (10, 1)],
  term ((-58581379599448375 : Rat) / 78328924069788) [(0, 2), (3, 2), (6, 1)],
  term ((58581379599448375 : Rat) / 39164462034894) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-58581379599448375 : Rat) / 78328924069788) [(1, 2), (3, 2), (6, 1)],
  term ((-58581379599448375 : Rat) / 39164462034894) [(3, 2), (6, 1), (10, 1), (14, 1)],
  term ((-58581379599448375 : Rat) / 39164462034894) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((58581379599448375 : Rat) / 78328924069788) [(3, 2), (6, 1), (14, 2)],
  term ((58581379599448375 : Rat) / 78328924069788) [(3, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0137
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0138 : Poly :=
[
  term ((-2698685004451085 : Rat) / 52219282713192) [(3, 2), (10, 1)]
]

/-- Partial product 138 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0138 : Poly :=
[
  term ((2698685004451085 : Rat) / 26109641356596) [(0, 1), (3, 2), (10, 2)],
  term ((-2698685004451085 : Rat) / 52219282713192) [(0, 2), (3, 2), (10, 1)],
  term ((2698685004451085 : Rat) / 26109641356596) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-2698685004451085 : Rat) / 52219282713192) [(1, 2), (3, 2), (10, 1)],
  term ((-2698685004451085 : Rat) / 26109641356596) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((2698685004451085 : Rat) / 52219282713192) [(3, 2), (10, 1), (14, 2)],
  term ((2698685004451085 : Rat) / 52219282713192) [(3, 2), (10, 1), (15, 2)],
  term ((-2698685004451085 : Rat) / 26109641356596) [(3, 2), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0138
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0139 : Poly :=
[
  term ((-1063033397773325 : Rat) / 26109641356596) [(3, 2), (14, 1)]
]

/-- Partial product 139 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0139 : Poly :=
[
  term ((1063033397773325 : Rat) / 13054820678298) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(0, 2), (3, 2), (14, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(1, 2), (3, 2), (14, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(3, 2), (10, 1), (14, 2)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(3, 2), (14, 1), (15, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(3, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0139
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0140 : Poly :=
[
  term ((-3496272244119451 : Rat) / 17406427571064) [(6, 1)]
]

/-- Partial product 140 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0140 : Poly :=
[
  term ((3496272244119451 : Rat) / 8703213785532) [(0, 1), (6, 1), (10, 1)],
  term ((-3496272244119451 : Rat) / 17406427571064) [(0, 2), (6, 1)],
  term ((3496272244119451 : Rat) / 8703213785532) [(1, 1), (6, 1), (11, 1)],
  term ((-3496272244119451 : Rat) / 17406427571064) [(1, 2), (6, 1)],
  term ((-3496272244119451 : Rat) / 8703213785532) [(6, 1), (10, 1), (14, 1)],
  term ((-3496272244119451 : Rat) / 8703213785532) [(6, 1), (11, 1), (15, 1)],
  term ((3496272244119451 : Rat) / 17406427571064) [(6, 1), (14, 2)],
  term ((3496272244119451 : Rat) / 17406427571064) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0140
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0141 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 141 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0141 : Poly :=
[
  term ((3064399565618 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0141
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0142 : Poly :=
[
  term ((-44388 : Rat) / 79) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 142 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0142 : Poly :=
[
  term ((88776 : Rat) / 79) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-44388 : Rat) / 79) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((88776 : Rat) / 79) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-44388 : Rat) / 79) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-88776 : Rat) / 79) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((44388 : Rat) / 79) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((44388 : Rat) / 79) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-88776 : Rat) / 79) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0142
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0143 : Poly :=
[
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 143 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0143 : Poly :=
[
  term ((941242657 : Rat) / 41635398) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((941242657 : Rat) / 41635398) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-941242657 : Rat) / 41635398) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-941242657 : Rat) / 41635398) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0143
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0144 : Poly :=
[
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0144 : Poly :=
[
  term ((725 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 21) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0144
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0145 : Poly :=
[
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 145 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0145 : Poly :=
[
  term ((-282061132319075 : Rat) / 1450535630922) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0145
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0146 : Poly :=
[
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0146 : Poly :=
[
  term ((-628 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-628 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 21) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0146
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0147 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2)]
]

/-- Partial product 147 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0147 : Poly :=
[
  term ((-2172201733 : Rat) / 83270796) [(0, 1), (6, 1), (9, 2), (10, 1)],
  term ((2172201733 : Rat) / 166541592) [(0, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 83270796) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (14, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0147
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0148 : Poly :=
[
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1)]
]

/-- Partial product 148 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0148 : Poly :=
[
  term ((-1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 2)],
  term ((1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 2)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (15, 2)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0148
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0149 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (14, 1)]
]

/-- Partial product 149 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0149 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (6, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (10, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0149
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0150 : Poly :=
[
  term ((41271832927 : Rat) / 80296839) [(7, 1), (9, 1)]
]

/-- Partial product 150 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0150 : Poly :=
[
  term ((-82543665854 : Rat) / 80296839) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((41271832927 : Rat) / 80296839) [(0, 2), (7, 1), (9, 1)],
  term ((-82543665854 : Rat) / 80296839) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((41271832927 : Rat) / 80296839) [(1, 2), (7, 1), (9, 1)],
  term ((82543665854 : Rat) / 80296839) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((82543665854 : Rat) / 80296839) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-41271832927 : Rat) / 80296839) [(7, 1), (9, 1), (14, 2)],
  term ((-41271832927 : Rat) / 80296839) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0150
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0151 : Poly :=
[
  term ((12449123235323125 : Rat) / 52219282713192) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 151 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0151 : Poly :=
[
  term ((-12449123235323125 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (10, 1), (15, 3)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0151
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0152 : Poly :=
[
  term ((1774654659347555 : Rat) / 2901071261844) [(7, 1), (11, 1)]
]

/-- Partial product 152 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0152 : Poly :=
[
  term ((-1774654659347555 : Rat) / 1450535630922) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((1774654659347555 : Rat) / 2901071261844) [(0, 2), (7, 1), (11, 1)],
  term ((-1774654659347555 : Rat) / 1450535630922) [(1, 1), (7, 1), (11, 2)],
  term ((1774654659347555 : Rat) / 2901071261844) [(1, 2), (7, 1), (11, 1)],
  term ((1774654659347555 : Rat) / 1450535630922) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1774654659347555 : Rat) / 2901071261844) [(7, 1), (11, 1), (14, 2)],
  term ((-1774654659347555 : Rat) / 2901071261844) [(7, 1), (11, 1), (15, 2)],
  term ((1774654659347555 : Rat) / 1450535630922) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0152
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0153 : Poly :=
[
  term ((12449123235323125 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 153 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0153 : Poly :=
[
  term ((-12449123235323125 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 3)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0153
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0154 : Poly :=
[
  term ((-4156194155610421 : Rat) / 13054820678298) [(7, 1), (13, 1)]
]

/-- Partial product 154 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0154 : Poly :=
[
  term ((4156194155610421 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-4156194155610421 : Rat) / 13054820678298) [(0, 2), (7, 1), (13, 1)],
  term ((4156194155610421 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-4156194155610421 : Rat) / 13054820678298) [(1, 2), (7, 1), (13, 1)],
  term ((-4156194155610421 : Rat) / 6527410339149) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-4156194155610421 : Rat) / 6527410339149) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((4156194155610421 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 2)],
  term ((4156194155610421 : Rat) / 13054820678298) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0154
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0155 : Poly :=
[
  term ((920 : Rat) / 21) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0155 : Poly :=
[
  term ((-1840 : Rat) / 21) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((920 : Rat) / 21) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1840 : Rat) / 21) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((920 : Rat) / 21) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((1840 : Rat) / 21) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1840 : Rat) / 21) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-920 : Rat) / 21) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-920 : Rat) / 21) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0155
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0156 : Poly :=
[
  term ((13119521360128595 : Rat) / 26109641356596) [(7, 1), (15, 1)]
]

/-- Partial product 156 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0156 : Poly :=
[
  term ((-13119521360128595 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((13119521360128595 : Rat) / 26109641356596) [(0, 2), (7, 1), (15, 1)],
  term ((-13119521360128595 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((13119521360128595 : Rat) / 26109641356596) [(1, 2), (7, 1), (15, 1)],
  term ((13119521360128595 : Rat) / 13054820678298) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((13119521360128595 : Rat) / 13054820678298) [(7, 1), (11, 1), (15, 2)],
  term ((-13119521360128595 : Rat) / 26109641356596) [(7, 1), (14, 2), (15, 1)],
  term ((-13119521360128595 : Rat) / 26109641356596) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0156
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0157 : Poly :=
[
  term ((-772 : Rat) / 21) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0157 : Poly :=
[
  term ((1544 : Rat) / 21) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-772 : Rat) / 21) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((1544 : Rat) / 21) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-772 : Rat) / 21) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1544 : Rat) / 21) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1544 : Rat) / 21) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((772 : Rat) / 21) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((772 : Rat) / 21) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0157
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0158 : Poly :=
[
  term ((755374492924837 : Rat) / 2901071261844) [(7, 2)]
]

/-- Partial product 158 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0158 : Poly :=
[
  term ((-755374492924837 : Rat) / 1450535630922) [(0, 1), (7, 2), (10, 1)],
  term ((755374492924837 : Rat) / 2901071261844) [(0, 2), (7, 2)],
  term ((-755374492924837 : Rat) / 1450535630922) [(1, 1), (7, 2), (11, 1)],
  term ((755374492924837 : Rat) / 2901071261844) [(1, 2), (7, 2)],
  term ((755374492924837 : Rat) / 1450535630922) [(7, 2), (10, 1), (14, 1)],
  term ((755374492924837 : Rat) / 1450535630922) [(7, 2), (11, 1), (15, 1)],
  term ((-755374492924837 : Rat) / 2901071261844) [(7, 2), (14, 2)],
  term ((-755374492924837 : Rat) / 2901071261844) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0158
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0159 : Poly :=
[
  term ((119808 : Rat) / 553) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 159 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0159 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((239616 : Rat) / 553) [(9, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0159
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0160 : Poly :=
[
  term ((-4353333743611 : Rat) / 29602767978) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 160 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0160 : Poly :=
[
  term ((4353333743611 : Rat) / 14801383989) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-4353333743611 : Rat) / 29602767978) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((4353333743611 : Rat) / 14801383989) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-4353333743611 : Rat) / 29602767978) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-4353333743611 : Rat) / 14801383989) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((4353333743611 : Rat) / 29602767978) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((4353333743611 : Rat) / 29602767978) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-4353333743611 : Rat) / 14801383989) [(9, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0160
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0161 : Poly :=
[
  term (15 : Rat) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 161 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0161 : Poly :=
[
  term (-30 : Rat) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term (15 : Rat) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (-30 : Rat) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (15 : Rat) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (30 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term (-15 : Rat) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term (30 : Rat) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0161
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0162 : Poly :=
[
  term ((2285794014790883 : Rat) / 6394197883248) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 162 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0162 : Poly :=
[
  term ((-2285794014790883 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((2285794014790883 : Rat) / 6394197883248) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2285794014790883 : Rat) / 3197098941624) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((2285794014790883 : Rat) / 6394197883248) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((2285794014790883 : Rat) / 3197098941624) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2285794014790883 : Rat) / 6394197883248) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2285794014790883 : Rat) / 6394197883248) [(9, 1), (10, 1), (15, 3)],
  term ((2285794014790883 : Rat) / 3197098941624) [(9, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0162
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0163 : Poly :=
[
  term ((-88 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0163 : Poly :=
[
  term ((176 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-88 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((88 : Rat) / 7) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((88 : Rat) / 7) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-176 : Rat) / 7) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0163
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0164 : Poly :=
[
  term ((1059650791225 : Rat) / 118411071912) [(9, 1), (11, 1)]
]

/-- Partial product 164 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0164 : Poly :=
[
  term ((-1059650791225 : Rat) / 59205535956) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((1059650791225 : Rat) / 118411071912) [(0, 2), (9, 1), (11, 1)],
  term ((-1059650791225 : Rat) / 59205535956) [(1, 1), (9, 1), (11, 2)],
  term ((1059650791225 : Rat) / 118411071912) [(1, 2), (9, 1), (11, 1)],
  term ((1059650791225 : Rat) / 59205535956) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1059650791225 : Rat) / 118411071912) [(9, 1), (11, 1), (14, 2)],
  term ((-1059650791225 : Rat) / 118411071912) [(9, 1), (11, 1), (15, 2)],
  term ((1059650791225 : Rat) / 59205535956) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0164
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0165 : Poly :=
[
  term ((2062912101660059 : Rat) / 6394197883248) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 165 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0165 : Poly :=
[
  term ((-2062912101660059 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((2062912101660059 : Rat) / 6394197883248) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2062912101660059 : Rat) / 3197098941624) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((2062912101660059 : Rat) / 6394197883248) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((2062912101660059 : Rat) / 3197098941624) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-2062912101660059 : Rat) / 6394197883248) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2062912101660059 : Rat) / 6394197883248) [(9, 1), (11, 1), (14, 3)],
  term ((2062912101660059 : Rat) / 3197098941624) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0165
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0166 : Poly :=
[
  term ((-1005342781871335 : Rat) / 3197098941624) [(9, 1), (13, 1)]
]

/-- Partial product 166 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0166 : Poly :=
[
  term ((1005342781871335 : Rat) / 1598549470812) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1005342781871335 : Rat) / 3197098941624) [(0, 2), (9, 1), (13, 1)],
  term ((1005342781871335 : Rat) / 1598549470812) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1005342781871335 : Rat) / 3197098941624) [(1, 2), (9, 1), (13, 1)],
  term ((-1005342781871335 : Rat) / 1598549470812) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1005342781871335 : Rat) / 1598549470812) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1005342781871335 : Rat) / 3197098941624) [(9, 1), (13, 1), (14, 2)],
  term ((1005342781871335 : Rat) / 3197098941624) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0166
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0167 : Poly :=
[
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 167 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0167 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0167
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0168 : Poly :=
[
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 168 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0168 : Poly :=
[
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0168
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0169 : Poly :=
[
  term ((55 : Rat) / 16) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 169 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0169 : Poly :=
[
  term ((-55 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 16) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-55 : Rat) / 8) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 16) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 8) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 8) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 16) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-55 : Rat) / 16) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0169
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0170 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 170 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0170 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0170
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0171 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0171 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0171
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0172 : Poly :=
[
  term ((7437955160920331 : Rat) / 25576791532992) [(9, 1), (15, 1)]
]

/-- Partial product 172 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0172 : Poly :=
[
  term ((-7437955160920331 : Rat) / 12788395766496) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((7437955160920331 : Rat) / 25576791532992) [(0, 2), (9, 1), (15, 1)],
  term ((-7437955160920331 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((7437955160920331 : Rat) / 25576791532992) [(1, 2), (9, 1), (15, 1)],
  term ((7437955160920331 : Rat) / 12788395766496) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((7437955160920331 : Rat) / 12788395766496) [(9, 1), (11, 1), (15, 2)],
  term ((-7437955160920331 : Rat) / 25576791532992) [(9, 1), (14, 2), (15, 1)],
  term ((-7437955160920331 : Rat) / 25576791532992) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0172
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0173 : Poly :=
[
  term ((-85 : Rat) / 28) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0173 : Poly :=
[
  term ((85 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 28) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 28) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 14) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 14) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((85 : Rat) / 28) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((85 : Rat) / 28) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0173
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0174 : Poly :=
[
  term ((-128159902247 : Rat) / 5138997696) [(9, 2)]
]

/-- Partial product 174 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0174 : Poly :=
[
  term ((128159902247 : Rat) / 2569498848) [(0, 1), (9, 2), (10, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(0, 2), (9, 2)],
  term ((128159902247 : Rat) / 2569498848) [(1, 1), (9, 2), (11, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(1, 2), (9, 2)],
  term ((-128159902247 : Rat) / 2569498848) [(9, 2), (10, 1), (14, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(9, 2), (11, 1), (15, 1)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (14, 2)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0174
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0175 : Poly :=
[
  term ((115126691849 : Rat) / 749437164) [(9, 2), (10, 1)]
]

/-- Partial product 175 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0175 : Poly :=
[
  term ((-115126691849 : Rat) / 374718582) [(0, 1), (9, 2), (10, 2)],
  term ((115126691849 : Rat) / 749437164) [(0, 2), (9, 2), (10, 1)],
  term ((-115126691849 : Rat) / 374718582) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((115126691849 : Rat) / 749437164) [(1, 2), (9, 2), (10, 1)],
  term ((115126691849 : Rat) / 374718582) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-115126691849 : Rat) / 749437164) [(9, 2), (10, 1), (14, 2)],
  term ((-115126691849 : Rat) / 749437164) [(9, 2), (10, 1), (15, 2)],
  term ((115126691849 : Rat) / 374718582) [(9, 2), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0175
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0176 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 1)]
]

/-- Partial product 176 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0176 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 1), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0176
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0177 : Poly :=
[
  term ((-553040367401411 : Rat) / 8703213785532) [(10, 1)]
]

/-- Partial product 177 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0177 : Poly :=
[
  term ((553040367401411 : Rat) / 4351606892766) [(0, 1), (10, 2)],
  term ((-553040367401411 : Rat) / 8703213785532) [(0, 2), (10, 1)],
  term ((553040367401411 : Rat) / 4351606892766) [(1, 1), (10, 1), (11, 1)],
  term ((-553040367401411 : Rat) / 8703213785532) [(1, 2), (10, 1)],
  term ((-553040367401411 : Rat) / 4351606892766) [(10, 1), (11, 1), (15, 1)],
  term ((553040367401411 : Rat) / 8703213785532) [(10, 1), (14, 2)],
  term ((553040367401411 : Rat) / 8703213785532) [(10, 1), (15, 2)],
  term ((-553040367401411 : Rat) / 4351606892766) [(10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0177
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0178 : Poly :=
[
  term ((-55678923180283967 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 178 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0178 : Poly :=
[
  term ((55678923180283967 : Rat) / 26109641356596) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((55678923180283967 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((55678923180283967 : Rat) / 52219282713192) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((55678923180283967 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 3)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (15, 2)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0178
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0179 : Poly :=
[
  term ((-747007575948671 : Rat) / 3197098941624) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 179 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0179 : Poly :=
[
  term ((747007575948671 : Rat) / 1598549470812) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((747007575948671 : Rat) / 1598549470812) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-747007575948671 : Rat) / 1598549470812) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((747007575948671 : Rat) / 3197098941624) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((747007575948671 : Rat) / 3197098941624) [(10, 1), (13, 1), (15, 3)],
  term ((-747007575948671 : Rat) / 1598549470812) [(10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0179
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0180 : Poly :=
[
  term ((-2245 : Rat) / 252) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0180 : Poly :=
[
  term ((2245 : Rat) / 126) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2245 : Rat) / 252) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2245 : Rat) / 126) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2245 : Rat) / 252) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2245 : Rat) / 126) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2245 : Rat) / 252) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2245 : Rat) / 252) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2245 : Rat) / 126) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0180
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0181 : Poly :=
[
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (14, 1)]
]

/-- Partial product 181 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0181 : Poly :=
[
  term ((3968051523467 : Rat) / 44404151967) [(0, 1), (10, 2), (14, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(0, 2), (10, 1), (14, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(1, 2), (10, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 1), (14, 1), (15, 2)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 1), (14, 3)],
  term ((-3968051523467 : Rat) / 44404151967) [(10, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0181
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0182 : Poly :=
[
  term ((21492491482134149 : Rat) / 26109641356596) [(10, 1), (15, 2)]
]

/-- Partial product 182 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0182 : Poly :=
[
  term ((-21492491482134149 : Rat) / 13054820678298) [(0, 1), (10, 2), (15, 2)],
  term ((21492491482134149 : Rat) / 26109641356596) [(0, 2), (10, 1), (15, 2)],
  term ((-21492491482134149 : Rat) / 13054820678298) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((21492491482134149 : Rat) / 26109641356596) [(1, 2), (10, 1), (15, 2)],
  term ((21492491482134149 : Rat) / 13054820678298) [(10, 1), (11, 1), (15, 3)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(10, 1), (14, 2), (15, 2)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(10, 1), (15, 4)],
  term ((21492491482134149 : Rat) / 13054820678298) [(10, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0182
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0183 : Poly :=
[
  term ((505 : Rat) / 63) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 183 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0183 : Poly :=
[
  term ((-1010 : Rat) / 63) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((505 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1010 : Rat) / 63) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((505 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((1010 : Rat) / 63) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-505 : Rat) / 63) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-505 : Rat) / 63) [(10, 1), (15, 4), (16, 1)],
  term ((1010 : Rat) / 63) [(10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0183
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0184 : Poly :=
[
  term ((-970106309053067 : Rat) / 26109641356596) [(11, 1), (13, 1)]
]

/-- Partial product 184 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0184 : Poly :=
[
  term ((970106309053067 : Rat) / 13054820678298) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-970106309053067 : Rat) / 26109641356596) [(0, 2), (11, 1), (13, 1)],
  term ((970106309053067 : Rat) / 13054820678298) [(1, 1), (11, 2), (13, 1)],
  term ((-970106309053067 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1)],
  term ((-970106309053067 : Rat) / 13054820678298) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((970106309053067 : Rat) / 26109641356596) [(11, 1), (13, 1), (14, 2)],
  term ((970106309053067 : Rat) / 26109641356596) [(11, 1), (13, 1), (15, 2)],
  term ((-970106309053067 : Rat) / 13054820678298) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0184
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0185 : Poly :=
[
  term ((-747007575948671 : Rat) / 3197098941624) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 185 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0185 : Poly :=
[
  term ((747007575948671 : Rat) / 1598549470812) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((747007575948671 : Rat) / 1598549470812) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-747007575948671 : Rat) / 1598549470812) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((747007575948671 : Rat) / 3197098941624) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((747007575948671 : Rat) / 3197098941624) [(11, 1), (13, 1), (14, 3)],
  term ((-747007575948671 : Rat) / 1598549470812) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0185
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0186 : Poly :=
[
  term ((-2245 : Rat) / 252) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 186 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0186 : Poly :=
[
  term ((2245 : Rat) / 126) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2245 : Rat) / 252) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2245 : Rat) / 126) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2245 : Rat) / 252) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2245 : Rat) / 126) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2245 : Rat) / 252) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2245 : Rat) / 252) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-2245 : Rat) / 126) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0186
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0187 : Poly :=
[
  term ((-15 : Rat) / 2) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 187 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0187 : Poly :=
[
  term (15 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (-15 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15 : Rat) / 2) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((15 : Rat) / 2) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term (-15 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0187
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0188 : Poly :=
[
  term ((21492491482134149 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 188 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0188 : Poly :=
[
  term ((-21492491482134149 : Rat) / 13054820678298) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((21492491482134149 : Rat) / 26109641356596) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-21492491482134149 : Rat) / 13054820678298) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((21492491482134149 : Rat) / 26109641356596) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((21492491482134149 : Rat) / 13054820678298) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 3)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(11, 1), (14, 3), (15, 1)],
  term ((21492491482134149 : Rat) / 13054820678298) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0188
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0189 : Poly :=
[
  term ((505 : Rat) / 63) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0189 : Poly :=
[
  term ((-1010 : Rat) / 63) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((505 : Rat) / 63) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1010 : Rat) / 63) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((505 : Rat) / 63) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1010 : Rat) / 63) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-505 : Rat) / 63) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-505 : Rat) / 63) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((1010 : Rat) / 63) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0189
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0190 : Poly :=
[
  term ((-50974592504956403 : Rat) / 52219282713192) [(11, 1), (15, 1)]
]

/-- Partial product 190 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0190 : Poly :=
[
  term ((50974592504956403 : Rat) / 26109641356596) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-50974592504956403 : Rat) / 52219282713192) [(0, 2), (11, 1), (15, 1)],
  term ((50974592504956403 : Rat) / 26109641356596) [(1, 1), (11, 2), (15, 1)],
  term ((-50974592504956403 : Rat) / 52219282713192) [(1, 2), (11, 1), (15, 1)],
  term ((-50974592504956403 : Rat) / 26109641356596) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((50974592504956403 : Rat) / 52219282713192) [(11, 1), (14, 2), (15, 1)],
  term ((50974592504956403 : Rat) / 52219282713192) [(11, 1), (15, 3)],
  term ((-50974592504956403 : Rat) / 26109641356596) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0190
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0191 : Poly :=
[
  term ((44 : Rat) / 7) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0191 : Poly :=
[
  term ((-88 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((44 : Rat) / 7) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 7) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((44 : Rat) / 7) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44 : Rat) / 7) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44 : Rat) / 7) [(11, 1), (15, 3), (16, 1)],
  term ((88 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0191
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0192 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 2)]
]

/-- Partial product 192 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0192 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (10, 1), (11, 2)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 2)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 3)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (14, 1)],
  term ((59904 : Rat) / 553) [(11, 2), (14, 2)],
  term ((59904 : Rat) / 553) [(11, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0192
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0193 : Poly :=
[
  term ((-55678923180283967 : Rat) / 52219282713192) [(11, 2), (14, 1)]
]

/-- Partial product 193 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0193 : Poly :=
[
  term ((55678923180283967 : Rat) / 26109641356596) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(0, 2), (11, 2), (14, 1)],
  term ((55678923180283967 : Rat) / 26109641356596) [(1, 1), (11, 3), (14, 1)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(1, 2), (11, 2), (14, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (14, 2)],
  term ((55678923180283967 : Rat) / 52219282713192) [(11, 2), (14, 1), (15, 2)],
  term ((55678923180283967 : Rat) / 52219282713192) [(11, 2), (14, 3)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0193
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0194 : Poly :=
[
  term ((-1729028084357939 : Rat) / 3315510013536) [(12, 1)]
]

/-- Partial product 194 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0194 : Poly :=
[
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 1), (10, 1), (12, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 2), (12, 1)],
  term ((1729028084357939 : Rat) / 1657755006768) [(1, 1), (11, 1), (12, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(1, 2), (12, 1)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(10, 1), (12, 1), (14, 1)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(11, 1), (12, 1), (15, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(12, 1), (14, 2)],
  term ((1729028084357939 : Rat) / 3315510013536) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0194
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0195 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 195 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0195 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(13, 1), (14, 1), (15, 3)],
  term ((-1532199782809 : Rat) / 53723541886) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0195
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0196 : Poly :=
[
  term ((-66292280552106521 : Rat) / 89518770365472) [(13, 1), (15, 1)]
]

/-- Partial product 196 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0196 : Poly :=
[
  term ((66292280552106521 : Rat) / 44759385182736) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-66292280552106521 : Rat) / 89518770365472) [(0, 2), (13, 1), (15, 1)],
  term ((66292280552106521 : Rat) / 44759385182736) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-66292280552106521 : Rat) / 89518770365472) [(1, 2), (13, 1), (15, 1)],
  term ((-66292280552106521 : Rat) / 44759385182736) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-66292280552106521 : Rat) / 44759385182736) [(11, 1), (13, 1), (15, 2)],
  term ((66292280552106521 : Rat) / 89518770365472) [(13, 1), (14, 2), (15, 1)],
  term ((66292280552106521 : Rat) / 89518770365472) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0196
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0197 : Poly :=
[
  term ((14347 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0197 : Poly :=
[
  term ((-14347 : Rat) / 504) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14347 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14347 : Rat) / 504) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14347 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((14347 : Rat) / 504) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14347 : Rat) / 504) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14347 : Rat) / 1008) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14347 : Rat) / 1008) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0197
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0198 : Poly :=
[
  term ((2455848271663099 : Rat) / 6394197883248) [(13, 2)]
]

/-- Partial product 198 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0198 : Poly :=
[
  term ((-2455848271663099 : Rat) / 3197098941624) [(0, 1), (10, 1), (13, 2)],
  term ((2455848271663099 : Rat) / 6394197883248) [(0, 2), (13, 2)],
  term ((-2455848271663099 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2)],
  term ((2455848271663099 : Rat) / 6394197883248) [(1, 2), (13, 2)],
  term ((2455848271663099 : Rat) / 3197098941624) [(10, 1), (13, 2), (14, 1)],
  term ((2455848271663099 : Rat) / 3197098941624) [(11, 1), (13, 2), (15, 1)],
  term ((-2455848271663099 : Rat) / 6394197883248) [(13, 2), (14, 2)],
  term ((-2455848271663099 : Rat) / 6394197883248) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0198
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0199 : Poly :=
[
  term ((-6655 : Rat) / 504) [(13, 2), (16, 1)]
]

/-- Partial product 199 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0199 : Poly :=
[
  term ((6655 : Rat) / 252) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-6655 : Rat) / 504) [(0, 2), (13, 2), (16, 1)],
  term ((6655 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6655 : Rat) / 504) [(1, 2), (13, 2), (16, 1)],
  term ((-6655 : Rat) / 252) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6655 : Rat) / 252) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6655 : Rat) / 504) [(13, 2), (14, 2), (16, 1)],
  term ((6655 : Rat) / 504) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0199
        rs_R009_ueqv_R009YNNNN_generator_24_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_24_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_24_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_24_0100,
  rs_R009_ueqv_R009YNNNN_partial_24_0101,
  rs_R009_ueqv_R009YNNNN_partial_24_0102,
  rs_R009_ueqv_R009YNNNN_partial_24_0103,
  rs_R009_ueqv_R009YNNNN_partial_24_0104,
  rs_R009_ueqv_R009YNNNN_partial_24_0105,
  rs_R009_ueqv_R009YNNNN_partial_24_0106,
  rs_R009_ueqv_R009YNNNN_partial_24_0107,
  rs_R009_ueqv_R009YNNNN_partial_24_0108,
  rs_R009_ueqv_R009YNNNN_partial_24_0109,
  rs_R009_ueqv_R009YNNNN_partial_24_0110,
  rs_R009_ueqv_R009YNNNN_partial_24_0111,
  rs_R009_ueqv_R009YNNNN_partial_24_0112,
  rs_R009_ueqv_R009YNNNN_partial_24_0113,
  rs_R009_ueqv_R009YNNNN_partial_24_0114,
  rs_R009_ueqv_R009YNNNN_partial_24_0115,
  rs_R009_ueqv_R009YNNNN_partial_24_0116,
  rs_R009_ueqv_R009YNNNN_partial_24_0117,
  rs_R009_ueqv_R009YNNNN_partial_24_0118,
  rs_R009_ueqv_R009YNNNN_partial_24_0119,
  rs_R009_ueqv_R009YNNNN_partial_24_0120,
  rs_R009_ueqv_R009YNNNN_partial_24_0121,
  rs_R009_ueqv_R009YNNNN_partial_24_0122,
  rs_R009_ueqv_R009YNNNN_partial_24_0123,
  rs_R009_ueqv_R009YNNNN_partial_24_0124,
  rs_R009_ueqv_R009YNNNN_partial_24_0125,
  rs_R009_ueqv_R009YNNNN_partial_24_0126,
  rs_R009_ueqv_R009YNNNN_partial_24_0127,
  rs_R009_ueqv_R009YNNNN_partial_24_0128,
  rs_R009_ueqv_R009YNNNN_partial_24_0129,
  rs_R009_ueqv_R009YNNNN_partial_24_0130,
  rs_R009_ueqv_R009YNNNN_partial_24_0131,
  rs_R009_ueqv_R009YNNNN_partial_24_0132,
  rs_R009_ueqv_R009YNNNN_partial_24_0133,
  rs_R009_ueqv_R009YNNNN_partial_24_0134,
  rs_R009_ueqv_R009YNNNN_partial_24_0135,
  rs_R009_ueqv_R009YNNNN_partial_24_0136,
  rs_R009_ueqv_R009YNNNN_partial_24_0137,
  rs_R009_ueqv_R009YNNNN_partial_24_0138,
  rs_R009_ueqv_R009YNNNN_partial_24_0139,
  rs_R009_ueqv_R009YNNNN_partial_24_0140,
  rs_R009_ueqv_R009YNNNN_partial_24_0141,
  rs_R009_ueqv_R009YNNNN_partial_24_0142,
  rs_R009_ueqv_R009YNNNN_partial_24_0143,
  rs_R009_ueqv_R009YNNNN_partial_24_0144,
  rs_R009_ueqv_R009YNNNN_partial_24_0145,
  rs_R009_ueqv_R009YNNNN_partial_24_0146,
  rs_R009_ueqv_R009YNNNN_partial_24_0147,
  rs_R009_ueqv_R009YNNNN_partial_24_0148,
  rs_R009_ueqv_R009YNNNN_partial_24_0149,
  rs_R009_ueqv_R009YNNNN_partial_24_0150,
  rs_R009_ueqv_R009YNNNN_partial_24_0151,
  rs_R009_ueqv_R009YNNNN_partial_24_0152,
  rs_R009_ueqv_R009YNNNN_partial_24_0153,
  rs_R009_ueqv_R009YNNNN_partial_24_0154,
  rs_R009_ueqv_R009YNNNN_partial_24_0155,
  rs_R009_ueqv_R009YNNNN_partial_24_0156,
  rs_R009_ueqv_R009YNNNN_partial_24_0157,
  rs_R009_ueqv_R009YNNNN_partial_24_0158,
  rs_R009_ueqv_R009YNNNN_partial_24_0159,
  rs_R009_ueqv_R009YNNNN_partial_24_0160,
  rs_R009_ueqv_R009YNNNN_partial_24_0161,
  rs_R009_ueqv_R009YNNNN_partial_24_0162,
  rs_R009_ueqv_R009YNNNN_partial_24_0163,
  rs_R009_ueqv_R009YNNNN_partial_24_0164,
  rs_R009_ueqv_R009YNNNN_partial_24_0165,
  rs_R009_ueqv_R009YNNNN_partial_24_0166,
  rs_R009_ueqv_R009YNNNN_partial_24_0167,
  rs_R009_ueqv_R009YNNNN_partial_24_0168,
  rs_R009_ueqv_R009YNNNN_partial_24_0169,
  rs_R009_ueqv_R009YNNNN_partial_24_0170,
  rs_R009_ueqv_R009YNNNN_partial_24_0171,
  rs_R009_ueqv_R009YNNNN_partial_24_0172,
  rs_R009_ueqv_R009YNNNN_partial_24_0173,
  rs_R009_ueqv_R009YNNNN_partial_24_0174,
  rs_R009_ueqv_R009YNNNN_partial_24_0175,
  rs_R009_ueqv_R009YNNNN_partial_24_0176,
  rs_R009_ueqv_R009YNNNN_partial_24_0177,
  rs_R009_ueqv_R009YNNNN_partial_24_0178,
  rs_R009_ueqv_R009YNNNN_partial_24_0179,
  rs_R009_ueqv_R009YNNNN_partial_24_0180,
  rs_R009_ueqv_R009YNNNN_partial_24_0181,
  rs_R009_ueqv_R009YNNNN_partial_24_0182,
  rs_R009_ueqv_R009YNNNN_partial_24_0183,
  rs_R009_ueqv_R009YNNNN_partial_24_0184,
  rs_R009_ueqv_R009YNNNN_partial_24_0185,
  rs_R009_ueqv_R009YNNNN_partial_24_0186,
  rs_R009_ueqv_R009YNNNN_partial_24_0187,
  rs_R009_ueqv_R009YNNNN_partial_24_0188,
  rs_R009_ueqv_R009YNNNN_partial_24_0189,
  rs_R009_ueqv_R009YNNNN_partial_24_0190,
  rs_R009_ueqv_R009YNNNN_partial_24_0191,
  rs_R009_ueqv_R009YNNNN_partial_24_0192,
  rs_R009_ueqv_R009YNNNN_partial_24_0193,
  rs_R009_ueqv_R009YNNNN_partial_24_0194,
  rs_R009_ueqv_R009YNNNN_partial_24_0195,
  rs_R009_ueqv_R009YNNNN_partial_24_0196,
  rs_R009_ueqv_R009YNNNN_partial_24_0197,
  rs_R009_ueqv_R009YNNNN_partial_24_0198,
  rs_R009_ueqv_R009YNNNN_partial_24_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_24_0100_0199 : Poly :=
[
  term ((-103117777868939719 : Rat) / 26109641356596) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-8206433451626359 : Rat) / 6394197883248) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3965 : Rat) / 504) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1294767049718059 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((81437404915439653 : Rat) / 26109641356596) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((1133 : Rat) / 126) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 2), (10, 1)],
  term ((1873880334375407 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((28544163861425599 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((680 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6628453501018739 : Rat) / 1864974382614) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-128 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((40086765847094873 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-44433793701461 : Rat) / 103609687923) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((1947425923950239 : Rat) / 8703213785532) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((469979739153613 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((-10281030802289 : Rat) / 17986491936) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((50631850194497 : Rat) / 26979737904) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((-22115843261516593 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((13253571547156877 : Rat) / 11189846295684) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-358735671857022361 : Rat) / 104438565426384) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((60305982811061 : Rat) / 101495204496) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-815 : Rat) / 56) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((50515 : Rat) / 504) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-13107408701510153 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((159 : Rat) / 14) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((95192943734101088 : Rat) / 19582231017447) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-10147 : Rat) / 126) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2746689497209405 : Rat) / 8703213785532) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-2082652186154339 : Rat) / 1065699647208) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((3935 : Rat) / 84) [(0, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((326307722320892771 : Rat) / 78328924069788) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-767 : Rat) / 21) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((58581379599448375 : Rat) / 39164462034894) [(0, 1), (3, 2), (6, 1), (10, 1)],
  term ((-52872648474478825 : Rat) / 78328924069788) [(0, 1), (3, 2), (10, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((2698685004451085 : Rat) / 26109641356596) [(0, 1), (3, 2), (10, 2)],
  term ((3064399565618 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((88776 : Rat) / 79) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((941242657 : Rat) / 41635398) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((725 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-628 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 83270796) [(0, 1), (6, 1), (9, 2), (10, 1)],
  term ((3496272244119451 : Rat) / 8703213785532) [(0, 1), (6, 1), (10, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 2)],
  term ((-82543665854 : Rat) / 80296839) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-1774654659347555 : Rat) / 1450535630922) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((4156194155610421 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-1840 : Rat) / 21) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-13119521360128595 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((1544 : Rat) / 21) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-755374492924837 : Rat) / 1450535630922) [(0, 1), (7, 2), (10, 1)],
  term ((-1059650791225 : Rat) / 59205535956) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2062912101660059 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((1005342781871335 : Rat) / 1598549470812) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7437955160920331 : Rat) / 12788395766496) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((85 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((4353333743611 : Rat) / 14801383989) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term (-30 : Rat) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2285794014790883 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((176 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((128159902247 : Rat) / 2569498848) [(0, 1), (9, 2), (10, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((-115126691849 : Rat) / 374718582) [(0, 1), (9, 2), (10, 2)],
  term ((970106309053067 : Rat) / 13054820678298) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((747007575948671 : Rat) / 1598549470812) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2245 : Rat) / 126) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (15 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-21492491482134149 : Rat) / 13054820678298) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1010 : Rat) / 63) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((50974592504956403 : Rat) / 26109641356596) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-88 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (10, 1), (11, 2)],
  term ((55678923180283967 : Rat) / 26109641356596) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 1), (10, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((66292280552106521 : Rat) / 44759385182736) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-14347 : Rat) / 504) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2455848271663099 : Rat) / 3197098941624) [(0, 1), (10, 1), (13, 2)],
  term ((6655 : Rat) / 252) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((553040367401411 : Rat) / 4351606892766) [(0, 1), (10, 2)],
  term ((55678923180283967 : Rat) / 26109641356596) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((747007575948671 : Rat) / 1598549470812) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((2245 : Rat) / 126) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(0, 1), (10, 2), (14, 1)],
  term ((-21492491482134149 : Rat) / 13054820678298) [(0, 1), (10, 2), (15, 2)],
  term ((-1010 : Rat) / 63) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((103117777868939719 : Rat) / 52219282713192) [(0, 2), (2, 1), (11, 2)],
  term ((8206433451626359 : Rat) / 12788395766496) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((3965 : Rat) / 1008) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1294767049718059 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 1)],
  term ((-81437404915439653 : Rat) / 52219282713192) [(0, 2), (2, 1), (15, 2)],
  term ((-1133 : Rat) / 252) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((-1873880334375407 : Rat) / 13054820678298) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((-28544163861425599 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((6628453501018739 : Rat) / 3729948765228) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((64 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-40086765847094873 : Rat) / 52219282713192) [(0, 2), (3, 1), (7, 1)],
  term ((-1947425923950239 : Rat) / 17406427571064) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((44433793701461 : Rat) / 207219375846) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-469979739153613 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1)],
  term ((-50631850194497 : Rat) / 53959475808) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((10281030802289 : Rat) / 35972983872) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((2746689497209405 : Rat) / 17406427571064) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((2082652186154339 : Rat) / 2131399294416) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-3935 : Rat) / 168) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-326307722320892771 : Rat) / 156657848139576) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((767 : Rat) / 42) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((22115843261516593 : Rat) / 52219282713192) [(0, 2), (3, 1), (11, 1)],
  term ((-13253571547156877 : Rat) / 22379692591368) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((358735671857022361 : Rat) / 208877130852768) [(0, 2), (3, 1), (13, 1)],
  term ((-60305982811061 : Rat) / 202990408992) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((815 : Rat) / 112) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-50515 : Rat) / 1008) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((13107408701510153 : Rat) / 52219282713192) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-159 : Rat) / 28) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47596471867050544 : Rat) / 19582231017447) [(0, 2), (3, 1), (15, 1)],
  term ((10147 : Rat) / 252) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((52872648474478825 : Rat) / 156657848139576) [(0, 2), (3, 2)],
  term ((-58581379599448375 : Rat) / 78328924069788) [(0, 2), (3, 2), (6, 1)],
  term ((-2698685004451085 : Rat) / 52219282713192) [(0, 2), (3, 2), (10, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(0, 2), (3, 2), (14, 1)],
  term ((-3496272244119451 : Rat) / 17406427571064) [(0, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-44388 : Rat) / 79) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-941242657 : Rat) / 83270796) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((314 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 166541592) [(0, 2), (6, 1), (9, 2)],
  term ((1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (6, 1), (14, 1)],
  term ((41271832927 : Rat) / 80296839) [(0, 2), (7, 1), (9, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((1774654659347555 : Rat) / 2901071261844) [(0, 2), (7, 1), (11, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-4156194155610421 : Rat) / 13054820678298) [(0, 2), (7, 1), (13, 1)],
  term ((920 : Rat) / 21) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((13119521360128595 : Rat) / 26109641356596) [(0, 2), (7, 1), (15, 1)],
  term ((-772 : Rat) / 21) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((755374492924837 : Rat) / 2901071261844) [(0, 2), (7, 2)],
  term ((119808 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4353333743611 : Rat) / 29602767978) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term (15 : Rat) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2285794014790883 : Rat) / 6394197883248) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-88 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1059650791225 : Rat) / 118411071912) [(0, 2), (9, 1), (11, 1)],
  term ((2062912101660059 : Rat) / 6394197883248) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1005342781871335 : Rat) / 3197098941624) [(0, 2), (9, 1), (13, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 16) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7437955160920331 : Rat) / 25576791532992) [(0, 2), (9, 1), (15, 1)],
  term ((-85 : Rat) / 28) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(0, 2), (9, 2)],
  term ((115126691849 : Rat) / 749437164) [(0, 2), (9, 2), (10, 1)],
  term ((210703568101 : Rat) / 5995497312) [(0, 2), (9, 2), (14, 1)],
  term ((-553040367401411 : Rat) / 8703213785532) [(0, 2), (10, 1)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2245 : Rat) / 252) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(0, 2), (10, 1), (14, 1)],
  term ((21492491482134149 : Rat) / 26109641356596) [(0, 2), (10, 1), (15, 2)],
  term ((505 : Rat) / 63) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-970106309053067 : Rat) / 26109641356596) [(0, 2), (11, 1), (13, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2245 : Rat) / 252) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((21492491482134149 : Rat) / 26109641356596) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((505 : Rat) / 63) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50974592504956403 : Rat) / 52219282713192) [(0, 2), (11, 1), (15, 1)],
  term ((44 : Rat) / 7) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (11, 2)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(0, 2), (11, 2), (14, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 2), (12, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-66292280552106521 : Rat) / 89518770365472) [(0, 2), (13, 1), (15, 1)],
  term ((14347 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((2455848271663099 : Rat) / 6394197883248) [(0, 2), (13, 2)],
  term ((-6655 : Rat) / 504) [(0, 2), (13, 2), (16, 1)],
  term ((-8206433451626359 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3965 : Rat) / 504) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1294767049718059 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((81437404915439653 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1133 : Rat) / 126) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-103117777868939719 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 3)],
  term ((1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)],
  term ((1873880334375407 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(1, 1), (3, 1), (6, 1), (9, 1), (11, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((680 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6628453501018739 : Rat) / 1864974382614) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-128 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((28544163861425599 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((1947425923950239 : Rat) / 8703213785532) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((40086765847094873 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-44433793701461 : Rat) / 103609687923) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((50631850194497 : Rat) / 26979737904) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((469979739153613 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-10281030802289 : Rat) / 17986491936) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((-2082652186154339 : Rat) / 1065699647208) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((3935 : Rat) / 84) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((326307722320892771 : Rat) / 78328924069788) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-767 : Rat) / 21) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2746689497209405 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-358735671857022361 : Rat) / 104438565426384) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((60305982811061 : Rat) / 101495204496) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-815 : Rat) / 56) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((50515 : Rat) / 504) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13107408701510153 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((159 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((95192943734101088 : Rat) / 19582231017447) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-10147 : Rat) / 126) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22115843261516593 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 2)],
  term ((13253571547156877 : Rat) / 11189846295684) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((58581379599448375 : Rat) / 39164462034894) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((2698685004451085 : Rat) / 26109641356596) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-52872648474478825 : Rat) / 78328924069788) [(1, 1), (3, 2), (11, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((941242657 : Rat) / 41635398) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((725 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-628 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((88776 : Rat) / 79) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-2172201733 : Rat) / 83270796) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((3496272244119451 : Rat) / 8703213785532) [(1, 1), (6, 1), (11, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-82543665854 : Rat) / 80296839) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((4156194155610421 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1840 : Rat) / 21) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13119521360128595 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((1544 : Rat) / 21) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1774654659347555 : Rat) / 1450535630922) [(1, 1), (7, 1), (11, 2)],
  term ((-12449123235323125 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((-755374492924837 : Rat) / 1450535630922) [(1, 1), (7, 2), (11, 1)],
  term ((4353333743611 : Rat) / 14801383989) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term (-30 : Rat) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2285794014790883 : Rat) / 3197098941624) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((176 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((1005342781871335 : Rat) / 1598549470812) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 8) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7437955160920331 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((85 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1059650791225 : Rat) / 59205535956) [(1, 1), (9, 1), (11, 2)],
  term ((-2062912101660059 : Rat) / 3197098941624) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((-115126691849 : Rat) / 374718582) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((128159902247 : Rat) / 2569498848) [(1, 1), (9, 2), (11, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((553040367401411 : Rat) / 4351606892766) [(1, 1), (10, 1), (11, 1)],
  term ((747007575948671 : Rat) / 1598549470812) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2245 : Rat) / 126) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-21492491482134149 : Rat) / 13054820678298) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1010 : Rat) / 63) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((55678923180283967 : Rat) / 26109641356596) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((1729028084357939 : Rat) / 1657755006768) [(1, 1), (11, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((66292280552106521 : Rat) / 44759385182736) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14347 : Rat) / 504) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2455848271663099 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2)],
  term ((6655 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((970106309053067 : Rat) / 13054820678298) [(1, 1), (11, 2), (13, 1)],
  term ((747007575948671 : Rat) / 1598549470812) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((2245 : Rat) / 126) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term (15 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-21492491482134149 : Rat) / 13054820678298) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1010 : Rat) / 63) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((50974592504956403 : Rat) / 26109641356596) [(1, 1), (11, 2), (15, 1)],
  term ((-88 : Rat) / 7) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (11, 3)],
  term ((55678923180283967 : Rat) / 26109641356596) [(1, 1), (11, 3), (14, 1)],
  term ((103117777868939719 : Rat) / 52219282713192) [(1, 2), (2, 1), (11, 2)],
  term ((8206433451626359 : Rat) / 12788395766496) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((3965 : Rat) / 1008) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1294767049718059 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 1)],
  term ((-81437404915439653 : Rat) / 52219282713192) [(1, 2), (2, 1), (15, 2)],
  term ((-1133 : Rat) / 252) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((-1873880334375407 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-28544163861425599 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((6628453501018739 : Rat) / 3729948765228) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-40086765847094873 : Rat) / 52219282713192) [(1, 2), (3, 1), (7, 1)],
  term ((-1947425923950239 : Rat) / 17406427571064) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((44433793701461 : Rat) / 207219375846) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-469979739153613 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1)],
  term ((-50631850194497 : Rat) / 53959475808) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((10281030802289 : Rat) / 35972983872) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((2746689497209405 : Rat) / 17406427571064) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((2082652186154339 : Rat) / 2131399294416) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((-3935 : Rat) / 168) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-326307722320892771 : Rat) / 156657848139576) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((767 : Rat) / 42) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((22115843261516593 : Rat) / 52219282713192) [(1, 2), (3, 1), (11, 1)],
  term ((-13253571547156877 : Rat) / 22379692591368) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((358735671857022361 : Rat) / 208877130852768) [(1, 2), (3, 1), (13, 1)],
  term ((-60305982811061 : Rat) / 202990408992) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((815 : Rat) / 112) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-50515 : Rat) / 1008) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((13107408701510153 : Rat) / 52219282713192) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-159 : Rat) / 28) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47596471867050544 : Rat) / 19582231017447) [(1, 2), (3, 1), (15, 1)],
  term ((10147 : Rat) / 252) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((52872648474478825 : Rat) / 156657848139576) [(1, 2), (3, 2)],
  term ((-58581379599448375 : Rat) / 78328924069788) [(1, 2), (3, 2), (6, 1)],
  term ((-2698685004451085 : Rat) / 52219282713192) [(1, 2), (3, 2), (10, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(1, 2), (3, 2), (14, 1)],
  term ((-3496272244119451 : Rat) / 17406427571064) [(1, 2), (6, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-44388 : Rat) / 79) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-941242657 : Rat) / 83270796) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((314 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 2), (6, 1), (9, 2)],
  term ((1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (6, 1), (14, 1)],
  term ((41271832927 : Rat) / 80296839) [(1, 2), (7, 1), (9, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((1774654659347555 : Rat) / 2901071261844) [(1, 2), (7, 1), (11, 1)],
  term ((12449123235323125 : Rat) / 52219282713192) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-4156194155610421 : Rat) / 13054820678298) [(1, 2), (7, 1), (13, 1)],
  term ((920 : Rat) / 21) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((13119521360128595 : Rat) / 26109641356596) [(1, 2), (7, 1), (15, 1)],
  term ((-772 : Rat) / 21) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((755374492924837 : Rat) / 2901071261844) [(1, 2), (7, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4353333743611 : Rat) / 29602767978) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term (15 : Rat) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2285794014790883 : Rat) / 6394197883248) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-88 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1059650791225 : Rat) / 118411071912) [(1, 2), (9, 1), (11, 1)],
  term ((2062912101660059 : Rat) / 6394197883248) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1005342781871335 : Rat) / 3197098941624) [(1, 2), (9, 1), (13, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 16) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((7437955160920331 : Rat) / 25576791532992) [(1, 2), (9, 1), (15, 1)],
  term ((-85 : Rat) / 28) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(1, 2), (9, 2)],
  term ((115126691849 : Rat) / 749437164) [(1, 2), (9, 2), (10, 1)],
  term ((210703568101 : Rat) / 5995497312) [(1, 2), (9, 2), (14, 1)],
  term ((-553040367401411 : Rat) / 8703213785532) [(1, 2), (10, 1)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2245 : Rat) / 252) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(1, 2), (10, 1), (14, 1)],
  term ((21492491482134149 : Rat) / 26109641356596) [(1, 2), (10, 1), (15, 2)],
  term ((505 : Rat) / 63) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-970106309053067 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1)],
  term ((-747007575948671 : Rat) / 3197098941624) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2245 : Rat) / 252) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15 : Rat) / 2) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((21492491482134149 : Rat) / 26109641356596) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((505 : Rat) / 63) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50974592504956403 : Rat) / 52219282713192) [(1, 2), (11, 1), (15, 1)],
  term ((44 : Rat) / 7) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(1, 2), (11, 2)],
  term ((-55678923180283967 : Rat) / 52219282713192) [(1, 2), (11, 2), (14, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(1, 2), (12, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-66292280552106521 : Rat) / 89518770365472) [(1, 2), (13, 1), (15, 1)],
  term ((14347 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((2455848271663099 : Rat) / 6394197883248) [(1, 2), (13, 2)],
  term ((-6655 : Rat) / 504) [(1, 2), (13, 2), (16, 1)],
  term ((103117777868939719 : Rat) / 26109641356596) [(2, 1), (10, 1), (11, 2), (14, 1)],
  term ((8206433451626359 : Rat) / 6394197883248) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3965 : Rat) / 504) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81437404915439653 : Rat) / 26109641356596) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1133 : Rat) / 126) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1294767049718059 : Rat) / 13054820678298) [(2, 1), (10, 1), (14, 2)],
  term ((8206433451626359 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((3965 : Rat) / 504) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1294767049718059 : Rat) / 13054820678298) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-81437404915439653 : Rat) / 26109641356596) [(2, 1), (11, 1), (15, 3)],
  term ((-1133 : Rat) / 126) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-103117777868939719 : Rat) / 52219282713192) [(2, 1), (11, 2), (14, 2)],
  term ((-103117777868939719 : Rat) / 52219282713192) [(2, 1), (11, 2), (15, 2)],
  term ((103117777868939719 : Rat) / 26109641356596) [(2, 1), (11, 3), (15, 1)],
  term ((-8206433451626359 : Rat) / 12788395766496) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3965 : Rat) / 1008) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8206433451626359 : Rat) / 12788395766496) [(2, 1), (13, 1), (15, 3)],
  term ((-3965 : Rat) / 1008) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1294767049718059 : Rat) / 26109641356596) [(2, 1), (14, 1), (15, 2)],
  term ((81437404915439653 : Rat) / 52219282713192) [(2, 1), (14, 2), (15, 2)],
  term ((1133 : Rat) / 252) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1294767049718059 : Rat) / 26109641356596) [(2, 1), (14, 3)],
  term ((81437404915439653 : Rat) / 52219282713192) [(2, 1), (15, 4)],
  term ((1133 : Rat) / 252) [(2, 1), (15, 4), (16, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(2, 2), (10, 1), (14, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(2, 2), (11, 1), (15, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (14, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (15, 2)],
  term ((-1873880334375407 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (10, 1), (14, 1)],
  term ((-1873880334375407 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((1873880334375407 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((1873880334375407 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((13576260831250 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-28544163861425599 : Rat) / 13054820678298) [(3, 1), (6, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((-680 : Rat) / 63) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6628453501018739 : Rat) / 1864974382614) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((128 : Rat) / 9) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (6, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-680 : Rat) / 63) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((28544163861425599 : Rat) / 26109641356596) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((121342512875687945 : Rat) / 26109641356596) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((128 : Rat) / 9) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-28544163861425599 : Rat) / 13054820678298) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((340 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((340 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((-6628453501018739 : Rat) / 3729948765228) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (6, 1), (14, 3), (15, 1)],
  term ((-6628453501018739 : Rat) / 3729948765228) [(3, 1), (6, 1), (15, 3)],
  term ((-64 : Rat) / 9) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-1947425923950239 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-40086765847094873 : Rat) / 26109641356596) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((9412303265795687 : Rat) / 17406427571064) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((1947425923950239 : Rat) / 17406427571064) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((-1947425923950239 : Rat) / 8703213785532) [(3, 1), (7, 1), (10, 2), (14, 1)],
  term ((44433793701461 : Rat) / 103609687923) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-40086765847094873 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-44433793701461 : Rat) / 207219375846) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((40086765847094873 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 2)],
  term ((-44433793701461 : Rat) / 207219375846) [(3, 1), (7, 1), (14, 3)],
  term ((40086765847094873 : Rat) / 52219282713192) [(3, 1), (7, 1), (15, 2)],
  term ((-50631850194497 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-469979739153613 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((20368735650341 : Rat) / 13489868952) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((50631850194497 : Rat) / 53959475808) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-50631850194497 : Rat) / 26979737904) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((10281030802289 : Rat) / 17986491936) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-469979739153613 : Rat) / 161878427424) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10281030802289 : Rat) / 35972983872) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((469979739153613 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 2)],
  term ((-10281030802289 : Rat) / 35972983872) [(3, 1), (9, 1), (14, 3)],
  term ((469979739153613 : Rat) / 323756854848) [(3, 1), (9, 1), (15, 2)],
  term ((2082652186154339 : Rat) / 1065699647208) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3935 : Rat) / 84) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22115843261516593 : Rat) / 26109641356596) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-210270207135080923 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-677335650116670187 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((767 : Rat) / 21) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((2746689497209405 : Rat) / 8703213785532) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((358735671857022361 : Rat) / 104438565426384) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-50515 : Rat) / 504) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-837269456296655 : Rat) / 532849823604) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((1595 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2082652186154339 : Rat) / 2131399294416) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((3935 : Rat) / 168) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-95192943734101088 : Rat) / 19582231017447) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((10147 : Rat) / 126) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((404952174529953689 : Rat) / 156657848139576) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-622 : Rat) / 21) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((326307722320892771 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 3)],
  term ((-767 : Rat) / 42) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((2746689497209405 : Rat) / 8703213785532) [(3, 1), (10, 2), (11, 1), (14, 1)],
  term ((2082652186154339 : Rat) / 1065699647208) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((-3935 : Rat) / 84) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-326307722320892771 : Rat) / 78328924069788) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((767 : Rat) / 21) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-60305982811061 : Rat) / 101495204496) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((815 : Rat) / 56) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((358735671857022361 : Rat) / 104438565426384) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-50515 : Rat) / 504) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((171419453039159057 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-159 : Rat) / 14) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22115843261516593 : Rat) / 52219282713192) [(3, 1), (11, 1), (14, 2)],
  term ((13253571547156877 : Rat) / 22379692591368) [(3, 1), (11, 1), (14, 3)],
  term ((-827891079657358483 : Rat) / 156657848139576) [(3, 1), (11, 1), (15, 2)],
  term ((10147 : Rat) / 126) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13253571547156877 : Rat) / 11189846295684) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((22115843261516593 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)],
  term ((60305982811061 : Rat) / 202990408992) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-815 : Rat) / 112) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-358735671857022361 : Rat) / 208877130852768) [(3, 1), (13, 1), (14, 2)],
  term ((50515 : Rat) / 1008) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((60305982811061 : Rat) / 202990408992) [(3, 1), (13, 1), (14, 3)],
  term ((-815 : Rat) / 112) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((-358735671857022361 : Rat) / 208877130852768) [(3, 1), (13, 1), (15, 2)],
  term ((50515 : Rat) / 1008) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13107408701510153 : Rat) / 52219282713192) [(3, 1), (14, 1), (15, 3)],
  term ((159 : Rat) / 28) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((47596471867050544 : Rat) / 19582231017447) [(3, 1), (14, 2), (15, 1)],
  term ((-10147 : Rat) / 252) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13107408701510153 : Rat) / 52219282713192) [(3, 1), (14, 3), (15, 1)],
  term ((159 : Rat) / 28) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((47596471867050544 : Rat) / 19582231017447) [(3, 1), (15, 3)],
  term ((-10147 : Rat) / 252) [(3, 1), (15, 3), (16, 1)],
  term ((-58581379599448375 : Rat) / 39164462034894) [(3, 2), (6, 1), (10, 1), (14, 1)],
  term ((-58581379599448375 : Rat) / 39164462034894) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((58581379599448375 : Rat) / 78328924069788) [(3, 2), (6, 1), (14, 2)],
  term ((58581379599448375 : Rat) / 78328924069788) [(3, 2), (6, 1), (15, 2)],
  term ((-2698685004451085 : Rat) / 26109641356596) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((52872648474478825 : Rat) / 78328924069788) [(3, 2), (10, 1), (14, 1)],
  term ((-517816195547405 : Rat) / 17406427571064) [(3, 2), (10, 1), (14, 2)],
  term ((2698685004451085 : Rat) / 52219282713192) [(3, 2), (10, 1), (15, 2)],
  term ((-2698685004451085 : Rat) / 26109641356596) [(3, 2), (10, 2), (14, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((52872648474478825 : Rat) / 78328924069788) [(3, 2), (11, 1), (15, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(3, 2), (14, 1), (15, 2)],
  term ((-52872648474478825 : Rat) / 156657848139576) [(3, 2), (14, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(3, 2), (14, 3)],
  term ((-52872648474478825 : Rat) / 156657848139576) [(3, 2), (15, 2)],
  term ((-3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-88776 : Rat) / 79) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-941242657 : Rat) / 41635398) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((628 : Rat) / 21) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 41635398) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-725 : Rat) / 21) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44388 : Rat) / 79) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((1097078544792059 : Rat) / 1450535630922) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((628 : Rat) / 21) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-88776 : Rat) / 79) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (15, 3)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (14, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (15, 2)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3496272244119451 : Rat) / 8703213785532) [(6, 1), (10, 1), (14, 1)],
  term ((-131992624421645 : Rat) / 1450535630922) [(6, 1), (10, 1), (14, 2)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (15, 2)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3496272244119451 : Rat) / 8703213785532) [(6, 1), (11, 1), (15, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (14, 1), (15, 2)],
  term ((3496272244119451 : Rat) / 17406427571064) [(6, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (14, 3)],
  term ((3496272244119451 : Rat) / 17406427571064) [(6, 1), (15, 2)],
  term ((82543665854 : Rat) / 80296839) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((82543665854 : Rat) / 80296839) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-41271832927 : Rat) / 80296839) [(7, 1), (9, 1), (14, 2)],
  term ((-41271832927 : Rat) / 80296839) [(7, 1), (9, 1), (15, 2)],
  term ((1774654659347555 : Rat) / 1450535630922) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-4156194155610421 : Rat) / 6527410339149) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((1840 : Rat) / 21) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((13119521360128595 : Rat) / 13054820678298) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1544 : Rat) / 21) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (10, 1), (15, 3)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-4156194155610421 : Rat) / 6527410339149) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1840 : Rat) / 21) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1774654659347555 : Rat) / 2901071261844) [(7, 1), (11, 1), (14, 2)],
  term ((-12449123235323125 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 3)],
  term ((1466735826589885 : Rat) / 3729948765228) [(7, 1), (11, 1), (15, 2)],
  term ((-1544 : Rat) / 21) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((12449123235323125 : Rat) / 26109641356596) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((1774654659347555 : Rat) / 1450535630922) [(7, 1), (11, 2), (15, 1)],
  term ((4156194155610421 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 2)],
  term ((-920 : Rat) / 21) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((4156194155610421 : Rat) / 13054820678298) [(7, 1), (13, 1), (15, 2)],
  term ((-920 : Rat) / 21) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13119521360128595 : Rat) / 26109641356596) [(7, 1), (14, 2), (15, 1)],
  term ((772 : Rat) / 21) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13119521360128595 : Rat) / 26109641356596) [(7, 1), (15, 3)],
  term ((772 : Rat) / 21) [(7, 1), (15, 3), (16, 1)],
  term ((755374492924837 : Rat) / 1450535630922) [(7, 2), (10, 1), (14, 1)],
  term ((755374492924837 : Rat) / 1450535630922) [(7, 2), (11, 1), (15, 1)],
  term ((-755374492924837 : Rat) / 2901071261844) [(7, 2), (14, 2)],
  term ((-755374492924837 : Rat) / 2901071261844) [(7, 2), (15, 2)],
  term ((-4353333743611 : Rat) / 14801383989) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (30 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1059650791225 : Rat) / 59205535956) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((17345030838005 : Rat) / 40469606856) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((1593139349333219 : Rat) / 3197098941624) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-176 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((239616 : Rat) / 553) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1005342781871335 : Rat) / 1598549470812) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 8) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((108242905555 : Rat) / 1498874328) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-115 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((4353333743611 : Rat) / 29602767978) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term (-15 : Rat) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((7437955160920331 : Rat) / 12788395766496) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-85 : Rat) / 14) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2818340417555 : Rat) / 11562744816) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((23 : Rat) / 7) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2285794014790883 : Rat) / 6394197883248) [(9, 1), (10, 1), (15, 3)],
  term ((88 : Rat) / 7) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((239616 : Rat) / 553) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-4353333743611 : Rat) / 14801383989) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term (30 : Rat) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((2285794014790883 : Rat) / 3197098941624) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-176 : Rat) / 7) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((305 : Rat) / 28) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1005342781871335 : Rat) / 1598549470812) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 8) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1335660337777091 : Rat) / 6394197883248) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1059650791225 : Rat) / 118411071912) [(9, 1), (11, 1), (14, 2)],
  term ((-2062912101660059 : Rat) / 6394197883248) [(9, 1), (11, 1), (14, 3)],
  term ((7323512875468031 : Rat) / 12788395766496) [(9, 1), (11, 1), (15, 2)],
  term ((-85 : Rat) / 14) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2062912101660059 : Rat) / 3197098941624) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((1059650791225 : Rat) / 59205535956) [(9, 1), (11, 2), (15, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1005342781871335 : Rat) / 3197098941624) [(9, 1), (13, 1), (14, 2)],
  term ((-55 : Rat) / 16) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 3)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((1005342781871335 : Rat) / 3197098941624) [(9, 1), (13, 1), (15, 2)],
  term ((-55 : Rat) / 16) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 1), (15, 3)],
  term ((65 : Rat) / 14) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7437955160920331 : Rat) / 25576791532992) [(9, 1), (14, 2), (15, 1)],
  term ((85 : Rat) / 28) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 3), (15, 1)],
  term ((65 : Rat) / 14) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-7437955160920331 : Rat) / 25576791532992) [(9, 1), (15, 3)],
  term ((85 : Rat) / 28) [(9, 1), (15, 3), (16, 1)],
  term ((115126691849 : Rat) / 374718582) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(9, 2), (10, 1), (14, 1)],
  term ((-249803199295 : Rat) / 2997748656) [(9, 2), (10, 1), (14, 2)],
  term ((-115126691849 : Rat) / 749437164) [(9, 2), (10, 1), (15, 2)],
  term ((115126691849 : Rat) / 374718582) [(9, 2), (10, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(9, 2), (11, 1), (15, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 1), (15, 2)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 3)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (15, 2)],
  term ((-970106309053067 : Rat) / 13054820678298) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term (-15 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-747007575948671 : Rat) / 1598549470812) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2245 : Rat) / 126) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-747007575948671 : Rat) / 1598549470812) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2245 : Rat) / 126) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-53307806800754999 : Rat) / 26109641356596) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((88 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((141648889108820563 : Rat) / 52219282713192) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((1010 : Rat) / 63) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-553040367401411 : Rat) / 4351606892766) [(10, 1), (11, 1), (15, 1)],
  term ((141648889108820563 : Rat) / 52219282713192) [(10, 1), (11, 1), (15, 3)],
  term ((1010 : Rat) / 63) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (14, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (14, 2)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 1), (11, 2), (15, 2)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(10, 1), (12, 1), (14, 1)],
  term ((-66292280552106521 : Rat) / 44759385182736) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((14347 : Rat) / 504) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45539160354826967 : Rat) / 156657848139576) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((2245 : Rat) / 252) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((747007575948671 : Rat) / 3197098941624) [(10, 1), (13, 1), (15, 3)],
  term ((2245 : Rat) / 252) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2455848271663099 : Rat) / 3197098941624) [(10, 1), (13, 2), (14, 1)],
  term ((-6655 : Rat) / 252) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 1), (14, 1), (15, 2)],
  term ((553040367401411 : Rat) / 8703213785532) [(10, 1), (14, 2)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(10, 1), (14, 2), (15, 2)],
  term ((-505 : Rat) / 63) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 1), (14, 3)],
  term ((553040367401411 : Rat) / 8703213785532) [(10, 1), (15, 2)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(10, 1), (15, 4)],
  term ((-505 : Rat) / 63) [(10, 1), (15, 4), (16, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-747007575948671 : Rat) / 1598549470812) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2245 : Rat) / 126) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-553040367401411 : Rat) / 4351606892766) [(10, 2), (14, 1)],
  term ((21492491482134149 : Rat) / 13054820678298) [(10, 2), (14, 1), (15, 2)],
  term ((1010 : Rat) / 63) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(10, 2), (14, 2)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(11, 1), (12, 1), (15, 1)],
  term ((45539160354826967 : Rat) / 156657848139576) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2245 : Rat) / 252) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((970106309053067 : Rat) / 26109641356596) [(11, 1), (13, 1), (14, 2)],
  term ((15 : Rat) / 2) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((747007575948671 : Rat) / 3197098941624) [(11, 1), (13, 1), (14, 3)],
  term ((2245 : Rat) / 252) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-452404688156108843 : Rat) / 313315696279152) [(11, 1), (13, 1), (15, 2)],
  term ((18127 : Rat) / 504) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2455848271663099 : Rat) / 3197098941624) [(11, 1), (13, 2), (15, 1)],
  term ((-6655 : Rat) / 252) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 3)],
  term ((-505 : Rat) / 63) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((50974592504956403 : Rat) / 52219282713192) [(11, 1), (14, 2), (15, 1)],
  term ((-44 : Rat) / 7) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21492491482134149 : Rat) / 26109641356596) [(11, 1), (14, 3), (15, 1)],
  term ((-505 : Rat) / 63) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((50974592504956403 : Rat) / 52219282713192) [(11, 1), (15, 3)],
  term ((-44 : Rat) / 7) [(11, 1), (15, 3), (16, 1)],
  term ((-747007575948671 : Rat) / 1598549470812) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2245 : Rat) / 126) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-970106309053067 : Rat) / 13054820678298) [(11, 2), (13, 1), (15, 1)],
  term (-15 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((141648889108820563 : Rat) / 52219282713192) [(11, 2), (14, 1), (15, 2)],
  term ((1010 : Rat) / 63) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((59904 : Rat) / 553) [(11, 2), (14, 2)],
  term ((55678923180283967 : Rat) / 52219282713192) [(11, 2), (14, 3)],
  term ((-48146252621004275 : Rat) / 26109641356596) [(11, 2), (15, 2)],
  term ((88 : Rat) / 7) [(11, 2), (15, 2), (16, 1)],
  term ((-55678923180283967 : Rat) / 26109641356596) [(11, 3), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(11, 3), (15, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(12, 1), (14, 2)],
  term ((1729028084357939 : Rat) / 3315510013536) [(12, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(13, 1), (14, 1), (15, 3)],
  term ((66292280552106521 : Rat) / 89518770365472) [(13, 1), (14, 2), (15, 1)],
  term ((-14347 : Rat) / 1008) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(13, 1), (14, 3), (15, 1)],
  term ((66292280552106521 : Rat) / 89518770365472) [(13, 1), (15, 3)],
  term ((-14347 : Rat) / 1008) [(13, 1), (15, 3), (16, 1)],
  term ((-2455848271663099 : Rat) / 6394197883248) [(13, 2), (14, 2)],
  term ((6655 : Rat) / 504) [(13, 2), (14, 2), (16, 1)],
  term ((-2455848271663099 : Rat) / 6394197883248) [(13, 2), (15, 2)],
  term ((6655 : Rat) / 504) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_24_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_24_0100_0199
      rs_R009_ueqv_R009YNNNN_block_24_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
