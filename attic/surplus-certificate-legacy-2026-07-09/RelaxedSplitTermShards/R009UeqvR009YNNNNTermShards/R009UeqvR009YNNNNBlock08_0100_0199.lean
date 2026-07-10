/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 8:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0100 : Poly :=
[
  term ((-4196087452243985 : Rat) / 8703213785532) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 100 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0100 : Poly :=
[
  term ((-4196087452243985 : Rat) / 4351606892766) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((4196087452243985 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((4196087452243985 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-4196087452243985 : Rat) / 4351606892766) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-4196087452243985 : Rat) / 8703213785532) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((4196087452243985 : Rat) / 8703213785532) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((4196087452243985 : Rat) / 8703213785532) [(2, 1), (7, 1), (11, 3)],
  term ((-4196087452243985 : Rat) / 8703213785532) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0100
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0101 : Poly :=
[
  term ((1119074972569573 : Rat) / 1598549470812) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 101 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0101 : Poly :=
[
  term ((1119074972569573 : Rat) / 799274735406) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-1119074972569573 : Rat) / 799274735406) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-1119074972569573 : Rat) / 799274735406) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((1119074972569573 : Rat) / 799274735406) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((1119074972569573 : Rat) / 1598549470812) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-1119074972569573 : Rat) / 1598549470812) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((-1119074972569573 : Rat) / 1598549470812) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((1119074972569573 : Rat) / 1598549470812) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0101
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0102 : Poly :=
[
  term ((-2785 : Rat) / 126) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0102 : Poly :=
[
  term ((-2785 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2785 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2785 : Rat) / 126) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((2785 : Rat) / 126) [(2, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((2785 : Rat) / 126) [(2, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2785 : Rat) / 126) [(2, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0102
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0103 : Poly :=
[
  term ((-17217320609887931 : Rat) / 13054820678298) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 103 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0103 : Poly :=
[
  term ((-17217320609887931 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((17217320609887931 : Rat) / 6527410339149) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((17217320609887931 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-17217320609887931 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-17217320609887931 : Rat) / 13054820678298) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((17217320609887931 : Rat) / 13054820678298) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((17217320609887931 : Rat) / 13054820678298) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-17217320609887931 : Rat) / 13054820678298) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0103
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0104 : Poly :=
[
  term ((1118 : Rat) / 63) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0104 : Poly :=
[
  term ((2236 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2236 : Rat) / 63) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2236 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((2236 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1118 : Rat) / 63) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1118 : Rat) / 63) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1118 : Rat) / 63) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1118 : Rat) / 63) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0104
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0105 : Poly :=
[
  term ((-4662483939087787 : Rat) / 13054820678298) [(2, 1), (7, 2)]
]

/-- Partial product 105 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0105 : Poly :=
[
  term ((-4662483939087787 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((4662483939087787 : Rat) / 6527410339149) [(0, 1), (2, 2), (7, 2)],
  term ((4662483939087787 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((-4662483939087787 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-4662483939087787 : Rat) / 13054820678298) [(2, 1), (3, 2), (7, 2)],
  term ((4662483939087787 : Rat) / 13054820678298) [(2, 1), (7, 2), (10, 2)],
  term ((4662483939087787 : Rat) / 13054820678298) [(2, 1), (7, 2), (11, 2)],
  term ((-4662483939087787 : Rat) / 13054820678298) [(2, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0105
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0106 : Poly :=
[
  term ((14972986545569 : Rat) / 46250979264) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 106 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0106 : Poly :=
[
  term ((14972986545569 : Rat) / 23125489632) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-14972986545569 : Rat) / 23125489632) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-14972986545569 : Rat) / 23125489632) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((14972986545569 : Rat) / 23125489632) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((14972986545569 : Rat) / 46250979264) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((-14972986545569 : Rat) / 46250979264) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((-14972986545569 : Rat) / 46250979264) [(2, 1), (9, 1), (11, 3)],
  term ((14972986545569 : Rat) / 46250979264) [(2, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0106
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0107 : Poly :=
[
  term ((-97881582290713 : Rat) / 161878427424) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 107 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0107 : Poly :=
[
  term ((-97881582290713 : Rat) / 80939213712) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((97881582290713 : Rat) / 80939213712) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((97881582290713 : Rat) / 80939213712) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-97881582290713 : Rat) / 80939213712) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-97881582290713 : Rat) / 161878427424) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((97881582290713 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((97881582290713 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-97881582290713 : Rat) / 161878427424) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0107
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0108 : Poly :=
[
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1)]
]

/-- Partial product 108 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0108 : Poly :=
[
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 2)],
  term ((395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 2), (10, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (3, 2), (10, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1), (11, 2)],
  term ((395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 3)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0108
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0109 : Poly :=
[
  term ((-4257321203020181 : Rat) / 12788395766496) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 109 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0109 : Poly :=
[
  term ((-4257321203020181 : Rat) / 6394197883248) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((4257321203020181 : Rat) / 6394197883248) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((4257321203020181 : Rat) / 6394197883248) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-4257321203020181 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-4257321203020181 : Rat) / 12788395766496) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((4257321203020181 : Rat) / 12788395766496) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((4257321203020181 : Rat) / 12788395766496) [(2, 1), (11, 3), (13, 1)],
  term ((-4257321203020181 : Rat) / 12788395766496) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0109
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0110 : Poly :=
[
  term ((34745 : Rat) / 1008) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 110 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0110 : Poly :=
[
  term ((34745 : Rat) / 504) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-34745 : Rat) / 504) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-34745 : Rat) / 504) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((34745 : Rat) / 504) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((34745 : Rat) / 1008) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-34745 : Rat) / 1008) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-34745 : Rat) / 1008) [(2, 1), (11, 3), (13, 1), (16, 1)],
  term ((34745 : Rat) / 1008) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0110
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0111 : Poly :=
[
  term ((1456616568588635 : Rat) / 828877503384) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 111 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0111 : Poly :=
[
  term ((1456616568588635 : Rat) / 414438751692) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1456616568588635 : Rat) / 414438751692) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-1456616568588635 : Rat) / 414438751692) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((1456616568588635 : Rat) / 414438751692) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((1456616568588635 : Rat) / 828877503384) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-1456616568588635 : Rat) / 828877503384) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1456616568588635 : Rat) / 828877503384) [(2, 1), (11, 3), (15, 1)],
  term ((1456616568588635 : Rat) / 828877503384) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0111
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0112 : Poly :=
[
  term ((-7289 : Rat) / 252) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0112 : Poly :=
[
  term ((-7289 : Rat) / 126) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7289 : Rat) / 126) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((7289 : Rat) / 126) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7289 : Rat) / 126) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7289 : Rat) / 252) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((7289 : Rat) / 252) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((7289 : Rat) / 252) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-7289 : Rat) / 252) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0112
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0113 : Poly :=
[
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 2)]
]

/-- Partial product 113 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0113 : Poly :=
[
  term ((51436413354355775 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(0, 1), (2, 2), (11, 2)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((51436413354355775 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 3)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 1), (3, 2), (11, 2)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(2, 1), (10, 2), (11, 2)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 4)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0113
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0114 : Poly :=
[
  term ((4022132620056043 : Rat) / 6394197883248) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 114 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0114 : Poly :=
[
  term ((4022132620056043 : Rat) / 3197098941624) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4022132620056043 : Rat) / 3197098941624) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-4022132620056043 : Rat) / 3197098941624) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((4022132620056043 : Rat) / 3197098941624) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((4022132620056043 : Rat) / 6394197883248) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-4022132620056043 : Rat) / 6394197883248) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4022132620056043 : Rat) / 6394197883248) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((4022132620056043 : Rat) / 6394197883248) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0114
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0115 : Poly :=
[
  term ((-5575 : Rat) / 504) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0115 : Poly :=
[
  term ((-5575 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5575 : Rat) / 252) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((5575 : Rat) / 252) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5575 : Rat) / 252) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5575 : Rat) / 504) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((5575 : Rat) / 504) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((5575 : Rat) / 504) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5575 : Rat) / 504) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0115
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0116 : Poly :=
[
  term ((4009864706618 : Rat) / 44404151967) [(2, 1), (14, 1)]
]

/-- Partial product 116 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0116 : Poly :=
[
  term ((8019729413236 : Rat) / 44404151967) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-8019729413236 : Rat) / 44404151967) [(0, 1), (2, 2), (14, 1)],
  term ((-8019729413236 : Rat) / 44404151967) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((8019729413236 : Rat) / 44404151967) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((4009864706618 : Rat) / 44404151967) [(2, 1), (3, 2), (14, 1)],
  term ((-4009864706618 : Rat) / 44404151967) [(2, 1), (10, 2), (14, 1)],
  term ((-4009864706618 : Rat) / 44404151967) [(2, 1), (11, 2), (14, 1)],
  term ((4009864706618 : Rat) / 44404151967) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0116
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0117 : Poly :=
[
  term ((-1160170900864765 : Rat) / 932487191307) [(2, 1), (15, 2)]
]

/-- Partial product 117 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0117 : Poly :=
[
  term ((-2320341801729530 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((2320341801729530 : Rat) / 932487191307) [(0, 1), (2, 2), (15, 2)],
  term ((2320341801729530 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-2320341801729530 : Rat) / 932487191307) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-1160170900864765 : Rat) / 932487191307) [(2, 1), (3, 2), (15, 2)],
  term ((1160170900864765 : Rat) / 932487191307) [(2, 1), (10, 2), (15, 2)],
  term ((1160170900864765 : Rat) / 932487191307) [(2, 1), (11, 2), (15, 2)],
  term ((-1160170900864765 : Rat) / 932487191307) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0117
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0118 : Poly :=
[
  term ((1063 : Rat) / 126) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0118 : Poly :=
[
  term ((1063 : Rat) / 63) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1063 : Rat) / 63) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-1063 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((1063 : Rat) / 63) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((1063 : Rat) / 126) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-1063 : Rat) / 126) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1063 : Rat) / 126) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((1063 : Rat) / 126) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0118
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0119 : Poly :=
[
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2)]
]

