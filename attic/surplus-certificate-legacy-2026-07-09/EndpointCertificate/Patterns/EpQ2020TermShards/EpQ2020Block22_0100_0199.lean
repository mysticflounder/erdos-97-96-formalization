/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 22:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_22_0100_0199 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0100 : Poly :=
[
  term ((3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 100 for generator 22. -/
def ep_Q2_020_partial_22_0100 : Poly :=
[
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 22. -/
theorem ep_Q2_020_partial_22_0100_valid :
    mulPoly ep_Q2_020_coefficient_22_0100
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0101 : Poly :=
[
  term ((-6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 22. -/
def ep_Q2_020_partial_22_0101 : Poly :=
[
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 22. -/
theorem ep_Q2_020_partial_22_0101_valid :
    mulPoly ep_Q2_020_coefficient_22_0101
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0102 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 22. -/
def ep_Q2_020_partial_22_0102 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 22. -/
theorem ep_Q2_020_partial_22_0102_valid :
    mulPoly ep_Q2_020_coefficient_22_0102
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0103 : Poly :=
[
  term ((4541978495796464619 : Rat) / 56596790034801622) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 22. -/
def ep_Q2_020_partial_22_0103 : Poly :=
[
  term ((4541978495796464619 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4541978495796464619 : Rat) / 56596790034801622) [(1, 1), (5, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((4541978495796464619 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4541978495796464619 : Rat) / 56596790034801622) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 22. -/
theorem ep_Q2_020_partial_22_0103_valid :
    mulPoly ep_Q2_020_coefficient_22_0103
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0104 : Poly :=
[
  term ((-95240795357105928 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 104 for generator 22. -/
def ep_Q2_020_partial_22_0104 : Poly :=
[
  term ((-190481590714211856 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((95240795357105928 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((-190481590714211856 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((95240795357105928 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 22. -/
theorem ep_Q2_020_partial_22_0104_valid :
    mulPoly ep_Q2_020_coefficient_22_0104
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0105 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 22. -/
def ep_Q2_020_partial_22_0105 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 22. -/
theorem ep_Q2_020_partial_22_0105_valid :
    mulPoly ep_Q2_020_coefficient_22_0105
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0106 : Poly :=
[
  term ((1255983510370786755 : Rat) / 28298395017400811) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 106 for generator 22. -/
def ep_Q2_020_partial_22_0106 : Poly :=
[
  term ((2511967020741573510 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1255983510370786755 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((2511967020741573510 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1255983510370786755 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 22. -/
theorem ep_Q2_020_partial_22_0106_valid :
    mulPoly ep_Q2_020_coefficient_22_0106
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0107 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 22. -/
def ep_Q2_020_partial_22_0107 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 22. -/
theorem ep_Q2_020_partial_22_0107_valid :
    mulPoly ep_Q2_020_coefficient_22_0107
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0108 : Poly :=
[
  term ((29044307636123439 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 108 for generator 22. -/
def ep_Q2_020_partial_22_0108 : Poly :=
[
  term ((58088615272246878 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-29044307636123439 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((58088615272246878 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-29044307636123439 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 22. -/
theorem ep_Q2_020_partial_22_0108_valid :
    mulPoly ep_Q2_020_coefficient_22_0108
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0109 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 109 for generator 22. -/
def ep_Q2_020_partial_22_0109 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 2), (11, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 22. -/
theorem ep_Q2_020_partial_22_0109_valid :
    mulPoly ep_Q2_020_coefficient_22_0109
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0110 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 22. -/
def ep_Q2_020_partial_22_0110 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 2), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 22. -/
theorem ep_Q2_020_partial_22_0110_valid :
    mulPoly ep_Q2_020_coefficient_22_0110
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0111 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 111 for generator 22. -/
def ep_Q2_020_partial_22_0111 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 22. -/
theorem ep_Q2_020_partial_22_0111_valid :
    mulPoly ep_Q2_020_coefficient_22_0111
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0112 : Poly :=
[
  term ((-61984855369560231 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 112 for generator 22. -/
def ep_Q2_020_partial_22_0112 : Poly :=
[
  term ((-123969710739120462 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((61984855369560231 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-123969710739120462 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((61984855369560231 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 22. -/
theorem ep_Q2_020_partial_22_0112_valid :
    mulPoly ep_Q2_020_coefficient_22_0112
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0113 : Poly :=
[
  term ((-152002538813684106 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 22. -/
def ep_Q2_020_partial_22_0113 : Poly :=
[
  term ((-304005077627368212 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((152002538813684106 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((-304005077627368212 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((152002538813684106 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 22. -/
theorem ep_Q2_020_partial_22_0113_valid :
    mulPoly ep_Q2_020_coefficient_22_0113
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0114 : Poly :=
[
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 114 for generator 22. -/
def ep_Q2_020_partial_22_0114 : Poly :=
[
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 22. -/
theorem ep_Q2_020_partial_22_0114_valid :
    mulPoly ep_Q2_020_coefficient_22_0114
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0115 : Poly :=
[
  term ((51269697293905980 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 22. -/
def ep_Q2_020_partial_22_0115 : Poly :=
[
  term ((102539394587811960 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-51269697293905980 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((102539394587811960 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-51269697293905980 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 22. -/
theorem ep_Q2_020_partial_22_0115_valid :
    mulPoly ep_Q2_020_coefficient_22_0115
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0116 : Poly :=
[
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 22. -/
def ep_Q2_020_partial_22_0116 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 22. -/
theorem ep_Q2_020_partial_22_0116_valid :
    mulPoly ep_Q2_020_coefficient_22_0116
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0117 : Poly :=
[
  term ((536572195550064 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 22. -/
def ep_Q2_020_partial_22_0117 : Poly :=
[
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-536572195550064 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-536572195550064 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 22. -/
theorem ep_Q2_020_partial_22_0117_valid :
    mulPoly ep_Q2_020_coefficient_22_0117
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0118 : Poly :=
[
  term ((95568977655372891 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 118 for generator 22. -/
def ep_Q2_020_partial_22_0118 : Poly :=
[
  term ((191137955310745782 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-95568977655372891 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((191137955310745782 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((-95568977655372891 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 22. -/
theorem ep_Q2_020_partial_22_0118_valid :
    mulPoly ep_Q2_020_coefficient_22_0118
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0119 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 119 for generator 22. -/
def ep_Q2_020_partial_22_0119 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 22. -/
theorem ep_Q2_020_partial_22_0119_valid :
    mulPoly ep_Q2_020_coefficient_22_0119
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0120 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 120 for generator 22. -/
def ep_Q2_020_partial_22_0120 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (9, 2), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 22. -/
theorem ep_Q2_020_partial_22_0120_valid :
    mulPoly ep_Q2_020_coefficient_22_0120
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0121 : Poly :=
[
  term ((-23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 121 for generator 22. -/
def ep_Q2_020_partial_22_0121 : Poly :=
[
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 22. -/
theorem ep_Q2_020_partial_22_0121_valid :
    mulPoly ep_Q2_020_coefficient_22_0121
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0122 : Poly :=
[
  term ((-1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 22. -/
def ep_Q2_020_partial_22_0122 : Poly :=
[
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 22. -/
theorem ep_Q2_020_partial_22_0122_valid :
    mulPoly ep_Q2_020_coefficient_22_0122
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0123 : Poly :=
[
  term ((-125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 123 for generator 22. -/
def ep_Q2_020_partial_22_0123 : Poly :=
[
  term ((-251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((-251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 22. -/
theorem ep_Q2_020_partial_22_0123_valid :
    mulPoly ep_Q2_020_coefficient_22_0123
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0124 : Poly :=
[
  term ((9623059700155929 : Rat) / 975806724737959) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 124 for generator 22. -/
def ep_Q2_020_partial_22_0124 : Poly :=
[
  term ((19246119400311858 : Rat) / 975806724737959) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-9623059700155929 : Rat) / 975806724737959) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((19246119400311858 : Rat) / 975806724737959) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9623059700155929 : Rat) / 975806724737959) [(1, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 22. -/
theorem ep_Q2_020_partial_22_0124_valid :
    mulPoly ep_Q2_020_coefficient_22_0124
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0125 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)]
]

/-- Partial product 125 for generator 22. -/
def ep_Q2_020_partial_22_0125 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 2), (9, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 22. -/
theorem ep_Q2_020_partial_22_0125_valid :
    mulPoly ep_Q2_020_coefficient_22_0125
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0126 : Poly :=
[
  term ((20410761555916369 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 126 for generator 22. -/
def ep_Q2_020_partial_22_0126 : Poly :=
[
  term ((40821523111832738 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-20410761555916369 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((40821523111832738 : Rat) / 28298395017400811) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-20410761555916369 : Rat) / 28298395017400811) [(1, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 22. -/
theorem ep_Q2_020_partial_22_0126_valid :
    mulPoly ep_Q2_020_coefficient_22_0126
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0127 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 127 for generator 22. -/
def ep_Q2_020_partial_22_0127 : Poly :=
[
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 22. -/
theorem ep_Q2_020_partial_22_0127_valid :
    mulPoly ep_Q2_020_coefficient_22_0127
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0128 : Poly :=
[
  term ((-48376507104719856 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 128 for generator 22. -/
def ep_Q2_020_partial_22_0128 : Poly :=
[
  term ((-96753014209439712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48376507104719856 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-96753014209439712 : Rat) / 28298395017400811) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((48376507104719856 : Rat) / 28298395017400811) [(1, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 22. -/
theorem ep_Q2_020_partial_22_0128_valid :
    mulPoly ep_Q2_020_coefficient_22_0128
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0129 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 22. -/
def ep_Q2_020_partial_22_0129 : Poly :=
[
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 22. -/
theorem ep_Q2_020_partial_22_0129_valid :
    mulPoly ep_Q2_020_coefficient_22_0129
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0130 : Poly :=
[
  term ((-178857398516688 : Rat) / 1230365000756557) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 22. -/
def ep_Q2_020_partial_22_0130 : Poly :=
[
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 22. -/
theorem ep_Q2_020_partial_22_0130_valid :
    mulPoly ep_Q2_020_coefficient_22_0130
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0131 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 131 for generator 22. -/
def ep_Q2_020_partial_22_0131 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 22. -/
theorem ep_Q2_020_partial_22_0131_valid :
    mulPoly ep_Q2_020_coefficient_22_0131
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0132 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 22. -/
def ep_Q2_020_partial_22_0132 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 22. -/
theorem ep_Q2_020_partial_22_0132_valid :
    mulPoly ep_Q2_020_coefficient_22_0132
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0133 : Poly :=
[
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 133 for generator 22. -/
def ep_Q2_020_partial_22_0133 : Poly :=
[
  term ((88957992767669712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((88957992767669712 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 22. -/
theorem ep_Q2_020_partial_22_0133_valid :
    mulPoly ep_Q2_020_coefficient_22_0133
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0134 : Poly :=
[
  term ((-7138185820791267 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 134 for generator 22. -/
def ep_Q2_020_partial_22_0134 : Poly :=
[
  term ((-14276371641582534 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((7138185820791267 : Rat) / 28298395017400811) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((-14276371641582534 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((7138185820791267 : Rat) / 28298395017400811) [(1, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 22. -/
theorem ep_Q2_020_partial_22_0134_valid :
    mulPoly ep_Q2_020_coefficient_22_0134
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0135 : Poly :=
[
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 135 for generator 22. -/
def ep_Q2_020_partial_22_0135 : Poly :=
[
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 22. -/
theorem ep_Q2_020_partial_22_0135_valid :
    mulPoly ep_Q2_020_coefficient_22_0135
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0136 : Poly :=
[
  term ((7795021441770000 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 22. -/
def ep_Q2_020_partial_22_0136 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 22. -/
theorem ep_Q2_020_partial_22_0136_valid :
    mulPoly ep_Q2_020_coefficient_22_0136
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0137 : Poly :=
[
  term ((357714797033376 : Rat) / 1230365000756557) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 137 for generator 22. -/
def ep_Q2_020_partial_22_0137 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 22. -/
theorem ep_Q2_020_partial_22_0137_valid :
    mulPoly ep_Q2_020_coefficient_22_0137
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0138 : Poly :=
[
  term ((-913288136681903515 : Rat) / 56596790034801622) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 138 for generator 22. -/
def ep_Q2_020_partial_22_0138 : Poly :=
[
  term ((-913288136681903515 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((913288136681903515 : Rat) / 56596790034801622) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-913288136681903515 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((913288136681903515 : Rat) / 56596790034801622) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 22. -/
theorem ep_Q2_020_partial_22_0138_valid :
    mulPoly ep_Q2_020_coefficient_22_0138
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0139 : Poly :=
[
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 22. -/
def ep_Q2_020_partial_22_0139 : Poly :=
[
  term ((118610657023559616 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 22. -/
theorem ep_Q2_020_partial_22_0139_valid :
    mulPoly ep_Q2_020_coefficient_22_0139
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0140 : Poly :=
[
  term ((55214735212537500 : Rat) / 28298395017400811) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 140 for generator 22. -/
def ep_Q2_020_partial_22_0140 : Poly :=
[
  term ((110429470425075000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55214735212537500 : Rat) / 28298395017400811) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((110429470425075000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55214735212537500 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 22. -/
theorem ep_Q2_020_partial_22_0140_valid :
    mulPoly ep_Q2_020_coefficient_22_0140
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0141 : Poly :=
[
  term ((-118890263337938379 : Rat) / 7806453797903672) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 141 for generator 22. -/
def ep_Q2_020_partial_22_0141 : Poly :=
[
  term ((-118890263337938379 : Rat) / 3903226898951836) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((118890263337938379 : Rat) / 7806453797903672) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-118890263337938379 : Rat) / 3903226898951836) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((118890263337938379 : Rat) / 7806453797903672) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 22. -/
theorem ep_Q2_020_partial_22_0141_valid :
    mulPoly ep_Q2_020_coefficient_22_0141
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0142 : Poly :=
[
  term ((2533813145653080 : Rat) / 1230365000756557) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 22. -/
def ep_Q2_020_partial_22_0142 : Poly :=
[
  term ((5067626291306160 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2533813145653080 : Rat) / 1230365000756557) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((5067626291306160 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2533813145653080 : Rat) / 1230365000756557) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 22. -/
theorem ep_Q2_020_partial_22_0142_valid :
    mulPoly ep_Q2_020_coefficient_22_0142
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0143 : Poly :=
[
  term ((-1090650392308255911 : Rat) / 113193580069603244) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 22. -/
def ep_Q2_020_partial_22_0143 : Poly :=
[
  term ((-1090650392308255911 : Rat) / 56596790034801622) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1090650392308255911 : Rat) / 113193580069603244) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1090650392308255911 : Rat) / 56596790034801622) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1090650392308255911 : Rat) / 113193580069603244) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 22. -/
theorem ep_Q2_020_partial_22_0143_valid :
    mulPoly ep_Q2_020_coefficient_22_0143
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0144 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (16, 1)]
]

/-- Partial product 144 for generator 22. -/
def ep_Q2_020_partial_22_0144 : Poly :=
[
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 2), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 22. -/
theorem ep_Q2_020_partial_22_0144_valid :
    mulPoly ep_Q2_020_coefficient_22_0144
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0145 : Poly :=
[
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 145 for generator 22. -/
def ep_Q2_020_partial_22_0145 : Poly :=
[
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 2), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 22. -/
theorem ep_Q2_020_partial_22_0145_valid :
    mulPoly ep_Q2_020_coefficient_22_0145
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0146 : Poly :=
[
  term ((24908671852943205 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

/-- Partial product 146 for generator 22. -/
def ep_Q2_020_partial_22_0146 : Poly :=
[
  term ((49817343705886410 : Rat) / 28298395017400811) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((-24908671852943205 : Rat) / 28298395017400811) [(1, 2), (8, 2), (16, 1)],
  term ((49817343705886410 : Rat) / 28298395017400811) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24908671852943205 : Rat) / 28298395017400811) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 22. -/
theorem ep_Q2_020_partial_22_0146_valid :
    mulPoly ep_Q2_020_coefficient_22_0146
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0147 : Poly :=
[
  term ((-98518727017089522 : Rat) / 28298395017400811) [(2, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 147 for generator 22. -/
def ep_Q2_020_partial_22_0147 : Poly :=
[
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 2), (14, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (4, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 22. -/
theorem ep_Q2_020_partial_22_0147_valid :
    mulPoly ep_Q2_020_coefficient_22_0147
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0148 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 22. -/
def ep_Q2_020_partial_22_0148 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 22. -/
theorem ep_Q2_020_partial_22_0148_valid :
    mulPoly ep_Q2_020_coefficient_22_0148
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0149 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 22. -/
def ep_Q2_020_partial_22_0149 : Poly :=
[
  term ((742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 22. -/
theorem ep_Q2_020_partial_22_0149_valid :
    mulPoly ep_Q2_020_coefficient_22_0149
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0150 : Poly :=
[
  term ((-70318234713726288 : Rat) / 28298395017400811) [(2, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 150 for generator 22. -/
def ep_Q2_020_partial_22_0150 : Poly :=
[
  term ((-140636469427452576 : Rat) / 28298395017400811) [(2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(2, 1), (6, 1), (8, 2), (14, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(2, 1), (6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 22. -/
theorem ep_Q2_020_partial_22_0150_valid :
    mulPoly ep_Q2_020_coefficient_22_0150
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0151 : Poly :=
[
  term ((175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 22. -/
def ep_Q2_020_partial_22_0151 : Poly :=
[
  term ((351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 22. -/
theorem ep_Q2_020_partial_22_0151_valid :
    mulPoly ep_Q2_020_coefficient_22_0151
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0152 : Poly :=
[
  term ((-160218385881654951 : Rat) / 1951613449475918) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 22. -/
def ep_Q2_020_partial_22_0152 : Poly :=
[
  term ((-160218385881654951 : Rat) / 975806724737959) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(2, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 22. -/
theorem ep_Q2_020_partial_22_0152_valid :
    mulPoly ep_Q2_020_coefficient_22_0152
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0153 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 22. -/
def ep_Q2_020_partial_22_0153 : Poly :=
[
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 22. -/
theorem ep_Q2_020_partial_22_0153_valid :
    mulPoly ep_Q2_020_coefficient_22_0153
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0154 : Poly :=
[
  term ((-38975107208850000 : Rat) / 28298395017400811) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 22. -/
def ep_Q2_020_partial_22_0154 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 22. -/
theorem ep_Q2_020_partial_22_0154_valid :
    mulPoly ep_Q2_020_coefficient_22_0154
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0155 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 22. -/
def ep_Q2_020_partial_22_0155 : Poly :=
[
  term ((-690727606191489504 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 22. -/
theorem ep_Q2_020_partial_22_0155_valid :
    mulPoly ep_Q2_020_coefficient_22_0155
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0156 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 156 for generator 22. -/
def ep_Q2_020_partial_22_0156 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(2, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(2, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 22. -/
theorem ep_Q2_020_partial_22_0156_valid :
    mulPoly ep_Q2_020_coefficient_22_0156
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0157 : Poly :=
[
  term ((200042314802096763 : Rat) / 113193580069603244) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 157 for generator 22. -/
def ep_Q2_020_partial_22_0157 : Poly :=
[
  term ((200042314802096763 : Rat) / 56596790034801622) [(2, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 113193580069603244) [(2, 1), (8, 2), (14, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 113193580069603244) [(2, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 22. -/
theorem ep_Q2_020_partial_22_0157_valid :
    mulPoly ep_Q2_020_coefficient_22_0157
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0158 : Poly :=
[
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(2, 1), (14, 2), (16, 1)]
]

/-- Partial product 158 for generator 22. -/
def ep_Q2_020_partial_22_0158 : Poly :=
[
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(2, 1), (8, 2), (14, 2), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(2, 1), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 22. -/
theorem ep_Q2_020_partial_22_0158_valid :
    mulPoly ep_Q2_020_coefficient_22_0158
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0159 : Poly :=
[
  term ((979528844998953843 : Rat) / 56596790034801622) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 22. -/
def ep_Q2_020_partial_22_0159 : Poly :=
[
  term ((979528844998953843 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((979528844998953843 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 22. -/
theorem ep_Q2_020_partial_22_0159_valid :
    mulPoly ep_Q2_020_coefficient_22_0159
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0160 : Poly :=
[
  term ((-98518727017089522 : Rat) / 28298395017400811) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 160 for generator 22. -/
def ep_Q2_020_partial_22_0160 : Poly :=
[
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 22. -/
theorem ep_Q2_020_partial_22_0160_valid :
    mulPoly ep_Q2_020_coefficient_22_0160
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0161 : Poly :=
[
  term ((-34632127805212080 : Rat) / 28298395017400811) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 161 for generator 22. -/
def ep_Q2_020_partial_22_0161 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 22. -/
theorem ep_Q2_020_partial_22_0161_valid :
    mulPoly ep_Q2_020_coefficient_22_0161
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0162 : Poly :=
[
  term ((70318234713726288 : Rat) / 28298395017400811) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 22. -/
def ep_Q2_020_partial_22_0162 : Poly :=
[
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 22. -/
theorem ep_Q2_020_partial_22_0162_valid :
    mulPoly ep_Q2_020_coefficient_22_0162
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0163 : Poly :=
[
  term ((160218385881654951 : Rat) / 1951613449475918) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 163 for generator 22. -/
def ep_Q2_020_partial_22_0163 : Poly :=
[
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 22. -/
theorem ep_Q2_020_partial_22_0163_valid :
    mulPoly ep_Q2_020_coefficient_22_0163
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0164 : Poly :=
[
  term ((38975107208850000 : Rat) / 28298395017400811) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 164 for generator 22. -/
def ep_Q2_020_partial_22_0164 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 22. -/
theorem ep_Q2_020_partial_22_0164_valid :
    mulPoly ep_Q2_020_coefficient_22_0164
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0165 : Poly :=
[
  term ((1040922119979683634 : Rat) / 28298395017400811) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 22. -/
def ep_Q2_020_partial_22_0165 : Poly :=
[
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 22. -/
theorem ep_Q2_020_partial_22_0165_valid :
    mulPoly ep_Q2_020_coefficient_22_0165
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0166 : Poly :=
[
  term ((-200042314802096763 : Rat) / 113193580069603244) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 22. -/
def ep_Q2_020_partial_22_0166 : Poly :=
[
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 113193580069603244) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 113193580069603244) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 22. -/
theorem ep_Q2_020_partial_22_0166_valid :
    mulPoly ep_Q2_020_coefficient_22_0166
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0167 : Poly :=
[
  term ((1788573985166880 : Rat) / 1230365000756557) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 167 for generator 22. -/
def ep_Q2_020_partial_22_0167 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 22. -/
theorem ep_Q2_020_partial_22_0167_valid :
    mulPoly ep_Q2_020_coefficient_22_0167
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0168 : Poly :=
[
  term ((-65895997160953980 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 168 for generator 22. -/
def ep_Q2_020_partial_22_0168 : Poly :=
[
  term ((-131791994321907960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-131791994321907960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 22. -/
theorem ep_Q2_020_partial_22_0168_valid :
    mulPoly ep_Q2_020_coefficient_22_0168
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0169 : Poly :=
[
  term ((38095340585733288 : Rat) / 28298395017400811) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 169 for generator 22. -/
def ep_Q2_020_partial_22_0169 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 22. -/
theorem ep_Q2_020_partial_22_0169_valid :
    mulPoly ep_Q2_020_coefficient_22_0169
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0170 : Poly :=
[
  term ((38287859039580960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 170 for generator 22. -/
def ep_Q2_020_partial_22_0170 : Poly :=
[
  term ((76575718079161920 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((76575718079161920 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 22. -/
theorem ep_Q2_020_partial_22_0170_valid :
    mulPoly ep_Q2_020_coefficient_22_0170
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0171 : Poly :=
[
  term ((-329258237930485200 : Rat) / 28298395017400811) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 22. -/
def ep_Q2_020_partial_22_0171 : Poly :=
[
  term ((-658516475860970400 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((329258237930485200 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-658516475860970400 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((329258237930485200 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 22. -/
theorem ep_Q2_020_partial_22_0171_valid :
    mulPoly ep_Q2_020_coefficient_22_0171
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0172 : Poly :=
[
  term ((-20915713023415236 : Rat) / 28298395017400811) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 172 for generator 22. -/
def ep_Q2_020_partial_22_0172 : Poly :=
[
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 22. -/
theorem ep_Q2_020_partial_22_0172_valid :
    mulPoly ep_Q2_020_coefficient_22_0172
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0173 : Poly :=
[
  term ((302715943302526902 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 173 for generator 22. -/
def ep_Q2_020_partial_22_0173 : Poly :=
[
  term ((605431886605053804 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-302715943302526902 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((605431886605053804 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (10, 1), (16, 1)],
  term ((-302715943302526902 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 22. -/
theorem ep_Q2_020_partial_22_0173_valid :
    mulPoly ep_Q2_020_coefficient_22_0173
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0174 : Poly :=
[
  term ((124047034888747959 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)]
]

/-- Partial product 174 for generator 22. -/
def ep_Q2_020_partial_22_0174 : Poly :=
[
  term ((248094069777495918 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-124047034888747959 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (12, 1), (16, 1)],
  term ((248094069777495918 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-124047034888747959 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 22. -/
theorem ep_Q2_020_partial_22_0174_valid :
    mulPoly ep_Q2_020_coefficient_22_0174
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0175 : Poly :=
[
  term ((-227959153775206764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 175 for generator 22. -/
def ep_Q2_020_partial_22_0175 : Poly :=
[
  term ((-455918307550413528 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((227959153775206764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (14, 1), (16, 1)],
  term ((-455918307550413528 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((227959153775206764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 22. -/
theorem ep_Q2_020_partial_22_0175_valid :
    mulPoly ep_Q2_020_coefficient_22_0175
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0176 : Poly :=
[
  term ((-62763359037177675 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 176 for generator 22. -/
def ep_Q2_020_partial_22_0176 : Poly :=
[
  term ((-125526718074355350 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((62763359037177675 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (16, 1)],
  term ((-125526718074355350 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((62763359037177675 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 22. -/
theorem ep_Q2_020_partial_22_0176_valid :
    mulPoly ep_Q2_020_coefficient_22_0176
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0177 : Poly :=
[
  term ((-158512997472474447 : Rat) / 28298395017400811) [(4, 1), (6, 2), (16, 1)]
]

/-- Partial product 177 for generator 22. -/
def ep_Q2_020_partial_22_0177 : Poly :=
[
  term ((-317025994944948894 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((158512997472474447 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 2), (16, 1)],
  term ((-317025994944948894 : Rat) / 28298395017400811) [(4, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((158512997472474447 : Rat) / 28298395017400811) [(4, 1), (6, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 22. -/
theorem ep_Q2_020_partial_22_0177_valid :
    mulPoly ep_Q2_020_coefficient_22_0177
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0178 : Poly :=
[
  term ((44058318351685236 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 178 for generator 22. -/
def ep_Q2_020_partial_22_0178 : Poly :=
[
  term ((88116636703370472 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-44058318351685236 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((88116636703370472 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-44058318351685236 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 22. -/
theorem ep_Q2_020_partial_22_0178_valid :
    mulPoly ep_Q2_020_coefficient_22_0178
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0179 : Poly :=
[
  term ((133241015712815280 : Rat) / 28298395017400811) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 179 for generator 22. -/
def ep_Q2_020_partial_22_0179 : Poly :=
[
  term ((266482031425630560 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-133241015712815280 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 2), (13, 1), (16, 1)],
  term ((266482031425630560 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-133241015712815280 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 22. -/
theorem ep_Q2_020_partial_22_0179_valid :
    mulPoly ep_Q2_020_coefficient_22_0179
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0180 : Poly :=
[
  term ((-67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 22. -/
def ep_Q2_020_partial_22_0180 : Poly :=
[
  term ((-135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 22. -/
theorem ep_Q2_020_partial_22_0180_valid :
    mulPoly ep_Q2_020_coefficient_22_0180
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0181 : Poly :=
[
  term ((-25893061542424656 : Rat) / 28298395017400811) [(4, 1), (7, 2), (16, 1)]
]

/-- Partial product 181 for generator 22. -/
def ep_Q2_020_partial_22_0181 : Poly :=
[
  term ((-51786123084849312 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((25893061542424656 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 2), (16, 1)],
  term ((-51786123084849312 : Rat) / 28298395017400811) [(4, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((25893061542424656 : Rat) / 28298395017400811) [(4, 1), (7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 22. -/
theorem ep_Q2_020_partial_22_0181_valid :
    mulPoly ep_Q2_020_coefficient_22_0181
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0182 : Poly :=
[
  term ((-6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 182 for generator 22. -/
def ep_Q2_020_partial_22_0182 : Poly :=
[
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 22. -/
theorem ep_Q2_020_partial_22_0182_valid :
    mulPoly ep_Q2_020_coefficient_22_0182
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0183 : Poly :=
[
  term ((34767788399118432 : Rat) / 28298395017400811) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 183 for generator 22. -/
def ep_Q2_020_partial_22_0183 : Poly :=
[
  term ((69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 1), (8, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 22. -/
theorem ep_Q2_020_partial_22_0183_valid :
    mulPoly ep_Q2_020_coefficient_22_0183
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0184 : Poly :=
[
  term ((-44058318351685236 : Rat) / 28298395017400811) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 184 for generator 22. -/
def ep_Q2_020_partial_22_0184 : Poly :=
[
  term ((-88116636703370472 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((44058318351685236 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 2), (16, 1)],
  term ((-88116636703370472 : Rat) / 28298395017400811) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((44058318351685236 : Rat) / 28298395017400811) [(4, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 22. -/
theorem ep_Q2_020_partial_22_0184_valid :
    mulPoly ep_Q2_020_coefficient_22_0184
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0185 : Poly :=
[
  term ((-42872617929735000 : Rat) / 28298395017400811) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 185 for generator 22. -/
def ep_Q2_020_partial_22_0185 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(4, 1), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 22. -/
theorem ep_Q2_020_partial_22_0185_valid :
    mulPoly ep_Q2_020_coefficient_22_0185
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0186 : Poly :=
[
  term ((-4736835034217437707 : Rat) / 56596790034801622) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 22. -/
def ep_Q2_020_partial_22_0186 : Poly :=
[
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(4, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(4, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 22. -/
theorem ep_Q2_020_partial_22_0186_valid :
    mulPoly ep_Q2_020_coefficient_22_0186
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0187 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 22. -/
def ep_Q2_020_partial_22_0187 : Poly :=
[
  term ((3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 22. -/
theorem ep_Q2_020_partial_22_0187_valid :
    mulPoly ep_Q2_020_coefficient_22_0187
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0188 : Poly :=
[
  term ((-439103854368324000 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 188 for generator 22. -/
def ep_Q2_020_partial_22_0188 : Poly :=
[
  term ((-878207708736648000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((439103854368324000 : Rat) / 28298395017400811) [(4, 1), (8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-878207708736648000 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((439103854368324000 : Rat) / 28298395017400811) [(4, 1), (9, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 22. -/
theorem ep_Q2_020_partial_22_0188_valid :
    mulPoly ep_Q2_020_coefficient_22_0188
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0189 : Poly :=
[
  term ((257568300956322621 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 189 for generator 22. -/
def ep_Q2_020_partial_22_0189 : Poly :=
[
  term ((515136601912645242 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-257568300956322621 : Rat) / 28298395017400811) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((515136601912645242 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-257568300956322621 : Rat) / 28298395017400811) [(4, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 22. -/
theorem ep_Q2_020_partial_22_0189_valid :
    mulPoly ep_Q2_020_coefficient_22_0189
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0190 : Poly :=
[
  term ((284433477180534099 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)]
]

/-- Partial product 190 for generator 22. -/
def ep_Q2_020_partial_22_0190 : Poly :=
[
  term ((568866954361068198 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (8, 2), (12, 2), (16, 1)],
  term ((568866954361068198 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 22. -/
theorem ep_Q2_020_partial_22_0190_valid :
    mulPoly ep_Q2_020_coefficient_22_0190
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0191 : Poly :=
[
  term ((-198629544449555706 : Rat) / 28298395017400811) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 22. -/
def ep_Q2_020_partial_22_0191 : Poly :=
[
  term ((-397259088899111412 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((198629544449555706 : Rat) / 28298395017400811) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-397259088899111412 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((198629544449555706 : Rat) / 28298395017400811) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 22. -/
theorem ep_Q2_020_partial_22_0191_valid :
    mulPoly ep_Q2_020_coefficient_22_0191
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0192 : Poly :=
[
  term ((142619560426416987 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 192 for generator 22. -/
def ep_Q2_020_partial_22_0192 : Poly :=
[
  term ((285239120852833974 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-142619560426416987 : Rat) / 28298395017400811) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((285239120852833974 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-142619560426416987 : Rat) / 28298395017400811) [(4, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 22. -/
theorem ep_Q2_020_partial_22_0192_valid :
    mulPoly ep_Q2_020_coefficient_22_0192
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0193 : Poly :=
[
  term ((1040887720042885617 : Rat) / 56596790034801622) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 193 for generator 22. -/
def ep_Q2_020_partial_22_0193 : Poly :=
[
  term ((1040887720042885617 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1040887720042885617 : Rat) / 56596790034801622) [(4, 1), (8, 2), (14, 1), (16, 1)],
  term ((1040887720042885617 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1040887720042885617 : Rat) / 56596790034801622) [(4, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 22. -/
theorem ep_Q2_020_partial_22_0193_valid :
    mulPoly ep_Q2_020_coefficient_22_0193
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0194 : Poly :=
[
  term ((-927157536662295093 : Rat) / 28298395017400811) [(4, 1), (14, 2), (16, 1)]
]

/-- Partial product 194 for generator 22. -/
def ep_Q2_020_partial_22_0194 : Poly :=
[
  term ((-1854315073324590186 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((927157536662295093 : Rat) / 28298395017400811) [(4, 1), (8, 2), (14, 2), (16, 1)],
  term ((-1854315073324590186 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((927157536662295093 : Rat) / 28298395017400811) [(4, 1), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 22. -/
theorem ep_Q2_020_partial_22_0194_valid :
    mulPoly ep_Q2_020_coefficient_22_0194
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0195 : Poly :=
[
  term ((-813771733814413731 : Rat) / 28298395017400811) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 195 for generator 22. -/
def ep_Q2_020_partial_22_0195 : Poly :=
[
  term ((-1627543467628827462 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((813771733814413731 : Rat) / 28298395017400811) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((-1627543467628827462 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((813771733814413731 : Rat) / 28298395017400811) [(4, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 22. -/
theorem ep_Q2_020_partial_22_0195_valid :
    mulPoly ep_Q2_020_coefficient_22_0195
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0196 : Poly :=
[
  term ((-306294038320649022 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 196 for generator 22. -/
def ep_Q2_020_partial_22_0196 : Poly :=
[
  term ((-612588076641298044 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((306294038320649022 : Rat) / 28298395017400811) [(4, 1), (8, 2), (16, 1)],
  term ((-612588076641298044 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((306294038320649022 : Rat) / 28298395017400811) [(4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 22. -/
theorem ep_Q2_020_partial_22_0196_valid :
    mulPoly ep_Q2_020_coefficient_22_0196
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0197 : Poly :=
[
  term ((-38054246449687146 : Rat) / 28298395017400811) [(4, 2), (6, 1), (16, 1)]
]

/-- Partial product 197 for generator 22. -/
def ep_Q2_020_partial_22_0197 : Poly :=
[
  term ((-76108492899374292 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((38054246449687146 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 2), (16, 1)],
  term ((-76108492899374292 : Rat) / 28298395017400811) [(4, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((38054246449687146 : Rat) / 28298395017400811) [(4, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 22. -/
theorem ep_Q2_020_partial_22_0197_valid :
    mulPoly ep_Q2_020_coefficient_22_0197
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0198 : Poly :=
[
  term ((-17383894199559216 : Rat) / 28298395017400811) [(4, 2), (8, 1), (16, 1)]
]

/-- Partial product 198 for generator 22. -/
def ep_Q2_020_partial_22_0198 : Poly :=
[
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 2), (8, 1), (9, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 2), (10, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 22. -/
theorem ep_Q2_020_partial_22_0198_valid :
    mulPoly ep_Q2_020_coefficient_22_0198
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 22. -/
def ep_Q2_020_coefficient_22_0199 : Poly :=
[
  term ((157557906733472238 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)]
]

/-- Partial product 199 for generator 22. -/
def ep_Q2_020_partial_22_0199 : Poly :=
[
  term ((315115813466944476 : Rat) / 28298395017400811) [(4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-157557906733472238 : Rat) / 28298395017400811) [(4, 2), (8, 2), (12, 1), (16, 1)],
  term ((315115813466944476 : Rat) / 28298395017400811) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-157557906733472238 : Rat) / 28298395017400811) [(4, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 22. -/
theorem ep_Q2_020_partial_22_0199_valid :
    mulPoly ep_Q2_020_coefficient_22_0199
        ep_Q2_020_generator_22_0100_0199 =
      ep_Q2_020_partial_22_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_22_0100_0199 : List Poly :=
[
  ep_Q2_020_partial_22_0100,
  ep_Q2_020_partial_22_0101,
  ep_Q2_020_partial_22_0102,
  ep_Q2_020_partial_22_0103,
  ep_Q2_020_partial_22_0104,
  ep_Q2_020_partial_22_0105,
  ep_Q2_020_partial_22_0106,
  ep_Q2_020_partial_22_0107,
  ep_Q2_020_partial_22_0108,
  ep_Q2_020_partial_22_0109,
  ep_Q2_020_partial_22_0110,
  ep_Q2_020_partial_22_0111,
  ep_Q2_020_partial_22_0112,
  ep_Q2_020_partial_22_0113,
  ep_Q2_020_partial_22_0114,
  ep_Q2_020_partial_22_0115,
  ep_Q2_020_partial_22_0116,
  ep_Q2_020_partial_22_0117,
  ep_Q2_020_partial_22_0118,
  ep_Q2_020_partial_22_0119,
  ep_Q2_020_partial_22_0120,
  ep_Q2_020_partial_22_0121,
  ep_Q2_020_partial_22_0122,
  ep_Q2_020_partial_22_0123,
  ep_Q2_020_partial_22_0124,
  ep_Q2_020_partial_22_0125,
  ep_Q2_020_partial_22_0126,
  ep_Q2_020_partial_22_0127,
  ep_Q2_020_partial_22_0128,
  ep_Q2_020_partial_22_0129,
  ep_Q2_020_partial_22_0130,
  ep_Q2_020_partial_22_0131,
  ep_Q2_020_partial_22_0132,
  ep_Q2_020_partial_22_0133,
  ep_Q2_020_partial_22_0134,
  ep_Q2_020_partial_22_0135,
  ep_Q2_020_partial_22_0136,
  ep_Q2_020_partial_22_0137,
  ep_Q2_020_partial_22_0138,
  ep_Q2_020_partial_22_0139,
  ep_Q2_020_partial_22_0140,
  ep_Q2_020_partial_22_0141,
  ep_Q2_020_partial_22_0142,
  ep_Q2_020_partial_22_0143,
  ep_Q2_020_partial_22_0144,
  ep_Q2_020_partial_22_0145,
  ep_Q2_020_partial_22_0146,
  ep_Q2_020_partial_22_0147,
  ep_Q2_020_partial_22_0148,
  ep_Q2_020_partial_22_0149,
  ep_Q2_020_partial_22_0150,
  ep_Q2_020_partial_22_0151,
  ep_Q2_020_partial_22_0152,
  ep_Q2_020_partial_22_0153,
  ep_Q2_020_partial_22_0154,
  ep_Q2_020_partial_22_0155,
  ep_Q2_020_partial_22_0156,
  ep_Q2_020_partial_22_0157,
  ep_Q2_020_partial_22_0158,
  ep_Q2_020_partial_22_0159,
  ep_Q2_020_partial_22_0160,
  ep_Q2_020_partial_22_0161,
  ep_Q2_020_partial_22_0162,
  ep_Q2_020_partial_22_0163,
  ep_Q2_020_partial_22_0164,
  ep_Q2_020_partial_22_0165,
  ep_Q2_020_partial_22_0166,
  ep_Q2_020_partial_22_0167,
  ep_Q2_020_partial_22_0168,
  ep_Q2_020_partial_22_0169,
  ep_Q2_020_partial_22_0170,
  ep_Q2_020_partial_22_0171,
  ep_Q2_020_partial_22_0172,
  ep_Q2_020_partial_22_0173,
  ep_Q2_020_partial_22_0174,
  ep_Q2_020_partial_22_0175,
  ep_Q2_020_partial_22_0176,
  ep_Q2_020_partial_22_0177,
  ep_Q2_020_partial_22_0178,
  ep_Q2_020_partial_22_0179,
  ep_Q2_020_partial_22_0180,
  ep_Q2_020_partial_22_0181,
  ep_Q2_020_partial_22_0182,
  ep_Q2_020_partial_22_0183,
  ep_Q2_020_partial_22_0184,
  ep_Q2_020_partial_22_0185,
  ep_Q2_020_partial_22_0186,
  ep_Q2_020_partial_22_0187,
  ep_Q2_020_partial_22_0188,
  ep_Q2_020_partial_22_0189,
  ep_Q2_020_partial_22_0190,
  ep_Q2_020_partial_22_0191,
  ep_Q2_020_partial_22_0192,
  ep_Q2_020_partial_22_0193,
  ep_Q2_020_partial_22_0194,
  ep_Q2_020_partial_22_0195,
  ep_Q2_020_partial_22_0196,
  ep_Q2_020_partial_22_0197,
  ep_Q2_020_partial_22_0198,
  ep_Q2_020_partial_22_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_22_0100_0199 : Poly :=
[
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4541978495796464619 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-190481590714211856 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2511967020741573510 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((58088615272246878 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4541978495796464619 : Rat) / 56596790034801622) [(1, 1), (5, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((95240795357105928 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1255983510370786755 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((-29044307636123439 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((-3463212780521208 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 3), (16, 1)],
  term ((-190481590714211856 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2511967020741573510 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((58088615272246878 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((4541978495796464619 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4541978495796464619 : Rat) / 56596790034801622) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((95240795357105928 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1255983510370786755 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-29044307636123439 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 2), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 2), (15, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-123969710739120462 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-304005077627368212 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((102539394587811960 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((61984855369560231 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((152002538813684106 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-51269697293905980 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-536572195550064 : Rat) / 1230365000756557) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((102539394587811960 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-304005077627368212 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((28032828074563644 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-51269697293905980 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-536572195550064 : Rat) / 1230365000756557) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((61984855369560231 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 3), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((191137955310745782 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-95568977655372891 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((19246119400311858 : Rat) / 975806724737959) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (9, 2), (16, 1)],
  term ((191137955310745782 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((-9623059700155929 : Rat) / 975806724737959) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((-95568977655372891 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 3), (16, 1)],
  term ((-251866722920750568 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((19246119400311858 : Rat) / 975806724737959) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((125933361460375284 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-9623059700155929 : Rat) / 975806724737959) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-143920051601621256 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 4), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 2), (9, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 3), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((88957992767669712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-14276371641582534 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96753014209439712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((40821523111832738 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-20410761555916369 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((48376507104719856 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-913288136681903515 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((118610657023559616 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((110429470425075000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-118890263337938379 : Rat) / 3903226898951836) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((5067626291306160 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090650392308255911 : Rat) / 56596790034801622) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((7138185820791267 : Rat) / 28298395017400811) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((40821523111832738 : Rat) / 28298395017400811) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96753014209439712 : Rat) / 28298395017400811) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((913288136681903515 : Rat) / 56596790034801622) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-55214735212537500 : Rat) / 28298395017400811) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((118890263337938379 : Rat) / 7806453797903672) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-2533813145653080 : Rat) / 1230365000756557) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((1090650392308255911 : Rat) / 113193580069603244) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-20410761555916369 : Rat) / 28298395017400811) [(1, 1), (8, 3), (11, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 3), (13, 1), (14, 1), (16, 1)],
  term ((48376507104719856 : Rat) / 28298395017400811) [(1, 1), (8, 3), (13, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 3), (14, 1), (15, 1), (16, 1)],
  term ((178857398516688 : Rat) / 1230365000756557) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((118610657023559616 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((110429470425075000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-118890263337938379 : Rat) / 3903226898951836) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((5067626291306160 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090650392308255911 : Rat) / 56596790034801622) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-913288136681903515 : Rat) / 28298395017400811) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((74131660639724760 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((884735393398738447 : Rat) / 56596790034801622) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-55214735212537500 : Rat) / 28298395017400811) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((118890263337938379 : Rat) / 7806453797903672) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2533813145653080 : Rat) / 1230365000756557) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1090650392308255911 : Rat) / 113193580069603244) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-7795021441770000 : Rat) / 28298395017400811) [(1, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-357714797033376 : Rat) / 1230365000756557) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (9, 3), (12, 1), (16, 1)],
  term ((7138185820791267 : Rat) / 28298395017400811) [(1, 1), (9, 3), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (8, 2), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 2), (2, 1), (9, 2), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (8, 2), (16, 1)],
  term ((510668315089865496 : Rat) / 28298395017400811) [(1, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 2), (4, 1), (9, 2), (16, 1)],
  term ((49817343705886410 : Rat) / 28298395017400811) [(1, 2), (8, 1), (10, 1), (16, 1)],
  term ((-24908671852943205 : Rat) / 28298395017400811) [(1, 2), (8, 2), (16, 1)],
  term ((49817343705886410 : Rat) / 28298395017400811) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24908671852943205 : Rat) / 28298395017400811) [(1, 2), (9, 2), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (4, 1), (8, 2), (14, 1), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(2, 1), (4, 1), (9, 2), (14, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(2, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(2, 1), (6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(2, 1), (6, 1), (8, 2), (14, 1), (16, 1)],
  term ((-140636469427452576 : Rat) / 28298395017400811) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((70318234713726288 : Rat) / 28298395017400811) [(2, 1), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((351051911287072128 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-175525955643536064 : Rat) / 28298395017400811) [(2, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(2, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(2, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(2, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((979528844998953843 : Rat) / 28298395017400811) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(2, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(2, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 113193580069603244) [(2, 1), (8, 2), (14, 1), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(2, 1), (8, 2), (14, 2), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((979528844998953843 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 1951613449475918) [(2, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((38975107208850000 : Rat) / 28298395017400811) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(2, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 113193580069603244) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term ((1040922119979683634 : Rat) / 28298395017400811) [(2, 1), (9, 2), (14, 2), (16, 1)],
  term ((-979528844998953843 : Rat) / 56596790034801622) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((-197037454034179044 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((98518727017089522 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((34632127805212080 : Rat) / 28298395017400811) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((140636469427452576 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70318234713726288 : Rat) / 28298395017400811) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 113193580069603244) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-160218385881654951 : Rat) / 1951613449475918) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-38975107208850000 : Rat) / 28298395017400811) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1040922119979683634 : Rat) / 28298395017400811) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 113193580069603244) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1788573985166880 : Rat) / 1230365000756557) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((-131791994321907960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-131791994321907960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((65895997160953980 : Rat) / 28298395017400811) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((76575718079161920 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-658516475860970400 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((329258237930485200 : Rat) / 28298395017400811) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((76575718079161920 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-658516475860970400 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-38287859039580960 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((329258237930485200 : Rat) / 28298395017400811) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 1), (5, 2), (8, 2), (16, 1)],
  term ((-41831426046830472 : Rat) / 28298395017400811) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((20915713023415236 : Rat) / 28298395017400811) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((605431886605053804 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-302715943302526902 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((248094069777495918 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-455918307550413528 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-125526718074355350 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((605431886605053804 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (10, 1), (16, 1)],
  term ((-124047034888747959 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (12, 1), (16, 1)],
  term ((227959153775206764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (14, 1), (16, 1)],
  term ((62763359037177675 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 2), (16, 1)],
  term ((-302715943302526902 : Rat) / 28298395017400811) [(4, 1), (6, 1), (8, 3), (16, 1)],
  term ((248094069777495918 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-455918307550413528 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-125526718074355350 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-124047034888747959 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((227959153775206764 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((62763359037177675 : Rat) / 28298395017400811) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((-317025994944948894 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 1), (10, 1), (16, 1)],
  term ((158512997472474447 : Rat) / 28298395017400811) [(4, 1), (6, 2), (8, 2), (16, 1)],
  term ((-317025994944948894 : Rat) / 28298395017400811) [(4, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((158512997472474447 : Rat) / 28298395017400811) [(4, 1), (6, 2), (9, 2), (16, 1)],
  term ((88116636703370472 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((266482031425630560 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-44058318351685236 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-133241015712815280 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 2), (13, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((266482031425630560 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((88116636703370472 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-133241015712815280 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-44058318351685236 : Rat) / 28298395017400811) [(4, 1), (7, 1), (9, 3), (16, 1)],
  term ((-51786123084849312 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((25893061542424656 : Rat) / 28298395017400811) [(4, 1), (7, 2), (8, 2), (16, 1)],
  term ((-51786123084849312 : Rat) / 28298395017400811) [(4, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((25893061542424656 : Rat) / 28298395017400811) [(4, 1), (7, 2), (9, 2), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-88116636703370472 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((44058318351685236 : Rat) / 28298395017400811) [(4, 1), (8, 1), (9, 2), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-878207708736648000 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((515136601912645242 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((568866954361068198 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((-397259088899111412 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((285239120852833974 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((1040887720042885617 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1854315073324590186 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1627543467628827462 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-612588076641298044 : Rat) / 28298395017400811) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((69535576798236864 : Rat) / 28298395017400811) [(4, 1), (8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-88116636703370472 : Rat) / 28298395017400811) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(4, 1), (8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(4, 1), (8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((439103854368324000 : Rat) / 28298395017400811) [(4, 1), (8, 2), (12, 1), (14, 1), (16, 1)],
  term ((-257568300956322621 : Rat) / 28298395017400811) [(4, 1), (8, 2), (12, 1), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (8, 2), (12, 2), (16, 1)],
  term ((198629544449555706 : Rat) / 28298395017400811) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142619560426416987 : Rat) / 28298395017400811) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((-1040887720042885617 : Rat) / 56596790034801622) [(4, 1), (8, 2), (14, 1), (16, 1)],
  term ((927157536662295093 : Rat) / 28298395017400811) [(4, 1), (8, 2), (14, 2), (16, 1)],
  term ((813771733814413731 : Rat) / 28298395017400811) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((306294038320649022 : Rat) / 28298395017400811) [(4, 1), (8, 2), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 3), (12, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 1), (8, 3), (14, 1), (16, 1)],
  term ((44058318351685236 : Rat) / 28298395017400811) [(4, 1), (8, 3), (16, 1)],
  term ((-878207708736648000 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((515136601912645242 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((568866954361068198 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-397259088899111412 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((285239120852833974 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1040887720042885617 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1854315073324590186 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1627543467628827462 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-612588076641298044 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4736835034217437707 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(4, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(4, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4736835034217437707 : Rat) / 56596790034801622) [(4, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((439103854368324000 : Rat) / 28298395017400811) [(4, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-257568300956322621 : Rat) / 28298395017400811) [(4, 1), (9, 2), (12, 1), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (9, 2), (12, 2), (16, 1)],
  term ((198629544449555706 : Rat) / 28298395017400811) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142619560426416987 : Rat) / 28298395017400811) [(4, 1), (9, 2), (13, 2), (16, 1)],
  term ((-1040887720042885617 : Rat) / 56596790034801622) [(4, 1), (9, 2), (14, 1), (16, 1)],
  term ((927157536662295093 : Rat) / 28298395017400811) [(4, 1), (9, 2), (14, 2), (16, 1)],
  term ((813771733814413731 : Rat) / 28298395017400811) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((306294038320649022 : Rat) / 28298395017400811) [(4, 1), (9, 2), (16, 1)],
  term ((-76108492899374292 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 1), (10, 1), (16, 1)],
  term ((38054246449687146 : Rat) / 28298395017400811) [(4, 2), (6, 1), (8, 2), (16, 1)],
  term ((-76108492899374292 : Rat) / 28298395017400811) [(4, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((38054246449687146 : Rat) / 28298395017400811) [(4, 2), (6, 1), (9, 2), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 2), (8, 1), (9, 2), (16, 1)],
  term ((315115813466944476 : Rat) / 28298395017400811) [(4, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-34767788399118432 : Rat) / 28298395017400811) [(4, 2), (8, 2), (10, 1), (16, 1)],
  term ((-157557906733472238 : Rat) / 28298395017400811) [(4, 2), (8, 2), (12, 1), (16, 1)],
  term ((17383894199559216 : Rat) / 28298395017400811) [(4, 2), (8, 3), (16, 1)],
  term ((315115813466944476 : Rat) / 28298395017400811) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-157557906733472238 : Rat) / 28298395017400811) [(4, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 100 through 199. -/
theorem ep_Q2_020_block_22_0100_0199_valid :
    checkProductSumEq ep_Q2_020_partials_22_0100_0199
      ep_Q2_020_block_22_0100_0199 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