/-- Partial product 119 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0119 : Poly :=
[
  term ((-1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 2), (10, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 3)],
  term ((1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (3, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (3, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (10, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (11, 2)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0119
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0120 : Poly :=
[
  term ((31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 120 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0120 : Poly :=
[
  term ((-62554550758679608 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((62554550758679608 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((62554550758679608 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-62554550758679608 : Rat) / 19582231017447) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((31277275379339804 : Rat) / 19582231017447) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (10, 2)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (11, 2)],
  term ((31277275379339804 : Rat) / 19582231017447) [(3, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0120
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0121 : Poly :=
[
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 121 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0121 : Poly :=
[
  term ((-6788130415625 : Rat) / 3372467238) [(0, 1), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (3, 1), (6, 1), (9, 1), (11, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (11, 2)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0121
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0122 : Poly :=
[
  term ((-17126653846152229 : Rat) / 8703213785532) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 122 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0122 : Poly :=
[
  term ((17126653846152229 : Rat) / 4351606892766) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-17126653846152229 : Rat) / 4351606892766) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-17126653846152229 : Rat) / 4351606892766) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((17126653846152229 : Rat) / 4351606892766) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-17126653846152229 : Rat) / 8703213785532) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((17126653846152229 : Rat) / 8703213785532) [(3, 1), (6, 1), (10, 2), (11, 1)],
  term ((17126653846152229 : Rat) / 8703213785532) [(3, 1), (6, 1), (11, 3)],
  term ((-17126653846152229 : Rat) / 8703213785532) [(3, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0122
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0123 : Poly :=
[
  term ((-280381883026811 : Rat) / 266424911802) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 123 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0123 : Poly :=
[
  term ((280381883026811 : Rat) / 133212455901) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(3, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0123
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0124 : Poly :=
[
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0124 : Poly :=
[
  term ((170 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 21) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(3, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0124
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0125 : Poly :=
[
  term ((4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 125 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0125 : Poly :=
[
  term ((-8631976586940982 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((8631976586940982 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((8631976586940982 : Rat) / 2175803446383) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-8631976586940982 : Rat) / 2175803446383) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((-4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0125
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0126 : Poly :=
[
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0126 : Poly :=
[
  term ((-32 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0126
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0127 : Poly :=
[
  term ((-95075491148800633 : Rat) / 78328924069788) [(3, 1), (7, 1)]
]

/-- Partial product 127 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0127 : Poly :=
[
  term ((95075491148800633 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((-95075491148800633 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-95075491148800633 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((95075491148800633 : Rat) / 39164462034894) [(1, 1), (3, 2), (7, 1)],
  term ((-95075491148800633 : Rat) / 78328924069788) [(2, 2), (3, 1), (7, 1)],
  term ((95075491148800633 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 2)],
  term ((95075491148800633 : Rat) / 78328924069788) [(3, 1), (7, 1), (11, 2)],
  term ((-95075491148800633 : Rat) / 78328924069788) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0127
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0128 : Poly :=
[
  term ((-100714948775257127 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 128 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0128 : Poly :=
[
  term ((100714948775257127 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-100714948775257127 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((-100714948775257127 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((100714948775257127 : Rat) / 39164462034894) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-100714948775257127 : Rat) / 78328924069788) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((100714948775257127 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((100714948775257127 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 3)],
  term ((-100714948775257127 : Rat) / 78328924069788) [(3, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0128
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0129 : Poly :=
[
  term ((-12642180407957059 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 129 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0129 : Poly :=
[
  term ((12642180407957059 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-12642180407957059 : Rat) / 13054820678298) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-12642180407957059 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((12642180407957059 : Rat) / 13054820678298) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((-12642180407957059 : Rat) / 26109641356596) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((12642180407957059 : Rat) / 26109641356596) [(3, 1), (7, 1), (10, 2), (14, 1)],
  term ((12642180407957059 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((-12642180407957059 : Rat) / 26109641356596) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0129
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0130 : Poly :=
[
  term ((-27619545035095 : Rat) / 20234803428) [(3, 1), (9, 1)]
]

/-- Partial product 130 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0130 : Poly :=
[
  term ((27619545035095 : Rat) / 10117401714) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((-27619545035095 : Rat) / 10117401714) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((-27619545035095 : Rat) / 10117401714) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((27619545035095 : Rat) / 10117401714) [(1, 1), (3, 2), (9, 1)],
  term ((-27619545035095 : Rat) / 20234803428) [(2, 2), (3, 1), (9, 1)],
  term ((27619545035095 : Rat) / 20234803428) [(3, 1), (9, 1), (10, 2)],
  term ((27619545035095 : Rat) / 20234803428) [(3, 1), (9, 1), (11, 2)],
  term ((-27619545035095 : Rat) / 20234803428) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0130
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0131 : Poly :=
[
  term ((-3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 131 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0131 : Poly :=
[
  term ((3282196818563 : Rat) / 1998499104) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-3282196818563 : Rat) / 1998499104) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((-3282196818563 : Rat) / 1998499104) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((3282196818563 : Rat) / 1998499104) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-3282196818563 : Rat) / 3996998208) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 3)],
  term ((-3282196818563 : Rat) / 3996998208) [(3, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0131
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0132 : Poly :=
[
  term ((65103058139743 : Rat) / 161878427424) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 132 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0132 : Poly :=
[
  term ((-65103058139743 : Rat) / 80939213712) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((65103058139743 : Rat) / 80939213712) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((65103058139743 : Rat) / 80939213712) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((-65103058139743 : Rat) / 80939213712) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((65103058139743 : Rat) / 161878427424) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-65103058139743 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((-65103058139743 : Rat) / 161878427424) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((65103058139743 : Rat) / 161878427424) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0132
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0133 : Poly :=
[
  term ((89856 : Rat) / 553) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 133 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0133 : Poly :=
[
  term ((-179712 : Rat) / 553) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((179712 : Rat) / 553) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-179712 : Rat) / 553) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((89856 : Rat) / 553) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((-89856 : Rat) / 553) [(3, 1), (10, 1), (11, 3)],
  term ((-89856 : Rat) / 553) [(3, 1), (10, 3), (11, 1)],
  term ((89856 : Rat) / 553) [(3, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0133
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0134 : Poly :=
[
  term ((135756748565609 : Rat) / 157881429216) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 134 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0134 : Poly :=
[
  term ((-135756748565609 : Rat) / 78940714608) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((135756748565609 : Rat) / 78940714608) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((135756748565609 : Rat) / 78940714608) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((-135756748565609 : Rat) / 78940714608) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(2, 2), (3, 1), (10, 1), (13, 1)],
  term ((-135756748565609 : Rat) / 157881429216) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((-135756748565609 : Rat) / 157881429216) [(3, 1), (10, 3), (13, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(3, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0134
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0135 : Poly :=
[
  term ((-2245 : Rat) / 112) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0135 : Poly :=
[
  term ((2245 : Rat) / 56) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2245 : Rat) / 56) [(0, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2245 : Rat) / 56) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2245 : Rat) / 56) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2245 : Rat) / 112) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((2245 : Rat) / 112) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((2245 : Rat) / 112) [(3, 1), (10, 3), (13, 1), (16, 1)],
  term ((-2245 : Rat) / 112) [(3, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0135
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0136 : Poly :=
[
  term ((-106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 136 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0136 : Poly :=
[
  term ((106920059393860357 : Rat) / 78328924069788) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-106920059393860357 : Rat) / 78328924069788) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-106920059393860357 : Rat) / 78328924069788) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((106920059393860357 : Rat) / 78328924069788) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 3), (15, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0136
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0137 : Poly :=
[
  term ((437 : Rat) / 28) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0137 : Poly :=
[
  term ((-437 : Rat) / 14) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((437 : Rat) / 14) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((437 : Rat) / 14) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-437 : Rat) / 14) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((437 : Rat) / 28) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-437 : Rat) / 28) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-437 : Rat) / 28) [(3, 1), (10, 3), (15, 1), (16, 1)],
  term ((437 : Rat) / 28) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0137
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0138 : Poly :=
[
  term ((12123177172189757 : Rat) / 26109641356596) [(3, 1), (11, 1)]
]

/-- Partial product 138 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0138 : Poly :=
[
  term ((-12123177172189757 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((12123177172189757 : Rat) / 13054820678298) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((12123177172189757 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 2)],
  term ((-12123177172189757 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1)],
  term ((12123177172189757 : Rat) / 26109641356596) [(2, 2), (3, 1), (11, 1)],
  term ((-12123177172189757 : Rat) / 26109641356596) [(3, 1), (10, 2), (11, 1)],
  term ((-12123177172189757 : Rat) / 26109641356596) [(3, 1), (11, 3)],
  term ((12123177172189757 : Rat) / 26109641356596) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0138
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0139 : Poly :=
[
  term ((20281757454592271 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 139 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0139 : Poly :=
[
  term ((-20281757454592271 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((20281757454592271 : Rat) / 39164462034894) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((20281757454592271 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-20281757454592271 : Rat) / 39164462034894) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((20281757454592271 : Rat) / 78328924069788) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((-20281757454592271 : Rat) / 78328924069788) [(3, 1), (10, 2), (11, 1), (14, 1)],
  term ((-20281757454592271 : Rat) / 78328924069788) [(3, 1), (11, 3), (14, 1)],
  term ((20281757454592271 : Rat) / 78328924069788) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0139
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0140 : Poly :=
[
  term ((85223536157796251 : Rat) / 52219282713192) [(3, 1), (13, 1)]
]

/-- Partial product 140 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0140 : Poly :=
[
  term ((-85223536157796251 : Rat) / 26109641356596) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((85223536157796251 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((85223536157796251 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-85223536157796251 : Rat) / 26109641356596) [(1, 1), (3, 2), (13, 1)],
  term ((85223536157796251 : Rat) / 52219282713192) [(2, 2), (3, 1), (13, 1)],
  term ((-85223536157796251 : Rat) / 52219282713192) [(3, 1), (10, 2), (13, 1)],
  term ((-85223536157796251 : Rat) / 52219282713192) [(3, 1), (11, 2), (13, 1)],
  term ((85223536157796251 : Rat) / 52219282713192) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0140
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0141 : Poly :=
[
  term ((-2744896560033661 : Rat) / 6394197883248) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 141 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0141 : Poly :=
[
  term ((2744896560033661 : Rat) / 3197098941624) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-2744896560033661 : Rat) / 3197098941624) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2744896560033661 : Rat) / 3197098941624) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((2744896560033661 : Rat) / 3197098941624) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-2744896560033661 : Rat) / 6394197883248) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((2744896560033661 : Rat) / 6394197883248) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((2744896560033661 : Rat) / 6394197883248) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2744896560033661 : Rat) / 6394197883248) [(3, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0141
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0142 : Poly :=
[
  term ((-1055 : Rat) / 504) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 142 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0142 : Poly :=
[
  term ((1055 : Rat) / 252) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1055 : Rat) / 252) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1055 : Rat) / 252) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1055 : Rat) / 252) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1055 : Rat) / 504) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1055 : Rat) / 504) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((1055 : Rat) / 504) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1055 : Rat) / 504) [(3, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0142
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0143 : Poly :=
[
  term ((-2785 : Rat) / 63) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 143 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0143 : Poly :=
[
  term ((5570 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-5570 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-5570 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((5570 : Rat) / 63) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-2785 : Rat) / 63) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2785 : Rat) / 63) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0143
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0144 : Poly :=
[
  term ((-110193519371620127 : Rat) / 78328924069788) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 144 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0144 : Poly :=
[
  term ((110193519371620127 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-110193519371620127 : Rat) / 39164462034894) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-110193519371620127 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((110193519371620127 : Rat) / 39164462034894) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-110193519371620127 : Rat) / 78328924069788) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((110193519371620127 : Rat) / 78328924069788) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((110193519371620127 : Rat) / 78328924069788) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-110193519371620127 : Rat) / 78328924069788) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0144
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0145 : Poly :=
[
  term ((311 : Rat) / 126) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0145 : Poly :=
[
  term ((-311 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-311 : Rat) / 63) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 126) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-311 : Rat) / 126) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-311 : Rat) / 126) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 126) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0145
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0146 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 146 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0146 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (10, 2), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0146
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0147 : Poly :=
[
  term ((-48546728082857233 : Rat) / 26109641356596) [(3, 1), (15, 1)]
]

/-- Partial product 147 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0147 : Poly :=
[
  term ((48546728082857233 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-48546728082857233 : Rat) / 13054820678298) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-48546728082857233 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((48546728082857233 : Rat) / 13054820678298) [(1, 1), (3, 2), (15, 1)],
  term ((-48546728082857233 : Rat) / 26109641356596) [(2, 2), (3, 1), (15, 1)],
  term ((48546728082857233 : Rat) / 26109641356596) [(3, 1), (10, 2), (15, 1)],
  term ((48546728082857233 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)],
  term ((-48546728082857233 : Rat) / 26109641356596) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0147
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0148 : Poly :=
[
  term ((2236 : Rat) / 63) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0148 : Poly :=
[
  term ((-4472 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((4472 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((4472 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4472 : Rat) / 63) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((2236 : Rat) / 63) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2236 : Rat) / 63) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2236 : Rat) / 63) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((2236 : Rat) / 63) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0148
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0149 : Poly :=
[
  term ((7488467535437570 : Rat) / 19582231017447) [(3, 2)]
]

/-- Partial product 149 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0149 : Poly :=
[
  term ((-14976935070875140 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2)],
  term ((14976935070875140 : Rat) / 19582231017447) [(0, 1), (3, 2), (10, 1)],
  term ((14976935070875140 : Rat) / 19582231017447) [(1, 1), (3, 2), (11, 1)],
  term ((-14976935070875140 : Rat) / 19582231017447) [(1, 1), (3, 3)],
  term ((7488467535437570 : Rat) / 19582231017447) [(2, 2), (3, 2)],
  term ((-7488467535437570 : Rat) / 19582231017447) [(3, 2), (10, 2)],
  term ((-7488467535437570 : Rat) / 19582231017447) [(3, 2), (11, 2)],
  term ((7488467535437570 : Rat) / 19582231017447) [(3, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0149
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0150 : Poly :=
[
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1)]
]

/-- Partial product 150 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0150 : Poly :=
[
  term ((10813215080142800 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 2), (6, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (3, 2), (6, 1), (10, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 3), (6, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(2, 2), (3, 2), (6, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (10, 2)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 4), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0150
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0151 : Poly :=
[
  term ((-640 : Rat) / 21) [(3, 2), (10, 1)]
]

/-- Partial product 151 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0151 : Poly :=
[
  term ((1280 : Rat) / 21) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 2), (10, 2)],
  term ((-1280 : Rat) / 21) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((1280 : Rat) / 21) [(1, 1), (3, 3), (10, 1)],
  term ((-640 : Rat) / 21) [(2, 2), (3, 2), (10, 1)],
  term ((640 : Rat) / 21) [(3, 2), (10, 1), (11, 2)],
  term ((640 : Rat) / 21) [(3, 2), (10, 3)],
  term ((-640 : Rat) / 21) [(3, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0151
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0152 : Poly :=
[
  term ((1819646145127105 : Rat) / 39164462034894) [(3, 2), (14, 1)]
]

/-- Partial product 152 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0152 : Poly :=
[
  term ((-1819646145127105 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((1819646145127105 : Rat) / 19582231017447) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((1819646145127105 : Rat) / 19582231017447) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-1819646145127105 : Rat) / 19582231017447) [(1, 1), (3, 3), (14, 1)],
  term ((1819646145127105 : Rat) / 39164462034894) [(2, 2), (3, 2), (14, 1)],
  term ((-1819646145127105 : Rat) / 39164462034894) [(3, 2), (10, 2), (14, 1)],
  term ((-1819646145127105 : Rat) / 39164462034894) [(3, 2), (11, 2), (14, 1)],
  term ((1819646145127105 : Rat) / 39164462034894) [(3, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0152
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0153 : Poly :=
[
  term ((4890606284612249 : Rat) / 17406427571064) [(6, 1)]
]

/-- Partial product 153 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0153 : Poly :=
[
  term ((-4890606284612249 : Rat) / 8703213785532) [(0, 1), (2, 1), (6, 1)],
  term ((4890606284612249 : Rat) / 8703213785532) [(0, 1), (6, 1), (10, 1)],
  term ((-4890606284612249 : Rat) / 8703213785532) [(1, 1), (3, 1), (6, 1)],
  term ((4890606284612249 : Rat) / 8703213785532) [(1, 1), (6, 1), (11, 1)],
  term ((4890606284612249 : Rat) / 17406427571064) [(2, 2), (6, 1)],
  term ((4890606284612249 : Rat) / 17406427571064) [(3, 2), (6, 1)],
  term ((-4890606284612249 : Rat) / 17406427571064) [(6, 1), (10, 2)],
  term ((-4890606284612249 : Rat) / 17406427571064) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0153
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0154 : Poly :=
[
  term ((-27021501933329549 : Rat) / 39164462034894) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 154 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0154 : Poly :=
[
  term ((27021501933329549 : Rat) / 19582231017447) [(0, 1), (2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-27021501933329549 : Rat) / 19582231017447) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((27021501933329549 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-27021501933329549 : Rat) / 19582231017447) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-27021501933329549 : Rat) / 39164462034894) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((-27021501933329549 : Rat) / 39164462034894) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((27021501933329549 : Rat) / 39164462034894) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((27021501933329549 : Rat) / 39164462034894) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0154
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0155 : Poly :=
[
  term ((1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 155 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0155 : Poly :=
[
  term ((-3792538175468572 : Rat) / 932487191307) [(0, 1), (2, 1), (6, 1), (7, 1), (11, 1)],
  term ((3792538175468572 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-3792538175468572 : Rat) / 932487191307) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((3792538175468572 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((1896269087734286 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0155
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0156 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 156 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0156 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0156
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0157 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 157 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0157 : Poly :=
[
  term ((-340 : Rat) / 63) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0157
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0158 : Poly :=
[
  term ((-20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 158 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0158 : Poly :=
[
  term ((20283918945798503 : Rat) / 6527410339149) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0158
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0159 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0159 : Poly :=
[
  term ((64 : Rat) / 9) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0159
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0160 : Poly :=
[
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)]
]

/-- Partial product 160 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0160 : Poly :=
[
  term ((1382044204093718 : Rat) / 932487191307) [(0, 1), (2, 1), (6, 1), (7, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 2), (10, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(1, 1), (3, 1), (6, 1), (7, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 2), (11, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(3, 2), (6, 1), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (10, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0160
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0161 : Poly :=
[
  term ((-44388 : Rat) / 79) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 161 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0161 : Poly :=
[
  term ((88776 : Rat) / 79) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-88776 : Rat) / 79) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((88776 : Rat) / 79) [(1, 1), (3, 1), (6, 1), (9, 1), (11, 1)],
  term ((-88776 : Rat) / 79) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-44388 : Rat) / 79) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((-44388 : Rat) / 79) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((44388 : Rat) / 79) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((44388 : Rat) / 79) [(6, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0161
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0162 : Poly :=
[
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 162 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0162 : Poly :=
[
  term ((941242657 : Rat) / 41635398) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-941242657 : Rat) / 41635398) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((941242657 : Rat) / 41635398) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((-941242657 : Rat) / 41635398) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0162
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0163 : Poly :=
[
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 163 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0163 : Poly :=
[
  term ((725 : Rat) / 21) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(3, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0163
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0164 : Poly :=
[
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 164 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0164 : Poly :=
[
  term ((-282061132319075 : Rat) / 1450535630922) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0164
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0165 : Poly :=
[
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0165 : Poly :=
[
  term ((-628 : Rat) / 21) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-628 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0165
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0166 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2)]
]

/-- Partial product 166 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0166 : Poly :=
[
  term ((-2172201733 : Rat) / 83270796) [(0, 1), (2, 1), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 83270796) [(0, 1), (6, 1), (9, 2), (10, 1)],
  term ((-2172201733 : Rat) / 83270796) [(1, 1), (3, 1), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 83270796) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((2172201733 : Rat) / 166541592) [(2, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 166541592) [(3, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (10, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0166
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0167 : Poly :=
[
  term ((-2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 1)]
]

/-- Partial product 167 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0167 : Poly :=
[
  term ((2149676295281027 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((-2149676295281027 : Rat) / 2901071261844) [(0, 1), (6, 1), (10, 2)],
  term ((2149676295281027 : Rat) / 2901071261844) [(1, 1), (3, 1), (6, 1), (10, 1)],
  term ((-2149676295281027 : Rat) / 2901071261844) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(2, 2), (6, 1), (10, 1)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(3, 2), (6, 1), (10, 1)],
  term ((2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 1), (11, 2)],
  term ((2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0167
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0168 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (14, 1)]
]

/-- Partial product 168 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0168 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (2, 1), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(2, 2), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(3, 2), (6, 1), (14, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (10, 2), (14, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0168
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0169 : Poly :=
[
  term ((3803525234483 : Rat) / 11562744816) [(7, 1), (9, 1)]
]

/-- Partial product 169 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0169 : Poly :=
[
  term ((-3803525234483 : Rat) / 5781372408) [(0, 1), (2, 1), (7, 1), (9, 1)],
  term ((3803525234483 : Rat) / 5781372408) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((-3803525234483 : Rat) / 5781372408) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((3803525234483 : Rat) / 5781372408) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((3803525234483 : Rat) / 11562744816) [(2, 2), (7, 1), (9, 1)],
  term ((3803525234483 : Rat) / 11562744816) [(3, 2), (7, 1), (9, 1)],
  term ((-3803525234483 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 2)],
  term ((-3803525234483 : Rat) / 11562744816) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0169
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0170 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 170 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0170 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0170
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0171 : Poly :=
[
  term ((-1896269087734286 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 171 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0171 : Poly :=
[
  term ((3792538175468572 : Rat) / 932487191307) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-3792538175468572 : Rat) / 932487191307) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((3792538175468572 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-3792538175468572 : Rat) / 932487191307) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-1896269087734286 : Rat) / 932487191307) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 3)],
  term ((1896269087734286 : Rat) / 932487191307) [(7, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0171
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0172 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 172 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0172 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(7, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0172
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0173 : Poly :=
[
  term ((-170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 173 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0173 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(7, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0173
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0174 : Poly :=
[
  term ((9033412930036940 : Rat) / 6527410339149) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 174 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0174 : Poly :=
[
  term ((-18066825860073880 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((18066825860073880 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-18066825860073880 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((18066825860073880 : Rat) / 6527410339149) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((9033412930036940 : Rat) / 6527410339149) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((9033412930036940 : Rat) / 6527410339149) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((-9033412930036940 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-9033412930036940 : Rat) / 6527410339149) [(7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0174
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0175 : Poly :=
[
  term ((32 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0175 : Poly :=
[
  term ((-64 : Rat) / 9) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0175
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0176 : Poly :=
[
  term ((-1309002961808849 : Rat) / 1864974382614) [(7, 1), (11, 1)]
]

/-- Partial product 176 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0176 : Poly :=
[
  term ((1309002961808849 : Rat) / 932487191307) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-1309002961808849 : Rat) / 932487191307) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((1309002961808849 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-1309002961808849 : Rat) / 932487191307) [(1, 1), (7, 1), (11, 2)],
  term ((-1309002961808849 : Rat) / 1864974382614) [(2, 2), (7, 1), (11, 1)],
  term ((-1309002961808849 : Rat) / 1864974382614) [(3, 2), (7, 1), (11, 1)],
  term ((1309002961808849 : Rat) / 1864974382614) [(7, 1), (10, 2), (11, 1)],
  term ((1309002961808849 : Rat) / 1864974382614) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0176
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0177 : Poly :=
[
  term ((2217093085724623 : Rat) / 13054820678298) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 177 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0177 : Poly :=
[
  term ((-2217093085724623 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((2217093085724623 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2217093085724623 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((2217093085724623 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((2217093085724623 : Rat) / 13054820678298) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((2217093085724623 : Rat) / 13054820678298) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-2217093085724623 : Rat) / 13054820678298) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((-2217093085724623 : Rat) / 13054820678298) [(7, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0177
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0178 : Poly :=
[
  term ((-22757431582735211 : Rat) / 156657848139576) [(7, 1), (13, 1)]
]

/-- Partial product 178 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0178 : Poly :=
[
  term ((22757431582735211 : Rat) / 78328924069788) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-22757431582735211 : Rat) / 78328924069788) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((22757431582735211 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-22757431582735211 : Rat) / 78328924069788) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-22757431582735211 : Rat) / 156657848139576) [(2, 2), (7, 1), (13, 1)],
  term ((-22757431582735211 : Rat) / 156657848139576) [(3, 2), (7, 1), (13, 1)],
  term ((22757431582735211 : Rat) / 156657848139576) [(7, 1), (10, 2), (13, 1)],
  term ((22757431582735211 : Rat) / 156657848139576) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0178
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0179 : Poly :=
[
  term ((1835 : Rat) / 252) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 179 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0179 : Poly :=
[
  term ((-1835 : Rat) / 126) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1835 : Rat) / 126) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1835 : Rat) / 126) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((1835 : Rat) / 126) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((1835 : Rat) / 252) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((1835 : Rat) / 252) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1835 : Rat) / 252) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1835 : Rat) / 252) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0179
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0180 : Poly :=
[
  term ((11704474140877951 : Rat) / 26109641356596) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 180 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0180 : Poly :=
[
  term ((-11704474140877951 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((11704474140877951 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11704474140877951 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((11704474140877951 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((11704474140877951 : Rat) / 26109641356596) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((11704474140877951 : Rat) / 26109641356596) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-11704474140877951 : Rat) / 26109641356596) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-11704474140877951 : Rat) / 26109641356596) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0180
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0181 : Poly :=
[
  term ((51129595843742281 : Rat) / 52219282713192) [(7, 1), (15, 1)]
]

/-- Partial product 181 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0181 : Poly :=
[
  term ((-51129595843742281 : Rat) / 26109641356596) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-51129595843742281 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 52219282713192) [(2, 2), (7, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 52219282713192) [(3, 2), (7, 1), (15, 1)],
  term ((-51129595843742281 : Rat) / 52219282713192) [(7, 1), (10, 2), (15, 1)],
  term ((-51129595843742281 : Rat) / 52219282713192) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0181
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0182 : Poly :=
[
  term ((-359 : Rat) / 63) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0182 : Poly :=
[
  term ((718 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-718 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((718 : Rat) / 63) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-718 : Rat) / 63) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-359 : Rat) / 63) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-359 : Rat) / 63) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((359 : Rat) / 63) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((359 : Rat) / 63) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0182
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0183 : Poly :=
[
  term ((-301843357213373 : Rat) / 1864974382614) [(7, 2)]
]

/-- Partial product 183 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0183 : Poly :=
[
  term ((301843357213373 : Rat) / 932487191307) [(0, 1), (2, 1), (7, 2)],
  term ((-301843357213373 : Rat) / 932487191307) [(0, 1), (7, 2), (10, 1)],
  term ((301843357213373 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 2)],
  term ((-301843357213373 : Rat) / 932487191307) [(1, 1), (7, 2), (11, 1)],
  term ((-301843357213373 : Rat) / 1864974382614) [(2, 2), (7, 2)],
  term ((-301843357213373 : Rat) / 1864974382614) [(3, 2), (7, 2)],
  term ((301843357213373 : Rat) / 1864974382614) [(7, 2), (10, 2)],
  term ((301843357213373 : Rat) / 1864974382614) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0183
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0184 : Poly :=
[
  term ((691022102046859 : Rat) / 932487191307) [(7, 2), (10, 1)]
]

/-- Partial product 184 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0184 : Poly :=
[
  term ((-1382044204093718 : Rat) / 932487191307) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(0, 1), (7, 2), (10, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 2), (7, 2), (10, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(3, 2), (7, 2), (10, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (10, 1), (11, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0184
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0185 : Poly :=
[
  term ((119808 : Rat) / 553) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 185 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0185 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 1), (11, 3)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0185
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0186 : Poly :=
[
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 186 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0186 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0186
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0187 : Poly :=
[
  term ((305 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 187 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0187 : Poly :=
[
  term ((-305 : Rat) / 14) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 14) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-305 : Rat) / 14) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 28) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 28) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0187
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0188 : Poly :=
[
  term ((9907541855867849 : Rat) / 12788395766496) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 188 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0188 : Poly :=
[
  term ((-9907541855867849 : Rat) / 6394197883248) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((9907541855867849 : Rat) / 6394197883248) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-9907541855867849 : Rat) / 6394197883248) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((9907541855867849 : Rat) / 6394197883248) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((9907541855867849 : Rat) / 12788395766496) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((9907541855867849 : Rat) / 12788395766496) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((-9907541855867849 : Rat) / 12788395766496) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-9907541855867849 : Rat) / 12788395766496) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0188
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0189 : Poly :=
[
  term ((-65 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0189 : Poly :=
[
  term ((130 : Rat) / 7) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-130 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((130 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-130 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0189
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0190 : Poly :=
[
  term ((23973055909205 : Rat) / 473644287648) [(9, 1), (11, 1)]
]

/-- Partial product 190 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0190 : Poly :=
[
  term ((-23973055909205 : Rat) / 236822143824) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((23973055909205 : Rat) / 236822143824) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-23973055909205 : Rat) / 236822143824) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((23973055909205 : Rat) / 236822143824) [(1, 1), (9, 1), (11, 2)],
  term ((23973055909205 : Rat) / 473644287648) [(2, 2), (9, 1), (11, 1)],
  term ((23973055909205 : Rat) / 473644287648) [(3, 2), (9, 1), (11, 1)],
  term ((-23973055909205 : Rat) / 473644287648) [(9, 1), (10, 2), (11, 1)],
  term ((-23973055909205 : Rat) / 473644287648) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0190
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0191 : Poly :=
[
  term ((-1009675571026655 : Rat) / 1826913680928) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 191 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0191 : Poly :=
[
  term ((1009675571026655 : Rat) / 913456840464) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-1009675571026655 : Rat) / 913456840464) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((1009675571026655 : Rat) / 913456840464) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((-1009675571026655 : Rat) / 913456840464) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((-1009675571026655 : Rat) / 1826913680928) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1009675571026655 : Rat) / 1826913680928) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((1009675571026655 : Rat) / 1826913680928) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((1009675571026655 : Rat) / 1826913680928) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0191
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0192 : Poly :=
[
  term ((-2172851284119785 : Rat) / 6394197883248) [(9, 1), (13, 1)]
]

/-- Partial product 192 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0192 : Poly :=
[
  term ((2172851284119785 : Rat) / 3197098941624) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-2172851284119785 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((2172851284119785 : Rat) / 3197098941624) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-2172851284119785 : Rat) / 3197098941624) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2172851284119785 : Rat) / 6394197883248) [(2, 2), (9, 1), (13, 1)],
  term ((-2172851284119785 : Rat) / 6394197883248) [(3, 2), (9, 1), (13, 1)],
  term ((2172851284119785 : Rat) / 6394197883248) [(9, 1), (10, 2), (13, 1)],
  term ((2172851284119785 : Rat) / 6394197883248) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0192
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0193 : Poly :=
[
  term ((-43066903590979 : Rat) / 236822143824) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 193 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0193 : Poly :=
[
  term ((43066903590979 : Rat) / 118411071912) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-43066903590979 : Rat) / 118411071912) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((43066903590979 : Rat) / 118411071912) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-43066903590979 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-43066903590979 : Rat) / 236822143824) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-43066903590979 : Rat) / 236822143824) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((43066903590979 : Rat) / 236822143824) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((43066903590979 : Rat) / 236822143824) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0193
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0194 : Poly :=
[
  term ((765 : Rat) / 56) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 194 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0194 : Poly :=
[
  term ((-765 : Rat) / 28) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((765 : Rat) / 28) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-765 : Rat) / 28) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((765 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((765 : Rat) / 56) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((765 : Rat) / 56) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-765 : Rat) / 56) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-765 : Rat) / 56) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0194
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0195 : Poly :=
[
  term ((55 : Rat) / 16) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 195 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0195 : Poly :=
[
  term ((-55 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-55 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 8) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 16) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 16) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-55 : Rat) / 16) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-55 : Rat) / 16) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0195
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0196 : Poly :=
[
  term ((3930141094516747 : Rat) / 6394197883248) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 196 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0196 : Poly :=
[
  term ((-3930141094516747 : Rat) / 3197098941624) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((3930141094516747 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3930141094516747 : Rat) / 3197098941624) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((3930141094516747 : Rat) / 3197098941624) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((3930141094516747 : Rat) / 6394197883248) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((3930141094516747 : Rat) / 6394197883248) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-3930141094516747 : Rat) / 6394197883248) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-3930141094516747 : Rat) / 6394197883248) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0196
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0197 : Poly :=
[
  term ((-157 : Rat) / 14) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0197 : Poly :=
[
  term ((157 : Rat) / 7) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 14) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 14) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 14) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 14) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0197
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0198 : Poly :=
[
  term ((473633850505555 : Rat) / 1420932862944) [(9, 1), (15, 1)]
]

/-- Partial product 198 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0198 : Poly :=
[
  term ((-473633850505555 : Rat) / 710466431472) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((473633850505555 : Rat) / 710466431472) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-473633850505555 : Rat) / 710466431472) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((473633850505555 : Rat) / 710466431472) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((473633850505555 : Rat) / 1420932862944) [(2, 2), (9, 1), (15, 1)],
  term ((473633850505555 : Rat) / 1420932862944) [(3, 2), (9, 1), (15, 1)],
  term ((-473633850505555 : Rat) / 1420932862944) [(9, 1), (10, 2), (15, 1)],
  term ((-473633850505555 : Rat) / 1420932862944) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0198
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0199 : Poly :=
[
  term ((-85 : Rat) / 28) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0199 : Poly :=
[
  term ((85 : Rat) / 14) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 14) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 28) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 28) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 28) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((85 : Rat) / 28) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0199
        rs_R009_ueqv_R009YNNNN_generator_08_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_08_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_08_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_08_0100,
  rs_R009_ueqv_R009YNNNN_partial_08_0101,
  rs_R009_ueqv_R009YNNNN_partial_08_0102,
  rs_R009_ueqv_R009YNNNN_partial_08_0103,
  rs_R009_ueqv_R009YNNNN_partial_08_0104,
  rs_R009_ueqv_R009YNNNN_partial_08_0105,
  rs_R009_ueqv_R009YNNNN_partial_08_0106,
  rs_R009_ueqv_R009YNNNN_partial_08_0107,
  rs_R009_ueqv_R009YNNNN_partial_08_0108,
  rs_R009_ueqv_R009YNNNN_partial_08_0109,
  rs_R009_ueqv_R009YNNNN_partial_08_0110,
  rs_R009_ueqv_R009YNNNN_partial_08_0111,
  rs_R009_ueqv_R009YNNNN_partial_08_0112,
  rs_R009_ueqv_R009YNNNN_partial_08_0113,
  rs_R009_ueqv_R009YNNNN_partial_08_0114,
  rs_R009_ueqv_R009YNNNN_partial_08_0115,
  rs_R009_ueqv_R009YNNNN_partial_08_0116,
  rs_R009_ueqv_R009YNNNN_partial_08_0117,
  rs_R009_ueqv_R009YNNNN_partial_08_0118,
  rs_R009_ueqv_R009YNNNN_partial_08_0119,
  rs_R009_ueqv_R009YNNNN_partial_08_0120,
  rs_R009_ueqv_R009YNNNN_partial_08_0121,
  rs_R009_ueqv_R009YNNNN_partial_08_0122,
  rs_R009_ueqv_R009YNNNN_partial_08_0123,
  rs_R009_ueqv_R009YNNNN_partial_08_0124,
  rs_R009_ueqv_R009YNNNN_partial_08_0125,
  rs_R009_ueqv_R009YNNNN_partial_08_0126,
  rs_R009_ueqv_R009YNNNN_partial_08_0127,
  rs_R009_ueqv_R009YNNNN_partial_08_0128,
  rs_R009_ueqv_R009YNNNN_partial_08_0129,
  rs_R009_ueqv_R009YNNNN_partial_08_0130,
  rs_R009_ueqv_R009YNNNN_partial_08_0131,
  rs_R009_ueqv_R009YNNNN_partial_08_0132,
  rs_R009_ueqv_R009YNNNN_partial_08_0133,
  rs_R009_ueqv_R009YNNNN_partial_08_0134,
  rs_R009_ueqv_R009YNNNN_partial_08_0135,
  rs_R009_ueqv_R009YNNNN_partial_08_0136,
  rs_R009_ueqv_R009YNNNN_partial_08_0137,
  rs_R009_ueqv_R009YNNNN_partial_08_0138,
  rs_R009_ueqv_R009YNNNN_partial_08_0139,
  rs_R009_ueqv_R009YNNNN_partial_08_0140,
  rs_R009_ueqv_R009YNNNN_partial_08_0141,
  rs_R009_ueqv_R009YNNNN_partial_08_0142,
  rs_R009_ueqv_R009YNNNN_partial_08_0143,
  rs_R009_ueqv_R009YNNNN_partial_08_0144,
  rs_R009_ueqv_R009YNNNN_partial_08_0145,
  rs_R009_ueqv_R009YNNNN_partial_08_0146,
  rs_R009_ueqv_R009YNNNN_partial_08_0147,
  rs_R009_ueqv_R009YNNNN_partial_08_0148,
  rs_R009_ueqv_R009YNNNN_partial_08_0149,
  rs_R009_ueqv_R009YNNNN_partial_08_0150,
  rs_R009_ueqv_R009YNNNN_partial_08_0151,
  rs_R009_ueqv_R009YNNNN_partial_08_0152,
  rs_R009_ueqv_R009YNNNN_partial_08_0153,
  rs_R009_ueqv_R009YNNNN_partial_08_0154,
  rs_R009_ueqv_R009YNNNN_partial_08_0155,
  rs_R009_ueqv_R009YNNNN_partial_08_0156,
  rs_R009_ueqv_R009YNNNN_partial_08_0157,
  rs_R009_ueqv_R009YNNNN_partial_08_0158,
  rs_R009_ueqv_R009YNNNN_partial_08_0159,
  rs_R009_ueqv_R009YNNNN_partial_08_0160,
  rs_R009_ueqv_R009YNNNN_partial_08_0161,
  rs_R009_ueqv_R009YNNNN_partial_08_0162,
  rs_R009_ueqv_R009YNNNN_partial_08_0163,
  rs_R009_ueqv_R009YNNNN_partial_08_0164,
  rs_R009_ueqv_R009YNNNN_partial_08_0165,
  rs_R009_ueqv_R009YNNNN_partial_08_0166,
  rs_R009_ueqv_R009YNNNN_partial_08_0167,
  rs_R009_ueqv_R009YNNNN_partial_08_0168,
  rs_R009_ueqv_R009YNNNN_partial_08_0169,
  rs_R009_ueqv_R009YNNNN_partial_08_0170,
  rs_R009_ueqv_R009YNNNN_partial_08_0171,
  rs_R009_ueqv_R009YNNNN_partial_08_0172,
  rs_R009_ueqv_R009YNNNN_partial_08_0173,
  rs_R009_ueqv_R009YNNNN_partial_08_0174,
  rs_R009_ueqv_R009YNNNN_partial_08_0175,
  rs_R009_ueqv_R009YNNNN_partial_08_0176,
  rs_R009_ueqv_R009YNNNN_partial_08_0177,
  rs_R009_ueqv_R009YNNNN_partial_08_0178,
  rs_R009_ueqv_R009YNNNN_partial_08_0179,
  rs_R009_ueqv_R009YNNNN_partial_08_0180,
  rs_R009_ueqv_R009YNNNN_partial_08_0181,
  rs_R009_ueqv_R009YNNNN_partial_08_0182,
  rs_R009_ueqv_R009YNNNN_partial_08_0183,
  rs_R009_ueqv_R009YNNNN_partial_08_0184,
  rs_R009_ueqv_R009YNNNN_partial_08_0185,
  rs_R009_ueqv_R009YNNNN_partial_08_0186,
  rs_R009_ueqv_R009YNNNN_partial_08_0187,
  rs_R009_ueqv_R009YNNNN_partial_08_0188,
  rs_R009_ueqv_R009YNNNN_partial_08_0189,
  rs_R009_ueqv_R009YNNNN_partial_08_0190,
  rs_R009_ueqv_R009YNNNN_partial_08_0191,
  rs_R009_ueqv_R009YNNNN_partial_08_0192,
  rs_R009_ueqv_R009YNNNN_partial_08_0193,
  rs_R009_ueqv_R009YNNNN_partial_08_0194,
  rs_R009_ueqv_R009YNNNN_partial_08_0195,
  rs_R009_ueqv_R009YNNNN_partial_08_0196,
  rs_R009_ueqv_R009YNNNN_partial_08_0197,
  rs_R009_ueqv_R009YNNNN_partial_08_0198,
  rs_R009_ueqv_R009YNNNN_partial_08_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_08_0100_0199 : Poly :=
[
  term ((-62554550758679608 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(0, 1), (2, 1), (3, 1), (6, 1), (9, 1)],
  term ((17126653846152229 : Rat) / 4351606892766) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((170 : Rat) / 21) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-8631976586940982 : Rat) / 2175803446383) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((95075491148800633 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((100714948775257127 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((12642180407957059 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((27619545035095 : Rat) / 10117401714) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((3282196818563 : Rat) / 1998499104) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1)],
  term ((-65103058139743 : Rat) / 80939213712) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-179712 : Rat) / 553) [(0, 1), (2, 1), (3, 1), (10, 1), (11, 1)],
  term ((-135756748565609 : Rat) / 78940714608) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1)],
  term ((2245 : Rat) / 56) [(0, 1), (2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((106920059393860357 : Rat) / 78328924069788) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-437 : Rat) / 14) [(0, 1), (2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12123177172189757 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((-20281757454592271 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-85223536157796251 : Rat) / 26109641356596) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((2744896560033661 : Rat) / 3197098941624) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((1055 : Rat) / 252) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((5570 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((110193519371620127 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-311 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (14, 2), (15, 1)],
  term ((48546728082857233 : Rat) / 13054820678298) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-4472 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-14976935070875140 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2)],
  term ((10813215080142800 : Rat) / 6527410339149) [(0, 1), (2, 1), (3, 2), (6, 1)],
  term ((1280 : Rat) / 21) [(0, 1), (2, 1), (3, 2), (10, 1)],
  term ((-1819646145127105 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((-4890606284612249 : Rat) / 8703213785532) [(0, 1), (2, 1), (6, 1)],
  term ((27021501933329549 : Rat) / 19582231017447) [(0, 1), (2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-3792538175468572 : Rat) / 932487191307) [(0, 1), (2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((64 : Rat) / 9) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(0, 1), (2, 1), (6, 1), (7, 2)],
  term ((88776 : Rat) / 79) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((941242657 : Rat) / 41635398) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 21) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-628 : Rat) / 21) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 83270796) [(0, 1), (2, 1), (6, 1), (9, 2)],
  term ((2149676295281027 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (2, 1), (6, 1), (14, 1)],
  term ((-3803525234483 : Rat) / 5781372408) [(0, 1), (2, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((40507272099828053 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((746867501558939 : Rat) / 266424911802) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-815 : Rat) / 21) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11761382156653937 : Rat) / 2175803446383) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((596 : Rat) / 21) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1309002961808849 : Rat) / 932487191307) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-2217093085724623 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((22757431582735211 : Rat) / 78328924069788) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-1835 : Rat) / 126) [(0, 1), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-11704474140877951 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-51129595843742281 : Rat) / 26109641356596) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((718 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((301843357213373 : Rat) / 932487191307) [(0, 1), (2, 1), (7, 2)],
  term ((-4778931122581271 : Rat) / 2175803446383) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((391260605148335 : Rat) / 1826913680928) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-305 : Rat) / 14) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-122501297616904 : Rat) / 44404151967) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((130 : Rat) / 7) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23973055909205 : Rat) / 236822143824) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((1009675571026655 : Rat) / 913456840464) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((2172851284119785 : Rat) / 3197098941624) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((43066903590979 : Rat) / 118411071912) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-765 : Rat) / 28) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 8) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3930141094516747 : Rat) / 3197098941624) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((157 : Rat) / 7) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-473633850505555 : Rat) / 710466431472) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((85 : Rat) / 14) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4257321203020181 : Rat) / 6394197883248) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((34745 : Rat) / 504) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1456616568588635 : Rat) / 414438751692) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-7289 : Rat) / 126) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((51436413354355775 : Rat) / 13054820678298) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((4022132620056043 : Rat) / 3197098941624) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5575 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8019729413236 : Rat) / 44404151967) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-2320341801729530 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((1063 : Rat) / 63) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 2)],
  term ((4196087452243985 : Rat) / 4351606892766) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-1119074972569573 : Rat) / 799274735406) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((2785 : Rat) / 63) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((17217320609887931 : Rat) / 6527410339149) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-2236 : Rat) / 63) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((4662483939087787 : Rat) / 6527410339149) [(0, 1), (2, 2), (7, 2)],
  term ((-14972986545569 : Rat) / 23125489632) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((97881582290713 : Rat) / 80939213712) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((62348861886110 : Rat) / 6527410339149) [(0, 1), (2, 2), (10, 1)],
  term ((4257321203020181 : Rat) / 6394197883248) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-34745 : Rat) / 504) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1456616568588635 : Rat) / 414438751692) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((7289 : Rat) / 126) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(0, 1), (2, 2), (11, 2)],
  term ((-4022132620056043 : Rat) / 3197098941624) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((5575 : Rat) / 252) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8019729413236 : Rat) / 44404151967) [(0, 1), (2, 2), (14, 1)],
  term ((2320341801729530 : Rat) / 932487191307) [(0, 1), (2, 2), (15, 2)],
  term ((-1063 : Rat) / 63) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 3)],
  term ((62554550758679608 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (3, 1), (6, 1), (9, 1), (10, 1)],
  term ((-17126653846152229 : Rat) / 4351606892766) [(0, 1), (3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((8631976586940982 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-95075491148800633 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-12642180407957059 : Rat) / 13054820678298) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-100714948775257127 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((-27619545035095 : Rat) / 10117401714) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((65103058139743 : Rat) / 80939213712) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-3282196818563 : Rat) / 1998499104) [(0, 1), (3, 1), (9, 1), (10, 2)],
  term ((12123177172189757 : Rat) / 13054820678298) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((20281757454592271 : Rat) / 39164462034894) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((85223536157796251 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((-2744896560033661 : Rat) / 3197098941624) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1055 : Rat) / 252) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5570 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-110193519371620127 : Rat) / 39164462034894) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((311 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-48546728082857233 : Rat) / 13054820678298) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((4472 : Rat) / 63) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((135756748565609 : Rat) / 78940714608) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((-2245 : Rat) / 56) [(0, 1), (3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-106920059393860357 : Rat) / 78328924069788) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((437 : Rat) / 14) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (3, 2), (6, 1), (10, 1)],
  term ((14976935070875140 : Rat) / 19582231017447) [(0, 1), (3, 2), (10, 1)],
  term ((1819646145127105 : Rat) / 19582231017447) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 2), (10, 2)],
  term ((-27021501933329549 : Rat) / 19582231017447) [(0, 1), (6, 1), (7, 1), (9, 1), (10, 1)],
  term ((3792538175468572 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 2), (10, 1)],
  term ((-88776 : Rat) / 79) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-941242657 : Rat) / 41635398) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-725 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((628 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 83270796) [(0, 1), (6, 1), (9, 2), (10, 1)],
  term ((4890606284612249 : Rat) / 8703213785532) [(0, 1), (6, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-2149676295281027 : Rat) / 2901071261844) [(0, 1), (6, 1), (10, 2)],
  term ((3803525234483 : Rat) / 5781372408) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-1309002961808849 : Rat) / 932487191307) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((2217093085724623 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-22757431582735211 : Rat) / 78328924069788) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((1835 : Rat) / 126) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((11704474140877951 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-718 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3792538175468572 : Rat) / 932487191307) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((18066825860073880 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-301843357213373 : Rat) / 932487191307) [(0, 1), (7, 2), (10, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(0, 1), (7, 2), (10, 2)],
  term ((23973055909205 : Rat) / 236822143824) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1009675571026655 : Rat) / 913456840464) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2172851284119785 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-43066903590979 : Rat) / 118411071912) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((765 : Rat) / 28) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 8) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((3930141094516747 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-157 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((473633850505555 : Rat) / 710466431472) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-85 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((305 : Rat) / 14) [(0, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((9907541855867849 : Rat) / 6394197883248) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-130 : Rat) / 7) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4196087452243985 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-1119074972569573 : Rat) / 799274735406) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((2785 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((17217320609887931 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-2236 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((4662483939087787 : Rat) / 6527410339149) [(1, 1), (2, 1), (3, 1), (7, 2)],
  term ((-14972986545569 : Rat) / 23125489632) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1)],
  term ((97881582290713 : Rat) / 80939213712) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((4257321203020181 : Rat) / 6394197883248) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-34745 : Rat) / 504) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1456616568588635 : Rat) / 414438751692) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((7289 : Rat) / 126) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(1, 1), (2, 1), (3, 1), (11, 2)],
  term ((-4022132620056043 : Rat) / 3197098941624) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((5575 : Rat) / 252) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8019729413236 : Rat) / 44404151967) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((2320341801729530 : Rat) / 932487191307) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-1063 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((1119074972569573 : Rat) / 799274735406) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2785 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17217320609887931 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((2236 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4196087452243985 : Rat) / 4351606892766) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((-4662483939087787 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-97881582290713 : Rat) / 80939213712) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((14972986545569 : Rat) / 23125489632) [(1, 1), (2, 1), (9, 1), (11, 2)],
  term ((-395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((4022132620056043 : Rat) / 3197098941624) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5575 : Rat) / 252) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8019729413236 : Rat) / 44404151967) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-2320341801729530 : Rat) / 932487191307) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1063 : Rat) / 63) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4257321203020181 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((34745 : Rat) / 504) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((1456616568588635 : Rat) / 414438751692) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-7289 : Rat) / 126) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((51436413354355775 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 3)],
  term ((1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (3, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (11, 1)],
  term ((-4890606284612249 : Rat) / 8703213785532) [(1, 1), (3, 1), (6, 1)],
  term ((27021501933329549 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-17088750926160404 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(1, 1), (3, 1), (6, 1), (7, 2)],
  term ((835656454355063 : Rat) / 266424911802) [(1, 1), (3, 1), (6, 1), (9, 1), (11, 1)],
  term ((941242657 : Rat) / 41635398) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-628 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 83270796) [(1, 1), (3, 1), (6, 1), (9, 2)],
  term ((2149676295281027 : Rat) / 2901071261844) [(1, 1), (3, 1), (6, 1), (10, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((8631976586940982 : Rat) / 2175803446383) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17126653846152229 : Rat) / 4351606892766) [(1, 1), (3, 1), (6, 1), (11, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((-3803525234483 : Rat) / 5781372408) [(1, 1), (3, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1)],
  term ((58571654594422897 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((340 : Rat) / 63) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-18066825860073880 : Rat) / 6527410339149) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40097366752828975 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-5692122193135435 : Rat) / 4351606892766) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((22757431582735211 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-1835 : Rat) / 126) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-11704474140877951 : Rat) / 13054820678298) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-51129595843742281 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((718 : Rat) / 63) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((301843357213373 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((-327703885995629 : Rat) / 157881429216) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((-305 : Rat) / 14) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-9907541855867849 : Rat) / 6394197883248) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((130 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-18102824971728575 : Rat) / 6394197883248) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((2035145098371047 : Rat) / 1065699647208) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((2172851284119785 : Rat) / 3197098941624) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((43066903590979 : Rat) / 118411071912) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-765 : Rat) / 28) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 8) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3930141094516747 : Rat) / 3197098941624) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((157 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-473633850505555 : Rat) / 710466431472) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((85 : Rat) / 14) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((135756748565609 : Rat) / 78940714608) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2245 : Rat) / 56) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-106920059393860357 : Rat) / 78328924069788) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((437 : Rat) / 14) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((179712 : Rat) / 553) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((85223536157796251 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-2744896560033661 : Rat) / 3197098941624) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1055 : Rat) / 252) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5570 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-110193519371620127 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((311 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((-48546728082857233 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((4472 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((12123177172189757 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 2)],
  term ((20281757454592271 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-62554550758679608 : Rat) / 19582231017447) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((29753531378171087 : Rat) / 13054820678298) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((170 : Rat) / 21) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-8631976586940982 : Rat) / 2175803446383) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((95075491148800633 : Rat) / 39164462034894) [(1, 1), (3, 2), (7, 1)],
  term ((100714948775257127 : Rat) / 39164462034894) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((12642180407957059 : Rat) / 13054820678298) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((27619545035095 : Rat) / 10117401714) [(1, 1), (3, 2), (9, 1)],
  term ((3282196818563 : Rat) / 1998499104) [(1, 1), (3, 2), (9, 1), (10, 1)],
  term ((-65103058139743 : Rat) / 80939213712) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-640256 : Rat) / 1659) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((-135756748565609 : Rat) / 78940714608) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((2245 : Rat) / 56) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((106920059393860357 : Rat) / 78328924069788) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-437 : Rat) / 14) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-6415661374818991 : Rat) / 39164462034894) [(1, 1), (3, 2), (11, 1)],
  term ((-5547488388112687 : Rat) / 13054820678298) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-85223536157796251 : Rat) / 26109641356596) [(1, 1), (3, 2), (13, 1)],
  term ((2744896560033661 : Rat) / 3197098941624) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((1055 : Rat) / 252) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((5570 : Rat) / 63) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((110193519371620127 : Rat) / 39164462034894) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-311 : Rat) / 63) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((48546728082857233 : Rat) / 13054820678298) [(1, 1), (3, 2), (15, 1)],
  term ((-4472 : Rat) / 63) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-14976935070875140 : Rat) / 19582231017447) [(1, 1), (3, 3)],
  term ((10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 3), (6, 1)],
  term ((1280 : Rat) / 21) [(1, 1), (3, 3), (10, 1)],
  term ((-1819646145127105 : Rat) / 19582231017447) [(1, 1), (3, 3), (14, 1)],
  term ((-27021501933329549 : Rat) / 19582231017447) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3792538175468572 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 2), (11, 1)],
  term ((-941242657 : Rat) / 41635398) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-725 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((628 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-88776 : Rat) / 79) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((2172201733 : Rat) / 83270796) [(1, 1), (6, 1), (9, 2), (11, 1)],
  term ((-2149676295281027 : Rat) / 2901071261844) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((4890606284612249 : Rat) / 8703213785532) [(1, 1), (6, 1), (11, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((3803525234483 : Rat) / 5781372408) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((18066825860073880 : Rat) / 6527410339149) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3792538175468572 : Rat) / 932487191307) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-22757431582735211 : Rat) / 78328924069788) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((1835 : Rat) / 126) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((11704474140877951 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-718 : Rat) / 63) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1309002961808849 : Rat) / 932487191307) [(1, 1), (7, 1), (11, 2)],
  term ((2217093085724623 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 2), (14, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-301843357213373 : Rat) / 932487191307) [(1, 1), (7, 2), (11, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((305 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((9907541855867849 : Rat) / 6394197883248) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-130 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-2172851284119785 : Rat) / 3197098941624) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-43066903590979 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((765 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 8) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3930141094516747 : Rat) / 3197098941624) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-157 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((473633850505555 : Rat) / 710466431472) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-85 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((23973055909205 : Rat) / 236822143824) [(1, 1), (9, 1), (11, 2)],
  term ((-1009675571026655 : Rat) / 913456840464) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((-4196087452243985 : Rat) / 8703213785532) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((1119074972569573 : Rat) / 1598549470812) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-2785 : Rat) / 126) [(2, 1), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-17217320609887931 : Rat) / 13054820678298) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((1118 : Rat) / 63) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4662483939087787 : Rat) / 13054820678298) [(2, 1), (3, 2), (7, 2)],
  term ((14972986545569 : Rat) / 46250979264) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((-97881582290713 : Rat) / 161878427424) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (3, 2), (10, 1)],
  term ((-4257321203020181 : Rat) / 12788395766496) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((34745 : Rat) / 1008) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((1456616568588635 : Rat) / 828877503384) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-7289 : Rat) / 252) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 1), (3, 2), (11, 2)],
  term ((4022132620056043 : Rat) / 6394197883248) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-5575 : Rat) / 504) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((4009864706618 : Rat) / 44404151967) [(2, 1), (3, 2), (14, 1)],
  term ((-1160170900864765 : Rat) / 932487191307) [(2, 1), (3, 2), (15, 2)],
  term ((1063 : Rat) / 126) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((4196087452243985 : Rat) / 8703213785532) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((-1119074972569573 : Rat) / 1598549470812) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((2785 : Rat) / 126) [(2, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((17217320609887931 : Rat) / 13054820678298) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((-1118 : Rat) / 63) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1119074972569573 : Rat) / 1598549470812) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((2785 : Rat) / 126) [(2, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((17217320609887931 : Rat) / 13054820678298) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1118 : Rat) / 63) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((4196087452243985 : Rat) / 8703213785532) [(2, 1), (7, 1), (11, 3)],
  term ((4662483939087787 : Rat) / 13054820678298) [(2, 1), (7, 2), (10, 2)],
  term ((4662483939087787 : Rat) / 13054820678298) [(2, 1), (7, 2), (11, 2)],
  term ((-14972986545569 : Rat) / 46250979264) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((97881582290713 : Rat) / 161878427424) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((97881582290713 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-14972986545569 : Rat) / 46250979264) [(2, 1), (9, 1), (11, 3)],
  term ((395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1), (11, 2)],
  term ((4257321203020181 : Rat) / 12788395766496) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((-34745 : Rat) / 1008) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1456616568588635 : Rat) / 828877503384) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((7289 : Rat) / 252) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(2, 1), (10, 2), (11, 2)],
  term ((-4022132620056043 : Rat) / 6394197883248) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((5575 : Rat) / 504) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4009864706618 : Rat) / 44404151967) [(2, 1), (10, 2), (14, 1)],
  term ((1160170900864765 : Rat) / 932487191307) [(2, 1), (10, 2), (15, 2)],
  term ((-1063 : Rat) / 126) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 3)],
  term ((-4022132620056043 : Rat) / 6394197883248) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((5575 : Rat) / 504) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4009864706618 : Rat) / 44404151967) [(2, 1), (11, 2), (14, 1)],
  term ((1160170900864765 : Rat) / 932487191307) [(2, 1), (11, 2), (15, 2)],
  term ((-1063 : Rat) / 126) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((4257321203020181 : Rat) / 12788395766496) [(2, 1), (11, 3), (13, 1)],
  term ((-34745 : Rat) / 1008) [(2, 1), (11, 3), (13, 1), (16, 1)],
  term ((-1456616568588635 : Rat) / 828877503384) [(2, 1), (11, 3), (15, 1)],
  term ((7289 : Rat) / 252) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 4)],
  term ((31277275379339804 : Rat) / 19582231017447) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((-17126653846152229 : Rat) / 8703213785532) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((-85 : Rat) / 21) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((16 : Rat) / 3) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-95075491148800633 : Rat) / 78328924069788) [(2, 2), (3, 1), (7, 1)],
  term ((-100714948775257127 : Rat) / 78328924069788) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((-12642180407957059 : Rat) / 26109641356596) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-27619545035095 : Rat) / 20234803428) [(2, 2), (3, 1), (9, 1)],
  term ((-3282196818563 : Rat) / 3996998208) [(2, 2), (3, 1), (9, 1), (10, 1)],
  term ((65103058139743 : Rat) / 161878427424) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((89856 : Rat) / 553) [(2, 2), (3, 1), (10, 1), (11, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(2, 2), (3, 1), (10, 1), (13, 1)],
  term ((-2245 : Rat) / 112) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((437 : Rat) / 28) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((12123177172189757 : Rat) / 26109641356596) [(2, 2), (3, 1), (11, 1)],
  term ((20281757454592271 : Rat) / 78328924069788) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((85223536157796251 : Rat) / 52219282713192) [(2, 2), (3, 1), (13, 1)],
  term ((-2744896560033661 : Rat) / 6394197883248) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-1055 : Rat) / 504) [(2, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 63) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-110193519371620127 : Rat) / 78328924069788) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((311 : Rat) / 126) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((-48546728082857233 : Rat) / 26109641356596) [(2, 2), (3, 1), (15, 1)],
  term ((2236 : Rat) / 63) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((26764769948430305 : Rat) / 78328924069788) [(2, 2), (3, 2)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(2, 2), (3, 2), (6, 1)],
  term ((-640 : Rat) / 21) [(2, 2), (3, 2), (10, 1)],
  term ((1819646145127105 : Rat) / 39164462034894) [(2, 2), (3, 2), (14, 1)],
  term ((4890606284612249 : Rat) / 17406427571064) [(2, 2), (6, 1)],
  term ((-27021501933329549 : Rat) / 39164462034894) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((170 : Rat) / 63) [(2, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(2, 2), (6, 1), (7, 2)],
  term ((-44388 : Rat) / 79) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((-941242657 : Rat) / 83270796) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((314 : Rat) / 21) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 166541592) [(2, 2), (6, 1), (9, 2)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(2, 2), (6, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(2, 2), (6, 1), (14, 1)],
  term ((3803525234483 : Rat) / 11562744816) [(2, 2), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(2, 2), (7, 1), (9, 1), (10, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9033412930036940 : Rat) / 6527410339149) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((32 : Rat) / 9) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1309002961808849 : Rat) / 1864974382614) [(2, 2), (7, 1), (11, 1)],
  term ((2217093085724623 : Rat) / 13054820678298) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-22757431582735211 : Rat) / 156657848139576) [(2, 2), (7, 1), (13, 1)],
  term ((1835 : Rat) / 252) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((11704474140877951 : Rat) / 26109641356596) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 52219282713192) [(2, 2), (7, 1), (15, 1)],
  term ((-359 : Rat) / 63) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-301843357213373 : Rat) / 1864974382614) [(2, 2), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(2, 2), (7, 2), (10, 1)],
  term ((119808 : Rat) / 553) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((305 : Rat) / 28) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((9907541855867849 : Rat) / 12788395766496) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-65 : Rat) / 7) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((23973055909205 : Rat) / 473644287648) [(2, 2), (9, 1), (11, 1)],
  term ((-1009675571026655 : Rat) / 1826913680928) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2172851284119785 : Rat) / 6394197883248) [(2, 2), (9, 1), (13, 1)],
  term ((-43066903590979 : Rat) / 236822143824) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((765 : Rat) / 56) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 16) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((3930141094516747 : Rat) / 6394197883248) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-157 : Rat) / 14) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((473633850505555 : Rat) / 1420932862944) [(2, 2), (9, 1), (15, 1)],
  term ((-85 : Rat) / 28) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (10, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2), (11, 2)],
  term ((-4196087452243985 : Rat) / 8703213785532) [(2, 3), (7, 1), (11, 1)],
  term ((1119074972569573 : Rat) / 1598549470812) [(2, 3), (7, 1), (13, 1)],
  term ((-2785 : Rat) / 126) [(2, 3), (7, 1), (13, 1), (16, 1)],
  term ((-17217320609887931 : Rat) / 13054820678298) [(2, 3), (7, 1), (15, 1)],
  term ((1118 : Rat) / 63) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((-4662483939087787 : Rat) / 13054820678298) [(2, 3), (7, 2)],
  term ((14972986545569 : Rat) / 46250979264) [(2, 3), (9, 1), (11, 1)],
  term ((-97881582290713 : Rat) / 161878427424) [(2, 3), (9, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 3), (10, 1)],
  term ((-4257321203020181 : Rat) / 12788395766496) [(2, 3), (11, 1), (13, 1)],
  term ((34745 : Rat) / 1008) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((1456616568588635 : Rat) / 828877503384) [(2, 3), (11, 1), (15, 1)],
  term ((-7289 : Rat) / 252) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 3), (11, 2)],
  term ((4022132620056043 : Rat) / 6394197883248) [(2, 3), (13, 1), (15, 1)],
  term ((-5575 : Rat) / 504) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((4009864706618 : Rat) / 44404151967) [(2, 3), (14, 1)],
  term ((-1160170900864765 : Rat) / 932487191307) [(2, 3), (15, 2)],
  term ((1063 : Rat) / 126) [(2, 3), (15, 2), (16, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 4)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (10, 2)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (11, 2)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (11, 2)],
  term ((17126653846152229 : Rat) / 8703213785532) [(3, 1), (6, 1), (10, 2), (11, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((85 : Rat) / 21) [(3, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((-4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((85 : Rat) / 21) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((-4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((17126653846152229 : Rat) / 8703213785532) [(3, 1), (6, 1), (11, 3)],
  term ((100714948775257127 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((95075491148800633 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 2)],
  term ((12642180407957059 : Rat) / 26109641356596) [(3, 1), (7, 1), (10, 2), (14, 1)],
  term ((100714948775257127 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 3)],
  term ((95075491148800633 : Rat) / 78328924069788) [(3, 1), (7, 1), (11, 2)],
  term ((12642180407957059 : Rat) / 26109641356596) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((27619545035095 : Rat) / 20234803428) [(3, 1), (9, 1), (10, 2)],
  term ((-65103058139743 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 3)],
  term ((27619545035095 : Rat) / 20234803428) [(3, 1), (9, 1), (11, 2)],
  term ((-65103058139743 : Rat) / 161878427424) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((-135756748565609 : Rat) / 157881429216) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((2245 : Rat) / 112) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-437 : Rat) / 28) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-89856 : Rat) / 553) [(3, 1), (10, 1), (11, 3)],
  term ((-12123177172189757 : Rat) / 26109641356596) [(3, 1), (10, 2), (11, 1)],
  term ((-20281757454592271 : Rat) / 78328924069788) [(3, 1), (10, 2), (11, 1), (14, 1)],
  term ((-85223536157796251 : Rat) / 52219282713192) [(3, 1), (10, 2), (13, 1)],
  term ((2744896560033661 : Rat) / 6394197883248) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((1055 : Rat) / 504) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((110193519371620127 : Rat) / 78328924069788) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-311 : Rat) / 126) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (10, 2), (14, 2), (15, 1)],
  term ((48546728082857233 : Rat) / 26109641356596) [(3, 1), (10, 2), (15, 1)],
  term ((-2236 : Rat) / 63) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-89856 : Rat) / 553) [(3, 1), (10, 3), (11, 1)],
  term ((-135756748565609 : Rat) / 157881429216) [(3, 1), (10, 3), (13, 1)],
  term ((2245 : Rat) / 112) [(3, 1), (10, 3), (13, 1), (16, 1)],
  term ((106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 3), (15, 1)],
  term ((-437 : Rat) / 28) [(3, 1), (10, 3), (15, 1), (16, 1)],
  term ((-85223536157796251 : Rat) / 52219282713192) [(3, 1), (11, 2), (13, 1)],
  term ((2744896560033661 : Rat) / 6394197883248) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((1055 : Rat) / 504) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2785 : Rat) / 63) [(3, 1), (11, 2), (13, 1), (16, 1)],
  term ((110193519371620127 : Rat) / 78328924069788) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-311 : Rat) / 126) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 1), (11, 2), (14, 2), (15, 1)],
  term ((48546728082857233 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)],
  term ((-2236 : Rat) / 63) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12123177172189757 : Rat) / 26109641356596) [(3, 1), (11, 3)],
  term ((-20281757454592271 : Rat) / 78328924069788) [(3, 1), (11, 3), (14, 1)],
  term ((4890606284612249 : Rat) / 17406427571064) [(3, 2), (6, 1)],
  term ((-27021501933329549 : Rat) / 39164462034894) [(3, 2), (6, 1), (7, 1), (9, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 2), (6, 1), (7, 1), (13, 1)],
  term ((170 : Rat) / 63) [(3, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-20283918945798503 : Rat) / 13054820678298) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(3, 2), (6, 1), (7, 2)],
  term ((-44388 : Rat) / 79) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((-941242657 : Rat) / 83270796) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(3, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((314 : Rat) / 21) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 166541592) [(3, 2), (6, 1), (9, 2)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(3, 2), (6, 1), (10, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (10, 2)],
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(3, 2), (6, 1), (14, 1)],
  term ((3803525234483 : Rat) / 11562744816) [(3, 2), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(3, 2), (7, 1), (9, 1), (10, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9033412930036940 : Rat) / 6527410339149) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((32 : Rat) / 9) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1309002961808849 : Rat) / 1864974382614) [(3, 2), (7, 1), (11, 1)],
  term ((2217093085724623 : Rat) / 13054820678298) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-22757431582735211 : Rat) / 156657848139576) [(3, 2), (7, 1), (13, 1)],
  term ((1835 : Rat) / 252) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((11704474140877951 : Rat) / 26109641356596) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((51129595843742281 : Rat) / 52219282713192) [(3, 2), (7, 1), (15, 1)],
  term ((-359 : Rat) / 63) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-301843357213373 : Rat) / 1864974382614) [(3, 2), (7, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(3, 2), (7, 2), (10, 1)],
  term ((119808 : Rat) / 553) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((305 : Rat) / 28) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((9907541855867849 : Rat) / 12788395766496) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((-65 : Rat) / 7) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((23973055909205 : Rat) / 473644287648) [(3, 2), (9, 1), (11, 1)],
  term ((-1009675571026655 : Rat) / 1826913680928) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2172851284119785 : Rat) / 6394197883248) [(3, 2), (9, 1), (13, 1)],
  term ((-43066903590979 : Rat) / 236822143824) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((765 : Rat) / 56) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 16) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((3930141094516747 : Rat) / 6394197883248) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-157 : Rat) / 14) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((473633850505555 : Rat) / 1420932862944) [(3, 2), (9, 1), (15, 1)],
  term ((-85 : Rat) / 28) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((640 : Rat) / 21) [(3, 2), (10, 1), (11, 2)],
  term ((-7488467535437570 : Rat) / 19582231017447) [(3, 2), (10, 2)],
  term ((-1819646145127105 : Rat) / 39164462034894) [(3, 2), (10, 2), (14, 1)],
  term ((640 : Rat) / 21) [(3, 2), (10, 3)],
  term ((-7488467535437570 : Rat) / 19582231017447) [(3, 2), (11, 2)],
  term ((-1819646145127105 : Rat) / 39164462034894) [(3, 2), (11, 2), (14, 1)],
  term ((31277275379339804 : Rat) / 19582231017447) [(3, 3), (6, 1), (7, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 3), (6, 1), (9, 1)],
  term ((-17126653846152229 : Rat) / 8703213785532) [(3, 3), (6, 1), (11, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(3, 3), (6, 1), (13, 1)],
  term ((-85 : Rat) / 21) [(3, 3), (6, 1), (13, 1), (16, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(3, 3), (6, 1), (15, 1)],
  term ((16 : Rat) / 3) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((-95075491148800633 : Rat) / 78328924069788) [(3, 3), (7, 1)],
  term ((-100714948775257127 : Rat) / 78328924069788) [(3, 3), (7, 1), (10, 1)],
  term ((-12642180407957059 : Rat) / 26109641356596) [(3, 3), (7, 1), (14, 1)],
  term ((-27619545035095 : Rat) / 20234803428) [(3, 3), (9, 1)],
  term ((-3282196818563 : Rat) / 3996998208) [(3, 3), (9, 1), (10, 1)],
  term ((65103058139743 : Rat) / 161878427424) [(3, 3), (9, 1), (14, 1)],
  term ((89856 : Rat) / 553) [(3, 3), (10, 1), (11, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(3, 3), (10, 1), (13, 1)],
  term ((-2245 : Rat) / 112) [(3, 3), (10, 1), (13, 1), (16, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(3, 3), (10, 1), (15, 1)],
  term ((437 : Rat) / 28) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((12123177172189757 : Rat) / 26109641356596) [(3, 3), (11, 1)],
  term ((20281757454592271 : Rat) / 78328924069788) [(3, 3), (11, 1), (14, 1)],
  term ((85223536157796251 : Rat) / 52219282713192) [(3, 3), (13, 1)],
  term ((-2744896560033661 : Rat) / 6394197883248) [(3, 3), (13, 1), (14, 1)],
  term ((-1055 : Rat) / 504) [(3, 3), (13, 1), (14, 1), (16, 1)],
  term ((-2785 : Rat) / 63) [(3, 3), (13, 1), (16, 1)],
  term ((-110193519371620127 : Rat) / 78328924069788) [(3, 3), (14, 1), (15, 1)],
  term ((311 : Rat) / 126) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 3), (14, 2), (15, 1)],
  term ((-48546728082857233 : Rat) / 26109641356596) [(3, 3), (15, 1)],
  term ((2236 : Rat) / 63) [(3, 3), (15, 1), (16, 1)],
  term ((7488467535437570 : Rat) / 19582231017447) [(3, 4)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 4), (6, 1)],
  term ((-640 : Rat) / 21) [(3, 4), (10, 1)],
  term ((1819646145127105 : Rat) / 39164462034894) [(3, 4), (14, 1)],
  term ((27021501933329549 : Rat) / 39164462034894) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((27021501933329549 : Rat) / 39164462034894) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (10, 2), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (11, 2), (13, 1), (16, 1)],
  term ((20283918945798503 : Rat) / 13054820678298) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1896269087734286 : Rat) / 932487191307) [(6, 1), (7, 1), (11, 3)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (10, 2)],
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (11, 2)],
  term ((44388 : Rat) / 79) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((44388 : Rat) / 79) [(6, 1), (9, 1), (11, 3)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (10, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (11, 2)],
  term ((2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 1), (11, 2)],
  term ((-4890606284612249 : Rat) / 17406427571064) [(6, 1), (10, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (10, 2), (14, 1)],
  term ((2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 3)],
  term ((-4890606284612249 : Rat) / 17406427571064) [(6, 1), (11, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (11, 2), (14, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-3803525234483 : Rat) / 11562744816) [(7, 1), (9, 1), (10, 2)],
  term ((-6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 3)],
  term ((-3803525234483 : Rat) / 11562744816) [(7, 1), (9, 1), (11, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((170 : Rat) / 63) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-9033412930036940 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 3)],
  term ((1309002961808849 : Rat) / 1864974382614) [(7, 1), (10, 2), (11, 1)],
  term ((-2217093085724623 : Rat) / 13054820678298) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((22757431582735211 : Rat) / 156657848139576) [(7, 1), (10, 2), (13, 1)],
  term ((-1835 : Rat) / 252) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-11704474140877951 : Rat) / 26109641356596) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-51129595843742281 : Rat) / 52219282713192) [(7, 1), (10, 2), (15, 1)],
  term ((359 : Rat) / 63) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1896269087734286 : Rat) / 932487191307) [(7, 1), (10, 3), (11, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(7, 1), (10, 3), (13, 1)],
  term ((170 : Rat) / 63) [(7, 1), (10, 3), (13, 1), (16, 1)],
  term ((-9033412930036940 : Rat) / 6527410339149) [(7, 1), (10, 3), (15, 1)],
  term ((-32 : Rat) / 9) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((22757431582735211 : Rat) / 156657848139576) [(7, 1), (11, 2), (13, 1)],
  term ((-1835 : Rat) / 252) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-11704474140877951 : Rat) / 26109641356596) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-51129595843742281 : Rat) / 52219282713192) [(7, 1), (11, 2), (15, 1)],
  term ((359 : Rat) / 63) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1309002961808849 : Rat) / 1864974382614) [(7, 1), (11, 3)],
  term ((-2217093085724623 : Rat) / 13054820678298) [(7, 1), (11, 3), (14, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (10, 1), (11, 2)],
  term ((301843357213373 : Rat) / 1864974382614) [(7, 2), (10, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(7, 2), (10, 3)],
  term ((301843357213373 : Rat) / 1864974382614) [(7, 2), (11, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-9907541855867849 : Rat) / 12788395766496) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((65 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 1), (11, 3)],
  term ((-23973055909205 : Rat) / 473644287648) [(9, 1), (10, 2), (11, 1)],
  term ((1009675571026655 : Rat) / 1826913680928) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((2172851284119785 : Rat) / 6394197883248) [(9, 1), (10, 2), (13, 1)],
  term ((43066903590979 : Rat) / 236822143824) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-765 : Rat) / 56) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 16) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-3930141094516747 : Rat) / 6394197883248) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((157 : Rat) / 14) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-473633850505555 : Rat) / 1420932862944) [(9, 1), (10, 2), (15, 1)],
  term ((85 : Rat) / 28) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 3), (11, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (10, 3), (13, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((-9907541855867849 : Rat) / 12788395766496) [(9, 1), (10, 3), (15, 1)],
  term ((65 : Rat) / 7) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((2172851284119785 : Rat) / 6394197883248) [(9, 1), (11, 2), (13, 1)],
  term ((43066903590979 : Rat) / 236822143824) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-765 : Rat) / 56) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 16) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3930141094516747 : Rat) / 6394197883248) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((157 : Rat) / 14) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-473633850505555 : Rat) / 1420932862944) [(9, 1), (11, 2), (15, 1)],
  term ((85 : Rat) / 28) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23973055909205 : Rat) / 473644287648) [(9, 1), (11, 3)],
  term ((1009675571026655 : Rat) / 1826913680928) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_08_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_08_0100_0199
      rs_R009_ueqv_R009YNNNN_block_08_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
